Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D38C7F8D7
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 15:23:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28A276EE51;
	Fri,  2 Aug 2019 13:23:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE6366EE4D;
 Fri,  2 Aug 2019 13:23:33 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D46AB20644;
 Fri,  2 Aug 2019 13:23:32 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 11/42] drm/amd/display: Increase size of audios
 array
Date: Fri,  2 Aug 2019 09:22:31 -0400
Message-Id: <20190802132302.13537-11-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190802132302.13537-1-sashal@kernel.org>
References: <20190802132302.13537-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1564752213;
 bh=l10GuSudI+FjotOrYmXiH9xEl29VjZLJ0uN7IGgcUyk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C7eSw7g5wb0XBXBsQo+pJ4133ATuetskijrvaH7UVDQ/I7frFQqLSFbPHgwgnt0Ht
 7r6+gZ78S2INhhdFo49tjPZGDtc9i/3sL5oiRkNVZ9JHLPcsOy/EYg+GP1Ih5DrGke
 gk3Oeq06ARvWgQ+AqdwiAjJX1D6VoD1wgL3zYPfo=
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
Cc: Sasha Levin <sashal@kernel.org>, Joshua Aberback <Joshua.Aberback@amd.com>,
 Leo Li <sunpeng.li@amd.com>, amd-gfx@lists.freedesktop.org,
 Tai Man <taiman.wong@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGFpIE1hbiA8dGFpbWFuLndvbmdAYW1kLmNvbT4KClsgVXBzdHJlYW0gY29tbWl0IDcz
NTIxOTNhMzNkZmM5YjY5YmEzYmY2YThjYWVhOTI1Yjk2MjQzYjEgXQoKW1doeV0KVGhlIGF1ZGlv
cyBhcnJheSBkZWZpbmVkIGluICJzdHJ1Y3QgcmVzb3VyY2VfcG9vbCIgaXMgb25seSA2IChNQVhf
UElQRVMpCmJ1dCB0aGUgbWF4IG51bWJlciBvZiBhdWRpbyBkZXZpY2VzIChudW1fYXVkaW8pIGlz
IDcuIEluIHNvbWUgcHJvamVjdHMsCml0IHdpbGwgcnVuIG91dCBvZiBhdWRpb3MgYXJyYXkuCgpb
SG93XQpJbmNyYWVzZSB0aGUgYXVkaW9zIGFycmF5IHNpemUgdG8gNy4KClNpZ25lZC1vZmYtYnk6
IFRhaSBNYW4gPHRhaW1hbi53b25nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBKb3NodWEgQWJlcmJh
Y2sgPEpvc2h1YS5BYmVyYmFja0BhbWQuY29tPgpBY2tlZC1ieTogTGVvIExpIDxzdW5wZW5nLmxp
QGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJA
YW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pbmMvY29yZV90eXBlcy5oICAgfCAy
ICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2h3L2h3X3NoYXJlZC5oIHwg
MSArCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pbmMvY29yZV90eXBlcy5o
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9jb3JlX3R5cGVzLmgKaW5kZXgg
YzBiOWNhMTMzOTNiNi4uZjQ0NjlmYTVhZmI1NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2luYy9jb3JlX3R5cGVzLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2luYy9jb3JlX3R5cGVzLmgKQEAgLTE1OSw3ICsxNTksNyBAQCBzdHJ1Y3Qg
cmVzb3VyY2VfcG9vbCB7CiAJc3RydWN0IGNsb2NrX3NvdXJjZSAqY2xvY2tfc291cmNlc1tNQVhf
Q0xPQ0tfU09VUkNFU107CiAJdW5zaWduZWQgaW50IGNsa19zcmNfY291bnQ7CiAKLQlzdHJ1Y3Qg
YXVkaW8gKmF1ZGlvc1tNQVhfUElQRVNdOworCXN0cnVjdCBhdWRpbyAqYXVkaW9zW01BWF9BVURJ
T1NdOwogCXVuc2lnbmVkIGludCBhdWRpb19jb3VudDsKIAlzdHJ1Y3QgYXVkaW9fc3VwcG9ydCBh
dWRpb19zdXBwb3J0OwogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvaW5jL2h3L2h3X3NoYXJlZC5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2lu
Yy9ody9od19zaGFyZWQuaAppbmRleCBjZjc0MzNlYmY5MWEwLi43MTkwMTc0M2E5Mzg3IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2h3L2h3X3NoYXJlZC5o
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pbmMvaHcvaHdfc2hhcmVkLmgK
QEAgLTM0LDYgKzM0LDcgQEAKICAqIERhdGEgdHlwZXMgc2hhcmVkIGJldHdlZW4gZGlmZmVyZW50
IFZpcnR1YWwgSFcgYmxvY2tzCiAgKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqLwogCisjZGVmaW5lIE1B
WF9BVURJT1MgNwogI2RlZmluZSBNQVhfUElQRVMgNgogCiBzdHJ1Y3QgZ2FtbWFfY3VydmUgewot
LSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
