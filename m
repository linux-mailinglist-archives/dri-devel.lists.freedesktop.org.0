Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B47410F96E
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 09:05:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E26826E40C;
	Tue,  3 Dec 2019 08:05:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3275B6E1A3
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 07:43:54 +0000 (UTC)
X-UUID: 0b0fa2acfe384dbb9bc9e2e9d6308f2a-20191203
X-UUID: 0b0fa2acfe384dbb9bc9e2e9d6308f2a-20191203
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1088377323; Tue, 03 Dec 2019 15:43:50 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs05n2.mediatek.inc
 (172.21.101.140) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Tue, 3 Dec 2019 15:43:33 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 3 Dec 2019 15:43:37 +0800
Message-ID: <1575359027.10160.2.camel@mhfsdcap03>
Subject: Re: [PATCH v1, 1/2] drm/mediatek: Fixup external display black
 screen issue
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
Date: Tue, 3 Dec 2019 15:43:47 +0800
In-Reply-To: <1575352101.2457.8.camel@mtksdaap41>
References: <1574817475-22378-1-git-send-email-yongqiang.niu@mediatek.com>
 <1574817475-22378-2-git-send-email-yongqiang.niu@mediatek.com>
 <1575352101.2457.8.camel@mtksdaap41>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Tue, 03 Dec 2019 08:05:18 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=mediatek.com; s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:Message-ID;
 bh=BVAs28Vtt9E82BQJB0GFe4lxbgi2+ruTeT4/bQX4A4I=; 
 b=XHbmMynDvrHjPl/c8iUX+/TuxhLI20Bichhqnr589Geoydmgzk7xI3dejC0HQl2/HepO1dCD9lqDXY3CUMduZb82VYMRsS+3lD4IoJR6JOzRQLKRQ6evVHhpZpfIwyGSHmWwlaXlfRjY2r+xG4qNafMblAikeJuBQj/Pr5sHooc=;
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
Reply-To: yongqiang.niu@mediatek.com
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDE5LTEyLTAzIGF0IDEzOjQ4ICswODAwLCBDSyBIdSB3cm90ZToNCj4gSGksIFlv
bmdxaWFuZzoNCj4gDQo+IE9uIFdlZCwgMjAxOS0xMS0yNyBhdCAwOToxNyArMDgwMCwgeW9uZ3Fp
YW5nLm5pdUBtZWRpYXRlay5jb20gd3JvdGU6DQo+ID4gRnJvbTogWW9uZ3FpYW5nIE5pdSA8eW9u
Z3FpYW5nLm5pdUBtZWRpYXRlay5jb20+DQo+ID4gDQo+ID4gUHJvYmxlbToNCj4gPiBvdmVybGF5
IGhhbmd1cCB3aGVuIGV4dGVybmFsIGRpc3BsYXkgaG90cGx1dCB0ZXN0DQo+ID4gDQo+ID4gRml4
Og0KPiA+IGRpc2FibGUgb3ZlcmxheSB3aGVuIGNydGMgZGlzYWJsZQ0KPiANCj4gSSB0aGluayB5
b3UgZG8gdHdvIHRoaW5ncyBpbiB0aGlzIHBhdGNoLiBUaGUgZmlyc3QgaXMgdG8gY29uZmlnIGxh
eWVyDQo+IGJlZm9yZSBjb21wb25lbnQgc3RhcnQsIGFuZCB0aGUgc2Vjb25kIGlzIGRpc2FibGUg
bGF5ZXIgd2hlbiBjcnRjDQo+IGRpc2FibGUuIFNvIHNlcGFyYXRlIHRvIHR3byBwYXRjaGVzLg0K
PiANCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBZb25ncWlhbmcgTml1IDx5b25ncWlhbmcubml1
QG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcm1fY3J0Yy5jIHwgMzkgKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tDQo+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkNCj4gPiAN
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5j
IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jDQo+ID4gaW5kZXggNGZi
MzQ2Yy4uN2VjYTAyZiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RybV9jcnRjLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Ry
bV9jcnRjLmMNCj4gPiBAQCAtMzY5LDYgKzM2OSwyMCBAQCBzdGF0aWMgaW50IG10a19jcnRjX2Rk
cF9od19pbml0KHN0cnVjdCBtdGtfZHJtX2NydGMgKm10a19jcnRjKQ0KPiA+ICAJbXRrX2Rpc3Bf
bXV0ZXhfYWRkX2NvbXAobXRrX2NydGMtPm11dGV4LCBtdGtfY3J0Yy0+ZGRwX2NvbXBbaV0tPmlk
KTsNCj4gPiAgCW10a19kaXNwX211dGV4X2VuYWJsZShtdGtfY3J0Yy0+bXV0ZXgpOw0KPiA+ICAN
Cj4gPiArCS8qIEluaXRpYWxseSBjb25maWd1cmUgYWxsIHBsYW5lcyAqLw0KPiA+ICsJZm9yIChp
ID0gMDsgaSA8IG10a19jcnRjLT5sYXllcl9ucjsgaSsrKSB7DQo+ID4gKwkJc3RydWN0IGRybV9w
bGFuZSAqcGxhbmUgPSAmbXRrX2NydGMtPnBsYW5lc1tpXTsNCj4gPiArCQlzdHJ1Y3QgbXRrX3Bs
YW5lX3N0YXRlICpwbGFuZV9zdGF0ZTsNCj4gPiArCQlzdHJ1Y3QgbXRrX2RkcF9jb21wICpjb21w
Ow0KPiA+ICsJCXVuc2lnbmVkIGludCBsb2NhbF9sYXllcjsNCj4gPiArDQo+ID4gKwkJcGxhbmVf
c3RhdGUgPSB0b19tdGtfcGxhbmVfc3RhdGUocGxhbmUtPnN0YXRlKTsNCj4gPiArCQljb21wID0g
bXRrX2RybV9kZHBfY29tcF9mb3JfcGxhbmUoY3J0YywgcGxhbmUsICZsb2NhbF9sYXllcik7DQo+
ID4gKwkJaWYgKGNvbXApDQo+ID4gKwkJCW10a19kZHBfY29tcF9sYXllcl9jb25maWcoY29tcCwg
bG9jYWxfbGF5ZXIsDQo+ID4gKwkJCQkJCSAgcGxhbmVfc3RhdGUsIE5VTEwpOw0KPiA+ICsJfQ0K
PiA+ICsNCj4gPiAgCWZvciAoaSA9IDA7IGkgPCBtdGtfY3J0Yy0+ZGRwX2NvbXBfbnI7IGkrKykg
ew0KPiA+ICAJCXN0cnVjdCBtdGtfZGRwX2NvbXAgKmNvbXAgPSBtdGtfY3J0Yy0+ZGRwX2NvbXBb
aV07DQo+ID4gIAkJZW51bSBtdGtfZGRwX2NvbXBfaWQgcHJldjsNCj4gPiBAQCAtMzg1LDIwICsz
OTksNiBAQCBzdGF0aWMgaW50IG10a19jcnRjX2RkcF9od19pbml0KHN0cnVjdCBtdGtfZHJtX2Ny
dGMgKm10a19jcnRjKQ0KPiA+ICAJCW10a19kZHBfY29tcF9zdGFydChjb21wKTsNCj4gPiAgCX0N
Cj4gPiAgDQo+ID4gLQkvKiBJbml0aWFsbHkgY29uZmlndXJlIGFsbCBwbGFuZXMgKi8NCj4gPiAt
CWZvciAoaSA9IDA7IGkgPCBtdGtfY3J0Yy0+bGF5ZXJfbnI7IGkrKykgew0KPiA+IC0JCXN0cnVj
dCBkcm1fcGxhbmUgKnBsYW5lID0gJm10a19jcnRjLT5wbGFuZXNbaV07DQo+ID4gLQkJc3RydWN0
IG10a19wbGFuZV9zdGF0ZSAqcGxhbmVfc3RhdGU7DQo+ID4gLQkJc3RydWN0IG10a19kZHBfY29t
cCAqY29tcDsNCj4gPiAtCQl1bnNpZ25lZCBpbnQgbG9jYWxfbGF5ZXI7DQo+ID4gLQ0KPiA+IC0J
CXBsYW5lX3N0YXRlID0gdG9fbXRrX3BsYW5lX3N0YXRlKHBsYW5lLT5zdGF0ZSk7DQo+ID4gLQkJ
Y29tcCA9IG10a19kcm1fZGRwX2NvbXBfZm9yX3BsYW5lKGNydGMsIHBsYW5lLCAmbG9jYWxfbGF5
ZXIpOw0KPiA+IC0JCWlmIChjb21wKQ0KPiA+IC0JCQltdGtfZGRwX2NvbXBfbGF5ZXJfY29uZmln
KGNvbXAsIGxvY2FsX2xheWVyLA0KPiA+IC0JCQkJCQkgIHBsYW5lX3N0YXRlLCBOVUxMKTsNCj4g
PiAtCX0NCj4gPiAtDQo+ID4gIAlyZXR1cm4gMDsNCj4gPiAgDQo+ID4gIGVycl9tdXRleF91bnBy
ZXBhcmU6DQo+ID4gQEAgLTYwNywxMCArNjA3LDIxIEBAIHN0YXRpYyB2b2lkIG10a19kcm1fY3J0
Y19hdG9taWNfZGlzYWJsZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsDQo+ID4gIAlmb3IgKGkgPSAw
OyBpIDwgbXRrX2NydGMtPmxheWVyX25yOyBpKyspIHsNCj4gPiAgCQlzdHJ1Y3QgZHJtX3BsYW5l
ICpwbGFuZSA9ICZtdGtfY3J0Yy0+cGxhbmVzW2ldOw0KPiA+ICAJCXN0cnVjdCBtdGtfcGxhbmVf
c3RhdGUgKnBsYW5lX3N0YXRlOw0KPiA+ICsJCXN0cnVjdCBtdGtfZGRwX2NvbXAgKmNvbXAgPSBt
dGtfY3J0Yy0+ZGRwX2NvbXBbMF07DQo+ID4gKwkJdW5zaWduZWQgaW50IGNvbXBfbGF5ZXJfbnIg
PSBtdGtfZGRwX2NvbXBfbGF5ZXJfbnIoY29tcCk7DQo+ID4gKwkJdW5zaWduZWQgaW50IGxvY2Fs
X2xheWVyOw0KPiA+ICANCj4gPiAgCQlwbGFuZV9zdGF0ZSA9IHRvX210a19wbGFuZV9zdGF0ZShw
bGFuZS0+c3RhdGUpOw0KPiA+ICAJCXBsYW5lX3N0YXRlLT5wZW5kaW5nLmVuYWJsZSA9IGZhbHNl
Ow0KPiA+ICAJCXBsYW5lX3N0YXRlLT5wZW5kaW5nLmNvbmZpZyA9IHRydWU7DQo+ID4gKw0KPiA+
ICsJCWlmIChpID49IGNvbXBfbGF5ZXJfbnIpIHsNCj4gPiArCQkJY29tcCA9IG10a19jcnRjLT5k
ZHBfY29tcFsxXTsNCj4gPiArCQkJbG9jYWxfbGF5ZXIgPSBpIC0gY29tcF9sYXllcl9ucjsNCj4g
PiArCQl9IGVsc2UNCj4gPiArCQkJbG9jYWxfbGF5ZXIgPSBpOw0KPiA+ICsJCW10a19kZHBfY29t
cF9sYXllcl9jb25maWcoY29tcCwgbG9jYWxfbGF5ZXIsDQo+ID4gKwkJCQkJICBwbGFuZV9zdGF0
ZSwgTlVMTCk7DQo+IA0KPiBJJ20gY29uZnVzZWQgd2l0aCB0aGlzIHBhcnQuIFRoZSBkZXNpZ24g
b2YgdGhpcyBsb29wIGlzIHRvIHNldA0KPiBwbGFuZV9zdGF0ZS0+cGVuZGluZy5lbmFibGUgPSBm
YWxzZSBhbmQgd2FpdCBmb3IgaXJxIGhhbmRsZXIgdG8gd3JpdGUNCj4gcmVnaXN0ZXIuIFdoeSBk
byB5b3UgZGlyZWN0bHkgd3JpdGUgcmVnaXN0ZXI/DQo+IA0KPiBSZWdhcmRzLA0KPiBDSw0KDQp3
aGVuIGNtZHEgZW5hYmxlLCBtdGtfY3J0Yy0+Y21kcV9jbGllbnQgd2lsbCBiZSBhbHdheXMgdHJ1
ZSB3aGVuIGNydGMNCmNyZWF0ZSwgdGhlcmUgaXMgbm8gY2hhbmNlIGZvciBtdGtfY3J0Y19kZHBf
Y29uZmlnIHByb2Nlc3MgaW4gZGRwIGlycSANCmNhbGxiYWNrIGZ1bmN0aW9uDQo+IA0KPiA+ICAJ
fQ0KPiA+ICAJbXRrX2NydGMtPnBlbmRpbmdfcGxhbmVzID0gdHJ1ZTsNCj4gPiAgDQo+IA0KPiAN
Cg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
