Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7897E15DFF9
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 17:11:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 285996FA83;
	Fri, 14 Feb 2020 16:11:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 184046FA83;
 Fri, 14 Feb 2020 16:11:50 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0A919222C2;
 Fri, 14 Feb 2020 16:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581696709;
 bh=MKNm3DH+iFG/2MKS7mW0IPl2gpbcCAHThyKYruf9gXM=;
 h=From:To:Cc:Subject:Date:From;
 b=Z4Oh62ci8HZzM61xAIyouudBRbxEve7eXRxatUKe8UOM4Wo4XgP8mT5MuHfH4vbG9
 tu9GintuoQGixsUQRDO+U7HowWSMVU9DRpCvxcNOeTmG0Bx9giPuz6QmvQ4/+pwiAS
 F8Jr7IbNjqC87w1yqeQ46iIVAEzqa7gffkfrd7OU=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 001/252] drm/amdgpu: remove set but not used
 variable 'mc_shared_chmap' from 'gfx_v6_0.c' and 'gfx_v7_0.c'
Date: Fri, 14 Feb 2020 11:07:36 -0500
Message-Id: <20200214161147.15842-1-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
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

RnJvbTogeXUga3VhaSA8eXVrdWFpM0BodWF3ZWkuY29tPgoKWyBVcHN0cmVhbSBjb21taXQgNzQ3
YTM5N2QzOTRmYWMwMDAxZTRiM2MwM2Q3ZGNlM2ExMThhZjU2NyBdCgpGaXhlcyBnY2MgJy1XdW51
c2VkLWJ1dC1zZXQtdmFyaWFibGUnIHdhcm5pbmc6Cgpkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9nZnhfdjZfMC5jOiBJbiBmdW5jdGlvbgrigJhnZnhfdjZfMF9jb25zdGFudHNfaW5pdOKAmToK
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y2XzAuYzoxNTc5OjY6IHdhcm5pbmc6IHZh
cmlhYmxlCuKAmG1jX3NoYXJlZF9jaG1hcOKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1i
dXQtc2V0LXZhcmlhYmxlXQoKZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y3XzAuYzog
SW4gZnVuY3Rpb24K4oCYZ2Z4X3Y3XzBfZ3B1X2Vhcmx5X2luaXTigJk6CmRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2dmeF92N18wLmM6NDI2Mjo2OiB3YXJuaW5nOiB2YXJpYWJsZQrigJhtY19z
aGFyZWRfY2htYXDigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJs
ZV0KCkZpeGVzOiAyY2Q0NmFkMjIzODMgKCJkcm0vYW1kZ3B1OiBhZGQgZ3JhcGhpYyBwaXBlbGlu
ZSBpbXBsZW1lbnRhdGlvbiBmb3Igc2kgdjgiKQpGaXhlczogZDkzZjNjYTcwNmI4ICgiZHJtL2Ft
ZGdwdS9nZng3OiByZXdvcmsgZ3B1X2luaXQoKSIpClNpZ25lZC1vZmYtYnk6IHl1IGt1YWkgPHl1
a3VhaTNAaHVhd2VpLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIu
ZGV1Y2hlckBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5l
bC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y2XzAuYyB8IDMgKy0t
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjdfMC5jIHwgMyArLS0KIDIgZmlsZXMg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92Nl8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nZnhfdjZfMC5jCmluZGV4IGRlMTg0YTg4NjA1NzMuLjAxNjc1NmNlYzBkMTAgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92Nl8wLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y2XzAuYwpAQCAtMTU1NSw3ICsxNTU1LDcgQEAg
c3RhdGljIHZvaWQgZ2Z4X3Y2XzBfY29uZmlnX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYpCiBzdGF0aWMgdm9pZCBnZnhfdjZfMF9ncHVfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldikKIHsKIAl1MzIgZ2JfYWRkcl9jb25maWcgPSAwOwotCXUzMiBtY19zaGFyZWRfY2htYXAs
IG1jX2FyYl9yYW1jZmc7CisJdTMyIG1jX2FyYl9yYW1jZmc7CiAJdTMyIHN4X2RlYnVnXzE7CiAJ
dTMyIGhkcF9ob3N0X3BhdGhfY250bDsKIAl1MzIgdG1wOwpAQCAtMTY1Nyw3ICsxNjU3LDYgQEAg
c3RhdGljIHZvaWQgZ2Z4X3Y2XzBfZ3B1X2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYp
CiAKIAlXUkVHMzIobW1CSUZfRkJfRU4sIEJJRl9GQl9FTl9fRkJfUkVBRF9FTl9NQVNLIHwgQklG
X0ZCX0VOX19GQl9XUklURV9FTl9NQVNLKTsKIAotCW1jX3NoYXJlZF9jaG1hcCA9IFJSRUczMiht
bU1DX1NIQVJFRF9DSE1BUCk7CiAJYWRldi0+Z2Z4LmNvbmZpZy5tY19hcmJfcmFtY2ZnID0gUlJF
RzMyKG1tTUNfQVJCX1JBTUNGRyk7CiAJbWNfYXJiX3JhbWNmZyA9IGFkZXYtPmdmeC5jb25maWcu
bWNfYXJiX3JhbWNmZzsKIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Z2Z4X3Y3XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92N18wLmMKaW5kZXgg
OTU0NTJjNWE5ZGY2ZS4uOGJkY2M0YTY2NTVhZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ2Z4X3Y3XzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9n
ZnhfdjdfMC5jCkBAIC00MzIzLDcgKzQzMjMsNyBAQCBzdGF0aWMgaW50IGdmeF92N18wX2xhdGVf
aW5pdCh2b2lkICpoYW5kbGUpCiBzdGF0aWMgdm9pZCBnZnhfdjdfMF9ncHVfZWFybHlfaW5pdChz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIHsKIAl1MzIgZ2JfYWRkcl9jb25maWc7Ci0JdTMy
IG1jX3NoYXJlZF9jaG1hcCwgbWNfYXJiX3JhbWNmZzsKKwl1MzIgbWNfYXJiX3JhbWNmZzsKIAl1
MzIgZGltbTAwX2FkZHJfbWFwLCBkaW1tMDFfYWRkcl9tYXAsIGRpbW0xMF9hZGRyX21hcCwgZGlt
bTExX2FkZHJfbWFwOwogCXUzMiB0bXA7CiAKQEAgLTQ0MDAsNyArNDQwMCw2IEBAIHN0YXRpYyB2
b2lkIGdmeF92N18wX2dwdV9lYXJseV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQog
CQlicmVhazsKIAl9CiAKLQltY19zaGFyZWRfY2htYXAgPSBSUkVHMzIobW1NQ19TSEFSRURfQ0hN
QVApOwogCWFkZXYtPmdmeC5jb25maWcubWNfYXJiX3JhbWNmZyA9IFJSRUczMihtbU1DX0FSQl9S
QU1DRkcpOwogCW1jX2FyYl9yYW1jZmcgPSBhZGV2LT5nZnguY29uZmlnLm1jX2FyYl9yYW1jZmc7
CiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
