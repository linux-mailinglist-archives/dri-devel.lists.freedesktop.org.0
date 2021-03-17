Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E7133E339
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 01:56:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 386166E46B;
	Wed, 17 Mar 2021 00:56:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 845476E46B;
 Wed, 17 Mar 2021 00:56:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9CE5E64FA7;
 Wed, 17 Mar 2021 00:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615942594;
 bh=M3KYt+TlfZnvsm8VNCnDn0ffL3wX6K17cGMUOCTW83g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uEv5JllwrbL/PJKLPq0SlOo8SCsCkCh3c7qgRFd0N5830VCe+JTVypH9vrwd1pZ5I
 AFN+wShdlMTFjB6k5v1lBCD4MwlgJZ/aAA/+JB3uxPOfezxFh5kIY/1qvp/pH0dRUF
 txczbJSgX5uHozTyoZHJ6TLX6U+7EtCwpsqj5Nkndo5nRxEgYQo0X47oAugAU0UytO
 H61yOf7i4gq4+7X+RUAhdR9a8dQzpJ0Epv5xLn1YLZeEl5KS/N1msXGIUn2TQud7PP
 Llwsv+4GlHxB/3P4FRWp7/R7F5pjA8MlIJp4YRqOJr8HjmeAurglG/Dn96wIFSzfQt
 iY5+fED2q1Cvg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.11 47/61] drm/amdgpu: fb BO should be
 ttm_bo_type_device
Date: Tue, 16 Mar 2021 20:55:21 -0400
Message-Id: <20210317005536.724046-47-sashal@kernel.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210317005536.724046-1-sashal@kernel.org>
References: <20210317005536.724046-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 Nirmoy Das <nirmoy.das@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTmlybW95IERhcyA8bmlybW95LmRhc0BhbWQuY29tPgoKWyBVcHN0cmVhbSBjb21taXQg
NTIxZjA0ZjllM2ZmYzczZWY5NmM3NzYwMzVmOGEwYTMxYjRjZGQ4MSBdCgpGQiBCTyBzaG91bGQg
bm90IGJlIHR0bV9ib190eXBlX2tlcm5lbCB0eXBlIGFuZAphbWRncHVmYl9jcmVhdGVfcGlubmVk
X29iamVjdCgpIHBpbnMgdGhlIEZCIEJPIGFueXdheS4KClNpZ25lZC1vZmYtYnk6IE5pcm1veSBE
YXMgPG5pcm1veS5kYXNAYW1kLmNvbT4KQWNrZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlz
dGlhbi5rb2VuaWdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5k
ZXIuZGV1Y2hlckBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtl
cm5lbC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ZiLmMgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZmIuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9mYi5jCmluZGV4IDBiZjdkMzZjNjY4Ni4uNWI3MTY0
MDRlZWUxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZmIu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZmIuYwpAQCAtMTQ2LDcg
KzE0Niw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1ZmJfY3JlYXRlX3Bpbm5lZF9vYmplY3Qoc3RydWN0
IGFtZGdwdV9mYmRldiAqcmZiZGV2LAogCXNpemUgPSBtb2RlX2NtZC0+cGl0Y2hlc1swXSAqIGhl
aWdodDsKIAlhbGlnbmVkX3NpemUgPSBBTElHTihzaXplLCBQQUdFX1NJWkUpOwogCXJldCA9IGFt
ZGdwdV9nZW1fb2JqZWN0X2NyZWF0ZShhZGV2LCBhbGlnbmVkX3NpemUsIDAsIGRvbWFpbiwgZmxh
Z3MsCi0JCQkJICAgICAgIHR0bV9ib190eXBlX2tlcm5lbCwgTlVMTCwgJmdvYmopOworCQkJCSAg
ICAgICB0dG1fYm9fdHlwZV9kZXZpY2UsIE5VTEwsICZnb2JqKTsKIAlpZiAocmV0KSB7CiAJCXBy
X2VycigiZmFpbGVkIHRvIGFsbG9jYXRlIGZyYW1lYnVmZmVyICglZClcbiIsIGFsaWduZWRfc2l6
ZSk7CiAJCXJldHVybiAtRU5PTUVNOwotLSAKMi4zMC4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
