Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FB7BCCA2
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 18:41:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D06656EA4D;
	Tue, 24 Sep 2019 16:41:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31BE46EA4C
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 16:41:49 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C16C421655;
 Tue, 24 Sep 2019 16:41:47 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.3 03/87] drm/bridge: tc358767: Increase AUX transfer
 length limit
Date: Tue, 24 Sep 2019 12:40:19 -0400
Message-Id: <20190924164144.25591-3-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924164144.25591-1-sashal@kernel.org>
References: <20190924164144.25591-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569343309;
 bh=rVZbbjAhkHux7zJ+PirVH6htCfn1dxxVKBY20QsjSAI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZK2RbNdNnot6dnLUUKbXymYLcK2ObCdoaAzkWj5Bo7oRh1qpTjmnLg8/zMfHVze54
 rXkVs+c3NkQl27C8fagUr2MAHPUseTVaDVhYcif+O2QsgI+9rT7tmP9oEWXSDHFioQ
 FQVhKyyeVVLvmoEZkHetbQKL0Gkdcp29+cNPLD8Y=
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
Cc: Cory Tusar <cory.tusar@zii.aero>, Sasha Levin <sashal@kernel.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQW5kcmV5IFNtaXJub3YgPGFuZHJldy5zbWlybm92QGdtYWlsLmNvbT4KClsgVXBzdHJl
YW0gY29tbWl0IGUwNjU1ZmVhZWM2MmQ1MTM5YjZiMTNhN2IxYmJiMWFiOGYxYzJkODMgXQoKQWNj
b3JkaW5nIHRvIHRoZSBkYXRhc2hlZXQgdGMzNTg3NjcgY2FuIHRyYW5zZmVyIHVwIHRvIDE2IGJ5
dGVzIHZpYQppdHMgQVVYIGNoYW5uZWwsIHNvIHRoZSBhcnRpZmljaWFsIGxpbWl0IG9mIDggYXBw
ZWFycyB0byBiZSB0b28KbG93LiBIb3dldmVyIG9ubHkgdXAgdG8gMTUtYnl0ZXMgc2VlbSB0byBi
ZSBhY3R1YWxseSBzdXBwb3J0ZWQgYW5kCnRyeWluZyB0byB1c2UgMTYtYnl0ZSB0cmFuc2ZlcnMg
cmVzdWx0cyBpbiB0cmFuc2ZlcnMgZmFpbGluZwpzcG9yYWRpY2FsbHkgKHdpdGggYm9ndXMgc3Rh
dHVzIGluIGNhc2Ugb2YgSTJDIHRyYW5zZmVycyksIHNvIGxpbWl0IGl0CnRvIDE1LgoKU2lnbmVk
LW9mZi1ieTogQW5kcmV5IFNtaXJub3YgPGFuZHJldy5zbWlybm92QGdtYWlsLmNvbT4KUmV2aWV3
ZWQtYnk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+ClJldmlld2VkLWJ5OiBU
b21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgpDYzogQW5kcnplaiBIYWpkYSA8
YS5oYWpkYUBzYW1zdW5nLmNvbT4KQ2M6IExhdXJlbnQgUGluY2hhcnQgPExhdXJlbnQucGluY2hh
cnRAaWRlYXNvbmJvYXJkLmNvbT4KQ2M6IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0
aS5jb20+CkNjOiBBbmRyZXkgR3VzYWtvdiA8YW5kcmV5Lmd1c2Frb3ZAY29nZW50ZW1iZWRkZWQu
Y29tPgpDYzogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4KQ2M6IENvcnkg
VHVzYXIgPGNvcnkudHVzYXJAemlpLmFlcm8+CkNjOiBDaHJpcyBIZWFseSA8Y3BoZWFseUBnbWFp
bC5jb20+CkNjOiBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5ndXRyb25peC5kZT4KQ2M6IGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmcKU2lnbmVkLW9mZi1ieTogQW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KTGlu
azogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoL21zZ2lkLzIwMTkwNjE5
MDUyNzE2LjE2ODMxLTktYW5kcmV3LnNtaXJub3ZAZ21haWwuY29tClNpZ25lZC1vZmYtYnk6IFNh
c2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3RjMzU4NzY3LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMKaW5kZXggMTNhZGUyOGEzNmE4YS4u
YjNhN2Q1ZjEyNTBjOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2
Ny5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYwpAQCAtMzEzLDcgKzMx
Myw3IEBAIHN0YXRpYyBzc2l6ZV90IHRjX2F1eF90cmFuc2ZlcihzdHJ1Y3QgZHJtX2RwX2F1eCAq
YXV4LAogCQkJICAgICAgIHN0cnVjdCBkcm1fZHBfYXV4X21zZyAqbXNnKQogewogCXN0cnVjdCB0
Y19kYXRhICp0YyA9IGF1eF90b190YyhhdXgpOwotCXNpemVfdCBzaXplID0gbWluX3Qoc2l6ZV90
LCA4LCBtc2ctPnNpemUpOworCXNpemVfdCBzaXplID0gbWluX3Qoc2l6ZV90LCBEUF9BVVhfTUFY
X1BBWUxPQURfQllURVMgLSAxLCBtc2ctPnNpemUpOwogCXU4IHJlcXVlc3QgPSBtc2ctPnJlcXVl
c3QgJiB+RFBfQVVYX0kyQ19NT1Q7CiAJdTggKmJ1ZiA9IG1zZy0+YnVmZmVyOwogCXUzMiB0bXAg
PSAwOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
