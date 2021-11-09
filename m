Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B2944AB57
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 11:19:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83AF36E89F;
	Tue,  9 Nov 2021 10:19:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EE896E897
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 10:19:34 +0000 (UTC)
X-UUID: e8342af65b43483c9d41bbf8b5679b8a-20211109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=TFv/vUftrCh38jDwGXTl37MHujASck+n35ZeoH79Y+s=; 
 b=C3BoU0HssF401/jjFPsjc/cwldBMKpJZbCqdrSw1VWio68E0/uXD8x3LqJKCFK9qLAeatQOEeEBRpd7WaU2LfBJ1N9okT+9dkHI96mrNEvXFqkmrDY8YcsW6fzOLZMVfB8hc8V0jHDE+Nfw5vXgL70dzjvWxKgGMP4Tera2mxLQ=;
X-UUID: e8342af65b43483c9d41bbf8b5679b8a-20211109
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1544501370; Tue, 09 Nov 2021 18:19:31 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 9 Nov 2021 18:19:30 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs10n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 9 Nov 2021 18:19:29 +0800
Message-ID: <ed30fae1acf18e5c7e84fce539a4abe78d7a8b61.camel@mediatek.com>
Subject: Re: [PATCH v8, 04/17] media: mtk-vcodec: Build decoder pm file as
 module
From: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
Date: Tue, 9 Nov 2021 18:19:29 +0800
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
Cc: Irui Wang <irui.wang@mediatek.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgZGFmbmEsDQoNClRoYW5rcyBmb3IgeW91ciBzdWdnZXN0aW9uLg0KT24gRnJpLCAyMDIxLTEw
LTI5IGF0IDEzOjQyICswMjAwLCBEYWZuYSBIaXJzY2hmZWxkIHdyb3RlOg0KPiANCj4gT24gMjku
MTAuMjEgMDU6NTUsIFl1bmZlaSBEb25nIHdyb3RlOg0KPiA+IE5lZWQgdG8gYnVpbGQgZGVjb2Rl
ciBwbSBmaWxlIGFzIG1vZHVsZSBmb3IgbWFzdGVyIGFuZCBjb21wDQo+ID4gdXNlIHRoZSBzYW1l
IHBtIGludGVyZmFjZS4NCj4gDQo+IERvIHlvdSBzdGlsbCB1c2UgdGhlIGNvbXBvbmVudCBmcmFt
ZXdvcmsgaW4gdGhpcyBwYXRjaHNldD8NCj4gSW4gdGhlIGNvdmVyIGxldHRlciB5b3Ugd3JpdGU6
ICItIFVzZSBvZl9wbGF0Zm9ybV9wb3B1bGF0ZSB0byBtYW5hZ2UNCj4gbXVsdGkgaGFyZHdhcmUs
IG5vdCBjb21wb25lbnQgZnJhbWV3b3JrIGZvciBwYXRjaCA0LzE1Ig0KcmVtb3ZlIGNvbXBvbmVu
dC4NCj4gSWYgdGhhdCBmcmFtZXdvcmtzIGlzIG5vdCB1c2VkIGFueW1vcmUgeW91IHNob3VsZCBh
bHNvIGNoYW5nZSB0aGUNCj4gY29tbWl0IGxvZywgYW5kIG1heWJlIHRoaXMgcGF0Y2ggaXMgbm90
IG5lZWRlZCBhbnltb3JlPw0KPiANCm1haW4gZGV2aWNlIGFuZCBzdWJkZXYgZGV2aWNlIGFsbCB1
c2UgdGhlIHNhbWUgcG0gaW50ZXJmYWNlLCBzbyBidWlsZA0KdGhlIGZpbGUgYXMgbW9kdWxlLg0K
PiBUaGFua3MsDQo+IERhZm5hDQpUaGFua3MsDQpZdW5mZWkgRG9uZw0KPiA+IA0KPiA+IFNpZ25l
ZC1vZmYtYnk6IFl1bmZlaSBEb25nIDx5dW5mZWkuZG9uZ0BtZWRpYXRlay5jb20+DQo+ID4gLS0t
DQo+ID4gdjg6IGFkZCBuZXcgcGF0Y2ggdG8gYnVpbGQgcG0gZmlsZSBhcyBtb2R1bGUNCj4gPiAt
LS0NCj4gPiAgIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy9NYWtlZmlsZSAgICAg
ICAgICAgIHwgNiArKysrLS0NCj4gPiAgIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2Rl
Yy9tdGtfdmNvZGVjX2RlY19wbS5jIHwgOQ0KPiA+ICsrKysrKysrKw0KPiA+ICAgMiBmaWxlcyBj
aGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvTWFrZWZpbGUNCj4gPiBi
L2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy9NYWtlZmlsZQ0KPiA+IGluZGV4IGNh
OGU5ZTdhOWM0ZS4uNWQzNmUwNTUzNWQ3IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEv
cGxhdGZvcm0vbXRrLXZjb2RlYy9NYWtlZmlsZQ0KPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxh
dGZvcm0vbXRrLXZjb2RlYy9NYWtlZmlsZQ0KPiA+IEBAIC0yLDcgKzIsOCBAQA0KPiA+ICAgDQo+
ID4gICBvYmotJChDT05GSUdfVklERU9fTUVESUFURUtfVkNPREVDKSArPSBtdGstdmNvZGVjLWRl
Yy5vIFwNCj4gPiAgIAkJCQkgICAgICAgbXRrLXZjb2RlYy1lbmMubyBcDQo+ID4gLQkJCQkgICAg
ICAgbXRrLXZjb2RlYy1jb21tb24ubw0KPiA+ICsJCQkJICAgICAgIG10ay12Y29kZWMtY29tbW9u
Lm8gXA0KPiA+ICsJCQkJICAgICAgIG10ay12Y29kZWMtZGVjLWNvbW1vbi5vDQo+ID4gICANCj4g
PiAgIG10ay12Y29kZWMtZGVjLXkgOj0gdmRlYy92ZGVjX2gyNjRfaWYubyBcDQo+ID4gICAJCXZk
ZWMvdmRlY192cDhfaWYubyBcDQo+ID4gQEAgLTE0LDcgKzE1LDggQEAgbXRrLXZjb2RlYy1kZWMt
eSA6PSB2ZGVjL3ZkZWNfaDI2NF9pZi5vIFwNCj4gPiAgIAkJbXRrX3Zjb2RlY19kZWMubyBcDQo+
ID4gICAJCW10a192Y29kZWNfZGVjX3N0YXRlZnVsLm8gXA0KPiA+ICAgCQltdGtfdmNvZGVjX2Rl
Y19zdGF0ZWxlc3MubyBcDQo+ID4gLQkJbXRrX3Zjb2RlY19kZWNfcG0ubyBcDQo+ID4gKw0KPiA+
ICttdGstdmNvZGVjLWRlYy1jb21tb24teSA6PSBtdGtfdmNvZGVjX2RlY19wbS5vDQo+ID4gICAN
Cj4gPiAgIG10ay12Y29kZWMtZW5jLXkgOj0gdmVuYy92ZW5jX3ZwOF9pZi5vIFwNCj4gPiAgIAkJ
dmVuYy92ZW5jX2gyNjRfaWYubyBcDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxh
dGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2RlY19wbS5jDQo+ID4gYi9kcml2ZXJzL21lZGlh
L3BsYXRmb3JtL210ay12Y29kZWMvbXRrX3Zjb2RlY19kZWNfcG0uYw0KPiA+IGluZGV4IDIwYmQx
NTdhODU1Yy4uMDlhMjgxZTMwNjVhIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxh
dGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2RlY19wbS5jDQo+ID4gKysrIGIvZHJpdmVycy9t
ZWRpYS9wbGF0Zm9ybS9tdGstdmNvZGVjL210a192Y29kZWNfZGVjX3BtLmMNCj4gPiBAQCAtNzcs
MTIgKzc3LDE0IEBAIGludCBtdGtfdmNvZGVjX2luaXRfZGVjX3BtKHN0cnVjdA0KPiA+IHBsYXRm
b3JtX2RldmljZSAqcGRldiwNCj4gPiAgIAlwdXRfZGV2aWNlKHBtLT5sYXJidmRlYyk7DQo+ID4g
ICAJcmV0dXJuIHJldDsNCj4gPiAgIH0NCj4gPiArRVhQT1JUX1NZTUJPTF9HUEwobXRrX3Zjb2Rl
Y19pbml0X2RlY19wbSk7DQo+ID4gICANCj4gPiAgIHZvaWQgbXRrX3Zjb2RlY19yZWxlYXNlX2Rl
Y19wbShzdHJ1Y3QgbXRrX3Zjb2RlY19wbSAqcG0pDQo+ID4gICB7DQo+ID4gICAJcG1fcnVudGlt
ZV9kaXNhYmxlKHBtLT5kZXYpOw0KPiA+ICAgCXB1dF9kZXZpY2UocG0tPmxhcmJ2ZGVjKTsNCj4g
PiAgIH0NCj4gPiArRVhQT1JUX1NZTUJPTF9HUEwobXRrX3Zjb2RlY19yZWxlYXNlX2RlY19wbSk7
DQo+ID4gICANCj4gPiAgIGludCBtdGtfdmNvZGVjX2RlY19wd19vbihzdHJ1Y3QgbXRrX3Zjb2Rl
Y19wbSAqcG0pDQo+ID4gICB7DQo+ID4gQEAgLTk0LDYgKzk2LDcgQEAgaW50IG10a192Y29kZWNf
ZGVjX3B3X29uKHN0cnVjdCBtdGtfdmNvZGVjX3BtDQo+ID4gKnBtKQ0KPiA+ICAgDQo+ID4gICAJ
cmV0dXJuIHJldDsNCj4gPiAgIH0NCj4gPiArRVhQT1JUX1NZTUJPTF9HUEwobXRrX3Zjb2RlY19k
ZWNfcHdfb24pOw0KPiA+ICAgDQo+ID4gICB2b2lkIG10a192Y29kZWNfZGVjX3B3X29mZihzdHJ1
Y3QgbXRrX3Zjb2RlY19wbSAqcG0pDQo+ID4gICB7DQo+ID4gQEAgLTEwMyw2ICsxMDYsNyBAQCB2
b2lkIG10a192Y29kZWNfZGVjX3B3X29mZihzdHJ1Y3QgbXRrX3Zjb2RlY19wbQ0KPiA+ICpwbSkN
Cj4gPiAgIAlpZiAocmV0KQ0KPiA+ICAgCQltdGtfdjRsMl9lcnIoInBtX3J1bnRpbWVfcHV0X3N5
bmMgZmFpbCAlZCIsIHJldCk7DQo+ID4gICB9DQo+ID4gK0VYUE9SVF9TWU1CT0xfR1BMKG10a192
Y29kZWNfZGVjX3B3X29mZik7DQo+ID4gICANCj4gPiAgIHZvaWQgbXRrX3Zjb2RlY19kZWNfY2xv
Y2tfb24oc3RydWN0IG10a192Y29kZWNfcG0gKnBtKQ0KPiA+ICAgew0KPiA+IEBAIC0xMjksNiAr
MTMzLDcgQEAgdm9pZCBtdGtfdmNvZGVjX2RlY19jbG9ja19vbihzdHJ1Y3QNCj4gPiBtdGtfdmNv
ZGVjX3BtICpwbSkNCj4gPiAgIAlmb3IgKGkgLT0gMTsgaSA+PSAwOyBpLS0pDQo+ID4gICAJCWNs
a19kaXNhYmxlX3VucHJlcGFyZShkZWNfY2xrLT5jbGtfaW5mb1tpXS52Y29kZWNfY2xrKTsNCj4g
PiAgIH0NCj4gPiArRVhQT1JUX1NZTUJPTF9HUEwobXRrX3Zjb2RlY19kZWNfY2xvY2tfb24pOw0K
PiA+ICAgDQo+ID4gICB2b2lkIG10a192Y29kZWNfZGVjX2Nsb2NrX29mZihzdHJ1Y3QgbXRrX3Zj
b2RlY19wbSAqcG0pDQo+ID4gICB7DQo+ID4gQEAgLTEzOSwzICsxNDQsNyBAQCB2b2lkIG10a192
Y29kZWNfZGVjX2Nsb2NrX29mZihzdHJ1Y3QNCj4gPiBtdGtfdmNvZGVjX3BtICpwbSkNCj4gPiAg
IAlmb3IgKGkgPSBkZWNfY2xrLT5jbGtfbnVtIC0gMTsgaSA+PSAwOyBpLS0pDQo+ID4gICAJCWNs
a19kaXNhYmxlX3VucHJlcGFyZShkZWNfY2xrLT5jbGtfaW5mb1tpXS52Y29kZWNfY2xrKTsNCj4g
PiAgIH0NCj4gPiArRVhQT1JUX1NZTUJPTF9HUEwobXRrX3Zjb2RlY19kZWNfY2xvY2tfb2ZmKTsN
Cj4gPiArDQo+ID4gK01PRFVMRV9MSUNFTlNFKCJHUEwgdjIiKTsNCj4gPiArTU9EVUxFX0RFU0NS
SVBUSU9OKCJNZWRpYXRlayB2aWRlbyBkZWNvZGVyIGRyaXZlciIpOw0KPiA+IA0K

