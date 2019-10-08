Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70787D0810
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 09:14:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 208FE6E910;
	Wed,  9 Oct 2019 07:13:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 490 seconds by postgrey-1.36 at gabe;
 Tue, 08 Oct 2019 20:40:18 UTC
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id B4E2F6E89C
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 20:40:18 +0000 (UTC)
Received: from localhost (p54B3324A.dip0.t-ipconnect.de [84.179.50.74])
 by pokefinder.org (Postfix) with ESMTPSA id 365942C07DC;
 Tue,  8 Oct 2019 22:33:28 +0200 (CEST)
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH RESEND] gpu: drm: bridge: sii9234: convert to
 devm_i2c_new_dummy_device
Date: Tue,  8 Oct 2019 22:33:22 +0200
Message-Id: <20191008203322.3238-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 09 Oct 2019 07:12:50 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TW92ZSBmcm9tIHRoZSBkZXByZWNhdGVkIGkyY19uZXdfZHVtbXkoKSB0byBkZXZtX2kyY19uZXdf
ZHVtbXlfZGV2aWNlKCkuCldlIG5vdyBnZXQgYW4gRVJSUFRSIHdoaWNoIHdlIHVzZSBpbiBlcnJv
ciBoYW5kbGluZyBhbmQgd2UgY2FuIHNraXAKcmVtb3ZhbCBvZiB0aGUgY3JlYXRlZCBkZXZpY2Vz
LgoKU2lnbmVkLW9mZi1ieTogV29sZnJhbSBTYW5nIDx3c2ErcmVuZXNhc0BzYW5nLWVuZ2luZWVy
aW5nLmNvbT4KLS0tCgpSZWJhc2VkIHRvIHY1LjQtcmMyIHNpbmNlIGxhc3QgdGltZS4gT25lIG9m
IHRoZSBsYXN0IHR3byB1c2VycyBvZiB0aGUKb2xkIEFQSSwgc28gcGxlYXNlIGFwcGx5IHNvb24s
IHNvIEkgY2FuIHJlbW92ZSB0aGUgb2xkIGludGVyZmFjZS4gT25seQpidWlsZCB0ZXN0ZWQuCgog
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MjM0LmMgfCAzNiArKysrKysrKysrKy0tLS0tLS0t
LS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDI0IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTIzNC5jIGIv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MjM0LmMKaW5kZXggMjVkNGFkOGM3YWQ2Li44YTZj
ODU2OTNhODggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTIzNC5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTIzNC5jCkBAIC04NDEsMzkgKzg0MSwyOCBA
QCBzdGF0aWMgaW50IHNpaTkyMzRfaW5pdF9yZXNvdXJjZXMoc3RydWN0IHNpaTkyMzQgKmN0eCwK
IAogCWN0eC0+Y2xpZW50W0kyQ19NSExdID0gY2xpZW50OwogCi0JY3R4LT5jbGllbnRbSTJDX1RQ
SV0gPSBpMmNfbmV3X2R1bW15KGFkYXB0ZXIsIEkyQ19UUElfQUREUik7Ci0JaWYgKCFjdHgtPmNs
aWVudFtJMkNfVFBJXSkgeworCWN0eC0+Y2xpZW50W0kyQ19UUEldID0gZGV2bV9pMmNfbmV3X2R1
bW15X2RldmljZSgmY2xpZW50LT5kZXYsIGFkYXB0ZXIsCisJCQkJCQkJIEkyQ19UUElfQUREUik7
CisJaWYgKElTX0VSUihjdHgtPmNsaWVudFtJMkNfVFBJXSkpIHsKIAkJZGV2X2VycihjdHgtPmRl
diwgImZhaWxlZCB0byBjcmVhdGUgVFBJIGNsaWVudFxuIik7Ci0JCXJldHVybiAtRU5PREVWOwor
CQlyZXR1cm4gUFRSX0VSUihjdHgtPmNsaWVudFtJMkNfVFBJXSk7CiAJfQogCi0JY3R4LT5jbGll
bnRbSTJDX0hETUldID0gaTJjX25ld19kdW1teShhZGFwdGVyLCBJMkNfSERNSV9BRERSKTsKLQlp
ZiAoIWN0eC0+Y2xpZW50W0kyQ19IRE1JXSkgeworCWN0eC0+Y2xpZW50W0kyQ19IRE1JXSA9IGRl
dm1faTJjX25ld19kdW1teV9kZXZpY2UoJmNsaWVudC0+ZGV2LCBhZGFwdGVyLAorCQkJCQkJCSAg
STJDX0hETUlfQUREUik7CisJaWYgKElTX0VSUihjdHgtPmNsaWVudFtJMkNfSERNSV0pKSB7CiAJ
CWRldl9lcnIoY3R4LT5kZXYsICJmYWlsZWQgdG8gY3JlYXRlIEhETUkgUlggY2xpZW50XG4iKTsK
LQkJZ290byBmYWlsX3RwaTsKKwkJcmV0dXJuIFBUUl9FUlIoY3R4LT5jbGllbnRbSTJDX0hETUld
KTsKIAl9CiAKLQljdHgtPmNsaWVudFtJMkNfQ0JVU10gPSBpMmNfbmV3X2R1bW15KGFkYXB0ZXIs
IEkyQ19DQlVTX0FERFIpOwotCWlmICghY3R4LT5jbGllbnRbSTJDX0NCVVNdKSB7CisJY3R4LT5j
bGllbnRbSTJDX0NCVVNdID0gZGV2bV9pMmNfbmV3X2R1bW15X2RldmljZSgmY2xpZW50LT5kZXYs
IGFkYXB0ZXIsCisJCQkJCQkJICBJMkNfQ0JVU19BRERSKTsKKwlpZiAoSVNfRVJSKGN0eC0+Y2xp
ZW50W0kyQ19DQlVTXSkpIHsKIAkJZGV2X2VycihjdHgtPmRldiwgImZhaWxlZCB0byBjcmVhdGUg
Q0JVUyBjbGllbnRcbiIpOwotCQlnb3RvIGZhaWxfaGRtaTsKKwkJcmV0dXJuIFBUUl9FUlIoY3R4
LT5jbGllbnRbSTJDX0NCVVNdKTsKIAl9CiAKIAlyZXR1cm4gMDsKLQotZmFpbF9oZG1pOgotCWky
Y191bnJlZ2lzdGVyX2RldmljZShjdHgtPmNsaWVudFtJMkNfSERNSV0pOwotZmFpbF90cGk6Ci0J
aTJjX3VucmVnaXN0ZXJfZGV2aWNlKGN0eC0+Y2xpZW50W0kyQ19UUEldKTsKLQotCXJldHVybiAt
RU5PREVWOwotfQotCi1zdGF0aWMgdm9pZCBzaWk5MjM0X2RlaW5pdF9yZXNvdXJjZXMoc3RydWN0
IHNpaTkyMzQgKmN0eCkKLXsKLQlpMmNfdW5yZWdpc3Rlcl9kZXZpY2UoY3R4LT5jbGllbnRbSTJD
X0NCVVNdKTsKLQlpMmNfdW5yZWdpc3Rlcl9kZXZpY2UoY3R4LT5jbGllbnRbSTJDX0hETUldKTsK
LQlpMmNfdW5yZWdpc3Rlcl9kZXZpY2UoY3R4LT5jbGllbnRbSTJDX1RQSV0pOwogfQogCiBzdGF0
aWMgaW5saW5lIHN0cnVjdCBzaWk5MjM0ICpicmlkZ2VfdG9fc2lpOTIzNChzdHJ1Y3QgZHJtX2Jy
aWRnZSAqYnJpZGdlKQpAQCAtOTUwLDcgKzkzOSw2IEBAIHN0YXRpYyBpbnQgc2lpOTIzNF9yZW1v
dmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCkKIAogCXNpaTkyMzRfY2FibGVfb3V0KGN0eCk7
CiAJZHJtX2JyaWRnZV9yZW1vdmUoJmN0eC0+YnJpZGdlKTsKLQlzaWk5MjM0X2RlaW5pdF9yZXNv
dXJjZXMoY3R4KTsKIAogCXJldHVybiAwOwogfQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
