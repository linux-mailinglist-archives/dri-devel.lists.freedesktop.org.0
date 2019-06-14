Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3DE458A8
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 11:29:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FB1F89487;
	Fri, 14 Jun 2019 09:29:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6BD089487
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 09:29:47 +0000 (UTC)
Received: from we0305.dip.tu-dresden.de ([141.76.177.49] helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1hbiWc-00044s-Js; Fri, 14 Jun 2019 11:29:34 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Jonas Karlman <jonas@kwiboo.se>
Subject: Re: [PATCH 2/4] drm/rockchip: Enable DRM InfoFrame support on RK3328
 and RK3399
Date: Fri, 14 Jun 2019 11:29:33 +0200
Message-ID: <4131981.039HHiXCja@phil>
In-Reply-To: <VI1PR03MB42062F51FD88AEB6DADD8734AC1C0@VI1PR03MB4206.eurprd03.prod.outlook.com>
References: <VI1PR03MB420621617DDEAB3596700DE0AC1C0@VI1PR03MB4206.eurprd03.prod.outlook.com>
 <VI1PR03MB42062F51FD88AEB6DADD8734AC1C0@VI1PR03MB4206.eurprd03.prod.outlook.com>
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
Cc: "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "khilman@baylibre.com" <khilman@baylibre.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "wens@csie.org" <wens@csie.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "zhengyang@rock-chips.com" <zhengyang@rock-chips.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gU29ubnRhZywgMjYuIE1haSAyMDE5LCAyMzoyMDowNSBDRVNUIHNjaHJpZWIgSm9uYXMgS2Fy
bG1hbjoKPiBUaGlzIHBhdGNoIGVuYWJsZXMgRHluYW1pYyBSYW5nZSBhbmQgTWFzdGVyaW5nIElu
Zm9GcmFtZSBvbiBSSzMzMjggYW5kIFJLMzM5OS4KPiAKPiBDYzogU2FuZHkgSHVhbmcgPGhqY0By
b2NrLWNoaXBzLmNvbT4KPiBDYzogSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4KPiBT
aWduZWQtb2ZmLWJ5OiBKb25hcyBLYXJsbWFuIDxqb25hc0Brd2lib28uc2U+CgpSZXZpZXdlZC1i
eTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4KCj4gLS0tCj4gIGRyaXZlcnMvZ3B1
L2RybS9yb2NrY2hpcC9kd19oZG1pLXJvY2tjaGlwLmMgfCAyICsrCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JvY2tj
aGlwL2R3X2hkbWktcm9ja2NoaXAuYyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9kd19oZG1p
LXJvY2tjaGlwLmMKPiBpbmRleCA0Y2RjOWY4NmMyZTUuLjFmMzFmMzcyNmYwNCAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvZHdfaGRtaS1yb2NrY2hpcC5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2R3X2hkbWktcm9ja2NoaXAuYwo+IEBAIC00MDUsNiAr
NDA1LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkd19oZG1pX3BsYXRfZGF0YSByazMzMjhfaGRt
aV9kcnZfZGF0YSA9IHsKPiAgCS5waHlfb3BzID0gJnJrMzMyOF9oZG1pX3BoeV9vcHMsCj4gIAku
cGh5X25hbWUgPSAiaW5ub19kd19oZG1pX3BoeTIiLAo+ICAJLnBoeV9mb3JjZV92ZW5kb3IgPSB0
cnVlLAo+ICsJLmRybV9pbmZvZnJhbWUgPSB0cnVlLAo+ICB9Owo+ICAKPiAgc3RhdGljIHN0cnVj
dCByb2NrY2hpcF9oZG1pX2NoaXBfZGF0YSByazMzOTlfY2hpcF9kYXRhID0gewo+IEBAIC00MTks
NiArNDIwLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkd19oZG1pX3BsYXRfZGF0YSByazMzOTlf
aGRtaV9kcnZfZGF0YSA9IHsKPiAgCS5jdXJfY3RyICAgID0gcm9ja2NoaXBfY3VyX2N0ciwKPiAg
CS5waHlfY29uZmlnID0gcm9ja2NoaXBfcGh5X2NvbmZpZywKPiAgCS5waHlfZGF0YSA9ICZyazMz
OTlfY2hpcF9kYXRhLAo+ICsJLmRybV9pbmZvZnJhbWUgPSB0cnVlLAo+ICB9Owo+ICAKPiAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgZHdfaGRtaV9yb2NrY2hpcF9kdF9pZHNbXSA9
IHsKPiAtLSAKPiAyLjE3LjEKPiAKPiAKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
