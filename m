Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEAE977C6
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 13:12:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCCD56E2C2;
	Wed, 21 Aug 2019 11:12:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 495F06E2C2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 11:12:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C76E0C08EC04;
 Wed, 21 Aug 2019 11:12:40 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-60.ams2.redhat.com
 [10.36.116.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C541679B9;
 Wed, 21 Aug 2019 11:12:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id EB9EA16E1A; Wed, 21 Aug 2019 13:12:36 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5] drm/virtio: use virtio_max_dma_size
Date: Wed, 21 Aug 2019 13:12:09 +0200
Message-Id: <20190821111210.27165-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Wed, 21 Aug 2019 11:12:40 +0000 (UTC)
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
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?L=C3=A1szl=C3=B3=20=C3=89rsek?= <lersek@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UgbXVzdCBtYWtlIHN1cmUgb3VyIHNjYXR0ZXJsaXN0IHNlZ21lbnRzIGFyZSBub3QgdG9vIGJp
Zywgb3RoZXJ3aXNlCndlIG1pZ2h0IHNlZSBzd2lvdGxiIGZhaWx1cmVzIChoYXBwZW5zIHdpdGgg
c2V2LCBhbHNvIHJlcHJvZHVjYWJsZSB3aXRoCnN3aW90bGI9Zm9yY2UpLgoKU3VnZ2VzdGVkLWJ5
OiBMYXN6bG8gRXJzZWsgPGxlcnNla0ByZWRoYXQuY29tPgpTaWduZWQtb2ZmLWJ5OiBHZXJkIEhv
ZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3Zp
cnRncHVfb2JqZWN0LmMgfCAxMCArKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0
aW8vdmlydGdwdV9vYmplY3QuYyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9vYmpl
Y3QuYwppbmRleCBiMmRhMzEzMTBkMjQuLjA5YjUyNjUxOGY1YSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X29iamVjdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92
aXJ0aW8vdmlydGdwdV9vYmplY3QuYwpAQCAtMjA0LDYgKzIwNCw3IEBAIGludCB2aXJ0aW9fZ3B1
X29iamVjdF9nZXRfc2dfdGFibGUoc3RydWN0IHZpcnRpb19ncHVfZGV2aWNlICpxZGV2LAogCQku
aW50ZXJydXB0aWJsZSA9IGZhbHNlLAogCQkubm9fd2FpdF9ncHUgPSBmYWxzZQogCX07CisJc2l6
ZV90IG1heF9zZWdtZW50OwogCiAJLyogd3RmIHN3YXBwaW5nICovCiAJaWYgKGJvLT5wYWdlcykK
QEAgLTIxNSw4ICsyMTYsMTMgQEAgaW50IHZpcnRpb19ncHVfb2JqZWN0X2dldF9zZ190YWJsZShz
dHJ1Y3QgdmlydGlvX2dwdV9kZXZpY2UgKnFkZXYsCiAJaWYgKCFiby0+cGFnZXMpCiAJCWdvdG8g
b3V0OwogCi0JcmV0ID0gc2dfYWxsb2NfdGFibGVfZnJvbV9wYWdlcyhiby0+cGFnZXMsIHBhZ2Vz
LCBucl9wYWdlcywgMCwKLQkJCQkJbnJfcGFnZXMgPDwgUEFHRV9TSElGVCwgR0ZQX0tFUk5FTCk7
CisJbWF4X3NlZ21lbnQgPSB2aXJ0aW9fbWF4X2RtYV9zaXplKHFkZXYtPnZkZXYpOworCW1heF9z
ZWdtZW50ICY9IFBBR0VfTUFTSzsKKwlpZiAobWF4X3NlZ21lbnQgPiBTQ0FUVEVSTElTVF9NQVhf
U0VHTUVOVCkKKwkJbWF4X3NlZ21lbnQgPSBTQ0FUVEVSTElTVF9NQVhfU0VHTUVOVDsKKwlyZXQg
PSBfX3NnX2FsbG9jX3RhYmxlX2Zyb21fcGFnZXMoYm8tPnBhZ2VzLCBwYWdlcywgbnJfcGFnZXMs
IDAsCisJCQkJCSAgbnJfcGFnZXMgPDwgUEFHRV9TSElGVCwKKwkJCQkJICBtYXhfc2VnbWVudCwg
R0ZQX0tFUk5FTCk7CiAJaWYgKHJldCkKIAkJZ290byBvdXQ7CiAJcmV0dXJuIDA7Ci0tIAoyLjE4
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
