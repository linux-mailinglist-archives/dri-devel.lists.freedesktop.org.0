Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1735898B9B
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 08:50:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91FC66E46C;
	Thu, 22 Aug 2019 06:50:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75CBD6E46C
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 06:50:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1858910F23EC;
 Thu, 22 Aug 2019 06:50:46 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-60.ams2.redhat.com
 [10.36.116.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E031258BA;
 Thu, 22 Aug 2019 06:50:42 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1A3599AF5; Thu, 22 Aug 2019 08:50:42 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 3/4] drm/bochs: drop stride and bpp from struct bochs_device
Date: Thu, 22 Aug 2019 08:50:40 +0200
Message-Id: <20190822065041.11941-4-kraxel@redhat.com>
In-Reply-To: <20190822065041.11941-1-kraxel@redhat.com>
References: <20190822065041.11941-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.66]); Thu, 22 Aug 2019 06:50:46 +0000 (UTC)
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
Cc: tzimmermann@suse.de, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR BOCHS VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, Gerd Hoffmann <kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm8gbmVlZCB0byBzdG9yZSB0aGVzZSB2YWx1ZXMuICBicHAgaXMgZml4ZWQgKDMyKSBhbnl3YXku
CldlIGxvb2t1cCB0aGUgc3RyaWRlIGZyb20gc3RydWN0IGRybV9mcmFtZWJ1ZmZlciBpZiBuZWVk
ZWQuCgpTaWduZWQtb2ZmLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHMuaCAgICAgfCAyIC0tCiBkcml2ZXJzL2dwdS9k
cm0vYm9jaHMvYm9jaHNfaHcuYyAgfCA4ICsrKy0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vYm9jaHMv
Ym9jaHNfa21zLmMgfCAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgOCBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHMuaCBi
L2RyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Nocy5oCmluZGV4IDZhYWU0OTRmZmJlOC4uZmEzNmEz
NThhNWRjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHMuaAorKysgYi9k
cml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHMuaApAQCAtNjIsOCArNjIsNiBAQCBzdHJ1Y3QgYm9j
aHNfZGV2aWNlIHsKIAkvKiBtb2RlICovCiAJdTE2IHhyZXM7CiAJdTE2IHlyZXM7Ci0JdTMyIHN0
cmlkZTsKLQl1MzIgYnBwOwogCXN0cnVjdCBlZGlkICplZGlkOwogCiAJLyogZHJtICovCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHNfaHcuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9ib2Nocy9ib2Noc19ody5jCmluZGV4IDI2NTdiMmU2ZTRkOC4uMDc0OWU5ZGUxYTRkIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHNfaHcuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYm9jaHMvYm9jaHNfaHcuYwpAQCAtMjA5LDE2ICsyMDksMTQgQEAgdm9pZCBib2Noc19o
d19zZXRtb2RlKHN0cnVjdCBib2Noc19kZXZpY2UgKmJvY2hzLAogewogCWJvY2hzLT54cmVzID0g
bW9kZS0+aGRpc3BsYXk7CiAJYm9jaHMtPnlyZXMgPSBtb2RlLT52ZGlzcGxheTsKLQlib2Nocy0+
YnBwID0gMzI7Ci0JYm9jaHMtPnN0cmlkZSA9IG1vZGUtPmhkaXNwbGF5ICogKGJvY2hzLT5icHAg
LyA4KTsKIAotCURSTV9ERUJVR19EUklWRVIoIiVkeCVkIEAgJWQgYnBwXG4iLAotCQkJIGJvY2hz
LT54cmVzLCBib2Nocy0+eXJlcywgYm9jaHMtPmJwcCk7CisJRFJNX0RFQlVHX0RSSVZFUigiJWR4
JWRcbiIsCisJCQkgYm9jaHMtPnhyZXMsIGJvY2hzLT55cmVzKTsKIAogCWJvY2hzX3ZnYV93cml0
ZWIoYm9jaHMsIDB4M2MwLCAweDIwKTsgLyogdW5ibGFuayAqLwogCiAJYm9jaHNfZGlzcGlfd3Jp
dGUoYm9jaHMsIFZCRV9ESVNQSV9JTkRFWF9FTkFCTEUsICAgICAgMCk7Ci0JYm9jaHNfZGlzcGlf
d3JpdGUoYm9jaHMsIFZCRV9ESVNQSV9JTkRFWF9CUFAsICAgICAgICAgYm9jaHMtPmJwcCk7CisJ
Ym9jaHNfZGlzcGlfd3JpdGUoYm9jaHMsIFZCRV9ESVNQSV9JTkRFWF9CUFAsICAgICAgICAgMzIp
OwogCWJvY2hzX2Rpc3BpX3dyaXRlKGJvY2hzLCBWQkVfRElTUElfSU5ERVhfWFJFUywgICAgICAg
IGJvY2hzLT54cmVzKTsKIAlib2Noc19kaXNwaV93cml0ZShib2NocywgVkJFX0RJU1BJX0lOREVY
X1lSRVMsICAgICAgICBib2Nocy0+eXJlcyk7CiAJYm9jaHNfZGlzcGlfd3JpdGUoYm9jaHMsIFZC
RV9ESVNQSV9JTkRFWF9CQU5LLCAgICAgICAgMCk7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYm9jaHMvYm9jaHNfa21zLmMgYi9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHNfa21zLmMK
aW5kZXggZjVkNjYzMjU5NzUzLi4zMzRlNDU4Y2JjMzEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9ib2Nocy9ib2Noc19rbXMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHNf
a21zLmMKQEAgLTI5LDcgKzI5LDcgQEAgc3RhdGljIGNvbnN0IHVpbnQzMl90IGJvY2hzX2Zvcm1h
dHNbXSA9IHsKIHN0YXRpYyB2b2lkIGJvY2hzX3BsYW5lX3VwZGF0ZShzdHJ1Y3QgYm9jaHNfZGV2
aWNlICpib2NocywKIAkJCSAgICAgICBzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpzdGF0ZSkKIHsK
LQlpZiAoIXN0YXRlLT5mYiB8fCAhYm9jaHMtPnN0cmlkZSkKKwlpZiAoIXN0YXRlLT5mYikKIAkJ
cmV0dXJuOwogCiAJYm9jaHNfaHdfc2V0ZmIoYm9jaHMsIHN0YXRlLT5mYiwKLS0gCjIuMTguMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
