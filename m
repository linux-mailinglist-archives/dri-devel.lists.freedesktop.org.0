Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7941B9533F
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 03:19:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4AD96E5B0;
	Tue, 20 Aug 2019 01:18:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 204026E57B
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 01:18:06 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 44833D50;
 Tue, 20 Aug 2019 03:17:58 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 38/50] drm/omap: venc: Remove omap_dss_device operations
Date: Tue, 20 Aug 2019 04:17:09 +0300
Message-Id: <20190820011721.30136-39-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190820011721.30136-1-laurent.pinchart@ideasonboard.com>
References: <20190820011721.30136-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1566263879;
 bh=Mb/Mf4+np/G/mUAIUPAOnlgupMiJH/ydV65DXc1iFw4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ggGUR3LOxMqm2HSHaUNQlZQtC0GueE8BUacQVsSDhMKujB89pLPLjY7aKiEwM3y7o
 wMRAv/MrJYbyo/rqeqCFSK+U7hxQwz2wP2kBU+aCnXuOThkv1dzcpwrYJWBDgr+yAQ
 6Ud6QSpyt6ccH2CjWg91nVKA34oAl/lGtDwhpquY=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm93IHRoYXQgdGhlIFZFTkMgb3V0cHV0IGlzIGRyaXZlbiBmdWxseSB0aHJvdWdoIHRoZSBkcm1f
YnJpZGdlIEFQSSBpdHMKb21hcF9kc3NfZGV2aWNlIG9wZXJhdGlvbnMgYXJlIG5vdCB1c2VkIGFu
eW1vcmUuIFJlbW92ZSB0aGVtLgoKU2lnbmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1
cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9vbWFw
ZHJtL2Rzcy92ZW5jLmMgfCA0NSAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCA0NSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
b21hcGRybS9kc3MvdmVuYy5jIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL3ZlbmMuYwpp
bmRleCBjYzc3NWU4Yjk5NzguLmZlMGEwYjE1OWQ0NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL29tYXBkcm0vZHNzL3ZlbmMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3Mv
dmVuYy5jCkBAIC0zMDgsNyArMzA4LDYgQEAgc3RydWN0IHZlbmNfZGV2aWNlIHsKIAlzdHJ1Y3Qg
ZHJtX2JyaWRnZSBicmlkZ2U7CiB9OwogCi0jZGVmaW5lIGRzc2Rldl90b192ZW5jKGRzc2Rldikg
Y29udGFpbmVyX29mKGRzc2Rldiwgc3RydWN0IHZlbmNfZGV2aWNlLCBvdXRwdXQpCiAjZGVmaW5l
IGRybV9icmlkZ2VfdG9fdmVuYyhiKSBjb250YWluZXJfb2YoYiwgc3RydWN0IHZlbmNfZGV2aWNl
LCBicmlkZ2UpCiAKIHN0YXRpYyBpbmxpbmUgdm9pZCB2ZW5jX3dyaXRlX3JlZyhzdHJ1Y3QgdmVu
Y19kZXZpY2UgKnZlbmMsIGludCBpZHgsIHUzMiB2YWwpCkBAIC00ODEsMzAgKzQ4MCw2IEBAIHN0
YXRpYyB2b2lkIHZlbmNfcG93ZXJfb2ZmKHN0cnVjdCB2ZW5jX2RldmljZSAqdmVuYykKIAl2ZW5j
X3J1bnRpbWVfcHV0KHZlbmMpOwogfQogCi1zdGF0aWMgaW50IHZlbmNfZ2V0X21vZGVzKHN0cnVj
dCBvbWFwX2Rzc19kZXZpY2UgKmRzc2RldiwKLQkJCSAgc3RydWN0IGRybV9jb25uZWN0b3IgKmNv
bm5lY3RvcikKLXsKLQlzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGVz
W10gPSB7Ci0JCSZvbWFwX2Rzc19wYWxfbW9kZSwKLQkJJm9tYXBfZHNzX250c2NfbW9kZSwKLQl9
OwotCXVuc2lnbmVkIGludCBpOwotCi0JZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUobW9kZXMp
OyArK2kpIHsKLQkJc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGU7Ci0KLQkJbW9kZSA9IGRy
bV9tb2RlX2R1cGxpY2F0ZShjb25uZWN0b3ItPmRldiwgbW9kZXNbaV0pOwotCQlpZiAoIW1vZGUp
Ci0JCQlyZXR1cm4gaTsKLQotCQltb2RlLT50eXBlID0gRFJNX01PREVfVFlQRV9EUklWRVIgfCBE
Uk1fTU9ERV9UWVBFX1BSRUZFUlJFRDsKLQkJZHJtX21vZGVfc2V0X25hbWUobW9kZSk7Ci0JCWRy
bV9tb2RlX3Byb2JlZF9hZGQoY29ubmVjdG9yLCBtb2RlKTsKLQl9Ci0KLQlyZXR1cm4gQVJSQVlf
U0laRShtb2Rlcyk7Ci19Ci0KIHN0YXRpYyBlbnVtIHZlbmNfdmlkZW9tb2RlIHZlbmNfZ2V0X3Zp
ZGVvbW9kZShjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSkKIHsKIAlpZiAoISht
b2RlLT5mbGFncyAmIERSTV9NT0RFX0ZMQUdfSU5URVJMQUNFKSkKQEAgLTYwMCwyNSArNTc1LDYg
QEAgc3RhdGljIGludCB2ZW5jX2dldF9jbG9ja3Moc3RydWN0IHZlbmNfZGV2aWNlICp2ZW5jKQog
CXJldHVybiAwOwogfQogCi1zdGF0aWMgaW50IHZlbmNfY29ubmVjdChzdHJ1Y3Qgb21hcF9kc3Nf
ZGV2aWNlICpzcmMsCi0JCQlzdHJ1Y3Qgb21hcF9kc3NfZGV2aWNlICpkc3QpCi17Ci0JcmV0dXJu
IG9tYXBkc3NfZGV2aWNlX2Nvbm5lY3QoZHN0LT5kc3MsIGRzdCwgZHN0LT5uZXh0KTsKLX0KLQot
c3RhdGljIHZvaWQgdmVuY19kaXNjb25uZWN0KHN0cnVjdCBvbWFwX2Rzc19kZXZpY2UgKnNyYywK
LQkJCSAgICBzdHJ1Y3Qgb21hcF9kc3NfZGV2aWNlICpkc3QpCi17Ci0Jb21hcGRzc19kZXZpY2Vf
ZGlzY29ubmVjdChkc3QsIGRzdC0+bmV4dCk7Ci19Ci0KLXN0YXRpYyBjb25zdCBzdHJ1Y3Qgb21h
cF9kc3NfZGV2aWNlX29wcyB2ZW5jX29wcyA9IHsKLQkuY29ubmVjdCA9IHZlbmNfY29ubmVjdCwK
LQkuZGlzY29ubmVjdCA9IHZlbmNfZGlzY29ubmVjdCwKLQotCS5nZXRfbW9kZXMgPSB2ZW5jX2dl
dF9tb2RlcywKLX07Ci0KIC8qIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAgKiBEUk0gQnJpZGdlIE9w
ZXJhdGlvbnMKICAqLwpAQCAtODI3LDcgKzc4Myw2IEBAIHN0YXRpYyBpbnQgdmVuY19pbml0X291
dHB1dChzdHJ1Y3QgdmVuY19kZXZpY2UgKnZlbmMpCiAJb3V0LT50eXBlID0gT01BUF9ESVNQTEFZ
X1RZUEVfVkVOQzsKIAlvdXQtPm5hbWUgPSAidmVuYy4wIjsKIAlvdXQtPmRpc3BjX2NoYW5uZWwg
PSBPTUFQX0RTU19DSEFOTkVMX0RJR0lUOwotCW91dC0+b3BzID0gJnZlbmNfb3BzOwogCW91dC0+
b3duZXIgPSBUSElTX01PRFVMRTsKIAlvdXQtPm9mX3BvcnQgPSAwOwogCW91dC0+b3BzX2ZsYWdz
ID0gT01BUF9EU1NfREVWSUNFX09QX01PREVTOwotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hh
cnQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
