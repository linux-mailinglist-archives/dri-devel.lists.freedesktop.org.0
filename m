Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 238252D878F
	for <lists+dri-devel@lfdr.de>; Sat, 12 Dec 2020 17:09:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E9086ED08;
	Sat, 12 Dec 2020 16:09:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B663E6ED17
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Dec 2020 16:09:18 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 1/2] drm/nouveau: make sure ret is initialized in
 nouveau_ttm_io_mem_reserve
Date: Sat, 12 Dec 2020 11:09:15 -0500
Message-Id: <20201212160916.2335592-1-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
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
Cc: Mark Hounschell <markh@compro.net>, Sasha Levin <sashal@kernel.org>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Karol Herbst <kherbst@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKWyBVcHN0
cmVhbSBjb21taXQgYWVhNjU2YjBkMDVlYzViOGVkNWJlYjJmOTRjNGRkNDJlYTgzNGU5ZCBdCgpU
aGlzIHdhc24ndCBpbml0aWFsaXplZCBmb3IgcHJlIE5WNTAgaGFyZHdhcmUuCgpTaWduZWQtb2Zm
LWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+ClJlcG9ydGVk
LWFuZC1UZXN0ZWQtYnk6IE1hcmsgSG91bnNjaGVsbCA8bWFya2hAY29tcHJvLm5ldD4KUmV2aWV3
ZWQtYnk6IEthcm9sIEhlcmJzdCA8a2hlcmJzdEByZWRoYXQuY29tPgpMaW5rOiBodHRwczovL3Bh
dGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzg0Mjk4LwpTaWduZWQtb2ZmLWJ5OiBTYXNo
YSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
bm91dmVhdV9iby5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMgYi9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMKaW5kZXggNzhmNTIwZDA1ZGU5Mi4uMzgwMWFiZThl
NmQ0MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYwpAQCAtMTM5NSw2ICsxMzk1
LDcgQEAgbm91dmVhdV90dG1faW9fbWVtX3Jlc2VydmUoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJk
ZXYsIHN0cnVjdCB0dG1fbWVtX3JlZyAqbWVtKQogCQkJbnZrbV92bV9tYXAoJm5vZGUtPmJhcl92
bWEsIG5vZGUpOwogCQkJbWVtLT5idXMub2Zmc2V0ID0gbm9kZS0+YmFyX3ZtYS5vZmZzZXQ7CiAJ
CX0KKwkJcmV0ID0gMDsKIAkJYnJlYWs7CiAJZGVmYXVsdDoKIAkJcmV0dXJuIC1FSU5WQUw7Ci0t
IAoyLjI3LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
