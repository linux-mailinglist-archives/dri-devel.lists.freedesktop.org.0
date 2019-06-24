Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 192265246D
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 09:28:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24CAC89FF7;
	Tue, 25 Jun 2019 07:27:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs18.siol.net [185.57.226.209])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54995899D5
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 15:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTP id 07E62522ABF;
 Mon, 24 Jun 2019 17:05:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta10.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta10.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id xoqTPOpf7QY5; Mon, 24 Jun 2019 17:05:40 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTPS id 98D1F522F0B;
 Mon, 24 Jun 2019 17:05:40 +0200 (CEST)
Received: from jernej-laptop.localnet (cpe-86-58-52-202.static.triera.net
 [86.58.52.202]) (Authenticated sender: jernej.skrabec@siol.net)
 by mail.siol.net (Postfix) with ESMTPA id CD736522ABF;
 Mon, 24 Jun 2019 17:05:37 +0200 (CEST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH 4/4] drm/sun4i: Enable DRM InfoFrame support on H6
Date: Mon, 24 Jun 2019 17:05:37 +0200
Message-ID: <6819050.kFKQ8T6p8H@jernej-laptop>
In-Reply-To: <baf95e6b-bfcf-27e7-1a00-ca877ae6f82d@samsung.com>
References: <VI1PR03MB420621617DDEAB3596700DE0AC1C0@VI1PR03MB4206.eurprd03.prod.outlook.com>
 <VI1PR03MB4206740285A775280063E303AC1C0@VI1PR03MB4206.eurprd03.prod.outlook.com>
 <baf95e6b-bfcf-27e7-1a00-ca877ae6f82d@samsung.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 25 Jun 2019 07:27:07 +0000
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
Cc: "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "khilman@baylibre.com" <khilman@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "wens@csie.org" <wens@csie.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "zhengyang@rock-chips.com" <zhengyang@rock-chips.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RG5lIHBvbmVkZWxqZWssIDI0LiBqdW5paiAyMDE5IG9iIDE3OjAzOjMxIENFU1QgamUgQW5kcnpl
aiBIYWpkYSBuYXBpc2FsKGEpOgo+IE9uIDI2LjA1LjIwMTkgMjM6MjAsIEpvbmFzIEthcmxtYW4g
d3JvdGU6Cj4gPiBUaGlzIHBhdGNoIGVuYWJsZXMgRHluYW1pYyBSYW5nZSBhbmQgTWFzdGVyaW5n
IEluZm9GcmFtZSBvbiBINi4KPiA+IAo+ID4gQ2M6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBh
cmRAYm9vdGxpbi5jb20+Cj4gPiBDYzogSmVybmVqIFNrcmFiZWMgPGplcm5lai5za3JhYmVjQHNp
b2wubmV0Pgo+ID4gU2lnbmVkLW9mZi1ieTogSm9uYXMgS2FybG1hbiA8am9uYXNAa3dpYm9vLnNl
Pgo+ID4gLS0tCj4gPiAKPiA+ICBkcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuOGlfZHdfaGRtaS5j
IHwgMiArKwo+ID4gIGRyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW44aV9kd19oZG1pLmggfCAxICsK
PiA+ICAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjhpX2R3X2hkbWkuYwo+ID4gYi9kcml2ZXJzL2dw
dS9kcm0vc3VuNGkvc3VuOGlfZHdfaGRtaS5jIGluZGV4IDM5ZDg1MDlkOTZhMC4uYjgwMTY0ZGQ4
YWQ4Cj4gPiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW44aV9kd19o
ZG1pLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW44aV9kd19oZG1pLmMKPiA+
IEBAIC0xODksNiArMTg5LDcgQEAgc3RhdGljIGludCBzdW44aV9kd19oZG1pX2JpbmQoc3RydWN0
IGRldmljZSAqZGV2LAo+ID4gc3RydWN0IGRldmljZSAqbWFzdGVyLD4gCj4gPiAgCXN1bjhpX2hk
bWlfcGh5X2luaXQoaGRtaS0+cGh5KTsKPiA+ICAJCj4gPiAgCXBsYXRfZGF0YS0+bW9kZV92YWxp
ZCA9IGhkbWktPnF1aXJrcy0+bW9kZV92YWxpZDsKPiA+IAo+ID4gKwlwbGF0X2RhdGEtPmRybV9p
bmZvZnJhbWUgPSBoZG1pLT5xdWlya3MtPmRybV9pbmZvZnJhbWU7Cj4gPiAKPiA+ICAJc3VuOGlf
aGRtaV9waHlfc2V0X29wcyhoZG1pLT5waHksIHBsYXRfZGF0YSk7Cj4gPiAgCQo+ID4gIAlwbGF0
Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBoZG1pKTsKPiA+IAo+ID4gQEAgLTI1NSw2ICsyNTYsNyBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IHN1bjhpX2R3X2hkbWlfcXVpcmtzCj4gPiBzdW44aV9hODN0
X3F1aXJrcyA9IHs+IAo+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc3VuOGlfZHdfaGRtaV9xdWly
a3Mgc3VuNTBpX2g2X3F1aXJrcyA9IHsKPiA+ICAKPiA+ICAJLm1vZGVfdmFsaWQgPSBzdW44aV9k
d19oZG1pX21vZGVfdmFsaWRfaDYsCj4gPiAKPiA+ICsJLmRybV9pbmZvZnJhbWUgPSB0cnVlLAo+
ID4gCj4gPiAgfTsKPiA+ICAKPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBz
dW44aV9kd19oZG1pX2R0X2lkc1tdID0gewo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3N1bjRpL3N1bjhpX2R3X2hkbWkuaAo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkv
c3VuOGlfZHdfaGRtaS5oIGluZGV4IDcyMGM1YWE4YWRjMS4uMmEwZWMwOGVlMjM2Cj4gPiAxMDA2
NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW44aV9kd19oZG1pLmgKPiA+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW44aV9kd19oZG1pLmgKPiA+IEBAIC0xNzgsNiAr
MTc4LDcgQEAgc3RydWN0IHN1bjhpX2R3X2hkbWlfcXVpcmtzIHsKPiA+IAo+ID4gIAllbnVtIGRy
bV9tb2RlX3N0YXR1cyAoKm1vZGVfdmFsaWQpKHN0cnVjdCBkcm1fY29ubmVjdG9yIAoqY29ubmVj
dG9yLAo+ID4gIAkKPiA+ICAJCQkJCSAgIGNvbnN0IHN0cnVjdCAKZHJtX2Rpc3BsYXlfbW9kZSAq
bW9kZSk7Cj4gPiAgCQo+ID4gIAl1bnNpZ25lZCBpbnQgc2V0X3JhdGUgOiAxOwo+ID4gCj4gPiAr
CXVuc2lnbmVkIGludCBkcm1faW5mb2ZyYW1lIDogMTsKPiAKPiBBZ2FpbiwgZHJtX2luZm9mcmFt
ZSBzdWdnZXN0cyBpdCBjb250YWlucyBpbmZvcmZyYW1lLCBidXQgaW4gZmFjdCBpdAo+IGp1c3Qg
aW5mb3JtcyBpbmZvZnJhbWUgY2FuIGJlIHVzZWQsIHNvIGFnYWluIG15IHN1Z2dlc3Rpb24KPiB1
c2VfZHJtX2luZm9mcmFtZS4KPiAKPiBNb3Jlb3ZlciBib29sIHR5cGUgc2VlbXMgbW9yZSBhcHBy
b3ByaWF0ZSBoZXJlLgoKY2hlY2twYXRjaCB3aWxsIGdpdmUgd2FybmluZyBpZiBib29sIGlzIHVz
ZWQuCgpCZXN0IHJlZ2FyZHMsCkplcm5lagoKPiAKPiBCZXNpZGUgdGhpczoKPiAKPiBSZXZpZXdl
ZC1ieTogQW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KPiAKPiAgLS0KPiBSZWdh
cmRzCj4gQW5kcnplago+IAo+ID4gIH07Cj4gPiAgCj4gPiAgc3RydWN0IHN1bjhpX2R3X2hkbWkg
ewoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
