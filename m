Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 059A878EFF2
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 17:10:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D9C410E18E;
	Thu, 31 Aug 2023 15:10:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2071.outbound.protection.outlook.com [40.107.13.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60D2510E4E9
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 10:20:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UdWNgBJacru58mPM3zvJkTJZuYweXNzR1no0Iwd9Oa/JDzUkHijYeqv5/HtMlSCWXaz+MEOduAf3iunY0zroFhONWh1zalDncj139hqFORTuIfnpyFhBjpKoebbxXsDu/Qcd0LC1AT8eJ5n3fWSAuNDV6w9HgTZR9+cN7phFVk9erKuQZdL/pN0E3q4dGxzM+X9cvyLL7budSuWpafD9vMynOadD+hvS/3NF+NPKLUyexUdkSsa6DxE6Y5sZMGL7A6oE54nke6A6Ge0z6emi4WxVFebciVZEeegJEySPV3PRYzC0fnEoIiU7VScYB1NTxLvNpCRzNTpGYSuTlYD1kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B+0HcKWjuxXmletq4olxIty0jTuOdyVBB30Nra2Afgk=;
 b=UCzlu1obz7yf07BVaVdvTvH1YgOCYOF2qVz6O9yicjcKF86pXfm2xkEhITq6Z7XIvMYS3RLI7Gdu8g7cT69ChBXX/4bLNHAsbV942HDoGWBsaSCTqd7x8cswdp+KCpDZtOAHifTOeNaVgvvFZQREGEceakNtVN/ztNHK4V1/O+P4PZyxYSWdiCBv/Zc3GXsuvGfKOEwjVDCUIKReXuFGcUWPj/2glom/vaQ4yjIS86LY1/EbInEjY0S5PPK8NsdyEnd+KBZ0sKtZqH4vnB5fQGOw1NoFrGDLLr0MbWvMV3e2HOjPV3CnV09Qkzuf1zafDngUbKMlqYc22uz9GlWPkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=asem.it; dmarc=pass action=none header.from=asem.it; dkim=pass
 header.d=asem.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B+0HcKWjuxXmletq4olxIty0jTuOdyVBB30Nra2Afgk=;
 b=dEdR8GChVRHVKOt9M9KVwHcit/sakM2GXntHkUwilWZrIU1IMENFEfJuzgthKXLCm0O6FmGW+Q+Tta4y8qz418pjX6vaU090dnlSoTMB4yzggb7MjpGcenf2PgIsJDs8KEg9UrKyf+Jq0TOngvo5jy4R2MZjJRbpsxCeaJvIp40=
Received: from DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:273::14) by AS4PR01MB10179.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:4f8::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.17; Wed, 30 Aug
 2023 10:20:10 +0000
Received: from DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 ([fe80::11d:15c1:fca6:e077]) by DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 ([fe80::11d:15c1:fca6:e077%7]) with mapi id 15.20.6745.020; Wed, 30 Aug 2023
 10:20:10 +0000
From: Flavio Suligoi <f.suligoi@asem.it>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Lee Jones
 <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Jingoo Han
 <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, Pavel Machek
 <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Subject: RE: [PATCH v1 1/2] dt-bindings: backlight: Add MPS MP3309C
Thread-Topic: [PATCH v1 1/2] dt-bindings: backlight: Add MPS MP3309C
Thread-Index: AQHZ2mHPrVopNJPC/kuEF9j2J1TebbABF34AgAAdZbCAAET+AIABJF6Q
Date: Wed, 30 Aug 2023 10:20:09 +0000
Message-ID: <DU2PR01MB8034CED37F837F40601A8F7EF9E6A@DU2PR01MB8034.eurprd01.prod.exchangelabs.com>
References: <20230829101546.483189-1-f.suligoi@asem.it>
 <6dfae492-5533-df97-5c72-373d5e89444f@linaro.org>
 <DU2PR01MB8034C85013ECF222D12BAAA4F9E7A@DU2PR01MB8034.eurprd01.prod.exchangelabs.com>
 <4982cfd7-4930-f205-09e8-fc5028183dba@linaro.org>
In-Reply-To: <4982cfd7-4930-f205-09e8-fc5028183dba@linaro.org>
Accept-Language: it-IT, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=asem.it;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR01MB8034:EE_|AS4PR01MB10179:EE_
x-ms-office365-filtering-correlation-id: 3d81c7ca-2921-4b41-fcfc-08dba942b0b9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cVIgx2Sw+s+9SxHaaeBt8AU8PiDImxKk8ZtUVO1bsiZoYcwWXjEG/J/AgSLlFpFUlDPkWhV8LB33BDPuuvucCF0n8kGvWAAEppbjR6TCkyl0Npub8pSJCzb7kkYhffSLcxvn1Y6kfmVSPYy2woxGnK/f3JjWcH9BWy19lrcYUbMVLhiKDFVtQD0IEhigSh+qACds/SMgn0F8w7vpTNq98TPhJuUN9YYEmNeh7RQfdICab+FRiSKsW/1RnV9Lk/GbLNjMj7SXu2ev6F+xfTy+71onWbQfZjxEx1+txtqAq24zRaMtBFt6ShAvf+Xeambe4fWn6OtKAzC0FPR9VWofW+oysAD/zjZyDJZKt/mqXzMe/FUy2LeZ5ZKRd5qLVlrfg8KFFvaCOQtyPGLyIa9HGdmHEFwaYefiIrr9Sk/e0dLKlB7L1wA7/TLdBvlLlgdUUZoAY65PPgqfEadgHMKWxFWFMCxTIsmtiBEVQAArI1TmxbbuxEmBTEglBAG9SAA1gkoUqFBJ+yy32BTjwPgWk7KkEiL/UoyDMuiNLuFDpy+Ws3Hlen3ShUby+3gDusNa1tPWSt5WsxXOiIloPvv14QHor/Tpk/rlzS/GlW878Uw1lZZ0Stvoh+KXkPIO2nFx
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR01MB8034.eurprd01.prod.exchangelabs.com; PTR:;
 CAT:NONE;
 SFS:(13230031)(366004)(39850400004)(136003)(346002)(396003)(376002)(186009)(1800799009)(451199024)(41300700001)(38100700002)(478600001)(86362001)(122000001)(83380400001)(71200400001)(38070700005)(7416002)(26005)(9686003)(6506007)(7696005)(55016003)(64756008)(76116006)(66556008)(110136005)(54906003)(316002)(2906002)(66446008)(66946007)(33656002)(66476007)(5660300002)(8676002)(8936002)(4326008)(52536014);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a2srRXlMYkdFRmxoUk5oaWZsd09yeFNFTUpzb2NYaUFkaDJqQjBKdE1pb3JY?=
 =?utf-8?B?M2ZJNTFaeDI3UjIwQXRZQytsbndTTFd3VWhLOWhtRG81VWNYYXZacDhjMjB5?=
 =?utf-8?B?VUxrR0lHdXh2SjZOa0lqTW9rOXVyK1NxZXBReXhwY21sTUh4SWc3dHY4eTZ2?=
 =?utf-8?B?a3VPTHNwcGdvaEtXMlNsb2dEb2Njc3FEamd5NTFpM0c1NTVCdHErMG0rdzdM?=
 =?utf-8?B?WU5tRDlqWHBkeFRhTk1PeStVKzE0YkM5bFZHQ0F4Zm9ROG9MZWtDY2I2L3BP?=
 =?utf-8?B?SkhlSGRmTGxZNC9WdlZGUlJSS0xYTFpzTkhud0FCQzI2UnkzQjVlYjg4QVpp?=
 =?utf-8?B?MGgwR3BKNUM3cWVMZnZybXpZTTZPQ1dMcTloeVJQNlRqNUhWWHdJaHVwSWxE?=
 =?utf-8?B?MDg1c09UZXdkMkVTeDF0S0ZncjJjdzBFZ29teDk4V2RCcm9uUFNIU2pqTkc0?=
 =?utf-8?B?YkljaUhDK2c2a2hsV0Y5NU1GTEhCRERuTmJ5K0g1OVRnNGUrWVhQUmxQaita?=
 =?utf-8?B?cExnby9rSmtQanl1NGd5MlhiNklZOStlbzN2TUR5N3IzaHV3UEFnMk9uYTRV?=
 =?utf-8?B?M2xjdkRKS0tOZkpoWm0rdmxWeGtNS1MyZUVoY3FrL2JFSTVPSDNlcUltMXN1?=
 =?utf-8?B?ZzBHWGMyR0tzZFM0SDVVbFo0bVpnMEMzMnJTUEhRaGJZS3RjY2FpdkxES2RO?=
 =?utf-8?B?Tis0YWx2TWY1SlkxVnMrYVc4enFKb3cvbnViMlhJOGczcWVidWxjOHNCWDN3?=
 =?utf-8?B?VndVZWF1eFpiNU1rWkozVXVzVUF4cHVydkZXbnZQcWlaWmlsWVo3WkJWQXVV?=
 =?utf-8?B?MUFUbDFNV1ZDTDJ5RFZ0VS9UVTdnS3REakxUcUNwMCs1WGRXcEg4QW5TRzNa?=
 =?utf-8?B?ZzJvNnBlWFVvbDNlY3hrNk9XT2IwTi9YU3plYWtzckpZMEJMaEdKSGpoSFhD?=
 =?utf-8?B?Sm1NY2VNeDhQd0wyeEdOMWJMeVF1RGV5dmh6QWRET0w4UXVJcmZJOGYvZlcr?=
 =?utf-8?B?ZVR4VlBJNE96cTRQYnpXTU5WOXpUeGdMK25jYzZPYnJ1S2ZpV1VFay9iNG9X?=
 =?utf-8?B?OHZkR2NYQnR0RVNxcHJxRHNVczc3QVB6SFBkMGZ5N2V0Z09VaVo4cVZqdWR3?=
 =?utf-8?B?WndiMlZzVlMybGxHeHArY3ljZlZ4UHlQYVlsQUpuQ0p2V3M2RlMwOUhGUHhi?=
 =?utf-8?B?WmhDa1l0VGQyQnpwQkFrN0RveHZRcFlGRU1mTGw1dzc5blRZVEVLRko1U2Iy?=
 =?utf-8?B?YjkrajlGQ0lqa3EvTHB6R0F3cFRmZlFrbGVrY1ZHZktOZ0NaN1BZSTJDNWJn?=
 =?utf-8?B?dzhXN2dvSmRpMWpRY0dnbndPVXBSbWNWUXgxdXpSUDMwWDNwb1FsTmFHSGF5?=
 =?utf-8?B?MklHdS9QVmhCb29KWS8vNTUzSzM4NXE2cHJUOXB0UXh3Qk1rYk5xajF4YWJL?=
 =?utf-8?B?NFFoMmh4S1UwTGVCbDQyVWxlSEJPTTgveGE0aGowb3JFbXFudy9FbHgwRTBm?=
 =?utf-8?B?Y2k0c1IvVUplZ2lwNk9GTGNDM2l2UXNQRmsvanduRUJZMDVwc1p4Z2Z0UndL?=
 =?utf-8?B?aUlld0YzSWJ0WDNQMytmVVA4d0dNOVNaVzlUbElVekk1YUFMOEp1NGNFeTRz?=
 =?utf-8?B?Q3Qyc0M3c2hqN1F6czlhRzUwZldidnhXRmJHZXlHUHF3ZS9kRkdlL1E4Smpz?=
 =?utf-8?B?SnlRSEZaWGpmQ1FzaHF3dWVNdWxrS1lpaVFGWUo1SC81TjNLazJUVWV6MU1V?=
 =?utf-8?B?bHpyQjVEUkFkVDhuNldNUnRrejFGTG9GSVUwbzFJNmw5Q2VOU2drTEMrcWw0?=
 =?utf-8?B?bEplVmtJemovbGYrVkJmbm9mR3l5dWgwNDJ3dC85UVBXcUFRUU5LYjduN1k4?=
 =?utf-8?B?QUxFeG1MZFFHWnFVK0JPdEtPM0Rld3VKMWVuK2FRUTlmWGVVTitQd3BYSXVB?=
 =?utf-8?B?TUZ4VVNOaC9nbUZjZ095b01UZHpjZXBFRVUreWR0K09WTmg1bHU0eTZuYVcr?=
 =?utf-8?B?WHA0TFFSMGdkSTN0NDNBUm5ON21sbTRMd3p3blhyM2dzMVlRVVo0UCtnTC9I?=
 =?utf-8?B?UFE5MDFTdjl3dmMyb2ZQdzEzTUkwZkJMZWpsdlpaMmhIeXdFUGMzMU5Pby80?=
 =?utf-8?Q?yT2g=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8034.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d81c7ca-2921-4b41-fcfc-08dba942b0b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2023 10:20:10.0373 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d0a766c6-7992-4344-a4a2-a467a7bb1ed2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n2nN9Bhn4xiP2q7VFv6AkWA1Gc+Rij2ip3TSC3QpeezmYfrcCVuloUNF5ZOggwx2WU2QtD4o4jYZhqoXxWROeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR01MB10179
X-Mailman-Approved-At: Thu, 31 Aug 2023 15:10:31 +0000
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgS3J6eXN6dG9mLA0KDQouLi4NCg0KPiA+Pj4gKw0KPiA+Pj4gKyAgcmVnOg0KPiA+Pj4gKyAg
ICBtYXhJdGVtczogMQ0KPiA+Pj4gKw0KPiA+Pj4gKyAgbXBzLGRpbW1pbmctbW9kZToNCj4gPj4+
ICsgICAgZGVzY3JpcHRpb246IFRoZSBkaW1taW5nIG1vZGUgKFBXTSBvciBhbmFsb2cgYnkgSTJD
IGNvbW1hbmRzKS4NCj4gPj4+ICsgICAgJHJlZjogJy9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmlu
aXRpb25zL3N0cmluZycNCj4gPj4NCj4gPj4gRHJvcCBxdW90ZXMsIHlvdSBzaG91bGQgc2VlIHdh
cm5pbmdzIGZvciB0aGlzLg0KPiA+Pg0KPiA+PiBJdCBkb2VzIG5vdCBsb29rIGxpa2UgeW91IHRl
c3RlZCB0aGUgYmluZGluZ3MsIGF0IGxlYXN0IGFmdGVyIHF1aWNrDQo+ID4+IGxvb2suIFBsZWFz
ZSBydW4gYG1ha2UgZHRfYmluZGluZ19jaGVja2AgKHNlZQ0KPiA+PiBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3Mvd3JpdGluZy1zY2hlbWEucnN0IGZvciBpbnN0cnVjdGlvbnMpLg0K
PiA+PiBNYXliZSB5b3UgbmVlZCB0byB1cGRhdGUgeW91ciBkdHNjaGVtYSBhbmQgeWFtbGxpbnQu
DQo+ID4+DQo+ID4+PiArICAgIGVudW06DQo+ID4+PiArICAgICAgLSBwd20NCj4gPj4+ICsgICAg
ICAtIGFuYWxvZy1pMmMNCj4gPj4NCj4gPj4gV2h5IGRvIHlvdSB0aGluayB0aGlzIGlzIGEgcHJv
cGVydHkgb2YgYSBib2FyZD8gSXMgUFdNIHNpZ25hbCBvcHRpb25hbD8NCj4gPj4gSWYgc28sIGl0
cyBwcmVzZW5jZSB3b3VsZCBkZWZpbmUgaXQuIE90aGVyd2lzZSBpdCBzZWVtcyB5b3Ugd2FudCB0
bw0KPiA+PiBjb250cm9sIHRoZSBkcml2ZXIuDQo+ID4+DQo+ID4NCj4gPiBUaGUgTVAzMzA5QyBk
ZXZpY2UgYWx3YXlzIG5lZWQgYSBJMkMgYnVzIHRvIHJkL3dyIGl0cyBpbnRlcm5hbCByZWdpc3Rl
cnMuDQo+ID4gQnV0IHRoZSBicmlnaHRuZXNzIGNhbiBiZSBjb250cm9sbGVkIGluIG9uZSBvZiB0
aGUgZm9sbG93aW5nIHdheXMNCj4gPiAobXV0dWFsbHkgZXhjbHVzaXZlLCBidXQgbWFuZGF0b3J5
KToNCj4gPiAtIGEgUFdNIGlucHV0IHNpZ25hbA0KPiA+ICAgICBvcg0KPiA+IC0gYSBJMkMgY29t
bWFuZA0KPiA+IFNvLCB0aGUgZHJpdmVyIG5lZWRzIGEgcHJvcGVydHkgdG8gc2VsZWN0IHRoZSBk
aW1taW5nIG1vZGUgdXNlZDsgdGhpcw0KPiBwcm9wZXJ0eSBpcyBtYW5kYXRvcnkuDQo+IA0KPiBO
bywgaXQncyBub3QgYSBwcm9vZi4gRG9uJ3QgbWl4IHByb3BlcnRpZXMgYW5kIGhhcmR3YXJlIHNp
Z25hbHMuDQo+IA0KPiA+IFRoaXMgaXMgdGhlIHJlYXNvbiBvZiB0aGUgZXhpc3RlbmNlIG9mIHRo
ZSAnIG1wcyxkaW1taW5nLW1vZGUnIHByb3BlcnR5Lg0KPiA+IFBXTSBzaWduYWwgaXMgbm90IG9w
dGlvbmFsLCBpdCBpcyByZXF1aXJlZCBpZiBhbmQgb25seSBpZiB0aGUgJ3B3bScgZGltbWluZw0K
PiBtb2RlIGlzIHVzZWQuDQo+IA0KPiBTbyB0aGUgcHdtcyBkZXRlcm1pbmUgdGhlIG1vZGUuIFRo
YXQncyBpdCwgbm8gbmVlZCBmb3IgdGhpcyBwcm9wZXJ0eS4NCj4gDQo+IA0KPiA+IElmIHRoZSAn
YW5hbG9nLWkyYycgZGltbWluZyBtb2RlIGlzIHVzZWQsIGluc3RlYWQsIHRoZSBQV00gc2lnbmFs
IG11c3Qgbm90DQo+IGJlIHVzZWQuDQo+ID4gU28gdGhlIHByb3BlcnR5ICdtcHMsZGltbWluZy1t
b2RlJyBjb250cm9scyBob3cgdGhlIE1QMzMwOUMgaXMgdXNlZC4NCj4gPiBJIGNhbiBhZGQgbW9y
ZSBkZXRhaWxzIGFib3V0IHRoaXMgaW4gdGhlIGRlc2NyaXB0aW9uIHNlY3Rpb24uDQo+IA0KPiBO
bywgZHJvcCB0aGUgcHJvcGVydHkgb3IgZXhwbGFpbiBtb3JlLCBlLmcuIGlzIEkyQyBtb2RlIG9m
IGNvbnRyb2wgdXNlZCB3aGlsZQ0KPiBoYXZpbmcgUFdNcyBzaWduYWxzIGNvbm5lY3RlZD8NCg0K
T2ssIEkgdGhpbmsgSSB1bmRlcnN0YW5kIHdoYXQgeW91IG1lYW46DQpzaW5jZSB0aGUgSTJDIGJ1
cyBpcyBhbHdheXMgcHJlc2VudCB0byBjb25maWd1cmUgdGhlIGNoaXAsIHRoZSAnYW5hbG9nLWky
YycNCmRpbW1pbmcgbW9kZSBpcyB0aGUgZGVmYXVsdCBtb2RlLg0KVGhlIG90aGVyIHR5cGUgb2Yg
ZGltbWluZyBtb2RlLCB0aGUgJ3B3bScgZGltbWluZyBtb2RlLCBpcyBhbiBvcHRpb24uDQpXaGVu
IHRoZSBwd20gaXMgcHJlc2VudCBpbiB0aGUgRFQsIHRoZSBwd20gc2lnbmFsIGlzIHVzZWQgYXMg
ZGltbWluZyBjb250cm9sIG1vZGUNCmluc3RlYWQgb2YgdGhlIGkyYyBkaW1taW5nIGNvbnRyb2wg
bW9kZS4NCkluIHRoaXMgd2F5IHRoZSAnIG1wcyxkaW1taW5nLW1vZGUnIHByb3BlcnR5IGlzIG5v
dCBtb3JlIG5lY2Vzc2FyeSBhbmQgY2FuIGJlIGVsaW1pbmF0ZWQuDQoNCj4gDQo+ID4gLi4uDQo+
ID4NCj4gPj4+ICsNCj4gPj4+ICsgIG1wcyxvdmVydm9sdGFnZS1wcm90ZWN0aW9uLTEzdjoNCj4g
Pj4+ICsgICAgZGVzY3JpcHRpb246IG92ZXJ2b2x0YWdlIHByb3RlY3Rpb24gc2V0IHRvIDEzLjVW
Lg0KPiA+Pj4gKyAgICB0eXBlOiBib29sZWFuDQo+ID4+PiArICBtcHMsb3ZlcnZvbHRhZ2UtcHJv
dGVjdGlvbi0yNHY6DQo+ID4+PiArICAgIGRlc2NyaXB0aW9uOiBvdmVydm9sdGFnZSBwcm90ZWN0
aW9uIHNldCB0byAyNFYuDQo+ID4+PiArICAgIHR5cGU6IGJvb2xlYW4NCj4gPj4+ICsgIG1wcyxv
dmVydm9sdGFnZS1wcm90ZWN0aW9uLTM1djoNCj4gPj4+ICsgICAgZGVzY3JpcHRpb246IG92ZXJ2
b2x0YWdlIHByb3RlY3Rpb24gc2V0IHRvIDM1LjVWLg0KPiA+Pj4gKyAgICB0eXBlOiBib29sZWFu
DQo+ID4+DQo+ID4+IE5vcGUgZm9yIHRoZXNlIHRocmVlLiBVc2UgLW1pY3Jvdm9sdCBzdWZmaXgg
Zm9yIG9uZSBwcm9wZXJ0eS4NCj4gPg0KPiA+IE9rDQo+ID4NCj4gPj4NCj4gPj4+ICsNCj4gPj4+
ICsgIG1wcyxyZXNldC1ncGlvczoNCj4gPj4+ICsgICAgZGVzY3JpcHRpb246IG9wdGlvbmFsIEdQ
SU8gdG8gcmVzZXQgYW4gZXh0ZXJuYWwgZGV2aWNlIChMQ0QgcGFuZWwsDQo+IEZQR0EsDQo+ID4+
PiArICAgICAgZXRjLikgd2hlbiB0aGUgYmFja2xpZ2h0IGlzIHN3aXRjaGVkIG9uLg0KPiA+Pj4g
KyAgICBtYXhJdGVtczogMQ0KPiA+Pg0KPiA+PiBObywgeW91IHNob3VsZCBub3QgYWRkIGhlcmUg
R1BJT3MgZm9yIG90aGVyIGRldmljZXMuDQo+ID4NCj4gPiBEbyB5b3UgbWVhbiB0aGF0IEkgaGF2
ZSB0byByZW1vdmUgdGhpcyBwcm9wZXJ0eSBvciB0aGF0IEkgaGF2ZSB0byBtb3ZlIGl0DQo+IHNv
bWV3aGVyZSBlbHNlPw0KPiA+IEkgYWRkZWQgdGhpcyBmZWF0dXJlIGJlY2F1c2Ugc29tZXRpbWVz
LCBpbiBlbWJlZGRlZCBib2FyZHMsIHlvdSBuZWVkIGENCj4gPiBwdWxzZSBzaWduYWwgdG8NCj4g
DQo+IEhvdyB5b3UgZGVzY3JpYmVkIGl0LCB0aGlzIGlzIG5vdCB0aGUgcHJvcGVydHkgb2YgdGhp
cyBkZXZpY2UuDQo+IA0KPiA+IHVzZSBhZnRlciB0aGUgYmFja2xpZ2h0IHByb2JpbmcsIGZvciBl
eGFtcGxlIHRvIHJlc2V0IGFub3RoZXIgZGV2aWNlDQo+ID4gaW4gc3luYyB3aXRoIHRoZSBiYWNr
bGlnaHQgcHJvYmUuDQo+IA0KPiBUaGVyZSBpcyBubyB0ZXJtIGFzICJwcm9iZSIgaW4gaGFyZHdh
cmUsIHNvIHlvdSBkZXNjcmliZSBkcml2ZXJzLg0KPiANCj4gPiBEbyB5b3UgdGhpbmsgSSBoYXZl
IHRvIHJlbW92ZSB0aGlzIGZlYXR1cmUgZnJvbSB0aGUgZHJpdmVyPw0KPiANCj4gWW91IGNhbm5v
dCByZXF1ZXN0IEdQSU8gYWZ0ZXIgcmVtb3ZpbmcgaXQgZnJvbSB0aGUgYmluZGluZ3MsIG9idmlv
dXNseSwgYnV0DQo+IHdoZXRoZXIgeW91ciBiYWNrbGlnaHQgc2hvdWxkIHJlc2V0IHNvbWV0aGlu
ZyBlbHNlPyBEb24ndCBjYXJlLCBkb24ndCBrbm93LiBJDQo+IHRhbGsgYWJvdXQgYmluZGluZ3Mu
DQoNClRoaXMgR1BJTyB3YXMgdXNlZCBpbiBvbmUgb2Ygb3VyIGJvYXJkcyB0byBzb2x2ZSBhIHN5
bmMgcHJvYmxlbSwgYnV0IGl0IGlzIG5vIG1vcmUNCm5lY2Vzc2FyeS4gSSdsbCBlbGltaW5hdGUg
aXQsIHRoYW5rcy4NCg0KPiANCj4gPg0KPiA+IC4uLg0KPiA+DQo+ID4+PiArYWxsT2Y6DQo+ID4+
PiArICAtICRyZWY6IGNvbW1vbi55YW1sIw0KPiA+Pj4gKyAgLSBpZjoNCj4gPj4+ICsgICAgICBw
cm9wZXJ0aWVzOg0KPiA+Pj4gKyAgICAgICAgbXBzLGRpbW1pbmctbW9kZToNCj4gPj4+ICsgICAg
ICAgICAgY29udGFpbnM6DQo+ID4+PiArICAgICAgICAgICAgZW51bToNCj4gPj4+ICsgICAgICAg
ICAgICAgIC0gcHdtDQo+ID4+PiArICAgIHRoZW46DQo+ID4+PiArICAgICAgcmVxdWlyZWQ6DQo+
ID4+PiArICAgICAgICAtIHB3bXMNCj4gPj4NCj4gPj4gU28gdGhpcyBwcm92ZXMgdGhlIHBvaW50
IC0gbXBzLGRpbW1pbmctbW9kZSBsb29rcyByZWR1bmRhbnQgYW5kIG5vdA0KPiA+PiBoYXJkd2Fy
ZSByZWxhdGVkLg0KPiA+DQo+ID4gU2VlIG15IHByZXZpb3VzIGNvbW1lbnQuDQo+IA0KPiBObywg
aXQgc3RpbGwgcHJvdmVzIHRoZSBwb2ludCB0aWxsIHlvdSBleHBsYWluIHdoeSBwd21zIGNhbm5v
dCBiZSB1c2VkIHRvDQo+IGRldGVybWluZSB0aGlzLiBSZWFkIG15IG1lc3NhZ2VzLg0KPiANCj4g
QmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg0KVGhhbmtzIGZvciB5b3VyIGhlbHAhDQpGbGF2
aW8NCg0K
