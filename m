Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4BA5A362A
	for <lists+dri-devel@lfdr.de>; Sat, 27 Aug 2022 11:04:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63C2F10EC53;
	Sat, 27 Aug 2022 09:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2124.outbound.protection.outlook.com [40.107.113.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C27C10EC2C
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Aug 2022 09:04:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xzeccnkvjt+M+mI5Wi9ZLyZ4ym1vJJgkYkTmW5RxlR9a6KSWSAP04BG7vOQSnFE/A9+o+JrHnnDwZH9BChfv2j23gsxR/5qoTm0P3N5ijd640iHC20Izp/vcN6Q5h53DKLOjSdgZUXlccIoMDoPZxAWVgJgeSvPG2br892VVNR/m0XzNTIYjqb4Ns74iHUaOXbvx1BXJiBHTa0tk1/VowKWcyPKWgIcFwfREB9C5i1dAhE6nfTlVjmb/k1lcX2d2fjiD3A+rbKLDdO66YuFSZEuqeJyNZPFXnhI4pkH3QB9fSVr/e6U3F7w8hFEx28MkcFLjQMW3Y37ufh3vlobRrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7HUVYQJWvDifLuV/7w15tKeczoORRN/lRgLmGLS6mB4=;
 b=gixETwiSUPOUAlNA46bOlWT1+FYX838s4OV0ZsDPK9/S86mSpYrDTO79zZkMse5tBS9IWDnZ/e14UGOuxgPC/D3E33UE+96oBi7+A68ml5KxPSJzqlNYGV8756DKJjVbU9Zffr5q0g+v0jeGFJnGDjME9pRNNb49fvsfy6DoQ4o1OQAa4/lh516YPEsEdeWwu9/W3rxeR5rX2b/Zt4cNT1iSG0saWtoBSmwqErFnhAeZr4AuKpLBzrOSigxYEhbojFLafj+TRaL3zJDAuUXA8KjXtExuHCqmlGf2f9EQXrKvAKp1/5gTDq61Yu2WkWRX7UqPouot82N33kA5EpTsVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7HUVYQJWvDifLuV/7w15tKeczoORRN/lRgLmGLS6mB4=;
 b=tz8SICGxib8bpyurVibtWK1M8+iE1vfmSRYHN5YJTe5qQO44mKTpgEFmoALDRaIVrW9LF2pYQis1F255bXyUlXKbk3ml1BWcoorkcPFPE+CvMHCtYn0Yup1ejGrZNTUht3tlz/P6vvRxLg4RqxJLBdsf1Q1OhUYNnihWWJEj7xg=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYAPR01MB2703.jpnprd01.prod.outlook.com (2603:1096:404:7f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Sat, 27 Aug
 2022 09:04:27 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::14d3:5079:9de1:ceaf]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::14d3:5079:9de1:ceaf%3]) with mapi id 15.20.5566.019; Sat, 27 Aug 2022
 09:04:25 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH 2/2] drm: rcar-du: Use %p4cc to print 4CC format
Thread-Topic: [PATCH 2/2] drm: rcar-du: Use %p4cc to print 4CC format
Thread-Index: AQHYuG7t+14tWNeQw0+zXqAYnK1OK63B25yAgACX7+A=
Date: Sat, 27 Aug 2022 09:04:25 +0000
Message-ID: <OS0PR01MB592284D23CEF5354170765A886749@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220825103905.2450049-1-biju.das.jz@bp.renesas.com>
 <20220825103905.2450049-2-biju.das.jz@bp.renesas.com>
 <YwlboWrxzP7JWeg/@pendragon.ideasonboard.com>
In-Reply-To: <YwlboWrxzP7JWeg/@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cfba0fae-c0de-48e4-52c9-08da880b23c2
x-ms-traffictypediagnostic: TYAPR01MB2703:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PIxBAWNHrNh+EpqadkcR1oRZrQOKqva9MEq8ZBq8Ml0Y7Fc/ltw90v0XczH+dQqojZPJhcqmFfS+vFvr0xBHtKYSaGV5VLFho9qYDymEsxdgBYpwlvLg49AV3OpVEy3iii86gd26O8wxJb/cFnPBw7NKDX4xnRs558aL5tL1KZ8gL60OdJYHhKhvJO1NtdryXdpS/CJOiuZS9iCWk350Om3pmTr7CFtbBUMu0X40q7zZIZsolwymTEg4rzJf6tSV3Dtm90jBIAR1GijPWCm1plnEggLnzxQb3tjvsI/InLH93wO5RmrsaSwMfY1WCGJNtYGDgNGvOX/oACtsEKCvKRrxikLgds2yT6ETZapW6RwPdrabM8muz/VPUQqotsTOW2jOONfVnPOrZZ5QJ8AvLbggUUUMy4QUR/eR5nz5w1ygSrzgT/A0Tegsum7jKkzWa4XMsbxGwEpAD1e9z3N6ynmeZPPcNmL1tvfgaT4JnTCmJu+cYmfB5BDlQefNYFsdOzdf8WbuKcayoNLVqalcPB+ScYZDIcX5xecQr1bF04XcbjIq48FHh88gJBDH8Haf6ergBZfpYx5danUBjdoSSU4SDBLLiiWsRBSMJIBbG2kMNrdGQnWn65ZLcIF8Y8P3CZhFCKjEw+FH42C8BqQ5Rs5w4DrwlWZYON99r7xRW3kx2qVwomwRv8ZXG6+D8+vbnUdJllLaPhItcx2m+lRuvBp2U05bB3a4K60np5HTO9j5hzyHdLV9/TjSj9/GDbUwhqmzVTm469zPY7WEFyiJDw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(39860400002)(376002)(396003)(366004)(8676002)(66446008)(66476007)(64756008)(316002)(6916009)(66556008)(4326008)(54906003)(52536014)(66946007)(2906002)(5660300002)(76116006)(8936002)(38100700002)(122000001)(9686003)(38070700005)(6506007)(86362001)(186003)(26005)(107886003)(33656002)(41300700001)(71200400001)(55016003)(83380400001)(478600001)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SElNV0IxOVZmSUowOHBuZWExQnJOd05TeGF5dUZxVS9ET0FFMWtRWTVNcHM4?=
 =?utf-8?B?ejROOUlkcTFHK1VDb2NYMnVhait0N0dCVjU0R01nWFB5WlpKd3VwTjNkYVp0?=
 =?utf-8?B?L2RZQ0tRTzhId0EzazhndEV5NnFoZzQ0NzZIRnppd3FlV2FLbDJ1UXVQTFlN?=
 =?utf-8?B?STVtSmJwbkhZNUtpQWxEd3BOcDZCYjhOQ015Y2E2RTJTMEVvdVVTaFN5RVpm?=
 =?utf-8?B?cWlSRGFMMGk1cFVpSnNGTmE3VTY5UG5Fa1FsckU2L0xIMHUzUlBaeE56Q0Ir?=
 =?utf-8?B?bER1RmNFNnk3MTdSWWE5TklicVFWc2xEeW4xSFo1cnVEZjl3WTV2Mi95V3Ew?=
 =?utf-8?B?Sm5OSmJPT2t3WmFsTVFOYS9lcVF0SVZ4MWFIcUhVeExFOVREd0d6Wk1naGd4?=
 =?utf-8?B?bG9vbXcvakwvdlh4YW1VK3ZxT2VkZ3kzL3ZyZHNEcmp6TXhneTNUN2VQa1dR?=
 =?utf-8?B?U1pjcWMvL3Z0b1NxTTd2cjd6by9ZS1AyNHBMSjV1K3o2Z2lXb3UxZWZCNDhL?=
 =?utf-8?B?NGQrNE1ieHRhNExMUGRrV3UvemNXdE9uK2VTWEsrN1dLOU5QZFNaZnV1YmNq?=
 =?utf-8?B?M1pJZGM5bm4wUG9KQ29VSjY0bUFDRFd4Y3M5TzBXRmtCZXdRQTVsY0Z3OXBh?=
 =?utf-8?B?b0J4a3R4QlA5eHlRSDFVbDZiZEpGOWwvRngxZlM5WmhyRG1WM2Q2Rkcxdjk2?=
 =?utf-8?B?dUVWZTlqeEw1citlYlZrQmNySlo3bThva09aZXlCUzJ3NGZiUFNTSzJ6djZt?=
 =?utf-8?B?ei9hcWVhZUVjSVAyeUF0dnZVb1I1cE03NlBrdTNBZnlMaCtueHVaeW83QlNq?=
 =?utf-8?B?aE9nNXpxOWNhTk1ielhyVS93bk1qbE5jZVJpSlM5cjQxY09naTI0akxtN1JG?=
 =?utf-8?B?dWJXQWViT2NwaktWajdYQ1NKTloyWUtQMGladi8rbWVMMEx0WmE5REF4RVV2?=
 =?utf-8?B?OXNHdjVJemVsUXM0aW5LYTl0bktYTWlRV21tODB0eFhabkpqU0V5eEtwdE1m?=
 =?utf-8?B?STJ4dnBsNmM0UTg2cUc2emd5dTg3b3NxUWIxOUtuNysxR0VFTkhTU2RsYjho?=
 =?utf-8?B?SjF3Y2hIS3lidDNyTGlsYjMrMENlVHN1QmYwa1NJS2lUNzN0T05HWkJOZVd4?=
 =?utf-8?B?RDhyWHlJaThwVlAzWktaNkx2ZXdxbUZRK1FVc0tTSnRNVW9Dc0tmMGZqZE1w?=
 =?utf-8?B?YUdDVVIrdzRCRkoySk5iWko4OGg1Y0NjbjVQd2JaN0VONHppNE5VcDdNTjUy?=
 =?utf-8?B?a1FDODNrbWh3VHhsN2VpWmFTZzRSWURsNWlTUHJETDVUUWltYVdRUUQrYU1w?=
 =?utf-8?B?K3l4TXV1anJXcEd3NllWSjVrL2lnUlNod3g3Mm8zdit4eHRqdnl2Uys2ZzFv?=
 =?utf-8?B?cy9vZnNRY0tlQmdJamhka0ZQanJRZUNuYlVzQmZBR0JhRXFLM2haS1kvLzVs?=
 =?utf-8?B?SEVsU1A5bko5RytMMzZIampJbGtabEpKN3gvb202RjJqeHF3U0N0c0hkTjJi?=
 =?utf-8?B?TnAvS1lBdldTZnR4S1FUTVRuMFV0eEhmcTlaRHJGU1FsZklzTU9MNm5zTktG?=
 =?utf-8?B?RzAzbmpvajZ4ODJVQllibUJoMEgxcEJNQktwNUZRUkRCOFVkM29YbjNtM0g1?=
 =?utf-8?B?aHdFeHNUY0dyMjBxTGJVWmhoeGRjQ3gzS2tjMldwNFZSVC9sNnhZTXFscW4z?=
 =?utf-8?B?a1Z0R2RZRXFCUGxneUZUVzBEbmplQmVGcE5pQ2hZU1lTc01sVHR2QVlZL21X?=
 =?utf-8?B?Q3lkSDllUk9FcEM5cTc4NTNQeDM5cUxQTnJLa1lDVVRCbHNEdjM4aFRiVEpw?=
 =?utf-8?B?M1hNc28wdzNtdVorTm5NLzIvc2FyY3RubCs4Y2V6TFlha2xNSHhJd0Nsamxr?=
 =?utf-8?B?UGpwOUc4T3A4ak5idmNHVktqdTE0eWRVeTVtc2Q3TXVFT3g5NmlqRWJzeElo?=
 =?utf-8?B?eExLMzZGUzRmS2htVlVabmtEU01pS0FDbnRZSng0dTBDdVZMT0xSTlVqamZP?=
 =?utf-8?B?cnRLV1JnUFRtUXJmTGdxa2EwSTFDcXNpSWlQUzhwZFVnZ2RkbU5KbDdzTDQ3?=
 =?utf-8?B?NDRMK2g2ODM5dmkxRHlNajR4bFBablJTK1M0TGlkc2ZoWG1pMlJEVlJXMWFx?=
 =?utf-8?Q?LDH2h/GOopefEw3D1iFc5GIOD?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfba0fae-c0de-48e4-52c9-08da880b23c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2022 09:04:25.1827 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P8kx0CDOlHoMfkBcPSuwYZzxpfYsNGY6kiHUrvT8fc4OpnzgrTkOHRYEYrB7sFqEf+ucy3oN/f8J4ouBR80R8tEYQptHbzpD40mTQHczlQ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2703
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
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gU3ViamVjdDogUmU6
IFtQQVRDSCAyLzJdIGRybTogcmNhci1kdTogVXNlICVwNGNjIHRvIHByaW50IDRDQyBmb3JtYXQN
Cj4gDQo+IEhpIEJpanUsDQo+IA0KPiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4NCj4gDQo+IE9u
IFRodSwgQXVnIDI1LCAyMDIyIGF0IDExOjM5OjA1QU0gKzAxMDAsIEJpanUgRGFzIHdyb3RlOg0K
PiA+IFJlcGxhY2UgdXNlIG9mIHN0cnVjdCByY2FyX2R1X2Zvcm1hdF9pbmZvIHdpdGggJXA0Y2Mg
Zm9yIHByaW50aW5nIDRDQw0KPiA+IGZvcm1hdHMuDQo+IA0KPiBUaGUgY29kZSBjaGFuZ2UgbG9v
a3MgZ29vZCwgYnV0IGRvZXNuJ3QgbWF0Y2ggdGhlIGNvbW1pdCBtZXNzYWdlLiBZb3UncmUNCj4g
bm90IHJlcGxhY2luZyB1c2FnZSBvZiBzdHJ1Y3QgcmNhcl9kdV9mb3JtYXRfaW5mby4gSSBwcm9w
b3NlIHRoZQ0KPiBmb2xsb3dpbmcgY29tbWl0IG1lc3NhZ2U6DQo+IA0KPiBVc2UgdGhlICVwNGNj
IGZvcm1hdCBzcGVjaWZpZXIgdG8gcHJpbnQgNENDcywgd2hpY2ggd2lsbCBwcm92aWRlIGEgbW9y
ZQ0KPiByZWFkYWJsZSBtZXNzYWdlIHRoYW4gdGhlIHJhdyBoZXggdmFsdWUuDQoNCk9LLg0KDQo+
IA0KPiA+IFJlcG9ydGVkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xp
ZGVyLmJlPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5l
c2FzLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9r
bXMuYyB8IDQgKystLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1
L3JjYXJfZHVfa21zLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfa21z
LmMNCj4gPiBpbmRleCAyMTg4MWZiNWU4NGEuLjhjMjcxOWVmZGEyYSAxMDA2NDQNCj4gPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2ttcy5jDQo+ID4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9rbXMuYw0KPiA+IEBAIC00MDUsOCArNDA1LDggQEAg
cmNhcl9kdV9mYl9jcmVhdGUoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgc3RydWN0DQo+ID4gZHJt
X2ZpbGUgKmZpbGVfcHJpdiwNCj4gPg0KPiA+ICAJZm9ybWF0ID0gcmNhcl9kdV9mb3JtYXRfaW5m
byhtb2RlX2NtZC0+cGl4ZWxfZm9ybWF0KTsNCj4gPiAgCWlmIChmb3JtYXQgPT0gTlVMTCkgew0K
PiA+IC0JCWRldl9kYmcoZGV2LT5kZXYsICJ1bnN1cHBvcnRlZCBwaXhlbCBmb3JtYXQgJTA4eFxu
IiwNCj4gPiAtCQkJbW9kZV9jbWQtPnBpeGVsX2Zvcm1hdCk7DQo+ID4gKwkJZGV2X2RiZyhkZXYt
PmRldiwgInVuc3VwcG9ydGVkIHBpeGVsIGZvcm1hdCAlcDRjY1xuIiwNCj4gPiArCQkJJm1vZGVf
Y21kLT5waXhlbF9mb3JtYXQpOw0KPiA+ICAJCXJldHVybiBFUlJfUFRSKC1FSU5WQUwpOw0KPiA+
ICAJfQ0KPiA+DQo+IA0KPiBUaGVyZSBhcmUgdHdvIG90aGVyIG9jY3VycmVuY2VzOg0KPiANCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfcGxhbmUuYw0KPiBi
L2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfcGxhbmUuYw0KPiBpbmRleCAyNmIyNWNh
NTg5NjguLjgzNjMxZWUyZmZmMSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JjYXIt
ZHUvcmNhcl9kdV9wbGFuZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJf
ZHVfcGxhbmUuYw0KPiBAQCAtNjI2LDggKzYyNiw4IEBAIGludCBfX3JjYXJfZHVfcGxhbmVfYXRv
bWljX2NoZWNrKHN0cnVjdCBkcm1fcGxhbmUNCj4gKnBsYW5lLA0KPiANCj4gIAkqZm9ybWF0ID0g
cmNhcl9kdV9mb3JtYXRfaW5mbyhzdGF0ZS0+ZmItPmZvcm1hdC0+Zm9ybWF0KTsNCj4gIAlpZiAo
KmZvcm1hdCA9PSBOVUxMKSB7DQo+IC0JCWRldl9kYmcoZGV2LT5kZXYsICIlczogdW5zdXBwb3J0
ZWQgZm9ybWF0ICUwOHhcbiIsIF9fZnVuY19fLA0KPiAtCQkJc3RhdGUtPmZiLT5mb3JtYXQtPmZv
cm1hdCk7DQo+ICsJCWRldl9kYmcoZGV2LT5kZXYsICIlczogdW5zdXBwb3J0ZWQgZm9ybWF0ICVw
NGNjXG4iLA0KPiBfX2Z1bmNfXywNCj4gKwkJCSZzdGF0ZS0+ZmItPmZvcm1hdC0+Zm9ybWF0KTsN
Cj4gIAkJcmV0dXJuIC1FSU5WQUw7DQo+ICAJfQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfd3JpdGViYWNrLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0v
cmNhci1kdS9yY2FyX2R1X3dyaXRlYmFjay5jDQo+IGluZGV4IDI1ZjUwYTI5N2MxMS4uOGNkMzdk
N2I4YWUyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X3dy
aXRlYmFjay5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfd3JpdGVi
YWNrLmMNCj4gQEAgLTE2Niw4ICsxNjYsOCBAQCBzdGF0aWMgaW50IHJjYXJfZHVfd2JfZW5jX2F0
b21pY19jaGVjayhzdHJ1Y3QNCj4gZHJtX2VuY29kZXIgKmVuY29kZXIsDQo+IA0KPiAgCXdiX3N0
YXRlLT5mb3JtYXQgPSByY2FyX2R1X2Zvcm1hdF9pbmZvKGZiLT5mb3JtYXQtPmZvcm1hdCk7DQo+
ICAJaWYgKHdiX3N0YXRlLT5mb3JtYXQgPT0gTlVMTCkgew0KPiAtCQlkZXZfZGJnKGRldi0+ZGV2
LCAiJXM6IHVuc3VwcG9ydGVkIGZvcm1hdCAlMDh4XG4iLCBfX2Z1bmNfXywNCj4gLQkJCWZiLT5m
b3JtYXQtPmZvcm1hdCk7DQo+ICsJCWRldl9kYmcoZGV2LT5kZXYsICIlczogdW5zdXBwb3J0ZWQg
Zm9ybWF0ICVwNGNjXG4iLA0KPiBfX2Z1bmNfXywNCj4gKwkJCSZmYi0+Zm9ybWF0LT5mb3JtYXQp
Ow0KPiAgCQlyZXR1cm4gLUVJTlZBTDsNCj4gIAl9DQo+IA0KPiBJIGNhbiBhZGQgdGhlc2UgY2hh
bmdlcyB0byB0aGUgcGF0Y2ggYW5kIHVwZGF0ZSB0aGUgY29tbWl0IG1lc3NhZ2Ugd2hlbg0KPiBh
cHBseWluZyBpZiB5b3UncmUgZmluZSB3aXRoIHRoYXQuIEluIHRoYXQgY2FzZSwNCg0KSSBhbSBv
ayB3aXRoIGl0Lg0KDQpJcyBpdCBwb3NzaWJsZSBmb3IgeW91IHRvIHNoYXJlIHRoZSBnaXQgdHJl
ZSB3aXRoIGxhdGVzdCBSQ2FyIERVIGNoYW5nZXM/DQpzbyB0aGF0IEkgY2FuIHJlYmFzZSBSQ2Fy
IERVIGxpYiBhbmQgUlovRzJMIERVIHdvcmsgb24gdG9wIG9mIHRoYXQuDQoNCkN1cnJlbnRseSBJ
IGFtIHJlYmFzaW5nIG9uIHRvcCBvZiBkcm1fdGlwLiBQbGVhc2UgbGV0IG1lIGtub3cuDQoNClRo
YW5rcyBhbmQgcmVnYXJkcywNCkJpanUNCg0KPiANCj4gUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGlu
Y2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gDQo=
