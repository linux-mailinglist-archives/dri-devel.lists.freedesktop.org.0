Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A15F929C66
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 18:35:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2672A6E12B;
	Fri, 24 May 2019 16:35:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57FEE6E126;
 Fri, 24 May 2019 16:35:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E5FA730C0DD8;
 Fri, 24 May 2019 16:35:21 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-47.ams2.redhat.com
 [10.36.112.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 063DF68725;
 Fri, 24 May 2019 16:35:19 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Daniel Vetter <daniel.vetter@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH resend for CI] drm/i915/dsi: Call drm_connector_cleanup on
 vlv_dsi_init error exit path
Date: Fri, 24 May 2019 18:35:18 +0200
Message-Id: <20190524163518.17545-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Fri, 24 May 2019 16:35:22 +0000 (UTC)
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWYgd2UgZXhpdCB2bHZfZHNpX2luaXQoKSBiZWNhdXNlIHdlIGZhaWxlZCB0byBmaW5kIGEgZml4
ZWRfbW9kZSwgdGhlbgp3ZSd2ZSBhbHJlYWR5IGNhbGxlZCBkcm1fY29ubmVjdG9yX2luaXQoKSBh
bmQgd2Ugc2hvdWxkIGNhbGwKZHJtX2Nvbm5lY3Rvcl9jbGVhbnVwKCkgdG8gdW5yZWdpc3RlciB0
aGUgY29ubmVjdG9yIG9iamVjdC4KClJldmlld2VkLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxl
LnN5cmphbGFAbGludXguaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBIYW5zIGRlIEdvZWRlIDxo
ZGVnb2VkZUByZWRoYXQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L3Zsdl9kc2kuYyB8
IDQgKysrLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L3Zsdl9kc2kuYyBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L3Zsdl9kc2kuYwppbmRleCA3ZWNmZmQ0YjlmNmIuLmZjZThiNThmN2Y5MyAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvdmx2X2RzaS5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L3Zsdl9kc2kuYwpAQCAtMTgxNyw3ICsxODE3LDcgQEAgdm9pZCB2bHZfZHNpX2lu
aXQoc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2KQogCiAJaWYgKCFmaXhlZF9tb2Rl
KSB7CiAJCURSTV9ERUJVR19LTVMoIm5vIGZpeGVkIG1vZGVcbiIpOwotCQlnb3RvIGVycjsKKwkJ
Z290byBlcnJfY2xlYW51cF9jb25uZWN0b3I7CiAJfQogCiAJaW50ZWxfcGFuZWxfaW5pdCgmaW50
ZWxfY29ubmVjdG9yLT5wYW5lbCwgZml4ZWRfbW9kZSwgTlVMTCk7CkBAIC0xODI3LDYgKzE4Mjcs
OCBAQCB2b2lkIHZsdl9kc2lfaW5pdChzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYp
CiAKIAlyZXR1cm47CiAKK2Vycl9jbGVhbnVwX2Nvbm5lY3RvcjoKKwlkcm1fY29ubmVjdG9yX2Ns
ZWFudXAoJmludGVsX2Nvbm5lY3Rvci0+YmFzZSk7CiBlcnI6CiAJZHJtX2VuY29kZXJfY2xlYW51
cCgmaW50ZWxfZW5jb2Rlci0+YmFzZSk7CiAJa2ZyZWUoaW50ZWxfZHNpKTsKLS0gCjIuMjEuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
