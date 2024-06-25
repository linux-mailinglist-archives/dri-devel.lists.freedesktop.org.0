Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8579F916151
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 10:33:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7161D10E2DB;
	Tue, 25 Jun 2024 08:32:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn
 (mail-sh0chn02on2131.outbound.protection.partner.outlook.cn
 [139.219.146.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1105910E2DB
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 08:32:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dipOAadrQ3X84u4d2LQiov0OunnqiGApz92nCM7VpzpvRdfzS8kHDIS8Weih4Xy26RVFphx1rnXb2jHrnSi7zjcGS0pxW+PhL3y96+QE4KQ5ijwRXgMc2dk1w6qB80rjSlMoPC8SLOMNFkyq8uK1SlZTwYnA9qJofeDOdJbgzj1fmNxkNpLbQoS+fFTd0S9ertFSjbewWJtUoU6vxngvYkihkCAZtfybRvyZxMBUseAfo7xZbBcIXyj05DTZTk74/pqU3/JgArbydG0Bh0hsepu9z0xXFW28tOc4GlGQ+gHK5nJxw4EyATY3dghoyJPeUFNwChsTY3h/DsjPa0u0vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B0BS3+NgjhwRO9sW2/vXlQRPjWokhtoEnZ0cTgY3YSw=;
 b=FWqwPx15mRdLgP1Sb9lxMkXeXF7S6sd3gk2Rd36SG6YjZAmGbQJLDV745b7BO2RMUZ1WtzQNwHuRhy7xxbFxgtqJzBP6p3Onu85+YDYTXXOyO35sGlauww5RwLFu7IF6wvsFyDR10TZ7kqUpKNJC1V+CJ48SCYqUxxdem4JPWyZgYVxRRDjrOxRKvwtgrxvFk/S2w7mXO/OeoG4+barobe7tdnPpRPoGnpiCbai6D9/9A33qcbCys4UgiPDAO1EimSL/QGmI7jeqD/tKr19VuhuXOq0b0Phlg+47G5/n2eXJEY0/mTFvO7OqkQW1DcPhTtva/rfDEO51Wh3voN10hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:1::6) by NTZPR01MB1020.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:8::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.37; Tue, 25 Jun
 2024 08:32:49 +0000
Received: from NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn
 ([fe80::47b8:45b2:ce25:9c34]) by
 NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn ([fe80::47b8:45b2:ce25:9c34%3])
 with mapi id 15.20.7698.025; Tue, 25 Jun 2024 08:32:49 +0000
From: Keith Zhao <keith.zhao@starfivetech.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, "rfoss@kernel.org"
 <rfoss@kernel.org>, "Laurent.pinchart@ideasonboard.com"
 <Laurent.pinchart@ideasonboard.com>, "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "hjc@rock-chips.com" <hjc@rock-chips.com>,
 "heiko@sntech.de" <heiko@sntech.de>, "andy.yan@rock-chips.com"
 <andy.yan@rock-chips.com>, Xingyu Wu <xingyu.wu@starfivetech.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, Jack Zhu
 <jack.zhu@starfivetech.com>, Shengyang Chen
 <shengyang.chen@starfivetech.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v4 04/10] drm/vs: Add hardware funcs for vs.
Thread-Topic: [PATCH v4 04/10] drm/vs: Add hardware funcs for vs.
Thread-Index: AQHaqyrCpZvO4/uSGEiTh57WFeY1YLGiKtEAgCsaiBCACMKCAIACUqHw
Date: Tue, 25 Jun 2024 08:32:49 +0000
Message-ID: <NTZPR01MB1050031B004FD13D167DE3C4EED52@NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn>
References: <20240521105817.3301-1-keith.zhao@starfivetech.com>
 <20240521105817.3301-5-keith.zhao@starfivetech.com>
 <24bxty2zmlmrjmfi2qtfolkea3acghbhmkxnkxmcroovsz57jq@q5ynybr65z7f>
 <NTZPR01MB105049A5A7FD4ECAAECFC403EECB2@NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn>
 <ogrcyxroz77zu6raq3lzmjt2k72uxxeayseyhvkivtsxn2kfix@ioupv56oa6lc>
In-Reply-To: <ogrcyxroz77zu6raq3lzmjt2k72uxxeayseyhvkivtsxn2kfix@ioupv56oa6lc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: NTZPR01MB1050:EE_|NTZPR01MB1020:EE_
x-ms-office365-filtering-correlation-id: d7d57373-d7c5-4f93-38ac-08dc94f1659a
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230037|1800799021|366013|41320700010|7416011|38070700015; 
x-microsoft-antispam-message-info: n0jBUFoRc1y6gluUAEf+IPPcO+dnbXypMCrTQ+3JlgFrpu+eCgkX60w2+vurUYEup8d2N/Epwbc/6RIdIFAgYgk9BlKT7QIz02h12xkG3LU/kg7zm9PX+wWNglTIFy8GxwMdmELAL8wpaj3jNCBXmPZT33Qf1Ks7o/9B/ockk3fHf10PvSwIY1tZoU/a326v+KLeENfgEjg8o949ku+MEWySw5H5Jzyge7Sa3j7q4hEFeS+/M2nApvCWbea0xoMocRvwEHNuf0/z9rH1HU9JUovQGphqfK0hx8wB+Qe7qtNntte1rme4hBHbrj72MO7qIodLev1txBKc4ToPw+UR8MK1FVE45y/Utnd2RILcaorkyQxDKsyQbBd/w1gLtS/4stbTs76coSOwVncVxFKsUR1vqCSINkIGHWRHcOWXL9JojrhecedEibznhn/JbkkmG2qPmLj5L75khAbyOxdqyOPsUwxlW9YC7ToofL0gA3lR1S/HYmN+xyBNYFCK1VTsLb1vP5thm7wIO6sZpSkeyOhMyfiylYeZEhiD141epI7XVWduj/+PCIomWsemWMp8P85QNNCCNhWaupFaeF8T1bPka/Y3HIlQZT6ot1qSLAjI0prM3090D2sKhhqLNSTY
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(41320700010)(7416011)(38070700015); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: WH4+4KhWKhLcW84fRe65EMFmgp6gZFXkzMULPQGb6XNO/LK9xAbRLxqNr8mQ3QGbvgc9LHlw0RspwmkPbTcVvEycopJPAxprIfTKk8gD8Kl9FoHZ9TAXOhxekKv0ByPJdhAgCv9NI7mZk9d1VFfuj83yrdTgc1iCspR6aEaBMUW+Ts7GpJ9EIg3bBbzNuCPJ8Au9kp5XaCog+CLyrMwbzKsYfBjHeCQng+wC0JkAjv7HhadNVJJmTQDyM8ixNW7G59okf+U9is4NIJQg/rFkCPcXxQ7fO2uJlI8Itj1mL1nbzdwNP1rsKv0sp7PX1kSH2J5IrpNnjDFqS3mvi3YFVuVtotNCbFjRwx/J9WO95sXEbirURc8cBJsOzLiuLCzpi4ayzTVwqreW2tE0G8PMmxio+3ZHRIvKASCCe09Qlgg=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: d7d57373-d7c5-4f93-38ac-08dc94f1659a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2024 08:32:49.2215 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WW5F/nEmbQqa/7r4Vtr6aKtXtq+ZJuHP6day9lLWMBS7MvUCa4HSwnN7pAqzPFa8sQjAoRp5+CCyqOlCrTo6NRnABeND4XqtiI8oNPBnlbE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NTZPR01MB1020
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRG1pdHJ5IEJhcnlzaGtv
diA8ZG1pdHJ5LmJhcnlzaGtvdkBsaW5hcm8ub3JnPg0KPiBTZW50OiAyMDI05bm0NuaciDI05pel
IDQ6NTENCj4gVG86IEtlaXRoIFpoYW8gPGtlaXRoLnpoYW9Ac3RhcmZpdmV0ZWNoLmNvbT4NCj4g
Q2M6IGFuZHJ6ZWouaGFqZGFAaW50ZWwuY29tOyBuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnOyBy
Zm9zc0BrZXJuZWwub3JnOw0KPiBMYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb207IGpv
bmFzQGt3aWJvby5zZTsNCj4gamVybmVqLnNrcmFiZWNAZ21haWwuY29tOyBtYWFydGVuLmxhbmto
b3JzdEBsaW51eC5pbnRlbC5jb207DQo+IG1yaXBhcmRAa2VybmVsLm9yZzsgdHppbW1lcm1hbm5A
c3VzZS5kZTsgYWlybGllZEBnbWFpbC5jb207DQo+IGRhbmllbEBmZndsbC5jaDsgcm9iaEBrZXJu
ZWwub3JnOyBrcnprK2R0QGtlcm5lbC5vcmc7IGNvbm9yK2R0QGtlcm5lbC5vcmc7DQo+IGhqY0By
b2NrLWNoaXBzLmNvbTsgaGVpa29Ac250ZWNoLmRlOyBhbmR5LnlhbkByb2NrLWNoaXBzLmNvbTsg
WGluZ3l1IFd1DQo+IDx4aW5neXUud3VAc3RhcmZpdmV0ZWNoLmNvbT47IHAuemFiZWxAcGVuZ3V0
cm9uaXguZGU7IEphY2sgWmh1DQo+IDxqYWNrLnpodUBzdGFyZml2ZXRlY2guY29tPjsgU2hlbmd5
YW5nIENoZW4NCj4gPHNoZW5neWFuZy5jaGVuQHN0YXJmaXZldGVjaC5jb20+OyBkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnOw0KPiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGlu
dXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsNCj4gbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZy
YWRlYWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMDQvMTBdIGRybS92czogQWRkIGhh
cmR3YXJlIGZ1bmNzIGZvciB2cy4NCj4gDQo+IEhpIEtlaXRoLA0KPiANCj4gT24gU3VuLCBKdW4g
MjMsIDIwMjQgYXQgMDc6MTY6NDdBTSBHTVQsIEtlaXRoIFpoYW8gd3JvdGU6DQo+ID4gPiBPbiBU
dWUsIE1heSAyMSwgMjAyNCBhdCAwNjo1ODoxMVBNICswODAwLCBrZWl0aCB3cm90ZToNCj4gPiA+
ID4gK30NCj4gPiA+ID4gKw0KPiA+ID4gPiArc3RhdGljIGlubGluZSB2b2lkIGRjX3NldF9jbGVh
cihzdHJ1Y3QgZGNfaHcgKmh3LCB1MzIgcmVnLCB1MzINCj4gPiA+ID4gK3NldCwgdTMyIGNsZWFy
KSB7DQo+ID4gPiA+ICsJdTMyIHZhbHVlID0gZGNfcmVhZChodywgcmVnKTsNCj4gPiA+ID4gKw0K
PiA+ID4gPiArCXZhbHVlICY9IH5jbGVhcjsNCj4gPiA+ID4gKwl2YWx1ZSB8PSBzZXQ7DQo+ID4g
PiA+ICsJZGNfd3JpdGUoaHcsIHJlZywgdmFsdWUpOw0KPiA+ID4NCj4gPiA+IHJlZ21hcF91cGRh
dGVfYml0cz8NCj4gPg0KPiA+IHJlZ21hcF91cGRhdGVfYml0cyBmb2xsb3dzIDQgc3RlcHM6DQo+
ID4NCj4gPiAx44CBcmV0ID0gX3JlZ21hcF9yZWFkKG1hcCwgcmVnLCAmb3JpZyk7IC4uLi4uLi4u
Lg0KPiA+DQo+ID4gMuOAgXRtcCA9IG9yaWcgJiB+bWFzazsNCj4gPiAz44CBdG1wIHw9IHZhbCAm
IG1hc2s7DQo+ID4gLi4uLi4uDQo+ID4gNOOAgXJldCA9IF9yZWdtYXBfd3JpdGUobWFwLCByZWcs
IHRtcCk7DQo+ID4gSWYgdGhlIHZhbHVlIG91dCBvZiBtYXNrIHJhbmdlDQo+ID4gSXQgd2lsbCBq
dXN0IGNsZWFyIHRoZSBtYXNrIGJpcg0KPiA+DQo+ID4gZGNfc2V0X2NsZWFyIHdpbGwgZG8gY2xl
YXIgYW5kIHNldCB3aXRob3V0IGxpbWl0Lg0KPiA+DQo+ID4gTWF5YmUgdGhlIG5hbWUgc2hvdWxk
IGJlIGRjX2NsZWFyX3NldA0KPiANCj4gVGhpcyBpcyBub3QgcmVhbGx5IGJldHRlci4gcmVnbWFw
X3VwZGF0ZV9iaXRzKCkgaGFzIGNsZWFyIHNlbWFudGljcyBvZiB1cGRhdGluZyBhDQo+IHZhbHVl
IGluIHRoZSBmaWVsZCB0aGF0IGlzIGRlZmluZWQgYnkgYSBtYXNrLiBZb3UgZnVuY3Rpb24gaXMg
anVzdCBjbGVhcmluZyBzb21lIGJpdHMNCj4gYW5kIHNldHRpbmcgb3RoZXIgYml0cy4gSXQncyBu
b3Qgb2J2aW91cyB3aGV0aGVyIGl0IGlzIGEgbWFzayBhbmQgdmFsdWUsIHNldmVyYWwNCj4gY29u
Y3VycmVudCBmbGFncyBvciBzb21ldGhpbmcgZWxzZS4NCj4gDQo+IEV2ZW4gaWYgeW91IGFyZSBu
b3QgZ29pbmcgdG8gc3dpdGNoIHRvIHJlZ21hcHMgKHlvdSBkb24ndCBoYXZlIHRvKSwgcGxlYXNl
IHVzZQ0KPiBtYXNrICYgdmFsdWUgaW5zdGVhZC4NCj4gDQpPayBnb3QgaXQNCj4gPiAJCX0NCj4g
PiA+ID4gK3N0YXRpYyB2b2lkIGxvYWRfcmdiX3RvX3l1dihzdHJ1Y3QgZGNfaHcgKmh3LCB1MzIg
b2Zmc2V0LCBzMTYNCj4gPiA+ID4gKyp0YWJsZSkNCj4gPiA+DQo+ID4gPiBJcyB0aGVyZSBhbnkg
cmVhc29uIHdoeSBsb2FkX3JnYl90b195dXYgZGlmZmVycyBmcm9tIHR3byBvdGhlcg0KPiA+ID4g
ZnVuY3Rpb25zPw0KPiA+ID4NCj4gPiBsb2FkX3JnYl90b195dXYgbWF0Y2hlcyBjcnRjcw0KPiA+
DQo+ID4gbG9hZF95dXZfdG9fcmdiIG1hdGNoZXMgcGxhbmVzDQo+ID4gbG9hZF9yZ2JfdG9fcmdi
IG1hdGNoZXMgcGxhbmVzDQo+IA0KPiBUaGVuIHRoZXNlIGZ1bmN0aW5zIHNob3VsZCBoYXZlIHRo
YXQgcmVmbGVjdGVkIGluIHRoZWlyIG5hbWVzIChhbmQgYWxzbw0KPiBkb2N1bWVudGVkLCB3aHkp
LiBJZiB0aGUgQ1NDIHByb2dyYW1taW5nIGludGVyZmFjZSBpcyBzaW1pbGFyLCBwbGVhc2Ugc3Bs
aXQgdGhlDQo+IGltcGxlbWVudGF0aW9uIHRvIGhhdmUgY29tbW9uIGNvZGUgYW5kIGRpZmZlcmVu
dCBkYXRhIHRvIGJlIHVzZWQgZm9yDQo+IHByb2dyYW1taW5nLg0KPiANCk9rIGdvdCBpdA0KDQo+
ID4gdGhlIGNvZWZmaWNpZW50KHRhYmxlKSBpcyBkaWZmIGJldHdlZW4gbG9hZF9yZ2JfdG9feXV2
IGFuZA0KPiA+IGxvYWRfeXV2X3RvX3JnYg0KPiANCj4gPiA+ID4gK3ZvaWQgcGxhbmVfaHdfdXBk
YXRlX3NjYWxlKHN0cnVjdCB2c19kYyAqZGMsIHN0cnVjdCBkcm1fcmVjdA0KPiA+ID4gPiArKnNy
Yywgc3RydWN0DQo+ID4gPiBkcm1fcmVjdCAqZHN0LA0KPiA+ID4gPiArCQkJICAgdTggaWQsIHU4
IGRpc3BsYXlfaWQsIHVuc2lnbmVkIGludCByb3RhdGlvbik7IHZvaWQNCj4gPiA+ID4gK3BsYW5l
X2h3X3VwZGF0ZV9ibGVuZChzdHJ1Y3QgdnNfZGMgKmRjLCB1MTYgYWxwaGEsIHUxNg0KPiA+ID4g
cGl4ZWxfYmxlbmRfbW9kZSwNCj4gPiA+ID4gKwkJCSAgIHU4IGlkLCB1OCBkaXNwbGF5X2lkKTsN
Cj4gPiA+DQo+ID4gPiBDb3VsZCB5b3UgcGxlYXNlIHNldHRsZSBvbiBhIHNpbmdsZSBwcmVmaXgg
Zm9yIGFsbCB5b3VyIGZ1bmN0aW9uIG5hbWVzPw0KPiA+ID4gSWRlYWxseSBpdCBzaG91bGQgYmUg
Y2xvc2UgdG8gdGhlIGRyaXZlciBuYW1lLiBJdCdzIGhhcmQgdG8NCj4gPiA+IHVuZGVyc3RhbmQg
dGhhdCB0aGUgZnVuY3Rpb24gY29tZXMgZnJvbSB0aGUgdmVyaXNpbGljb24gZHJpdmVyIGlmDQo+
ID4gPiBpdHMgbmFtZSBzdGFydHMgZnJvbSBkY18gb3IgZXNwZWNpYWxseSB3aXRoIHBsYW5lXy4N
Cj4gPiBZZXMgIHN0YXJ0aW5nIHdpdGggcGxhbmVfIGlzIG5vdCBhIGdvb2QgaWRlYSAsaSB3aWxs
IGFkZCB2c18gXyAsDQo+ID4gdGhhbmtzDQo+ID4gPg0KPiA+ID4gSSdkIHN0cm9uZ2x5IHN1Z2dl
c3QgdG8gc3RvcCBkZWZpbmluZyBhbnl0aGluZyBvdXRzaWRlIG9mIHRoZQ0KPiA+ID4gc2VsZWN0
ZWQNCj4gPiBJIGRvbid0IHF1aXRlIHVuZGVyc3RhbmQgd2hhdCAidGhlIHNlbGVjdGVkIiBtZWFu
cywgSSBob3BlIHlvdSBjYW4NCj4gPiBmaWxsIGluIHNvbWUgc3BlY2lmaWMgZGV0YWlscyBhYm91
dCBpdCBUaGFua3MNCj4gDQo+ICJ0aGUgc2VsZWN0ZWQgdnNfIG5hbWVzcGFjZSIuIFNvIHByZWZp
eCBhbGwgZnVuY3Rpb24gbmFtZXMgYW5kIGFsbCBzdHJ1Y3R1cmVzDQo+IHdpdGggdnNfDQpPaywg
Z290IGl0Lg0KPiANCj4gDQo+IC0tDQo+IFdpdGggYmVzdCB3aXNoZXMNCj4gRG1pdHJ5DQo=
