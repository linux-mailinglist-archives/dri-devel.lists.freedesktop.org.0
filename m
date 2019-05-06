Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D021714769
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 11:17:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFD2D89812;
	Mon,  6 May 2019 09:17:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 64AC689812
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 09:17:44 +0000 (UTC)
X-UUID: 498fe6acfc2e44d08bf73c54b228579e-20190506
X-UUID: 498fe6acfc2e44d08bf73c54b228579e-20190506
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 429816069; Mon, 06 May 2019 17:17:40 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS33N2.mediatek.inc (172.27.4.76) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 6 May 2019 17:17:39 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 6 May 2019 17:17:38 +0800
Message-ID: <1557134258.5345.5.camel@mtksdaap41>
Subject: Re: [v2 3/3] drm/mediatek: add mipi_tx driver for mt8183
From: CK Hu <ck.hu@mediatek.com>
To: Jitao Shi <jitao.shi@mediatek.com>
Date: Mon, 6 May 2019 17:17:38 +0800
In-Reply-To: <20190416054217.75387-4-jitao.shi@mediatek.com>
References: <20190416054217.75387-1-jitao.shi@mediatek.com>
 <20190416054217.75387-4-jitao.shi@mediatek.com>
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

SGksIEppdGFvOgoKT24gVHVlLCAyMDE5LTA0LTE2IGF0IDEzOjQyICswODAwLCBKaXRhbyBTaGkg
d3JvdGU6Cj4gVGhpcyBwYXRjaCBhZGQgbXQ4MTgzIG1pcGlfdHggZHJpdmVyLgo+IEFuZCBhbHNv
IHN1cHBvcnQgb3RoZXIgY2hpcHMgdGhhdCB1c2UgdGhlIHNhbWUgYmluZGluZyBhbmQgZHJpdmVy
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEppdGFvIFNoaSA8aml0YW8uc2hpQG1lZGlhdGVrLmNvbT4K
PiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL01ha2VmaWxlICAgICAgICAgICAgIHwg
ICAxICsKPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19taXBpX3R4LmMgICAgICAgIHwg
ICAyICsKPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19taXBpX3R4LmggICAgICAgIHwg
ICAxICsKPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19tdDgxODNfbWlwaV90eC5jIHwg
MTU0ICsrKysrKysrKysrKysrKysrKwo+ICA0IGZpbGVzIGNoYW5nZWQsIDE1OCBpbnNlcnRpb25z
KCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX210
ODE4M19taXBpX3R4LmMKPiAKCltzbmlwXQoKPiArCj4gK3N0YXRpYyBpbnQgbXRrX21pcGlfdHhf
cGxsX3ByZXBhcmUoc3RydWN0IGNsa19odyAqaHcpCj4gK3sKPiArCXN0cnVjdCBtdGtfbWlwaV90
eCAqbWlwaV90eCA9IG10a19taXBpX3R4X2Zyb21fY2xrX2h3KGh3KTsKPiArCXVuc2lnbmVkIGlu
dCB0eGRpdiwgdHhkaXYwOwo+ICsJdTY0IHBjdzsKPiArCWludCByZXQ7Cj4gKwo+ICsJZGV2X2Ri
ZyhtaXBpX3R4LT5kZXYsICJwcmVwYXJlOiAldSBicHNcbiIsIG1pcGlfdHgtPmRhdGFfcmF0ZSk7
Cj4gKwo+ICsJaWYgKG1pcGlfdHgtPmRhdGFfcmF0ZSA+PSAyMDAwMDAwMDAwKSB7Cj4gKwkJdHhk
aXYgPSAxOwo+ICsJCXR4ZGl2MCA9IDA7Cj4gKwl9IGVsc2UgaWYgKG1pcGlfdHgtPmRhdGFfcmF0
ZSA+PSAxMDAwMDAwMDAwKSB7Cj4gKwkJdHhkaXYgPSAyOwo+ICsJCXR4ZGl2MCA9IDE7Cj4gKwl9
IGVsc2UgaWYgKG1pcGlfdHgtPmRhdGFfcmF0ZSA+PSA1MDAwMDAwMDApIHsKPiArCQl0eGRpdiA9
IDQ7Cj4gKwkJdHhkaXYwID0gMjsKPiArCX0gZWxzZSBpZiAobWlwaV90eC0+ZGF0YV9yYXRlID4g
MjUwMDAwMDAwKSB7Cj4gKwkJdHhkaXYgPSA4Owo+ICsJCXR4ZGl2MCA9IDM7Cj4gKwl9IGVsc2Ug
aWYgKG1pcGlfdHgtPmRhdGFfcmF0ZSA+PSAxMjUwMDAwMDApIHsKPiArCQl0eGRpdiA9IDE2Owo+
ICsJCXR4ZGl2MCA9IDQ7Cj4gKwl9IGVsc2Ugewo+ICsJCXJldHVybiAtRUlOVkFMOwo+ICsJfQo+
ICsKPiArCXJldCA9IGNsa19wcmVwYXJlX2VuYWJsZShtaXBpX3R4LT5yZWZfY2xrKTsKPiArCWlm
IChyZXQgPCAwKSB7Cj4gKwkJZGV2X2VycihtaXBpX3R4LT5kZXYsCj4gKwkJCSJjYW4ndCBwcmVw
YXJlIGFuZCBlbmFibGUgbWlwaV90eCByZWZfY2xrICVkXG4iLCByZXQpOwo+ICsJCXJldHVybiBy
ZXQ7Cj4gKwl9CgpZb3UgZW5hYmxlIHRoZSBwYXJlbnQgY2xvY2sgd2hlbiBwcmVwYXJlIHRoaXMg
Y2xvY2sgaGVyZSwgdGhpcyBiZWhhdmlvcgpsb29rcyBzdHJhbmdlLiBJIHRoaW5rIHRoZSBmbG93
IHNob3VsZCBiZToKCjEuIFBhcmVudCBjbG9jayBwcmVwYXJlCjIuIFRoaXMgY2xvY2sgcHJlcGFy
ZQozLiBQYXJlbnQgY2xvY2sgZW5hYmxlCjQuIFRoaXMgY2xvY2sgZW5hYmxlCgpNYXliZSB5b3Ug
c2hvdWxkIGltcGxlbWVudCAnZW5hYmxlIGNhbGxiYWNrJyBzbyB0aGF0IHBhcmVudCBjbG9jayB3
b3VsZApiZSBhbHJlYWR5IGVuYWJsZWQuCgpPbmUgcXVlc3Rpb24gaXMsIG1pcGlfdHhfcGxsIGlz
IHVzZWQgYnkgZHNpIGRyaXZlciwgYnV0IEkgZG9lcyBub3Qgc2VlCmRzaSBwcmVwYXJlX2VuYWJs
ZSgpIG1pcGlfdHhfcGxsLCBob3cgZG9lcyB0aGlzIHdvcms/CgpSZWdhcmRzLApDSwoKPiArCj4g
KwltdGtfbWlwaV90eF9jbGVhcl9iaXRzKG1pcGlfdHgsIE1JUElUWF9QTExfQ09ONCwgUkdfRFNJ
X1BMTF9JQklBUyk7Cj4gKwo+ICsJbXRrX21pcGlfdHhfc2V0X2JpdHMobWlwaV90eCwgTUlQSVRY
X1BMTF9QV1IsIEFEX0RTSV9QTExfU0RNX1BXUl9PTik7Cj4gKwl1c2xlZXBfcmFuZ2UoMzAsIDEw
MCk7Cj4gKwltdGtfbWlwaV90eF9jbGVhcl9iaXRzKG1pcGlfdHgsIE1JUElUWF9QTExfUFdSLCBB
RF9EU0lfUExMX1NETV9JU09fRU4pOwo+ICsJcGN3ID0gZGl2X3U2NCgoKHU2NCltaXBpX3R4LT5k
YXRhX3JhdGUgKiB0eGRpdikgPDwgMjQsIDI2MDAwMDAwKTsKPiArCXdyaXRlbChwY3csIG1pcGlf
dHgtPnJlZ3MgKyBNSVBJVFhfUExMX0NPTjApOwo+ICsJbXRrX21pcGlfdHhfdXBkYXRlX2JpdHMo
bWlwaV90eCwgTUlQSVRYX1BMTF9DT04xLCBSR19EU0lfUExMX1BPU0RJViwKPiArCQkJCXR4ZGl2
MCA8PCA4KTsKPiArCXVzbGVlcF9yYW5nZSgxMDAwLCAyMDAwKTsKPiArCW10a19taXBpX3R4X3Nl
dF9iaXRzKG1pcGlfdHgsIE1JUElUWF9QTExfQ09OMSwgUkdfRFNJX1BMTF9FTik7Cj4gKwo+ICsJ
cmV0dXJuIDA7Cj4gK30KPiArCj4gK3N0YXRpYyB2b2lkIG10a19taXBpX3R4X3BsbF91bnByZXBh
cmUoc3RydWN0IGNsa19odyAqaHcpCj4gK3sKPiArCXN0cnVjdCBtdGtfbWlwaV90eCAqbWlwaV90
eCA9IG10a19taXBpX3R4X2Zyb21fY2xrX2h3KGh3KTsKPiArCj4gKwlkZXZfZGJnKG1pcGlfdHgt
PmRldiwgInVucHJlcGFyZVxuIik7Cj4gKwo+ICsJbXRrX21pcGlfdHhfY2xlYXJfYml0cyhtaXBp
X3R4LCBNSVBJVFhfUExMX0NPTjEsIFJHX0RTSV9QTExfRU4pOwo+ICsKPiArCW10a19taXBpX3R4
X3NldF9iaXRzKG1pcGlfdHgsIE1JUElUWF9QTExfUFdSLCBBRF9EU0lfUExMX1NETV9JU09fRU4p
Owo+ICsJbXRrX21pcGlfdHhfY2xlYXJfYml0cyhtaXBpX3R4LCBNSVBJVFhfUExMX1BXUiwgQURf
RFNJX1BMTF9TRE1fUFdSX09OKTsKPiArCWNsa19kaXNhYmxlX3VucHJlcGFyZShtaXBpX3R4LT5y
ZWZfY2xrKTsKPiArfQo+ICsKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
