Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F374240DEB
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 21:12:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36F166E1CD;
	Mon, 10 Aug 2020 19:12:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C02A46E448;
 Mon, 10 Aug 2020 19:12:27 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A978622BEB;
 Mon, 10 Aug 2020 19:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597086747;
 bh=JWAfkfYeNpyvQQn7ChNaZq+27MlhnSQL1lGDK0L33lA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=2OfpuA7NmEcRyguChjnyxac5e5FkyjJ8wc3S2/0v5O7eCeBipMRzTm1Nq4GYNuojk
 NpWVRcnBLKeWPfkl8Ti1AJVqHuAn5HbrDXd6I0Y3XZFi4bc/x1woHeWDqgNtLomBZB
 l712GNrqUkLKprYTw+WesY3ubQprHL+S1TlUz8Eo=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 24/45] drm/radeon: disable AGP by default
Date: Mon, 10 Aug 2020 15:11:32 -0400
Message-Id: <20200810191153.3794446-24-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200810191153.3794446-1-sashal@kernel.org>
References: <20200810191153.3794446-1-sashal@kernel.org>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKWyBVcHN0
cmVhbSBjb21taXQgYmE4MDZmOThmODY4Y2UxMDdhYTljNDUzZmVmNzUxZGU5OTgwZTRhZiBdCgpB
bHdheXMgdXNlIHRoZSBQQ0kgR0FSVCBpbnN0ZWFkLiBXZSBqdXN0IGhhdmUgdG8gbWFueSBjYXNl
cwp3aGVyZSBBR1Agc3RpbGwgY2F1c2VzIHByb2JsZW1zLiBUaGlzIG1lYW5zIGEgcGVyZm9ybWFu
Y2UKcmVncmVzc2lvbiBmb3Igc29tZSBHUFVzLCBidXQgYWxzbyBhIGJ1ZyBmaXggZm9yIHNvbWUg
b3RoZXJzLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5p
Z0BhbWQuY29tPgpSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBh
bWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFt
ZC5jb20+ClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kcnYuYyB8IDUgLS0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRl
b24vcmFkZW9uX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZHJ2LmMKaW5k
ZXggN2Q0MTdiOWE1MjUwMS4uYzI1NzMwOTZkNDNjMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9yYWRlb25fZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRl
b25fZHJ2LmMKQEAgLTE3NCwxMiArMTc0LDcgQEAgaW50IHJhZGVvbl9ub193YjsKIGludCByYWRl
b25fbW9kZXNldCA9IC0xOwogaW50IHJhZGVvbl9keW5jbGtzID0gLTE7CiBpbnQgcmFkZW9uX3I0
eHhfYXRvbSA9IDA7Ci0jaWZkZWYgX19wb3dlcnBjX18KLS8qIERlZmF1bHQgdG8gUENJIG9uIFBv
d2VyUEMgKGZkbyAjOTUwMTcpICovCiBpbnQgcmFkZW9uX2FncG1vZGUgPSAtMTsKLSNlbHNlCi1p
bnQgcmFkZW9uX2FncG1vZGUgPSAwOwotI2VuZGlmCiBpbnQgcmFkZW9uX3ZyYW1fbGltaXQgPSAw
OwogaW50IHJhZGVvbl9nYXJ0X3NpemUgPSAtMTsgLyogYXV0byAqLwogaW50IHJhZGVvbl9iZW5j
aG1hcmtpbmcgPSAwOwotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
