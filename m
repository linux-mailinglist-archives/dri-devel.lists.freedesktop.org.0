Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3756343454
	for <lists+dri-devel@lfdr.de>; Sun, 21 Mar 2021 20:18:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 737C9899F2;
	Sun, 21 Mar 2021 19:18:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690048.outbound.protection.outlook.com [40.107.69.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEEA8899F2
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Mar 2021 19:18:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dfDOytTY4kW73ZMqqDEX9TVC/iAbnrgySEE8Kr64ulcZxkvw+yz82cNDqFvg/Nlj5G0CIe38hC20dYWD8fimtIJZfhIDUljSUPEPlYLYP/ZAV6mgIUOW+C4VJYoT4uCn1EnoNynjVhHoRAeGHYWk24+55d8mKB+KJ8l+6XrTJKwSzcRpFepYvk1yWxJIfZEVL+aah8E35i8saxXmAwR/h+/zmivHVeNnwP206HIRDyafUl8Egzh5jv5wtrc+2ZHfEmx7PAKBBRHGs7tsJ+GCc6nZkVGHDVQZNlLMR+NFIMmzANlNw8RfvF3sNpThbgosKJGQQx7c7jEuxA0O5IYptw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rod73U7hbiGGgWL/GMn19JAfQKWpV9MLv/6xBNqBebU=;
 b=LdqyZ8X5KgP93Hi7ImPtllzWW1mETKWFz+qP7Hd57mECrVdLFOnT0+M0MILc54QS3XrHqv1k3CNMImeQvr+6BMJ3e3ObeznF5bwwpSYGH/9h/FPynmKyKXh904uDL9XvSZd+x9PGSoZQGiwClSrGapDpgPNSnCl5oh8dZ6zB9fQZiIJ6lDbui7OdbZ5O9eK0Hhz9rayYT+95UoVtC8UPCIq+JqIPc1b1W7Z9VoWw8vrvXuPsLksnHoTDtWt4Vw1bX3MB7k288yV1jP2y3aLU5wmCUPClkwVq1gE/5Po7vYunA4B61VT86Nh5Zxj5rOVkzwasSsn0IJcjnYVDBoOVXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rod73U7hbiGGgWL/GMn19JAfQKWpV9MLv/6xBNqBebU=;
 b=HQN644NfUG9uuK1Qp/0GF/zvUfKrQqiSpBfmnRq7MCFbPBG/pa33Gb0r9E6NKBl576MiQjPgt9kd00SYKnjVvmkchuUtdL0m12sxU9KY3Ug/LSzvoqpy7npfHUEunh1T4zCmmJJjZZkH+CyuUUu+YAFv4xxuAVGCSJN23VlVmbg=
Received: from MN2PR05MB6624.namprd05.prod.outlook.com (2603:10b6:208:d8::18)
 by MN2PR05MB6125.namprd05.prod.outlook.com (2603:10b6:208:ca::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.14; Sun, 21 Mar
 2021 19:18:43 +0000
Received: from MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::88de:ad34:82d7:a02e]) by MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::88de:ad34:82d7:a02e%6]) with mapi id 15.20.3977.019; Sun, 21 Mar 2021
 19:18:43 +0000
From: Zack Rusin <zackr@vmware.com>
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Fix a typo
Thread-Topic: [PATCH] drm/vmwgfx: Fix a typo
Thread-Index: AQHXHc6aKvpKo5U1SUi9TNgOCfJ2hqqO0mGA
Date: Sun, 21 Mar 2021 19:18:43 +0000
Message-ID: <25C02B0A-C921-4E80-A0EE-9D81BF214B93@vmware.com>
References: <20210320211617.30746-1-unixbhaskar@gmail.com>
In-Reply-To: <20210320211617.30746-1-unixbhaskar@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.40.0.2.32)
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=vmware.com;
x-originating-ip: [71.175.59.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 68e6a770-ce74-42ef-9fb3-08d8ec9e246d
x-ms-traffictypediagnostic: MN2PR05MB6125:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR05MB6125A6A74837FCEFD631DDA1CE669@MN2PR05MB6125.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: v56YtkW17quMpM7HoZvz0diuS7EZCqcf+Mh12ZcY34xLC1kKSJg4IrIn/PdgNcbjB93oKyct3wzoXeJR6fSKMSw6pPQJQYtHP14OYSD5qyCzMtE39ytiWeMJ5OnkCzT/aMjiC9IpXgZ+eGe35n7OBWvZhp9fp2VlMnDWK9NiYPg7IGsUr+v/PYwVGcH7x7/RQXwI3W4ZoGYhZrFV/2Lx/VHp+lTgAUAA01I6iowoeXTBU2GtwwP1eKk4iOpM4/N99vVg2WonuoVUc5leGvaWj5DQhpH+3p600WyGATuYDLmfOHxfTKhkHNHTsxmiOi2piuFB3O4JSzTicgiMn2OrA/0ziuh0WUnCOtK8qToiyUCks2uTUc7Gf+EuEesfcmsDJBuMQ09JTULViPAcdz23ZkD0m9CrDDcRaIrLuagHarTBLpcYMdhll+D5bg1Y/TbHqTEIXPuyWfOZRuTZf8Z4//vs4GN2/XlGcRPY8gUsITEpggNRSUsnIMwGe8Xbo0yHMnafkLnT1tPul9m+DGFgdiDYt+ucC65WDXAPs0PZxPGwUprkg/gYM81SZ1AgV2ZvlTUChwbDwKxzRjOAr26btBNuFtM5OoE1lAethQMwQJI0Ly/7KzFnT+z2PbJvyAqcGPx+wUZZySRtE8jPt814DhQrIQ/fEjMHeTkjpk9Qurmuo6vKTE6R6fa9bDUOjnvG
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR05MB6624.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(136003)(346002)(376002)(396003)(6486002)(83380400001)(4326008)(6916009)(38100700001)(5660300002)(76116006)(66446008)(2616005)(66946007)(66476007)(8676002)(66556008)(64756008)(186003)(316002)(2906002)(53546011)(54906003)(36756003)(26005)(86362001)(6506007)(33656002)(8936002)(478600001)(6512007)(71200400001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?MlhXZTNEazB5WnBMVy8zZEhObFBQbU4vaS9iM1BNSWVkZFEyMDZjYm1aaW9q?=
 =?utf-8?B?Vmx0ajRyVFpiemhoOVN3aHZkbzZ2b0ovZTFxZGZtV1B1UkxCbFBPQllkZWJr?=
 =?utf-8?B?UFJsVmFieHM2N3ovZVF3QkpiMWJFYTdHR0diSTRyTGlmbXdDK1F1Y1l3NmV5?=
 =?utf-8?B?Nk5CYjh5WDFxWW9jYVdEbG9sdnY2NUpzTG5VK0VFR3ZkUVBMR1RoOHlBblF6?=
 =?utf-8?B?blhMa3NoL2FhZ1Z3emp0Y0dkYXozRlMwWUszM1g2SzQrZVhwOWFrK3krZ1Bz?=
 =?utf-8?B?UWdhd253SWIyLzduTnRkNHVKcWIzdlZNTGczK0FZeUN3RFFWLzZibDVYeGU4?=
 =?utf-8?B?QXVLT0tRK1k5UVo4SElUa1JLZGZ0VktDRWhGNE5NWjNKNVhKMThzejRzenJM?=
 =?utf-8?B?bktuaG9pa08xdklsRVdvdWxNdzVvZWZtcWMxMjRlS010RHlMalBDZkd1TEsy?=
 =?utf-8?B?dCtvNGxwTFVWS1NkYzVPVDNlZzJvWlhTTW5RWUZ6NVowSzhNR3JDL00zcUYw?=
 =?utf-8?B?bEJHbnV5NWpzTUtNYWtpbTFpMk12QjBPMGZIV2tkdEN6TjJFbmovK2Fhc1lG?=
 =?utf-8?B?QkdJRW5pY08zbHJwRER0Ukp4ZTRGNThyTy9reGVoeEZEaHZGc29HYzNuaUtk?=
 =?utf-8?B?VUt2SzVRdU1BOGJFTHBzbXJuV0xaSlBTVittbTBpM0ExWmpqSG1BMXJnZ2pR?=
 =?utf-8?B?NkxoTklibDNJWUl1N1UydlVOMmw5SDhvNGhVR0grUklZTm8vejI1YjF0cDFO?=
 =?utf-8?B?NmVIMC9uUnNtL0p5NUhMS1F5Q1RUUDVONkNhbjFHWFRTdGI4ZEVYa21pWFFu?=
 =?utf-8?B?dW42N0VhUkgrajlCZ0VHSWdZR3g2K2V4TGpjVEZaR1JZU2orNW05czlpQlNj?=
 =?utf-8?B?dHl5RUplN0MxQ004dWdwWTNRQTMyTEZZY3NXTlF2bUJPUDNTaWxwb0FCbnFn?=
 =?utf-8?B?SnNodUlIMmUwZWlYMUQvdVU2Uk5YY0hMYURkTUYvTm44eEFOOGcvRGh5bG5H?=
 =?utf-8?B?dFZJWFJ5dHpBR1BzRWk0S1F5blZ1YWRHUWNYM2EzakVFVzNzQlNnbDhKWTk0?=
 =?utf-8?B?VmtyZm5ZYUpnUlhKbk95cW95dGNKQlBzR2RaV05YYTl2RkVURXh0emlIK1pU?=
 =?utf-8?B?anA3L0V0OWx6RE5QSi92c2NpSlpyWnkyWVlhcjFFQlZaSmlhZkhHK2dHT2F6?=
 =?utf-8?B?Q25pRkh6ZU9TdG81UVRLNXBCSk56Wm01M1ROdlNDWEhIOGd3TmNEOFpIbTQ5?=
 =?utf-8?B?bTJoQW1hL2IwM1ZKZG5IZEYza1BNQ3lPSUNKMU0xek5YUUJPdUVZb0d1eW1Z?=
 =?utf-8?B?aitjTU9RZHlBck4xR3EveTUyNm9ZZ3ZJSFp0cEdBNnFqTE1NT1RiU0g0UWI3?=
 =?utf-8?B?b3Y3SVhCZmlDdlZ5VSs0MkJBdHdiUE1yalJjNFl6U0dZRHlmS2dDMG5EMUEv?=
 =?utf-8?B?a3QzdU8zZ2s1SWQ2L2ZmN3hTQ2M0Y2k5ZkhGcDR2S1JvK2JmdFFBWUhrMzBL?=
 =?utf-8?B?UXovRG9BaTlrMWFURmZHNjNvK2d5ejRNZUJSV2NuWWNvWUcycWRVUTJrZCtB?=
 =?utf-8?B?UkxKUzg5UGlMSjRPampkVXAzcGZzd3hoZFo4VXZUcGlsVTZ4dmZxc3pqbDVU?=
 =?utf-8?B?M1FVMjUvWkp6YzZvNlNqS1hSY2NSbmZHQXlCd0liNExHT1BOTlFLSVl6R2J1?=
 =?utf-8?B?RFhZMWNRZ2FGeWJOMzNha3lIWTJiczN3S1R2WGNpY3dSL2tFd1pZa3JwZHV6?=
 =?utf-8?Q?4IOCxVF++rz0IZ0b3OEioekSuWGobnQs02N997R?=
Content-ID: <5543E8FC76DF3546BB781A7B7A95CCBC@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR05MB6624.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68e6a770-ce74-42ef-9fb3-08d8ec9e246d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2021 19:18:43.1947 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l9/vbaOiYQSXPWjYWyoPmUrZDsSYDQ2RP3vAA2J2Fzt3GD1ClJdiaxvfYkZ3MShUrKaTQFDoAfEzuh1K2qPiew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6125
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
Cc: David Airlie <airlied@linux.ie>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 Roland Scheidegger <sroland@vmware.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gT24gTWFyIDIwLCAyMDIxLCBhdCAxNzoxNiwgQmhhc2thciBDaG93ZGh1cnkgPHVuaXhi
aGFza2FyQGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPiANCj4gcy9wYXJ0aWN1YXIvcGFydGljdWxh
ci8NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEJoYXNrYXIgQ2hvd2RodXJ5IDx1bml4Ymhhc2thckBn
bWFpbC5jb20+DQo+IC0tLQ0KPiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9zby5jIHwg
MiArLQ0KPiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4g
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9zby5jIGIvZHJp
dmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfc28uYw0KPiBpbmRleCA3MzY5ZGQ4NmQzYTkuLjZj
ZDM4ZTQwNzE0NSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhf
c28uYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9zby5jDQo+IEBAIC0z
Myw3ICszMyw3IEBADQo+ICAqIFRoZSBjdXJyZW50bHkgb25seSByZWFzb24gd2UgbmVlZCB0byBr
ZWVwIHRyYWNrIG9mIHZpZXdzIGlzIHRoYXQgaWYgd2UNCj4gICogZGVzdHJveSBhIGhhcmR3YXJl
IHN1cmZhY2UsIGFsbCB2aWV3cyBwb2ludGluZyB0byBpdCBtdXN0IGFsc28gYmUgZGVzdHJveWVk
LA0KPiAgKiBvdGhlcndpc2UgdGhlIGRldmljZSB3aWxsIGVycm9yLg0KPiAtICogU28gaW4gcGFy
dGljdWFyIGlmIGEgc3VyZmFjZSBpcyBldmljdGVkLCB3ZSBtdXN0IGRlc3Ryb3kgYWxsIHZpZXdz
IHBvaW50aW5nDQo+ICsgKiBTbyBpbiBwYXJ0aWN1bGFyIGlmIGEgc3VyZmFjZSBpcyBldmljdGVk
LCB3ZSBtdXN0IGRlc3Ryb3kgYWxsIHZpZXdzIHBvaW50aW5nDQo+ICAqIHRvIGl0LCBhbmQgYWxs
IGNvbnRleHQgYmluZGluZ3Mgb2YgdGhhdCB2aWV3LiBTaW1pbGFybHkgd2UgbXVzdCByZXN0b3Jl
DQo+ICAqIHRoZSB2aWV3IGJpbmRpbmdzLCB2aWV3cyBhbmQgc3VyZmFjZXMgcG9pbnRlZCB0byBi
eSB0aGUgdmlld3Mgd2hlbiBhDQo+ICAqIGNvbnRleHQgaXMgcmVmZXJlbmNlZCBpbiB0aGUgY29t
bWFuZCBzdHJlYW0uDQo+IC0tDQo+IDIuMjYuMg0KPiANCg0KTG9va3MgZ29vZC4gSeKAmWxsIHB1
c2ggaXQgdGhyb3VnaCB0aGUgZHJtLW1pc2MgdHJlZSBvbiBteSBuZXh0IHNlcmllcy4gVW5sZXNz
IG9mIGNvdXJzZSB5b3Ugd2FudCB0byBwdXNoIGl0IHRocm91Z2ggYSBkaWZmZXJlbnQgdHJlZSBp
biB3aGljaCBjYXNlOg0KUmV2aWV3ZWQtYnk6IFphY2sgUnVzaW4gPHphY2tyQHZtd2FyZS5jb20+
DQoNCnoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
