Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E480E10D618
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 14:26:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5052F89B0C;
	Fri, 29 Nov 2019 13:26:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBA5289B01
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 13:26:48 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1iagIG-0004SI-6Z; Fri, 29 Nov 2019 14:26:44 +0100
From: Lucas Stach <l.stach@pengutronix.de>
To: Alex Deucher <alexander.deucher@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH 1/2] drm/sched: don't try to construct error code from NULL ptr
Date: Fri, 29 Nov 2019 14:26:42 +0100
Message-Id: <20191129132643.7828-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 patchwork-lst@pengutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWYgdGhlIGpvYiBzdWJtaXNzaW9uIGZhaWxzIHdpdGggYSBOVUxMIGZlbmNlIHJldHVybmVkIGlu
c3RlYWQgb2YgYW4KZXJyb3IgcG9pbnRlciB3ZSBtdXN0IG5vdCB0cnkgdG8gY29udmVydCB0aGlz
IGludG8gYW4gZXJyb3IuIFRoZSBlcnJvcgpjb2RlIGluIHRoaXMgY2FzZSB3aWxsIGJlIDAsIHdo
aWNoIGNhdXNlcyBhIHdhcm5pbmcgc3BsYXQgZnJvbQpkbWFfZmVuY2Vfc2V0X2Vycm9yKCkuCgpB
bHNvIG1vc3QgZHJpdmVycyByZXR1cm4gTlVMTCBmcm9tIHRoZSBydW5fam9iIGNhbGxiYWNrIGlm
IHRoZSBmZW5jZQphbHJlYWR5IGhhcyB0aGUgZXJyb3Igc3RhdGUgc2V0LCBzbyB0cnlpbmcgdG8g
c2V0IGEgMCBlcnJvciBjb2RlCmFjdGl2ZWx5IGRlc3Ryb3lzIHRoZSB2YWxpZCBlcnJvciBjb2Rl
IG9uIHRoZSBmZW5jZS4KCkZpeGVzOiAxNjdiZjk2MDE0YTAgKGRybS9zY2hlZDogU2V0IGVycm9y
IHRvIHNfZmVuY2UgaWYgSFcgam9iCiAgICAgICBzdWJtaXNzaW9uIGZhaWxlZC4pClNpZ25lZC1v
ZmYtYnk6IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1dHJvbml4LmRlPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3NjaGVkdWxlci9zY2hlZF9tYWluLmMgYi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVk
X21haW4uYwppbmRleCBmMzliOTdlZDRhZGUuLjU5NmEyOGQ5MGU1YyAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L3NjaGVkdWxlci9zY2hlZF9tYWluLmMKQEAgLTQ5NSw3ICs0OTUsNyBAQCB2b2lkIGRybV9zY2hl
ZF9yZXN1Ym1pdF9qb2JzKHN0cnVjdCBkcm1fZ3B1X3NjaGVkdWxlciAqc2NoZWQpCiAJCWRtYV9m
ZW5jZV9wdXQoc19qb2ItPnNfZmVuY2UtPnBhcmVudCk7CiAJCWZlbmNlID0gc2NoZWQtPm9wcy0+
cnVuX2pvYihzX2pvYik7CiAKLQkJaWYgKElTX0VSUl9PUl9OVUxMKGZlbmNlKSkgeworCQlpZiAo
SVNfRVJSKGZlbmNlKSkgewogCQkJc19qb2ItPnNfZmVuY2UtPnBhcmVudCA9IE5VTEw7CiAJCQlk
bWFfZmVuY2Vfc2V0X2Vycm9yKCZzX2ZlbmNlLT5maW5pc2hlZCwgUFRSX0VSUihmZW5jZSkpOwog
CQl9IGVsc2UgewotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
