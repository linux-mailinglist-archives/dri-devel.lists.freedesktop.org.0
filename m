Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8942B410
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 14:04:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE78F89A9A;
	Mon, 27 May 2019 12:03:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE3B89F6E
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 20:08:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id A73DC283E19
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sre@kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Tony Lindgren <tony@atomide.com>, Pavel Machek <pavel@ucw.cz>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCHv6 2/4] drm/omap: don't check dispc timings for DSI
Date: Thu, 23 May 2019 22:07:54 +0200
Message-Id: <20190523200756.25314-3-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523200756.25314-1-sebastian.reichel@collabora.com>
References: <20190523200756.25314-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 27 May 2019 12:03:54 +0000
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
Cc: kernel@collabora.com, "H. Nikolaus Schaller" <hns@goldelico.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 linux-omap@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hpbGUgbW9zdCBkaXNwbGF5IHR5cGVzIG9ubHkgZm9yd2FyZCB0aGVpciBWTSB0byB0aGUgRElT
UEMsIHRoaXMKaXMgbm90IHRydWUgZm9yIERTSS4gRFNJIGNhbGN1bGF0ZXMgdGhlIFZNIGZvciBE
SVNQQyBiYXNlZCBvbiBpdHMKb3duLCBidXQgaXQncyBub3QgaWRlbnRpY2FsLiBBY3R1YWxseSB0
aGUgRFNJIFZNIGlzIG5vdCBldmVuIGEgdmFsaWQKRElTUEMgVk0gbWFraW5nIHRoaXMgY2hlY2sg
ZmFpbC4gTGV0J3MgcmVzdG9yZSB0aGUgb2xkIGJlaGF2aW91cgphbmQgYXZvaWQgY2hlY2tpbmcg
dGhlIERJU1BDIFZNIGZvciBEU0kgaGVyZS4KCkZpeGVzOiA3YzI3ZmE1N2VmMzEgKCJkcm0vb21h
cDogQ2FsbCBkaXNwYyB0aW1pbmdzIGNoZWNrIG9wZXJhdGlvbiBkaXJlY3RseSIpCkFja2VkLWJ5
OiBQYXZlbCBNYWNoZWsgPHBhdmVsQHVjdy5jej4KVGVzdGVkLWJ5OiBUb255IExpbmRncmVuIDx0
b255QGF0b21pZGUuY29tPgpUZXN0ZWQtYnk6IFBhdmVsIE1hY2hlayA8cGF2ZWxAdWN3LmN6PgpT
aWduZWQtb2ZmLWJ5OiBTZWJhc3RpYW4gUmVpY2hlbCA8c2ViYXN0aWFuLnJlaWNoZWxAY29sbGFi
b3JhLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2NydGMuYyB8IDE4ICsr
KysrKysrKysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9jcnRj
LmMgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2NydGMuYwppbmRleCA1YTI5YmYwMWMw
ZTguLjg2ODI3YTA2MWIwYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21h
cF9jcnRjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9jcnRjLmMKQEAgLTM5
NSwxMCArMzk1LDIwIEBAIHN0YXRpYyBlbnVtIGRybV9tb2RlX3N0YXR1cyBvbWFwX2NydGNfbW9k
ZV92YWxpZChzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCiAJaW50IHI7CiAKIAlkcm1fZGlzcGxheV9t
b2RlX3RvX3ZpZGVvbW9kZShtb2RlLCAmdm0pOwotCXIgPSBwcml2LT5kaXNwY19vcHMtPm1ncl9j
aGVja190aW1pbmdzKHByaXYtPmRpc3BjLCBvbWFwX2NydGMtPmNoYW5uZWwsCi0JCQkJCSAgICAg
ICAmdm0pOwotCWlmIChyKQotCQlyZXR1cm4gcjsKKworCS8qCisJICogRFNJIG1pZ2h0IG5vdCBj
YWxsIHRoaXMsIHNpbmNlIHRoZSBzdXBwbGllZCBtb2RlIGlzIG5vdCBhCisJICogdmFsaWQgRElT
UEMgbW9kZS4gRFNJIHdpbGwgY2FsY3VsYXRlIGFuZCBjb25maWd1cmUgdGhlCisJICogcHJvcGVy
IERJU1BDIG1vZGUgbGF0ZXIuCisJICovCisJaWYgKG9tYXBfY3J0Yy0+cGlwZS0+b3V0cHV0LT5u
ZXh0ID09IE5VTEwgfHwKKwkgICAgb21hcF9jcnRjLT5waXBlLT5vdXRwdXQtPm5leHQtPnR5cGUg
IT0gT01BUF9ESVNQTEFZX1RZUEVfRFNJKSB7CisJCXIgPSBwcml2LT5kaXNwY19vcHMtPm1ncl9j
aGVja190aW1pbmdzKHByaXYtPmRpc3BjLAorCQkJCQkJICAgICAgIG9tYXBfY3J0Yy0+Y2hhbm5l
bCwKKwkJCQkJCSAgICAgICAmdm0pOworCQlpZiAocikKKwkJCXJldHVybiByOworCX0KIAogCS8q
IENoZWNrIGZvciBiYW5kd2lkdGggbGltaXQgKi8KIAlpZiAocHJpdi0+bWF4X2JhbmR3aWR0aCkg
ewotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
