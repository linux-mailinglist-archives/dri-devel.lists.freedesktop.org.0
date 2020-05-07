Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A29B1C8E5B
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 16:28:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B4E46E9BA;
	Thu,  7 May 2020 14:28:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B6E86E9B7;
 Thu,  7 May 2020 14:28:08 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3A7E62084D;
 Thu,  7 May 2020 14:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588861688;
 bh=0zUgoL8zGPgVJ5XXJhZqITkeX4BLPqERLZPMDtUiQog=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fTrEG8zGrix8TC/GUvQe0Grxu2JXjdVGsxa/A6WOOMTojb2l07ZTRDzZdR4WI0Ut7
 I2gNK+UjUsjQXiR+fs8RtNjEgIdC+TyxV27XzXLs0OrINq6DcGgznGhkm8qhUKPlFM
 Wp4wVHR8bbq2bnInJcg8fSfyfbKbBXoy0QXK/p4M=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.6 33/50] drm/amdgpu: bump version for invalidate L2
 before SDMA IBs
Date: Thu,  7 May 2020 10:27:09 -0400
Message-Id: <20200507142726.25751-33-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200507142726.25751-1-sashal@kernel.org>
References: <20200507142726.25751-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWFyZWsgT2zFocOhayA8bWFyZWsub2xzYWtAYW1kLmNvbT4KClsgVXBzdHJlYW0gY29t
bWl0IDkwMTdhNDg5N2EyMDY1OGYwMTBiZWJlYTgyNTI2Mjk2M2MxMGFmYTYgXQoKVGhpcyBmaXhl
cyBHUFUgaGFuZ3MgZHVlIHRvIGNhY2hlIGNvaGVyZW5jeSBpc3N1ZXMuCkJ1bXAgdGhlIGRyaXZl
ciB2ZXJzaW9uLiBTcGxpdCBvdXQgZnJvbSB0aGUgb3JpZ2luYWwgcGF0Y2guCgpTaWduZWQtb2Zm
LWJ5OiBNYXJlayBPbMWhw6FrIDxtYXJlay5vbHNha0BhbWQuY29tPgpSZXZpZXdlZC1ieTogQ2hy
aXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpUZXN0ZWQtYnk6IFBpZXJy
ZS1FcmljIFBlbGxvdXgtUHJheWVyIDxwaWVycmUtZXJpYy5wZWxsb3V4LXByYXllckBhbWQuY29t
PgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+
ClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgfCAzICsrLQogMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9kcnYuYwppbmRleCA0MmY0ZmViZTI0YzZkLi44ZDQ1YTJiNjYyYWViIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCkBAIC04NSw5ICs4NSwxMCBAQAog
ICogLSAzLjM0LjAgLSBOb24tREMgY2FuIGZsaXAgY29ycmVjdGx5IGJldHdlZW4gYnVmZmVycyB3
aXRoIGRpZmZlcmVudCBwaXRjaGVzCiAgKiAtIDMuMzUuMCAtIEFkZCBkcm1fYW1kZ3B1X2luZm9f
ZGV2aWNlOjp0Y2NfZGlzYWJsZWRfbWFzawogICogLSAzLjM2LjAgLSBBbGxvdyByZWFkaW5nIG1v
cmUgc3RhdHVzIHJlZ2lzdGVycyBvbiBzaS9jaWsKKyAqIC0gMy4zNy4wIC0gTDIgaXMgaW52YWxp
ZGF0ZWQgYmVmb3JlIFNETUEgSUJzLCBuZWVkZWQgZm9yIGNvcnJlY3RuZXNzCiAgKi8KICNkZWZp
bmUgS01TX0RSSVZFUl9NQUpPUgkzCi0jZGVmaW5lIEtNU19EUklWRVJfTUlOT1IJMzYKKyNkZWZp
bmUgS01TX0RSSVZFUl9NSU5PUgkzNwogI2RlZmluZSBLTVNfRFJJVkVSX1BBVENITEVWRUwJMAog
CiBpbnQgYW1kZ3B1X3ZyYW1fbGltaXQgPSAwOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
