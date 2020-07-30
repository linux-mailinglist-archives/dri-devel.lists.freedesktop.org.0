Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE22232F1C
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 11:00:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95DD16E8A3;
	Thu, 30 Jul 2020 09:00:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1BFD6E89D
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 09:00:31 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id g19so13376387ejc.9
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 02:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=4xxz54hplALhKSQmQlylwopI+GwyLuPfRulMRPINmpA=;
 b=CVxMf0KZnBWia2tUcseqp9RaM4HO256FWd6/OM0xccZ+PD1AbAffH/3Y53xv3QY3lq
 r/YNDeaMuPrvFhxDak1bfunlZe06+QB/KwBIkRP+V8A9oc2U5lt34bDScmItVp1aftfO
 6AzJbUpAMQ7wNXQruD0FFZo6fvNCtxd+7m7EJ3d5Ey5gJkNpYj+KhJ7zcDdD7wuS6dlN
 OHO9GzQAqS5yEV9tVvJgUWnLj5FoU09aFpi/nALsOChjn76UeMs7Z8Q3FbiR0OkSPtcH
 zpujylK6llJKFSSJ1z+u6bH/UxN6Nz0WPURHmC1ilB6WbM174XxEGhI+qTmVdm/Rg9zh
 CUJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4xxz54hplALhKSQmQlylwopI+GwyLuPfRulMRPINmpA=;
 b=K4YWh9GEU0EhlJ6YbY8EP4I076ctanVifjKBuIE1X28VJmve5ERHZg40LxvRgcKif8
 m4/eFTrNZOTJnE26F2GrPxo6/nWNdMYp8ZqAwUtyw/XOx6MtwxSnyygV5OnW2EzPYi0G
 1f3K3nvClTg+apB1yn1T0O4PXpaw2M4fPkuHCp99RBSX/p6RocYAJsO61PGLvZ0cwP4w
 jZgObFX+xZ/rUcwZbVHNi5w+9tE+2SfFDE5SLCI0rkYPWTJcbaVQMR8ddgUQEE1WJZ3T
 KW8WxIcbMflPpTwLT/30yZarrbuAOcu0KOLfp9z6unSwcW1bReoXBlfFDJoup942QV2V
 fubw==
X-Gm-Message-State: AOAM533jJmRtRT8WX14N6DLCZu1eEmCo3nfjNpgCwPEuj3FA84/9wR0O
 aUWG0ScPlSr/kE1RR47KKQj2Qdyq
X-Google-Smtp-Source: ABdhPJy2Opy+Vsh8YFn2LC6Gbc1WifhmIRatqc9/DpvmxoE5NB6X2VmxbsZcvpEyVitgLDzy0eFcAw==
X-Received: by 2002:a17:907:20db:: with SMTP id
 qq27mr1685676ejb.550.1596099630263; 
 Thu, 30 Jul 2020 02:00:30 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:cb71:127d:d8c4:4acb])
 by smtp.gmail.com with ESMTPSA id j24sm4968238ejv.32.2020.07.30.02.00.29
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jul 2020 02:00:29 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 8/9] drm/vram-helper: stop implementing init_mem_type
Date: Thu, 30 Jul 2020 11:00:14 +0200
Message-Id: <20200730090015.17295-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200730090015.17295-1-christian.koenig@amd.com>
References: <20200730090015.17295-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW5zdGVhZCBqdXN0IGluaXRpYWxpemUgdGhlIG1lbW9yeSB0eXBlIHBhcmFtZXRlcnMKYmVmb3Jl
IGNhbGxpbmcgdHRtX2JvX2luaXRfbW0uCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmln
IDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+ClJldmlld2VkLWJ5OiBUaG9tYXMgWmltbWVybWFu
biA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFu
ZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hl
bHBlci5jIHwgMTYgKysrKy0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKSwgMTIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9n
ZW1fdnJhbV9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMK
aW5kZXggODAxYTE0YzZlOWUwLi5mN2Y5M2E0OWNkN2YgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1f
dnJhbV9oZWxwZXIuYwpAQCAtMTAwNywxOCArMTAwNyw2IEBAIHN0YXRpYyBzdHJ1Y3QgdHRtX3R0
ICpib19kcml2ZXJfdHRtX3R0X2NyZWF0ZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAog
c3RhdGljIGludCBib19kcml2ZXJfaW5pdF9tZW1fdHlwZShzdHJ1Y3QgdHRtX2JvX2RldmljZSAq
YmRldiwgdWludDMyX3QgdHlwZSwKIAkJCQkgICBzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIg
Km1hbikKIHsKLQlzd2l0Y2ggKHR5cGUpIHsKLQljYXNlIFRUTV9QTF9TWVNURU06Ci0JCWJyZWFr
OwotCWNhc2UgVFRNX1BMX1ZSQU06Ci0JCW1hbi0+ZnVuYyA9ICZ0dG1fYm9fbWFuYWdlcl9mdW5j
OwotCQltYW4tPmF2YWlsYWJsZV9jYWNoaW5nID0gVFRNX1BMX0ZMQUdfVU5DQUNIRUQgfAotCQkJ
CQkgVFRNX1BMX0ZMQUdfV0M7Ci0JCW1hbi0+ZGVmYXVsdF9jYWNoaW5nID0gVFRNX1BMX0ZMQUdf
V0M7Ci0JCWJyZWFrOwotCWRlZmF1bHQ6Ci0JCXJldHVybiAtRUlOVkFMOwotCX0KIAlyZXR1cm4g
MDsKIH0KIApAQCAtMTEyNiw2ICsxMTE0LDcgQEAgRVhQT1JUX1NZTUJPTChkcm1fdnJhbV9tbV9k
ZWJ1Z2ZzX2luaXQpOwogc3RhdGljIGludCBkcm1fdnJhbV9tbV9pbml0KHN0cnVjdCBkcm1fdnJh
bV9tbSAqdm1tLCBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCQkJICAgIHVpbnQ2NF90IHZyYW1f
YmFzZSwgc2l6ZV90IHZyYW1fc2l6ZSkKIHsKKwlzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIg
Km1hbiA9ICZ2bW0tPmJkZXYubWFuW1RUTV9QTF9WUkFNXTsKIAlpbnQgcmV0OwogCiAJdm1tLT52
cmFtX2Jhc2UgPSB2cmFtX2Jhc2U7CkBAIC0xMTM4LDYgKzExMjcsOSBAQCBzdGF0aWMgaW50IGRy
bV92cmFtX21tX2luaXQoc3RydWN0IGRybV92cmFtX21tICp2bW0sIHN0cnVjdCBkcm1fZGV2aWNl
ICpkZXYsCiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKIAorCW1hbi0+ZnVuYyA9ICZ0dG1fYm9f
bWFuYWdlcl9mdW5jOworCW1hbi0+YXZhaWxhYmxlX2NhY2hpbmcgPSBUVE1fUExfRkxBR19VTkNB
Q0hFRCB8IFRUTV9QTF9GTEFHX1dDOworCW1hbi0+ZGVmYXVsdF9jYWNoaW5nID0gVFRNX1BMX0ZM
QUdfV0M7CiAJcmV0ID0gdHRtX2JvX2luaXRfbW0oJnZtbS0+YmRldiwgVFRNX1BMX1ZSQU0sIHZy
YW1fc2l6ZSA+PiBQQUdFX1NISUZUKTsKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwotLSAKMi4x
Ny4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
