Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5699F55FCF
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 05:43:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EADBF6E26F;
	Wed, 26 Jun 2019 03:43:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08F916E26D
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 03:43:01 +0000 (UTC)
Received: from sasha-vm.mshome.net (mobile-107-77-172-74.mobile.att.net
 [107.77.172.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EB897214DA;
 Wed, 26 Jun 2019 03:42:59 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.1 37/51] drm: panel-orientation-quirks: Add quirk
 for GPD MicroPC
Date: Tue, 25 Jun 2019 23:40:53 -0400
Message-Id: <20190626034117.23247-37-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190626034117.23247-1-sashal@kernel.org>
References: <20190626034117.23247-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1561520580;
 bh=1wsHi0IjxJ2SXkpBDh58k2aubv8o1tUvhUoqVssLEJw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hXv8rGuNoZ501JQflWwaMaq6iyWowk/oByByptS1Kww306Fee2McKCN7ZYwH2xfQ4
 XPaynL+9rofpaq9pSfJRLhu7B/SVCayzcxRU/vtIoT2s37n7ynNWeakpLFz8qriJJE
 SQR4RnPVeDuXNpk4lcnn1maGVJ97qNp4R7V3QRsA=
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
 Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4KClsgVXBzdHJlYW0gY29t
bWl0IDY1MmI4YjA4NjUzOGM4YTEwZGU1YWE1Y2JkYWVmNzkzMzNiNDYzNTggXQoKR1BEIGhhcyBk
b25lIGl0IGFnYWluLCBtYWtlIGEgbmljZSBkZXZpY2UgKGdvb2QpLCB1c2Ugd2F5IHRvbyBnZW5l
cmljCkRNSSBzdHJpbmdzIChiYWQpIGFuZCB1c2UgYSBwb3J0cmFpdCBzY3JlZW4gcm90YXRlZCA5
MCBkZWdyZWVzICh1Z2x5KS4KCkJlY2F1c2Ugb2YgdGhlIHRvbyBnZW5lcmljIERNSSBzdHJpbmdz
IHRoaXMgZW50cnkgaXMgYWxzbyBkb2luZyBiaW9zLWRhdGUKbWF0Y2hpbmcsIHNvIHRoZSBncGRf
bWljcm9wYyBkYXRhIHN0cnVjdCBtYXkgdmVyeSB3ZWxsIG5lZWQgdG8gYmUgdXBkYXRlZAp3aXRo
IHNvbWUgZXh0cmEgYmlvcy1kYXRlcyBpbiB0aGUgZnV0dXJlLgoKQWNrZWQtYnk6IE1heGltZSBS
aXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+ClNpZ25lZC1vZmYtYnk6IEhhbnMgZGUg
R29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+Ckxpbms6IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVk
ZXNrdG9wLm9yZy9wYXRjaC9tc2dpZC8yMDE5MDUyNDEyNTc1OS4xNDEzMS0yLWhkZWdvZWRlQHJl
ZGhhdC5jb20KKGNoZXJyeSBwaWNrZWQgZnJvbSBjb21taXQgZjJmMmJiNjBkOTk4YWJkZTEwZGU3
ZTQ4M2VmOWUxNzYzOTg5MjQ1MCkKU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBr
ZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fcGFuZWxfb3JpZW50YXRpb25fcXVp
cmtzLmMgfCAxNiArKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcGFuZWxfb3JpZW50YXRpb25f
cXVpcmtzLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3BhbmVsX29yaWVudGF0aW9uX3F1aXJrcy5j
CmluZGV4IDAxOWYxNDhkNWE3OC4uZGQ5ODI1NjMzMDRkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX3BhbmVsX29yaWVudGF0aW9uX3F1aXJrcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fcGFuZWxfb3JpZW50YXRpb25fcXVpcmtzLmMKQEAgLTQyLDYgKzQyLDE0IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgZHJtX2RtaV9wYW5lbF9vcmllbnRhdGlvbl9kYXRhIGFzdXNfdDEwMGhh
ID0gewogCS5vcmllbnRhdGlvbiA9IERSTV9NT0RFX1BBTkVMX09SSUVOVEFUSU9OX0xFRlRfVVAs
CiB9OwogCitzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9kbWlfcGFuZWxfb3JpZW50YXRpb25fZGF0
YSBncGRfbWljcm9wYyA9IHsKKwkud2lkdGggPSA3MjAsCisJLmhlaWdodCA9IDEyODAsCisJLmJp
b3NfZGF0ZXMgPSAoY29uc3QgY2hhciAqIGNvbnN0IFtdKXsgIjA0LzI2LzIwMTkiLAorCQlOVUxM
IH0sCisJLm9yaWVudGF0aW9uID0gRFJNX01PREVfUEFORUxfT1JJRU5UQVRJT05fUklHSFRfVVAs
Cit9OworCiBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9kbWlfcGFuZWxfb3JpZW50YXRpb25fZGF0
YSBncGRfcG9ja2V0ID0gewogCS53aWR0aCA9IDEyMDAsCiAJLmhlaWdodCA9IDE5MjAsCkBAIC0x
MDEsNiArMTA5LDE0IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZG1pX3N5c3RlbV9pZCBvcmllbnRh
dGlvbl9kYXRhW10gPSB7CiAJCSAgRE1JX0VYQUNUX01BVENIKERNSV9QUk9EVUNUX05BTUUsICJU
MTAwSEFOIiksCiAJCX0sCiAJCS5kcml2ZXJfZGF0YSA9ICh2b2lkICopJmFzdXNfdDEwMGhhLAor
CX0sIHsJLyogR1BEIE1pY3JvUEMgKGdlbmVyaWMgc3RyaW5ncywgYWxzbyBtYXRjaCBvbiBiaW9z
IGRhdGUpICovCisJCS5tYXRjaGVzID0geworCQkgIERNSV9FWEFDVF9NQVRDSChETUlfU1lTX1ZF
TkRPUiwgIkRlZmF1bHQgc3RyaW5nIiksCisJCSAgRE1JX0VYQUNUX01BVENIKERNSV9QUk9EVUNU
X05BTUUsICJEZWZhdWx0IHN0cmluZyIpLAorCQkgIERNSV9FWEFDVF9NQVRDSChETUlfQk9BUkRf
VkVORE9SLCAiRGVmYXVsdCBzdHJpbmciKSwKKwkJICBETUlfRVhBQ1RfTUFUQ0goRE1JX0JPQVJE
X05BTUUsICJEZWZhdWx0IHN0cmluZyIpLAorCQl9LAorCQkuZHJpdmVyX2RhdGEgPSAodm9pZCAq
KSZncGRfbWljcm9wYywKIAl9LCB7CS8qCiAJCSAqIEdQRCBQb2NrZXQsIG5vdGUgdGhhdCB0aGUg
dGhlIERNSSBkYXRhIGlzIGxlc3MgZ2VuZXJpYyB0aGVuCiAJCSAqIGl0IHNlZW1zLCBkZXZpY2Vz
IHdpdGggYSBib2FyZC12ZW5kb3Igb2YgIkFNSSBDb3Jwb3JhdGlvbiIKLS0gCjIuMjAuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
