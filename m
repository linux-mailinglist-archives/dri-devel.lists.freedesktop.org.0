Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8133E5AB6
	for <lists+dri-devel@lfdr.de>; Sat, 26 Oct 2019 15:17:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 631D36E077;
	Sat, 26 Oct 2019 13:17:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E13FD6E077;
 Sat, 26 Oct 2019 13:17:19 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 855AE2070B;
 Sat, 26 Oct 2019 13:17:18 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.3 39/99] drm/amdgpu/powerplay: fix typo in mvdd
 table setup
Date: Sat, 26 Oct 2019 09:15:00 -0400
Message-Id: <20191026131600.2507-39-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191026131600.2507-1-sashal@kernel.org>
References: <20191026131600.2507-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1572095839;
 bh=gulA3tNgyb2dUp3AmieLcpeoFl2ZtpI36NvZRc/TxS4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=juAJp1iajgIf9H7BQN9eg7L70fOtuTW3a34mHSqyoMMIdEXH3ATwrtXYEkXZYj+5t
 R0NFYfT1rOKKpAG8AEu2akyR09n1pBxbBhEQuBGbhtrElWicHbYrIHXRkGOf7mZldO
 WUJzdifJjR/SSXYvJRIPrEQAR7ocj3EvlYTnV/bA=
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 Robert Strube <rstrube@gmail.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgoKWyBVcHN0cmVh
bSBjb21taXQgNTk4YzMwZGJjYzk0MzQ3MDZmMjlhMDg1YThlYmE0NzMwNTczYmNjMiBdCgpQb2xh
cmlzIGFuZCB2ZWdhbSB1c2UgY291bnQgZm9yIHRoZSB2YWx1ZSByYXRoZXIgdGhhbgpsZXZlbC4g
IFRoaXMgbG9va3MgbGlrZSBhIGNvcHkgcGFzdGUgdHlwbyBmcm9tIHdoZW4KdGhlIGNvZGUgd2Fz
IGFkYXB0ZWQgZnJvbSBwcmV2aW91cyBhc2ljcy4KCkknbSBub3Qgc3VyZSB0aGF0IHRoZSBTTVUg
YWN0dWFsbHkgdXNlcyB0aGlzIHZhbHVlLCBzbwpJIGRvbid0IGtub3cgdGhhdCBpdCBhY3R1YWxs
eSBpcyBhIGJ1ZyBwZXIgc2UuCgpCdWc6IGh0dHBzOi8vYnVncy5mcmVlZGVza3RvcC5vcmcvc2hv
d19idWcuY2dpP2lkPTEwODYwOQpSZXBvcnRlZC1ieTogUm9iZXJ0IFN0cnViZSA8cnN0cnViZUBn
bWFpbC5jb20+ClJldmlld2VkLWJ5OiBFdmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClNpZ25l
ZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9zbXVtZ3IvcG9sYXJpczEwX3NtdW1nci5jIHwgMiArLQogZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211bWdyL3ZlZ2FtX3NtdW1nci5jICAgICB8IDIg
Ky0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdW1nci9wb2xhcmlzMTBf
c211bWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVtZ3IvcG9sYXJpczEw
X3NtdW1nci5jCmluZGV4IGRjNzU0NDQ3ZjBkZGMuLjIzYzEyMDE4ZGJjMTggMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdW1nci9wb2xhcmlzMTBfc211bWdyLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211bWdyL3BvbGFyaXMxMF9zbXVt
Z3IuYwpAQCAtNjU1LDcgKzY1NSw3IEBAIHN0YXRpYyBpbnQgcG9sYXJpczEwX3BvcHVsYXRlX3Nt
Y19tdmRkX3RhYmxlKHN0cnVjdCBwcF9od21nciAqaHdtZ3IsCiAJCQljb3VudCA9IFNNVV9NQVhf
U01JT19MRVZFTFM7CiAJCWZvciAobGV2ZWwgPSAwOyBsZXZlbCA8IGNvdW50OyBsZXZlbCsrKSB7
CiAJCQl0YWJsZS0+U21pb1RhYmxlMi5QYXR0ZXJuW2xldmVsXS5Wb2x0YWdlID0KLQkJCQlQUF9I
T1NUX1RPX1NNQ19VUyhkYXRhLT5tdmRkX3ZvbHRhZ2VfdGFibGUuZW50cmllc1tjb3VudF0udmFs
dWUgKiBWT0xUQUdFX1NDQUxFKTsKKwkJCQlQUF9IT1NUX1RPX1NNQ19VUyhkYXRhLT5tdmRkX3Zv
bHRhZ2VfdGFibGUuZW50cmllc1tsZXZlbF0udmFsdWUgKiBWT0xUQUdFX1NDQUxFKTsKIAkJCS8q
IEluZGV4IGludG8gRHBtVGFibGUuU21pby4gRHJpdmUgYml0cyBmcm9tIFNtaW8gZW50cnkgdG8g
Z2V0IHRoaXMgdm9sdGFnZSBsZXZlbC4qLwogCQkJdGFibGUtPlNtaW9UYWJsZTIuUGF0dGVyblts
ZXZlbF0uU21pbyA9CiAJCQkJKHVpbnQ4X3QpIGxldmVsOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvc211bWdyL3ZlZ2FtX3NtdW1nci5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvc211bWdyL3ZlZ2FtX3NtdW1nci5jCmluZGV4IDdjOTYwYjA3NzQ2
ZmQuLmFlMThmYmNiMjZmYjEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L3NtdW1nci92ZWdhbV9zbXVtZ3IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9zbXVtZ3IvdmVnYW1fc211bWdyLmMKQEAgLTQ1Niw3ICs0NTYsNyBAQCBzdGF0aWMgaW50
IHZlZ2FtX3BvcHVsYXRlX3NtY19tdmRkX3RhYmxlKHN0cnVjdCBwcF9od21nciAqaHdtZ3IsCiAJ
CQljb3VudCA9IFNNVV9NQVhfU01JT19MRVZFTFM7CiAJCWZvciAobGV2ZWwgPSAwOyBsZXZlbCA8
IGNvdW50OyBsZXZlbCsrKSB7CiAJCQl0YWJsZS0+U21pb1RhYmxlMi5QYXR0ZXJuW2xldmVsXS5W
b2x0YWdlID0gUFBfSE9TVF9UT19TTUNfVVMoCi0JCQkJCWRhdGEtPm12ZGRfdm9sdGFnZV90YWJs
ZS5lbnRyaWVzW2NvdW50XS52YWx1ZSAqIFZPTFRBR0VfU0NBTEUpOworCQkJCQlkYXRhLT5tdmRk
X3ZvbHRhZ2VfdGFibGUuZW50cmllc1tsZXZlbF0udmFsdWUgKiBWT0xUQUdFX1NDQUxFKTsKIAkJ
CS8qIEluZGV4IGludG8gRHBtVGFibGUuU21pby4gRHJpdmUgYml0cyBmcm9tIFNtaW8gZW50cnkg
dG8gZ2V0IHRoaXMgdm9sdGFnZSBsZXZlbC4qLwogCQkJdGFibGUtPlNtaW9UYWJsZTIuUGF0dGVy
bltsZXZlbF0uU21pbyA9CiAJCQkJKHVpbnQ4X3QpIGxldmVsOwotLSAKMi4yMC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
