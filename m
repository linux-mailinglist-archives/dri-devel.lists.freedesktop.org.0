Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D9F100070
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 09:37:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9557489F2A;
	Mon, 18 Nov 2019 08:36:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4552989ED6
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 02:48:05 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id r4so9609264pfl.7
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Nov 2019 18:48:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3kl5ahZw2sQnevip0m9byS4aFaaYYEpVFO0JkWfU568=;
 b=TNwTM18c0DyeI6oqiuStXhDPqzeFDc5vdhGdxFoDhIW5D/H5d1qlNZcQANKttXrpVA
 mI1+5Gg/yRO7jkcnG8+32cq/R6LdJhUOwDrbUJx48CrTTSbk6z9zbMoWGO1TY0E9lsHc
 F32QtsshW+DS18n3NPVNpkH26rGqtDF2whmXJh7Onm1NTMteOZqYNqj58o8vQsD6NVko
 +jDnc4uCnQ177CioWE9V5BE5ECebUpNXDEB+VtyliCYiLmr4O5X6LMePJS9KgsMruYt1
 uMygqolBI8cVGW2rgxJoRmr/neEOlCB8hv5tYzbYw93PS7rhApH3sIfr2BjoojiTYrtM
 QBMg==
X-Gm-Message-State: APjAAAVs1Fq4wYwCLRkAwhtpWNgKf25wKO+KnCi4bW4CgbAWN1JBwP4t
 hxrMBxKyacKVgBoWssCbHRI=
X-Google-Smtp-Source: APXvYqzOYITC4AQD4cll3vg5byNRwh0UT/CFOt1LAEbVB3s0Yr8Kp1aA98musXirXMhUJX8saTflKQ==
X-Received: by 2002:a62:7643:: with SMTP id r64mr30020700pfc.191.1574045284995; 
 Sun, 17 Nov 2019 18:48:04 -0800 (PST)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.gmail.com with ESMTPSA id r16sm15576124pgl.77.2019.11.17.18.48.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Nov 2019 18:48:04 -0800 (PST)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Subject: [PATCH] drm/v3d: add missed pm_runtime_disable
Date: Mon, 18 Nov 2019 10:47:55 +0800
Message-Id: <20191118024755.21456-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 18 Nov 2019 08:36:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3kl5ahZw2sQnevip0m9byS4aFaaYYEpVFO0JkWfU568=;
 b=tub8CI3C2kZF7VVfdEZdXWUm8Dt6YYRt0JM2LJ9MVDoSYCQ7LSblnmcfTyOsaR+qGW
 h8JhSZ1pG97f9SiDEf/aiJXeni+wSrKf4hl371gAT1eEdthYNLPeJ98HkQjsFIp1FUU4
 RcjXEPXWFyZg0LvuhJV5AcB8xVfB8qv0jj9xR8A8Jtk6F79yHorUhwlWKHSB3sFErJLq
 r7MP4nPkmgTKQgzksGYYBeUZVnCiqS0IHcqdSAVGlZ1s/QATv6gdp3+lkE/cV7YlvIyM
 aVoF91H0071Idd+txdFXk/z/n245IoNWUSHFHoSylBTKDZKBXLNEFBu76uTntAUv47la
 B35w==
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

VGhlIGRyaXZlciBmb3JnZXRzIHRvIGNhbGwgcG1fcnVudGltZV9kaXNhYmxlIGluIHByb2JlIGZh
aWx1cmUKYW5kIHJlbW92ZS4KQWRkIHRoZSBtaXNzZWQgY2FsbHMgdG8gZml4IGl0LgoKU2lnbmVk
LW9mZi1ieTogQ2h1aG9uZyBZdWFuIDxoc2xlc3Rlcjk2QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vdjNkL3YzZF9kcnYuYyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3YzZC92M2RfZHJ2LmMgYi9kcml2
ZXJzL2dwdS9kcm0vdjNkL3YzZF9kcnYuYwppbmRleCAzNTA2YWUyNzIzYWUuLmUxMDliYjhjZDY3
ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3YzZC92M2RfZHJ2LmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3YzZC92M2RfZHJ2LmMKQEAgLTMzMyw2ICszMzMsNyBAQCBzdGF0aWMgaW50IHYz
ZF9wbGF0Zm9ybV9kcm1fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIGRldl9k
ZXN0cm95OgogCWRybV9kZXZfcHV0KGRybSk7CiBkbWFfZnJlZToKKwlwbV9ydW50aW1lX2Rpc2Fi
bGUoZGV2KTsKIAlkbWFfZnJlZV93YyhkZXYsIDQwOTYsIHYzZC0+bW11X3NjcmF0Y2gsIHYzZC0+
bW11X3NjcmF0Y2hfcGFkZHIpOwogZGV2X2ZyZWU6CiAJa2ZyZWUodjNkKTsKQEAgLTM1MCw2ICsz
NTEsOCBAQCBzdGF0aWMgaW50IHYzZF9wbGF0Zm9ybV9kcm1fcmVtb3ZlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpCiAKIAlkcm1fZGV2X3B1dChkcm0pOwogCisJcG1fcnVudGltZV9kaXNh
YmxlKHYzZC0+ZGV2KTsKKwogCWRtYV9mcmVlX3djKHYzZC0+ZGV2LCA0MDk2LCB2M2QtPm1tdV9z
Y3JhdGNoLCB2M2QtPm1tdV9zY3JhdGNoX3BhZGRyKTsKIAogCXJldHVybiAwOwotLSAKMi4yNC4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
