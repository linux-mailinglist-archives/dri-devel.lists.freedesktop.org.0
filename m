Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A08D767DE
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 15:40:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0C526ED69;
	Fri, 26 Jul 2019 13:40:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57CB06ED68;
 Fri, 26 Jul 2019 13:40:42 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5441A2238C;
 Fri, 26 Jul 2019 13:40:41 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 40/85] drm/amd/display: Expose audio inst from DC
 to DM
Date: Fri, 26 Jul 2019 09:38:50 -0400
Message-Id: <20190726133936.11177-40-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190726133936.11177-1-sashal@kernel.org>
References: <20190726133936.11177-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1564148442;
 bh=E8IlDIJ9+XEjMrH8K88c+5bFS1t26lVNbrD9vGmUlJs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vAwO19bESO2XpLJU851hixnCqDt4z0apzWqhl3XtRhTWhP3FVQpCQFsQ9L3HzHSzb
 75uw87Yb1mZFU3tIpCXi4tZWUTaA1JFDYDRI9Vqe4knqeabbjZH7AD25GRxU9gguuq
 yvaguENCew3sBHKVHT5bMK8L7ItrmylyZ4RI7Cmk=
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
Cc: Sasha Levin <sashal@kernel.org>, Leo Li <sunpeng.li@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPgoK
WyBVcHN0cmVhbSBjb21taXQgNWZkYjdjNGM3ZjI2OTFlZmQ3NjBiMGIwZGMwMGRhNGEzNjk5ZjFh
NiBdCgpbV2h5XQpJbiBvcmRlciB0byBnaXZlIHBpbiBub3RpZmljYXRpb25zIHRvIHRoZSBzb3Vu
ZCBkcml2ZXIgZnJvbSBETSB3ZSBuZWVkCnRvIGtub3cgd2hldGhlciBhdWRpbyBpcyBlbmFibGVk
IG9uIGEgc3RyZWFtIGFuZCB3aGF0IHBpbiBpdCdzIHVzaW5nCmZyb20gREMuCgpbSG93XQpFeHBv
c2UgdGhlIGluc3RhbmNlIHZpYSBzdHJlYW0gc3RhdHVzIGlmIGl0J3MgYSBtYXBwZWQgcmVzb3Vy
Y2UgZm9yCnRoZSBzdHJlYW0uIEl0IHdpbGwgYmUgLTEgaWYgdGhlcmUncyBubyBhdWRpbyBtYXBw
ZWQuCgpDYzogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CkNjOiBIYXJyeSBXZW50bGFuZCA8
aGFycnkud2VudGxhbmRAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogTmljaG9sYXMgS2F6bGF1c2th
cyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPgpSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVy
IDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIg
PGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxz
YXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29y
ZS9kY19yZXNvdXJjZS5jIHwgMyArKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9k
Y19zdHJlYW0uaCAgICAgICAgfCAxICsKIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfcmVz
b3VyY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX3Jlc291cmNl
LmMKaW5kZXggZWFjNzE4NmU0ZjA4Li4xMjE0MmQxM2YyMmYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX3Jlc291cmNlLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfcmVzb3VyY2UuYwpAQCAtMjAzNCw2ICsyMDM0
LDkgQEAgZW51bSBkY19zdGF0dXMgcmVzb3VyY2VfbWFwX3Bvb2xfcmVzb3VyY2VzKAogCQlpZiAo
Y29udGV4dC0+c3RyZWFtc1tpXSA9PSBzdHJlYW0pIHsKIAkJCWNvbnRleHQtPnN0cmVhbV9zdGF0
dXNbaV0ucHJpbWFyeV9vdGdfaW5zdCA9IHBpcGVfY3R4LT5zdHJlYW1fcmVzLnRnLT5pbnN0Owog
CQkJY29udGV4dC0+c3RyZWFtX3N0YXR1c1tpXS5zdHJlYW1fZW5jX2luc3QgPSBwaXBlX2N0eC0+
c3RyZWFtX3Jlcy5zdHJlYW1fZW5jLT5pZDsKKwkJCWNvbnRleHQtPnN0cmVhbV9zdGF0dXNbaV0u
YXVkaW9faW5zdCA9CisJCQkJcGlwZV9jdHgtPnN0cmVhbV9yZXMuYXVkaW8gPyBwaXBlX2N0eC0+
c3RyZWFtX3Jlcy5hdWRpby0+aW5zdCA6IC0xOworCiAJCQlyZXR1cm4gRENfT0s7CiAJCX0KIApk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjX3N0cmVhbS5oIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjX3N0cmVhbS5oCmluZGV4IDE4OWJkYWI5
MjlhNS4uYzIwODAzYjcxZmE1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZGNfc3RyZWFtLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Rj
X3N0cmVhbS5oCkBAIC00Miw2ICs0Miw3IEBAIHN0cnVjdCBkY19zdHJlYW1fc3RhdHVzIHsKIAlp
bnQgcHJpbWFyeV9vdGdfaW5zdDsKIAlpbnQgc3RyZWFtX2VuY19pbnN0OwogCWludCBwbGFuZV9j
b3VudDsKKwlpbnQgYXVkaW9faW5zdDsKIAlzdHJ1Y3QgdGltaW5nX3N5bmNfaW5mbyB0aW1pbmdf
c3luY19pbmZvOwogCXN0cnVjdCBkY19wbGFuZV9zdGF0ZSAqcGxhbmVfc3RhdGVzW01BWF9TVVJG
QUNFX05VTV07CiB9OwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
