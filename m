Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD92A265F3
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 16:37:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC1A789B45;
	Wed, 22 May 2019 14:36:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DCDA8935B
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 12:15:22 +0000 (UTC)
Date: Tue, 21 May 2019 14:15:19 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v5 5/6] drm: sun4i: Add support for enabling DDC I2C bus
 to sun8i_dw_hdmi glue
Message-ID: <20190521121519.k343dgv3cgpewjl2@core.my.home>
Mail-Followup-To: Maxime Ripard <maxime.ripard@bootlin.com>,
 linux-sunxi@googlegroups.com, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Mark Rutland <mark.rutland@arm.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20190520235009.16734-1-megous@megous.com>
 <20190520235009.16734-6-megous@megous.com>
 <20190521114611.ylmbo2oqeanveil4@flea>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190521114611.ylmbo2oqeanveil4@flea>
X-Mailman-Approved-At: Wed, 22 May 2019 14:35:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=megous.com; s=mail; 
 t=1558440920; bh=VGlJ9wO7InEXoKlQsJrI3YYXQgBrZfsVum4dwV9O/qw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H8itSFBTgfJexSfOsuGiRevevVee8AWok+TNwvYGh7+dE1NYC7HRI8brRhf87wLga
 d9QkGESJyeoaSCyRYs3EQ2grPw+h1Uha56OooMFMOlk4Sm5xTp26Bz32P9/VowQFZP
 xDHQqFWmk/FSFXR/1nm1hEhj9MMSZ7GIUAjIabwA=
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
Cc: Mark Rutland <mark.rutland@arm.com>, Jose Abreu <joabreu@synopsys.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-sunxi@googlegroups.com, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWF4aW1lLAoKT24gVHVlLCBNYXkgMjEsIDIwMTkgYXQgMDE6NDY6MTFQTSArMDIwMCwgTWF4
aW1lIFJpcGFyZCB3cm90ZToKPiBIaSwKPiAKPiBPbiBUdWUsIE1heSAyMSwgMjAxOSBhdCAwMTo1
MDowOEFNICswMjAwLCBtZWdvdXNAbWVnb3VzLmNvbSB3cm90ZToKPiA+IEZyb206IE9uZHJlaiBK
aXJtYW4gPG1lZ291c0BtZWdvdXMuY29tPgo+ID4KPiA+IE9yYW5nZSBQaSAzIGJvYXJkIHJlcXVp
cmVzIGVuYWJsaW5nIGEgdm9sdGFnZSBzaGlmdGluZyBjaXJjdWl0IHZpYSBHUElPCj4gPiBmb3Ig
dGhlIEREQyBidXMgdG8gYmUgdXNhYmxlLgo+ID4KPiA+IEFkZCBzdXBwb3J0IGZvciBoZG1pLWNv
bm5lY3RvciBub2RlJ3Mgb3B0aW9uYWwgZGRjLWVuLWdwaW9zIHByb3BlcnR5IHRvCj4gPiBzdXBw
b3J0IHRoaXMgdXNlIGNhc2UuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogT25kcmVqIEppcm1hbiA8
bWVnb3VzQG1lZ291cy5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3Vu
OGlfZHdfaGRtaS5jIHwgNTUgKysrKysrKysrKysrKysrKysrKysrKysrKy0tCj4gPiAgZHJpdmVy
cy9ncHUvZHJtL3N1bjRpL3N1bjhpX2R3X2hkbWkuaCB8ICAzICsrCj4gPiAgMiBmaWxlcyBjaGFu
Z2VkLCA1NSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuOGlfZHdfaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJt
L3N1bjRpL3N1bjhpX2R3X2hkbWkuYwo+ID4gaW5kZXggMzlkODUwOWQ5NmEwLi41OWI4MWJhMDJk
OTYgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuOGlfZHdfaGRtaS5j
Cj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuOGlfZHdfaGRtaS5jCj4gPiBAQCAt
OTgsNiArOTgsMzAgQEAgc3RhdGljIHUzMiBzdW44aV9kd19oZG1pX2ZpbmRfcG9zc2libGVfY3J0
Y3Moc3RydWN0IGRybV9kZXZpY2UgKmRybSwKPiA+ICAJcmV0dXJuIGNydGNzOwo+ID4gIH0KPiA+
Cj4gPiArc3RhdGljIGludCBzdW44aV9kd19oZG1pX2ZpbmRfY29ubmVjdG9yX3BkZXYoc3RydWN0
IGRldmljZSAqZGV2LAo+ID4gKwkJCQkJICAgICBzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICoqcGRl
dl9vdXQpCj4gPiArewo+ID4gKwlzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2Owo+ID4gKwlz
dHJ1Y3QgZGV2aWNlX25vZGUgKnJlbW90ZTsKPiA+ICsKPiA+ICsJcmVtb3RlID0gb2ZfZ3JhcGhf
Z2V0X3JlbW90ZV9ub2RlKGRldi0+b2Zfbm9kZSwgMSwgLTEpOwo+ID4gKwlpZiAoIXJlbW90ZSkK
PiA+ICsJCXJldHVybiAtRU5PREVWOwo+ID4gKwo+ID4gKwlpZiAoIW9mX2RldmljZV9pc19jb21w
YXRpYmxlKHJlbW90ZSwgImhkbWktY29ubmVjdG9yIikpIHsKPiA+ICsJCW9mX25vZGVfcHV0KHJl
bW90ZSk7Cj4gPiArCQlyZXR1cm4gLUVOT0RFVjsKPiA+ICsJfQo+ID4gKwo+ID4gKwlwZGV2ID0g
b2ZfZmluZF9kZXZpY2VfYnlfbm9kZShyZW1vdGUpOwo+ID4gKwlvZl9ub2RlX3B1dChyZW1vdGUp
Owo+ID4gKwlpZiAoIXBkZXYpCj4gPiArCQlyZXR1cm4gLUVOT0RFVjsKPiA+ICsKPiA+ICsJKnBk
ZXZfb3V0ID0gcGRldjsKPiA+ICsJcmV0dXJuIDA7Cj4gPiArfQo+ID4gKwo+ID4gIHN0YXRpYyBp
bnQgc3VuOGlfZHdfaGRtaV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAq
bWFzdGVyLAo+ID4gIAkJCSAgICAgIHZvaWQgKmRhdGEpCj4gPiAgewo+ID4gQEAgLTE1MSwxNiAr
MTc1LDI5IEBAIHN0YXRpYyBpbnQgc3VuOGlfZHdfaGRtaV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRl
diwgc3RydWN0IGRldmljZSAqbWFzdGVyLAo+ID4gIAkJcmV0dXJuIFBUUl9FUlIoaGRtaS0+cmVn
dWxhdG9yKTsKPiA+ICAJfQo+ID4KPiA+ICsJcmV0ID0gc3VuOGlfZHdfaGRtaV9maW5kX2Nvbm5l
Y3Rvcl9wZGV2KGRldiwgJmhkbWktPmNvbm5lY3Rvcl9wZGV2KTsKPiA+ICsJaWYgKCFyZXQpIHsK
PiA+ICsJCWhkbWktPmRkY19lbiA9IGdwaW9kX2dldF9vcHRpb25hbCgmaGRtaS0+Y29ubmVjdG9y
X3BkZXYtPmRldiwKPiA+ICsJCQkJCQkgICJkZGMtZW4iLCBHUElPRF9PVVRfSElHSCk7Cj4gPiAr
CQlpZiAoSVNfRVJSKGhkbWktPmRkY19lbikpIHsKPiA+ICsJCQlwbGF0Zm9ybV9kZXZpY2VfcHV0
KGhkbWktPmNvbm5lY3Rvcl9wZGV2KTsKPiA+ICsJCQlkZXZfZXJyKGRldiwgIkNvdWxkbid0IGdl
dCBkZGMtZW4gZ3Bpb1xuIik7Cj4gPiArCQkJcmV0dXJuIFBUUl9FUlIoaGRtaS0+ZGRjX2VuKTsK
PiA+ICsJCX0KPiA+ICsJfQo+ID4gKwo+ID4gIAlyZXQgPSByZWd1bGF0b3JfZW5hYmxlKGhkbWkt
PnJlZ3VsYXRvcik7Cj4gPiAgCWlmIChyZXQpIHsKPiA+ICAJCWRldl9lcnIoZGV2LCAiRmFpbGVk
IHRvIGVuYWJsZSByZWd1bGF0b3JcbiIpOwo+ID4gLQkJcmV0dXJuIHJldDsKPiA+ICsJCWdvdG8g
ZXJyX3VucmVmX2RkY19lbjsKPiA+ICAJfQo+ID4KPiA+ICsJZ3Bpb2Rfc2V0X3ZhbHVlKGhkbWkt
PmRkY19lbiwgMSk7Cj4gPiArCj4gCj4gRG8geW91IHJlYWxseSBuZWVkIHRoaXMgdG8gYmUgZG9u
ZSBhbGwgdGhlIHRpbWU/IEknbSBndWVzc2luZyB5b3UKPiB3b3VsZCBvbmx5IG5lZWQgdGhpcyB3
aGVuIHJ1bm5pbmcgLmdldF9tb2RlcywgcmlnaHQ/CgpJIGRvbid0IHRoaW5rIGl0IGh1cnRzIGFu
eXRoaW5nLiBFbmFibGVkIHZvbHRhZ2Ugc2hpZnRpbmcgY2lyY3VpdCBkb2Vzbid0CmRyYXcgYW55
IGN1cnJlbnQsIHVubGVzcyBEREMgaXMgYWN0dWFsbHkgdHJhbnNtaXR0aW5nIGRhdGEuIE9uIG1v
c3QgYm9hcmRzCkknZCBpbWFnaW5lIHRoaXMgY2lyY3VpdCBpcyBhbHdheXMgb24gYW55d2F5IChP
cmFuZ2UgUGkgMyBzY2hlbWF0aWMgZXZlbiBoYXMKYW4gb3B0aW9uIHRvIHRpZSB0aGlzIHNpZ25h
bCB0byBWQ0MtSU8gaW5zdGVhZCBvZiBHUElPKS4KClNjaGVtYXRpYzogaHR0cHM6Ly9tZWdvdXMu
Y29tL2RsL3RtcC9iZmNkZDMyZDY1NWFhYTc2LnBuZwoKdGhhbmsgeW91IGFuZCByZWdhcmRzLAoJ
by4KCj4gTWF4aW1lCj4gCj4gLS0KPiBNYXhpbWUgUmlwYXJkLCBCb290bGluCj4gRW1iZWRkZWQg
TGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwo+IGh0dHBzOi8vYm9vdGxpbi5jb20KCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
