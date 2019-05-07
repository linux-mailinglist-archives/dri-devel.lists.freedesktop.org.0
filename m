Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8BB1598B
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 07:37:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85BC989D4A;
	Tue,  7 May 2019 05:37:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ECBD89D4A
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 05:37:47 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A9F5B20675;
 Tue,  7 May 2019 05:37:46 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 59/81] drm/sun4i: Unbind components before
 releasing DRM and memory
Date: Tue,  7 May 2019 01:35:30 -0400
Message-Id: <20190507053554.30848-59-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190507053554.30848-1-sashal@kernel.org>
References: <20190507053554.30848-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1557207467;
 bh=rwX0tiC2cPttjHpQiUo5GVwYjA875W49HkVs9nxYQ3A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Iz7h105VJ5kXKxgegd2X5zCtYFHZ4vc4W3RS2Nmpt9x242DNy/S1pCIuhORtGrAkH
 3Xy+gTmsZZc42dfOuUyezjIaKY3skRMYVtqt/ehOWElcVuRZlWjKLaPel0lOf3sqsU
 WNKPBZ+WKXtLogbv90HB/k9SOCNBvbBsMOj0p0Go=
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
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Sasha Levin <sashal@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUGF1bCBLb2NpYWxrb3dza2kgPHBhdWwua29jaWFsa293c2tpQGJvb3RsaW4uY29tPgoK
WyBVcHN0cmVhbSBjb21taXQgZTAyYmMyOWIyY2ZhNzgwNjgzMGQ2ZGE4YjIzMjJjZGRkNjdlOGRm
ZSBdCgpPdXIgY29tcG9uZW50cyBtYXkgc3RpbGwgYmUgdXNpbmcgdGhlIERSTSBkZXZpY2UgZHJp
dmVyIChpZiBvbmx5IHRvCmFjY2VzcyBvdXIgZHJpdmVyJ3MgcHJpdmF0ZSBkYXRhKSwgc28gbWFr
ZSBzdXJlIHRvIHVuYmluZCB0aGVtIGJlZm9yZQp0aGUgZmluYWwgZHJtX2Rldl9wdXQuCgpBbHNv
IHJlbGVhc2Ugb3VyIHJlc2VydmVkIG1lbW9yeSBhZnRlciBjb21wb25lbnQgdW5iaW5kIGluc3Rl
YWQgb2YKYmVmb3JlIHRvIG1hdGNoIHJldmVyc2UgY3JlYXRpb24gb3JkZXIuCgpGaXhlczogZjVh
OWVkODY3YzgzICgiZHJtL3N1bjRpOiBGaXggY29tcG9uZW50IHVuYmluZGluZyBhbmQgY29tcG9u
ZW50IG1hc3RlciBkZWxldGlvbiIpClNpZ25lZC1vZmYtYnk6IFBhdWwgS29jaWFsa293c2tpIDxw
YXVsLmtvY2lhbGtvd3NraUBib290bGluLmNvbT4KUmV2aWV3ZWQtYnk6IENoZW4tWXUgVHNhaSA8
d2Vuc0Bjc2llLm9yZz4KTGluazogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Bh
dGNoL21zZ2lkLzIwMTkwNDI0MDkwNDEzLjY5MTgtMS1wYXVsLmtvY2lhbGtvd3NraUBib290bGlu
LmNvbQpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX2Rydi5jIHwgNSArKystLQogMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vc3VuNGkvc3VuNGlfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlf
ZHJ2LmMKaW5kZXggNjI3MDM2MzAwOTBhLi41N2Y2MWVjNGJjNmIgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9zdW40aS9zdW40aV9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkv
c3VuNGlfZHJ2LmMKQEAgLTE1OCwxMCArMTU4LDExIEBAIHN0YXRpYyB2b2lkIHN1bjRpX2Rydl91
bmJpbmQoc3RydWN0IGRldmljZSAqZGV2KQogCWRybV9rbXNfaGVscGVyX3BvbGxfZmluaShkcm0p
OwogCXN1bjRpX2ZyYW1lYnVmZmVyX2ZyZWUoZHJtKTsKIAlkcm1fbW9kZV9jb25maWdfY2xlYW51
cChkcm0pOwotCW9mX3Jlc2VydmVkX21lbV9kZXZpY2VfcmVsZWFzZShkZXYpOwotCWRybV9kZXZf
cHV0KGRybSk7CiAKIAljb21wb25lbnRfdW5iaW5kX2FsbChkZXYsIE5VTEwpOworCW9mX3Jlc2Vy
dmVkX21lbV9kZXZpY2VfcmVsZWFzZShkZXYpOworCisJZHJtX2Rldl9wdXQoZHJtKTsKIH0KIAog
c3RhdGljIGNvbnN0IHN0cnVjdCBjb21wb25lbnRfbWFzdGVyX29wcyBzdW40aV9kcnZfbWFzdGVy
X29wcyA9IHsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
