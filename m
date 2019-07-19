Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D56ED6DAAF
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 06:03:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 447D76E509;
	Fri, 19 Jul 2019 04:03:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 629EE6E508;
 Fri, 19 Jul 2019 04:03:47 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5D76921852;
 Fri, 19 Jul 2019 04:03:46 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.1 027/141] drm/amd/display: Increase Backlight Gain
 Step Size
Date: Fri, 19 Jul 2019 00:00:52 -0400
Message-Id: <20190719040246.15945-27-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719040246.15945-1-sashal@kernel.org>
References: <20190719040246.15945-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563509027;
 bh=pI3vddgKINJgVjkWylDi2N58jA1dIv4Do39gLR5enI4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ps9DPS9SI5p/MKQfHnu+GVp6BOmMWbCYkwtD85pRy4ZLxm6XEwMQE4SjI4R8XYa7i
 CbEqAItmBDfeTEVwEmkM55XK6n0Bz7QuzRquJcOgDaRTV0Bgf5abKCBjrXPsOz2C0r
 3eAK8+/eOuKNYjfjIcyCkhpVf1720NQnyFNWv00g=
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
Cc: Sasha Levin <sashal@kernel.org>, Eryk Brol <eryk.brol@amd.com>,
 Leo Li <sunpeng.li@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Jun Lei <Jun.Lei@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRXJ5ayBCcm9sIDxlcnlrLmJyb2xAYW1kLmNvbT4KClsgVXBzdHJlYW0gY29tbWl0IGUy
NTIyOGIwMmU0ODMzZTViMGZkZDI2MjgwMWEyYWU2Y2M3MmIzOWQgXQoKW1doeV0KU29tZSBiYWNr
bGlnaHQgdGVzdHMgZmFpbCBkdWUgdG8gYmFja2xpZ2h0IHNldHRsaW5nCnRha2luZyB0b28gbG9u
Zy4gVGhpcyBoYXBwZW5zIGJlY2F1c2UgdGhlIHN0ZXAKc2l6ZSB1c2VkIHRvIGNoYW5nZSBiYWNr
bGlnaHQgbGV2ZWxzIGlzIHRvbyBzbWFsbC4KCltIb3ddCjEuIENoYW5nZSB0aGUgc2l6ZSBvZiB0
aGUgYmFja2xpZ2h0IGdhaW4gc3RlcCBzaXplCjIuIENoYW5nZSBob3cgRE1DVSBmaXJtd2FyZSBn
ZXRzIHRoZSBzdGVwIHNpemUgdmFsdWUKICAgc28gdGhhdCBpdCBpcyBwYXNzZWQgaW4gYnkgZHJp
dmVyIGR1cmluZyBETUNVIGluaXRuCgpTaWduZWQtb2ZmLWJ5OiBFcnlrIEJyb2wgPGVyeWsuYnJv
bEBhbWQuY29tPgpSZXZpZXdlZC1ieTogSnVuIExlaSA8SnVuLkxlaUBhbWQuY29tPgpBY2tlZC1i
eTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hl
ciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4g
PHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9k
Y2UvZGNlX2RtY3UuYyB8IDMgKysrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNl
L2RjZV9kbWN1LmggfCAyICsrCiAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2RtY3UuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2RtY3UuYwppbmRleCBjMjky
NmNmMTlkZWUuLjQwN2ZiMjJiZTY2YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2RjZS9kY2VfZG1jdS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kY2UvZGNlX2RtY3UuYwpAQCAtMzY1LDYgKzM2NSw5IEBAIHN0YXRpYyBib29sIGRjbjEw
X2RtY3VfaW5pdChzdHJ1Y3QgZG1jdSAqZG1jdSkKIAkJLyogU2V0IGluaXRpYWxpemVkIHJhbXBp
bmcgYm91bmRhcnkgdmFsdWUgKi8KIAkJUkVHX1dSSVRFKE1BU1RFUl9DT01NX0RBVEFfUkVHMSwg
MHhGRkZGKTsKIAorCQkvKiBTZXQgYmFja2xpZ2h0IHJhbXBpbmcgc3RlcHNpemUgKi8KKwkJUkVH
X1dSSVRFKE1BU1RFUl9DT01NX0RBVEFfUkVHMiwgYWJtX2dhaW5fc3RlcHNpemUpOworCiAJCS8q
IFNldCBjb21tYW5kIHRvIGluaXRpYWxpemUgbWljcm9jb250cm9sbGVyICovCiAJCVJFR19VUERB
VEUoTUFTVEVSX0NPTU1fQ01EX1JFRywgTUFTVEVSX0NPTU1fQ01EX1JFR19CWVRFMCwKIAkJCU1D
UF9JTklUX0RNQ1UpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2RjZS9kY2VfZG1jdS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2Vf
ZG1jdS5oCmluZGV4IGMyNGMwZTVlYTQ0ZS4uMjQ5YTNjMjNiNjA3IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9kbWN1LmgKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfZG1jdS5oCkBAIC0yNjMsNCArMjYzLDYgQEAg
c3RydWN0IGRtY3UgKmRjbjEwX2RtY3VfY3JlYXRlKAogCiB2b2lkIGRjZV9kbWN1X2Rlc3Ryb3ko
c3RydWN0IGRtY3UgKipkbWN1KTsKIAorc3RhdGljIGNvbnN0IHVpbnQzMl90IGFibV9nYWluX3N0
ZXBzaXplID0gMHgwMDYwOworCiAjZW5kaWYgLyogX0RDRV9BQk1fSF8gKi8KLS0gCjIuMjAuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
