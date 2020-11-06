Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E6C2A8C04
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 02:19:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E4016E887;
	Fri,  6 Nov 2020 01:18:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310128.outbound.protection.outlook.com [40.107.131.128])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E50466E887
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 01:18:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E7RdYik8aarUUgyteOBqeL9rrjeu7ipTAUPyL/mhX5bv9CW/fkpvxmzsGX6ffK3TgUd/r5JiAt9P5TaqGa1J1nLw9PDGL5DYM+U9wtS4eJUpz2k3p+2LNjQp2y1UGz2qRuQFsISAkLKQ7ALCo2FmymLXCPOQaQhAsAgbe2+COGUedTj30fPlg1rsmh6Kxrgq6pblmIBMSfHtyaIFU7+xfHcMJnY5U0MWwxcUH7PjHwujA0LqBlAy17O50XC17DljDQ03nwwEH+He8ZDqLjSq1OUJ0NeXJvVzmDh2aFgLF25OJAzvnjQdA2vFRaRfIj8hPxvkHLlipIUQ2njxWwYM0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nnxEQfHl3LHqHEEkxxhuqMXI0VdyOKjoPHwvNGZV10A=;
 b=OZGQ7Pdn1uw1ewHzKjuHp+xyzV0JpeVXueujLFXy7JZzlug+GMkOktOGyurB8QXZyLjaucmrMXwgzFgNXlenLiLvCFJUJR9laQpcDy7+t8bH6QAwOmgRhFMc74vVIvqsspREiufnYK3EqylAOJ2Nsr3IwybeUzYkCP4JmTnw3cv/xsuZ7iJPuScBidl3UyLZSUjEzBaJ2PmC5sKwOeajXwFu7X+TEp5/l0gIV8HI6Bgxan7EG5HRKwqw0gwyY8X10zKUTliJyRtAMg3k2CKA0BZY/4Kyur/RyQ9O0eaXF64T148iw5WwPs1WRNeTCnsXDNVG0nX+Ag1U2W1ESwUCkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
Received: from HK2PR06MB3300.apcprd06.prod.outlook.com (2603:1096:202:34::18)
 by HK0PR06MB2850.apcprd06.prod.outlook.com (2603:1096:203:30::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.29; Fri, 6 Nov
 2020 01:18:50 +0000
Received: from HK2PR06MB3300.apcprd06.prod.outlook.com
 ([fe80::9cad:b9a:3e32:d1f1]) by HK2PR06MB3300.apcprd06.prod.outlook.com
 ([fe80::9cad:b9a:3e32:d1f1%5]) with mapi id 15.20.3499.032; Fri, 6 Nov 2020
 01:18:50 +0000
From: Kuo-Hsiang Chou <kuohsiang_chou@aspeedtech.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] drm/ast: Fixed 1920x1080 sync. polarity issue
Thread-Topic: [PATCH] drm/ast: Fixed 1920x1080 sync. polarity issue
Thread-Index: AQHWs1i6fwVI+JUlRUKdRVm+sK7sm6m5chAAgAADugCAANIc8A==
Date: Fri, 6 Nov 2020 01:18:50 +0000
Message-ID: <HK2PR06MB33004E7B3A5D248D82867F448CED0@HK2PR06MB3300.apcprd06.prod.outlook.com>
References: <20201105094729.106059-1-kuohsiang_chou@aspeedtech.com>
 <f9b658a6-8a4d-d512-de90-897af7a6d90d@suse.de>
 <f52c3f5c-5445-7b8c-7eaf-dca789f0fc9e@suse.de>
In-Reply-To: <f52c3f5c-5445-7b8c-7eaf-dca789f0fc9e@suse.de>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=aspeedtech.com;
x-originating-ip: [211.20.114.70]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 88f3e2dd-3217-4e73-deb7-08d881f1eb27
x-ms-traffictypediagnostic: HK0PR06MB2850:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK0PR06MB2850BE3A8774B6FD628CC9628CED0@HK0PR06MB2850.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: m2CUyXHzY5M4hoxZNyWcAc7ILh41nfAonNQy2IzTjsQWEPLeL59EXtTxfwjdKxsx0HbaIVRjpU2RIUPbS/GSCopuD5tfFIDYrDdZevqMYm3fXTJZNCzQ4MohsdMFvDqqDwisCURWTliYdd44j8UhElqM2ZqjspePTc76ocEvfVShK275Chg2XhS5JuxA5BOZb6mW6iA+yx1nzjO5f/VBIUNPO988NmotpxeBgnpPFvQ/14vP61ntmyN1XIlEhNdMRDSbU/HW/rf0pkhZJL+UrkDEPN43T6fp7TsUBRCgwPyAsjO4QlHvucsGwpXU5tPEwVdUoGpQVgkxQheARHUGVBU8M7eLdEpAfkS1OHvU4Xo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR06MB3300.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39830400003)(396003)(346002)(366004)(136003)(376002)(66446008)(71200400001)(316002)(55016002)(52536014)(186003)(66946007)(76116006)(66476007)(64756008)(83380400001)(66556008)(7696005)(86362001)(53546011)(966005)(9686003)(2906002)(8676002)(33656002)(5660300002)(6506007)(55236004)(110136005)(26005)(4326008)(478600001)(54906003)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: WYwnTF9diJtHAAkjQkxsHhCsQJScu0t+2+YWG+Ev949f+zI0ezfdDqvgIMu2Gac0VEPmTl7aaLS1b4+BfWi8lEJr+n9ryCrb69rjvxh5K7QSs9+Zk9RWsCZ8j+LxOs5ElmKscNAlMAy/4RjVoU+YJKDsSADKala2zKoxxcHnslDi5FXqnA972xZA0smoJ3YqRyhTf1hFnU8E/Ijku58zi5vxU4hJqqccEsmAxz41aIOwXqrZAD6hyqhSOLUStnhrYCKq42BW1+iv9G+mMPZaiw2Nf8NotAUw3TIjnlWMc0hdFgr3nsaU2E39sChWUXHpuLhf/HCpL+3oumfSNW57fXvGX1tfDcYoKRLYmxX7T95RbkIUU99PZvoAZ+yBEnQJGyzSjGILagm9/6z9D4gFVn4FhZnUXsUegoV5pvoZFylzFY4z/TAbTi5PuOHxtwVRflUTiUgJB2z2EFzPXJtHPvq6wggnGygSW3Coki7ICXlckdq6M84ybIuD7QsFBdCFn8V/o1avqeLh2Gpjdttfy1jNZ3h3H7IFohAKxwPCNDmXfcIjvoauUH+06mk46fF7ZXG9zKUgWwQKB0ZDe6of6As6Iolr7zRcTqxG71Cnwgt5d9D/bVs1jhN0SMQFzW9d6hvEd2nX4xAWQapUlHaGcA==
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK2PR06MB3300.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88f3e2dd-3217-4e73-deb7-08d881f1eb27
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2020 01:18:50.4535 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yhZxLuRyg/t2OhUGE7lYSsTRl0xDmlVCr38Ebp6AQ597af4D4L5RKHJts2vHywrUU/aHFJs4k/HxzcWkVaIlA56JMqTqlBpvcNh4gBraekg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2850
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
Cc: Jenmin Yuan <jenmin_yuan@aspeedtech.com>,
 "airlied@redhat.com" <airlied@redhat.com>,
 Tommy Huang <tommy_huang@aspeedtech.com>, Arc Sung <arc_sung@aspeedtech.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VG8gU2lyLA0KDQpJcyB0aGUgbWFpbC1hZGRyZXNzIG9mICJkYW5pZWwudmV0dGVyQGludGVsLmNv
bSIgY29ycmVjdCBmb3IgRGFuaWVsPyANCkJlY2F1c2UsIGdvdCB0aGUgbWVzc2FnZSBvZiAiIFRo
ZSBjdXJyZW50IGRpcmVjdG9yeSBkb2VzIG5vdCBhcHBlYXIgdG8gYmUgYSBsaW51eCBrZXJuZWwg
c291cmNlIHRyZWUuICIgYWZ0ZXIgcnVubmluZyBnZXRfbWFpbnRhaW5lcnMucGwNClNvLCBmaW5k
IERhbmllbCBvdXQgYnkgZ2l0ayAvZHJpdmVycy9ncHUvZHJtL2FzdA0KDQpIYXZlIGEgZ29vZCBk
YXksDQoJS3VvLUhzaWFuZyBDaG91DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9t
OiBUaG9tYXMgWmltbWVybWFubiBbbWFpbHRvOnR6aW1tZXJtYW5uQHN1c2UuZGVdIA0KU2VudDog
VGh1cnNkYXksIE5vdmVtYmVyIDA1LCAyMDIwIDg6MjIgUE0NClRvOiBLdW8tSHNpYW5nIENob3Ug
PGt1b2hzaWFuZ19jaG91QGFzcGVlZHRlY2guY29tPjsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZw0KQ2M6IEplbm1pbiBZdWFuIDxqZW5taW5feXVhbkBhc3BlZWR0ZWNoLmNvbT47IGVp
Y2hAc3VzZS5jb207IFRvbW15IEh1YW5nIDx0b21teV9odWFuZ0Bhc3BlZWR0ZWNoLmNvbT47IEFy
YyBTdW5nIDxhcmNfc3VuZ0Bhc3BlZWR0ZWNoLmNvbT47IGFpcmxpZWRAcmVkaGF0LmNvbQ0KU3Vi
amVjdDogUmU6IFtQQVRDSF0gZHJtL2FzdDogRml4ZWQgMTkyMHgxMDgwIHN5bmMuIHBvbGFyaXR5
IGlzc3VlDQoNCkhpDQoNCkFtIDA1LjExLjIwIHVtIDEzOjA4IHNjaHJpZWIgVGhvbWFzIFppbW1l
cm1hbm46DQo+IEhpLA0KPiANCj4gcGxlYXNlIGZvbGxvdyB0aGUgYWR2aXNlIHdlJ3JlIGdpdmlu
ZyB5b3UuIEhhZCB5b3UgcnVuIA0KPiBzY3JpcHRzL2NoZWNrcGF0Y2gucGwgb24gdGhlIHBhdGNo
IGZpbGUgaXQgd291bGQgaGF2ZSB0b2xkIHlvdQ0KPiANCj4gPDw8DQo+IEVSUk9SOiBwYXRjaCBz
ZWVtcyB0byBiZSBjb3JydXB0IChsaW5lIHdyYXBwZWQ/KQ0KPiAjMTAyOiBGSUxFOiBkcml2ZXJz
L2dwdS9kcm0vYXN0L2FzdF90YWJsZXMuaDoyOTQ6DQo+IA0KPiANCj4gRVJST1I6IERPUyBsaW5l
IGVuZGluZ3MNCj4gIzEwNjogRklMRTogZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfdGFibGVzLmg6
Mjk3Og0KPiArXkkgKFN5bmNQUCB8IENoYXJ4OERvdCB8IExpbmVDb21wYXJlT2ZmIHwgV2lkZVNj
cmVlbk1vZGUgfCANCj4gK05ld01vZGVJbmZvIHxeTSQNCj4gDQo+IEVSUk9SOiBET1MgbGluZSBl
bmRpbmdzDQo+ICMxMTA6IEZJTEU6IGRyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X3RhYmxlcy5oOjMw
MDoNCj4gK15JIChTeW5jUFAgfCBDaGFyeDhEb3QgfCBMaW5lQ29tcGFyZU9mZiB8IFdpZGVTY3Jl
ZW5Nb2RlIHwgDQo+ICtOZXdNb2RlSW5mbyB8Xk0kDQo+IA0KPiB0b3RhbDogMyBlcnJvcnMsIDAg
d2FybmluZ3MsIDE5IGxpbmVzIGNoZWNrZWQNCj4+Pj4NCj4gDQoNClRoaXMgbWlnaHQgbm90IGJl
IHlvdXIgZmF1bHQgYnV0IHRoZSByZXN1bHQgb2YgbXkgbWFpbCBjbGllbnQuDQoNCj4gQXMgc2Fp
ZCBiZWZvcmUsIHRoZSBtYWlsIGVpY2hAc3VzZS5kZSBpcyBzdGlsbCBub3QgcmVsZXZhbnQgYW55
IGxvbmdlci4NCj4gQnV0IHlvdSBkaWQgbm90IGFkZCBEYW5pZWwgaW50byBDQy4gRGlkIHlvdSBy
dW4gc2NyaXB0cy9nZXRfbWFpbnRhaW5lcnMucGw/DQoNClRoaXMgc3RpbGwgYXBwbGllcy4NCg0K
QmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gQmVzdCByZWdhcmRzDQo+IFRob21hcw0KPiAN
Cj4gQW0gMDUuMTEuMjAgdW0gMTA6NDcgc2NocmllYiBLdW9Ic2lhbmcgQ2hvdToNCj4+IFtCdWdd
IENoYW5nZSB0aGUgdmVydGljYWwgc3luY2hyb291cyBwb2xhcnkgb2YgMTkyMHgxMDgwIEA2MEh6
DQo+PiAgICAgICBmcm9tICBOZWd0aXZlIHRvIFBvc2l0aXZlDQo+Pg0KPj4gU2lnbmVkLW9mZi1i
eTogS3VvSHNpYW5nIENob3UgPGt1b2hzaWFuZ19jaG91QGFzcGVlZHRlY2guY29tPg0KPj4gLS0t
DQo+PiAgZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfdGFibGVzLmggfCA0ICsrLS0NCj4+ICAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF90YWJsZXMuaCANCj4+IGIvZHJpdmVycy9n
cHUvZHJtL2FzdC9hc3RfdGFibGVzLmgNCj4+IGluZGV4IDg0MTRlNTQzZjI2MC4uNTFlZmM1YjRh
NTVjIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfdGFibGVzLmgNCj4+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X3RhYmxlcy5oDQo+PiBAQCAtMjk1LDEwICsy
OTUsMTAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhc3RfdmJpb3NfZW5odGFibGUgDQo+PiByZXNf
MTYwMHg5MDBbXSA9IHsNCj4+DQo+PiAgc3RhdGljIGNvbnN0IHN0cnVjdCBhc3RfdmJpb3NfZW5o
dGFibGUgcmVzXzE5MjB4MTA4MFtdID0gew0KPj4gIAl7MjIwMCwgMTkyMCwgODgsIDQ0LCAxMTI1
LCAxMDgwLCA0LCA1LCBWQ0xLMTQ4XzUsCS8qIDYwSHogKi8NCj4+IC0JIChTeW5jTlAgfCBDaGFy
eDhEb3QgfCBMaW5lQ29tcGFyZU9mZiB8IFdpZGVTY3JlZW5Nb2RlIHwgTmV3TW9kZUluZm8gfA0K
Pj4gKwkgKFN5bmNQUCB8IENoYXJ4OERvdCB8IExpbmVDb21wYXJlT2ZmIHwgV2lkZVNjcmVlbk1v
ZGUgfCANCj4+ICtOZXdNb2RlSW5mbyB8DQo+PiAgCSAgQVNUMjUwMFByZUNhdGNoQ1JUKSwgNjAs
IDEsIDB4MzggfSwNCj4+ICAJezIyMDAsIDE5MjAsIDg4LCA0NCwgMTEyNSwgMTA4MCwgNCwgNSwg
VkNMSzE0OF81LAkvKiA2MEh6ICovDQo+PiAtCSAoU3luY05QIHwgQ2hhcng4RG90IHwgTGluZUNv
bXBhcmVPZmYgfCBXaWRlU2NyZWVuTW9kZSB8IE5ld01vZGVJbmZvIHwNCj4+ICsJIChTeW5jUFAg
fCBDaGFyeDhEb3QgfCBMaW5lQ29tcGFyZU9mZiB8IFdpZGVTY3JlZW5Nb2RlIHwgDQo+PiArTmV3
TW9kZUluZm8gfA0KPj4gIAkgIEFTVDI1MDBQcmVDYXRjaENSVCksIDB4RkYsIDEsIDB4MzggfSwg
IH07DQo+Pg0KPj4gLS0NCj4+IDIuMTguNA0KPj4NCj4+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fDQo+PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0DQo+PiBk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+PiBodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA0KPj4NCj4gDQo+IA0KPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBkcmktZGV2ZWwgbWFp
bGluZyBsaXN0DQo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwNCj4gDQoNCi0t
DQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0
d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJl
cmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVy
OiBGZWxpeCBJbWVuZMO2cmZmZXINCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
