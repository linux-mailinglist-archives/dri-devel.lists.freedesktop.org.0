Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C54B7F862
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 15:20:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 300B16EE27;
	Fri,  2 Aug 2019 13:20:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 182746EE28
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 13:20:13 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CD0FC2173E;
 Fri,  2 Aug 2019 13:20:11 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 17/76] drm/amd/display: Clock does not lower in
 Updateplanes
Date: Fri,  2 Aug 2019 09:18:51 -0400
Message-Id: <20190802131951.11600-17-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190802131951.11600-1-sashal@kernel.org>
References: <20190802131951.11600-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1564752012;
 bh=a7cc0qIF7OBAKtAeI32olxn86HEJddZqs8H8D7st0jE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=xHXcOvUXOk/NwkpZ0gx+/8tqLoGauvB577sISgKzdT5lKaaizg/yzpWE4+OeHGRfY
 t4cBHoR78aJqRfM3ixppV8jDfRV1DpvzkL4aA8haCuP+MBlQtXsmthByTJTSoD/a8H
 gPkkufRPZuNK61pL7baPUyoKu5lxNqrFErnhETJA=
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
Cc: Sasha Levin <sashal@kernel.org>, Murton Liu <murton.liu@amd.com>,
 Leo Li <sunpeng.li@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Tony Cheng <Tony.Cheng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTXVydG9uIExpdSA8bXVydG9uLmxpdUBhbWQuY29tPgoKWyBVcHN0cmVhbSBjb21taXQg
NDkyZDllYzI0NDkyMzQyMGFmOTZkYjZiNjlhZDdkNTc1ODU5YWE5MiBdCgpbd2h5XQpXZSByZXNl
dCB0aGUgb3B0aW1pemVkX3JlcXVpcmVkIGluIGF0b21pY19wbGFuZV9kaXNhYmxlCmZsYWcgaW1t
ZWRpYXRlbHkgYWZ0ZXIgaXQgaXMgc2V0IGluIGF0b21pY19wbGFuZV9kaXNjb25uZWN0LCBjYXVz
aW5nIHVzIHRvCm5ldmVyIGhhdmUgZmxhZyBzZXQgZHVyaW5nIG5leHQgZmxpcCBpbiBVcGRhdGVQ
bGFuZXMuCgpbaG93XQpPcHRpbWl6ZSBkaXJlY3RseSBhZnRlciBlYWNoIHRpbWUgcGxhbmUgaXMg
cmVtb3ZlZC4KClNpZ25lZC1vZmYtYnk6IE11cnRvbiBMaXUgPG11cnRvbi5saXVAYW1kLmNvbT4K
UmV2aWV3ZWQtYnk6IFRvbnkgQ2hlbmcgPFRvbnkuQ2hlbmdAYW1kLmNvbT4KQWNrZWQtYnk6IExl
byBMaSA8c3VucGVuZy5saUBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFs
ZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNo
YWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAv
ZGNuMTBfaHdfc2VxdWVuY2VyLmMgfCA2ICsrKysrKwogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24x
MC9kY24xMF9od19zZXF1ZW5jZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9k
Y24xMC9kY24xMF9od19zZXF1ZW5jZXIuYwppbmRleCA5ZTRkNzBhMDA1NWUxLi5jN2I0YzMwNDhi
NzFkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNu
MTBfaHdfc2VxdWVuY2VyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Rj
bjEwL2RjbjEwX2h3X3NlcXVlbmNlci5jCkBAIC0yNDE2LDYgKzI0MTYsMTIgQEAgc3RhdGljIHZv
aWQgZGNuMTBfYXBwbHlfY3R4X2Zvcl9zdXJmYWNlKAogCQlpZiAocmVtb3ZlZF9waXBlW2ldKQog
CQkJZGNuMTBfZGlzYWJsZV9wbGFuZShkYywgJmRjLT5jdXJyZW50X3N0YXRlLT5yZXNfY3R4LnBp
cGVfY3R4W2ldKTsKIAorCWZvciAoaSA9IDA7IGkgPCBkYy0+cmVzX3Bvb2wtPnBpcGVfY291bnQ7
IGkrKykKKwkJaWYgKHJlbW92ZWRfcGlwZVtpXSkgeworCQkJZGMtPmh3c3Mub3B0aW1pemVfYmFu
ZHdpZHRoKGRjLCBjb250ZXh0KTsKKwkJCWJyZWFrOworCQl9CisKIAlpZiAoZGMtPmh3c2VxLT53
YS5ERUdWSURDTjEwXzI1NCkKIAkJaHViYnViMV93bV9jaGFuZ2VfcmVxX3dhKGRjLT5yZXNfcG9v
bC0+aHViYnViKTsKIH0KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
