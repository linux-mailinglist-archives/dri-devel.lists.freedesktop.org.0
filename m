Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CC4BCCB6
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 18:42:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 306E66EA5D;
	Tue, 24 Sep 2019 16:42:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D953A6EA60;
 Tue, 24 Sep 2019 16:42:25 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D8DE6217D9;
 Tue, 24 Sep 2019 16:42:24 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.3 12/87] drm/amd/display: Copy GSL groups when
 committing a new context
Date: Tue, 24 Sep 2019 12:40:28 -0400
Message-Id: <20190924164144.25591-12-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924164144.25591-1-sashal@kernel.org>
References: <20190924164144.25591-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569343345;
 bh=UFgLiUOs6x9PlG4jSctQ9LRTyjHREDnXiqnZJRJ+uuk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HJN/2VYmYHECtsXrFb06hzevjrAkQVh+NV8cPJIztGTrkqWsa65m/9PxUqB0pO4pP
 2qUjP5/dyE7SQCZlq/9tyuKxx1S4Lz+AHyp4wGxqS0bt0OgXBKTiLXFpMh++A1wGIi
 TjDHktelThWnk4O2znVHqWLIND2cXJ4N72FKdNd0=
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
Cc: Sasha Levin <sashal@kernel.org>, Hersen Wu <hersen.wu@amd.com>,
 Leo Li <sunpeng.li@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPgoK
WyBVcHN0cmVhbSBjb21taXQgMjFmZmNjOTRkNWIzZGMwMjRmZWRhYzcwMGYxZTdmOWRhY2Y0YWI0
ZiBdCgpbV2h5XQpEQyBjb25maWd1cmVzIHRoZSBHU0wgZ3JvdXAgZm9yIHRoZSBwaXBlIHdoZW4g
cGlwZV9zcGxpdCBpcyBlbmFibGVkCmFuZCB3ZSdyZSBzd2l0Y2hpbmcgZmxpcCB0eXBlcyAoYnVm
ZmVyZWQgPC0+IGltbWVkaWF0ZSBmbGlwKSBvbiBEQ04yLgoKSW4gb3JkZXIgdG8gcmVjb3JkIHdo
YXQgR1NMIGdyb3VwIHRoZSBwaXBlIGlzIHVzaW5nIERDIHN0b3JlcyBpdCBpbgp0aGUgcGlwZSdz
IHN0cmVhbV9yZXMuIERNIGlzIG5vdCBhd2FyZSBvZiB0aGlzIGludGVybmFsIGdyb3VwaW5nLCBu
b3IKaXMgREMgcmVzb3VyY2UuCgpTbyB3aGVuIERNIGNyZWF0ZXMgYSBkY19zdGF0ZSBjb250ZXh0
IGFuZCBwYXNzZXMgaXQgdG8gREMgdGhlIGN1cnJlbnQKR1NMIGdyb3VwIGlzIGxvc3QgLSBETSBu
ZXZlciBrbmV3IGFib3V0IGl0IGluIHRoZSBmaXJzdCBwbGFjZS4KCkFmdGVyIDMgaW1tZWRpYXRl
IGZsaXBzIHdlIHJ1biBvdXQgb2YgR1NMIGdyb3VwcyBhbmQgd2UncmUgbm8gbG9uZ2VyCmFibGUg
dG8gY29ycmVjdGx5IHBlcmZvcm0gKmFueSogZmxpcCBmb3IgbXVsdGktcGlwZSBzY2VuYXJpb3Mu
CgpbSG93XQpUaGUgZ3NsX2dyb3VwIG5lZWRzIHRvIGJlIGNvcGllZCB0byB0aGUgbmV3IGNvbnRl
eHQuCgpETSBoYXMgbm8gaW5zaWdodCBpbnRvIEdTTCBncm91cGluZyBhbmQgY291bGQgZXZlbiBw
b3RlbnRpYWxseSBjcmVhdGUKYSBicmFuZCBuZXcgY29udGV4dCB3aXRob3V0IHJlZmVyZW5jaW5n
IGN1cnJlbnQgaGFyZHdhcmUgc3RhdGUuIFNvIHRoaXMKbWFrZXMgdGhlIG1vc3Qgc2Vuc2UgdG8g
aGF2ZSBoYXBwZW4gaW4gREMuCgpUaGVyZSBhcmUgdHdvIHBsYWNlcyB3aGVyZSBEQyBjYW4gYXBw
bHkgYSBuZXcgY29udGV4dDoKLSBkY19jb21taXRfc3RhdGUKLSBkY19jb21taXRfdXBkYXRlc19m
b3Jfc3RyZWFtCgpCdXQgd2hhdCdzIHNoYXJlZCBiZXR3ZWVuIGJvdGggb2YgdGhlc2UgaXMgYXBw
bHlfY3R4X2Zvcl9zdXJmYWNlLgoKVGhpcyBsb2dpYyBvbmx5IG1hdHRlcnMgZm9yIERDTjIsIHNv
IGl0IGNhbiBiZSBwbGFjZWQgaW4KZGNuMjBfYXBwbHlfY3R4X2Zvcl9zdXJmYWNlLiBCZWZvcmUg
ZG9pbmcgYW55IGxvY2tpbmcgKHdoZXJlIHRoZSBHU0wKZ3JvdXAgaXMgc2V0dXApIHdlIGNhbiBj
b3B5IG92ZXIgdGhlIEdTTCBncm91cHMgYmVmb3JlIGNvbW1pdHRpbmcgdGhlCm5ldyBjb250ZXh0
LgoKU2lnbmVkLW9mZi1ieTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2th
c0BhbWQuY29tPgpSZXZpZXdlZC1ieTogSGVyc2VuIFd1IDxoZXJzZW4ud3VAYW1kLmNvbT4KQWNr
ZWQtYnk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERl
dWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IFNhc2hhIExl
dmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvZGNuMjAvZGNuMjBfaHdzZXEuYyB8IDEyICsrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQs
IDEyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kY24yMC9kY24yMF9od3NlcS5jCmluZGV4IDI2MjdlMGE5OGE5NmEuLmY4YWJlOThhNTc2YmUg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9o
d3NlcS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9o
d3NlcS5jCkBAIC0xMzE5LDYgKzEzMTksMTggQEAgc3RhdGljIHZvaWQgZGNuMjBfYXBwbHlfY3R4
X2Zvcl9zdXJmYWNlKAogCWlmICghdG9wX3BpcGVfdG9fcHJvZ3JhbSkKIAkJcmV0dXJuOwogCisJ
LyogQ2Fycnkgb3ZlciBHU0wgZ3JvdXBzIGluIGNhc2UgdGhlIGNvbnRleHQgaXMgY2hhbmdpbmcu
ICovCisJZm9yIChpID0gMDsgaSA8IGRjLT5yZXNfcG9vbC0+cGlwZV9jb3VudDsgaSsrKSB7CisJ
CXN0cnVjdCBwaXBlX2N0eCAqcGlwZV9jdHggPSAmY29udGV4dC0+cmVzX2N0eC5waXBlX2N0eFtp
XTsKKwkJc3RydWN0IHBpcGVfY3R4ICpvbGRfcGlwZV9jdHggPQorCQkJJmRjLT5jdXJyZW50X3N0
YXRlLT5yZXNfY3R4LnBpcGVfY3R4W2ldOworCisJCWlmIChwaXBlX2N0eC0+c3RyZWFtID09IHN0
cmVhbSAmJgorCQkgICAgcGlwZV9jdHgtPnN0cmVhbSA9PSBvbGRfcGlwZV9jdHgtPnN0cmVhbSkK
KwkJCXBpcGVfY3R4LT5zdHJlYW1fcmVzLmdzbF9ncm91cCA9CisJCQkJb2xkX3BpcGVfY3R4LT5z
dHJlYW1fcmVzLmdzbF9ncm91cDsKKwl9CisKIAl0ZyA9IHRvcF9waXBlX3RvX3Byb2dyYW0tPnN0
cmVhbV9yZXMudGc7CiAKIAlpbnRlcmRlcGVuZGVudF91cGRhdGUgPSB0b3BfcGlwZV90b19wcm9n
cmFtLT5wbGFuZV9zdGF0ZSAmJgotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
