Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85ED073316
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 17:52:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33C8A6E5DD;
	Wed, 24 Jul 2019 15:52:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73D1C6E5DC
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 15:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 3F193FB06;
 Wed, 24 Jul 2019 17:52:29 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c2rVJsA1noyh; Wed, 24 Jul 2019 17:52:27 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id E638A43417; Wed, 24 Jul 2019 17:52:26 +0200 (CEST)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Robert Chiras <robert.chiras@nxp.com>
Subject: [PATCH 0/3] drm: bridge: Add NWL MIPI DSI host controller support
Date: Wed, 24 Jul 2019 17:52:23 +0200
Message-Id: <cover.1563983037.git.agx@sigxcpu.org>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBhZGRzIGluaXRpYWwgc3VwcG9ydCBmb3IgdGhlIE5XTCBNSVBJIERTSSBIb3N0IGNvbnRy
b2xsZXIgZm91bmQgb24gaS5NWDgKU29Dcy4KCkl0IGFkZHMgc3VwcG9ydCBmb3IgdGhlIGkuTVg4
TVEgYnV0IHRoZSBzYW1lIElQIGNvcmUgY2FuIGFsc28gYmUgZm91bmQgb24gZS5nLgppLk1YOFFY
UC4gSSBhZGRlZCB0aGUgbmVjZXNzYXJ5IGhvb2tzIHRvIHN1cHBvcnQgb3RoZXIgaW14OCB2YXJp
YW50cyBidXQgc2luY2UKSSBvbmx5IGhhdmUgaW14OG1xIGJvYXJkcyB0byB0ZXN0IEkgb21pdHRl
ZCB0aGUgcGxhdGZvcm0gZGF0YSBmb3Igb3RoZXIgU29Dcy4KClRoZSBjb2RlIGlzIGJhc2VkIG9u
IE5YUHMgQlNQIHNvIEkgYWRkZWQgUm9iZXJ0IENoaXJhcyBhcwpDby1hdXRob3JlZC1ieS4gUm9i
ZXJ0LCBpZiB0aGlzIGxvb2tzIHNhbmUgY291bGQgeW91IGFkZCB5b3VyClNpZ25lZC1vZmYtYnk6
PwoKVGhlIG1vc3Qgbm90YWJsZSBjaGFuZ2VzIG92ZXIgdGhlIEJTUCBkcml2ZXIgYXJlCiAtIENh
bGN1bGF0ZSBIUyBtb2RlIHRpbWluZyBmcm9tIHBoeV9jb25maWd1cmVfb3B0c19taXBpX2RwaHkK
IC0gUGVyZm9ybSBhbGwgY2xvY2sgc2V0dXAgdmlhIERUCiAtIE1lcmdlIG53bC1pbXggYW5kIG53
bCBkcml2ZXJzCiAtIEFkZCBCMCBzaWxpb24gcmV2aXNpb24gcXVpcmsKIC0gYmVjb21lIGEgYnJp
ZGdlIGRyaXZlciB0byBob29rIGludG8gbXhzZmIgKGZyb20gd2hhdCBJIHJlYWRbMF0gRENTUywg
d2hpY2gKICAgYWxzbyBjYW4gZHJpdmUgdGhlIG53bCBvbiB0aGUgaW14OG1xIHdpbGwgbGlrZWx5
IG5vdCBiZWNvbWUgcGFydCBvZgogICBpbXgtZGlzcGxheS1zdWJzeXN0ZW0gc28gaXQgbWFrZXMg
c2Vuc2UgdG8gbWFrZSBpdCBkcml2ZSBhIGJyaWRnZSBmb3IgZHNpIGFzCiAgIHdlbGwpLgogLSBV
c2UgcGFuZWxfYnJpZGdlIHRvIGF0dGFjaCB0aGUgcGFuZWwKClRoaXMgaGFzIGJlZW4gdGVzdGVk
IG9uIGEgTGlicmVtIDUgZGV2a2l0IHVzaW5nIG14c2ZiIHdpdGggUm9iZXJ0J3MgcGF0Y2hlc1sx
XQphbmQgdGhlIHJvY2t0ZWNoLWpoMDU3bjAwOTAwIHBhbmVsIGRyaXZlci4gVGhlIERDU1MgY2Fu
IGxhdGVyIG9uIGFsc28gYWN0IGFzCmlucHV0IHNvdXJjZSB0b28uCgpDaGFuZ2VzIGZyb20gdjA6
Ci0gQWRkIHF1aXJrIGZvciBJTVE4TVEgc2lsaWNvbiBCMCByZXZpc2lvbiB0byBub3QgbWVzcyB3
aXRoIHRoZQogIHN5c3RlbSByZXNldCBjb250cm9sbGVyIG9uIHBvd2VyIGRvd24gc2luY2UgZW5h
YmxlKCkgd29uJ3Qgd29yawogIG90aGVyd2lzZS4KLSBEcm9wIGRldm1fZnJlZV9pcnEoKSBoYW5k
bGVkIGJ5IHRoZSBkZXZpY2UgZHJpdmVyIGNvcmUKLSBEaXNhYmxlIHR4IGVzYyBjbG9jayBhZnRl
ciB0aGUgcGh5IHBvd2VyIGRvd24gdG8gdW5icmVhawogIGRpc2FibGUvZW5hYmxlICh1bmJsYW5r
L2JsYW5rKQotIEFkZCBwb3J0cyB0byBkdCBiaW5kaW5nIGRvY3MKLSBTZWxlY3QgR0VORVJJQ19Q
SFlfTUlQSV9EUEhZIGluc3RlYWQgb2YgR0VORVJJQ19QSFkgZm9yCiAgcGh5X21pcGlfZHBoeV9n
ZXRfZGVmYXVsdF9jb25maWcKLSBTZWxlY3QgRFJNX01JUElfRFNJCi0gSW5jbHVkZSBkcm1fcHJp
bnQuaCB0byBmaXggYnVpbGQgb24gbmV4dC0yMDE5MDQwOAotIERyb3Agc29tZSBkZWJ1Z2dpbmcg
bWVzc2FnZXMKLSBOZXdsaW5lIHRlcm1pbmF0ZSBhbGwgRFJNXyBwcmludG91dHMKLSBUdXJuIGNv
bXBvbmVudCBkcml2ZXIgaW50byBhIGRybSBicmlkZ2UKClswXTogaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvYXJjaGl2ZXMvZHJpLWRldmVsLzIwMTktTWF5LzIxOTQ4NC5odG1sClsxXTog
aHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy82MjgyMi8KCkd1aWRvIEfD
vG50aGVyICgzKToKICBhcm02NDogaW14OG1xOiBhZGQgaW14OG1xIGlvbXV4LWdwciBmaWVsZCBk
ZWZpbmVzCiAgZHQtYmluZGluZ3M6IGRpc3BsYXkvYnJpZGdlOiBBZGQgYmluZGluZyBmb3IgSU1Y
IE5XTCBtaXBpIGRzaSBob3N0CiAgICBjb250cm9sbGVyCiAgZHJtL2JyaWRnZTogQWRkIE5XTCBN
SVBJIERTSSBob3N0IGNvbnRyb2xsZXIgc3VwcG9ydAoKIC4uLi9iaW5kaW5ncy9kaXNwbGF5L2Jy
aWRnZS9pbXgtbndsLWRzaS50eHQgICB8ICA4OSArKysKIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
S2NvbmZpZyAgICAgICAgICAgICAgICB8ICAgMiArCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL01h
a2VmaWxlICAgICAgICAgICAgICAgfCAgIDEgKwogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9pbXgt
bndsL0tjb25maWcgICAgICAgIHwgIDE1ICsKIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvaW14LW53
bC9NYWtlZmlsZSAgICAgICB8ICAgMiArCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2lteC1ud2wv
bndsLWRydi5jICAgICAgfCA1MjkgKysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9pbXgtbndsL253bC1kcnYuaCAgICAgIHwgIDcyICsrCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L2lteC1ud2wvbndsLWRzaS5jICAgICAgfCA3NDUgKysrKysrKysrKysrKysrKysrCiBkcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL2lteC1ud2wvbndsLWRzaS5oICAgICAgfCAxMTEgKysrCiBpbmNsdWRl
L2xpbnV4L21mZC9zeXNjb24vaW14OG1xLWlvbXV4Yy1ncHIuaCAgfCAgNjIgKysKIDEwIGZpbGVz
IGNoYW5nZWQsIDE2MjggaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9pbXgtbndsLWRzaS50eHQK
IGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2lteC1ud2wvS2NvbmZp
ZwogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvaW14LW53bC9NYWtl
ZmlsZQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvaW14LW53bC9u
d2wtZHJ2LmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2lteC1u
d2wvbndsLWRydi5oCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9p
bXgtbndsL253bC1kc2kuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvaW14LW53bC9ud2wtZHNpLmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L21m
ZC9zeXNjb24vaW14OG1xLWlvbXV4Yy1ncHIuaAoKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
