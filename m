Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A54D7C02
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 18:39:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2252C6E87B;
	Tue, 15 Oct 2019 16:38:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9B9B88F1B
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 14:05:31 +0000 (UTC)
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1iKNRx-00048s-07; Tue, 15 Oct 2019 15:05:21 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
 (envelope-from <ben@rainbowdash.codethink.co.uk>)
 id 1iKNRw-00052K-IV; Tue, 15 Oct 2019 15:05:20 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-kernel@lists.codethink.co.uk
Subject: [PATCH] drm: include <drm/drm_fb_cma_helper.h> for missing
 declarations
Date: Tue, 15 Oct 2019 15:05:19 +0100
Message-Id: <20191015140519.19317-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 15 Oct 2019 16:38:12 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Ben Dooks <ben.dooks@codethink.co.uk>, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW5jbHVkZSA8ZHJtL2RybV9mYl9jbWFfaGVscGVyLmg+IHRvIGdldCB0aGUgZGVmaW5pdGlvbnMg
b2YKZHJtX2ZiX2NtYV9nZXRfZ2VtX3thZGRyLG9ian0gZnVuY3Rpb25zIHRvIGZpeCB0aGUgZm9s
bG93aW5nCnNwYXJzZSB3YXJuaW5nczoKCmRyaXZlcnMvZ3B1L2RybS9kcm1fZmJfY21hX2hlbHBl
ci5jOjM4OjI3OiB3YXJuaW5nOiBzeW1ib2wgJ2RybV9mYl9jbWFfZ2V0X2dlbV9vYmonIHdhcyBu
b3QgZGVjbGFyZWQuIFNob3VsZCBpdCBiZSBzdGF0aWM/CmRyaXZlcnMvZ3B1L2RybS9kcm1fZmJf
Y21hX2hlbHBlci5jOjYyOjEyOiB3YXJuaW5nOiBzeW1ib2wgJ2RybV9mYl9jbWFfZ2V0X2dlbV9h
ZGRyJyB3YXMgbm90IGRlY2xhcmVkLiBTaG91bGQgaXQgYmUgc3RhdGljPwoKU2lnbmVkLW9mZi1i
eTogQmVuIERvb2tzIDxiZW4uZG9va3NAY29kZXRoaW5rLmNvLnVrPgotLS0KQ2M6IE1hYXJ0ZW4g
TGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+CkNjOiBNYXhpbWUg
UmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+CkNjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1
bj4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIg
PGRhbmllbEBmZndsbC5jaD4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6
IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2Zi
X2NtYV9oZWxwZXIuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9jbWFfaGVscGVyLmMgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX2ZiX2NtYV9oZWxwZXIuYwppbmRleCBjMGIwZjYwM2FmNjMuLmY0OTY3Y2YxNGY5
OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9jbWFfaGVscGVyLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9mYl9jbWFfaGVscGVyLmMKQEAgLTExLDYgKzExLDcgQEAKIAog
I2luY2x1ZGUgPGRybS9kcm1fZm91cmNjLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9mcmFtZWJ1ZmZl
ci5oPgorI2luY2x1ZGUgPGRybS9kcm1fZmJfY21hX2hlbHBlci5oPgogI2luY2x1ZGUgPGRybS9k
cm1fZ2VtX2NtYV9oZWxwZXIuaD4KICNpbmNsdWRlIDxkcm0vZHJtX2dlbV9mcmFtZWJ1ZmZlcl9o
ZWxwZXIuaD4KICNpbmNsdWRlIDxkcm0vZHJtX3BsYW5lLmg+Ci0tIAoyLjIzLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
