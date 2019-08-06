Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E419983B86
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 23:36:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA19E6E573;
	Tue,  6 Aug 2019 21:36:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC1F56E573
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 21:36:44 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D1E3521873;
 Tue,  6 Aug 2019 21:36:43 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 10/25] drm/bridge: lvds-encoder: Fix build error
 while CONFIG_DRM_KMS_HELPER=m
Date: Tue,  6 Aug 2019 17:36:07 -0400
Message-Id: <20190806213624.20194-10-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190806213624.20194-1-sashal@kernel.org>
References: <20190806213624.20194-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565127404;
 bh=c6YxvaO8bKDe5vGY8W+h81GUnIprS1pVpZ8Pg6d7HYg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CBKzpv53FyTGnnxOSd5Czo2YbZtzc0luA2xpfPYCDd6bA2quXUCLJx6CYt0bH8cVj
 /YSLY0PYJh5XuXTdLUhxGINsOdn21Xb/WzIWM0j1pMg4DAC6nRvbIZM5Ui2osi5U2/
 Drwjyj5Gg7TBTHs229Q25AoSQOAAb3b2s/snONss=
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
Cc: Sasha Levin <sashal@kernel.org>, Hulk Robot <hulkci@huawei.com>,
 YueHaibing <yuehaibing@huawei.com>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogWXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPgoKWyBVcHN0cmVhbSBjb21t
aXQgZjRjYzc0M2E5ODEzNmRmM2MzNzYzMDUwYTBlODIyM2I1MmQ5YTk2MCBdCgpJZiBEUk1fTFZE
U19FTkNPREVSPXkgYnV0IENPTkZJR19EUk1fS01TX0hFTFBFUj1tLApidWlsZCBmYWlsczoKCmRy
aXZlcnMvZ3B1L2RybS9icmlkZ2UvbHZkcy1lbmNvZGVyLm86IEluIGZ1bmN0aW9uIGBsdmRzX2Vu
Y29kZXJfcHJvYmUnOgpsdmRzLWVuY29kZXIuYzooLnRleHQrMHgxNTUpOiB1bmRlZmluZWQgcmVm
ZXJlbmNlIHRvIGBkZXZtX2RybV9wYW5lbF9icmlkZ2VfYWRkJwoKUmVwb3J0ZWQtYnk6IEh1bGsg
Um9ib3QgPGh1bGtjaUBodWF3ZWkuY29tPgpGaXhlczogZGJiNThiZmQ5YWU2ICgiZHJtL2JyaWRn
ZTogRml4IGx2ZHMtZW5jb2RlciBzaW5jZSB0aGUgcGFuZWxfYnJpZGdlIHJld29yay4iKQpTaWdu
ZWQtb2ZmLWJ5OiBZdWVIYWliaW5nIDx5dWVoYWliaW5nQGh1YXdlaS5jb20+ClJldmlld2VkLWJ5
OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+ClNpZ25lZC1vZmYtYnk6
IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4KTGluazogaHR0cHM6Ly9w
YXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoL21zZ2lkLzIwMTkwNzI5MDcxMjE2LjI3NDg4
LTEteXVlaGFpYmluZ0BodWF3ZWkuY29tClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNo
YWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25maWcgfCAxICsK
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvS2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvS2NvbmZpZwppbmRl
eCBhZGY5YWUwZTBiN2M5Li44NWFhODI0MzE3ZjAxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL0tjb25maWcKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9LY29uZmlnCkBA
IC0zNSw2ICszNSw3IEBAIGNvbmZpZyBEUk1fRFVNQl9WR0FfREFDCiBjb25maWcgRFJNX0xWRFNf
RU5DT0RFUgogCXRyaXN0YXRlICJUcmFuc3BhcmVudCBwYXJhbGxlbCB0byBMVkRTIGVuY29kZXIg
c3VwcG9ydCIKIAlkZXBlbmRzIG9uIE9GCisJc2VsZWN0IERSTV9LTVNfSEVMUEVSCiAJc2VsZWN0
IERSTV9QQU5FTF9CUklER0UKIAloZWxwCiAJICBTdXBwb3J0IGZvciB0cmFuc3BhcmVudCBwYXJh
bGxlbCB0byBMVkRTIGVuY29kZXJzIHRoYXQgZG9uJ3QgcmVxdWlyZQotLSAKMi4yMC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
