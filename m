Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B067F888
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 15:21:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED3476EE3D;
	Fri,  2 Aug 2019 13:21:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 051C56EE3D
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 13:21:23 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3F4BE21849;
 Fri,  2 Aug 2019 13:21:22 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 43/76] drm: silence variable 'conn' set but not
 used
Date: Fri,  2 Aug 2019 09:19:17 -0400
Message-Id: <20190802131951.11600-43-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190802131951.11600-1-sashal@kernel.org>
References: <20190802131951.11600-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1564752082;
 bh=tfCEAaZ/7wP7IyWf1wpi3ulEwPG2rgB//jXsv3f5eC4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OjjHyc4Xsh0LUSdZK2uXSM2L3Yz3mIpVS+KdJGYYDF7vcQNmDp/cFyzJuqoGhZ33k
 qStkfywsxo65kn52ymy/MrfaxvapY4hJzEAtEuErYRUp/afCi/HuhHMU3XMm9AGgRK
 VLhhUeLp8trzztoIptLXv9vkds7/PLEMeDR1a8nc=
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
Cc: Sasha Levin <sashal@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Qian Cai <cai@lca.pw>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUWlhbiBDYWkgPGNhaUBsY2EucHc+CgpbIFVwc3RyZWFtIGNvbW1pdCBiYmI2ZmM0M2Yx
MzFmNzdmY2I3YWU4MDgxZjZkN2M1MTM5NmEyMTIwIF0KClRoZSAic3RydWN0IGRybV9jb25uZWN0
b3IiIGl0ZXJhdGlvbiBjdXJzb3IgZnJvbQoiZm9yX2VhY2hfbmV3X2Nvbm5lY3Rvcl9pbl9zdGF0
ZSIgaXMgbmV2ZXIgdXNlZCBpbiBhdG9taWNfcmVtb3ZlX2ZiKCkKd2hpY2ggZ2VuZXJhdGVzIGEg
Y29tcGlsYXRpb24gd2FybmluZywKCmRyaXZlcnMvZ3B1L2RybS9kcm1fZnJhbWVidWZmZXIuYzog
SW4gZnVuY3Rpb24gJ2F0b21pY19yZW1vdmVfZmInOgpkcml2ZXJzL2dwdS9kcm0vZHJtX2ZyYW1l
YnVmZmVyLmM6ODM4OjI0OiB3YXJuaW5nOiB2YXJpYWJsZSAnY29ubicgc2V0CmJ1dCBub3QgdXNl
ZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KClNpbGVuY2UgaXQgYnkgbWFya2luZyAiY29u
biIgX19tYXliZV91bnVzZWQuCgpTaWduZWQtb2ZmLWJ5OiBRaWFuIENhaSA8Y2FpQGxjYS5wdz4K
U2lnbmVkLW9mZi1ieTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+Ckxpbms6IGh0
dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC9tc2dpZC8xNTYzODIyODg2LTEz
NTcwLTEtZ2l0LXNlbmQtZW1haWwtY2FpQGxjYS5wdwpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZp
biA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9mcmFtZWJ1ZmZl
ci5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9mcmFtZWJ1ZmZlci5jIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9mcmFtZWJ1ZmZlci5jCmluZGV4IGQ4ZDc1ZTI1ZjZmYjguLjQ1ZjZmMTFh
ODhhNzQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZnJhbWVidWZmZXIuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZyYW1lYnVmZmVyLmMKQEAgLTgzMCw3ICs4MzAsNyBAQCBz
dGF0aWMgaW50IGF0b21pY19yZW1vdmVfZmIoc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIpCiAJ
c3RydWN0IGRybV9kZXZpY2UgKmRldiA9IGZiLT5kZXY7CiAJc3RydWN0IGRybV9hdG9taWNfc3Rh
dGUgKnN0YXRlOwogCXN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lOwotCXN0cnVjdCBkcm1fY29ubmVj
dG9yICpjb25uOworCXN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uIF9fbWF5YmVfdW51c2VkOwog
CXN0cnVjdCBkcm1fY29ubmVjdG9yX3N0YXRlICpjb25uX3N0YXRlOwogCWludCBpLCByZXQ7CiAJ
dW5zaWduZWQgcGxhbmVfbWFzazsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
