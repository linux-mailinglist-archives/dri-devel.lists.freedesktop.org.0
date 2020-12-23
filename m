Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB732E11B4
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 03:17:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EEF26E897;
	Wed, 23 Dec 2020 02:17:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA68D6E897;
 Wed, 23 Dec 2020 02:17:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CBD1823333;
 Wed, 23 Dec 2020 02:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608689823;
 bh=LzfZCtv9f0T68Y0kzTc6SDeo8zWnuF2OlmwvB5h+inQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mDz0f1VS2x9iEOee5G/OCqlgzMCCLGdiWZY8r8ITRMZa0V5g0afT81zCT8iQb2CPJ
 ijH2P4fNbwD4ciGRzBWma378UjVagg4SRN1kIhvfvAQfhwni1xPffclSchJs9Z+cEJ
 03uvmMmhKLJl7d8ho2Vh+ooo2CsrnmfDe2et/K/UPNZI3wdyOBCjDReTN0RQVtDemP
 J8auvBYf8IQ5HbuvR+E5aTp2HVQWeUMRp7TLsT9XZPBRrJk0tEK9wUBNm9OaYTbv4r
 7lZoYIue3GkHIyHNm9RXLFYXOrDMJkJkqr7U7EW0XlOR8FqGIP+FGCJNNpEHBT5FAy
 peezz2J72yvLg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 028/217] drm/amdgpu: set LDS_CONFIG=0x20 on Navy
 Flounder to fix a GPU hang (v2)
Date: Tue, 22 Dec 2020 21:13:17 -0500
Message-Id: <20201223021626.2790791-28-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201223021626.2790791-1-sashal@kernel.org>
References: <20201223021626.2790791-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWFyZWsgT2zFocOhayA8bWFyZWsub2xzYWtAYW1kLmNvbT4KClsgVXBzdHJlYW0gY29t
bWl0IDRiNjBiYjBkZGUxYmFmMzQ3NTQwMjUzZjg1NmM1NGJjOTA4ZTUyNWMgXQoKdjI6IHNxdWFz
aCBpbiBidWlsZCBmaXgKCkFja2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVy
QGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IE1hcmVrIE9sxaHDoWsgPG1hcmVrLm9sc2FrQGFtZC5j
b20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNv
bT4KU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jIHwgNSArKysrLQogMSBmaWxlIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ2Z4X3YxMF8wLmMKaW5kZXggNTVmNGI4YzNiOTMzOC4uNjZiZGZiZGNkZjJiOCAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMKQEAgLTMxODMsNyArMzE4MywxMCBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IHNvYzE1X3JlZ19nb2xkZW4gZ29sZGVuX3NldHRpbmdzX2dj
XzEwXzNfMltdID0KIAlTT0MxNV9SRUdfR09MREVOX1ZBTFVFKEdDLCAwLCBtbVNRX1BFUkZDT1VO
VEVSOV9TRUxFQ1QsIDB4ZjBmMDAxZmYsIDB4MDAwMDAwMDApLAogCVNPQzE1X1JFR19HT0xERU5f
VkFMVUUoR0MsIDAsIG1tVEFfQ05UTF9BVVgsIDB4ZmZmN2ZmZmYsIDB4MDEwMzAwMDApLAogCVNP
QzE1X1JFR19HT0xERU5fVkFMVUUoR0MsIDAsIG1tVVRDTDFfQ1RSTCwgMHhmZmJmZmZmZiwgMHgw
MGEwMDAwMCksCi0JU09DMTVfUkVHX0dPTERFTl9WQUxVRShHQywgMCwgbW1WR1RfR1NfTUFYX1dB
VkVfSUQsIDB4MDAwMDBmZmYsIDB4MDAwMDAzZmYpCisJU09DMTVfUkVHX0dPTERFTl9WQUxVRShH
QywgMCwgbW1WR1RfR1NfTUFYX1dBVkVfSUQsIDB4MDAwMDBmZmYsIDB4MDAwMDAzZmYpLAorCisJ
LyogVGhpcyBpcyBub3QgaW4gR0RCIHlldC4gRG9uJ3QgcmVtb3ZlIGl0LiBJdCBmaXhlcyBhIEdQ
VSBoYW5nIG9uIE5hdnkgRmxvdW5kZXIuICovCisJU09DMTVfUkVHX0dPTERFTl9WQUxVRShHQywg
MCwgbW1MRFNfQ09ORklHLCAgMHgwMDAwMDAyMCwgMHgwMDAwMDAyMCksCiB9OwogCiAjZGVmaW5l
IERFRkFVTFRfU0hfTUVNX0NPTkZJRyBcCi0tIAoyLjI3LjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
