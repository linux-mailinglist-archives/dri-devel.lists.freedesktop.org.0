Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C696683B3B
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 23:34:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 077136E55D;
	Tue,  6 Aug 2019 21:34:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF5246E55C
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 21:34:00 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C1AA7217D7;
 Tue,  6 Aug 2019 21:33:59 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 23/59] drm/bridge: tc358764: Fix build error
Date: Tue,  6 Aug 2019 17:32:43 -0400
Message-Id: <20190806213319.19203-23-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190806213319.19203-1-sashal@kernel.org>
References: <20190806213319.19203-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565127240;
 bh=tX3+3B/kq+FNOebC/0HT2A+XLEXbQHn4wNEEh5n8x30=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gX4cHNQyMNSy1yXOlXBcHXLLueFK7M45r7mY4ePUlzB2rpr/yrTC8m4gX5gawm08J
 3PsaNHFFyAHRIReKJHavKlO6twagKP6MGASauxSO4rT4hi2nFLl9XJ5hYnPA/tJjNz
 Aa/ZEtnfnheu+zagDCMTAs9fPJcJI95VJxMKEMEg=
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
Cc: Sasha Levin <sashal@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 YueHaibing <yuehaibing@huawei.com>, dri-devel@lists.freedesktop.org,
 Hulk Robot <hulkci@huawei.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogWXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPgoKWyBVcHN0cmVhbSBjb21t
aXQgZTFhZTcyYTIxZTVmMGQxODQ2ZTI2ZTNmNTk2MzkzMDY2NDcwMjA3MSBdCgpJZiBDT05GSUdf
RFJNX1RPU0hJQkFfVEMzNTg3NjQ9eSBidXQgQ09ORklHX0RSTV9LTVNfSEVMUEVSPW0sCmJ1aWxk
aW5nIGZhaWxzOgoKZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2NC5vOigucm9kYXRhKzB4
MjI4KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgZHJtX2F0b21pY19oZWxwZXJfY29ubmVjdG9y
X3Jlc2V0Jwpkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY0Lm86KC5yb2RhdGErMHgyNDAp
OiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBkcm1faGVscGVyX3Byb2JlX3NpbmdsZV9jb25uZWN0
b3JfbW9kZXMnCmRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjQubzooLnJvZGF0YSsweDI2
OCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGRybV9hdG9taWNfaGVscGVyX2Nvbm5lY3Rvcl9k
dXBsaWNhdGVfc3RhdGUnCmRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjQubzooLnJvZGF0
YSsweDI3MCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGRybV9hdG9taWNfaGVscGVyX2Nvbm5l
Y3Rvcl9kZXN0cm95X3N0YXRlJwoKTGlrZSBUQzM1ODc2Nywgc2VsZWN0IERSTV9LTVNfSEVMUEVS
IHRvIGZpeCB0aGlzLCBhbmQKY2hhbmdlIHRvIHNlbGVjdCBEUk1fUEFORUwgdG8gYXZvaWQgcmVj
dXJzaXZlIGRlcGVuZGVuY3kuCgpSZXBvcnRlZC1ieTogSHVsayBSb2JvdCA8aHVsa2NpQGh1YXdl
aS5jb20+CkZpeGVzOiBmMzhiN2NjYTZkMGUgKCJkcm0vYnJpZGdlOiB0YzM1ODc2NDogQWRkIERT
SSB0byBMVkRTIGJyaWRnZSBkcml2ZXIiKQpTaWduZWQtb2ZmLWJ5OiBZdWVIYWliaW5nIDx5dWVo
YWliaW5nQGh1YXdlaS5jb20+ClJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50
LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+ClJldmlld2VkLWJ5OiBOZWlsIEFybXN0cm9uZyA8
bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+ClNpZ25lZC1vZmYtYnk6IE5laWwgQXJtc3Ryb25nIDxu
YXJtc3Ryb25nQGJheWxpYnJlLmNvbT4KTGluazogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0
b3Aub3JnL3BhdGNoL21zZ2lkLzIwMTkwNzI5MDkwNTIwLjI1OTY4LTEteXVlaGFpYmluZ0BodWF3
ZWkuY29tClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25maWcgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvS2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvS2NvbmZpZwppbmRl
eCBjYzYyNjAzYjg3YzU5Li5lNGUyMmJiYWUyYTdjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL0tjb25maWcKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9LY29uZmlnCkBA
IC0xMTcsOSArMTE3LDEwIEBAIGNvbmZpZyBEUk1fVEhJTkVfVEhDNjNMVkQxMDI0CiAKIGNvbmZp
ZyBEUk1fVE9TSElCQV9UQzM1ODc2NAogCXRyaXN0YXRlICJUQzM1ODc2NCBEU0kvTFZEUyBicmlk
Z2UiCi0JZGVwZW5kcyBvbiBEUk0gJiYgRFJNX1BBTkVMCiAJZGVwZW5kcyBvbiBPRgogCXNlbGVj
dCBEUk1fTUlQSV9EU0kKKwlzZWxlY3QgRFJNX0tNU19IRUxQRVIKKwlzZWxlY3QgRFJNX1BBTkVM
CiAJaGVscAogCSAgVG9zaGliYSBUQzM1ODc2NCBEU0kvTFZEUyBicmlkZ2UgZHJpdmVyLgogCi0t
IAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
