Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 402D81169FB
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 10:47:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 524E66E372;
	Mon,  9 Dec 2019 09:47:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4763689144
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 08:57:59 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id k25so6768525pgt.7
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2019 00:57:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wJ5N7Jirljd8jLW/XZ0r9Y6/RYhfpOU7K02lJrm8fcM=;
 b=HVqOJrQLytemtxUJ2jliXtK5O0BFXZ9ONMkw2eS21NhSB871zqMygHI7G8LeYhjYvI
 Mvsymv42JWg2li979JxTU2Qv6Aht433q1uMDYnhM5aphSbeK+flTpTouNqcDYDLd1zub
 ZkSr23I++6UDvpIbh+AYcdi8kgMgZNhMS8RALl/q1s864LAmdA4Qd3KympadTDr6eiUr
 wL2o0J3wbqC+b6zwbIxOeFZerqUcnluwVJhlmFb3q7zJh2G1IyRM89GwGWC26JDoBJGG
 RgpbFDG4zfzORbvf3234uDAmUj7CAxzCR+AVbISWlk9jCjjQcdL2ACPvpc2oTrs9KA/T
 nQyQ==
X-Gm-Message-State: APjAAAUUgvci7zxogqaBKBGkyPoQBOLUh0ALT/iQit+CHrrSoEVAeyaQ
 598qh4MnqIZKd4xKlgmdKNd0Cg6JTzc=
X-Google-Smtp-Source: APXvYqxd0SLOgya+bYBtfx1iTPjygnm9SV9Zl27E66O0G+xP4k1tbXOpBXnX4FXOFh4aSizzxJonSQ==
X-Received: by 2002:aa7:961b:: with SMTP id q27mr28498150pfg.23.1575881879038; 
 Mon, 09 Dec 2019 00:57:59 -0800 (PST)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.gmail.com with ESMTPSA id o17sm3474228pjq.1.2019.12.09.00.57.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2019 00:57:58 -0800 (PST)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Subject: [PATCH] drm/gma500: add a missed gma_power_end in error path
Date: Mon,  9 Dec 2019 16:57:47 +0800
Message-Id: <20191209085747.16057-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 09 Dec 2019 09:46:36 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wJ5N7Jirljd8jLW/XZ0r9Y6/RYhfpOU7K02lJrm8fcM=;
 b=hyTu61975irxP9bn3UGpHOHL7Qkqq2SiDtYV1LljIZxPR4gjdO3lptLg+X/x+wliZH
 BTJQzbrVJVz4CPFBoTH9tiSABZP0AlTPHR/CeOFh4gJbHRaGrFcpj/a9g5tUVCY8eBa7
 ZMPetM3GCqq86RyqQINuYvmXgs5QsApn6Wnly7dRViLvYYhZ0s9jZGOKYylPiZBf0ecA
 jWzM9moE/+x5LC3WPSap+UFuO7FjcLm3Ic8mplwUZ3J9XGmunxAKzRsigc62QIb1V9Pz
 y4pUa4wKyQ6Fw6Uel00Qnr03YCGa57TfCGk4aoHrSh4NlBvzNt3ndGZP1OQRocZBrfNy
 i/Pw==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: David Airlie <airlied@linux.ie>, Chuhong Yuan <hslester96@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

b2FrdHJhaWxfbHZkc19tb2RlX3NldCgpIG1pc3NlcyBhIGdtYV9wb3dlcl9lbmQoKSBpbiBhbiBl
cnJvciBwYXRoLgpBZGQgdGhlIGNhbGwgdG8gZml4IGl0LgoKU2lnbmVkLW9mZi1ieTogQ2h1aG9u
ZyBZdWFuIDxoc2xlc3Rlcjk2QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZ21hNTAw
L29ha3RyYWlsX2x2ZHMuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9vYWt0cmFpbF9sdmRzLmMgYi9kcml2
ZXJzL2dwdS9kcm0vZ21hNTAwL29ha3RyYWlsX2x2ZHMuYwppbmRleCA3MzkwNDAzZWExYjcuLjU4
MmUwOTU5NzUwMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9vYWt0cmFpbF9s
dmRzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9vYWt0cmFpbF9sdmRzLmMKQEAgLTEx
Nyw2ICsxMTcsNyBAQCBzdGF0aWMgdm9pZCBvYWt0cmFpbF9sdmRzX21vZGVfc2V0KHN0cnVjdCBk
cm1fZW5jb2RlciAqZW5jb2RlciwKIAogCWlmICghY29ubmVjdG9yKSB7CiAJCURSTV9FUlJPUigi
Q291bGRuJ3QgZmluZCBjb25uZWN0b3Igd2hlbiBzZXR0aW5nIG1vZGUiKTsKKwkJZ21hX3Bvd2Vy
X2VuZChkZXYpOwogCQlyZXR1cm47CiAJfQogCi0tIAoyLjI0LjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
