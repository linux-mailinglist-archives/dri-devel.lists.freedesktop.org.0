Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 147D52660F
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 16:40:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 827DC89BB0;
	Wed, 22 May 2019 14:36:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20042.outbound.protection.outlook.com [40.107.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 027D5898BE
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2019 10:37:04 +0000 (UTC)
Received: from AM0PR04MB4865.eurprd04.prod.outlook.com (20.176.215.158) by
 AM0PR04MB6355.eurprd04.prod.outlook.com (10.255.182.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Fri, 17 May 2019 10:37:02 +0000
Received: from AM0PR04MB4865.eurprd04.prod.outlook.com
 ([fe80::f496:84c1:30b5:43be]) by AM0PR04MB4865.eurprd04.prod.outlook.com
 ([fe80::f496:84c1:30b5:43be%7]) with mapi id 15.20.1878.028; Fri, 17 May 2019
 10:37:02 +0000
From: Wen He <wen.he_1@nxp.com>
To: Robin Murphy <robin.murphy@arm.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "liviu.dudau@arm.com" <liviu.dudau@arm.com>
Subject: RE: [EXT] Re: [v1] drm/arm/mali-dp: Disable checking for required
 pixel clock rate
Thread-Topic: [EXT] Re: [v1] drm/arm/mali-dp: Disable checking for required
 pixel clock rate
Thread-Index: AQHVCsfKc9H8v6XkZkyzoxWRKfwkRaZsbagAgAEP0WCAABXcAIABdLnQ
Date: Fri, 17 May 2019 10:37:01 +0000
Message-ID: <AM0PR04MB4865EC817EB0B441D4042D38E20B0@AM0PR04MB4865.eurprd04.prod.outlook.com>
References: <20190515024348.43642-1-wen.he_1@nxp.com>
 <3f87b2a7-c7e8-0597-2f62-d421aa6ccaa5@arm.com>
 <AM0PR04MB4865435E9FA2D61E2D9A238EE20A0@AM0PR04MB4865.eurprd04.prod.outlook.com>
 <edd9dc6c-aba2-3881-3121-efee388b47cf@arm.com>
In-Reply-To: <edd9dc6c-aba2-3881-3121-efee388b47cf@arm.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9d86601f-9a91-45b8-2fb4-08d6dab3991e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR04MB6355; 
x-ms-traffictypediagnostic: AM0PR04MB6355:
x-microsoft-antispam-prvs: <AM0PR04MB635516AD670BC098D330A546E20B0@AM0PR04MB6355.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0040126723
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(376002)(346002)(366004)(136003)(396003)(39860400002)(189003)(199004)(13464003)(5660300002)(52536014)(25786009)(86362001)(7736002)(2201001)(316002)(186003)(4326008)(74316002)(9686003)(55016002)(305945005)(68736007)(3846002)(2501003)(71200400001)(26005)(71190400001)(229853002)(7696005)(6116002)(476003)(6246003)(6506007)(11346002)(53546011)(76176011)(33656002)(102836004)(446003)(66446008)(66946007)(73956011)(64756008)(8936002)(66556008)(66066001)(2906002)(53936002)(66476007)(76116006)(14454004)(110136005)(478600001)(81166006)(81156014)(8676002)(486006)(6436002)(256004)(99286004)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR04MB6355;
 H:AM0PR04MB4865.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /ghvkeKd3ZzE2dkPYsH+MFMd387Vhb3i9H7RG9NASkjMXpWRDrkMhE8gFnXwEB9Nc8AUGXFfxuxnDVNx+vCo8J1NJE4tEOaH8L6losutuND0nr5ASIo/ChrFxGIsYsgq6L0YrA4kOB/23FmsyrTV9cYt6ICGHjmePey5PeDZKz0kv8o8k/sjmVrcXYIdylKiqmvd4RNCc3g46v5TJQk4IS3EN9zPHFoRwmXxxD80Lc1pVBezygHAmetIhiqoIKfz/NoRp8Jx7/yB151GkNC2U8lg5NBNv+QBseYSedea3forOXCKNxyjkPbUp2NIxn7rDXSBAZM49uug24OUHbYl5cuJOkPWxvjfX5qodzEU7J0R5xAIRe4pSQTFMGFlY9/XFBq7fcealb5lK9EPgRkUViQSR67oZKFp//NJswhk1/s=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d86601f-9a91-45b8-2fb4-08d6dab3991e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2019 10:37:01.7800 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6355
X-Mailman-Approved-At: Wed, 22 May 2019 14:35:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=11HkWuiUGch+CUaQ5R1xQdAei8VG1fBcLo+sQQbkakk=;
 b=Lpkm6TlWWLDd8S/fLMTAu4MNxG4xP+GxHWn7cTTdEaZJXUNdMWIDrLT1T7gNy9uqfvL/htYVjpqIzEf8hGIx66r0Ar3T1sueiO3O/29HAmm+eLyLB1gPIUekt6lpp1qBapdniSy1nxIZsU/6MRT6dUvkGb5xFutYYDpdp5VGMao=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=wen.he_1@nxp.com; 
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
Cc: Leo Li <leoyang.li@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUm9iaW4gTXVycGh5IFtt
YWlsdG86cm9iaW4ubXVycGh5QGFybS5jb21dDQo+IFNlbnQ6IDIwMTnlubQ15pyIMTbml6UgMTg6
NDUNCj4gVG86IFdlbiBIZSA8d2VuLmhlXzFAbnhwLmNvbT47IGRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmc7DQo+IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxpdml1LmR1ZGF1
QGFybS5jb20NCj4gQ2M6IExlbyBMaSA8bGVveWFuZy5saUBueHAuY29tPg0KPiBTdWJqZWN0OiBS
ZTogW0VYVF0gUmU6IFt2MV0gZHJtL2FybS9tYWxpLWRwOiBEaXNhYmxlIGNoZWNraW5nIGZvciBy
ZXF1aXJlZA0KPiBwaXhlbCBjbG9jayByYXRlDQo+IA0KPiANCj4gT24gMTYvMDUvMjAxOSAxMDo0
MiwgV2VuIEhlIHdyb3RlOg0KPiA+DQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCj4gPj4gRnJvbTogUm9iaW4gTXVycGh5IFttYWlsdG86cm9iaW4ubXVycGh5QGFybS5jb21d
DQo+ID4+IFNlbnQ6IDIwMTnlubQ15pyIMTbml6UgMToxNA0KPiA+PiBUbzogV2VuIEhlIDx3ZW4u
aGVfMUBueHAuY29tPjsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsNCj4gPj4gbGlu
dXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGl2aXUuZHVkYXVAYXJtLmNvbQ0KPiA+PiBDYzog
TGVvIExpIDxsZW95YW5nLmxpQG54cC5jb20+DQo+ID4+IFN1YmplY3Q6IFtFWFRdIFJlOiBbdjFd
IGRybS9hcm0vbWFsaS1kcDogRGlzYWJsZSBjaGVja2luZyBmb3INCj4gPj4gcmVxdWlyZWQgcGl4
ZWwgY2xvY2sgcmF0ZQ0KPiA+Pg0KPiA+PiBDYXV0aW9uOiBFWFQgRW1haWwNCj4gPj4NCj4gPj4g
T24gMTUvMDUvMjAxOSAwMzo0MiwgV2VuIEhlIHdyb3RlOg0KPiA+Pj4gRGlzYWJsZSBjaGVja2lu
ZyBmb3IgcmVxdWlyZWQgcGl4ZWwgY2xvY2sgcmF0ZSBpZiBBUkNIX0xBWUVSU0NQQUUgaXMNCj4g
Pj4+IGVuYWJsZS4NCj4gPj4+DQo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBBbGlzb24gV2FuZyA8YWxp
c29uLndhbmdAbnhwLmNvbT4NCj4gPj4+IFNpZ25lZC1vZmYtYnk6IFdlbiBIZSA8d2VuLmhlXzFA
bnhwLmNvbT4NCj4gPj4+IC0tLQ0KPiA+Pj4gY2hhbmdlIGluIGRlc2NyaXB0aW9uOg0KPiA+Pj4g
ICAgICAgIC0gVGhpcyBjaGVjayB0aGF0IG9ubHkgc3VwcG9ydGVkIG9uZSBwaXhlbCBjbG9jayBy
ZXF1aXJlZCBjbG9jaw0KPiByYXRlDQo+ID4+PiAgICAgICAgY29tcGFyZSB3aXRoIGR0cyBub2Rl
IHZhbHVlLiBidXQgd2UgaGF2ZSBzdXBwb3J0cyA0IHBpeGVsIGNsb2NrDQo+ID4+PiAgICAgICAg
Zm9yIGxzMTAyOGEgYm9hcmQuDQo+ID4+PiAgICBkcml2ZXJzL2dwdS9kcm0vYXJtL21hbGlkcF9j
cnRjLmMgfCAyICsrDQo+ID4+PiAgICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+
ID4+Pg0KPiA+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX2NydGMu
Yw0KPiA+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYXJtL21hbGlkcF9jcnRjLmMNCj4gPj4+IGluZGV4
IDU2YWFkMjg4NjY2ZS4uYmI3OTIyM2Q5OTgxIDEwMDY0NA0KPiA+Pj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FybS9tYWxpZHBfY3J0Yy5jDQo+ID4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJt
L21hbGlkcF9jcnRjLmMNCj4gPj4+IEBAIC0zNiwxMSArMzYsMTMgQEAgc3RhdGljIGVudW0gZHJt
X21vZGVfc3RhdHVzDQo+ID4+PiBtYWxpZHBfY3J0Y19tb2RlX3ZhbGlkKHN0cnVjdCBkcm1fY3J0
YyAqY3J0YywNCj4gPj4+DQo+ID4+PiAgICAgICAgaWYgKHJlcV9yYXRlKSB7DQo+ID4+PiAgICAg
ICAgICAgICAgICByYXRlID0gY2xrX3JvdW5kX3JhdGUoaHdkZXYtPnB4bGNsaywgcmVxX3JhdGUp
Ow0KPiA+Pj4gKyNpZm5kZWYgQ09ORklHX0FSQ0hfTEFZRVJTQ0FQRQ0KPiA+Pg0KPiA+PiBXaGF0
IGFib3V0IG11bHRpcGxhdGZvcm0gYnVpbGRzPyBUaGUga2VybmVsIGNvbmZpZyBkb2Vzbid0IHRl
bGwgeW91DQo+ID4+IHdoYXQgaGFyZHdhcmUgeW91J3JlIGFjdHVhbGx5IHJ1bm5pbmcgb24uDQo+
ID4+DQo+ID4NCj4gPiBIaSBSb2JpbiwNCj4gPg0KPiA+IFRoYW5rcyBmb3IgeW91ciByZXBseS4N
Cj4gPg0KPiA+IEluIGZhY3QsIE9ubHkgb25lIHBsYXRmb3JtIGludGVncmF0ZXMgdGhpcyBJUCB3
aGVuDQo+IENPTkZJR19BUkNIX0xBWUVSU0NBUEUgaXMgc2V0Lg0KPiA+IEFsdGhvdWdoIHRoaXMg
YXJlIG5vdCBnb29kIHdheXMsIGJ1dCBJIHRoaW5rIGl0IHdvbid0IGJlIGEgcHJvYmxlbSB1bmRl
cg0KPiBtdWx0aXBsYXRmb3JtIGJ1aWxkcy4NCj4gDQo+IE15IHBvaW50IGlzIHRoYXQgQVJDSF9M
QVlFUlNDQVBFIGlzIGdvaW5nIHRvIGJlIGVuYWJsZWQgaW4gZGlzdHJpYnV0aW9uDQo+IGtlcm5l
bHMgYWxvbmcgd2l0aCBldmVyeXRoaW5nIGVsc2UsIHNvIHlvdSdyZSBlZmZlY3RpdmVseSByZW1v
dmluZyB0aGlzIGNoZWNrIGZvcg0KPiBhbGwgb3RoZXIgdmVuZG9ycycgTWFsaS1EUCBpbXBsZW1l
bnRhdGlvbnMgYXMgd2VsbCwgd2hpY2ggaXMgcHJvYmFibHkgbm90IE9LLg0KPiANCj4gRnVydGhl
cm1vcmUsIGlmIExTMTAyOEEgcmVhbGx5IG9ubHkgc3VwcG9ydHMgNCBzcGVjaWZpYyBtb2RlcyBh
cyB0aGUgQlNQDQo+IGRvY3VtZW50YXRpb24gSSBmb3VuZCBjbGFpbXMsIHRoZW4gc3VyZWx5IHlv
dSdkIHdhbnQgYSAqbW9yZSogc3BlY2lmaWMgY2hlY2sNCj4gaGVyZSwgcmF0aGVyIHRoYW4gbm8g
Y2hlY2sgYXQgYWxsPw0KDQpIaSBSb2JpbiwNCg0KVGhhbmtzIGZvciB5b3VyIGNvbW1lbnRzLg0K
DQpZZXMsIEFzIHlvdSBzYWlkLCBub3cgTFMxMDI4QSBvbmx5IHN1cHBvcnRzIDQgbW9kZXMsIGFu
ZCB3ZSB1c2UgdGhyZWUgY2xvY2tzIHRvIHN1cHBvcnQNCmFsbCBmb3VyIG1vZGVzLiBJbiBmYWN0
LCB0aGlzIHdhcyByZWFsbHkgdGhlIHBvaW50Lg0KDQpIb3dldmVyLCB3ZSBjYW4gb25seSBlbmFi
bGUgb25lIG1vZGUgdG8gbWVldCB0aGUgY2hlY2sgc3RhdGVtZW50IGluIHRoaXMgcGxhY2UuDQoN
CkZvciBleGFtcGxlLCBJZiB1c2VyIGhhcyBhIDEwODBwIG1vbml0b3IsIHdlIG11c3QgYmUgc2V0
IHRoZSBwaXhlbCBmaXhlZC1jbG9jayB0byAxNDguNU1Iei4gDQppZiB1c2VyIHdhbnQgdG8gY2hv
aWNlIDRrIG1vbml0b3IsIHdlIGFsc28gdG8gYmUgY2hhbmdlIHRoZSBwaXhlbCBmaXhlZC1jbG9j
ayB0byA1OTRNSHogaW4NCkRUIG5vZGUuIEluIHJlYWxpdHksIFdlIGhhdmUgbm8gd2F5IG9mIGtu
b3dpbmcgd2hhdCBraW5kIG9mIG1vbml0b3IgdGhlIHVzZXIgd2FudHMuIFJpZ2h0Pw0KDQpNb3Jl
b3ZlciwgdXNlciBjYW5ub3QgdG8gY2hhbmdlIHNjcmVlbiByZXNvbHV0aW9uIGluIHRoaXMgY2Fz
ZSwgSSBkb24ndCB0aGluayB0aGlzIHBsYWNlIGlzDQpyZWFzb25hYmxlLiB3ZSBuZWVkIHRvIHN1
cHBvcnRpbmcgVWJ1bnR1ICwgV2F5bGFuZCBhbmQgb3RoZXIgZW1iZWRkZWQgR1UsIHNvIHdlIG5l
ZWQNCnRvIHN3aXRjaCB0aGUgcmVzb2x1dGlvbnMuDQoNCk1heWJlIGl0J3MgdGhhdCBtb3N0IGFu
ZHJvaWQgZGV2aWNlIHVzZWQsIGFuZCBhbmRyb2lkIHN5c3RlbSBhbHdheXMgb25seSBuZWVkIG9u
ZQ0KcmVzb2x1dGlvbi4NCg0KQmVzdCBSZWdhcmRzLA0KV2VuDQoNCj4gDQo+IFJvYmluLg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
