Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB44159B0
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 07:40:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75A9789D4F;
	Tue,  7 May 2019 05:40:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCDAD89D5C;
 Tue,  7 May 2019 05:40:11 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CC0DA20B7C;
 Tue,  7 May 2019 05:40:10 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 55/95] drm/i915: Downgrade Gen9 Plane WM latency
 error
Date: Tue,  7 May 2019 01:37:44 -0400
Message-Id: <20190507053826.31622-55-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190507053826.31622-1-sashal@kernel.org>
References: <20190507053826.31622-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1557207611;
 bh=HeUEZ4EShkEDGQAY7rwzP+ZLsb5wZJcbmnVnt73gLow=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SeGZPjJHMW7Ehi4/0hwbjnWFIEIy9HLKjxkh/wCe9TztuUle/iiQSafqz9WKjejqB
 56YAHMp5TYdKvvLd60OkU0RF64icVsrH2Sz3nHf4wM+pta7DGYoEbIt0fAIXusgJ6c
 lh5W5db25aQZznMPihUh+b4tIWKlPZqY2oSj9Vt0=
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Sasha Levin <alexander.levin@microsoft.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+CgpbIFVwc3RyZWFt
IGNvbW1pdCA4NmMxYzg3ZDBlNjI0MWNiZTM1YmQ1MmJhZGZjODRiMTU0ZTFiOTU5IF0KCkFjY29y
ZGluZyB0byBpbnRlbF9yZWFkX3dtX2xhdGVuY3koKSBpdCBpcyBwZXJmZWN0bHkgbGVnYWwgZm9y
IG9uZSBXTQphbmQgYWxsIHN1YnNlcXVlbnQgbGV2ZWxzIHRvIGJlIDAgKGFuZCB0aGUgZGVlcGVy
IHBvd2Vyc2F2aW5nIHN0YXRlcwpkaXNhYmxlZCksIHNvIGRvbid0IHNob3V0ICpFUlJPUiosIG92
ZXIgYW5kIG92ZXIgYWdhaW4uCgpTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNo
cmlzLXdpbHNvbi5jby51az4KQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3Jz
dEBsaW51eC5pbnRlbC5jb20+CkNjOiBWaWxsZSBTeXJqYWxhIDx2aWxsZS5zeXJqYWxhQGxpbnV4
LmludGVsLmNvbT4KQWNrZWQtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3Jz
dEBsaW51eC5pbnRlbC5jb20+Ckxpbms6IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9y
Zy9wYXRjaC9tc2dpZC8yMDE4MDcyNjE2MTUyNy4xMDUxNi0xLWNocmlzQGNocmlzLXdpbHNvbi5j
by51awpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8YWxleGFuZGVyLmxldmluQG1pY3Jvc29m
dC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfcG0uYyB8IDQgKystLQogMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9wbS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
aW50ZWxfcG0uYwppbmRleCA5NmE1MjM3NzQxZTAuLmNiMzc3YjAwMzMyMSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfcG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9pbnRlbF9wbS5jCkBAIC0yOTM0LDggKzI5MzQsOCBAQCBzdGF0aWMgdm9pZCBpbnRlbF9wcmlu
dF93bV9sYXRlbmN5KHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdiwKIAkJdW5zaWdu
ZWQgaW50IGxhdGVuY3kgPSB3bVtsZXZlbF07CiAKIAkJaWYgKGxhdGVuY3kgPT0gMCkgewotCQkJ
RFJNX0VSUk9SKCIlcyBXTSVkIGxhdGVuY3kgbm90IHByb3ZpZGVkXG4iLAotCQkJCSAgbmFtZSwg
bGV2ZWwpOworCQkJRFJNX0RFQlVHX0tNUygiJXMgV00lZCBsYXRlbmN5IG5vdCBwcm92aWRlZFxu
IiwKKwkJCQkgICAgICBuYW1lLCBsZXZlbCk7CiAJCQljb250aW51ZTsKIAkJfQogCi0tIAoyLjIw
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
