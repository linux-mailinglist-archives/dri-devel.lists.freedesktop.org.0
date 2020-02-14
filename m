Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7D215E038
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 17:13:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AC7A6FA96;
	Fri, 14 Feb 2020 16:13:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D0786FA97;
 Fri, 14 Feb 2020 16:13:06 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1D6DE2469F;
 Fri, 14 Feb 2020 16:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581696785;
 bh=oXto1Jy1Hz0pYiNQMzQhCG7uLEsa9omy0lSjRgjVriw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=U6Hf+rfHJgTbd8jGwAplXNyr1/gVmo6TQncG9cZPjCoN/PsmmdNBt9SYLm7HdiscA
 teAgsXbAWb0lfhksW9+XD3QCOiHqI+Y0mzCeSCQdlaEM+3e+CCzyM+MPRPjSQS/8Hm
 DFIAo99TXrzUWbXC5S9KzaFujmaFYcCXkeNLG+GQ=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 061/252] drm/amdgpu: remove set but not used
 variable 'invalid'
Date: Fri, 14 Feb 2020 11:08:36 -0500
Message-Id: <20200214161147.15842-61-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214161147.15842-1-sashal@kernel.org>
References: <20200214161147.15842-1-sashal@kernel.org>
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

RnJvbTogeXUga3VhaSA8eXVrdWFpM0BodWF3ZWkuY29tPgoKWyBVcHN0cmVhbSBjb21taXQgOWUw
ODlhMjljNjk2ZDg2ZDI2ZTc5NzM3YmFmYmNlOTQ3MzhmYjQ2MiBdCgpGaXhlcyBnY2MgJy1XdW51
c2VkLWJ1dC1zZXQtdmFyaWFibGUnIHdhcm5pbmc6Cgpkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfYW1ka2ZkX2dwdXZtLmM6IEluIGZ1bmN0aW9uCuKAmGFtZGdwdV9hbWRrZmRfZXZp
Y3RfdXNlcnB0cuKAmToKZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9n
cHV2bS5jOjE2NjU6Njogd2FybmluZzoKdmFyaWFibGUg4oCYaW52YWxpZOKAmSBzZXQgYnV0IG5v
dCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQoKJ2ludmFsaWQnIGlzIG5ldmVyIHVz
ZWQsIHNvIGNhbiBiZSByZW1vdmVkLiBUaHVzICdhdG9taWNfaW5jX3JldHVybicKY2FuIGJlIHJl
cGxhY2VkIGFzICdhdG9taWNfaW5jJwoKRml4ZXM6IDVhZTAyODNlODMxYSAoImRybS9hbWRncHU6
IEFkZCB1c2VycHRyIHN1cHBvcnQgZm9yIEtGRCIpClNpZ25lZC1vZmYtYnk6IHl1IGt1YWkgPHl1
a3VhaTNAaHVhd2VpLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIu
ZGV1Y2hlckBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5l
bC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2
bS5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRr
ZmRfZ3B1dm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1
dm0uYwppbmRleCBmOTI1OTdjMjkyZmU1Li4zNzBiZGY1MDg3MjkxIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jCkBAIC0xNjM5LDEwICsx
NjM5LDEwIEBAIGludCBhbWRncHVfYW1ka2ZkX2V2aWN0X3VzZXJwdHIoc3RydWN0IGtnZF9tZW0g
Km1lbSwKIAkJCQlzdHJ1Y3QgbW1fc3RydWN0ICptbSkKIHsKIAlzdHJ1Y3QgYW1ka2ZkX3Byb2Nl
c3NfaW5mbyAqcHJvY2Vzc19pbmZvID0gbWVtLT5wcm9jZXNzX2luZm87Ci0JaW50IGludmFsaWQs
IGV2aWN0ZWRfYm9zOworCWludCBldmljdGVkX2JvczsKIAlpbnQgciA9IDA7CiAKLQlpbnZhbGlk
ID0gYXRvbWljX2luY19yZXR1cm4oJm1lbS0+aW52YWxpZCk7CisJYXRvbWljX2luYygmbWVtLT5p
bnZhbGlkKTsKIAlldmljdGVkX2JvcyA9IGF0b21pY19pbmNfcmV0dXJuKCZwcm9jZXNzX2luZm8t
PmV2aWN0ZWRfYm9zKTsKIAlpZiAoZXZpY3RlZF9ib3MgPT0gMSkgewogCQkvKiBGaXJzdCBldmlj
dGlvbiwgc3RvcCB0aGUgcXVldWVzICovCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
