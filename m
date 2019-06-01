Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C11C831BD1
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jun 2019 15:17:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84BF4899B3;
	Sat,  1 Jun 2019 13:17:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C125D899B3;
 Sat,  1 Jun 2019 13:17:14 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8061827227;
 Sat,  1 Jun 2019 13:17:13 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.1 007/186] drm/msm: correct attempted NULL pointer
 dereference in debugfs
Date: Sat,  1 Jun 2019 09:13:43 -0400
Message-Id: <20190601131653.24205-7-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190601131653.24205-1-sashal@kernel.org>
References: <20190601131653.24205-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1559395034;
 bh=scxhZynwZodEPPgyPa4Jy0luRfXCFIG9QxNi2wfXlKY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MMbyILE5MCNZMfK70LuvMQvHLVF/vFCMdvbovVxzUdGbm5sBADDhGn6X+BQLb5bt5
 /TQnh0lA/NO0AoI/xkUlpOTTicgTtAnau13b6jgFZtsLOm9azsSuO6e6G8zjJ2Qh8I
 CzOyBtXErF0WVDE6C8eebLtPnYgDGJFQIRAfBv68=
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
Cc: Sasha Levin <sashal@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 freedreno@lists.freedesktop.org, Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQnJpYW4gTWFzbmV5IDxtYXNuZXliQG9uc3RhdGlvbi5vcmc+CgpbIFVwc3RyZWFtIGNv
bW1pdCA5MGY5NDY2MGU1MzE4OTc1NTY3NjU0Mzk1NDEwMWRlNzhjMjYyNTNiIF0KCm1zbV9nZW1f
ZGVzY3JpYmUoKSB3b3VsZCBhdHRlbXB0IHRvIGRlcmVmZXJlbmNlIGEgTlVMTCBwb2ludGVyIHZp
YSB0aGUKYWRkcmVzcyBzcGFjZSBwb2ludGVyIHdoZW4gbm8gSU9NTVUgaXMgcHJlc2VudC4gQ29y
cmVjdCB0aGlzIGJ5IGFkZGluZwp0aGUgYXBwcm9wcmlhdGUgY2hlY2suCgpTaWduZWQtb2ZmLWJ5
OiBCcmlhbiBNYXNuZXkgPG1hc25leWJAb25zdGF0aW9uLm9yZz4KRml4ZXM6IDU3NWYwNDg1NTA4
YiAoImRybS9tc206IENsZWFuIHVwIGFuZCBlbmhhbmNlIHRoZSBvdXRwdXQgb2YgdGhlICdnZW0n
IGRlYnVnZnMgbm9kZSIpClNpZ25lZC1vZmYtYnk6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21p
dW0ub3JnPgpMaW5rOiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvbXNn
aWQvMjAxOTA1MTMyMzQxMDUuNzUzMS0yLW1hc25leWJAb25zdGF0aW9uLm9yZwpTaWduZWQtb2Zm
LWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L21zbS9tc21fZ2VtLmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2dlbS5j
IGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ2VtLmMKaW5kZXggMThjYTY1MWFiOTQyYS4uMjNk
ZTRkMWI3YjFhYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ2VtLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ2VtLmMKQEAgLTgwNSw3ICs4MDUsOCBAQCB2b2lk
IG1zbV9nZW1fZGVzY3JpYmUoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosIHN0cnVjdCBzZXFf
ZmlsZSAqbSkKIAkJc2VxX3B1dHMobSwgIiAgICAgIHZtYXM6Iik7CiAKIAkJbGlzdF9mb3JfZWFj
aF9lbnRyeSh2bWEsICZtc21fb2JqLT52bWFzLCBsaXN0KQotCQkJc2VxX3ByaW50ZihtLCAiIFsl
czogJTA4bGx4LCVzLGludXNlPSVkXSIsIHZtYS0+YXNwYWNlLT5uYW1lLAorCQkJc2VxX3ByaW50
ZihtLCAiIFslczogJTA4bGx4LCVzLGludXNlPSVkXSIsCisJCQkJdm1hLT5hc3BhY2UgIT0gTlVM
TCA/IHZtYS0+YXNwYWNlLT5uYW1lIDogTlVMTCwKIAkJCQl2bWEtPmlvdmEsIHZtYS0+bWFwcGVk
ID8gIm1hcHBlZCIgOiAidW5tYXBwZWQiLAogCQkJCXZtYS0+aW51c2UpOwogCi0tIAoyLjIwLjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
