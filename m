Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 404ADB271
	for <lists+dri-devel@lfdr.de>; Sat, 27 Apr 2019 03:43:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C56C98925B;
	Sat, 27 Apr 2019 01:43:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECED58925B
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Apr 2019 01:43:35 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 255C7216FD;
 Sat, 27 Apr 2019 01:43:35 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 07/16] drm/mediatek: Fix an error code in
 mtk_hdmi_dt_parse_pdata()
Date: Fri, 26 Apr 2019 21:43:15 -0400
Message-Id: <20190427014325.8704-7-sashal@kernel.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190427014325.8704-1-sashal@kernel.org>
References: <20190427014325.8704-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1556329415;
 bh=cTh2JwGulfqwce2QqUga9l8RsKPms7SUf/crGJOOdgM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZBjOwI0zN8PvG4onKhvLlVibXJJLUUifCSqlR430J90Noiidh0aiZ0AaN7jjDhyVg
 DdC3ukYB6DvuJeVoNnHLCGgMOvyu2ol0O6TAKQSlFCxFNEIPyGxPcsrhcjClZOuyYz
 Xx8dvtfBAsYNMpsKvGHWu37Npj2K5JzqJdAJUiR4=
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPgoKWyBVcHN0cmVh
bSBjb21taXQgMmQ4NTk3ODM0MWU2YTMyZTc0NDNkOWYyODYzOWRhMjU0ZDUzZjQwMCBdCgpXZSBk
b24ndCB3YW50IHRvIG92ZXJ3cml0ZSAicmV0IiwgaXQgYWxyZWFkeSBob2xkcyB0aGUgY29ycmVj
dCBlcnJvcgpjb2RlLiAgVGhlICJyZWdtYXAiIHZhcmlhYmxlIG1pZ2h0IGJlIGEgdmFsaWQgcG9p
bnRlciBhcyB0aGlzIHBvaW50LgoKRml4ZXM6IDhmODNmMjY4OTFlMSAoImRybS9tZWRpYXRlazog
QWRkIEhETUkgc3VwcG9ydCIpClNpZ25lZC1vZmYtYnk6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJw
ZW50ZXJAb3JhY2xlLmNvbT4KU2lnbmVkLW9mZi1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNv
bT4KU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jIHwgMSAtCiAxIGZpbGUgY2hhbmdlZCwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
aGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMKaW5kZXggODYzZDAz
MDc4NmU1Li4yMDBmNzVlMWQ2MTkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfaGRtaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jCkBA
IC0xNDczLDcgKzE0NzMsNiBAQCBzdGF0aWMgaW50IG10a19oZG1pX2R0X3BhcnNlX3BkYXRhKHN0
cnVjdCBtdGtfaGRtaSAqaGRtaSwKIAlpZiAoSVNfRVJSKHJlZ21hcCkpCiAJCXJldCA9IFBUUl9F
UlIocmVnbWFwKTsKIAlpZiAocmV0KSB7Ci0JCXJldCA9IFBUUl9FUlIocmVnbWFwKTsKIAkJZGV2
X2VycihkZXYsCiAJCQkiRmFpbGVkIHRvIGdldCBzeXN0ZW0gY29uZmlndXJhdGlvbiByZWdpc3Rl
cnM6ICVkXG4iLAogCQkJcmV0KTsKLS0gCjIuMTkuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
