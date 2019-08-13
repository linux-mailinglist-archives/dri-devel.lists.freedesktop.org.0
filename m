Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB588B2EA
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 10:50:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB5876E0AA;
	Tue, 13 Aug 2019 08:50:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1472B6E0AA
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 08:50:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A3E5F309266A;
 Tue, 13 Aug 2019 08:50:49 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-144.ams2.redhat.com
 [10.36.116.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BED5512A7A;
 Tue, 13 Aug 2019 08:50:46 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E5DE516E08; Tue, 13 Aug 2019 10:50:38 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3] drm/virtio: use virtio_max_dma_size
Date: Tue, 13 Aug 2019 10:50:34 +0200
Message-Id: <20190813085034.14234-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Tue, 13 Aug 2019 08:50:49 +0000 (UTC)
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
c2V2LCBhbHNvIHJlcHJvZHVjYWJsZSB3aXRoCnN3aW90bGI9Zm9yY2UpLgoKU3VnZ2VzdGVkLWJ5
OiBMYXN6bG8gRXJzZWsgPGxlcnNla0ByZWRoYXQuY29tPgpTaWduZWQtb2ZmLWJ5OiBHZXJkIEhv
ZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3Zp
cnRncHVfb2JqZWN0LmMgfCAxMCArKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0
aW8vdmlydGdwdV9vYmplY3QuYyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9vYmpl
Y3QuYwppbmRleCBiMmRhMzEzMTBkMjQuLjNkODZlNGIzZGU1OCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X29iamVjdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92
aXJ0aW8vdmlydGdwdV9vYmplY3QuYwpAQCAtMjA0LDYgKzIwNCw3IEBAIGludCB2aXJ0aW9fZ3B1
X29iamVjdF9nZXRfc2dfdGFibGUoc3RydWN0IHZpcnRpb19ncHVfZGV2aWNlICpxZGV2LAogCQku
aW50ZXJydXB0aWJsZSA9IGZhbHNlLAogCQkubm9fd2FpdF9ncHUgPSBmYWxzZQogCX07CisJdW5z
aWduZWQgbWF4X3NlZ21lbnQ7CiAKIAkvKiB3dGYgc3dhcHBpbmcgKi8KIAlpZiAoYm8tPnBhZ2Vz
KQpAQCAtMjE1LDggKzIxNiwxMyBAQCBpbnQgdmlydGlvX2dwdV9vYmplY3RfZ2V0X3NnX3RhYmxl
KHN0cnVjdCB2aXJ0aW9fZ3B1X2RldmljZSAqcWRldiwKIAlpZiAoIWJvLT5wYWdlcykKIAkJZ290
byBvdXQ7CiAKLQlyZXQgPSBzZ19hbGxvY190YWJsZV9mcm9tX3BhZ2VzKGJvLT5wYWdlcywgcGFn
ZXMsIG5yX3BhZ2VzLCAwLAotCQkJCQlucl9wYWdlcyA8PCBQQUdFX1NISUZULCBHRlBfS0VSTkVM
KTsKKwltYXhfc2VnbWVudCA9IHZpcnRpb19tYXhfZG1hX3NpemUocWRldi0+dmRldik7CisJbWF4
X3NlZ21lbnQgJj0gUEFHRV9NQVNLOworCWlmIChtYXhfc2VnbWVudCA+IFNDQVRURVJMSVNUX01B
WF9TRUdNRU5UKQorCQltYXhfc2VnbWVudCA9IFNDQVRURVJMSVNUX01BWF9TRUdNRU5UOworCXJl
dCA9IF9fc2dfYWxsb2NfdGFibGVfZnJvbV9wYWdlcyhiby0+cGFnZXMsIHBhZ2VzLCBucl9wYWdl
cywgMCwKKwkJCQkJICBucl9wYWdlcyA8PCBQQUdFX1NISUZULAorCQkJCQkgIG1heF9zZWdtZW50
LCBHRlBfS0VSTkVMKTsKIAlpZiAocmV0KQogCQlnb3RvIG91dDsKIAlyZXR1cm4gMDsKLS0gCjIu
MTguMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
