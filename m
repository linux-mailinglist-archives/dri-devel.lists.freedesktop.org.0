Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7A98DD4E
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 20:47:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 737B56E7D4;
	Wed, 14 Aug 2019 18:47:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26D896E7D4
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 18:47:11 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id k3so5432pgb.10
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 11:47:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=M6EfpO2AmlsI2DOe0XzrU1zVY/mWE6ZPcbT1wLb1NQk=;
 b=q2PnPSfcjemu3YdMP1RqJ/ofXMUN4s9NBd+ZDiYlm/g2u7XYmEk/U3CjbFYPjs7Q4H
 qlbN2/ko+cSj1V++FeND9o/XPDTCBkFqLx8pLzck+QzYfbQFpELkdf6cZu/NP0ner4rP
 93BKk5TA0E1mtADZcWPg8e85FXTgAizNJwUjm5VObFkz8UTs44US8taexa2CUvd6Y4Hc
 NpOAQL2VfRrOOoa8rkYblHy0U3XCVPtdDj+eHM4Mk/qAaomEcca/Io9/QCtwL7BfXhN9
 zRncNwsgSNZVAF3FLt1SkjEQHv7IwfyBZ52QjpFRo0Pu7yNX4+S/S3CdVOqtYqP4E/Ed
 7XDQ==
X-Gm-Message-State: APjAAAVqLOxQzZg8wpcriBwnBB+Yx9UA8gnr82aG0kOUXf2lzArqeKJ8
 GNQZgZOY0CMyV0qewrTptIH4QQ==
X-Google-Smtp-Source: APXvYqxqKGmy32Ujo0BCz2vrCYNtPj3gHXOFQuGtiab1Il7shpRxfNx4/7sGrlW0wTiMl4ACe65hCw==
X-Received: by 2002:a63:6a81:: with SMTP id f123mr510530pgc.348.1565808430529; 
 Wed, 14 Aug 2019 11:47:10 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 y16sm610855pfc.36.2019.08.14.11.47.09
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 14 Aug 2019 11:47:09 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [RESEND][PATCH v3 02/26] drm: kirin: Get rid of drmP.h includes
Date: Wed, 14 Aug 2019 18:46:38 +0000
Message-Id: <20190814184702.54275-3-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190814184702.54275-1-john.stultz@linaro.org>
References: <20190814184702.54275-1-john.stultz@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=M6EfpO2AmlsI2DOe0XzrU1zVY/mWE6ZPcbT1wLb1NQk=;
 b=dA1rYYZ5AQz/pVgpowhEbvOMUR3T44a0HzOlt51pn+il3uCKhZ1XuZxJVRvMqYXO6A
 b5dcW0E4YtrL/peRKgkJQnkP7xE5X9KXNTRi1afVVJahW7vLlwMC8C1QOzps3oURjlxa
 dmvkVbJUVrQLAQr+OB1hx+B55EqNA+vqcy0tBLWMPwhiFX4yZymgd4YUaPYx6ZCJtGtz
 TkxhnKpSPggfA2E1jZLgohFbmEA4X9gfjXuhCvdcUp7rTSLlcc8muLLDNZuTcn0eO6rq
 vy2XzSSUA4+Y6CAiP98bXvrS1uc7oKYDMusQAlRtjhx2oCwTvGU4uijb0AGOZMJfMp8g
 PS5A==
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 Rongrong Zou <zourongrong@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVtb3ZlIHVzZSBvZiBkcm1QLmggaW4ga2lyaW4gZHJpdmVyCgpDYzogUm9uZ3JvbmcgWm91IDx6
b3Vyb25ncm9uZ0BnbWFpbC5jb20+CkNjOiBYaW5saWFuZyBMaXUgPHoubGl1eGlubGlhbmdAaGlz
aWxpY29uLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmll
bCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IGRyaS1kZXZlbCA8ZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZz4KQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KU3Vn
Z2VzdGVkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+ClNpZ25lZC1vZmYtYnk6
IEpvaG4gU3R1bHR6IDxqb2huLnN0dWx0ekBsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJtX2FkZS5jIHwgNiArKysrKy0KIGRyaXZlcnMvZ3B1
L2RybS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJtX2Rydi5jIHwgNCArKystCiAyIGZpbGVzIGNo
YW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL2tpcmluX2RybV9hZGUuYyBiL2RyaXZlcnMvZ3B1
L2RybS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJtX2FkZS5jCmluZGV4IGQ2OWI1ZDQ1ODk1MC4u
OWE5ZTNiNjg4YmEzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmlu
L2tpcmluX2RybV9hZGUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL2tp
cmluX2RybV9hZGUuYwpAQCAtMTcsOCArMTcsMTIgQEAKICNpbmNsdWRlIDxsaW51eC9tZmQvc3lz
Y29uLmg+CiAjaW5jbHVkZSA8bGludXgvcmVnbWFwLmg+CiAjaW5jbHVkZSA8bGludXgvcmVzZXQu
aD4KKyNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KIAotI2luY2x1ZGUgPGRybS9k
cm1QLmg+CisjaW5jbHVkZSA8ZHJtL2RybV92YmxhbmsuaD4KKyNpbmNsdWRlIDxkcm0vZHJtX2Zv
dXJjYy5oPgorI2luY2x1ZGUgPGRybS9kcm1fZGV2aWNlLmg+CisjaW5jbHVkZSA8ZHJtL2RybV9k
cnYuaD4KICNpbmNsdWRlIDxkcm0vZHJtX2F0b21pYy5oPgogI2luY2x1ZGUgPGRybS9kcm1fYXRv
bWljX2hlbHBlci5oPgogI2luY2x1ZGUgPGRybS9kcm1fY3J0Yy5oPgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9raXJpbl9kcm1fZHJ2LmMgYi9kcml2ZXJzL2dw
dS9kcm0vaGlzaWxpY29uL2tpcmluL2tpcmluX2RybV9kcnYuYwppbmRleCA0YTdmZTEwYTM3Y2Iu
LmZiYWI3M2M1ODUxZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJp
bi9raXJpbl9kcm1fZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9r
aXJpbl9kcm1fZHJ2LmMKQEAgLTE0LDggKzE0LDEwIEBACiAjaW5jbHVkZSA8bGludXgvb2ZfcGxh
dGZvcm0uaD4KICNpbmNsdWRlIDxsaW51eC9jb21wb25lbnQuaD4KICNpbmNsdWRlIDxsaW51eC9v
Zl9ncmFwaC5oPgorI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgogCi0jaW5jbHVkZSA8ZHJtL2Ry
bVAuaD4KKyNpbmNsdWRlIDxkcm0vZHJtX3ZibGFuay5oPgorI2luY2x1ZGUgPGRybS9kcm1fZHJ2
Lmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9hdG9taWNfaGVscGVyLmg+CiAjaW5jbHVkZSA8ZHJtL2Ry
bV9mYl9jbWFfaGVscGVyLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9mYl9oZWxwZXIuaD4KLS0gCjIu
MTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
