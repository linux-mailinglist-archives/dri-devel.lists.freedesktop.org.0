Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD34D5247D
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 09:28:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FBB26E03E;
	Tue, 25 Jun 2019 07:27:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs15.siol.net [185.57.226.206])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7208A89CBA
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 16:03:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTP id 856D25217DD;
 Mon, 24 Jun 2019 18:03:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id 5-irDH8c65qw; Mon, 24 Jun 2019 18:03:47 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTPS id 191D3521B78;
 Mon, 24 Jun 2019 18:03:47 +0200 (CEST)
Received: from jernej-laptop.localnet (cpe-86-58-52-202.static.triera.net
 [86.58.52.202]) (Authenticated sender: jernej.skrabec@siol.net)
 by mail.siol.net (Postfix) with ESMTPA id DB4C25217DD;
 Mon, 24 Jun 2019 18:03:45 +0200 (CEST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 4/4] drm/sun4i: Enable DRM InfoFrame support on H6
Date: Mon, 24 Jun 2019 18:03:45 +0200
Message-ID: <44611965.cJa5QBey4U@jernej-laptop>
In-Reply-To: <CAGb2v67FF3k9wZu7K+Z5yKFFeh8A_4iuEXfh+tO65UvVRfY-sA@mail.gmail.com>
References: <VI1PR03MB420621617DDEAB3596700DE0AC1C0@VI1PR03MB4206.eurprd03.prod.outlook.com>
 <3f9e51d5-8ca5-a439-943c-26de92dd52fe@samsung.com>
 <CAGb2v67FF3k9wZu7K+Z5yKFFeh8A_4iuEXfh+tO65UvVRfY-sA@mail.gmail.com>
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
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "zhengyang@rock-chips.com" <zhengyang@rock-chips.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RG5lIHBvbmVkZWxqZWssIDI0LiBqdW5paiAyMDE5IG9iIDE3OjU2OjMwIENFU1QgamUgQ2hlbi1Z
dSBUc2FpIG5hcGlzYWwoYSk6Cj4gT24gTW9uLCBKdW4gMjQsIDIwMTkgYXQgMTE6NDkgUE0gQW5k
cnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4gd3JvdGU6Cj4gPiBPbiAyNC4wNi4yMDE5
IDE3OjA1LCBKZXJuZWogxaBrcmFiZWMgd3JvdGU6Cj4gPiA+IERuZSBwb25lZGVsamVrLCAyNC4g
anVuaWogMjAxOSBvYiAxNzowMzozMSBDRVNUIGplIEFuZHJ6ZWogSGFqZGEgCm5hcGlzYWwoYSk6
Cj4gPiA+PiBPbiAyNi4wNS4yMDE5IDIzOjIwLCBKb25hcyBLYXJsbWFuIHdyb3RlOgo+ID4gPj4+
IFRoaXMgcGF0Y2ggZW5hYmxlcyBEeW5hbWljIFJhbmdlIGFuZCBNYXN0ZXJpbmcgSW5mb0ZyYW1l
IG9uIEg2Lgo+ID4gPj4+IAo+ID4gPj4+IENjOiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJk
QGJvb3RsaW4uY29tPgo+ID4gPj4+IENjOiBKZXJuZWogU2tyYWJlYyA8amVybmVqLnNrcmFiZWNA
c2lvbC5uZXQ+Cj4gPiA+Pj4gU2lnbmVkLW9mZi1ieTogSm9uYXMgS2FybG1hbiA8am9uYXNAa3dp
Ym9vLnNlPgo+ID4gPj4+IC0tLQo+ID4gPj4+IAo+ID4gPj4+ICBkcml2ZXJzL2dwdS9kcm0vc3Vu
NGkvc3VuOGlfZHdfaGRtaS5jIHwgMiArKwo+ID4gPj4+ICBkcml2ZXJzL2dwdS9kcm0vc3VuNGkv
c3VuOGlfZHdfaGRtaS5oIHwgMSArCj4gPiA+Pj4gIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspCj4gPiA+Pj4gCj4gPiA+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zdW40
aS9zdW44aV9kd19oZG1pLmMKPiA+ID4+PiBiL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW44aV9k
d19oZG1pLmMgaW5kZXgKPiA+ID4+PiAzOWQ4NTA5ZDk2YTAuLmI4MDE2NGRkOGFkOAo+ID4gPj4+
IDEwMDY0NAo+ID4gPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW44aV9kd19oZG1p
LmMKPiA+ID4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuOGlfZHdfaGRtaS5jCj4g
PiA+Pj4gQEAgLTE4OSw2ICsxODksNyBAQCBzdGF0aWMgaW50IHN1bjhpX2R3X2hkbWlfYmluZChz
dHJ1Y3QgZGV2aWNlICpkZXYsCj4gPiA+Pj4gc3RydWN0IGRldmljZSAqbWFzdGVyLD4KPiA+ID4+
PiAKPiA+ID4+PiAgICAgc3VuOGlfaGRtaV9waHlfaW5pdChoZG1pLT5waHkpOwo+ID4gPj4+ICAg
ICAKPiA+ID4+PiAgICAgcGxhdF9kYXRhLT5tb2RlX3ZhbGlkID0gaGRtaS0+cXVpcmtzLT5tb2Rl
X3ZhbGlkOwo+ID4gPj4+IAo+ID4gPj4+ICsgICBwbGF0X2RhdGEtPmRybV9pbmZvZnJhbWUgPSBo
ZG1pLT5xdWlya3MtPmRybV9pbmZvZnJhbWU7Cj4gPiA+Pj4gCj4gPiA+Pj4gICAgIHN1bjhpX2hk
bWlfcGh5X3NldF9vcHMoaGRtaS0+cGh5LCBwbGF0X2RhdGEpOwo+ID4gPj4+ICAgICAKPiA+ID4+
PiAgICAgcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgaGRtaSk7Cj4gPiA+Pj4gCj4gPiA+Pj4g
QEAgLTI1NSw2ICsyNTYsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHN1bjhpX2R3X2hkbWlfcXVp
cmtzCj4gPiA+Pj4gc3VuOGlfYTgzdF9xdWlya3MgPSB7Pgo+ID4gPj4+IAo+ID4gPj4+ICBzdGF0
aWMgY29uc3Qgc3RydWN0IHN1bjhpX2R3X2hkbWlfcXVpcmtzIHN1bjUwaV9oNl9xdWlya3MgPSB7
Cj4gPiA+Pj4gIAo+ID4gPj4+ICAgICAubW9kZV92YWxpZCA9IHN1bjhpX2R3X2hkbWlfbW9kZV92
YWxpZF9oNiwKPiA+ID4+PiAKPiA+ID4+PiArICAgLmRybV9pbmZvZnJhbWUgPSB0cnVlLAo+ID4g
Pj4+IAo+ID4gPj4+ICB9Owo+ID4gPj4+ICAKPiA+ID4+PiAgc3RhdGljIGNvbnN0IHN0cnVjdCBv
Zl9kZXZpY2VfaWQgc3VuOGlfZHdfaGRtaV9kdF9pZHNbXSA9IHsKPiA+ID4+PiAKPiA+ID4+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjhpX2R3X2hkbWkuaAo+ID4gPj4+
IGIvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjhpX2R3X2hkbWkuaCBpbmRleAo+ID4gPj4+IDcy
MGM1YWE4YWRjMS4uMmEwZWMwOGVlMjM2Cj4gPiA+Pj4gMTAwNjQ0Cj4gPiA+Pj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3N1bjRpL3N1bjhpX2R3X2hkbWkuaAo+ID4gPj4+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9zdW40aS9zdW44aV9kd19oZG1pLmgKPiA+ID4+PiBAQCAtMTc4LDYgKzE3OCw3IEBA
IHN0cnVjdCBzdW44aV9kd19oZG1pX3F1aXJrcyB7Cj4gPiA+Pj4gCj4gPiA+Pj4gICAgIGVudW0g
ZHJtX21vZGVfc3RhdHVzICgqbW9kZV92YWxpZCkoc3RydWN0IGRybV9jb25uZWN0b3IKPiA+ID4g
Cj4gPiA+ICpjb25uZWN0b3IsCj4gPiA+IAo+ID4gPj4+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdAo+ID4gPiAKPiA+ID4gZHJtX2Rpc3BsYXlfbW9k
ZSAqbW9kZSk7Cj4gPiA+IAo+ID4gPj4+ICAgICB1bnNpZ25lZCBpbnQgc2V0X3JhdGUgOiAxOwo+
ID4gPj4+IAo+ID4gPj4+ICsgICB1bnNpZ25lZCBpbnQgZHJtX2luZm9mcmFtZSA6IDE7Cj4gPiA+
PiAKPiA+ID4+IEFnYWluLCBkcm1faW5mb2ZyYW1lIHN1Z2dlc3RzIGl0IGNvbnRhaW5zIGluZm9y
ZnJhbWUsIGJ1dCBpbiBmYWN0IGl0Cj4gPiA+PiBqdXN0IGluZm9ybXMgaW5mb2ZyYW1lIGNhbiBi
ZSB1c2VkLCBzbyBhZ2FpbiBteSBzdWdnZXN0aW9uCj4gPiA+PiB1c2VfZHJtX2luZm9mcmFtZS4K
PiA+ID4+IAo+ID4gPj4gTW9yZW92ZXIgYm9vbCB0eXBlIHNlZW1zIG1vcmUgYXBwcm9wcmlhdGUg
aGVyZS4KPiA+ID4gCj4gPiA+IGNoZWNrcGF0Y2ggd2lsbCBnaXZlIHdhcm5pbmcgaWYgYm9vbCBp
cyB1c2VkLgo+ID4gCj4gPiBUaGVuIEkgd291bGQgc2F5ICJmaXgvaWdub3JlIGNoZWNrcGF0Y2gi
IDopCj4gPiAKPiA+IEJ1dCBtYXliZSB0aGVyZSBpcyBhIHJlYXNvbi4KPiAKPiBIZXJlJ3MgYW4g
b2xkIG9uZSBmcm9tIExpbnVzOiBodHRwczovL2xrbWwub3JnL2xrbWwvMjAxMy85LzEvMTU0Cj4g
Cj4gSSdkIHNheSB0aGF0IGJvb2wgaW4gYSBzdHJ1Y3QgaXMgYSB3YXN0ZSBvZiBzcGFjZSBjb21w
YXJlZCB0byBhIDEgYml0Cj4gYml0ZmllbGQsIGVzcGVjaWFsbHkgd2hlbiB0aGVyZSBhbHJlYWR5
IGFyZSBvdGhlciBiaXRmaWVsZHMgaW4gdGhlIHNhbWUKPiBzdHJ1Y3QuCj4gPiBBbnl3YXkgSSd2
ZSB0ZXN0ZWQgYW5kIEkgZG8gbm90IHNlZSB0aGUgd2FybmluZywgY291bGQgeW91IGVsYWJvcmF0
ZSBpdC4KPiAKPiBNYXliZSBjaGVja3BhdGNoLnBsIC0tc3RyaWN0PwoKSXQgc2VlbXMgdGhleSBy
ZW1vdmVkIHRoYXQgY2hlY2s6Cmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L25leHQvbGludXgtbmV4dC5naXQvY29tbWl0Lz8KaWQ9Nzk2NzY1NmZmYmZhNDkz
ZjU1NDZjMGYxCgpBZnRlciByZWFkaW5nIHRoYXQgYmxvY2sgb2YgdGV4dCwgSSdtIG5vdCBzdXJl
IHdoYXQgd291bGQgYmUgcHJlZmVyZWQgd2F5IGZvciAKdGhpcyBjYXNlLgoKQmVzdCByZWdhcmRz
LApKZXJuZWoKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
