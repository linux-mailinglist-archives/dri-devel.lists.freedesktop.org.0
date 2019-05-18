Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE5D22226
	for <lists+dri-devel@lfdr.de>; Sat, 18 May 2019 09:56:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F173E897E3;
	Sat, 18 May 2019 07:56:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 303 seconds by postgrey-1.36 at gabe;
 Sat, 18 May 2019 07:56:43 UTC
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 308BD897E3
 for <dri-devel@lists.freedesktop.org>; Sat, 18 May 2019 07:56:43 +0000 (UTC)
X-UUID: 00c64ad0c4ba40d7b189bc49fad75e26-20190518
X-UUID: 00c64ad0c4ba40d7b189bc49fad75e26-20190518
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <jitao.shi@mediatek.com>)
 (mhqrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1821289005; Sat, 18 May 2019 15:51:38 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs01n1.mediatek.inc
 (172.21.101.68) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Sat, 18 May 2019 15:51:36 +0800
Received: from [10.16.6.141] (172.27.4.253) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sat, 18 May 2019 15:51:33 +0800
Message-ID: <1558165892.7681.8.camel@mszsdaap41>
Subject: Re: [v2 3/3] drm/mediatek: add mipi_tx driver for mt8183
From: Jitao Shi <jitao.shi@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
Date: Sat, 18 May 2019 15:51:32 +0800
In-Reply-To: <1557134258.5345.5.camel@mtksdaap41>
References: <20190416054217.75387-1-jitao.shi@mediatek.com>
 <20190416054217.75387-4-jitao.shi@mediatek.com>
 <1557134258.5345.5.camel@mtksdaap41>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, stonea168@163.com,
 dri-devel@lists.freedesktop.org, yingjoe.chen@mediatek.com, Ajay
 Kumar <ajaykumar.rs@samsung.com>, Vincent Palatin <vpalatin@chromium.org>,
 cawa.cheng@mediatek.com, Russell King <rmk+kernel@arm.linux.org.uk>,
 Thierry Reding <treding@nvidia.com>, linux-pwm@vger.kernel.org,
 Sascha Hauer <kernel@pengutronix.de>, Pawel Moll <pawel.moll@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org, Rahul
 Sharma <rahul.sharma@samsung.com>, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, Kumar Gala <galak@codeaurora.org>,
 Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDE5LTA1LTA2IGF0IDE3OjE3ICswODAwLCBDSyBIdSB3cm90ZToKPiBIaSwgSml0
YW86Cj4gCj4gT24gVHVlLCAyMDE5LTA0LTE2IGF0IDEzOjQyICswODAwLCBKaXRhbyBTaGkgd3Jv
dGU6Cj4gPiBUaGlzIHBhdGNoIGFkZCBtdDgxODMgbWlwaV90eCBkcml2ZXIuCj4gPiBBbmQgYWxz
byBzdXBwb3J0IG90aGVyIGNoaXBzIHRoYXQgdXNlIHRoZSBzYW1lIGJpbmRpbmcgYW5kIGRyaXZl
ci4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsu
Y29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL01ha2VmaWxlICAgICAg
ICAgICAgIHwgICAxICsKPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX21pcGlfdHgu
YyAgICAgICAgfCAgIDIgKwo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfbWlwaV90
eC5oICAgICAgICB8ICAgMSArCj4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19tdDgx
ODNfbWlwaV90eC5jIHwgMTU0ICsrKysrKysrKysrKysrKysrKwo+ID4gIDQgZmlsZXMgY2hhbmdl
ZCwgMTU4IGluc2VydGlvbnMoKykKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19tdDgxODNfbWlwaV90eC5jCj4gPiAKPiAKPiBbc25pcF0KPiAKPiA+
ICsKPiA+ICtzdGF0aWMgaW50IG10a19taXBpX3R4X3BsbF9wcmVwYXJlKHN0cnVjdCBjbGtfaHcg
Kmh3KQo+ID4gK3sKPiA+ICsJc3RydWN0IG10a19taXBpX3R4ICptaXBpX3R4ID0gbXRrX21pcGlf
dHhfZnJvbV9jbGtfaHcoaHcpOwo+ID4gKwl1bnNpZ25lZCBpbnQgdHhkaXYsIHR4ZGl2MDsKPiA+
ICsJdTY0IHBjdzsKPiA+ICsJaW50IHJldDsKPiA+ICsKPiA+ICsJZGV2X2RiZyhtaXBpX3R4LT5k
ZXYsICJwcmVwYXJlOiAldSBicHNcbiIsIG1pcGlfdHgtPmRhdGFfcmF0ZSk7Cj4gPiArCj4gPiAr
CWlmIChtaXBpX3R4LT5kYXRhX3JhdGUgPj0gMjAwMDAwMDAwMCkgewo+ID4gKwkJdHhkaXYgPSAx
Owo+ID4gKwkJdHhkaXYwID0gMDsKPiA+ICsJfSBlbHNlIGlmIChtaXBpX3R4LT5kYXRhX3JhdGUg
Pj0gMTAwMDAwMDAwMCkgewo+ID4gKwkJdHhkaXYgPSAyOwo+ID4gKwkJdHhkaXYwID0gMTsKPiA+
ICsJfSBlbHNlIGlmIChtaXBpX3R4LT5kYXRhX3JhdGUgPj0gNTAwMDAwMDAwKSB7Cj4gPiArCQl0
eGRpdiA9IDQ7Cj4gPiArCQl0eGRpdjAgPSAyOwo+ID4gKwl9IGVsc2UgaWYgKG1pcGlfdHgtPmRh
dGFfcmF0ZSA+IDI1MDAwMDAwMCkgewo+ID4gKwkJdHhkaXYgPSA4Owo+ID4gKwkJdHhkaXYwID0g
MzsKPiA+ICsJfSBlbHNlIGlmIChtaXBpX3R4LT5kYXRhX3JhdGUgPj0gMTI1MDAwMDAwKSB7Cj4g
PiArCQl0eGRpdiA9IDE2Owo+ID4gKwkJdHhkaXYwID0gNDsKPiA+ICsJfSBlbHNlIHsKPiA+ICsJ
CXJldHVybiAtRUlOVkFMOwo+ID4gKwl9Cj4gPiArCj4gPiArCXJldCA9IGNsa19wcmVwYXJlX2Vu
YWJsZShtaXBpX3R4LT5yZWZfY2xrKTsKPiA+ICsJaWYgKHJldCA8IDApIHsKPiA+ICsJCWRldl9l
cnIobWlwaV90eC0+ZGV2LAo+ID4gKwkJCSJjYW4ndCBwcmVwYXJlIGFuZCBlbmFibGUgbWlwaV90
eCByZWZfY2xrICVkXG4iLCByZXQpOwo+ID4gKwkJcmV0dXJuIHJldDsKPiA+ICsJfQo+IAo+IFlv
dSBlbmFibGUgdGhlIHBhcmVudCBjbG9jayB3aGVuIHByZXBhcmUgdGhpcyBjbG9jayBoZXJlLCB0
aGlzIGJlaGF2aW9yCj4gbG9va3Mgc3RyYW5nZS4gSSB0aGluayB0aGUgZmxvdyBzaG91bGQgYmU6
Cj4gCj4gMS4gUGFyZW50IGNsb2NrIHByZXBhcmUKPiAyLiBUaGlzIGNsb2NrIHByZXBhcmUKPiAz
LiBQYXJlbnQgY2xvY2sgZW5hYmxlCj4gNC4gVGhpcyBjbG9jayBlbmFibGUKPiAKPiBNYXliZSB5
b3Ugc2hvdWxkIGltcGxlbWVudCAnZW5hYmxlIGNhbGxiYWNrJyBzbyB0aGF0IHBhcmVudCBjbG9j
ayB3b3VsZAo+IGJlIGFscmVhZHkgZW5hYmxlZC4KPiAKPiBPbmUgcXVlc3Rpb24gaXMsIG1pcGlf
dHhfcGxsIGlzIHVzZWQgYnkgZHNpIGRyaXZlciwgYnV0IEkgZG9lcyBub3Qgc2VlCj4gZHNpIHBy
ZXBhcmVfZW5hYmxlKCkgbWlwaV90eF9wbGwsIGhvdyBkb2VzIHRoaXMgd29yaz8KPiAKPiBSZWdh
cmRzLAo+IENLCj4gCgpUaGUgbWlwaV90eCBjYW4gYmUgYWNjZXNzZWQgYWZ0ZXIgY2xrX3ByZXBh
cmVfZW5hYmxlKG1pcGlfdHgtPnJlZl9jbGspOwoKU28gcGxhY2UgdGhlIGNsa19wcmVwYXJlX2Vu
YWJsZShtaXBpX3R4LT5yZWZfY2xrKSBiZWZvcmUgYWNjZXNzaW5nCm1pcGl0eC4KCm1pcGlfdHhf
cGxsIGlzIGVuYWJsZSBieSBtdGtfbWlwaV90eF9wb3dlcl9vbigpIGluIG10a19taXBfdHguYy4K
Y2xrX3ByZXBhcmVfZW5hYmxlKG1pcGlfdHgtPnBsbCkgd2lsbCBlbmFibGUgbWlwaV90eF9wbGwu
CgpCZXNldCBSZWdhcmRzCkppdGFvCgo+ID4gKwo+ID4gKwltdGtfbWlwaV90eF9jbGVhcl9iaXRz
KG1pcGlfdHgsIE1JUElUWF9QTExfQ09ONCwgUkdfRFNJX1BMTF9JQklBUyk7Cj4gPiArCj4gPiAr
CW10a19taXBpX3R4X3NldF9iaXRzKG1pcGlfdHgsIE1JUElUWF9QTExfUFdSLCBBRF9EU0lfUExM
X1NETV9QV1JfT04pOwo+ID4gKwl1c2xlZXBfcmFuZ2UoMzAsIDEwMCk7Cj4gPiArCW10a19taXBp
X3R4X2NsZWFyX2JpdHMobWlwaV90eCwgTUlQSVRYX1BMTF9QV1IsIEFEX0RTSV9QTExfU0RNX0lT
T19FTik7Cj4gPiArCXBjdyA9IGRpdl91NjQoKCh1NjQpbWlwaV90eC0+ZGF0YV9yYXRlICogdHhk
aXYpIDw8IDI0LCAyNjAwMDAwMCk7Cj4gPiArCXdyaXRlbChwY3csIG1pcGlfdHgtPnJlZ3MgKyBN
SVBJVFhfUExMX0NPTjApOwo+ID4gKwltdGtfbWlwaV90eF91cGRhdGVfYml0cyhtaXBpX3R4LCBN
SVBJVFhfUExMX0NPTjEsIFJHX0RTSV9QTExfUE9TRElWLAo+ID4gKwkJCQl0eGRpdjAgPDwgOCk7
Cj4gPiArCXVzbGVlcF9yYW5nZSgxMDAwLCAyMDAwKTsKPiA+ICsJbXRrX21pcGlfdHhfc2V0X2Jp
dHMobWlwaV90eCwgTUlQSVRYX1BMTF9DT04xLCBSR19EU0lfUExMX0VOKTsKPiA+ICsKPiA+ICsJ
cmV0dXJuIDA7Cj4gPiArfQo+ID4gKwo+ID4gK3N0YXRpYyB2b2lkIG10a19taXBpX3R4X3BsbF91
bnByZXBhcmUoc3RydWN0IGNsa19odyAqaHcpCj4gPiArewo+ID4gKwlzdHJ1Y3QgbXRrX21pcGlf
dHggKm1pcGlfdHggPSBtdGtfbWlwaV90eF9mcm9tX2Nsa19odyhodyk7Cj4gPiArCj4gPiArCWRl
dl9kYmcobWlwaV90eC0+ZGV2LCAidW5wcmVwYXJlXG4iKTsKPiA+ICsKPiA+ICsJbXRrX21pcGlf
dHhfY2xlYXJfYml0cyhtaXBpX3R4LCBNSVBJVFhfUExMX0NPTjEsIFJHX0RTSV9QTExfRU4pOwo+
ID4gKwo+ID4gKwltdGtfbWlwaV90eF9zZXRfYml0cyhtaXBpX3R4LCBNSVBJVFhfUExMX1BXUiwg
QURfRFNJX1BMTF9TRE1fSVNPX0VOKTsKPiA+ICsJbXRrX21pcGlfdHhfY2xlYXJfYml0cyhtaXBp
X3R4LCBNSVBJVFhfUExMX1BXUiwgQURfRFNJX1BMTF9TRE1fUFdSX09OKTsKPiA+ICsJY2xrX2Rp
c2FibGVfdW5wcmVwYXJlKG1pcGlfdHgtPnJlZl9jbGspOwo+ID4gK30KPiA+ICsKPiAKPiAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
