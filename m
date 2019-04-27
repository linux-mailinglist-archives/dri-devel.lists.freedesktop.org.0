Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCBFB244
	for <lists+dri-devel@lfdr.de>; Sat, 27 Apr 2019 03:39:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 551BD8925D;
	Sat, 27 Apr 2019 01:39:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB3728925E;
 Sat, 27 Apr 2019 01:39:38 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EB04D208CB;
 Sat, 27 Apr 2019 01:39:37 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.0 39/79] drm/amdgpu: Adjust IB test timeout for XGMI
 configuration
Date: Fri, 26 Apr 2019 21:37:58 -0400
Message-Id: <20190427013838.6596-39-sashal@kernel.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190427013838.6596-1-sashal@kernel.org>
References: <20190427013838.6596-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1556329178;
 bh=9AZLEdLkfGIReOI+caS4tlJWi91R1zceF+UVuzV08tg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bKlPTuuwM9qggAeNRAixRqWrKHE6dLP+1y9wKx6D/NkEFp1gnZ7c+O1XFqwSNDaSO
 KyT7McJZrMf8WRf7SBKZ+bXIhq4Ji2SDn53d06MBSHJ9I21shSovSmZPyR/azpQ8/p
 KGYtBtTT8e6Hh1MRw69Ne34fnI6ITZsQWuXC7B3w=
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 shaoyunl <shaoyun.liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogc2hhb3l1bmwgPHNoYW95dW4ubGl1QGFtZC5jb20+CgpbIFVwc3RyZWFtIGNvbW1pdCBk
NDE2MmM2MWUyNTMxNzc5MzZmY2ZlNmMyOWY3YjIyNGQ5YTFlZmI4IF0KCk9uIFhHTUkgY29uZmln
dXJhdGlvbiB0aGUgaWIgdGVzdCBtYXkgdGFrZSBsb25nZXIgdG8gZmluaXNoCgpTaWduZWQtb2Zm
LWJ5OiBzaGFveXVubCA8c2hhb3l1bi5saXVAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IENocmlzdGlh
biBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBE
ZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBM
ZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2liLmMgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pYi5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2liLmMKaW5kZXggYzQ4MjA3YjM3N2JjLi5iODJj
NWZjYTIxN2IgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9p
Yi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pYi5jCkBAIC0zNSw2
ICszNSw3IEBACiAjaW5jbHVkZSAiYW1kZ3B1X3RyYWNlLmgiCiAKICNkZWZpbmUgQU1ER1BVX0lC
X1RFU1RfVElNRU9VVAltc2Vjc190b19qaWZmaWVzKDEwMDApCisjZGVmaW5lIEFNREdQVV9JQl9U
RVNUX0dGWF9YR01JX1RJTUVPVVQJbXNlY3NfdG9famlmZmllcygyMDAwKQogCiAvKgogICogSUIK
QEAgLTM0NCw2ICszNDUsOCBAQCBpbnQgYW1kZ3B1X2liX3JpbmdfdGVzdHMoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYpCiAJCSAqIGNvc3Qgd2FpdGluZyBmb3IgaXQgY29taW5nIGJhY2sgdW5k
ZXIgUlVOVElNRSBvbmx5CiAJCSovCiAJCXRtb19nZnggPSA4ICogQU1ER1BVX0lCX1RFU1RfVElN
RU9VVDsKKwl9IGVsc2UgaWYgKGFkZXYtPmdtYy54Z21pLmhpdmVfaWQpIHsKKwkJdG1vX2dmeCA9
IEFNREdQVV9JQl9URVNUX0dGWF9YR01JX1RJTUVPVVQ7CiAJfQogCiAJZm9yIChpID0gMDsgaSA8
IGFkZXYtPm51bV9yaW5nczsgKytpKSB7Ci0tIAoyLjE5LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
