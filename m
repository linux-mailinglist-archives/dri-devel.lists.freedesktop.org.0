Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E39D3BCD03
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 18:44:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 064C56EA81;
	Tue, 24 Sep 2019 16:44:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F011F6EA80;
 Tue, 24 Sep 2019 16:44:37 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DCC5B217D9;
 Tue, 24 Sep 2019 16:44:36 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.3 62/87] drm/amd/display: fix trigger not generated
 for freesync
Date: Tue, 24 Sep 2019 12:41:18 -0400
Message-Id: <20190924164144.25591-62-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924164144.25591-1-sashal@kernel.org>
References: <20190924164144.25591-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569343477;
 bh=XBtLILC1EqGpUwxx8Twbl8rVA44ne2zeh7juqbZ4Re4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LRZK+rpPdZoD6LRxhDXDRs1Y7n+CEvlecBOxjSOeX8Gev3eh6uebuJcGXffFNYzIV
 H3gMzaU2UbZ2isOQ3lYfOecec5kLSR/9bbKVNVwvWzbWZL3oClCVpMYf2ld+/qwWRy
 wp3VJod7J1Ul1ktlXb/W1VV8Cy5jXpEf9EQhDSKA=
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
Cc: Sasha Levin <sashal@kernel.org>, Anthony Koo <Anthony.Koo@amd.com>,
 amd-gfx@lists.freedesktop.org,
 Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogWW9nZXNoIE1vaGFuIE1hcmltdXRodSA8eW9nZXNoLm1vaGFubWFyaW11dGh1QGFtZC5j
b20+CgpbIFVwc3RyZWFtIGNvbW1pdCAxZTdmMTAwY2U4YzA2NDA2MzRiNzk0NjA0ODgwZDkyMDQ0
ODBjOWYxIF0KCltXaHldCkluIG5ld2VyIGhhcmR3YXJlIE1BTlVBTF9GTE9XX0NPTlRST0wgaXMg
bm90IGEgdHJpZ2dlciBiaXQuIER1ZSB0byB0aGlzCmZyb250IHBvcmNoIGlzIGZpeGVkIGFuZCBp
biB0aGVzZSBoYXJkd2FyZSBmcmVlc3luYyBkb2VzIG5vdCB3b3JrLgoKW0hvd10KQ2hhbmdlIHRo
ZSBwcm9ncmFtbWluZyB0byBnZW5lcmF0ZSBhIHB1bHNlIHNvIHRoYXQgdGhlIGV2ZW50IHdpbGwg
YmUKdHJpZ2dlcmVkLCBmcm9udCBwb3JjaCB3aWxsIGJlIGN1dCBzaG9ydCBhbmQgZnJlZXN5bmMg
d2lsbCB3b3JrLgoKU2lnbmVkLW9mZi1ieTogWW9nZXNoIE1vaGFuIE1hcmltdXRodSA8eW9nZXNo
Lm1vaGFubWFyaW11dGh1QGFtZC5jb20+ClJldmlld2VkLWJ5OiBBbnRob255IEtvbyA8QW50aG9u
eS5Lb29AYW1kLmNvbT4KQWNrZWQtYnk6IEJoYXdhbnByZWV0IExha2hhIDxCaGF3YW5wcmVldC5M
YWtoYUBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVj
aGVyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9y
Zz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfb3B0Yy5j
IHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfb3B0Yy5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX29wdGMuYwppbmRleCBhNTQ2YzJi
YzkxMjljLi5lMzY1ZjJkZDdmOWE5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZGNuMTAvZGNuMTBfb3B0Yy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9kY24xMC9kY24xMF9vcHRjLmMKQEAgLTgyNCw2ICs4MjQsOSBAQCB2b2lkIG9wdGMx
X3Byb2dyYW1fbWFudWFsX3RyaWdnZXIoc3RydWN0IHRpbWluZ19nZW5lcmF0b3IgKm9wdGMpCiAK
IAlSRUdfU0VUKE9UR19NQU5VQUxfRkxPV19DT05UUk9MLCAwLAogCQkJTUFOVUFMX0ZMT1dfQ09O
VFJPTCwgMSk7CisKKwlSRUdfU0VUKE9UR19NQU5VQUxfRkxPV19DT05UUk9MLCAwLAorCQkJTUFO
VUFMX0ZMT1dfQ09OVFJPTCwgMCk7CiB9CiAKIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
