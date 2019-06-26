Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9999855FCE
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 05:43:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C0DE6E26D;
	Wed, 26 Jun 2019 03:43:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87BDC6E26D
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 03:42:59 +0000 (UTC)
Received: from sasha-vm.mshome.net (mobile-107-77-172-74.mobile.att.net
 [107.77.172.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E2D77208CB;
 Wed, 26 Jun 2019 03:42:57 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.1 36/51] drm: panel-orientation-quirks: Add quirk
 for GPD pocket2
Date: Tue, 25 Jun 2019 23:40:52 -0400
Message-Id: <20190626034117.23247-36-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190626034117.23247-1-sashal@kernel.org>
References: <20190626034117.23247-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1561520579;
 bh=DAH6MgEyx7njo0iZ7bmJhEsqVy8xFE4LtQ6zVjlE2Ro=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Xn+cjEmYSjXQsfvdSEqVv/dz2aprjPLjOZ+tGvD0QzpGm/jfCWdcegyQ/ZTcG5ynZ
 Vo9kT6IflIL8isyO927yM/a9EijkXR3ag37AqDwiMchT1a5GwWqaCdC0xOK1gvrHI3
 JjVQoC3glPJR9dQAW8yaMnOfdsl5/p/p45OT53s8=
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
 Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org,
 Sasha Levin <sashal@kernel.org>, Jurgen Kramer <gtmkramer@xs4all.nl>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4KClsgVXBzdHJlYW0gY29t
bWl0IDE1YWJjNzExMGE3NzU1NWQzYmY3MmFhZWY0NmQxNTU3ZGIwYTRhYzUgXQoKR1BEIGhhcyBk
b25lIGl0IGFnYWluLCBtYWtlIGEgbmljZSBkZXZpY2UgKGdvb2QpLCB1c2Ugd2F5IHRvbyBnZW5l
cmljCkRNSSBzdHJpbmdzIChiYWQpIGFuZCB1c2UgYSBwb3J0cmFpdCBzY3JlZW4gcm90YXRlZCA5
MCBkZWdyZWVzICh1Z2x5KS4KCkJlY2F1c2Ugb2YgdGhlIHRvbyBnZW5lcmljIERNSSBzdHJpbmdz
IHRoaXMgZW50cnkgaXMgYWxzbyBkb2luZyBiaW9zLWRhdGUKbWF0Y2hpbmcsIHNvIHRoZSBncGRf
cG9ja2V0MiBkYXRhIHN0cnVjdCBtYXkgdmVyeSB3ZWxsIG5lZWQgdG8gYmUgdXBkYXRlZAp3aXRo
IHNvbWUgZXh0cmEgYmlvcy1kYXRlcyBpbiB0aGUgZnV0dXJlLgoKQ2hhbmdlcyBpbiB2MjoKLUFk
ZCBvbmUgbW9yZSBrbm93biBCSU9TIGRhdGUgdG8gdGhlIGxpc3Qgb2YgQklPUyBkYXRlcwoKQ2M6
IEp1cmdlbiBLcmFtZXIgPGd0bWtyYW1lckB4czRhbGwubmw+ClJlcG9ydGVkLWJ5OiBKdXJnZW4g
S3JhbWVyIDxndG1rcmFtZXJAeHM0YWxsLm5sPgpBY2tlZC1ieTogTWF4aW1lIFJpcGFyZCA8bWF4
aW1lLnJpcGFyZEBib290bGluLmNvbT4KU2lnbmVkLW9mZi1ieTogSGFucyBkZSBHb2VkZSA8aGRl
Z29lZGVAcmVkaGF0LmNvbT4KTGluazogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3Jn
L3BhdGNoL21zZ2lkLzIwMTkwNTI0MTI1NzU5LjE0MTMxLTEtaGRlZ29lZGVAcmVkaGF0LmNvbQoo
Y2hlcnJ5IHBpY2tlZCBmcm9tIGNvbW1pdCA2ZGFiOTEwMmRkN2IxNDRlNTcyMzkxNTQzOGUwZDZj
NDczMDE4Y2QwKQpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9wYW5lbF9vcmllbnRhdGlvbl9xdWlya3MuYyB8IDE2
ICsrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9wYW5lbF9vcmllbnRhdGlvbl9xdWlya3MuYyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fcGFuZWxfb3JpZW50YXRpb25fcXVpcmtzLmMKaW5kZXggNTJl
NDQ1YmIxYWE1Li4wMTlmMTQ4ZDVhNzggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
cGFuZWxfb3JpZW50YXRpb25fcXVpcmtzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wYW5l
bF9vcmllbnRhdGlvbl9xdWlya3MuYwpAQCAtNTAsNiArNTAsMTQgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBkcm1fZG1pX3BhbmVsX29yaWVudGF0aW9uX2RhdGEgZ3BkX3BvY2tldCA9IHsKIAkub3Jp
ZW50YXRpb24gPSBEUk1fTU9ERV9QQU5FTF9PUklFTlRBVElPTl9SSUdIVF9VUCwKIH07CiAKK3N0
YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2RtaV9wYW5lbF9vcmllbnRhdGlvbl9kYXRhIGdwZF9wb2Nr
ZXQyID0geworCS53aWR0aCA9IDEyMDAsCisJLmhlaWdodCA9IDE5MjAsCisJLmJpb3NfZGF0ZXMg
PSAoY29uc3QgY2hhciAqIGNvbnN0IFtdKXsgIjA2LzI4LzIwMTgiLCAiMDgvMjgvMjAxOCIsCisJ
CSIxMi8wNy8yMDE4IiwgTlVMTCB9LAorCS5vcmllbnRhdGlvbiA9IERSTV9NT0RFX1BBTkVMX09S
SUVOVEFUSU9OX1JJR0hUX1VQLAorfTsKKwogc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZG1pX3Bh
bmVsX29yaWVudGF0aW9uX2RhdGEgZ3BkX3dpbiA9IHsKIAkud2lkdGggPSA3MjAsCiAJLmhlaWdo
dCA9IDEyODAsCkBAIC0xMDYsNiArMTE0LDE0IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZG1pX3N5
c3RlbV9pZCBvcmllbnRhdGlvbl9kYXRhW10gPSB7CiAJCSAgRE1JX0VYQUNUX01BVENIKERNSV9Q
Uk9EVUNUX05BTUUsICJEZWZhdWx0IHN0cmluZyIpLAogCQl9LAogCQkuZHJpdmVyX2RhdGEgPSAo
dm9pZCAqKSZncGRfcG9ja2V0LAorCX0sIHsJLyogR1BEIFBvY2tldCAyIChnZW5lcmljIHN0cmlu
Z3MsIGFsc28gbWF0Y2ggb24gYmlvcyBkYXRlKSAqLworCQkubWF0Y2hlcyA9IHsKKwkJICBETUlf
RVhBQ1RfTUFUQ0goRE1JX1NZU19WRU5ET1IsICJEZWZhdWx0IHN0cmluZyIpLAorCQkgIERNSV9F
WEFDVF9NQVRDSChETUlfUFJPRFVDVF9OQU1FLCAiRGVmYXVsdCBzdHJpbmciKSwKKwkJICBETUlf
RVhBQ1RfTUFUQ0goRE1JX0JPQVJEX1ZFTkRPUiwgIkRlZmF1bHQgc3RyaW5nIiksCisJCSAgRE1J
X0VYQUNUX01BVENIKERNSV9CT0FSRF9OQU1FLCAiRGVmYXVsdCBzdHJpbmciKSwKKwkJfSwKKwkJ
LmRyaXZlcl9kYXRhID0gKHZvaWQgKikmZ3BkX3BvY2tldDIsCiAJfSwgewkvKiBHUEQgV2luIChz
YW1lIG5vdGUgb24gRE1JIG1hdGNoIGFzIEdQRCBQb2NrZXQpICovCiAJCS5tYXRjaGVzID0gewog
CQkgIERNSV9FWEFDVF9NQVRDSChETUlfQk9BUkRfVkVORE9SLCAiQU1JIENvcnBvcmF0aW9uIiks
Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
