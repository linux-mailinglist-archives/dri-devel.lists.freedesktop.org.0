Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6065D56003
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 05:44:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 086AC6E279;
	Wed, 26 Jun 2019 03:44:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 943976E27A
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 03:44:34 +0000 (UTC)
Received: from sasha-vm.mshome.net (mobile-107-77-172-98.mobile.att.net
 [107.77.172.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 62F2320659;
 Wed, 26 Jun 2019 03:44:33 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 23/34] drm: panel-orientation-quirks: Add quirk
 for GPD MicroPC
Date: Tue, 25 Jun 2019 23:43:24 -0400
Message-Id: <20190626034335.23767-23-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190626034335.23767-1-sashal@kernel.org>
References: <20190626034335.23767-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1561520674;
 bh=2/iTBu5sRGIBOMTrb48ns+ANtLKNzem3E2bKHZlJJ00=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qxvnelDDOHzsEBckwf9Srf1RUINBylAk5epiLZx6Dv+bhR6tLJdhWtk/4HAMROgew
 khI/v+gak2VnhKtAVCGXFO3S5jgQOtl24PyTErpSQ9OgUX7quTLu1akYrO9rvf6WHj
 5hLy62cqIPImy+OqkF/EuBDLDlREvZ3zH9UNHqZ8=
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
CmluZGV4IDA4ODM2MzY3NTk0MC4uYjQ0YmVkNTU0MjExIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX3BhbmVsX29yaWVudGF0aW9uX3F1aXJrcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fcGFuZWxfb3JpZW50YXRpb25fcXVpcmtzLmMKQEAgLTQyLDYgKzQyLDE0IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgZHJtX2RtaV9wYW5lbF9vcmllbnRhdGlvbl9kYXRhIGFzdXNfdDEwMGhh
ID0gewogCS5vcmllbnRhdGlvbiA9IERSTV9NT0RFX1BBTkVMX09SSUVOVEFUSU9OX0xFRlRfVVAs
CiB9OwogCitzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9kbWlfcGFuZWxfb3JpZW50YXRpb25fZGF0
YSBncGRfbWljcm9wYyA9IHsKKwkud2lkdGggPSA3MjAsCisJLmhlaWdodCA9IDEyODAsCisJLmJp
b3NfZGF0ZXMgPSAoY29uc3QgY2hhciAqIGNvbnN0IFtdKXsgIjA0LzI2LzIwMTkiLAorCQlOVUxM
IH0sCisJLm9yaWVudGF0aW9uID0gRFJNX01PREVfUEFORUxfT1JJRU5UQVRJT05fUklHSFRfVVAs
Cit9OworCiBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9kbWlfcGFuZWxfb3JpZW50YXRpb25fZGF0
YSBncGRfcG9ja2V0ID0gewogCS53aWR0aCA9IDEyMDAsCiAJLmhlaWdodCA9IDE5MjAsCkBAIC05
Myw2ICsxMDEsMTQgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkbWlfc3lzdGVtX2lkIG9yaWVudGF0
aW9uX2RhdGFbXSA9IHsKIAkJICBETUlfRVhBQ1RfTUFUQ0goRE1JX1BST0RVQ1RfTkFNRSwgIlQx
MDBIQU4iKSwKIAkJfSwKIAkJLmRyaXZlcl9kYXRhID0gKHZvaWQgKikmYXN1c190MTAwaGEsCisJ
fSwgewkvKiBHUEQgTWljcm9QQyAoZ2VuZXJpYyBzdHJpbmdzLCBhbHNvIG1hdGNoIG9uIGJpb3Mg
ZGF0ZSkgKi8KKwkJLm1hdGNoZXMgPSB7CisJCSAgRE1JX0VYQUNUX01BVENIKERNSV9TWVNfVkVO
RE9SLCAiRGVmYXVsdCBzdHJpbmciKSwKKwkJICBETUlfRVhBQ1RfTUFUQ0goRE1JX1BST0RVQ1Rf
TkFNRSwgIkRlZmF1bHQgc3RyaW5nIiksCisJCSAgRE1JX0VYQUNUX01BVENIKERNSV9CT0FSRF9W
RU5ET1IsICJEZWZhdWx0IHN0cmluZyIpLAorCQkgIERNSV9FWEFDVF9NQVRDSChETUlfQk9BUkRf
TkFNRSwgIkRlZmF1bHQgc3RyaW5nIiksCisJCX0sCisJCS5kcml2ZXJfZGF0YSA9ICh2b2lkICop
JmdwZF9taWNyb3BjLAogCX0sIHsJLyoKIAkJICogR1BEIFBvY2tldCwgbm90ZSB0aGF0IHRoZSB0
aGUgRE1JIGRhdGEgaXMgbGVzcyBnZW5lcmljIHRoZW4KIAkJICogaXQgc2VlbXMsIGRldmljZXMg
d2l0aCBhIGJvYXJkLXZlbmRvciBvZiAiQU1JIENvcnBvcmF0aW9uIgotLSAKMi4yMC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
