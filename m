Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1A255FB2
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 05:42:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE6C36E26C;
	Wed, 26 Jun 2019 03:42:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2E746E262
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 03:41:59 +0000 (UTC)
Received: from sasha-vm.mshome.net (mobile-107-77-172-74.mobile.att.net
 [107.77.172.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8B29320659;
 Wed, 26 Jun 2019 03:41:58 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.1 18/51] drm/mediatek: clear num_pipes when unbind
 driver
Date: Tue, 25 Jun 2019 23:40:34 -0400
Message-Id: <20190626034117.23247-18-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190626034117.23247-1-sashal@kernel.org>
References: <20190626034117.23247-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1561520519;
 bh=HRhRYnyHVM87LoR0ih2Jci+FMYcGNLH438ugNRmuhsQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qnWAYgcMqqGtymkAV1pm+wwJdalxFv3HdMepvGBqXbB+iCBKJATbbwiBHir2xH+FT
 UDHAD8MzYcADcMmIYtAW7qz5NMnLP9CLXtHN5kDtR1zo9t7NbJrQrVqL45vOn6QbSB
 ie87QM2ffLCEyUP3v4ZjZ+esH+D+xh3AkKhQe/MY=
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
 Hsin-Yi Wang <hsinyi@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSHNpbi1ZaSBXYW5nIDxoc2lueWlAY2hyb21pdW0ub3JnPgoKWyBVcHN0cmVhbSBjb21t
aXQgYTRjZDFkMmIwMTZkNWQwNDNhYjJjNGI5YzRlYzUwYTU4MDVmNTM5NiBdCgpudW1fcGlwZXMg
aXMgdXNlZCBmb3IgbXV0ZXggY3JlYXRlZCBpbiBtdGtfZHJtX2NydGNfY3JlYXRlKCkuIElmIHdl
CmRvbid0IGNsZWFyIG51bV9waXBlcyBjb3VudCwgd2hlbiByZWJpbmRpbmcgZHJpdmVyLCB0aGUg
Y291bnQgd2lsbApiZSBhY2N1bXVsYXRlZC4gRnJvbSBtdGtfZGlzcF9tdXRleF9nZXQoKSwgdGhl
cmUgY2FuIG9ubHkgYmUgYXQgbW9zdAoxMCBtdXRleCBpZC4gQ2xlYXIgdGhpcyBudW1iZXIgc28g
aXQgc3RhcnRzIGZyb20gMCBpbiBldmVyeSByZWJpbmQuCgpGaXhlczogMTE5ZjUxNzM2MjhhICgi
ZHJtL21lZGlhdGVrOiBBZGQgRFJNIERyaXZlciBmb3IgTWVkaWF0ZWsgU29DIE1UODE3My4iKQpT
aWduZWQtb2ZmLWJ5OiBIc2luLVlpIFdhbmcgPGhzaW55aUBjaHJvbWl1bS5vcmc+ClNpZ25lZC1v
ZmYtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+ClNpZ25lZC1vZmYtYnk6IFNhc2hhIExl
dmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RybV9kcnYuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMgYi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYwppbmRleCA4NzE4ZDEyM2NjYWEuLmJiZmUzYTQ2
NGFlYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMKQEAgLTQwMCw2ICs0
MDAsNyBAQCBzdGF0aWMgdm9pZCBtdGtfZHJtX3VuYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYpCiAJ
ZHJtX2Rldl91bnJlZ2lzdGVyKHByaXZhdGUtPmRybSk7CiAJbXRrX2RybV9rbXNfZGVpbml0KHBy
aXZhdGUtPmRybSk7CiAJZHJtX2Rldl9wdXQocHJpdmF0ZS0+ZHJtKTsKKwlwcml2YXRlLT5udW1f
cGlwZXMgPSAwOwogCXByaXZhdGUtPmRybSA9IE5VTEw7CiB9CiAKLS0gCjIuMjAuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
