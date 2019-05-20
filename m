Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CED322C4D
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 08:48:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A77BC89192;
	Mon, 20 May 2019 06:48:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1A85989192
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 06:48:41 +0000 (UTC)
X-UUID: df6bf8f9060a436fbbf524ddfc74a8a6-20190520
X-UUID: df6bf8f9060a436fbbf524ddfc74a8a6-20190520
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1552444152; Mon, 20 May 2019 14:48:30 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 MTKMBS33N1.mediatek.inc (172.27.4.75) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 20 May 2019 14:48:29 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 20 May 2019 14:48:28 +0800
Message-ID: <1558334909.7311.27.camel@mtksdaap41>
Subject: Re: [v4 4/5] drm/mediatek: control dpi pins dpi or gpio mode in on
 or off
From: CK Hu <ck.hu@mediatek.com>
To: Jitao Shi <jitao.shi@mediatek.com>
Date: Mon, 20 May 2019 14:48:29 +0800
In-Reply-To: <20190518095618.18454-5-jitao.shi@mediatek.com>
References: <20190518095618.18454-1-jitao.shi@mediatek.com>
 <20190518095618.18454-5-jitao.shi@mediatek.com>
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

SGksIEppdGFvOgoKT24gU2F0LCAyMDE5LTA1LTE4IGF0IDE3OjU2ICswODAwLCBKaXRhbyBTaGkg
d3JvdGU6Cj4gUHVsbCBkcGkgcGlucyBsb3cgd2hlbiBkcGkgaGFzIG5vdGhpbmcgdG8gZGlzcGxh
eS4gQW92aWQgbGVha2FnZQo+IGN1cnJlbnQgZnJvbSBzb21lIGRwaSBwaW5zIChIc3luYyBWc3lu
YyBERSAuLi4gKS4KPiAKPiBTb21lIGNoaXBzIGhhdmUgZHBpIHBpbnMsIGJ1dCB0aGVyZSBhcmUg
c29tZSBjaGlwIGRvbid0IGhhdmUgcGlucy4KPiBTbyB0aGlzIGZ1bmN0aW9uIGlzIGNvbnRyb2xs
ZWQgYnkgY2hpcHMgZHJpdmVyIGRhdGEuCj4gCj4gU2lnbmVkLW9mZi1ieTogSml0YW8gU2hpIDxq
aXRhby5zaGlAbWVkaWF0ZWsuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RwaS5jIHwgMzUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKystCj4gIDEgZmlsZSBj
aGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RwaS5jCj4gaW5kZXggNzdlNmUwZjk5MTg4Li4wYzRiYTBhMmJlMjcgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMKPiBAQCAtMTcsMTAgKzE3LDEyIEBACj4gICNp
bmNsdWRlIDxkcm0vZHJtX29mLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4KPiAgI2lu
Y2x1ZGUgPGxpbnV4L2NvbXBvbmVudC5oPgo+IC0jaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2
aWNlLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9vZi5oPgo+ICAjaW5jbHVkZSA8bGludXgvb2ZfZGV2
aWNlLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9vZl9ncGlvLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9v
Zl9ncmFwaC5oPgo+ICsjaW5jbHVkZSA8bGludXgvcGluY3RybC9jb25zdW1lci5oPgo+ICsjaW5j
bHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9pbnRlcnJ1
cHQuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9jbGsu
aD4KPiBAQCAtNzksNiArODEsOSBAQCBzdHJ1Y3QgbXRrX2RwaSB7Cj4gIAllbnVtIG10a19kcGlf
b3V0X3ljX21hcCB5Y19tYXA7Cj4gIAllbnVtIG10a19kcGlfb3V0X2JpdF9udW0gYml0X251bTsK
PiAgCWVudW0gbXRrX2RwaV9vdXRfY2hhbm5lbF9zd2FwIGNoYW5uZWxfc3dhcDsKPiArCXN0cnVj
dCBwaW5jdHJsICpwaW5jdHJsOwo+ICsJc3RydWN0IHBpbmN0cmxfc3RhdGUgKnBpbnNfZGVmYXVs
dDsKPiArCXN0cnVjdCBwaW5jdHJsX3N0YXRlICpwaW5zX2RwaTsKPiAgCWludCByZWZjb3VudDsK
PiAgfTsKPiAgCj4gQEAgLTExOCw2ICsxMjMsNyBAQCBzdHJ1Y3QgbXRrX2RwaV9jb25mIHsKPiAg
CXUzMiByZWdfaF9mcmVfY29uOwo+ICAJYm9vbCBlZGdlX3NlbF9lbjsKPiAgCWJvb2wgZHVhbF9l
ZGdlOwo+ICsJYm9vbCBkcGlfcGluX2N0cmw7Cj4gIH07Cj4gIAo+ICBzdGF0aWMgdm9pZCBtdGtf
ZHBpX21hc2soc3RydWN0IG10a19kcGkgKmRwaSwgdTMyIG9mZnNldCwgdTMyIHZhbCwgdTMyIG1h
c2spCj4gQEAgLTM5Miw2ICszOTgsOSBAQCBzdGF0aWMgdm9pZCBtdGtfZHBpX3Bvd2VyX29mZihz
dHJ1Y3QgbXRrX2RwaSAqZHBpKQo+ICAJaWYgKC0tZHBpLT5yZWZjb3VudCAhPSAwKQo+ICAJCXJl
dHVybjsKPiAgCj4gKwlpZiAoZHBpLT5jb25mLT5kcGlfcGluX2N0cmwpCj4gKwkJcGluY3RybF9z
ZWxlY3Rfc3RhdGUoZHBpLT5waW5jdHJsLCBkcGktPnBpbnNfZGVmYXVsdCk7Cj4gKwo+ICAJbXRr
X2RwaV9kaXNhYmxlKGRwaSk7Cj4gIAljbGtfZGlzYWJsZV91bnByZXBhcmUoZHBpLT5waXhlbF9j
bGspOwo+ICAJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGRwaS0+ZW5naW5lX2Nsayk7Cj4gQEAgLTQx
Niw2ICs0MjUsOSBAQCBzdGF0aWMgaW50IG10a19kcGlfcG93ZXJfb24oc3RydWN0IG10a19kcGkg
KmRwaSkKPiAgCQlnb3RvIGVycl9waXhlbDsKPiAgCX0KPiAgCj4gKwlpZiAoZHBpLT5jb25mLT5k
cGlfcGluX2N0cmwpCj4gKwkJcGluY3RybF9zZWxlY3Rfc3RhdGUoZHBpLT5waW5jdHJsLCBkcGkt
PnBpbnNfZHBpKTsKPiArCj4gIAltdGtfZHBpX2VuYWJsZShkcGkpOwo+ICAJcmV0dXJuIDA7Cj4g
IAo+IEBAIC03MjQsNiArNzM2LDI3IEBAIHN0YXRpYyBpbnQgbXRrX2RwaV9wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJZHBpLT5kZXYgPSBkZXY7Cj4gIAlkcGktPmNvbmYg
PSAoc3RydWN0IG10a19kcGlfY29uZiAqKW9mX2RldmljZV9nZXRfbWF0Y2hfZGF0YShkZXYpOwo+
ICAKPiArCWlmIChkcGktPmNvbmYtPmRwaV9waW5fY3RybCkgewo+ICsJCWRwaS0+cGluY3RybCA9
IGRldm1fcGluY3RybF9nZXQoJnBkZXYtPmRldik7CgpQbGVhc2UgZGVzY3JpYmUgdGhpcyBpbiBi
aW5kaW5nIGRvY3VtZW50LgoKUmVnYXJkcywKQ0sKCj4gKwkJaWYgKElTX0VSUihkcGktPnBpbmN0
cmwpKSB7Cj4gKwkJCWRldl9lcnIoJnBkZXYtPmRldiwgIkNhbm5vdCBmaW5kIHBpbmN0cmwhXG4i
KTsKPiArCQkJcmV0dXJuIFBUUl9FUlIoZHBpLT5waW5jdHJsKTsKPiArCQl9Cj4gKwo+ICsJCWRw
aS0+cGluc19kZWZhdWx0ID0gcGluY3RybF9sb29rdXBfc3RhdGUoZHBpLT5waW5jdHJsLAo+ICsJ
CQkJCQkJICJkZWZhdWx0Iik7Cj4gKwkJaWYgKElTX0VSUihkcGktPnBpbnNfZGVmYXVsdCkpIHsK
PiArCQkJZGV2X2VycigmcGRldi0+ZGV2LCAiQ2Fubm90IGZpbmQgcGluY3RybCBkZWZhdWx0IVxu
Iik7Cj4gKwkJCXJldHVybiBQVFJfRVJSKGRwaS0+cGluc19kZWZhdWx0KTsKPiArCQl9Cj4gKwo+
ICsJCWRwaS0+cGluc19kcGkgPSBwaW5jdHJsX2xvb2t1cF9zdGF0ZShkcGktPnBpbmN0cmwsICJk
cGltb2RlIik7Cj4gKwkJaWYgKElTX0VSUihkcGktPnBpbnNfZHBpKSkgewo+ICsJCQlkZXZfZXJy
KCZwZGV2LT5kZXYsICJDYW5ub3QgZmluZCBwaW5jdHJsIGRwaW1vZGUhXG4iKTsKPiArCQkJcmV0
dXJuIFBUUl9FUlIoZHBpLT5waW5zX2RwaSk7Cj4gKwkJfQo+ICsJfQo+ICsKPiAgCW1lbSA9IHBs
YXRmb3JtX2dldF9yZXNvdXJjZShwZGV2LCBJT1JFU09VUkNFX01FTSwgMCk7Cj4gIAlkcGktPnJl
Z3MgPSBkZXZtX2lvcmVtYXBfcmVzb3VyY2UoZGV2LCBtZW0pOwo+ICAJaWYgKElTX0VSUihkcGkt
PnJlZ3MpKSB7CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
