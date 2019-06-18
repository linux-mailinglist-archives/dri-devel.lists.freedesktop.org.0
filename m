Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5294F4986A
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 06:41:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B04E6E0D7;
	Tue, 18 Jun 2019 04:41:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80040.outbound.protection.outlook.com [40.107.8.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 379996E0D5;
 Tue, 18 Jun 2019 04:41:41 +0000 (UTC)
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5261.eurprd08.prod.outlook.com (20.179.31.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Tue, 18 Jun 2019 04:41:39 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358%7]) with mapi id 15.20.1987.014; Tue, 18 Jun 2019
 04:41:39 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 07/59] drm/arm/komeda: Remove DRIVER_HAVE_IRQ
Thread-Topic: [PATCH 07/59] drm/arm/komeda: Remove DRIVER_HAVE_IRQ
Thread-Index: AQHVJNWMDOvXPj85WEO9gWrcTOKR7A==
Date: Tue, 18 Jun 2019 04:41:38 +0000
Message-ID: <20190618044132.GA2660@james-ThinkStation-P300>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-8-daniel.vetter@ffwll.ch>
 <20190617062602.GA23827@james-ThinkStation-P300>
 <20190617134345.GA12905@phenom.ffwll.local>
In-Reply-To: <20190617134345.GA12905@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.9.4 (2018-02-28)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0P153CA0017.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:18::29) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4a979217-49d1-4f51-b199-08d6f3a74084
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB5261; 
x-ms-traffictypediagnostic: VE1PR08MB5261:
x-ms-exchange-purlcount: 3
nodisclaimer: True
x-microsoft-antispam-prvs: <VE1PR08MB52614572C29AE76417361055B3EA0@VE1PR08MB5261.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 007271867D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(7916004)(39860400002)(376002)(366004)(346002)(396003)(136003)(189003)(199004)(316002)(6116002)(305945005)(6246003)(1076003)(6486002)(256004)(14444005)(5660300002)(26005)(3846002)(4326008)(66476007)(66446008)(66556008)(66066001)(64756008)(66946007)(73956011)(6916009)(186003)(53386004)(33656002)(68736007)(25786009)(52116002)(14454004)(386003)(587094005)(71200400001)(6506007)(71190400001)(8676002)(966005)(478600001)(86362001)(102836004)(6436002)(486006)(446003)(11346002)(81156014)(54906003)(58126008)(55236004)(7736002)(476003)(2906002)(229853002)(9686003)(6306002)(53936002)(81166006)(6512007)(8936002)(76176011)(33716001)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5261;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /fSWcCMFgXKwAcni7FHAT9NsXvbfKOBk9CXOQOuLe86xzigH3/M+krUlOUOtWuMm4GW8vd9K5PSkZO8AWeyXX8WWA8VPsLCCfB2AGkEbYlvQSxULClN4wMQyxNrx//bsRltgPIu8VJi7a45oY9n6yldn2rsO9VOGrOHx1YHJWfEW37Qv6WAHX08nq61uq0kId8oyFYIjKPJLdAIfti811f2RveM9C4eet9XPf67OeawvqdRl+jnydqYJhHh9oIycKiKPmhCWKWxy32Pv2+B3r+cRhYUE+XENyMzkgFPbUXncjAx7gdGJCMWl8VKPirAybA3+dsUl7LpqIg3zEzIvKNIhDoxhJB7BZmmEp9HxCOEX8cAK+35ayHJKFWXzpvmZg0zEXAOsw8oTns9wmnTINfj5aYGdpOFL9JlmsUq83n0=
Content-ID: <1CEE5875031A5F4CAF9E7855310369BF@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a979217-49d1-4f51-b199-08d6f3a74084
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2019 04:41:38.9588 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: james.qian.wang@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5261
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vUq/OCH3KBa/2h2M6QI//TbBohHekVFtHYWhX6q2Zqk=;
 b=woAbGqtKpm1//Jyc8dxwlV5ZsT9JlYozYXIZPNNmDutCgu+zdWZgJk9urhxdpjKIZeIva0IU4Y16SfAtTplSss3MAjfPZz2KajWGXqxqzC2dCH6X0DYLgQKB+9vis0zMWtHeJVuYsrV5KTIduti3/94+jeKDDw2nPmatw961RG0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
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
Cc: nd <nd@arm.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Ayan Halder <Ayan.Halder@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgMDM6NDM6NDVQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBNb24sIEp1biAxNywgMjAxOSBhdCAwNjoyNjowOEFNICswMDAwLCBqYW1lcyBx
aWFuIHdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSB3cm90ZToKPiA+IE9uIEZyaSwgSnVuIDE0
LCAyMDE5IGF0IDEwOjM1OjIzUE0gKzAyMDAsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gPiA+IFJl
YWQgdGhlIGRvY3MsIGtvbWVkYSBpcyBub3QgYW4gb2xkIGVub3VnaCBkcml2ZXIgZm9yIHRoaXMg
Oi0pCj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0
dGVyQGludGVsLmNvbT4KPiA+ID4gQ2M6ICJKYW1lcyAoUWlhbikgV2FuZyIgPGphbWVzLnFpYW4u
d2FuZ0Bhcm0uY29tPgo+ID4gPiBDYzogTGl2aXUgRHVkYXUgPGxpdml1LmR1ZGF1QGFybS5jb20+
Cj4gPiA+IC0tLQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21l
ZGFfa21zLmMgfCAzICstLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAy
IGRlbGV0aW9ucygtKQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
cm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9rb21lZGFfa21zLmMKPiA+ID4gaW5kZXggMGM2Mzk2ZGMzMjNmLi5iOWQ2OTlj
YzdiYmYgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEva29tZWRhX2ttcy5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9r
b21lZGEva29tZWRhX2ttcy5jCj4gPiA+IEBAIC01NSw4ICs1NSw3IEBAIHN0YXRpYyBpcnFyZXR1
cm5fdCBrb21lZGFfa21zX2lycV9oYW5kbGVyKGludCBpcnEsIHZvaWQgKmRhdGEpCj4gPiA+ICB9
Cj4gPiA+ICAKPiA+ID4gIHN0YXRpYyBzdHJ1Y3QgZHJtX2RyaXZlciBrb21lZGFfa21zX2RyaXZl
ciA9IHsKPiA+ID4gLQkuZHJpdmVyX2ZlYXR1cmVzID0gRFJJVkVSX0dFTSB8IERSSVZFUl9NT0RF
U0VUIHwgRFJJVkVSX0FUT01JQyB8Cj4gPiA+IC0JCQkgICBEUklWRVJfSEFWRV9JUlEsCj4gPiA+
ICsJLmRyaXZlcl9mZWF0dXJlcyA9IERSSVZFUl9HRU0gfCBEUklWRVJfTU9ERVNFVCB8IERSSVZF
Ul9BVE9NSUMsCj4gPiA+ICAJLmxhc3RjbG9zZQkJCT0gZHJtX2ZiX2hlbHBlcl9sYXN0Y2xvc2Us
Cj4gPiA+ICAJLmlycV9oYW5kbGVyCQkJPSBrb21lZGFfa21zX2lycV9oYW5kbGVyLAoKU2luY2Ug
b25jZSBrb21lZGEgaGFkIGRyb3BwZWQgZHJtX2lycV9pbnN0YWxsLCB3ZSBkb24ndCBuZWVkIHRv
IGV4cG9zZQp0aGlzIGlycV9oYW5kbGVyIHRvIGRybSBhcyB3ZWxsLCBTbyBJIHdhbnQgaXJxX2hh
bmRsZXIgYW5kIERSSVZFUl9IQVZFX0lSUQp0byBiZSByZW1vdmVkIHRvZ2V0aGVyIHdpdGggdGhl
IGRyb3AgcGF0Y2guCgpJIHRoaW5rIGJldHRlciBwdXQgdGhlIHJlcGxhY2VtZW50IGluIG9uZSBw
YXRjaC4KClRoYW5rcwpKYW1lcwo+ID4gCj4gPiBIaSBEYW5pZWw6Cj4gPiAKPiA+IFRoYW5rIHlv
dSBmb3IgdGhlIHBhdGNoLgo+ID4gCj4gPiBBbmQgQXlhbiBhbHNvIHNlbnQgdHdvIHBhdGNoZXMg
Zm9yIHRoaXMgdG9waWMuIGxpa2U6Cj4gPiAKPiA+IEZvciBkcm9wIGRybV9pcnFfaW5zdGFsbDoK
PiA+IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvNjE3NjMvCj4gPiBG
b3IgbWFudWFsbHkgc2V0IGRybS0+aXJxX2VuYWJsZWQ6Cj4gPiBodHRwczovL3BhdGNod29yay5m
cmVlZGVza3RvcC5vcmcvc2VyaWVzLzYxNzc2Lwo+ID4gCj4gPiBGb3IgY2xlYXIsIHNlZW1zIHdl
J2QgYmV0dGVyIHNxdWFzaCBhbGwgdGhlc2UgdGhyZWUgcGF0Y2hlcyBpbnRvIG9uZQo+ID4gc2lu
Z2xlIHBhdGNoLgo+IAo+IE5vdCBzdXJlIGhvdyB0aGVzZSBvdGhlciBwYXRjaGVzIGFyZSByZWxh
dGVkIHRvIG1pbmUgZGlyZWN0bHkuIFRoaXMgaGVyZQo+IGp1c3QgcmVtb3ZlcyBhIGZsYWcgd2hp
Y2ggZG9lcyBub3RoaW5nLCBiZWNhdXNlIGtvbWVkYSBpcyBub3QgYSBsZWdhY3kKPiBkcml2ZXIu
IEFuZCBhY2sgZm9yIG1lcmdpbmcgcmlnaHQgYXdheSB3b3VsZCBiZSBuaWNlLgo+IAo+IFRoYW5r
cywgRGFuaWVsCj4gCj4gPiAKPiA+IEhpIEF5YW46Cj4gPiBDb3VsZCB5b3UgaGVscCB0aGUgc3F1
YXNoIGFsbCB0aGVzZSBwYXRjaGVzIHRvIGEgc2luZ2xlIG9uZS4KPiA+IAo+ID4gVGhhbmtzCj4g
PiBKYW1lcwo+ID4gCj4gPiA+ICAJLmdlbV9mcmVlX29iamVjdF91bmxvY2tlZAk9IGRybV9nZW1f
Y21hX2ZyZWVfb2JqZWN0LAo+ID4gPiAtLSAKPiA+ID4gMi4yMC4xCj4gCj4gLS0gCj4gRGFuaWVs
IFZldHRlcgo+IFNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgo+IGh0dHA6Ly9i
bG9nLmZmd2xsLmNoCgotLSAKUmV2aWV3ZWQtYnk6IEphbWVzIFFpYW4gV2FuZyAoQXJtIFRlY2hu
b2xvZ3kgQ2hpbmEpIDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
