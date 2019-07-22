Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4CD71290
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 09:16:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF9EF6E0BA;
	Tue, 23 Jul 2019 07:15:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 824AD89CF5
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 17:26:35 +0000 (UTC)
Received: from localhost (p54B33E22.dip0.t-ipconnect.de [84.179.62.34])
 by pokefinder.org (Postfix) with ESMTPSA id C0E6F4A1496;
 Mon, 22 Jul 2019 19:26:34 +0200 (CEST)
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Subject: [PATCH] gpu: drm: bridge: sii9234: convert to
 devm_i2c_new_dummy_device
Date: Mon, 22 Jul 2019 19:26:34 +0200
Message-Id: <20190722172634.4481-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 23 Jul 2019 07:14:10 +0000
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
 dri-devel@lists.freedesktop.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TW92ZSBmcm9tIGkyY19uZXdfZHVtbXkoKSB0byBkZXZtX2kyY19uZXdfZHVtbXlfZGV2aWNlKCku
IFNvLCB3ZSBub3cgZ2V0CmFuIEVSUlBUUiB3aGljaCB3ZSB1c2UgaW4gZXJyb3IgaGFuZGxpbmcg
YW5kIHdlIGNhbiBza2lwIHJlbW92YWwgb2YgdGhlCmNyZWF0ZWQgZGV2aWNlcy4KClNpZ25lZC1v
ZmYtYnk6IFdvbGZyYW0gU2FuZyA8d3NhK3JlbmVzYXNAc2FuZy1lbmdpbmVlcmluZy5jb20+Ci0t
LQoKT25seSBidWlsZCB0ZXN0ZWQuIFBhcnQgb2YgYSB0cmVlLXdpZGUgbW92ZSB0byBkZXByZWNh
dGUKaTJjX25ld19kdW1teSgpLgoKIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTIzNC5jIHwg
MzYgKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMiBp
bnNlcnRpb25zKCspLCAyNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL3NpaTkyMzQuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTIzNC5jCmlu
ZGV4IDI1ZDRhZDhjN2FkNi4uOGE2Yzg1NjkzYTg4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL3NpaTkyMzQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpaTkyMzQu
YwpAQCAtODQxLDM5ICs4NDEsMjggQEAgc3RhdGljIGludCBzaWk5MjM0X2luaXRfcmVzb3VyY2Vz
KHN0cnVjdCBzaWk5MjM0ICpjdHgsCiAKIAljdHgtPmNsaWVudFtJMkNfTUhMXSA9IGNsaWVudDsK
IAotCWN0eC0+Y2xpZW50W0kyQ19UUEldID0gaTJjX25ld19kdW1teShhZGFwdGVyLCBJMkNfVFBJ
X0FERFIpOwotCWlmICghY3R4LT5jbGllbnRbSTJDX1RQSV0pIHsKKwljdHgtPmNsaWVudFtJMkNf
VFBJXSA9IGRldm1faTJjX25ld19kdW1teV9kZXZpY2UoJmNsaWVudC0+ZGV2LCBhZGFwdGVyLAor
CQkJCQkJCSBJMkNfVFBJX0FERFIpOworCWlmIChJU19FUlIoY3R4LT5jbGllbnRbSTJDX1RQSV0p
KSB7CiAJCWRldl9lcnIoY3R4LT5kZXYsICJmYWlsZWQgdG8gY3JlYXRlIFRQSSBjbGllbnRcbiIp
OwotCQlyZXR1cm4gLUVOT0RFVjsKKwkJcmV0dXJuIFBUUl9FUlIoY3R4LT5jbGllbnRbSTJDX1RQ
SV0pOwogCX0KIAotCWN0eC0+Y2xpZW50W0kyQ19IRE1JXSA9IGkyY19uZXdfZHVtbXkoYWRhcHRl
ciwgSTJDX0hETUlfQUREUik7Ci0JaWYgKCFjdHgtPmNsaWVudFtJMkNfSERNSV0pIHsKKwljdHgt
PmNsaWVudFtJMkNfSERNSV0gPSBkZXZtX2kyY19uZXdfZHVtbXlfZGV2aWNlKCZjbGllbnQtPmRl
diwgYWRhcHRlciwKKwkJCQkJCQkgIEkyQ19IRE1JX0FERFIpOworCWlmIChJU19FUlIoY3R4LT5j
bGllbnRbSTJDX0hETUldKSkgewogCQlkZXZfZXJyKGN0eC0+ZGV2LCAiZmFpbGVkIHRvIGNyZWF0
ZSBIRE1JIFJYIGNsaWVudFxuIik7Ci0JCWdvdG8gZmFpbF90cGk7CisJCXJldHVybiBQVFJfRVJS
KGN0eC0+Y2xpZW50W0kyQ19IRE1JXSk7CiAJfQogCi0JY3R4LT5jbGllbnRbSTJDX0NCVVNdID0g
aTJjX25ld19kdW1teShhZGFwdGVyLCBJMkNfQ0JVU19BRERSKTsKLQlpZiAoIWN0eC0+Y2xpZW50
W0kyQ19DQlVTXSkgeworCWN0eC0+Y2xpZW50W0kyQ19DQlVTXSA9IGRldm1faTJjX25ld19kdW1t
eV9kZXZpY2UoJmNsaWVudC0+ZGV2LCBhZGFwdGVyLAorCQkJCQkJCSAgSTJDX0NCVVNfQUREUik7
CisJaWYgKElTX0VSUihjdHgtPmNsaWVudFtJMkNfQ0JVU10pKSB7CiAJCWRldl9lcnIoY3R4LT5k
ZXYsICJmYWlsZWQgdG8gY3JlYXRlIENCVVMgY2xpZW50XG4iKTsKLQkJZ290byBmYWlsX2hkbWk7
CisJCXJldHVybiBQVFJfRVJSKGN0eC0+Y2xpZW50W0kyQ19DQlVTXSk7CiAJfQogCiAJcmV0dXJu
IDA7Ci0KLWZhaWxfaGRtaToKLQlpMmNfdW5yZWdpc3Rlcl9kZXZpY2UoY3R4LT5jbGllbnRbSTJD
X0hETUldKTsKLWZhaWxfdHBpOgotCWkyY191bnJlZ2lzdGVyX2RldmljZShjdHgtPmNsaWVudFtJ
MkNfVFBJXSk7Ci0KLQlyZXR1cm4gLUVOT0RFVjsKLX0KLQotc3RhdGljIHZvaWQgc2lpOTIzNF9k
ZWluaXRfcmVzb3VyY2VzKHN0cnVjdCBzaWk5MjM0ICpjdHgpCi17Ci0JaTJjX3VucmVnaXN0ZXJf
ZGV2aWNlKGN0eC0+Y2xpZW50W0kyQ19DQlVTXSk7Ci0JaTJjX3VucmVnaXN0ZXJfZGV2aWNlKGN0
eC0+Y2xpZW50W0kyQ19IRE1JXSk7Ci0JaTJjX3VucmVnaXN0ZXJfZGV2aWNlKGN0eC0+Y2xpZW50
W0kyQ19UUEldKTsKIH0KIAogc3RhdGljIGlubGluZSBzdHJ1Y3Qgc2lpOTIzNCAqYnJpZGdlX3Rv
X3NpaTkyMzQoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSkKQEAgLTk1MCw3ICs5MzksNiBAQCBz
dGF0aWMgaW50IHNpaTkyMzRfcmVtb3ZlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQpCiAKIAlz
aWk5MjM0X2NhYmxlX291dChjdHgpOwogCWRybV9icmlkZ2VfcmVtb3ZlKCZjdHgtPmJyaWRnZSk7
Ci0Jc2lpOTIzNF9kZWluaXRfcmVzb3VyY2VzKGN0eCk7CiAKIAlyZXR1cm4gMDsKIH0KLS0gCjIu
MjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
