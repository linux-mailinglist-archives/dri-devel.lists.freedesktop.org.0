Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F24E436FC9A
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 16:40:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E572A6F546;
	Fri, 30 Apr 2021 14:40:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0901A6F543
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 14:40:07 +0000 (UTC)
Date: Fri, 30 Apr 2021 14:40:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1619793604;
 bh=fSLec87iegryPgjrOUODvz2OysQjnjA+xnQ6m8z4xd8=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=KmFbHHyAyWluF5+3MnNA0uf7I9YQNEePPKXHRDy09W16ucEG+W8IFcXDV69wPF7g0
 RUupRh2t6sqi4QHffmTi4+DdVNfOAJFXBmYM7n26FVp2pI79gDwmeoiuAWQg5Lx0Na
 2x86lJFp1CPHab9NMmFtPDaR4B6CP9f3ieMxeOZQjLgusvn5rms5iXXm+8rUNwmNdr
 /5Z58n48ppFjP6JLoaHpqJUZbKv/NwBxNwxe3D7OsJngLxGs+bUnPfDeRFtAHn3FVT
 EfK3N2ToHOjzHPBN/9VKYzYSaZW2yXzUi8UK4TZ4dexnXjiN3HCn+OWkkvXNPqVdvq
 Z+kS6xUL2H8Gg==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH] drm: log errors in drm_gem_fb_init_with_funcs
Message-ID: <R359hIfrDhyN2VBgiSyQ1ogbifYmn7KwIuMUqS3u3A@cp4-web-032.plabs.ch>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?utf-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGV0IHRoZSB1c2VyIGtub3cgd2hhdCB3ZW50IHdyb25nIGluIGRybV9nZW1fZmJfaW5pdF93aXRo
X2Z1bmNzCmZhaWx1cmUgcGF0aHMuCgpTaWduZWQtb2ZmLWJ5OiBTaW1vbiBTZXIgPGNvbnRhY3RA
ZW1lcnNpb24uZnI+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpD
YzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpDYzogTm9yYWxmIFRyw7hubmVzIDxu
b3JhbGZAdHJvbm5lcy5vcmc+CkNjOiBBbmRyemVqIFBpZXRyYXNpZXdpY3ogPGFuZHJ6ZWoucEBj
b2xsYWJvcmEuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX2ZyYW1lYnVmZmVyX2hl
bHBlci5jIHwgNyArKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fZnJhbWVidWZm
ZXJfaGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9mcmFtZWJ1ZmZlcl9oZWxwZXIu
YwppbmRleCAxMDlkMTFmYjRjZDQuLmU0YTNjN2ViNDNiMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2RybV9nZW1fZnJhbWVidWZmZXJfaGVscGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2RybV9nZW1fZnJhbWVidWZmZXJfaGVscGVyLmMKQEAgLTE1NSw4ICsxNTUsMTAgQEAgaW50IGRy
bV9nZW1fZmJfaW5pdF93aXRoX2Z1bmNzKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCiAJaW50IHJl
dCwgaTsKIAogCWluZm8gPSBkcm1fZ2V0X2Zvcm1hdF9pbmZvKGRldiwgbW9kZV9jbWQpOwotCWlm
ICghaW5mbykKKwlpZiAoIWluZm8pIHsKKwkJZHJtX2RiZ19rbXMoZGV2LCAiRmFpbGVkIHRvIGdl
dCBGQiBmb3JtYXQgaW5mb1xuIik7CiAJCXJldHVybiAtRUlOVkFMOworCX0KIAogCWZvciAoaSA9
IDA7IGkgPCBpbmZvLT5udW1fcGxhbmVzOyBpKyspIHsKIAkJdW5zaWduZWQgaW50IHdpZHRoID0g
bW9kZV9jbWQtPndpZHRoIC8gKGkgPyBpbmZvLT5oc3ViIDogMSk7CkBAIC0xNzUsNiArMTc3LDkg
QEAgaW50IGRybV9nZW1fZmJfaW5pdF93aXRoX2Z1bmNzKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYs
CiAJCQkgKyBtb2RlX2NtZC0+b2Zmc2V0c1tpXTsKIAogCQlpZiAob2Jqc1tpXS0+c2l6ZSA8IG1p
bl9zaXplKSB7CisJCQlkcm1fZGJnX2ttcyhkZXYsCisJCQkJICAgICJHRU0gb2JqZWN0IHNpemUg
KCV1KSBzbWFsbGVyIHRoYW4gbWluaW11bSBzaXplICgldSkgZm9yIHBsYW5lICVkXG4iLAorCQkJ
CSAgICBvYmpzW2ldLT5zaXplLCBtaW5fc2l6ZSwgaSk7CiAJCQlkcm1fZ2VtX29iamVjdF9wdXQo
b2Jqc1tpXSk7CiAJCQlyZXQgPSAtRUlOVkFMOwogCQkJZ290byBlcnJfZ2VtX29iamVjdF9wdXQ7
Ci0tIAoyLjMxLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
