Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7360711667D
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 06:42:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D8AC6E321;
	Mon,  9 Dec 2019 05:42:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (mailgw02.mediatek.com [216.200.240.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A667B6E321
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 05:42:07 +0000 (UTC)
X-UUID: f68b681b6ee64dd8b21073ba3f887546-20191208
X-UUID: f68b681b6ee64dd8b21073ba3f887546-20191208
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1996030212; Sun, 08 Dec 2019 21:42:02 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 8 Dec 2019 21:35:44 -0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 9 Dec 2019 13:34:52 +0800
Message-ID: <1575869682.7013.14.camel@mtksdaap41>
Subject: Re: [resend PATCH v6 12/12] drm/mediatek: Add support for mmsys
 through a pdev
From: CK Hu <ck.hu@mediatek.com>
To: <matthias.bgg@kernel.org>
Date: Mon, 9 Dec 2019 13:34:42 +0800
In-Reply-To: <20191207224740.24536-13-matthias.bgg@kernel.org>
References: <20191207224740.24536-1-matthias.bgg@kernel.org>
 <20191207224740.24536-13-matthias.bgg@kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=mediatek.com; s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=IfbqGrd5rrP8sh9a0nWcVEhjpDGUtdEIy6n7ea6KzZ4=; 
 b=boUCfZIdSJ/9DWCp6nuTkpNiIU2FGTRS0vx8r72kqWPe7iiBnqymypHrcOMHg82YHw1/HV6ciTFCqgAchs58jgtAiafI2PBXYbXimJeKnYNVC7JHfO6VTVAb7PDMcl/NzsDRzIrJ+394T7jagw/xYif3D5xaZBssKuKc32niLoc=;
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
Cc: mark.rutland@arm.com, rdunlap@infradead.org, airlied@linux.ie,
 mturquette@baylibre.com, dri-devel@lists.freedesktop.org,
 laurent.pinchart@ideasonboard.com, ulrich.hecht+renesas@gmail.com,
 linux-clk@vger.kernel.org, drinkcat@chromium.org, wens@csie.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 frank-w@public-files.de, sean.wang@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 linux-arm-kernel@lists.infradead.org, mbrugger@suse.com, sboyd@kernel.org,
 sean.wang@kernel.org, linux-kernel@vger.kernel.org,
 enric.balletbo@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIE1hdHRoaWFzOg0KDQpPbiBTYXQsIDIwMTktMTItMDcgYXQgMjM6NDcgKzAxMDAsIG1hdHRo
aWFzLmJnZ0BrZXJuZWwub3JnIHdyb3RlOg0KPiBGcm9tOiBNYXR0aGlhcyBCcnVnZ2VyIDxtYnJ1
Z2dlckBzdXNlLmNvbT4NCj4gDQo+IFRoZSBNTVNZUyBzdWJzeXN0ZW0gaW5jbHVkZXMgY2xvY2tz
IGFuZCBkcm0gY29tcG9uZW50cy4NCj4gVGhpcyBwYXRjaCBhZGRzIGFuIGluaXRhaWxpemF0aW9u
IHBhdGggdGhyb3VnaCBhIHBsYXRmb3JtIGRldmljZQ0KPiBmb3IgdGhlIGNsb2NrIHBhcnQsIHNv
IHRoYXQgYm90aCBkcml2ZXJzIGdldCBwcm9iZWQgZnJvbSB0aGUgc2FtZQ0KPiBkZXZpY2UgdHJl
ZSBjb21wYXRpYmxlLg0KDQpZb3UndmUgc3dpdGNoZWQgbXQ2Nzc5IGFuZCBtdDY3OTcgY2xvY2sg
ZHJpdmVyIHRvIHBsYXRmb3JtIGRldmljZQ0KcHJvYmluZywgYnV0IHlvdSBkb2VzIG5vdCBwcm9i
ZSB0aGVuIGluIGRybSBkcml2ZXIsIHNvIHlvdXIgZGVzaWduIGlzIHRvDQpsZXQgbW1zeXMgY2xv
Y2sgbm90IHdvcmsgaWYgZHJtIGRyaXZlciBpcyBub3QgZW5hYmxlZD8gSXQncyBmaW5lIGZvciBt
ZQ0KYmVjYXVzZSBpdCBzZWVtcyB0aGF0IGRybSBkcml2ZXIgaXMgdGhlIG9ubHkgdXNlciBvZiBt
bXN5cyBjbG9jayBub3cuDQoNClJlZ2FyZHMsDQpDSw0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBN
YXR0aGlhcyBCcnVnZ2VyIDxtYnJ1Z2dlckBzdXNlLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYyB8IDI0ICsrKysrKysrKysrKysrKysrKysrKysr
Kw0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmggfCAgMiArKw0KPiAg
MiBmaWxlcyBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RybV9kcnYuYw0KPiBpbmRleCAyMTA0NTVlOWY0NmMuLjVhZGE3NGQ4ZDBjOSAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMNCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMNCj4gQEAgLTE4Niw2
ICsxODYsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19tbXN5c19kcml2ZXJfZGF0YSBtdDI3
MDFfbW1zeXNfZHJpdmVyX2RhdGEgPSB7DQo+ICAJLmV4dF9wYXRoID0gbXQyNzAxX210a19kZHBf
ZXh0LA0KPiAgCS5leHRfbGVuID0gQVJSQVlfU0laRShtdDI3MDFfbXRrX2RkcF9leHQpLA0KPiAg
CS5zaGFkb3dfcmVnaXN0ZXIgPSB0cnVlLA0KPiArCS5jbGtfZHJ2X25hbWUgPSAiY2xrLW10Mjcw
MS1tbSIsDQo+ICB9Ow0KPiAgDQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19tbXN5c19kcml2
ZXJfZGF0YSBtdDI3MTJfbW1zeXNfZHJpdmVyX2RhdGEgPSB7DQo+IEBAIC0xOTUsNiArMTk2LDcg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfbW1zeXNfZHJpdmVyX2RhdGEgbXQyNzEyX21tc3lz
X2RyaXZlcl9kYXRhID0gew0KPiAgCS5leHRfbGVuID0gQVJSQVlfU0laRShtdDI3MTJfbXRrX2Rk
cF9leHQpLA0KPiAgCS50aGlyZF9wYXRoID0gbXQyNzEyX210a19kZHBfdGhpcmQsDQo+ICAJLnRo
aXJkX2xlbiA9IEFSUkFZX1NJWkUobXQyNzEyX210a19kZHBfdGhpcmQpLA0KPiArCS5jbGtfZHJ2
X25hbWUgPSAiY2xrLW10MjcxMi1tbSIsDQo+ICB9Ow0KPiAgDQo+ICBzdGF0aWMgY29uc3Qgc3Ry
dWN0IG10a19tbXN5c19kcml2ZXJfZGF0YSBtdDgxNzNfbW1zeXNfZHJpdmVyX2RhdGEgPSB7DQo+
IEBAIC0yMDIsNiArMjA0LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfbW1zeXNfZHJpdmVy
X2RhdGEgbXQ4MTczX21tc3lzX2RyaXZlcl9kYXRhID0gew0KPiAgCS5tYWluX2xlbiA9IEFSUkFZ
X1NJWkUobXQ4MTczX210a19kZHBfbWFpbiksDQo+ICAJLmV4dF9wYXRoID0gbXQ4MTczX210a19k
ZHBfZXh0LA0KPiAgCS5leHRfbGVuID0gQVJSQVlfU0laRShtdDgxNzNfbXRrX2RkcF9leHQpLA0K
PiArCS5jbGtfZHJ2X25hbWUgPSAiY2xrLW10ODE3My1tbSIsDQo+ICB9Ow0KPiAgDQo+ICBzdGF0
aWMgaW50IG10a19kcm1fa21zX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRybSkNCj4gQEAgLTQ5
OSw2ICs1MDIsMjQgQEAgc3RhdGljIGludCBtdGtfZHJtX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpDQo+ICAJSU5JVF9XT1JLKCZwcml2YXRlLT5jb21taXQud29yaywgbXRrX2F0
b21pY193b3JrKTsNCj4gIAlwcml2YXRlLT5kYXRhID0gb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRh
KGRldik7DQo+ICANCj4gKwkvKg0KPiArCSAqIE1NU1lTIGluY2x1ZGVzIGFwYXJ0IGZyb20gY29t
cG9uZW50cyBtYW5hZ2VtZW50IGEgYmxvY2sgcHJvdmlkaW5nDQo+ICsJICogY2xvY2tzIGZvciB0
aGUgc3Vic3lzdGVtLiBXZSBwcm9iZSB0aGlzIGNsb2NrIGRyaXZlciB2aWEgYSBwbGF0Zm9ybQ0K
PiArCSAqIGRldmljZS4NCj4gKwkgKi8NCj4gKwlpZiAocHJpdmF0ZS0+ZGF0YS0+Y2xrX2Rydl9u
YW1lKSB7DQo+ICsJCXByaXZhdGUtPmNsa19kZXYgPSBwbGF0Zm9ybV9kZXZpY2VfcmVnaXN0ZXJf
ZGF0YShkZXYsDQo+ICsJCQkJCQlwcml2YXRlLT5kYXRhLT5jbGtfZHJ2X25hbWUsIC0xLA0KPiAr
CQkJCQkJTlVMTCwgMCk7DQo+ICsNCj4gKwkJaWYgKElTX0VSUihwcml2YXRlLT5jbGtfZGV2KSkg
ew0KPiArCQkJZGV2X2VycihkZXYsICJmYWlsZWQgdG8gcmVnaXN0ZXIgJXMgcGxhdGZvcm0gZGV2
aWNlXG4iLA0KPiArCQkJCXByaXZhdGUtPmRhdGEtPmNsa19kcnZfbmFtZSk7DQo+ICsNCj4gKwkJ
CXJldHVybiBQVFJfRVJSKHByaXZhdGUtPmNsa19kZXYpOw0KPiArCQl9DQo+ICsJfQ0KPiArDQo+
ICAJcHJpdmF0ZS0+Y29uZmlnX3JlZ3MgPSBzeXNjb25fbm9kZV90b19yZWdtYXAoZGV2LT5vZl9u
b2RlKTsNCj4gIAlpZiAoSVNfRVJSKHByaXZhdGUtPmNvbmZpZ19yZWdzKSkNCj4gIAkJcmV0dXJu
IFBUUl9FUlIocHJpdmF0ZS0+Y29uZmlnX3JlZ3MpOw0KPiBAQCAtNjA1LDYgKzYyNiw5IEBAIHN0
YXRpYyBpbnQgbXRrX2RybV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4g
IAlmb3IgKGkgPSAwOyBpIDwgRERQX0NPTVBPTkVOVF9JRF9NQVg7IGkrKykNCj4gIAkJb2Zfbm9k
ZV9wdXQocHJpdmF0ZS0+Y29tcF9ub2RlW2ldKTsNCj4gIA0KPiArCWlmIChwcml2YXRlLT5jbGtf
ZGV2KQ0KPiArCQlwbGF0Zm9ybV9kZXZpY2VfdW5yZWdpc3Rlcihwcml2YXRlLT5jbGtfZGV2KTsN
Cj4gKw0KPiAgCXJldHVybiAwOw0KPiAgfQ0KPiAgDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuaCBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHJtX2Rydi5oDQo+IGluZGV4IDYzYTEyMTU3N2RjYi4uOGZlOTEzNmFkYzM4IDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuaA0KPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuaA0KPiBAQCAtMjksMTEgKzI5LDEz
IEBAIHN0cnVjdCBtdGtfbW1zeXNfZHJpdmVyX2RhdGEgew0KPiAgCXVuc2lnbmVkIGludCB0aGly
ZF9sZW47DQo+ICANCj4gIAlib29sIHNoYWRvd19yZWdpc3RlcjsNCj4gKwljb25zdCBjaGFyICpj
bGtfZHJ2X25hbWU7DQo+ICB9Ow0KPiAgDQo+ICBzdHJ1Y3QgbXRrX2RybV9wcml2YXRlIHsNCj4g
IAlzdHJ1Y3QgZHJtX2RldmljZSAqZHJtOw0KPiAgCXN0cnVjdCBkZXZpY2UgKmRtYV9kZXY7DQo+
ICsJc3RydWN0IHBsYXRmb3JtX2RldmljZSAqY2xrX2RldjsNCj4gIA0KPiAgCXVuc2lnbmVkIGlu
dCBudW1fcGlwZXM7DQo+ICANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
