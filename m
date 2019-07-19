Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D405F6D9CE
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 05:58:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 736536E4CB;
	Fri, 19 Jul 2019 03:58:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF9216E4CB
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 03:58:28 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EE8BD21883;
 Fri, 19 Jul 2019 03:58:27 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 046/171] drm/omap: don't check dispc timings for
 DSI
Date: Thu, 18 Jul 2019 23:54:37 -0400
Message-Id: <20190719035643.14300-46-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719035643.14300-1-sashal@kernel.org>
References: <20190719035643.14300-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563508708;
 bh=8VpvaTC8NGBlITD/Wn03BWKljQg/sjAOb1QSXenJhhk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IfK1L2aRPJe+SmVnxRY49Xs2fzSDSxdvqCpQkZFwgRXW+K/RZWjVId929XL0kBDFH
 kbAiib1D+ZsPOJkucTqsZzXaSiaLGNPDfm/YHdtGOoepdsv6jPHh/I0ZzZ7wUdTOKG
 1rEfanwEktf19MQ0NZp+2/ggmPIKyAE5lphUcXmk=
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
Cc: Sasha Levin <sashal@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Pavel Machek <pavel@ucw.cz>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2ViYXN0aWFuIFJlaWNoZWwgPHNlYmFzdGlhbi5yZWljaGVsQGNvbGxhYm9yYS5jb20+
CgpbIFVwc3RyZWFtIGNvbW1pdCBhZDlkZjdkOTFiNGE2ZThmNGIyMGMyYmY1MzlhYzA5YjNiMmFk
NmViIF0KCldoaWxlIG1vc3QgZGlzcGxheSB0eXBlcyBvbmx5IGZvcndhcmQgdGhlaXIgVk0gdG8g
dGhlIERJU1BDLCB0aGlzCmlzIG5vdCB0cnVlIGZvciBEU0kuIERTSSBjYWxjdWxhdGVzIHRoZSBW
TSBmb3IgRElTUEMgYmFzZWQgb24gaXRzCm93biwgYnV0IGl0J3Mgbm90IGlkZW50aWNhbC4gQWN0
dWFsbHkgdGhlIERTSSBWTSBpcyBub3QgZXZlbiBhIHZhbGlkCkRJU1BDIFZNIG1ha2luZyB0aGlz
IGNoZWNrIGZhaWwuIExldCdzIHJlc3RvcmUgdGhlIG9sZCBiZWhhdmlvdXIKYW5kIGF2b2lkIGNo
ZWNraW5nIHRoZSBESVNQQyBWTSBmb3IgRFNJIGhlcmUuCgpGaXhlczogN2MyN2ZhNTdlZjMxICgi
ZHJtL29tYXA6IENhbGwgZGlzcGMgdGltaW5ncyBjaGVjayBvcGVyYXRpb24gZGlyZWN0bHkiKQpB
Y2tlZC1ieTogUGF2ZWwgTWFjaGVrIDxwYXZlbEB1Y3cuY3o+ClRlc3RlZC1ieTogVG9ueSBMaW5k
Z3JlbiA8dG9ueUBhdG9taWRlLmNvbT4KVGVzdGVkLWJ5OiBQYXZlbCBNYWNoZWsgPHBhdmVsQHVj
dy5jej4KU2lnbmVkLW9mZi1ieTogU2ViYXN0aWFuIFJlaWNoZWwgPHNlYmFzdGlhbi5yZWljaGVs
QGNvbGxhYm9yYS5jb20+ClNpZ25lZC1vZmYtYnk6IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtl
aW5lbkB0aS5jb20+ClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9y
Zz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2NydGMuYyB8IDE4ICsrKysrKysr
KysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9jcnRjLmMgYi9k
cml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2NydGMuYwppbmRleCA4NzEyYWY3OWE0OWMuLjRj
NDNkZDI4MmFjYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9jcnRj
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9jcnRjLmMKQEAgLTM4NCwxMCAr
Mzg0LDIwIEBAIHN0YXRpYyBlbnVtIGRybV9tb2RlX3N0YXR1cyBvbWFwX2NydGNfbW9kZV92YWxp
ZChzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCiAJaW50IHI7CiAKIAlkcm1fZGlzcGxheV9tb2RlX3Rv
X3ZpZGVvbW9kZShtb2RlLCAmdm0pOwotCXIgPSBwcml2LT5kaXNwY19vcHMtPm1ncl9jaGVja190
aW1pbmdzKHByaXYtPmRpc3BjLCBvbWFwX2NydGMtPmNoYW5uZWwsCi0JCQkJCSAgICAgICAmdm0p
OwotCWlmIChyKQotCQlyZXR1cm4gcjsKKworCS8qCisJICogRFNJIG1pZ2h0IG5vdCBjYWxsIHRo
aXMsIHNpbmNlIHRoZSBzdXBwbGllZCBtb2RlIGlzIG5vdCBhCisJICogdmFsaWQgRElTUEMgbW9k
ZS4gRFNJIHdpbGwgY2FsY3VsYXRlIGFuZCBjb25maWd1cmUgdGhlCisJICogcHJvcGVyIERJU1BD
IG1vZGUgbGF0ZXIuCisJICovCisJaWYgKG9tYXBfY3J0Yy0+cGlwZS0+b3V0cHV0LT5uZXh0ID09
IE5VTEwgfHwKKwkgICAgb21hcF9jcnRjLT5waXBlLT5vdXRwdXQtPm5leHQtPnR5cGUgIT0gT01B
UF9ESVNQTEFZX1RZUEVfRFNJKSB7CisJCXIgPSBwcml2LT5kaXNwY19vcHMtPm1ncl9jaGVja190
aW1pbmdzKHByaXYtPmRpc3BjLAorCQkJCQkJICAgICAgIG9tYXBfY3J0Yy0+Y2hhbm5lbCwKKwkJ
CQkJCSAgICAgICAmdm0pOworCQlpZiAocikKKwkJCXJldHVybiByOworCX0KIAogCS8qIENoZWNr
IGZvciBiYW5kd2lkdGggbGltaXQgKi8KIAlpZiAocHJpdi0+bWF4X2JhbmR3aWR0aCkgewotLSAK
Mi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
