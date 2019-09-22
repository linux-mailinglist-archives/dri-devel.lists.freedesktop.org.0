Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC76BA593
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2019 20:59:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDD3D6E871;
	Sun, 22 Sep 2019 18:59:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95F376E870;
 Sun, 22 Sep 2019 18:59:27 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7E4C32186A;
 Sun, 22 Sep 2019 18:59:26 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 86/89] drm/amd/powerplay/smu7: enforce minimal
 VBITimeout (v2)
Date: Sun, 22 Sep 2019 14:57:14 -0400
Message-Id: <20190922185717.3412-86-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190922185717.3412-1-sashal@kernel.org>
References: <20190922185717.3412-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569178767;
 bh=PqaDUTFMjQNqk7CmNI64SIfAI3JLDCto4G4ERhjXbu0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Z047smC9rXcSNH0thPEohe4+mbc9PQDZ2Isvl5FE/jkVHCdNOXmJY1lnywy+83s8Q
 8d5Ad7lXpWqN7Xo26+KjIvn4W2StoIya6fAzrPASiPSkjvSt7XP8dJ4BEjJSFqk8Y/
 sObTliZNTOcZZMS4jPDrfxul0qiF8fYLe1yIw7XM=
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
 Ahzo <Ahzo@tutanota.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQWh6byA8QWh6b0B0dXRhbm90YS5jb20+CgpbIFVwc3RyZWFtIGNvbW1pdCBmNjU5YmI2
ZGFlNThjMTEzODA1ZjkyODIyZTRjMTZkZGQzMTU2Yjc5IF0KClRoaXMgZml4ZXMgc2NyZWVuIGNv
cnJ1cHRpb24vZmxpY2tlcmluZyBvbiA3NSBIeiBkaXNwbGF5cy4KCnYyOiBtYWtlIHByaW50IHN0
YXRlbWVudCBkZWJ1ZyBvbmx5IChBbGV4KQoKQnVnemlsbGE6IGh0dHBzOi8vYnVncy5mcmVlZGVz
a3RvcC5vcmcvc2hvd19idWcuY2dpP2lkPTEwMjY0NgpSZXZpZXdlZC1ieTogRXZhbiBRdWFuIDxl
dmFuLnF1YW5AYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWh6byA8QWh6b0B0dXRhbm90YS5jb20+
ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4K
U2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3NtdTdfaHdtZ3IuYyB8IDUgKysrKysKIDEg
ZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9od21nci9zbXU3X2h3bWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9od21nci9zbXU3X2h3bWdyLmMKaW5kZXggMzM2ZmRkOGM3ZGIwOC4uNjExNDFi
YzNlZGZlOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3Iv
c211N19od21nci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3Nt
dTdfaHdtZ3IuYwpAQCAtMzk3Miw2ICszOTcyLDExIEBAIHN0YXRpYyBpbnQgc211N19wcm9ncmFt
X2Rpc3BsYXlfZ2FwKHN0cnVjdCBwcF9od21nciAqaHdtZ3IpCiAKIAlkYXRhLT5mcmFtZV90aW1l
X3gyID0gZnJhbWVfdGltZV9pbl91cyAqIDIgLyAxMDA7CiAKKwlpZiAoZGF0YS0+ZnJhbWVfdGlt
ZV94MiA8IDI4MCkgeworCQlwcl9kZWJ1ZygiJXM6IGVuZm9yY2UgbWluaW1hbCBWQklUaW1lb3V0
OiAlZCAtPiAyODBcbiIsIF9fZnVuY19fLCBkYXRhLT5mcmFtZV90aW1lX3gyKTsKKwkJZGF0YS0+
ZnJhbWVfdGltZV94MiA9IDI4MDsKKwl9CisKIAlkaXNwbGF5X2dhcDIgPSBwcmVfdmJpX3RpbWVf
aW5fdXMgKiAocmVmX2Nsb2NrIC8gMTAwKTsKIAogCWNnc193cml0ZV9pbmRfcmVnaXN0ZXIoaHdt
Z3ItPmRldmljZSwgQ0dTX0lORF9SRUdfX1NNQywgaXhDR19ESVNQTEFZX0dBUF9DTlRMMiwgZGlz
cGxheV9nYXAyKTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
