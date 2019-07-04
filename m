Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F545F3A8
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 09:26:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 018E16E2A5;
	Thu,  4 Jul 2019 07:25:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BAE06E241
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 02:35:46 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id t132so2140037pgb.9
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jul 2019 19:35:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=nXTmk+pxDZGbrpmbWYwCZvMXWZKHwPkgM46QtmxM/i8=;
 b=glzQSvW6Jxf0FGTx3z2U9ElZPfBSPweISK3xlsPlGJYmLQOUwXP4VLwBqc9Ku89KHp
 Y4Iin0XNwHH0gDRBQARgcAA4nFPJiOM6eXy3gw4Yc86XV9CyRKNFVGI0ZBw9iHYNR+4x
 5rNVHblp8+vsbsUMT52DZnOV6XcU1hYIUesjmpOkyVO/8O+tnqfAwNFmck+g6rcr03ly
 V1SIZhbNQEZZ0+5zBMgsJOEF4I1AVLkUbVR5m3WuoDfiMxLkb9tNdRmm9Cqlj0n+zc/d
 lYef0JNoUj4fUqipt5mbKbK1HuTjZG2aXbbk+TyJ6+pPhjGZ3HoukilGjlSt1IbE7wTW
 9FSg==
X-Gm-Message-State: APjAAAVCY7BTnlNv4P2o8NVXqrBY7vyKSvl4BAeqScTakXSVYcG8Sucb
 nnHo/cNdfbEsqysy/R6QTMY=
X-Google-Smtp-Source: APXvYqwhSeJvwMwPkanmGKWfOj1GnT7T88Rpk3rP16X1l5uBpm5SOtUz1DniCqkcur/49sEn0+h7Tw==
X-Received: by 2002:a17:90a:a09:: with SMTP id
 o9mr16504796pjo.95.1562207745651; 
 Wed, 03 Jul 2019 19:35:45 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.googlemail.com with ESMTPSA id y68sm3715500pfy.164.2019.07.03.19.35.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Jul 2019 19:35:45 -0700 (PDT)
From: Fuqian Huang <huangfq.daxian@gmail.com>
To: 
Subject: [Patch v2 01/10] drm/exynos: using dev_get_drvdata directly
Date: Thu,  4 Jul 2019 10:34:36 +0800
Message-Id: <20190704023436.4456-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
X-Mailman-Approved-At: Thu, 04 Jul 2019 07:25:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=nXTmk+pxDZGbrpmbWYwCZvMXWZKHwPkgM46QtmxM/i8=;
 b=WnIDVSNyFN+GFsu8DtLMgP1OsUuRcgcaIdWOIZtK3QToQE396D3VbYxv2O9LJU8wrx
 wsa95FllqQ0c4hUs2NKqBQob5D+7UbsUtGWtxeizU8MaQAT5cSJHwbyeQ5tIS5RKljXH
 O4v1+nazHVba494UkGKurdi5JV1XV/scsmsw3C+Jim0B5gfAvFXtRn6wJuIKP+w+7+iq
 XsA02FqL7QfjMtgWch+KcYCakNjHnX6wdIj30NGyhh9/zl6WAmVBu4funKKKMeDDrGXF
 KJHPV9X+tbBKUb/1EoXCWK292IEU41XbsDiTjH8TUIWIrNxz1VZI7G8N0WP/GIsK/r6Z
 T31A==
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
Cc: linux-samsung-soc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 dri-devel@lists.freedesktop.org, Fuqian Huang <huangfq.daxian@gmail.com>,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2V2ZXJhbCBkcml2ZXJzIGNhc3QgYSBzdHJ1Y3QgZGV2aWNlIHBvaW50ZXIgdG8gYSBzdHJ1Y3QK
cGxhdGZvcm1fZGV2aWNlIHBvaW50ZXIgb25seSB0byB0aGVuIGNhbGwgcGxhdGZvcm1fZ2V0X2Ry
dmRhdGEoKS4KVG8gaW1wcm92ZSByZWFkYWJpbGl0eSwgdGhlc2UgY29uc3RydWN0cyBjYW4gYmUg
c2ltcGxpZmllZApieSB1c2luZyBkZXZfZ2V0X2RydmRhdGEoKSBkaXJlY3RseS4KClNpZ25lZC1v
ZmYtYnk6IEZ1cWlhbiBIdWFuZyA8aHVhbmdmcS5kYXhpYW5AZ21haWwuY29tPgotLS0KQ2hhbmdl
cyBpbiB2MjoKICAtIE1ha2UgdGhlIGNvbW1pdCBtZXNzYWdlIG1vcmUgY2xlYXJseS4KCiBkcml2
ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZmltYy5jIHwgMiArLQogZHJpdmVycy9ncHUv
ZHJtL2V4eW5vcy9leHlub3NfZHJtX2dzYy5jICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9leHlub3MvZXh5bm9zX2RybV9maW1jLmMgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5v
c19kcm1fZmltYy5jCmluZGV4IDBkYjI5NjkwZWRlMy4uYzc5ZWFmYzk0NTdlIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZmltYy5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9maW1jLmMKQEAgLTQzLDcgKzQzLDcgQEAgc3RhdGlj
IHVuc2lnbmVkIGludCBmaW1jX21hc2sgPSAweGM7CiBtb2R1bGVfcGFyYW1fbmFtZWQoZmltY19k
ZXZzLCBmaW1jX21hc2ssIHVpbnQsIDA2NDQpOwogTU9EVUxFX1BBUk1fREVTQyhmaW1jX2RldnMs
ICJBbGlhcyBtYXNrIGZvciBhc3NpZ25pbmcgRklNQyBkZXZpY2VzIHRvIEV4eW5vcyBEUk0iKTsK
IAotI2RlZmluZSBnZXRfZmltY19jb250ZXh0KGRldikJcGxhdGZvcm1fZ2V0X2RydmRhdGEodG9f
cGxhdGZvcm1fZGV2aWNlKGRldikpCisjZGVmaW5lIGdldF9maW1jX2NvbnRleHQoZGV2KQlkZXZf
Z2V0X2RydmRhdGEoZGV2KQogCiBlbnVtIHsKIAlGSU1DX0NMS19MQ0xLLApkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2dzYy5jIGIvZHJpdmVycy9ncHUvZHJt
L2V4eW5vcy9leHlub3NfZHJtX2dzYy5jCmluZGV4IDA1YjBmZTIxYjgxZS4uNjM5OWQ4OWMzZjlm
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZ3NjLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2dzYy5jCkBAIC01Nyw3ICs1Nyw3
IEBACiAjZGVmaW5lIEdTQ19DT0VGX0RFUFRICTMKICNkZWZpbmUgR1NDX0FVVE9TVVNQRU5EX0RF
TEFZCQkyMDAwCiAKLSNkZWZpbmUgZ2V0X2dzY19jb250ZXh0KGRldikJcGxhdGZvcm1fZ2V0X2Ry
dmRhdGEodG9fcGxhdGZvcm1fZGV2aWNlKGRldikpCisjZGVmaW5lIGdldF9nc2NfY29udGV4dChk
ZXYpCWRldl9nZXRfZHJ2ZGF0YShkZXYpCiAjZGVmaW5lIGdzY19yZWFkKG9mZnNldCkJCXJlYWRs
KGN0eC0+cmVncyArIChvZmZzZXQpKQogI2RlZmluZSBnc2Nfd3JpdGUoY2ZnLCBvZmZzZXQpCXdy
aXRlbChjZmcsIGN0eC0+cmVncyArIChvZmZzZXQpKQogCi0tIAoyLjExLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
