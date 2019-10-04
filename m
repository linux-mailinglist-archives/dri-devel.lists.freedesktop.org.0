Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C69CB61E
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 10:27:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C37D26E0EB;
	Fri,  4 Oct 2019 08:27:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB3956E0EB
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 08:27:09 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1iGIva-0003uQ-Px; Fri, 04 Oct 2019 08:27:06 +0000
From: Colin King <colin.king@canonical.com>
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Vincent Abriou <vincent.abriou@st.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: sti: fix spelling mistake: rejec -> rejection
Date: Fri,  4 Oct 2019 09:27:06 +0100
Message-Id: <20191004082706.26478-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KCkluIG90aGVy
IHBsYWNlcyBvZiB0aGUgZHJpdmVyIHRoZSBzdHJpbmcgaGRtaV9yZWplY3Rpb25fcGxsIGlzCnVz
ZWQgaW5zdGVhZCBvZiB0aGUgdHJ1bmNhdGVkIGhkbWlfcmVqZWNfcGxsLCBzbyB1c2UgdGhpcyBz
dHJpbmcKaW5zdGVhZCB0byBiZSBjb25zaXN0ZW50LgoKU2lnbmVkLW9mZi1ieTogQ29saW4gSWFu
IEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vc3Rp
L3N0aV9oZG1pLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9oZG1pLmMgYi9k
cml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9oZG1pLmMKaW5kZXggODE0NTYwZWFkNGUxLi5lMjAxOGU0
YTNlYzUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdGkvc3RpX2hkbWkuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9oZG1pLmMKQEAgLTg4Niw3ICs4ODYsNyBAQCBzdGF0aWMg
dm9pZCBzdGlfaGRtaV9wcmVfZW5hYmxlKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UpCiAJaWYg
KGNsa19wcmVwYXJlX2VuYWJsZShoZG1pLT5jbGtfdG1kcykpCiAJCURSTV9FUlJPUigiRmFpbGVk
IHRvIHByZXBhcmUvZW5hYmxlIGhkbWlfdG1kcyBjbGtcbiIpOwogCWlmIChjbGtfcHJlcGFyZV9l
bmFibGUoaGRtaS0+Y2xrX3BoeSkpCi0JCURSTV9FUlJPUigiRmFpbGVkIHRvIHByZXBhcmUvZW5h
YmxlIGhkbWlfcmVqZWNfcGxsIGNsa1xuIik7CisJCURSTV9FUlJPUigiRmFpbGVkIHRvIHByZXBh
cmUvZW5hYmxlIGhkbWlfcmVqZWN0aW9uX3BsbCBjbGtcbiIpOwogCiAJaGRtaS0+ZW5hYmxlZCA9
IHRydWU7CiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
