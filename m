Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8968248608
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 16:52:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFC38892EA;
	Mon, 17 Jun 2019 14:51:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9EE6892EA
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 14:51:58 +0000 (UTC)
X-Originating-IP: 90.88.23.150
Received: from localhost (aaubervilliers-681-1-81-150.w90-88.abo.wanadoo.fr
 [90.88.23.150]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 439E6E0011;
 Mon, 17 Jun 2019 14:51:55 +0000 (UTC)
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sean Paul <seanpaul@chromium.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v5 12/12] drm/vc4: hdmi: Set default state margin at reset
Date: Mon, 17 Jun 2019 16:51:39 +0200
Message-Id: <44e24172e300be6a41578517021ef6a6e90ed682.1560783090.git-series.maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.5190d070d1439d762d7ab273f4ae2573087fee20.1560783090.git-series.maxime.ripard@bootlin.com>
References: <cover.5190d070d1439d762d7ab273f4ae2573087fee20.1560783090.git-series.maxime.ripard@bootlin.com>
MIME-Version: 1.0
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
Cc: eben@raspberrypi.org, dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm93IHRoYXQgdGhlIFRWIG1hcmdpbnMgYXJlIHByb3Blcmx5IHBhcnNlZCBhbmQgZmlsbGVkIGlu
dG8KZHJtX2NtZGxpbmVfbW9kZSwgd2UganVzdCBuZWVkIHRvIGluaXRpYWxpc2UgdGhlIGZpcnN0
IHN0YXRlIGF0IHJlc2V0IHRvCmdldCB0aG9zZSB2YWx1ZXMgYW5kIHN0YXJ0IHVzaW5nIHRoZW0u
CgpSZXZpZXdlZC1ieTogTm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+ClNpZ25l
ZC1vZmYtYnk6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfaGRtaS5jIHwgOCArKysrKysrLQogMSBmaWxlIGNoYW5n
ZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS92YzQvdmM0X2hkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2hkbWkuYwpp
bmRleCA2YmVhYzFjYTFmMjcuLjRhOWM4YzlmZTJiMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3ZjNC92YzRfaGRtaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2hkbWkuYwpA
QCAtMjU4LDExICsyNTgsMTcgQEAgc3RhdGljIGludCB2YzRfaGRtaV9jb25uZWN0b3JfZ2V0X21v
ZGVzKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCiAJcmV0dXJuIHJldDsKIH0KIAor
c3RhdGljIHZvaWQgdmM0X2hkbWlfY29ubmVjdG9yX3Jlc2V0KHN0cnVjdCBkcm1fY29ubmVjdG9y
ICpjb25uZWN0b3IpCit7CisJZHJtX2F0b21pY19oZWxwZXJfY29ubmVjdG9yX3Jlc2V0KGNvbm5l
Y3Rvcik7CisJZHJtX2F0b21pY19oZWxwZXJfY29ubmVjdG9yX3R2X3Jlc2V0KGNvbm5lY3Rvcik7
Cit9CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9mdW5jcyB2YzRfaGRtaV9j
b25uZWN0b3JfZnVuY3MgPSB7CiAJLmRldGVjdCA9IHZjNF9oZG1pX2Nvbm5lY3Rvcl9kZXRlY3Qs
CiAJLmZpbGxfbW9kZXMgPSBkcm1faGVscGVyX3Byb2JlX3NpbmdsZV9jb25uZWN0b3JfbW9kZXMs
CiAJLmRlc3Ryb3kgPSB2YzRfaGRtaV9jb25uZWN0b3JfZGVzdHJveSwKLQkucmVzZXQgPSBkcm1f
YXRvbWljX2hlbHBlcl9jb25uZWN0b3JfcmVzZXQsCisJLnJlc2V0ID0gdmM0X2hkbWlfY29ubmVj
dG9yX3Jlc2V0LAogCS5hdG9taWNfZHVwbGljYXRlX3N0YXRlID0gZHJtX2F0b21pY19oZWxwZXJf
Y29ubmVjdG9yX2R1cGxpY2F0ZV9zdGF0ZSwKIAkuYXRvbWljX2Rlc3Ryb3lfc3RhdGUgPSBkcm1f
YXRvbWljX2hlbHBlcl9jb25uZWN0b3JfZGVzdHJveV9zdGF0ZSwKIH07Ci0tIApnaXQtc2VyaWVz
IDAuOS4xCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
