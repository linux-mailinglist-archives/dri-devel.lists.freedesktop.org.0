Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12070B251
	for <lists+dri-devel@lfdr.de>; Sat, 27 Apr 2019 03:40:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A4D689264;
	Sat, 27 Apr 2019 01:40:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 019B489272
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Apr 2019 01:40:03 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1297B20C01;
 Sat, 27 Apr 2019 01:40:02 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.0 55/79] drm/mediatek: fix the rate and divder of
 hdmi phy for MT2701
Date: Fri, 26 Apr 2019 21:38:14 -0400
Message-Id: <20190427013838.6596-55-sashal@kernel.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190427013838.6596-1-sashal@kernel.org>
References: <20190427013838.6596-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1556329203;
 bh=NCwoF7RpMP3K9FDSLeQAjDNsqLvFiV9zOfLGm7HZl1I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XA2bgg3GR/C0/1nAAhwp2rsgwwFP75wnCwM+OzqEB80NctcdR5qg/D3vEiUK04s3J
 yCke2SicXkXX5GfB7hgbFPL9cVCCUsUC1TtTnfhmX576fixh/2WZayZO0D7Q4dn8nd
 7RlHK5uPLBAMvVS55TCSq2gr0C31jQJ1frCcHMOo=
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
 Wangyan Wang <wangyan.wang@mediatek.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogV2FuZ3lhbiBXYW5nIDx3YW5neWFuLndhbmdAbWVkaWF0ZWsuY29tPgoKWyBVcHN0cmVh
bSBjb21taXQgMGMyNDYxM2NkYTE2M2RlZGZhMjI5YWZjOGVmZjYwNzJlNTdmYWM4ZCBdCgpEdWUg
dG8gYSBjbGVyaWNhbCBlcnJvcix0aGVyZSBpcyBvbmUgemVybyBsZXNzIGZvciAxMjgwMDAwMC4K
Rml4IGl0IGZvciAxMjgwMDAwMDAKRml4ZXM6IDBmYzcyMWIyOTY4ZSAoImRybS9tZWRpYXRlazog
YWRkIGhkbWkgZHJpdmVyIGZvciBNVDI3MDEgYW5kIE1UNzYyMyIpCgpTaWduZWQtb2ZmLWJ5OiBX
YW5neWFuIFdhbmcgPHdhbmd5YW4ud2FuZ0BtZWRpYXRlay5jb20+ClNpZ25lZC1vZmYtYnk6IENL
IEh1IDxjay5odUBtZWRpYXRlay5jb20+ClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNo
YWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX210MjcwMV9o
ZG1pX3BoeS5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfbXQy
NzAxX2hkbWlfcGh5LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX210MjcwMV9oZG1p
X3BoeS5jCmluZGV4IGZjYzQyZGM2ZWE3Zi4uMDc0NmZjODg3NzA2IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX210MjcwMV9oZG1pX3BoeS5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfbXQyNzAxX2hkbWlfcGh5LmMKQEAgLTExNiw4ICsxMTYsOCBA
QCBzdGF0aWMgaW50IG10a19oZG1pX3BsbF9zZXRfcmF0ZShzdHJ1Y3QgY2xrX2h3ICpodywgdW5z
aWduZWQgbG9uZyByYXRlLAogCiAJaWYgKHJhdGUgPD0gNjQwMDAwMDApCiAJCXBvc19kaXYgPSAz
OwotCWVsc2UgaWYgKHJhdGUgPD0gMTI4MDAwMDApCi0JCXBvc19kaXYgPSAxOworCWVsc2UgaWYg
KHJhdGUgPD0gMTI4MDAwMDAwKQorCQlwb3NfZGl2ID0gMjsKIAllbHNlCiAJCXBvc19kaXYgPSAx
OwogCi0tIAoyLjE5LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
