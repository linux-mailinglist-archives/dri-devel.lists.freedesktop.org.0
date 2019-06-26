Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B86956002
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 05:44:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E43586E277;
	Wed, 26 Jun 2019 03:44:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F0F66E277
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 03:44:33 +0000 (UTC)
Received: from sasha-vm.mshome.net (mobile-107-77-172-98.mobile.att.net
 [107.77.172.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B7F49205ED;
 Wed, 26 Jun 2019 03:44:31 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 22/34] drm: panel-orientation-quirks: Add quirk
 for GPD pocket2
Date: Tue, 25 Jun 2019 23:43:23 -0400
Message-Id: <20190626034335.23767-22-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190626034335.23767-1-sashal@kernel.org>
References: <20190626034335.23767-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1561520672;
 bh=ZqvzL5QRBqlyvstiXKL/63rBGS2MmAum0563vuhRjJo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZEMw154++EfymUlqaCyxRA8C7FeCitjZLn4LYAF5qj5ywKmj4/JVv3NH/4Fw/EdPW
 NFlvzMvb4VZM+PEfLGu8yTH+iN5Chwkgr4+jlaQfKa8WqUnCJxWmKZEfLGcygSE2EK
 NJXurjoNN8v3l7heXgeTv8pTpwawsEaCjXOsWomk=
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
L2RyaXZlcnMvZ3B1L2RybS9kcm1fcGFuZWxfb3JpZW50YXRpb25fcXVpcmtzLmMKaW5kZXggZWU0
YTVlMTIyMWYxLi4wODgzNjM2NzU5NDAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
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
dCA9IDEyODAsCkBAIC05OCw2ICsxMDYsMTQgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkbWlfc3lz
dGVtX2lkIG9yaWVudGF0aW9uX2RhdGFbXSA9IHsKIAkJICBETUlfRVhBQ1RfTUFUQ0goRE1JX1BS
T0RVQ1RfTkFNRSwgIkRlZmF1bHQgc3RyaW5nIiksCiAJCX0sCiAJCS5kcml2ZXJfZGF0YSA9ICh2
b2lkICopJmdwZF9wb2NrZXQsCisJfSwgewkvKiBHUEQgUG9ja2V0IDIgKGdlbmVyaWMgc3RyaW5n
cywgYWxzbyBtYXRjaCBvbiBiaW9zIGRhdGUpICovCisJCS5tYXRjaGVzID0geworCQkgIERNSV9F
WEFDVF9NQVRDSChETUlfU1lTX1ZFTkRPUiwgIkRlZmF1bHQgc3RyaW5nIiksCisJCSAgRE1JX0VY
QUNUX01BVENIKERNSV9QUk9EVUNUX05BTUUsICJEZWZhdWx0IHN0cmluZyIpLAorCQkgIERNSV9F
WEFDVF9NQVRDSChETUlfQk9BUkRfVkVORE9SLCAiRGVmYXVsdCBzdHJpbmciKSwKKwkJICBETUlf
RVhBQ1RfTUFUQ0goRE1JX0JPQVJEX05BTUUsICJEZWZhdWx0IHN0cmluZyIpLAorCQl9LAorCQku
ZHJpdmVyX2RhdGEgPSAodm9pZCAqKSZncGRfcG9ja2V0MiwKIAl9LCB7CS8qIEdQRCBXaW4gKHNh
bWUgbm90ZSBvbiBETUkgbWF0Y2ggYXMgR1BEIFBvY2tldCkgKi8KIAkJLm1hdGNoZXMgPSB7CiAJ
CSAgRE1JX0VYQUNUX01BVENIKERNSV9CT0FSRF9WRU5ET1IsICJBTUkgQ29ycG9yYXRpb24iKSwK
LS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
