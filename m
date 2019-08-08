Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C90F865E8
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 17:35:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D2726E87F;
	Thu,  8 Aug 2019 15:35:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB5D06E87F
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 15:35:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D92C560171;
 Thu,  8 Aug 2019 15:35:01 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-144.ams2.redhat.com
 [10.36.116.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F4A1600C8;
 Thu,  8 Aug 2019 15:34:59 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 341EB16E08; Thu,  8 Aug 2019 17:34:58 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/virtio: use virtio_max_dma_size
Date: Thu,  8 Aug 2019 17:34:45 +0200
Message-Id: <20190808153445.27177-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Thu, 08 Aug 2019 15:35:01 +0000 (UTC)
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UgbXVzdCBtYWtlIHN1cmUgb3VyIHNjYXR0ZXJsaXN0IHNlZ21lbnRzIGFyZSBub3QgdG9vIGJp
Zywgb3RoZXJ3aXNlCndlIG1pZ2h0IHNlZSBzd2lvdGxiIGZhaWx1cmVzIChoYXBwZW5zIHdpdGgg
c2V2LCBhbHNvIHJlcHJvZHVjYWJsZSB3aXRoCnN3aW90bGI9Zm9yY2UpLgoKU2lnbmVkLW9mZi1i
eTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L3ZpcnRpby92aXJ0Z3B1X29iamVjdC5jIHwgMTAgKysrKysrKystLQogMSBmaWxlIGNoYW5nZWQs
IDggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vdmlydGlvL3ZpcnRncHVfb2JqZWN0LmMgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3Zp
cnRncHVfb2JqZWN0LmMKaW5kZXggYjJkYTMxMzEwZDI0Li42ZTQ0NTY4ODEzZGQgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9vYmplY3QuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfb2JqZWN0LmMKQEAgLTIwNCw2ICsyMDQsNyBAQCBpbnQg
dmlydGlvX2dwdV9vYmplY3RfZ2V0X3NnX3RhYmxlKHN0cnVjdCB2aXJ0aW9fZ3B1X2RldmljZSAq
cWRldiwKIAkJLmludGVycnVwdGlibGUgPSBmYWxzZSwKIAkJLm5vX3dhaXRfZ3B1ID0gZmFsc2UK
IAl9OworCXVuc2lnbmVkIG1heF9zZWdtZW50OwogCiAJLyogd3RmIHN3YXBwaW5nICovCiAJaWYg
KGJvLT5wYWdlcykKQEAgLTIxNSw4ICsyMTYsMTMgQEAgaW50IHZpcnRpb19ncHVfb2JqZWN0X2dl
dF9zZ190YWJsZShzdHJ1Y3QgdmlydGlvX2dwdV9kZXZpY2UgKnFkZXYsCiAJaWYgKCFiby0+cGFn
ZXMpCiAJCWdvdG8gb3V0OwogCi0JcmV0ID0gc2dfYWxsb2NfdGFibGVfZnJvbV9wYWdlcyhiby0+
cGFnZXMsIHBhZ2VzLCBucl9wYWdlcywgMCwKLQkJCQkJbnJfcGFnZXMgPDwgUEFHRV9TSElGVCwg
R0ZQX0tFUk5FTCk7CisJbWF4X3NlZ21lbnQgPSB2aXJ0aW9fbWF4X2RtYV9zaXplKHFkZXYtPnZk
ZXYpOworCW1heF9zZWdtZW50ICY9IH4oc2l6ZV90KShQQUdFX1NJWkUgLSAxKTsKKwlpZiAobWF4
X3NlZ21lbnQgPiBTQ0FUVEVSTElTVF9NQVhfU0VHTUVOVCkKKwkJbWF4X3NlZ21lbnQgPSBTQ0FU
VEVSTElTVF9NQVhfU0VHTUVOVDsKKwlyZXQgPSBfX3NnX2FsbG9jX3RhYmxlX2Zyb21fcGFnZXMo
Ym8tPnBhZ2VzLCBwYWdlcywgbnJfcGFnZXMsIDAsCisJCQkJCSAgbnJfcGFnZXMgPDwgUEFHRV9T
SElGVCwKKwkJCQkJICBtYXhfc2VnbWVudCwgR0ZQX0tFUk5FTCk7CiAJaWYgKHJldCkKIAkJZ290
byBvdXQ7CiAJcmV0dXJuIDA7Ci0tIAoyLjE4LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
