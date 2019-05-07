Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 309FC15934
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 07:34:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3B2E89CCB;
	Tue,  7 May 2019 05:34:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEC2F89CD9
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 05:34:54 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 08A5F20989;
 Tue,  7 May 2019 05:34:53 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.0 69/99] drm/sun4i: Set device driver data at bind
 time for use in unbind
Date: Tue,  7 May 2019 01:32:03 -0400
Message-Id: <20190507053235.29900-69-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190507053235.29900-1-sashal@kernel.org>
References: <20190507053235.29900-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1557207294;
 bh=gKDtgsP03yEY7PO5Q/wXskrMtPKLZoMPHgd1k6wtyLE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=o7APWV2VOW3VA3osh7Jxs5T8Q3qxJlol48EKo4vtKAFVXjfKQdqQdjPNpjIeoEGsx
 N6KBrItpAtSTW/1RZR5rCyqJUH9gTXphX+yS0BGsLLvd0z2MwkEnvh8jwGXAJ9qf2M
 mF4Uxc5R58jSPKm7dB27hga6jPudWtJA0i18bi/E=
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
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, dri-devel@lists.freedesktop.org,
 Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUGF1bCBLb2NpYWxrb3dza2kgPHBhdWwua29jaWFsa293c2tpQGJvb3RsaW4uY29tPgoK
WyBVcHN0cmVhbSBjb21taXQgMDJiOTJhZGJlMzNlNmRiZDE1ZGM2ZTMyNTQwYjIyZjQ3YzRmZjBh
MiBdCgpPdXIgc3VuNGlfZHJ2X3VuYmluZCBnZXRzIHRoZSBkcm0gZGV2aWNlIHVzaW5nIGRldl9n
ZXRfZHJ2ZGF0YS4KSG93ZXZlciwgdGhhdCBkcml2ZXIgZGF0YSBpcyBuZXZlciBzZXQgaW4gc3Vu
NGlfZHJ2X2JpbmQuCgpTZXQgaXQgdGhlcmUgdG8gYXZvaWQgZ2V0dGluZyBhIE5VTEwgcG9pbnRl
ciBhdCB1bmJpbmQgdGltZS4KCkZpeGVzOiA5MDI2ZTBkMTIyYWMgKCJkcm06IEFkZCBBbGx3aW5u
ZXIgQTEwIERpc3BsYXkgRW5naW5lIHN1cHBvcnQiKQpTaWduZWQtb2ZmLWJ5OiBQYXVsIEtvY2lh
bGtvd3NraSA8cGF1bC5rb2NpYWxrb3dza2lAYm9vdGxpbi5jb20+ClNpZ25lZC1vZmYtYnk6IE1h
eGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+Ckxpbms6IGh0dHBzOi8vcGF0
Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC9tc2dpZC8yMDE5MDQxODEzMjcyNy41MTI4LTMt
cGF1bC5rb2NpYWxrb3dza2lAYm9vdGxpbi5jb20KU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4g
PHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV9kcnYu
YyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkv
c3VuNGlfZHJ2LmMKaW5kZXggOWU0YzM3NWNjYzk2Li5jNmI2NWE5Njk5NzkgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
c3VuNGkvc3VuNGlfZHJ2LmMKQEAgLTg1LDYgKzg1LDggQEAgc3RhdGljIGludCBzdW40aV9kcnZf
YmluZChzdHJ1Y3QgZGV2aWNlICpkZXYpCiAJCXJldCA9IC1FTk9NRU07CiAJCWdvdG8gZnJlZV9k
cm07CiAJfQorCisJZGV2X3NldF9kcnZkYXRhKGRldiwgZHJtKTsKIAlkcm0tPmRldl9wcml2YXRl
ID0gZHJ2OwogCUlOSVRfTElTVF9IRUFEKCZkcnYtPmZyb250ZW5kX2xpc3QpOwogCUlOSVRfTElT
VF9IRUFEKCZkcnYtPmVuZ2luZV9saXN0KTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
