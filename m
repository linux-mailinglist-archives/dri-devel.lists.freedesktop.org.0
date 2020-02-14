Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BE915DBF7
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 16:52:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1AE86F98F;
	Fri, 14 Feb 2020 15:51:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8522B6F98E;
 Fri, 14 Feb 2020 15:51:57 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8EFE524689;
 Fri, 14 Feb 2020 15:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581695517;
 bh=qcz1N3Pxz32hez9lVmIpbu5HIiP8U/84EYKBiKmaBeI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=y93NtHKK+Y2v0+H/QhAz1REXHnP8reZk49hvuYdnfUmHrfR4DQXUunJLYPiyM2tcu
 mlyuM4RxulqvDIR7yojxXWnh3squIT+sG6i2BM/z/IJaAOBeFnh3SsHr5rHnVy8znh
 lEc4hUQY4qlsFh6QT208uBXjgmTJHlPYevI9eeR0=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.5 140/542] drm/amdgpu: remove set but not used
 variable 'dig_connector'
Date: Fri, 14 Feb 2020 10:42:12 -0500
Message-Id: <20200214154854.6746-140-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214154854.6746-1-sashal@kernel.org>
References: <20200214154854.6746-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Alex Deucher <alexander.deucher@amd.com>, yu kuai <yukuai3@huawei.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogeXUga3VhaSA8eXVrdWFpM0BodWF3ZWkuY29tPgoKWyBVcHN0cmVhbSBjb21taXQgNWJl
YTdmZWRiN2ZlNGQ1ZTZkM2JhOWYzODVkZDM2MTlmYjAwNGNlNyBdCgpGaXhlcyBnY2MgJy1XdW51
c2VkLWJ1dC1zZXQtdmFyaWFibGUnIHdhcm5pbmc6Cgpkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hdG9tYmlvc19kcC5jOiBJbiBmdW5jdGlvbgrigJhhbWRncHVfYXRvbWJpb3NfZHBfZ2V0X3Bh
bmVsX21vZGXigJk6CmRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2F0b21iaW9zX2RwLmM6MzY0
OjM2OiB3YXJuaW5nOiB2YXJpYWJsZQrigJhkaWdfY29ubmVjdG9y4oCZIHNldCBidXQgbm90IHVz
ZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCgpJdCBpcyBuZXZlciB1c2VkLCBzbyBjYW4g
YmUgcmVtb3ZlZC4KCkZpeGVzOiBkMzhjZWFmOTllZDAgKCJkcm0vYW1kZ3B1OiBhZGQgY29yZSBk
cml2ZXIgKHY0KSIpClNpZ25lZC1vZmYtYnk6IHl1IGt1YWkgPHl1a3VhaTNAaHVhd2VpLmNvbT4K
U2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpT
aWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYXRvbWJpb3NfZHAuYyB8IDMgLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hdG9tYmlvc19kcC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYXRvbWJpb3NfZHAu
YwppbmRleCA2ODU4Y2RlOWZjNWQzLi45NDI2NTMwNmFiMTFmIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hdG9tYmlvc19kcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2F0b21iaW9zX2RwLmMKQEAgLTM2MSw3ICszNjEsNiBAQCBpbnQgYW1kZ3B1X2F0
b21iaW9zX2RwX2dldF9wYW5lbF9tb2RlKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciwKIAkJ
CSAgICAgICBzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQogewogCXN0cnVjdCBhbWRn
cHVfY29ubmVjdG9yICphbWRncHVfY29ubmVjdG9yID0gdG9fYW1kZ3B1X2Nvbm5lY3Rvcihjb25u
ZWN0b3IpOwotCXN0cnVjdCBhbWRncHVfY29ubmVjdG9yX2F0b21fZGlnICpkaWdfY29ubmVjdG9y
OwogCWludCBwYW5lbF9tb2RlID0gRFBfUEFORUxfTU9ERV9FWFRFUk5BTF9EUF9NT0RFOwogCXUx
NiBkcF9icmlkZ2UgPSBhbWRncHVfY29ubmVjdG9yX2VuY29kZXJfZ2V0X2RwX2JyaWRnZV9lbmNv
ZGVyX2lkKGNvbm5lY3Rvcik7CiAJdTggdG1wOwpAQCAtMzY5LDggKzM2OCw2IEBAIGludCBhbWRn
cHVfYXRvbWJpb3NfZHBfZ2V0X3BhbmVsX21vZGUoc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVy
LAogCWlmICghYW1kZ3B1X2Nvbm5lY3Rvci0+Y29uX3ByaXYpCiAJCXJldHVybiBwYW5lbF9tb2Rl
OwogCi0JZGlnX2Nvbm5lY3RvciA9IGFtZGdwdV9jb25uZWN0b3ItPmNvbl9wcml2OwotCiAJaWYg
KGRwX2JyaWRnZSAhPSBFTkNPREVSX09CSkVDVF9JRF9OT05FKSB7CiAJCS8qIERQIGJyaWRnZSBj
aGlwcyAqLwogCQlpZiAoZHJtX2RwX2RwY2RfcmVhZGIoJmFtZGdwdV9jb25uZWN0b3ItPmRkY19i
dXMtPmF1eCwKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
