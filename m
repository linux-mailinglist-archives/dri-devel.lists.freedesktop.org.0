Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C230F15E143
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 17:18:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D2516E837;
	Fri, 14 Feb 2020 16:18:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0CA26FAD9;
 Fri, 14 Feb 2020 16:18:17 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 16D002470A;
 Fri, 14 Feb 2020 16:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581697097;
 bh=P9jEKKyfNmkT4yHp4U4ESLCvkX7RR/kRv7QnsR0c6rM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Gu3NwdcnbfkmM4NZERzoHDvewcWRsoKeHKQAniNI0hbK/IfruewdRhC9cQNlqj949
 AngmZNs7zy2sGSPZAJk41f63qIK/LUodQQgBwv2NILWJPk07p1KLK3A4mCg+bKxZkC
 nROzsA5M2cehAIq8G+5nyjwQurcp2vDPsYB6ekXw=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 048/186] drm/amdgpu: remove set but not used
 variable 'dig'
Date: Fri, 14 Feb 2020 11:14:57 -0500
Message-Id: <20200214161715.18113-48-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214161715.18113-1-sashal@kernel.org>
References: <20200214161715.18113-1-sashal@kernel.org>
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

RnJvbTogeXUga3VhaSA8eXVrdWFpM0BodWF3ZWkuY29tPgoKWyBVcHN0cmVhbSBjb21taXQgZDFk
MDlkYzQxNzgyNmY1YTk4M2UwZjRmMjEyZjIyN2JlZWI2NWUyOSBdCgpGaXhlcyBnY2MgJy1XdW51
c2VkLWJ1dC1zZXQtdmFyaWFibGUnIHdhcm5pbmc6Cgpkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hdG9tYmlvc19kcC5jOiBJbiBmdW5jdGlvbgrigJhhbWRncHVfYXRvbWJpb3NfZHBfbGlua190
cmFpbuKAmToKZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYXRvbWJpb3NfZHAuYzo3MTY6MzQ6
IHdhcm5pbmc6IHZhcmlhYmxlIOKAmGRpZ+KAmQpzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1i
dXQtc2V0LXZhcmlhYmxlXQoKRml4ZXM6IGQzOGNlYWY5OWVkMCAoImRybS9hbWRncHU6IGFkZCBj
b3JlIGRyaXZlciAodjQpIikKU2lnbmVkLW9mZi1ieTogeXUga3VhaSA8eXVrdWFpM0BodWF3ZWku
Y29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+ClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hdG9tYmlvc19kcC5jIHwgMiAtLQogMSBmaWxlIGNo
YW5nZWQsIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYXRvbWJpb3NfZHAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2F0b21iaW9z
X2RwLmMKaW5kZXggZDcxMmRlZTg5MjU0NS4uOGFiZTliZWFiMDM0MyAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYXRvbWJpb3NfZHAuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hdG9tYmlvc19kcC5jCkBAIC03MTAsNyArNzEwLDYgQEAgdm9pZCBhbWRn
cHVfYXRvbWJpb3NfZHBfbGlua190cmFpbihzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIsCiAJ
c3RydWN0IGRybV9kZXZpY2UgKmRldiA9IGVuY29kZXItPmRldjsKIAlzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldiA9IGRldi0+ZGV2X3ByaXZhdGU7CiAJc3RydWN0IGFtZGdwdV9lbmNvZGVyICph
bWRncHVfZW5jb2RlciA9IHRvX2FtZGdwdV9lbmNvZGVyKGVuY29kZXIpOwotCXN0cnVjdCBhbWRn
cHVfZW5jb2Rlcl9hdG9tX2RpZyAqZGlnOwogCXN0cnVjdCBhbWRncHVfY29ubmVjdG9yICphbWRn
cHVfY29ubmVjdG9yOwogCXN0cnVjdCBhbWRncHVfY29ubmVjdG9yX2F0b21fZGlnICpkaWdfY29u
bmVjdG9yOwogCXN0cnVjdCBhbWRncHVfYXRvbWJpb3NfZHBfbGlua190cmFpbl9pbmZvIGRwX2lu
Zm87CkBAIC03MTgsNyArNzE3LDYgQEAgdm9pZCBhbWRncHVfYXRvbWJpb3NfZHBfbGlua190cmFp
bihzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIsCiAKIAlpZiAoIWFtZGdwdV9lbmNvZGVyLT5l
bmNfcHJpdikKIAkJcmV0dXJuOwotCWRpZyA9IGFtZGdwdV9lbmNvZGVyLT5lbmNfcHJpdjsKIAog
CWFtZGdwdV9jb25uZWN0b3IgPSB0b19hbWRncHVfY29ubmVjdG9yKGNvbm5lY3Rvcik7CiAJaWYg
KCFhbWRncHVfY29ubmVjdG9yLT5jb25fcHJpdikKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
