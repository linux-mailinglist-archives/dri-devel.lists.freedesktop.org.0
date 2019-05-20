Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 510EF22B24
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 07:30:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07B0289143;
	Mon, 20 May 2019 05:30:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1727889143
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 05:30:38 +0000 (UTC)
X-UUID: 56a159adc43646f3889b476e3beae217-20190520
X-UUID: 56a159adc43646f3889b476e3beae217-20190520
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 255121144; Mon, 20 May 2019 13:30:29 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 MTKMBS33DR.mediatek.inc (172.27.6.106) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 20 May 2019 13:30:26 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 20 May 2019 13:30:27 +0800
Message-ID: <1558330227.7311.14.camel@mtksdaap41>
Subject: Re: [v2 3/3] drm/mediatek: add mipi_tx driver for mt8183
From: CK Hu <ck.hu@mediatek.com>
To: Jitao Shi <jitao.shi@mediatek.com>
Date: Mon, 20 May 2019 13:30:27 +0800
In-Reply-To: <1558165892.7681.8.camel@mszsdaap41>
References: <20190416054217.75387-1-jitao.shi@mediatek.com>
 <20190416054217.75387-4-jitao.shi@mediatek.com>
 <1557134258.5345.5.camel@mtksdaap41> <1558165892.7681.8.camel@mszsdaap41>
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

T24gU2F0LCAyMDE5LTA1LTE4IGF0IDE1OjUxICswODAwLCBKaXRhbyBTaGkgd3JvdGU6Cj4gT24g
TW9uLCAyMDE5LTA1LTA2IGF0IDE3OjE3ICswODAwLCBDSyBIdSB3cm90ZToKPiA+IEhpLCBKaXRh
bzoKPiA+IAo+ID4gT24gVHVlLCAyMDE5LTA0LTE2IGF0IDEzOjQyICswODAwLCBKaXRhbyBTaGkg
d3JvdGU6Cj4gPiA+IFRoaXMgcGF0Y2ggYWRkIG10ODE4MyBtaXBpX3R4IGRyaXZlci4KPiA+ID4g
QW5kIGFsc28gc3VwcG9ydCBvdGhlciBjaGlwcyB0aGF0IHVzZSB0aGUgc2FtZSBiaW5kaW5nIGFu
ZCBkcml2ZXIuCj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKaXRhbyBTaGkgPGppdGFvLnNo
aUBtZWRpYXRlay5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L01ha2VmaWxlICAgICAgICAgICAgIHwgICAxICsKPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfbWlwaV90eC5jICAgICAgICB8ICAgMiArCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX21pcGlfdHguaCAgICAgICAgfCAgIDEgKwo+ID4gPiAgZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19tdDgxODNfbWlwaV90eC5jIHwgMTU0ICsrKysrKysrKysrKysrKysr
Kwo+ID4gPiAgNCBmaWxlcyBjaGFuZ2VkLCAxNTggaW5zZXJ0aW9ucygrKQo+ID4gPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfbXQ4MTgzX21pcGlfdHgu
Ywo+ID4gPiAKPiA+IAo+ID4gW3NuaXBdCj4gPiAKPiA+ID4gKwo+ID4gPiArc3RhdGljIGludCBt
dGtfbWlwaV90eF9wbGxfcHJlcGFyZShzdHJ1Y3QgY2xrX2h3ICpodykKPiA+ID4gK3sKPiA+ID4g
KwlzdHJ1Y3QgbXRrX21pcGlfdHggKm1pcGlfdHggPSBtdGtfbWlwaV90eF9mcm9tX2Nsa19odyho
dyk7Cj4gPiA+ICsJdW5zaWduZWQgaW50IHR4ZGl2LCB0eGRpdjA7Cj4gPiA+ICsJdTY0IHBjdzsK
PiA+ID4gKwlpbnQgcmV0Owo+ID4gPiArCj4gPiA+ICsJZGV2X2RiZyhtaXBpX3R4LT5kZXYsICJw
cmVwYXJlOiAldSBicHNcbiIsIG1pcGlfdHgtPmRhdGFfcmF0ZSk7Cj4gPiA+ICsKPiA+ID4gKwlp
ZiAobWlwaV90eC0+ZGF0YV9yYXRlID49IDIwMDAwMDAwMDApIHsKPiA+ID4gKwkJdHhkaXYgPSAx
Owo+ID4gPiArCQl0eGRpdjAgPSAwOwo+ID4gPiArCX0gZWxzZSBpZiAobWlwaV90eC0+ZGF0YV9y
YXRlID49IDEwMDAwMDAwMDApIHsKPiA+ID4gKwkJdHhkaXYgPSAyOwo+ID4gPiArCQl0eGRpdjAg
PSAxOwo+ID4gPiArCX0gZWxzZSBpZiAobWlwaV90eC0+ZGF0YV9yYXRlID49IDUwMDAwMDAwMCkg
ewo+ID4gPiArCQl0eGRpdiA9IDQ7Cj4gPiA+ICsJCXR4ZGl2MCA9IDI7Cj4gPiA+ICsJfSBlbHNl
IGlmIChtaXBpX3R4LT5kYXRhX3JhdGUgPiAyNTAwMDAwMDApIHsKPiA+ID4gKwkJdHhkaXYgPSA4
Owo+ID4gPiArCQl0eGRpdjAgPSAzOwo+ID4gPiArCX0gZWxzZSBpZiAobWlwaV90eC0+ZGF0YV9y
YXRlID49IDEyNTAwMDAwMCkgewo+ID4gPiArCQl0eGRpdiA9IDE2Owo+ID4gPiArCQl0eGRpdjAg
PSA0Owo+ID4gPiArCX0gZWxzZSB7Cj4gPiA+ICsJCXJldHVybiAtRUlOVkFMOwo+ID4gPiArCX0K
PiA+ID4gKwo+ID4gPiArCXJldCA9IGNsa19wcmVwYXJlX2VuYWJsZShtaXBpX3R4LT5yZWZfY2xr
KTsKPiA+ID4gKwlpZiAocmV0IDwgMCkgewo+ID4gPiArCQlkZXZfZXJyKG1pcGlfdHgtPmRldiwK
PiA+ID4gKwkJCSJjYW4ndCBwcmVwYXJlIGFuZCBlbmFibGUgbWlwaV90eCByZWZfY2xrICVkXG4i
LCByZXQpOwo+ID4gPiArCQlyZXR1cm4gcmV0Owo+ID4gPiArCX0KPiA+IAo+ID4gWW91IGVuYWJs
ZSB0aGUgcGFyZW50IGNsb2NrIHdoZW4gcHJlcGFyZSB0aGlzIGNsb2NrIGhlcmUsIHRoaXMgYmVo
YXZpb3IKPiA+IGxvb2tzIHN0cmFuZ2UuIEkgdGhpbmsgdGhlIGZsb3cgc2hvdWxkIGJlOgo+ID4g
Cj4gPiAxLiBQYXJlbnQgY2xvY2sgcHJlcGFyZQo+ID4gMi4gVGhpcyBjbG9jayBwcmVwYXJlCj4g
PiAzLiBQYXJlbnQgY2xvY2sgZW5hYmxlCj4gPiA0LiBUaGlzIGNsb2NrIGVuYWJsZQo+ID4gCj4g
PiBNYXliZSB5b3Ugc2hvdWxkIGltcGxlbWVudCAnZW5hYmxlIGNhbGxiYWNrJyBzbyB0aGF0IHBh
cmVudCBjbG9jayB3b3VsZAo+ID4gYmUgYWxyZWFkeSBlbmFibGVkLgo+ID4gCj4gPiBPbmUgcXVl
c3Rpb24gaXMsIG1pcGlfdHhfcGxsIGlzIHVzZWQgYnkgZHNpIGRyaXZlciwgYnV0IEkgZG9lcyBu
b3Qgc2VlCj4gPiBkc2kgcHJlcGFyZV9lbmFibGUoKSBtaXBpX3R4X3BsbCwgaG93IGRvZXMgdGhp
cyB3b3JrPwo+ID4gCj4gPiBSZWdhcmRzLAo+ID4gQ0sKPiA+IAo+IAo+IFRoZSBtaXBpX3R4IGNh
biBiZSBhY2Nlc3NlZCBhZnRlciBjbGtfcHJlcGFyZV9lbmFibGUobWlwaV90eC0+cmVmX2Nsayk7
Cj4gCj4gU28gcGxhY2UgdGhlIGNsa19wcmVwYXJlX2VuYWJsZShtaXBpX3R4LT5yZWZfY2xrKSBi
ZWZvcmUgYWNjZXNzaW5nCj4gbWlwaXR4Lgo+IAo+IG1pcGlfdHhfcGxsIGlzIGVuYWJsZSBieSBt
dGtfbWlwaV90eF9wb3dlcl9vbigpIGluIG10a19taXBfdHguYy4KPiBjbGtfcHJlcGFyZV9lbmFi
bGUobWlwaV90eC0+cGxsKSB3aWxsIGVuYWJsZSBtaXBpX3R4X3BsbC4KCk9LLCBzbyBpdCBzdGFy
dCBmcm9tIGRzaSBkcml2ZXIuIFRoZSBjYWxsc3RhY2sgaXM6CgpwaHlfcG93ZXJfb24oZHNpLT5w
aHkpOwotPiBtdGtfbWlwaV90eF9wb3dlcl9vbigpCi0tPiBjbGtfcHJlcGFyZV9lbmFibGUobWlw
aV90eC0+cGxsKTsKLS0tPiBtdGtfbWlwaV90eF9wbGxfcHJlcGFyZSgpOwoKSW4gY2xrX3ByZXBh
cmVfZW5hYmxlKCksIGl0IHNlcGFyYXRlbHkgY2FsbCBjbGtfcHJlcGFyZSgpIGFuZApjbGtfZW5h
YmxlKCkuIFdoZW4gY2xrX3ByZXBhcmUoKSwgaXQgcHJlcGFyZSB0aGUgcGFyZW50IGNsb2NrIHRo
ZW4KcHJlcGFyZSB0aGlzIGNsb2NrLiBXaGVuIGNsa19lbmFibGUoKSwgaXQgZW5hYmxlIHRoZSBw
YXJlbnQgY2xvY2sgdGhlbgplbmFibGUgdGhpcyBjbG9jay4gU28gdGhpcyB3b3VsZCByZXN1bHQg
aW4gdGhlIHNlcXVlbmNlOgoKMS4gUHJlcGFyZSBtaXBpX3R4LT5yZWZfY2xrCjIuIFByZXBhcmUg
bWlwaV90eC0+cGxsCjMuIEVuYWJsZSBtaXBpX3R4LT5yZWZfY2xrCjQuIEVuYWJsZSBtaXBpX3R4
LT5wbGwKCllvdSBzYXkgJ1NvIHBsYWNlIHRoZSBjbGtfcHJlcGFyZV9lbmFibGUobWlwaV90eC0+
cmVmX2NsaykgYmVmb3JlCmFjY2Vzc2luZyBtaXBpdHguJywgc28gdGhlIHN0ZXAgMSBhbmQgc3Rl
cCAzIGlzIGVxdWFsIHRvCmNsa19wcmVwYXJlX2VuYWJsZShtaXBpX3R4LT5yZWZfY2xrKSwgc28g
SSByZXF1aXJlIHlvdSB0byBhY2Nlc3MgbWlwaXR4CmluIHN0ZXAgNCwgbm90IGluIHN0ZXAgMi4K
ClJlZ2FyZHMsCkNLCgo+IAo+IEJlc2V0IFJlZ2FyZHMKPiBKaXRhbwo+IAo+ID4gPiArCj4gPiA+
ICsJbXRrX21pcGlfdHhfY2xlYXJfYml0cyhtaXBpX3R4LCBNSVBJVFhfUExMX0NPTjQsIFJHX0RT
SV9QTExfSUJJQVMpOwo+ID4gPiArCj4gPiA+ICsJbXRrX21pcGlfdHhfc2V0X2JpdHMobWlwaV90
eCwgTUlQSVRYX1BMTF9QV1IsIEFEX0RTSV9QTExfU0RNX1BXUl9PTik7Cj4gPiA+ICsJdXNsZWVw
X3JhbmdlKDMwLCAxMDApOwo+ID4gPiArCW10a19taXBpX3R4X2NsZWFyX2JpdHMobWlwaV90eCwg
TUlQSVRYX1BMTF9QV1IsIEFEX0RTSV9QTExfU0RNX0lTT19FTik7Cj4gPiA+ICsJcGN3ID0gZGl2
X3U2NCgoKHU2NCltaXBpX3R4LT5kYXRhX3JhdGUgKiB0eGRpdikgPDwgMjQsIDI2MDAwMDAwKTsK
PiA+ID4gKwl3cml0ZWwocGN3LCBtaXBpX3R4LT5yZWdzICsgTUlQSVRYX1BMTF9DT04wKTsKPiA+
ID4gKwltdGtfbWlwaV90eF91cGRhdGVfYml0cyhtaXBpX3R4LCBNSVBJVFhfUExMX0NPTjEsIFJH
X0RTSV9QTExfUE9TRElWLAo+ID4gPiArCQkJCXR4ZGl2MCA8PCA4KTsKPiA+ID4gKwl1c2xlZXBf
cmFuZ2UoMTAwMCwgMjAwMCk7Cj4gPiA+ICsJbXRrX21pcGlfdHhfc2V0X2JpdHMobWlwaV90eCwg
TUlQSVRYX1BMTF9DT04xLCBSR19EU0lfUExMX0VOKTsKPiA+ID4gKwo+ID4gPiArCXJldHVybiAw
Owo+ID4gPiArfQo+ID4gPiArCj4gPiA+ICtzdGF0aWMgdm9pZCBtdGtfbWlwaV90eF9wbGxfdW5w
cmVwYXJlKHN0cnVjdCBjbGtfaHcgKmh3KQo+ID4gPiArewo+ID4gPiArCXN0cnVjdCBtdGtfbWlw
aV90eCAqbWlwaV90eCA9IG10a19taXBpX3R4X2Zyb21fY2xrX2h3KGh3KTsKPiA+ID4gKwo+ID4g
PiArCWRldl9kYmcobWlwaV90eC0+ZGV2LCAidW5wcmVwYXJlXG4iKTsKPiA+ID4gKwo+ID4gPiAr
CW10a19taXBpX3R4X2NsZWFyX2JpdHMobWlwaV90eCwgTUlQSVRYX1BMTF9DT04xLCBSR19EU0lf
UExMX0VOKTsKPiA+ID4gKwo+ID4gPiArCW10a19taXBpX3R4X3NldF9iaXRzKG1pcGlfdHgsIE1J
UElUWF9QTExfUFdSLCBBRF9EU0lfUExMX1NETV9JU09fRU4pOwo+ID4gPiArCW10a19taXBpX3R4
X2NsZWFyX2JpdHMobWlwaV90eCwgTUlQSVRYX1BMTF9QV1IsIEFEX0RTSV9QTExfU0RNX1BXUl9P
Tik7Cj4gPiA+ICsJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKG1pcGlfdHgtPnJlZl9jbGspOwo+ID4g
PiArfQo+ID4gPiArCj4gPiAKPiA+IAo+IAo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
