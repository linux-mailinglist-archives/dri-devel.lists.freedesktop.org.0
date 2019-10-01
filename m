Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 531CFC3B5F
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 18:45:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27F066E03D;
	Tue,  1 Oct 2019 16:45:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 537436E03D;
 Tue,  1 Oct 2019 16:45:15 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7604D205C9;
 Tue,  1 Oct 2019 16:45:14 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 07/19] drm/amdgpu: Check for valid number of
 registers to read
Date: Tue,  1 Oct 2019 12:44:53 -0400
Message-Id: <20191001164505.16708-7-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191001164505.16708-1-sashal@kernel.org>
References: <20191001164505.16708-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569948315;
 bh=f6t4c88a69fuHzhV8io9AVBJIcK7SkSDMOV9GaanKkY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hCr5BI4/PyRq2UnhfkFRY0el25iumOSZ0PnG5Vq0Wu/znwic8lbD0fssxzAiM0nW/
 iDurK91CJwhIa2BzWY8bIo4237l0Z8BwNLBBKh6MlHFuIRXYIgsiMnhjd/+qvGrRo8
 OnLBAuWMRoUmLzQtR+ePouRhRT8wi3ZUnf22LWBE=
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 Trek <trek00@inbox.ru>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVHJlayA8dHJlazAwQGluYm94LnJ1PgoKWyBVcHN0cmVhbSBjb21taXQgNzNkOGU2Yzdi
ODQxZDliZjI5OGM4OTI4ZjIyOGZiNDMzNjc2NjM1YyBdCgpEbyBub3QgdHJ5IHRvIGFsbG9jYXRl
IGFueSBhbW91bnQgb2YgbWVtb3J5IHJlcXVlc3RlZCBieSB0aGUgdXNlci4KSW5zdGVhZCBsaW1p
dCBpdCB0byAxMjggcmVnaXN0ZXJzLiBBY3R1YWxseSB0aGUgbG9uZ2VzdCBzZXJpZXMgb2YKY29u
c2VjdXRpdmUgYWxsb3dlZCByZWdpc3RlcnMgYXJlIDQ4LCBtbUdCX1RJTEVfTU9ERTAtMzEgYW5k
Cm1tR0JfTUFDUk9USUxFX01PREUwLTE1ICgweDI2NDQtMHgyNjczKS4KCkJ1ZzogaHR0cHM6Ly9i
dWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTExMjczClNpZ25lZC1vZmYtYnk6
IFRyZWsgPHRyZWswMEBpbmJveC5ydT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4
YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFs
QGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ttcy5j
IHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfa21zLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfa21zLmMKaW5kZXggMzkzOGZjYTFlYThlNS4uMjQ5NDFhN2I2NTlm
NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ttcy5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9rbXMuYwpAQCAtNDMwLDYgKzQz
MCw5IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2luZm9faW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRl
diwgdm9pZCAqZGF0YSwgc3RydWN0IGRybV9maWxlCiAJCWlmIChzaF9udW0gPT0gQU1ER1BVX0lO
Rk9fTU1SX1NIX0lOREVYX01BU0spCiAJCQlzaF9udW0gPSAweGZmZmZmZmZmOwogCisJCWlmIChp
bmZvLT5yZWFkX21tcl9yZWcuY291bnQgPiAxMjgpCisJCQlyZXR1cm4gLUVJTlZBTDsKKwogCQly
ZWdzID0ga21hbGxvY19hcnJheShpbmZvLT5yZWFkX21tcl9yZWcuY291bnQsIHNpemVvZigqcmVn
cyksIEdGUF9LRVJORUwpOwogCQlpZiAoIXJlZ3MpCiAJCQlyZXR1cm4gLUVOT01FTTsKLS0gCjIu
MjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
