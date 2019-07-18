Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE2D6D1B5
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 18:15:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51BC06E448;
	Thu, 18 Jul 2019 16:15:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC3066E43F;
 Thu, 18 Jul 2019 16:15:38 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id c9so19605039lfh.4;
 Thu, 18 Jul 2019 09:15:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=UMsHXLcffq4kVBGwbAWt4MyCInwVzwfnZOh0ymiPKms=;
 b=K9HdKg+Jz6s1XXig0bnP1Dru64g9LSaIYctQsVX3EM/Nn9oBFdluXxzcTmz4tCxqjZ
 2kw3mT7ttFbixdY/3DfcSTctHwuuTo8C/mf4DubZdkZIsKv1BFbsJfvQ99d997LT0WgY
 YmzsKmyG+/AyvCct8p1UZQ5pCfI/xOsmx2DCN9ixaewn1Ti6jQ5qrjnHsPjwlKdW/Qdi
 vOPQdmMje+ffBpSm8khZw+KRihPgw6lliB35+ozq7J/OVtTDu2m7WB0nh3Fp4qqXJQJI
 GH4LfGYG7bUEGRVEIUxbsn15PMwkAevTSgWvBxW2+zSOpQ1mD5101NkD2P4hxWn6AnZ7
 r/hw==
X-Gm-Message-State: APjAAAVJSkIxVhx1/cFQU9cy0AtYE5tBsNk39MobjpeR5DygXz587H7N
 rJW3Vj9x3MM1pToqib2j4tcXu/XDSpx3uw==
X-Google-Smtp-Source: APXvYqwKEyV/QURAB6l1p/PHUoaF3m5z/KSDHpTQLYRIw8SpxKMs5YpxVSZB62m5FHY1r6kO+3s/fQ==
X-Received: by 2002:ac2:51ab:: with SMTP id f11mr8745888lfk.55.1563466536490; 
 Thu, 18 Jul 2019 09:15:36 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 d21sm4057995lfc.73.2019.07.18.09.15.35
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 18 Jul 2019 09:15:36 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v1 08/11] drm: direct include of drm.h in drm_prime.c
Date: Thu, 18 Jul 2019 18:15:04 +0200
Message-Id: <20190718161507.2047-9-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190718161507.2047-1-sam@ravnborg.org>
References: <20190718161507.2047-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UMsHXLcffq4kVBGwbAWt4MyCInwVzwfnZOh0ymiPKms=;
 b=EonVsOPgtzdjOmu2KTHYu6tyqRmy1CssTiTEJ6xcS0g0zslbXsaHVrlLUZkbSwX10q
 A4hMc7QAaF7jvVQnW9PJ814v5wKMd7WQ598kCF7ofKnIb592UuQL31JF64vkxFp4A5Zh
 Ofh46skvrJJDW3WCLReJoAfP0M5vJ4iofO9Mn21638S3ul/OREU9EydPh/5jATMne+JT
 syIQ3W2U2Ko7AWDujzxl2ZwOYG4ProQeFYyWvZQx71rpyQYHC4y29pDL1en08l8LTgXF
 eOU9XfPybRSU5bMM2rVzWuxPo185Q+3Gv/RkRW4Aoz2fSy0+/PQUlAYuZnC0SypdAMA6
 d9RQ==
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
Cc: David Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Thierry Reding <treding@nvidia.com>, Jani Nikula <jani.nikula@intel.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Boris Brezillon <bbrezillon@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RG8gbm90IHJlbHkgb24gaW5jbHVkaW5nIGRybS5oIGZyb20gZHJtX2ZpbGUuaCwKYXMgdGhlIGlu
Y2x1ZGUgaW4gZHJtX2ZpbGUuaCB3aWxsIGJlIGRyb3BwZWQuCgpTaWduZWQtb2ZmLWJ5OiBTYW0g
UmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CkNjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRl
bi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgpDYzogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJp
cGFyZEBib290bGluLmNvbT4KQ2M6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgpDYzogRGF2
aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZm
d2xsLmNoPgpDYzogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpD
YzogTm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+CkNjOiBDaHJpcyBXaWxzb24g
PGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KQ2M6IEVyaWMgQW5ob2x0IDxlcmljQGFuaG9sdC5u
ZXQ+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9wcmltZS5jIHwgMSArCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1l
LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMKaW5kZXggMTg5ZDk4MDQwMmFkLi5lY2E0
ODQxMDZjYzIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMKQEAgLTMwLDYgKzMwLDcgQEAKICNpbmNsdWRlIDxs
aW51eC9kbWEtYnVmLmg+CiAjaW5jbHVkZSA8bGludXgvcmJ0cmVlLmg+CiAKKyNpbmNsdWRlIDxk
cm0vZHJtLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9kcnYuaD4KICNpbmNsdWRlIDxkcm0vZHJtX2Zp
bGUuaD4KICNpbmNsdWRlIDxkcm0vZHJtX2ZyYW1lYnVmZmVyLmg+Ci0tIAoyLjIwLjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
