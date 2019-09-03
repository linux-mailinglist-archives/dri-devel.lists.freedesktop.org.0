Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A04AA6E35
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 18:25:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C87BF89700;
	Tue,  3 Sep 2019 16:25:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5AD889704;
 Tue,  3 Sep 2019 16:25:38 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BFB692377D;
 Tue,  3 Sep 2019 16:25:37 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 009/167] drm/amdgpu/gfx9: Update gfx9 golden
 settings.
Date: Tue,  3 Sep 2019 12:22:41 -0400
Message-Id: <20190903162519.7136-9-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190903162519.7136-1-sashal@kernel.org>
References: <20190903162519.7136-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1567527938;
 bh=XlxNZltnNdt+6EtfyRaBtW3SLGlCNlWUzNKBkJGyq/M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SaY/pN1ZiAJlU8M2uM47SkfHk8jxx4hJgAqdtycNv+Y77a5Furqy3hLKY9svk2wRa
 1LnX+yJt05B6Z5D3bTDRyJ6P2j3indIBuYK10fDja9Vja9PMrHUmCi0HiXJRCmtyBP
 QWRDfiJlaaV2N6lIE9f1k60PIFY9Xo9dIdVVB2do=
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
Cc: Sasha Levin <sashal@kernel.org>, Feifei Xu <Feifei.Xu@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRmVpZmVpIFh1IDxGZWlmZWkuWHVAYW1kLmNvbT4KClsgVXBzdHJlYW0gY29tbWl0IDU0
ZDY4MmQ5YTViMzU3ZWI3MTE5OTRmYTk0ZWYxYmM0NGQ3Y2U5ZDkgXQoKVXBkYXRlIHRoZSBnb2xk
ZW5zZXR0aW5ncyBmb3IgdmVnYTIwLgoKU2lnbmVkLW9mZi1ieTogRmVpZmVpIFh1IDxGZWlmZWku
WHVAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4K
UmV2aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4KUmV2aWV3
ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KU2lnbmVkLW9m
Zi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpTaWduZWQtb2Zm
LWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2dmeF92OV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jCmlu
ZGV4IDQ2NTY4NDk3ZWYxODEuLmYwNDBlYzEwZWVjZjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZ2Z4X3Y5XzAuYwpAQCAtODIsNyArODIsNyBAQCBNT0RVTEVfRklSTVdBUkUoImFtZGdwdS9y
YXZlbl9ybGMuYmluIik7CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc29jMTVfcmVnX2dvbGRlbiBn
b2xkZW5fc2V0dGluZ3NfZ2NfOV8wW10gPQogewotCVNPQzE1X1JFR19HT0xERU5fVkFMVUUoR0Ms
IDAsIG1tREJfREVCVUcyLCAweGYwMGZmZmZmLCAweDAwMDAwNDIwKSwKKwlTT0MxNV9SRUdfR09M
REVOX1ZBTFVFKEdDLCAwLCBtbURCX0RFQlVHMiwgMHhmMDBmZmZmZiwgMHgwMDAwMDQwMCksCiAJ
U09DMTVfUkVHX0dPTERFTl9WQUxVRShHQywgMCwgbW1HQl9HUFVfSUQsIDB4MDAwMDAwMGYsIDB4
MDAwMDAwMDApLAogCVNPQzE1X1JFR19HT0xERU5fVkFMVUUoR0MsIDAsIG1tUEFfU0NfQklOTkVS
X0VWRU5UX0NOVExfMywgMHgwMDAwMDAwMywgMHg4MjQwMDAyNCksCiAJU09DMTVfUkVHX0dPTERF
Tl9WQUxVRShHQywgMCwgbW1QQV9TQ19FTkhBTkNFLCAweDNmZmZmZmZmLCAweDAwMDAwMDAxKSwK
LS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
