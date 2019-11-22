Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB56D10782D
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2019 20:49:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 329F66E373;
	Fri, 22 Nov 2019 19:49:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 200D36E373
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2019 19:49:16 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 218CC2071F;
 Fri, 22 Nov 2019 19:49:15 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 13/25] drm/sun4i: tcon: Set min division of
 TCON0_DCLK to 1.
Date: Fri, 22 Nov 2019 14:48:46 -0500
Message-Id: <20191122194859.24508-13-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191122194859.24508-1-sashal@kernel.org>
References: <20191122194859.24508-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1574452155;
 bh=Mpu/ReJMOFNKMRYs/AEeNTxpA1xP5T5VDaCkFifPux0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=d7SYN9Es6UgV4b4imWHsVlUHVg0gLAZXtyX3FCAV9pVQRrtkkXLMlIymcERFG3qTa
 SidkQ78wmYDsEc4OdRYJxEOKg250wv/rqT2UgWrMvnqkZWx91lNqhUnvw9p7LyAdqg
 93zFFzqRhBIGE3B8UanobHWAcLTfIqAJbUnr/fbw=
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
Cc: Sasha Levin <sashal@kernel.org>, Yunhao Tian <t123yh@outlook.com>,
 Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogWXVuaGFvIFRpYW4gPHQxMjN5aEBvdXRsb29rLmNvbT4KClsgVXBzdHJlYW0gY29tbWl0
IDBiOGU3YmJkZTVlN2UyYzQxOTU2N2UxZWUyOTU4N2RhZTNiNzhlZTMgXQoKVGhlIGRhdGFzaGVl
dCBvZiBWM3MgKGFuZCB2YXJpb3VzIG90aGVyIGNoaXBzKSB3cm90ZQp0aGF0IFRDT04wX0RDTEtf
RElWIGNhbiBiZSA+PSAxIGlmIG9ubHkgZGNsayBpcyB1c2VkLAphbmQgbXVzdCA+PSA2IGlmIGRj
bGsxIG9yIGRjbGsyIGlzIHVzZWQuIEFzIGN1cnJlbnRseQpuZWl0aGVyIGRjbGsxIG5vciBkY2xr
MiBpcyB1c2VkIChubyB3cml0ZXMgdG8gdGhlc2UKYml0cyksIGxldCdzIHNldCBtaW5pbWFsIGRp
dmlzaW9uIHRvIDEuCgpJZiB0aGlzIG1pbmltYWwgZGl2aXNpb24gaXMgNiwgc29tZSBjb21tb24g
ZG90IGNsb2NrCmZyZXF1ZW5jaWVzIGNhbid0IGJlIHByb2R1Y2VkIChlLmcuIDMwTUh6IHdpbGwg
bm90IGJlCnBvc3NpYmxlIGFuZCB3aWxsIGZhbGxiYWNrIHRvIDI1TUh6KSwgd2hpY2ggaXMKb2J2
aW91c2x5IG5vdCBhbiBleHBlY3RlZCBiZWhhdmlvdXIuCgpTaWduZWQtb2ZmLWJ5OiBZdW5oYW8g
VGlhbiA8dDEyM3loQG91dGxvb2suY29tPgpTaWduZWQtb2ZmLWJ5OiBNYXhpbWUgUmlwYXJkIDxt
YXhpbWVAY2Vybm8udGVjaD4KTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYXJt
LWtlcm5lbC9NTjJQUjA4TUI1NzkwNUFEOEEwMEMwOERBMjE5Mzc3Qzk4OTc2MEBNTjJQUjA4TUI1
NzkwLm5hbXByZDA4LnByb2Qub3V0bG9vay5jb20vClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmlu
IDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfdGNv
bi5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX3Rjb24uYyBiL2RyaXZl
cnMvZ3B1L2RybS9zdW40aS9zdW40aV90Y29uLmMKaW5kZXggOGMzMWM5YWIwNmY4Yi4uZmRhMWFl
MTIwNjlhNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX3Rjb24uYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfdGNvbi5jCkBAIC00MjMsNyArNDIzLDcg
QEAgc3RhdGljIHZvaWQgc3VuNGlfdGNvbjBfbW9kZV9zZXRfcmdiKHN0cnVjdCBzdW40aV90Y29u
ICp0Y29uLAogCiAJV0FSTl9PTighdGNvbi0+cXVpcmtzLT5oYXNfY2hhbm5lbF8wKTsKIAotCXRj
b24tPmRjbGtfbWluX2RpdiA9IDY7CisJdGNvbi0+ZGNsa19taW5fZGl2ID0gMTsKIAl0Y29uLT5k
Y2xrX21heF9kaXYgPSAxMjc7CiAJc3VuNGlfdGNvbjBfbW9kZV9zZXRfY29tbW9uKHRjb24sIG1v
ZGUpOwogCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
