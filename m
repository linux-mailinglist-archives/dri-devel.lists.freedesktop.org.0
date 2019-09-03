Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2DBA6E37
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 18:25:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4DF089711;
	Tue,  3 Sep 2019 16:25:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0514089711;
 Tue,  3 Sep 2019 16:25:42 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0FF1623717;
 Tue,  3 Sep 2019 16:25:40 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 010/167] drm/amdgpu: Update gc_9_0 golden
 settings.
Date: Tue,  3 Sep 2019 12:22:42 -0400
Message-Id: <20190903162519.7136-10-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190903162519.7136-1-sashal@kernel.org>
References: <20190903162519.7136-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1567527941;
 bh=OUB517hQEW/tE8hx4gcYRH+OGx2V43iRvpIem4nJ9Lg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=0yhf0y6bvE9AQBwQd1mkGSfVqZBrgetbuF8BpEgY6MfJub/jSlMTSxyXY8vEi6rft
 0xTsbsjmgEX14Pd/T6DNzY92j+jzyj1n5rTq/Ts5DVSxTjX+rVq6iZTElFXE6iMz5T
 Fh5QJyow9zprFEvNQNsNaz06ssiOPIkCTLG05OPc=
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
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRmVpZmVpIFh1IDxGZWlmZWkuWHVAYW1kLmNvbT4KClsgVXBzdHJlYW0gY29tbWl0IGM1
NTA0NWFkZjcyMTBkMjQ2YTAxNmM5NjE5MTZmMDc4ZWQzMWE5NTEgXQoKQWRkIG1tREJfREVCVUcz
IHNldHRpbmdzLgoKU2lnbmVkLW9mZi1ieTogRmVpZmVpIFh1IDxGZWlmZWkuWHVAYW1kLmNvbT4K
UmV2aWV3ZWQtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6
IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6IHN0YWJsZUB2Z2Vy
Lmtlcm5lbC5vcmcKU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3Jn
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMgfCAxICsKIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dmeF92OV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlf
MC5jCmluZGV4IGYwNDBlYzEwZWVjZjYuLjc4MjQxMTY0OTgxNjkgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ2Z4X3Y5XzAuYwpAQCAtODMsNiArODMsNyBAQCBNT0RVTEVfRklSTVdBUkUoImFt
ZGdwdS9yYXZlbl9ybGMuYmluIik7CiBzdGF0aWMgY29uc3Qgc3RydWN0IHNvYzE1X3JlZ19nb2xk
ZW4gZ29sZGVuX3NldHRpbmdzX2djXzlfMFtdID0KIHsKIAlTT0MxNV9SRUdfR09MREVOX1ZBTFVF
KEdDLCAwLCBtbURCX0RFQlVHMiwgMHhmMDBmZmZmZiwgMHgwMDAwMDQwMCksCisJU09DMTVfUkVH
X0dPTERFTl9WQUxVRShHQywgMCwgbW1EQl9ERUJVRzMsIDB4ODAwMDAwMDAsIDB4ODAwMDAwMDAp
LAogCVNPQzE1X1JFR19HT0xERU5fVkFMVUUoR0MsIDAsIG1tR0JfR1BVX0lELCAweDAwMDAwMDBm
LCAweDAwMDAwMDAwKSwKIAlTT0MxNV9SRUdfR09MREVOX1ZBTFVFKEdDLCAwLCBtbVBBX1NDX0JJ
Tk5FUl9FVkVOVF9DTlRMXzMsIDB4MDAwMDAwMDMsIDB4ODI0MDAwMjQpLAogCVNPQzE1X1JFR19H
T0xERU5fVkFMVUUoR0MsIDAsIG1tUEFfU0NfRU5IQU5DRSwgMHgzZmZmZmZmZiwgMHgwMDAwMDAw
MSksCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
