Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9BB440810
	for <lists+dri-devel@lfdr.de>; Sat, 30 Oct 2021 10:50:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5C776EAAE;
	Sat, 30 Oct 2021 08:50:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 989926EAAE
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Oct 2021 08:50:11 +0000 (UTC)
X-UUID: ea410bf9c0134a92af7a310779ed9aed-20211030
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=1joBWrxOLNnv6naEfw5acQVYLyvbuOpjrLGQ/Z9923E=; 
 b=fukOpsn9NFxr6gAzOYr+1TDiP27v6H+bEI0ZCx0VY51K7aMXo6bSC2+X7xe2ItYVYgilsaQ4+6pO8jr68JdJ3rcK0351BGb/W+Q5ffuebPOWfr0C2VcRdlNW+rjeVs3HXGthQJWovE62UdtFcaFB+fIxL2pPgA0W6zpMPTGBB4M=;
X-UUID: ea410bf9c0134a92af7a310779ed9aed-20211030
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1412050710; Sat, 30 Oct 2021 16:50:06 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 30 Oct 2021 16:50:05 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkexhb01.mediatek.inc (172.21.101.102) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 30 Oct 2021 16:50:04 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs10n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Sat, 30 Oct 2021 16:50:03 +0800
Message-ID: <b44d4ff55dd9d9c98d75fca3e75abaf42be0c105.camel@mediatek.com>
Subject: Re: [PATCH v8, 04/17] media: mtk-vcodec: Build decoder pm file as
 module
From: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, Daniel Vetter
 <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, Irui Wang
 <irui.wang@mediatek.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Collabora Kernel ML <kernel@collabora.com>
Date: Sat, 30 Oct 2021 16:50:03 +0800
In-Reply-To: <367efd7e-667c-6c0f-a36e-0eff6d323f48@collabora.com>
References: <20211029035527.454-1-yunfei.dong@mediatek.com>
 <20211029035527.454-5-yunfei.dong@mediatek.com>
 <367efd7e-667c-6c0f-a36e-0eff6d323f48@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuZmEsDQoNClRoYW5rcyBmb3IgeW91ciBmZWVkYmFjay4NCk9uIEZyaSwgMjAyMS0xMC0y
OSBhdCAxMzo0MiArMDIwMCwgRGFmbmEgSGlyc2NoZmVsZCB3cm90ZToNCj4gDQo+IE9uIDI5LjEw
LjIxIDA1OjU1LCBZdW5mZWkgRG9uZyB3cm90ZToNCj4gPiBOZWVkIHRvIGJ1aWxkIGRlY29kZXIg
cG0gZmlsZSBhcyBtb2R1bGUgZm9yIG1hc3RlciBhbmQgY29tcA0KPiA+IHVzZSB0aGUgc2FtZSBw
bSBpbnRlcmZhY2UuDQo+IA0KPiBEbyB5b3Ugc3RpbGwgdXNlIHRoZSBjb21wb25lbnQgZnJhbWV3
b3JrIGluIHRoaXMgcGF0Y2hzZXQ/DQo+IEluIHRoZSBjb3ZlciBsZXR0ZXIgeW91IHdyaXRlOiAi
LSBVc2Ugb2ZfcGxhdGZvcm1fcG9wdWxhdGUgdG8gbWFuYWdlDQo+IG11bHRpIGhhcmR3YXJlLCBu
b3QgY29tcG9uZW50IGZyYW1ld29yayBmb3IgcGF0Y2ggNC8xNSINCj4gSWYgdGhhdCBmcmFtZXdv
cmtzIGlzIG5vdCB1c2VkIGFueW1vcmUgeW91IHNob3VsZCBhbHNvIGNoYW5nZSB0aGUNCj4gY29t
bWl0IGxvZywgYW5kIG1heWJlIHRoaXMgcGF0Y2ggaXMgbm90IG5lZWRlZCBhbnltb3JlPw0KPiAN
Ck5vdCB1c2UgY29tcG9uZW50IGZyYW1ld29yay4NCg0KRm9yIGlvbW11IGxpbWl0LCBub3Qgb25s
eSBwYXJlbnQgZGV2aWNlLCB0aGUgY2hpbGQgZGV2aWNlIGFsc28gbmVlZCB0bw0KcmVnaXN0ZXIg
YXMgcGxhdGZvcm0gZGV2aWNlLiBTbyB0aGUgY2hpbGQgZGV2aWNlIG5lZWQgdG8gY2FsbA0KbW9k
dWxlX3BsYXRmb3JtX2RyaXZlci4gVGhlIGNoaWxkIGFuZCBwYXJlbnQgZGV2aWNlIGFsbCBuZWVk
IHRvIGNhbGwgcG0NCmludGVyZmFjZSB0byBvcGVuL2Nsb3NlIHBtL2Nsay9pcnEuIFNvIGJ1aWxk
IHBtIGZpbGUgYXMgbW9kdWxlLCBhbmQNCmV4cG9ydCBuZWNlc3NhcnkgZnVuY3Rpb24uDQo+ID4g
DQoNClRoYW5rcw0KWXVuZmVpIERvbmcNCj4gVGhhbmtzLA0KPiBEYWZuYQ0KPiA+IFNpZ25lZC1v
ZmYtYnk6IFl1bmZlaSBEb25nIDx5dW5mZWkuZG9uZ0BtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+
ID4gdjg6IGFkZCBuZXcgcGF0Y2ggdG8gYnVpbGQgcG0gZmlsZSBhcyBtb2R1bGUNCj4gPiAtLS0N
Cj4gPiAgIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy9NYWtlZmlsZSAgICAgICAg
ICAgIHwgNiArKysrLS0NCj4gPiAgIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy9t
dGtfdmNvZGVjX2RlY19wbS5jIHwgOQ0KPiA+ICsrKysrKysrKw0KPiA+ICAgMiBmaWxlcyBjaGFu
Z2VkLCAxMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvTWFrZWZpbGUNCj4gPiBiL2Ry
aXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy9NYWtlZmlsZQ0KPiA+IGluZGV4IGNhOGU5
ZTdhOWM0ZS4uNWQzNmUwNTUzNWQ3IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxh
dGZvcm0vbXRrLXZjb2RlYy9NYWtlZmlsZQ0KPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZv
cm0vbXRrLXZjb2RlYy9NYWtlZmlsZQ0KPiA+IEBAIC0yLDcgKzIsOCBAQA0KPiA+ICAgDQo+ID4g
ICBvYmotJChDT05GSUdfVklERU9fTUVESUFURUtfVkNPREVDKSArPSBtdGstdmNvZGVjLWRlYy5v
IFwNCj4gPiAgIAkJCQkgICAgICAgbXRrLXZjb2RlYy1lbmMubyBcDQo+ID4gLQkJCQkgICAgICAg
bXRrLXZjb2RlYy1jb21tb24ubw0KPiA+ICsJCQkJICAgICAgIG10ay12Y29kZWMtY29tbW9uLm8g
XA0KPiA+ICsJCQkJICAgICAgIG10ay12Y29kZWMtZGVjLWNvbW1vbi5vDQo+ID4gICANCj4gPiAg
IG10ay12Y29kZWMtZGVjLXkgOj0gdmRlYy92ZGVjX2gyNjRfaWYubyBcDQo+ID4gICAJCXZkZWMv
dmRlY192cDhfaWYubyBcDQo+ID4gQEAgLTE0LDcgKzE1LDggQEAgbXRrLXZjb2RlYy1kZWMteSA6
PSB2ZGVjL3ZkZWNfaDI2NF9pZi5vIFwNCj4gPiAgIAkJbXRrX3Zjb2RlY19kZWMubyBcDQo+ID4g
ICAJCW10a192Y29kZWNfZGVjX3N0YXRlZnVsLm8gXA0KPiA+ICAgCQltdGtfdmNvZGVjX2RlY19z
dGF0ZWxlc3MubyBcDQo+ID4gLQkJbXRrX3Zjb2RlY19kZWNfcG0ubyBcDQo+ID4gKw0KPiA+ICtt
dGstdmNvZGVjLWRlYy1jb21tb24teSA6PSBtdGtfdmNvZGVjX2RlY19wbS5vDQo+ID4gICANCj4g
PiAgIG10ay12Y29kZWMtZW5jLXkgOj0gdmVuYy92ZW5jX3ZwOF9pZi5vIFwNCj4gPiAgIAkJdmVu
Yy92ZW5jX2gyNjRfaWYubyBcDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZv
cm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2RlY19wbS5jDQo+ID4gYi9kcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL210ay12Y29kZWMvbXRrX3Zjb2RlY19kZWNfcG0uYw0KPiA+IGluZGV4IDIwYmQxNTdh
ODU1Yy4uMDlhMjgxZTMwNjVhIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZv
cm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2RlY19wbS5jDQo+ID4gKysrIGIvZHJpdmVycy9tZWRp
YS9wbGF0Zm9ybS9tdGstdmNvZGVjL210a192Y29kZWNfZGVjX3BtLmMNCj4gPiBAQCAtNzcsMTIg
Kzc3LDE0IEBAIGludCBtdGtfdmNvZGVjX2luaXRfZGVjX3BtKHN0cnVjdA0KPiA+IHBsYXRmb3Jt
X2RldmljZSAqcGRldiwNCj4gPiAgIAlwdXRfZGV2aWNlKHBtLT5sYXJidmRlYyk7DQo+ID4gICAJ
cmV0dXJuIHJldDsNCj4gPiAgIH0NCj4gPiArRVhQT1JUX1NZTUJPTF9HUEwobXRrX3Zjb2RlY19p
bml0X2RlY19wbSk7DQo+ID4gICANCj4gPiAgIHZvaWQgbXRrX3Zjb2RlY19yZWxlYXNlX2RlY19w
bShzdHJ1Y3QgbXRrX3Zjb2RlY19wbSAqcG0pDQo+ID4gICB7DQo+ID4gICAJcG1fcnVudGltZV9k
aXNhYmxlKHBtLT5kZXYpOw0KPiA+ICAgCXB1dF9kZXZpY2UocG0tPmxhcmJ2ZGVjKTsNCj4gPiAg
IH0NCj4gPiArRVhQT1JUX1NZTUJPTF9HUEwobXRrX3Zjb2RlY19yZWxlYXNlX2RlY19wbSk7DQo+
ID4gICANCj4gPiAgIGludCBtdGtfdmNvZGVjX2RlY19wd19vbihzdHJ1Y3QgbXRrX3Zjb2RlY19w
bSAqcG0pDQo+ID4gICB7DQo+ID4gQEAgLTk0LDYgKzk2LDcgQEAgaW50IG10a192Y29kZWNfZGVj
X3B3X29uKHN0cnVjdCBtdGtfdmNvZGVjX3BtDQo+ID4gKnBtKQ0KPiA+ICAgDQo+ID4gICAJcmV0
dXJuIHJldDsNCj4gPiAgIH0NCj4gPiArRVhQT1JUX1NZTUJPTF9HUEwobXRrX3Zjb2RlY19kZWNf
cHdfb24pOw0KPiA+ICAgDQo+ID4gICB2b2lkIG10a192Y29kZWNfZGVjX3B3X29mZihzdHJ1Y3Qg
bXRrX3Zjb2RlY19wbSAqcG0pDQo+ID4gICB7DQo+ID4gQEAgLTEwMyw2ICsxMDYsNyBAQCB2b2lk
IG10a192Y29kZWNfZGVjX3B3X29mZihzdHJ1Y3QgbXRrX3Zjb2RlY19wbQ0KPiA+ICpwbSkNCj4g
PiAgIAlpZiAocmV0KQ0KPiA+ICAgCQltdGtfdjRsMl9lcnIoInBtX3J1bnRpbWVfcHV0X3N5bmMg
ZmFpbCAlZCIsIHJldCk7DQo+ID4gICB9DQo+ID4gK0VYUE9SVF9TWU1CT0xfR1BMKG10a192Y29k
ZWNfZGVjX3B3X29mZik7DQo+ID4gICANCj4gPiAgIHZvaWQgbXRrX3Zjb2RlY19kZWNfY2xvY2tf
b24oc3RydWN0IG10a192Y29kZWNfcG0gKnBtKQ0KPiA+ICAgew0KPiA+IEBAIC0xMjksNiArMTMz
LDcgQEAgdm9pZCBtdGtfdmNvZGVjX2RlY19jbG9ja19vbihzdHJ1Y3QNCj4gPiBtdGtfdmNvZGVj
X3BtICpwbSkNCj4gPiAgIAlmb3IgKGkgLT0gMTsgaSA+PSAwOyBpLS0pDQo+ID4gICAJCWNsa19k
aXNhYmxlX3VucHJlcGFyZShkZWNfY2xrLT5jbGtfaW5mb1tpXS52Y29kZWNfY2xrKTsNCj4gPiAg
IH0NCj4gPiArRVhQT1JUX1NZTUJPTF9HUEwobXRrX3Zjb2RlY19kZWNfY2xvY2tfb24pOw0KPiA+
ICAgDQo+ID4gICB2b2lkIG10a192Y29kZWNfZGVjX2Nsb2NrX29mZihzdHJ1Y3QgbXRrX3Zjb2Rl
Y19wbSAqcG0pDQo+ID4gICB7DQo+ID4gQEAgLTEzOSwzICsxNDQsNyBAQCB2b2lkIG10a192Y29k
ZWNfZGVjX2Nsb2NrX29mZihzdHJ1Y3QNCj4gPiBtdGtfdmNvZGVjX3BtICpwbSkNCj4gPiAgIAlm
b3IgKGkgPSBkZWNfY2xrLT5jbGtfbnVtIC0gMTsgaSA+PSAwOyBpLS0pDQo+ID4gICAJCWNsa19k
aXNhYmxlX3VucHJlcGFyZShkZWNfY2xrLT5jbGtfaW5mb1tpXS52Y29kZWNfY2xrKTsNCj4gPiAg
IH0NCj4gPiArRVhQT1JUX1NZTUJPTF9HUEwobXRrX3Zjb2RlY19kZWNfY2xvY2tfb2ZmKTsNCj4g
PiArDQo+ID4gK01PRFVMRV9MSUNFTlNFKCJHUEwgdjIiKTsNCj4gPiArTU9EVUxFX0RFU0NSSVBU
SU9OKCJNZWRpYXRlayB2aWRlbyBkZWNvZGVyIGRyaXZlciIpOw0KPiA+IA0K

