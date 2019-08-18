Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 437B9913C2
	for <lists+dri-devel@lfdr.de>; Sun, 18 Aug 2019 02:14:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 981956E02C;
	Sun, 18 Aug 2019 00:14:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE6186E02C
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2019 00:14:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4938889AC2
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2019 00:14:26 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9DA071C6
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2019 00:14:25 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] radeon: add option so DVI always respect HPD over DDC
Date: Sun, 18 Aug 2019 10:14:24 +1000
Message-Id: <20190818001424.27200-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Sun, 18 Aug 2019 00:14:26 +0000 (UTC)
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KClB1cmVsaW5rIEZYLUQxMjAg
KERWSSBvdmVyIGZpYnJlIGV4dGVuZGVkZXJzKSBkcml2ZSB0aGUgSFBEIGxpbmUKbG93IG9uIHRo
ZSBHUFUgc2lkZSB3aGVuIHRoZSBtb25pdG9yIHNpZGUgZGV2aWNlIGlzIHVucGx1Z2dlZApvciBs
b3NlcyB0aGUgY29ubmVjdGlvbi4gSG93ZXZlciB0aGUgR1BVIHNpZGUgZGV2aWNlIHNlZW1zIHRv
IGNhY2hlCkVESUQgaW4gdGhpcyBjYXNlLiBQZXIgRFZJIHNwZWMgdGhlIEhQRCBsaW5lIG11c3Qg
YmUgZHJpdmVuIGluIG9yZGVyCmZvciBFRElEIHRvIGJlIGRvbmUsIGJ1dCB3ZSd2ZSBtZXQgZW5v
dWdoIGJyb2tlbiBkZXZpY2VzIChtYWlubHkKVkdBLT5EVkkgY29udmVydG9ycykgdGhhdCBkbyB0
aGUgd3JvbmcgdGhpbmcgd2l0aCBIUEQgdGhhdCB3ZSBpZ25vcmUKaXQgaWYgYSBEREMgcHJvYmUg
c3VjY2VlZHMuCgpUaGlzIHBhdGNoIGFkZHMgYW4gb3B0aW9uIHRvIHRoZSByYWRlb24gZHJpdmVy
IHRvIGFsd2F5cyByZXNwZWN0IEhQRApvbiBEVkkgY29ubmVjdG9ycyBzdWNoIHRoYXQgaWYgdGhl
IEhQRCBsaW5lIGlzbid0IGRyaXZlbiB0aGVuIEVESUQKaXNuJ3QgcHJvYmVkLgoKU2lnbmVkLW9m
Zi1ieTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vcmFkZW9uL3JhZGVvbi5oICAgICAgICAgICAgfCAxICsKIGRyaXZlcnMvZ3B1L2RybS9yYWRl
b24vcmFkZW9uX2Nvbm5lY3RvcnMuYyB8IDcgKysrKysrKwogZHJpdmVycy9ncHUvZHJtL3JhZGVv
bi9yYWRlb25fZHJ2LmMgICAgICAgIHwgNCArKysrCiAzIGZpbGVzIGNoYW5nZWQsIDEyIGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbi5oIGIv
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb24uaAppbmRleCAzMjgwOGU1MGJlMTIuLmQ1NzJl
OGRlZDliOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb24uaAorKysg
Yi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbi5oCkBAIC0xMTcsNiArMTE3LDcgQEAgZXh0
ZXJuIGludCByYWRlb25fdXZkOwogZXh0ZXJuIGludCByYWRlb25fdmNlOwogZXh0ZXJuIGludCBy
YWRlb25fc2lfc3VwcG9ydDsKIGV4dGVybiBpbnQgcmFkZW9uX2Npa19zdXBwb3J0OworZXh0ZXJu
IGludCByYWRlb25fcmVzcGVjdF9ocGQ7CiAKIC8qCiAgKiBDb3B5IGZyb20gcmFkZW9uX2Rydi5o
IHNvIHdlIGRvbid0IGhhdmUgdG8gaW5jbHVkZSBib3RoIGFuZCBoYXZlIGNvbmZsaWN0aW5nCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9jb25uZWN0b3JzLmMgYi9k
cml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9jb25uZWN0b3JzLmMKaW5kZXggYzYwZDFhNDRk
MjJhLi5lOWIzOTI0ZGYwNmUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFk
ZW9uX2Nvbm5lY3RvcnMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9jb25u
ZWN0b3JzLmMKQEAgLTEyNjUsNiArMTI2NSwxMyBAQCByYWRlb25fZHZpX2RldGVjdChzdHJ1Y3Qg
ZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLCBib29sIGZvcmNlKQogCQlnb3RvIGV4aXQ7CiAJfQog
CisJaWYgKHJhZGVvbl9yZXNwZWN0X2hwZCAmJiByYWRlb25fY29ubmVjdG9yLT5ocGQuaHBkICE9
IFJBREVPTl9IUERfTk9ORSkgeworCQlpZiAoIXJhZGVvbl9ocGRfc2Vuc2UocmRldiwgcmFkZW9u
X2Nvbm5lY3Rvci0+aHBkLmhwZCkpIHsKKwkJCXJldCA9IGNvbm5lY3Rvcl9zdGF0dXNfZGlzY29u
bmVjdGVkOworCQkJZ290byBleGl0OworCQl9CisJfQorCiAJaWYgKHJhZGVvbl9jb25uZWN0b3It
PmRkY19idXMpIHsKIAkJZHJldCA9IHJhZGVvbl9kZGNfcHJvYmUocmFkZW9uX2Nvbm5lY3Rvciwg
ZmFsc2UpOwogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kcnYu
YyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rydi5jCmluZGV4IGE2Y2JlMTFmNzlj
Ni4uNTU2YWUzODFlYTg2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVv
bl9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kcnYuYwpAQCAtMjA3
LDYgKzIwNyw3IEBAIGludCByYWRlb25fYXV4Y2ggPSAtMTsKIGludCByYWRlb25fbXN0ID0gMDsK
IGludCByYWRlb25fdXZkID0gMTsKIGludCByYWRlb25fdmNlID0gMTsKK2ludCByYWRlb25fcmVz
cGVjdF9ocGQgPSAwOwogCiBNT0RVTEVfUEFSTV9ERVNDKG5vX3diLCAiRGlzYWJsZSBBR1Agd3Jp
dGViYWNrIGZvciBzY3JhdGNoIHJlZ2lzdGVycyIpOwogbW9kdWxlX3BhcmFtX25hbWVkKG5vX3di
LCByYWRlb25fbm9fd2IsIGludCwgMDQ0NCk7CkBAIC0zMTIsNiArMzEzLDkgQEAgaW50IHJhZGVv
bl9jaWtfc3VwcG9ydCA9IDE7CiBNT0RVTEVfUEFSTV9ERVNDKGNpa19zdXBwb3J0LCAiQ0lLIHN1
cHBvcnQgKDEgPSBlbmFibGVkIChkZWZhdWx0KSwgMCA9IGRpc2FibGVkKSIpOwogbW9kdWxlX3Bh
cmFtX25hbWVkKGNpa19zdXBwb3J0LCByYWRlb25fY2lrX3N1cHBvcnQsIGludCwgMDQ0NCk7CiAK
K01PRFVMRV9QQVJNX0RFU0MocmVzcGVjdF9ocGQsICJGb3IgRFZJIGFsd2F5cyBiZWxpZXZlIEhQ
RCIpOworbW9kdWxlX3BhcmFtX25hbWVkKHJlc3BlY3RfaHBkLCByYWRlb25fcmVzcGVjdF9ocGQs
IGludCwgMDY0NCk7CisKIHN0YXRpYyBzdHJ1Y3QgcGNpX2RldmljZV9pZCBwY2lpZGxpc3RbXSA9
IHsKIAlyYWRlb25fUENJX0lEUwogfTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
