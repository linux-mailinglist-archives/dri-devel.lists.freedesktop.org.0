Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED3131BEE
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jun 2019 15:18:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC5E789B60;
	Sat,  1 Jun 2019 13:18:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D92289B60;
 Sat,  1 Jun 2019 13:18:19 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 32ABC229EB;
 Sat,  1 Jun 2019 13:18:18 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.1 032/186] drm/nouveau: fix duplication of
 nv50_head_atom struct
Date: Sat,  1 Jun 2019 09:14:08 -0400
Message-Id: <20190601131653.24205-32-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190601131653.24205-1-sashal@kernel.org>
References: <20190601131653.24205-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1559395099;
 bh=38Aw2HzJTAyTMaMqAs3+iZXGKMqousHIfWwFM71u/MQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=1M1IuOkWY08mAZoddsaCbYg0lLgeOKMT7zLw3OFj5b5Af7FFk86n5XPyTOPrW42d3
 aw9TscHVNHnmS9gLLKXLLvYHqVEUvp9f6WpFTmh82CWg02hD/+9p90EmpGi4apnd+X
 plgH3zg0xSnQtLM8b4F+xsfPuWkgHi/0UGQOa64I=
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
Cc: Sasha Levin <sashal@kernel.org>, nouveau@lists.freedesktop.org,
 Peteris Rudzusiks <peteris.rudzusiks@gmail.com>,
 Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUGV0ZXJpcyBSdWR6dXNpa3MgPHBldGVyaXMucnVkenVzaWtzQGdtYWlsLmNvbT4KClsg
VXBzdHJlYW0gY29tbWl0IGM0YTUyZDY2OTY5MDQyM2VlM2M5OWQ4ZWRhMWU2OWNkMDgyMWZjYWQg
XQoKbnY1MF9oZWFkX2F0b21pY19kdXBsaWNhdGVfc3RhdGUoKSBtYWtlcyBhIGNvcHkgb2YgbnY1
MF9oZWFkX2F0b20Kc3RydWN0LiBUaGlzIHBhdGNoIGFkZHMgY29weWluZyBvZiBzdHJ1Y3QgbWVt
YmVyIG5hbWVkICJvciIsIHdoaWNoCnByZXZpb3VzbHkgd2FzIGxlZnQgdW5pbml0aWFsaXplZCBp
biB0aGUgZHVwbGljYXRlZCBzdHJ1Y3R1cmUuCgpEdWUgdG8gdGhpcyBidWcsIGluY29ycmVjdCBu
aHN5bmMgYW5kIG52c3luYyB2YWx1ZXMgd2VyZSBzb21ldGltZXMgdXNlZC4KSW4gbXkgcGFydGlj
dWxhciBjYXNlLCB0aGF0IGxlYWQgdG8gYSBtaXNtYXRjaCBiZXR3ZWVuIHRoZSBvdXRwdXQKcmVz
b2x1dGlvbiBvZiB0aGUgZ3JhcGhpY3MgZGV2aWNlIChHZUZvcmNlIEdUIDYzMCBPRU0pIGFuZCB0
aGUgcmVwb3J0ZWQKaW5wdXQgc2lnbmFsIHJlc29sdXRpb24gb24gdGhlIGRpc3BsYXkuIHhyYW5k
ciByZXBvcnRlZCAxNjgweDEwNTAsIGJ1dAp0aGUgZGlzcGxheSByZXBvcnRlZCAxMjgweDEwMjQu
IEFzIGEgcmVzdWx0IG9mIHRoaXMgbWlzbWF0Y2gsIHRoZSBvdXRwdXQKb24gdGhlIGRpc3BsYXkg
bG9va2VkIGxpa2UgaXQgd2FzIGNyb3BwZWQgKG9ubHkgcGFydCBvZiB0aGUgb3V0cHV0IHdhcwph
Y3R1YWxseSB2aXNpYmxlIG9uIHRoZSBkaXNwbGF5KS4KCmdpdCBiaXNlY3QgcG9pbnRlZCB0byBj
b21taXQgMmNhN2ZiNWMxY2M2ICgiZHJtL25vdXZlYXUva21zL252NTA6IGhhbmRsZQpTZXRDb250
cm9sT3V0cHV0UmVzb3VyY2UgZnJvbSBoZWFkIiksIHdoaWNoIGFkZGVkIHRoZSBtZW1iZXIgIm9y
IiB0bwpudjUwX2hlYWRfYXRvbSBzdHJ1Y3R1cmUsIGJ1dCBmb3Jnb3QgdG8gY29weSBpdCBpbgpu
djUwX2hlYWRfYXRvbWljX2R1cGxpY2F0ZV9zdGF0ZSgpLgoKRml4ZXM6IDJjYTdmYjVjMWNjNiAo
ImRybS9ub3V2ZWF1L2ttcy9udjUwOiBoYW5kbGUgU2V0Q29udHJvbE91dHB1dFJlc291cmNlIGZy
b20gaGVhZCIpClNpZ25lZC1vZmYtYnk6IFBldGVyaXMgUnVkenVzaWtzIDxwZXRlcmlzLnJ1ZHp1
c2lrc0BnbWFpbC5jb20+ClNpZ25lZC1vZmYtYnk6IEJlbiBTa2VnZ3MgPGJza2VnZ3NAcmVkaGF0
LmNvbT4KU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2hlYWQuYyB8IDEgKwogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvZGlzcG52NTAvaGVhZC5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvaGVh
ZC5jCmluZGV4IDhlZmI3NzhhM2IyMDcuLjA2ZWUyMzgyM2E2ODkgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2hlYWQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9kaXNwbnY1MC9oZWFkLmMKQEAgLTQxMyw2ICs0MTMsNyBAQCBudjUwX2hlYWRfYXRv
bWljX2R1cGxpY2F0ZV9zdGF0ZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMpCiAJYXN5aC0+b3ZseSA9
IGFybWgtPm92bHk7CiAJYXN5aC0+ZGl0aGVyID0gYXJtaC0+ZGl0aGVyOwogCWFzeWgtPnByb2Nh
bXAgPSBhcm1oLT5wcm9jYW1wOworCWFzeWgtPm9yID0gYXJtaC0+b3I7CiAJYXN5aC0+ZHAgPSBh
cm1oLT5kcDsKIAlhc3loLT5jbHIubWFzayA9IDA7CiAJYXN5aC0+c2V0Lm1hc2sgPSAwOwotLSAK
Mi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
