Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2257F86D
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 15:20:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 063B86EE3B;
	Fri,  2 Aug 2019 13:20:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 736026EE38;
 Fri,  2 Aug 2019 13:20:23 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6AB5821849;
 Fri,  2 Aug 2019 13:20:22 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 22/76] drm/amd/display: allocate 4 ddc engines for
 RV2
Date: Fri,  2 Aug 2019 09:18:56 -0400
Message-Id: <20190802131951.11600-22-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190802131951.11600-1-sashal@kernel.org>
References: <20190802131951.11600-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1564752023;
 bh=lqq2VbkePfNbRKWHBmATFXzrCNh4xuuTzls6CUQ9NzA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fEgMcwBvaB2DJxOyl4jyhGcLil8yKHTBzlFianS6oqxr2NP0mxbdLW3LfLB2+4eFG
 SCgnsiQmNqXtemkwmHxU1FN+9m5KNI2Rns4CJMiS/WNryRAnWxJz924xMTuGVejLNe
 1HyvVKitagyGwUWsWJwJkTxbqvmJvmPB5Q2f10sE=
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
Cc: Sasha Levin <sashal@kernel.org>, Leo Li <sunpeng.li@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Derek Lai <Derek.Lai@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGVyZWsgTGFpIDxEZXJlay5MYWlAYW1kLmNvbT4KClsgVXBzdHJlYW0gY29tbWl0IDY3
ZmQ2YzBkMmRlOGU1MWU4NGZmM2ZhNmU2OGJiZDUyNGY4MjNlNDkgXQoKW1doeV0KRHJpdmVyIHdp
bGwgY3JlYXRlIDAsIDEsIGFuZCAyIGRkYyBlbmdpbmVzIGZvciBSVjIsCmJ1dCBzb21lIHBsYXRm
b3JtcyB1c2VkIDAsIDEsIGFuZCAzLgoKW0hvd10KU3RpbGwgYWxsb2NhdGUgNCBkZGMgZW5naW5l
cyBmb3IgUlYyLgoKU2lnbmVkLW9mZi1ieTogRGVyZWsgTGFpIDxEZXJlay5MYWlAYW1kLmNvbT4K
UmV2aWV3ZWQtYnk6IEFyaWMgQ3lyIDxBcmljLkN5ckBhbWQuY29tPgpBY2tlZC1ieTogTGVvIExp
IDxzdW5wZW5nLmxpQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFu
ZGVyLmRldWNoZXJAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBr
ZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24x
MF9yZXNvdXJjZS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Rj
bjEwL2RjbjEwX3Jlc291cmNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNu
MTAvZGNuMTBfcmVzb3VyY2UuYwppbmRleCA3ZWNjYjU0YzQyMWQ5Li5hYWM1MmVlZDZiMmFhIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfcmVz
b3VyY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBf
cmVzb3VyY2UuYwpAQCAtNTEyLDcgKzUxMiw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcmVzb3Vy
Y2VfY2FwcyBydjJfcmVzX2NhcCA9IHsKIAkJLm51bV9hdWRpbyA9IDMsCiAJCS5udW1fc3RyZWFt
X2VuY29kZXIgPSAzLAogCQkubnVtX3BsbCA9IDMsCi0JCS5udW1fZGRjID0gMywKKwkJLm51bV9k
ZGMgPSA0LAogfTsKICNlbmRpZgogCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
