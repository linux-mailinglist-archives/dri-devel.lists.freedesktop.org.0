Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B80D2135
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 08:55:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A6DD6EA9C;
	Thu, 10 Oct 2019 06:55:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72D6E6E93C
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 09:38:54 +0000 (UTC)
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1iI8Qm-00017c-3X; Wed, 09 Oct 2019 10:38:52 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
 (envelope-from <ben@rainbowdash.codethink.co.uk>)
 id 1iI8Ql-0002KY-Ng; Wed, 09 Oct 2019 10:38:51 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/fb-helper: include drm/drm_fb_cma_helper.h for
 missing declarations
Date: Wed,  9 Oct 2019 10:38:49 +0100
Message-Id: <20191009093850.8911-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 10 Oct 2019 06:55:07 +0000
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org, mripard@kernel.org,
 Ben Dooks <ben.dooks@codethink.co.uk>, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW5jbHVkZSA8ZHJtL2RybV9mYl9jbWFfaGVscGVyLmg+IHRvIGZpeCB0aGUgZm9sbG93aW5nIHdh
cm5pbmdzCmZyb20gbWlzc2luZyBkZWNsYXJhdGlvbnM6Cgpkcml2ZXJzL2dwdS9kcm0vZHJtX2Zi
X2NtYV9oZWxwZXIuYzozODoyNzogd2FybmluZzogc3ltYm9sICdkcm1fZmJfY21hX2dldF9nZW1f
b2JqJyB3YXMgbm90IGRlY2xhcmVkLiBTaG91bGQgaXQgYmUgc3RhdGljPwpkcml2ZXJzL2dwdS9k
cm0vZHJtX2ZiX2NtYV9oZWxwZXIuYzo2MjoxMjogd2FybmluZzogc3ltYm9sICdkcm1fZmJfY21h
X2dldF9nZW1fYWRkcicgd2FzIG5vdCBkZWNsYXJlZC4gU2hvdWxkIGl0IGJlIHN0YXRpYz8KClNp
Z25lZC1vZmYtYnk6IEJlbiBEb29rcyA8YmVuLmRvb2tzQGNvZGV0aGluay5jby51az4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5j
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYwppbmRleCBhN2JhNWI0OTAyZDYuLjIz
ZTEwMDc1NjE5ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jCkBAIC00NSw2ICs0NSw3IEBACiAj
aW5jbHVkZSA8ZHJtL2RybV9mb3VyY2MuaD4KICNpbmNsdWRlIDxkcm0vZHJtX3ByaW50Lmg+CiAj
aW5jbHVkZSA8ZHJtL2RybV92YmxhbmsuaD4KKyNpbmNsdWRlIDxkcm0vZHJtX2ZiX2NtYV9oZWxw
ZXIuaD4KIAogI2luY2x1ZGUgImRybV9pbnRlcm5hbC5oIgogCi0tIAoyLjIzLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
