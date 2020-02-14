Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4082C15E213
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 17:22:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 243676FB0D;
	Fri, 14 Feb 2020 16:22:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A56B6FB09;
 Fri, 14 Feb 2020 16:22:07 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4CF48246D8;
 Fri, 14 Feb 2020 16:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581697327;
 bh=FcvBkKpzEgcoIU2wYmSoYkgz1dx3PGPVxKSmKX7uaaA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pfv3GFDjRAbHVAFQj6jBUhzX9MdPyDKcjUQjRjh34cgyC1EiwHyY+xAcq+QwB8kLW
 stJ4A/idyWW7Qqtq1IpIJ/PSMbfFHqm/PYbWg21VBqbXhnlyYLsfzkASQPFw6OBGJ4
 Up0Cjn1pFxHlyE0WCD9GzVRWlshHeA2glbLZRQDo=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 035/141] drm/amdgpu: remove always false
 comparison in 'amdgpu_atombios_i2c_process_i2c_ch'
Date: Fri, 14 Feb 2020 11:19:35 -0500
Message-Id: <20200214162122.19794-35-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214162122.19794-1-sashal@kernel.org>
References: <20200214162122.19794-1-sashal@kernel.org>
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

RnJvbTogeXUga3VhaSA8eXVrdWFpM0BodWF3ZWkuY29tPgoKWyBVcHN0cmVhbSBjb21taXQgMjIw
YWM4ZDE0NDQwNTRhZGUwN2NlMTQ0OThmY2RhMjY2NDEwZjkwZSBdCgpGaXhlcyBnY2MgJy1XdHlw
ZS1saW1pdHMnIHdhcm5pbmc6Cgpkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hdG9tYmlvc19p
MmMuYzogSW4gZnVuY3Rpb24K4oCYYW1kZ3B1X2F0b21iaW9zX2kyY19wcm9jZXNzX2kyY19jaOKA
mToKZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYXRvbWJpb3NfaTJjLmM6Nzk6MTE6IHdhcm5p
bmc6IGNvbXBhcmlzb24gaXMKYWx3YXlzIGZhbHNlIGR1ZSB0byBsaW1pdGVkIHJhbmdlIG9mIGRh
dGEgdHlwZSBbLVd0eXBlLWxpbWl0c10KCidudW0nIGlzICd1OCcsIHNvIGl0IHdpbGwgbmV2ZXIg
YmUgZ3JlYXRlciB0aGFuICdUT01fTUFYX0hXX0kyQ19SRUFEJywKd2hpY2ggaXMgZGVmaW5lZCBh
cyAyNTUuIFRoZXJlZm9yZSwgdGhlIGNvbXBhcmlzb24gY2FuIGJlIHJlbW92ZWQuCgpGaXhlczog
ZDM4Y2VhZjk5ZWQwICgiZHJtL2FtZGdwdTogYWRkIGNvcmUgZHJpdmVyICh2NCkiKQpTaWduZWQt
b2ZmLWJ5OiB5dSBrdWFpIDx5dWt1YWkzQGh1YXdlaS5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXgg
RGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogU2FzaGEg
TGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2F0b21iaW9zX2kyYy5jIHwgNSAtLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYXRvbWJpb3NfaTJjLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hdG9tYmlvc19pMmMuYwppbmRleCBiMzc0NjUz
YmQ2Y2YzLi43NDFiZDFlNTI2OTliIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hdG9tYmlvc19pMmMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hdG9t
Ymlvc19pMmMuYwpAQCAtNjksMTEgKzY5LDYgQEAgc3RhdGljIGludCBhbWRncHVfYXRvbWJpb3Nf
aTJjX3Byb2Nlc3NfaTJjX2NoKHN0cnVjdCBhbWRncHVfaTJjX2NoYW4gKmNoYW4sCiAJCQltZW1j
cHkoJm91dCwgJmJ1ZlsxXSwgbnVtKTsKIAkJYXJncy5scEkyQ0RhdGFPdXQgPSBjcHVfdG9fbGUx
NihvdXQpOwogCX0gZWxzZSB7Ci0JCWlmIChudW0gPiBBVE9NX01BWF9IV19JMkNfUkVBRCkgewot
CQkJRFJNX0VSUk9SKCJodyBpMmM6IHRyaWVkIHRvIHJlYWQgdG9vIG1hbnkgYnl0ZXMgKCVkIHZz
IDI1NSlcbiIsIG51bSk7Ci0JCQlyID0gLUVJTlZBTDsKLQkJCWdvdG8gZG9uZTsKLQkJfQogCQlh
cmdzLnVjUmVnSW5kZXggPSAwOwogCQlhcmdzLmxwSTJDRGF0YU91dCA9IDA7CiAJfQotLSAKMi4y
MC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
