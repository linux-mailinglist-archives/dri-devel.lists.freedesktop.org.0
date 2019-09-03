Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C576A6EBA
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 18:28:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12F318989A;
	Tue,  3 Sep 2019 16:28:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EF9D89893;
 Tue,  3 Sep 2019 16:28:30 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9D6A923789;
 Tue,  3 Sep 2019 16:28:29 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 114/167] drm/amdkfd: Add missing Polaris10 ID
Date: Tue,  3 Sep 2019 12:24:26 -0400
Message-Id: <20190903162519.7136-114-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190903162519.7136-1-sashal@kernel.org>
References: <20190903162519.7136-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1567528110;
 bh=tV9a9uvOlH4HopRvLe6hsbfjnMkwSk+2KuG5xrr9efw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=xY0XNu1E2uX/707hqBAY2wIK/ifAHk6iB2MDT7Skf5fm6NkqTxq5JSq3C0yhyUiHX
 3dtMrINLx53oyf0lWfPCcw31ss8qxiMtnX56eCPDrblSm15W49mmsQ+kkTkC54hlCM
 ke1oKz3pltGlbRoTi7xLmuMwQ4FKxDhwjL5ILGgQ=
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
Cc: Sasha Levin <sashal@kernel.org>, stable@vger.kernel.rg,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Kent Russell <kent.russell@amd.com>, Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogS2VudCBSdXNzZWxsIDxrZW50LnJ1c3NlbGxAYW1kLmNvbT4KClsgVXBzdHJlYW0gY29t
bWl0IDBhNWE5YzI3NmMzMzU4NzBhMWNlY2M0ZjAyYjc2ZDZkNmY2NjNjOGIgXQoKVGhpcyB3YXMg
YWRkZWQgdG8gYW1kZ3B1IGJ1dCB3YXMgbWlzc2VkIGluIGFtZGtmZAoKU2lnbmVkLW9mZi1ieTog
S2VudCBSdXNzZWxsIDxrZW50LnJ1c3NlbGxAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFsZXggRGV1
Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVj
aGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzogc3RhYmxlQHZnZXIua2VybmVsLnJn
ClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2Zk
L2tmZF9kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYwpp
bmRleCA1YWJhNTBmNjNhYzZmLi45MzhkMDA1M2E4MjA4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRrZmQva2ZkX2RldmljZS5jCkBAIC0zMTAsNiArMzEwLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBrZmRfZGV2aWNlaWQgc3VwcG9ydGVkX2RldmljZXNbXSA9IHsKIAl7IDB4NjdDRiwgJnBvbGFy
aXMxMF9kZXZpY2VfaW5mbyB9LAkvKiBQb2xhcmlzMTAgKi8KIAl7IDB4NjdEMCwgJnBvbGFyaXMx
MF92Zl9kZXZpY2VfaW5mbyB9LAkvKiBQb2xhcmlzMTAgdmYqLwogCXsgMHg2N0RGLCAmcG9sYXJp
czEwX2RldmljZV9pbmZvIH0sCS8qIFBvbGFyaXMxMCAqLworCXsgMHg2RkRGLCAmcG9sYXJpczEw
X2RldmljZV9pbmZvIH0sCS8qIFBvbGFyaXMxMCAqLwogCXsgMHg2N0UwLCAmcG9sYXJpczExX2Rl
dmljZV9pbmZvIH0sCS8qIFBvbGFyaXMxMSAqLwogCXsgMHg2N0UxLCAmcG9sYXJpczExX2Rldmlj
ZV9pbmZvIH0sCS8qIFBvbGFyaXMxMSAqLwogCXsgMHg2N0UzLCAmcG9sYXJpczExX2RldmljZV9p
bmZvIH0sCS8qIFBvbGFyaXMxMSAqLwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
