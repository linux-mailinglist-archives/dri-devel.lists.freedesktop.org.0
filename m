Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F03A211987F
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 22:43:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E926E9A9;
	Tue, 10 Dec 2019 21:43:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750077.outbound.protection.outlook.com [40.107.75.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 969316E9A9;
 Tue, 10 Dec 2019 21:43:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kFy1ZzXkKnzeAebDCwhnMB5Xc6BFtvsVX+FS5A8DqcsRqJmHB6O6bMGBWjMVm2TQvBFngIZzftvoo7+Rn7XouXYziDDjK2gvOGK3kDkbhT3/AHjDdCElYkM37NsUKRRLJcC+rmjhZCtqyUhDPEYFKkpmOE4/09+W1GPK434kD15w39ydnePmzRknL0K7xrfwnnZ3wUy7XBZt0SMRZ8T4+E/nMwtKjTb8pDFeHb1siGxo1STjqpn65ctLU55GNCimJ8yZ334v3chUe1TWdNiP+1R0H/S8vUN6H1uWKYKbKYhcgIQFA9Tr4XzoNmLJu8cuGTEuDtzyMLDpnB6v6eZ7kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iJMvpvdj+yb+f3uSZ0p7yEfb0tDiMytv+rKSPuR+M8s=;
 b=Ie3Shd+mR/uZZsqNGNihXWJH2df4mAv5th6FweXpYUcUb8KtVYAc7flaXNc0uae+gLoZ6/V3TbalDs3tEP5WXsohJKqb/OOl++Snd25gAE+Su2FV78lwzWW160YdOHFEHQp3XinfTy6n4zir4IbcWUrCFQwF5gUpPRELMzg87ixlbljL8JNES0dnmdBi2bHh4+oncu1zyQRjzAAvlrvE/dJDko8atWsyE6psO1YqK6Xp7gcU38xoqLyE1MAoFasAEisTY35UQT1aR7BkV4UTyDE7brtjRgQhRsYKouvQwOA1e1JApwPaHIxNpjZofKfVGNEcnzMeBcPf3ATHtax21w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iJMvpvdj+yb+f3uSZ0p7yEfb0tDiMytv+rKSPuR+M8s=;
 b=pWAyaJiGoC3/LKcgg84UGT0zlaagvA5G9q3gArZIKtXL/3JPwaC36GwhDzTGKSbrEknkYUnAJ0URRbPUJ8GSNuP+6CRaOf15XqxeYXgYJyM1BV75WkyT4N+PEo3WwWnxNxr3H9s9w+FcSFioR9zWUFWu1hpIVh+cTEO6WGNb8Jw=
Received: from MWHPR12MB1358.namprd12.prod.outlook.com (10.169.203.148) by
 MWHPR12MB1470.namprd12.prod.outlook.com (10.172.55.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.12; Tue, 10 Dec 2019 21:43:15 +0000
Received: from MWHPR12MB1358.namprd12.prod.outlook.com
 ([fe80::b94d:fcd8:729d:a94f]) by MWHPR12MB1358.namprd12.prod.outlook.com
 ([fe80::b94d:fcd8:729d:a94f%3]) with mapi id 15.20.2538.012; Tue, 10 Dec 2019
 21:43:15 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>, "Liu, Zhan"
 <Zhan.Liu@amd.com>, Arnd Bergmann <arnd@arndb.de>, "Wentland, Harry"
 <Harry.Wentland@amd.com>, "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>, "Koenig, 
 Christian" <Christian.Koenig@amd.com>, "Zhou, David(ChunMing)"
 <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>
Subject: RE: [PATCH] drm/amd/display: fix undefined struct member reference
Thread-Topic: [PATCH] drm/amd/display: fix undefined struct member reference
Thread-Index: AQHVr5jCwCOlldZflUqevJbaWeRz7aez2MYAgAAAdwCAAAzwAA==
Date: Tue, 10 Dec 2019 21:43:15 +0000
Message-ID: <MWHPR12MB1358DD7C4ED64FD1D27C899BF75B0@MWHPR12MB1358.namprd12.prod.outlook.com>
References: <20191210203101.2663341-1-arnd@arndb.de>
 <DM6PR12MB34665D3A13E23D8AA7E2E7919E5B0@DM6PR12MB3466.namprd12.prod.outlook.com>
 <b552de20-dca5-b5d1-e5e8-4c09bc3fdcb5@amd.com>
In-Reply-To: <b552de20-dca5-b5d1-e5e8-4c09bc3fdcb5@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Alexander.Deucher@amd.com; 
x-originating-ip: [165.204.11.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f53f9431-a8fb-4c16-3390-08d77db9f696
x-ms-traffictypediagnostic: MWHPR12MB1470:|MWHPR12MB1470:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB1470AB632FFDDC468172FEFEF75B0@MWHPR12MB1470.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 02475B2A01
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(136003)(346002)(366004)(396003)(199004)(189003)(13464003)(9686003)(55016002)(81156014)(8676002)(478600001)(33656002)(316002)(8936002)(5660300002)(71200400001)(7696005)(26005)(81166006)(966005)(4326008)(54906003)(53546011)(110136005)(6506007)(86362001)(2906002)(4001150100001)(76116006)(66446008)(66946007)(64756008)(66476007)(66556008)(186003)(52536014)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1470;
 H:MWHPR12MB1358.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:3; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: L2P5t1/UamCjusL/h1TWNPD39hAh8Qa2HrhjpVb1NE0mUUUH5dUdHEDjvOurvA3wtwad0yGstDVMLmocg4wWmlwTbTIdnwozYS+Smcozjgp8XSeUf2eU9s4KusekIv0yoOrfiNUnSvGT7dum3XHL8T7/rXsOCGPLCdqNmapBHNvxUXOqQoiH+3wn73z6RoNI1JYcjD/VGLO2r5vAJ2KXRe2TEViroAv7C5+JuEyVYtb+ikhOwJ9oLxIyO66AJH7z4aL9VLviO+h/j5uiPqlFm1hXb9KLHYmdDuT4KAKYgdBf+CCDMBbZV+SPY72sf+QxHGsnPRktd06O7Q5I3qTffSmcCGWQuTNzHjULCeqLnbQ5Q34TE5RQRwKtuXPahsKiHnSsyga9MIXHiqE4xxNJM+TsX5aaeMUcOr1dLA7f4LkHuP62TdjvOEMsjsfEJmLupCpvuh/bOu6747nMFqy4jXpEwzxGhuIsz5ecCdo8v9V331HYpLbPa9sui6Fx8kymT2ceLj3y65ITEBledsUZEw2RpKT9/HPPnUUi27uQT9NDB4YErC5zAsYsXYLJenu/
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f53f9431-a8fb-4c16-3390-08d77db9f696
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2019 21:43:15.4105 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C3g9SPH1fAwbwHKHUlN4gdSn/vbg0idSZ3feQkhmlMHsbNEBM3EWd/VUtcIx93/+LZOA+45I6mLErNvk0S3B2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1470
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
Cc: "Liu, Charlene" <Charlene.Liu@amd.com>, "Yang, Eric" <Eric.Yang2@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Cornij, 
 Nikola" <Nikola.Cornij@amd.com>, "Laktyushkin,
 Dmytro" <Dmytro.Laktyushkin@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Lei,
 Jun" <Jun.Lei@amd.com>, "Lakha, Bhawanpreet" <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLYXpsYXVza2FzLCBOaWNob2xh
cyA8TmljaG9sYXMuS2F6bGF1c2thc0BhbWQuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBEZWNlbWJl
ciAxMCwgMjAxOSAzOjU2IFBNDQo+IFRvOiBMaXUsIFpoYW4gPFpoYW4uTGl1QGFtZC5jb20+OyBB
cm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPjsNCj4gV2VudGxhbmQsIEhhcnJ5IDxIYXJyeS5X
ZW50bGFuZEBhbWQuY29tPjsgTGksIFN1biBwZW5nIChMZW8pDQo+IDxTdW5wZW5nLkxpQGFtZC5j
b20+OyBEZXVjaGVyLCBBbGV4YW5kZXINCj4gPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+OyBL
b2VuaWcsIENocmlzdGlhbg0KPiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPjsgWmhvdSwgRGF2
aWQoQ2h1bk1pbmcpDQo+IDxEYXZpZDEuWmhvdUBhbWQuY29tPjsgRGF2aWQgQWlybGllIDxhaXJs
aWVkQGxpbnV4LmllPjsgRGFuaWVsIFZldHRlcg0KPiA8ZGFuaWVsQGZmd2xsLmNoPg0KPiBDYzog
TGl1LCBDaGFybGVuZSA8Q2hhcmxlbmUuTGl1QGFtZC5jb20+OyBZYW5nLCBFcmljDQo+IDxFcmlj
LllhbmcyQGFtZC5jb20+OyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBhbWQtDQo+IGdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IENvcm5paiwgTmlrb2xhIDxOaWtvbGEuQ29ybmlqQGFt
ZC5jb20+Ow0KPiBMYWt0eXVzaGtpbiwgRG15dHJvIDxEbXl0cm8uTGFrdHl1c2hraW5AYW1kLmNv
bT47IGRyaS0NCj4gZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBMZWksIEp1biA8SnVuLkxl
aUBhbWQuY29tPjsgTGFraGEsDQo+IEJoYXdhbnByZWV0IDxCaGF3YW5wcmVldC5MYWtoYUBhbWQu
Y29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0vYW1kL2Rpc3BsYXk6IGZpeCB1bmRlZmlu
ZWQgc3RydWN0IG1lbWJlcg0KPiByZWZlcmVuY2UNCj4gDQo+IE9uIDIwMTktMTItMTAgMzo1NCBw
Lm0uLCBMaXUsIFpoYW4gd3JvdGU6DQo+ID4NCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiA+PiBGcm9tOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPg0KPiA+PiBT
ZW50OiAyMDE5L0RlY2VtYmVyLzEwLCBUdWVzZGF5IDM6MzEgUE0NCj4gPj4gVG86IFdlbnRsYW5k
LCBIYXJyeSA8SGFycnkuV2VudGxhbmRAYW1kLmNvbT47IExpLCBTdW4gcGVuZyAoTGVvKQ0KPiA+
PiA8U3VucGVuZy5MaUBhbWQuY29tPjsgRGV1Y2hlciwgQWxleGFuZGVyDQo+IDxBbGV4YW5kZXIu
RGV1Y2hlckBhbWQuY29tPjsNCj4gPj4gS29lbmlnLCBDaHJpc3RpYW4gPENocmlzdGlhbi5Lb2Vu
aWdAYW1kLmNvbT47IFpob3UsIERhdmlkKENodW5NaW5nKQ0KPiA+PiA8RGF2aWQxLlpob3VAYW1k
LmNvbT47IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT47IERhbmllbCBWZXR0ZXINCj4g
Pj4gPGRhbmllbEBmZndsbC5jaD47IExpdSwgWmhhbiA8Wmhhbi5MaXVAYW1kLmNvbT4NCj4gPj4g
Q2M6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+OyBMYWt0eXVzaGtpbiwgRG15dHJvDQo+
ID4+IDxEbXl0cm8uTGFrdHl1c2hraW5AYW1kLmNvbT47IExha2hhLCBCaGF3YW5wcmVldA0KPiA+
PiA8Qmhhd2FucHJlZXQuTGFraGFAYW1kLmNvbT47IExlaSwgSnVuIDxKdW4uTGVpQGFtZC5jb20+
OyBMaXUsDQo+ID4+IENoYXJsZW5lIDxDaGFybGVuZS5MaXVAYW1kLmNvbT47IFlhbmcsIEVyaWMg
PEVyaWMuWWFuZzJAYW1kLmNvbT47DQo+ID4+IENvcm5paiwgTmlrb2xhIDxOaWtvbGEuQ29ybmlq
QGFtZC5jb20+Ow0KPiA+PiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsNCj4gPj4gbGludXgta2VybmVsQHZnZXIua2VybmVsLm9y
Zw0KPiA+PiBTdWJqZWN0OiBbUEFUQ0hdIGRybS9hbWQvZGlzcGxheTogZml4IHVuZGVmaW5lZCBz
dHJ1Y3QgbWVtYmVyDQo+ID4+IHJlZmVyZW5jZQ0KPiA+Pg0KPiA+PiBBbiBpbml0aWFsaXphdGlv
biB3YXMgYWRkZWQgZm9yIHR3byBvcHRpb25hbCBzdHJ1Y3QgbWVtYmVycy4gIE9uZSBvZg0KPiA+
PiB0aGVzZSBpcyBhbHdheXMgcHJlc2VudCBpbiB0aGUgZGNuMjBfcmVzb3VyY2UgZmlsZSwgYnV0
IHRoZSBvdGhlciBvbmUNCj4gPj4gZGVwZW5kcyBvbiBDT05GSUdfRFJNX0FNRF9EQ19EU0NfU1VQ
UE9SVCBhbmQgY2F1c2VzIGEgYnVpbGQNCj4gZmFpbHVyZQ0KPiA+PiBpZiB0aGF0IGlzDQo+ID4+
IG1pc3Npbmc6DQo+ID4+DQo+ID4+DQo+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rp
c3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYzo5MjY6MQ0KPiA+PiA0OiBlcnJvcjogZXhj
ZXNzIGVsZW1lbnRzIGluIHN0cnVjdCBpbml0aWFsaXplciBbLVdlcnJvcl0NCj4gPj4gICAgIC5u
dW1fZHNjID0gNSwNCj4gPj4NCj4gPj4gQWRkIGFub3RoZXIgI2lmZGVmIGFyb3VuZCB0aGUgYXNz
aWdubWVudC4NCj4gPj4NCj4gPj4gRml4ZXM6IGMzZDAzYzVhMTk2ZiAoImRybS9hbWQvZGlzcGxh
eTogSW5jbHVkZSBudW1fdm1pZCBhbmQgbnVtX2RzYw0KPiA+PiB3aXRoaW4gTlYxNCdzIHJlc291
cmNlIGNhcHMiKQ0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRi
LmRlPg0KPiA+DQo+ID4gVGhhbmsgeW91IGZvciBjYXRjaGluZyB0aGF0IPCfmIogT24gbXkgc2lk
ZSBJIGtlcHQgdGhhdCBmbGFnIGVuYWJsZWQgYWxsIHRoZQ0KPiB0aW1lLCBzbyBJIGRpZG4ndCBy
ZWFsaXplIHRoZXJlIHdhcyBhIHdhcm5pbmcgaGlkZGVuIGhlcmUuDQo+ID4NCj4gPiBSZXZpZXdl
ZC1ieTogWmhhbiBMaXUgPHpoYW4ubGl1QGFtZC5jb20+DQo+IA0KPiBXaGF0IHRyZWUgaXMgdGhp
cyByZXBvcnRlZCBvbj8NCj4gDQo+IFdlIGRyb3BwZWQgdGhpcyBmbGFnIHdoZW5ldmVyIGJ1aWxk
aW5nIERDTi4gU291bmRzIGxpa2Ugd2UncmUgbWlzc2luZyBhDQo+IHBhdGNoIGlmIHlvdSdyZSBn
ZXR0aW5nIHRoaXMuDQo+IA0KPiBTbyB0aGlzIGlzIGEgTkFLIGZyb20gbWUgZm9yIGdvaW5nIGlu
dG8gYW1kLXN0YWdpbmctZHJtLW5leHQgYXQgbGVhc3QuDQo+IA0KDQpUaG9zZSBwYXRjaGVzIGFy
ZSBub3QgdXBzdHJlYW0geWV0LiAgVGhleSBhcmUgcXVldWVkIGZvciA1LjYuICBTbyB3ZSBuZWVk
IHRoaXMgcGF0Y2ggZm9yIDUuNS4gIEknbGwgYXBwbHkgaXQuDQoNCkFsZXgNCg0KPiBOaWNob2xh
cyBLYXpsYXVza2FzDQo+IA0KPiA+DQo+ID4+IC0tLQ0KPiA+PiAgIGRyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jIHwgMiArKw0KPiA+PiAgIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4gPj4NCj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jDQo+ID4+IGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMNCj4g
Pj4gaW5kZXggZmFhYjg5ZDFlNjk0Li5mZGY5M2U2ZWRmNDMgMTAwNjQ0DQo+ID4+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jDQo+ID4+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJj
ZS5jDQo+ID4+IEBAIC05MjMsNyArOTIzLDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCByZXNvdXJj
ZV9jYXBzIHJlc19jYXBfbnYxNCA9IHsNCj4gPj4gICAJCS5udW1fZHdiID0gMSwNCj4gPj4gICAJ
CS5udW1fZGRjID0gNSwNCj4gPj4gICAJCS5udW1fdm1pZCA9IDE2LA0KPiA+PiArI2lmZGVmIENP
TkZJR19EUk1fQU1EX0RDX0RTQ19TVVBQT1JUDQo+ID4+ICAgCQkubnVtX2RzYyA9IDUsDQo+ID4+
ICsjZW5kaWYNCj4gPj4gICB9Ow0KPiA+Pg0KPiA+PiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZGNf
ZGVidWdfb3B0aW9ucyBkZWJ1Z19kZWZhdWx0c19kcnYgPSB7DQo+ID4+IC0tDQo+ID4+IDIuMjAu
MA0KPiA+DQo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18NCj4gPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0DQo+ID4gZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZw0KPiA+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsDQo+ID4NCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
