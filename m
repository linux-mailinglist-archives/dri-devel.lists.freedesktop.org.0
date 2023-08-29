Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FE078C743
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 16:20:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C524610E2A9;
	Tue, 29 Aug 2023 14:20:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2117.outbound.protection.outlook.com [40.107.113.117])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4211D10E2A9
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 14:20:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I9OtzuAb4IGd4vTtvwW7YEnLBcb/k1qxiQB6f938wY41+yn84XAmsluvDxz4Pyd+FCQexYRtN5GsBiRvbyBci7fez1D84SPmpXTbX+4QbjgOfHB+uJepjm7RdKYoFEVL/RG6aPlCqZipMOuOp2JC69ca6MdBXENh92BkYKBd0NwVTMn3Pw3AOAfB4GU6yIsJJrkAGAjDhO0hA+EB7u8suVcl26BUcgMr9TR5Cdaf7149O/wJAQN2YqFnHkVOrPi5rn1Q5M0mJoS6xtFw8907SpHDI9gppDxIcmsky7Ye2UgGT9uf9SjFELHmIhpwRs9gLvXIEvkjvDlVZKRaM2A0+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qZJjSZ8IuiFaDlzE5Y9qvYdXn+CDiEptQMFQ1zBCYtA=;
 b=SptJqtSJQp6gOo8o1lA3P8/Tmz1AMi8QCeBhP0eh/l4LTED7bGJHzXAv2K+KWtCcajZaUNxgXaD7k0Aa63mQnGivoCa9LXxJjOYMFC6HFPG2kKpU2t34D4vCiqZlcKyWDbvyNaep4RRN9VVTCol4SCiKq0qaHMWMVm49QWnmiQfiPZpiiYUQUeCMZ0/4mR6SBjjnq5ydnn4AmP27QnXP/6YmiGbwPhC1Hdqu3JLuqZ+K7R7BZ6covIx+vE01nf8Y/Vk1o2q7VUgzC0Rm1YGR6HcF4kJt02sFPAqZPhXJHOfPdnIUZA6T7tMwgAgmVIFKApeNRpV7ybo/mg+AI5XjuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qZJjSZ8IuiFaDlzE5Y9qvYdXn+CDiEptQMFQ1zBCYtA=;
 b=sRO/mS0QrDla7vMnIZbrZxvAtghWOx5TF4ILc7TeAowHnbo9Uuv1E07Mywtbs8pgCa+ew/cqb6utyI8A8pgPQJOd3VZnudmKSJb6/ts3a1RbWyzGg+t2GpApktH183eoIWhcP1pRGd5dk9UUs9VhoD7VMDdrRHAX74/hS+lvLAU=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB8905.jpnprd01.prod.outlook.com (2603:1096:604:17d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.18; Tue, 29 Aug
 2023 14:20:35 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706%5]) with mapi id 15.20.6745.015; Tue, 29 Aug 2023
 14:20:35 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH 6/7] drm: adv7511: Add link_config feature bit to struct
 adv7511_chip_info
Thread-Topic: [PATCH 6/7] drm: adv7511: Add link_config feature bit to struct
 adv7511_chip_info
Thread-Index: AQHZzhDRsApcRSBCykOc0I1MAiFyO7AA+meAgABxLZA=
Date: Tue, 29 Aug 2023 14:20:35 +0000
Message-ID: <OS0PR01MB5922A279C52F51C5FF3C515286E7A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230813180512.307418-1-biju.das.jz@bp.renesas.com>
 <20230813180512.307418-7-biju.das.jz@bp.renesas.com>
 <20230829073439.GB2302@pendragon.ideasonboard.com>
In-Reply-To: <20230829073439.GB2302@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB8905:EE_
x-ms-office365-filtering-correlation-id: d9289b3f-d914-46b3-e08f-08dba89b1c8f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Jyui5nKziEHYMLT9U17HJzCyO3HLM8ZFV9vsNw2RCD/6Yj2xL1u3CQz4c6kTXrb5wdwi3ecYE3g7CXBjfJANqX7hPRPkTdBsPtl+8QXHV4RM5yebz5mO1dpXaXCReMsRB0O5rt9kC8s9XUZ/ij8FfFlZcZqbmU5ruj7zAvQicxDOvq1upOmH+AtWLQEMdtZgVQDhH/gXkyDkA8fIPGCaV6YL/3pbn/V1dnjJl7RNYftr6tfHIUcAxkx1ZYE58Uor0uomv17QM1uzmdhCXVYyY9qEj5GCWe4CfoJsZ7nIEUk6t/H7+bt8m9505uBFMo24GPm6wgYQDFUaUXcrXO+/uuCj9kA3urr38CoWuwQxDWvFlonLlmtxcj8hZuEpz6FGBk/3fxcg5PjQejVuhZXdoXwixu++RUhM+UsMd0p06/WHhAKmMwt3IpxIPrfbMjKL2w7m5N9HbHNHVmlP8cn8XXMjvXIMctfp+ehw9Y5sJWdlG8CcCAVJKPuvBe6xg4vomxHFS4pGUlAXNVBicU6gsSHny3ENcnyGAFtdOGtpnap/tydQFLyi/ZLC6rzbXv+pzePnQk6dqh93MOgQnFj9mSNAkYMHPZlKOC73hzgdj1qLi2ULQxC6QGC4bqj4DJcW
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(346002)(396003)(366004)(136003)(1800799009)(186009)(451199024)(7416002)(2906002)(54906003)(76116006)(33656002)(64756008)(66446008)(66476007)(66556008)(66946007)(5660300002)(316002)(6916009)(55016003)(41300700001)(8936002)(4326008)(8676002)(52536014)(71200400001)(6506007)(7696005)(9686003)(38100700002)(38070700005)(122000001)(86362001)(478600001)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OWoxMy9PY1hOL2VveDVYT0NxbVprL1l5VUdwckxMT1dMaE01TUZ1ZW0vOE5j?=
 =?utf-8?B?VlFPWjFSbEozdnU4eTZzRFgxWENoek1WZ2UzVkNuZHBHbDJZV0hjMkFKa01x?=
 =?utf-8?B?WDNGUmlaWWIvMEh3bXR5M1hiMnZWdHRXWGtRR0dPQlFhNXVnUUhsOGxxSDN3?=
 =?utf-8?B?Y2lpM3lqWG5GaTFieUt5TlRIb3BQWUZpb2d5SDJ1NTdDSFA1OWJZMHBiaXNo?=
 =?utf-8?B?K1VTd0R4VlIyaXlIbDhmMUJ0STV5SGtnSGw2WlhRcTZnbUZTeFFtZWZQNHZv?=
 =?utf-8?B?dHEvU3VlOEdQb0k0NHRNVm01b1lkWlpiVVBleGNoOVFncVZWV2RuWVdwSURm?=
 =?utf-8?B?QnVleUdBSnN4VXhVN0pUVy91M2tBU0dTZTVieHMyeTRlUEp3SFJ3UlVrbWs1?=
 =?utf-8?B?TEExMzFRMHpVS3NQRnJZOW0vSmp3U1lGeHlhN240Q1JUSWFqeGpYUEI1dlVj?=
 =?utf-8?B?WmNJYnZoMytsbFFKSjMvMWdtaGFtdVR6Y1k5NEU4OWk1enlyaHJ0QTJVeHhJ?=
 =?utf-8?B?UFlkenVrelhMWi9yUXFrMVVha0hFVmJCb1JnUlVrL3VFQlhuUDJacjJRYkln?=
 =?utf-8?B?OWxCQTlYYjczeFVWRHIwMENsRnB3c1J0Vzg4UkVTV1cyS0RZSTRUWEF4cG1z?=
 =?utf-8?B?bGtyVDFKQkx3UXc5R3NWT2V4UlRQZnNRdzRmODlDNG05QnN5Z3F3UnhUQm9k?=
 =?utf-8?B?WHBMMzAwZmVvRXFvNlNxbDd2RWdFRHM5YjJkN1VRUkg4ZWNZWFFOb2FubXE2?=
 =?utf-8?B?d2JIekQ4MXVQc3p1bzg2T1YxSkE0NUZ3dlJIQ2dwSFUvSEJ5dFU0VWpsakdu?=
 =?utf-8?B?VG56NzJVQ2FLS3hmcVpndFZvU0dvYjMyaGdFRm13TXRmZVh2UExOdjQ5VWVX?=
 =?utf-8?B?bHhKclFsSTBxWnhJRytRUEowTzlSUGl2b1lGQ1VBNEoyak9pSHpLOVVJM05G?=
 =?utf-8?B?cUg4NXJyay9IV3pNVDBoOXBJSjhOZmVaRXM5eXhVenB4SzM0cUlZRUs5bndY?=
 =?utf-8?B?dXpuQzNJTjF0czVrSzFXNFdEOUkybzc0d2lKM3RTd3llNHhWVFRZTVVReHhk?=
 =?utf-8?B?d2FYbDN1VVJIZUdyMXRxL2VQRmZIY0JWR1hKV1RvekRiK0d5WUtqUmJVWWRm?=
 =?utf-8?B?Z0hNd09GSDFhUUJQNnU1SFNKamN4QWVIVGpqTDFVVC94bm1VaHVlQlBNckRH?=
 =?utf-8?B?V0ZaQSt1ZzFwUDBqQndhUWVMQ3VNZ2gwMVdFWGxLd2dqTmJPV0ZKWkIySVNv?=
 =?utf-8?B?RGJOTDhaMUF1bVY5OUxmRko0Q2dsR1ZYVUpVNzNtNms3a2N0ZExBdHk2K2lT?=
 =?utf-8?B?QmJUMzZ1U2p6Qy9WMEhZaUdleWNzQ0ZoeEtVMXF6N1haUmJBQ0ZVT2VwTGMw?=
 =?utf-8?B?NFdSSDBkc2dpYzNoUWxLNm16VnU4anZhOUttcHNma2dGYUI3SHVuT3Y0V0Yv?=
 =?utf-8?B?OXZoV2VFNHVJQXNSZGpUOFJJQmRocSt1Qm9wd05Ebi9zVXY4NmhvUVljY1Nq?=
 =?utf-8?B?L1NvT3J4Nm5rak1IalhBTFI1N0VDZU01UkE0VFh1ckt5bENBeElWM1VrZHg3?=
 =?utf-8?B?eExNQWVZRGJ4SjAxejJDOTJRZzcwcE1pWEpFdXo3aWN2WW90c0FpbnhaMzRi?=
 =?utf-8?B?U1VNcURndGlZOCs0VUo3emExNFF5Z0hCSG1RT0ROemZuTXl1dUNDempPMTZ4?=
 =?utf-8?B?dFJwSE0zTmZ4UnNoaGlkT1dSVzNYazF5dHFHeWRvdU1Bc2pnbC9VdGZLZytP?=
 =?utf-8?B?amFBcG9xL3M3RmQrODk3WUwvSzNNeFVUNGZ3aWRGTWp5ZlloV1NwWFIwNkxY?=
 =?utf-8?B?aHd2TGtpczg3OUJ3OFJrdFVSb3pYUHZ2dFpUd0Y1UmFLQ1duSU9zdXJkelNB?=
 =?utf-8?B?blZvdmhPQXpybnl5aHpJS21ienlvODBmZU8zT0NkTE9sTm5iQ0tSak5wWmJ2?=
 =?utf-8?B?b3UwWDhHV3paVVExcWo4am9XMFRUNFBxZWlvOU9PODY3YzFOaFFXU3owRzdC?=
 =?utf-8?B?aDNpUlB6Qnh4V01vV2RTNFV0WjRFUytQOHNmQkJuSXVjZWdOVFh4SnE5TUti?=
 =?utf-8?B?dVJ5bmFnSHJOZS9OaUxlQ2VkV2dEU0tWWVgwMEwyRDlNMEIrM1pYZDl4N1Bw?=
 =?utf-8?Q?2Q58=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9289b3f-d914-46b3-e08f-08dba89b1c8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2023 14:20:35.5123 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P6gVDyF1wiUz2QC3vVL2/S8EVBIiHlqSSL/bbcMHKuOdZR8lpRdtnB77a5I1dI+C5ICvix8BKISzRbu+ZEv+2NMIR8YQkhIiN1ClSnW2THU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8905
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Jonas Karlman <jonas@kwiboo.se>,
 Adam Ford <aford173@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Bogdan Togorean <bogdan.togorean@analog.com>,
 =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gU3ViamVjdDogUmU6
IFtQQVRDSCA2LzddIGRybTogYWR2NzUxMTogQWRkIGxpbmtfY29uZmlnIGZlYXR1cmUgYml0IHRv
DQo+IHN0cnVjdCBhZHY3NTExX2NoaXBfaW5mbw0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IFRoYW5r
IHlvdSBmb3IgdGhlIHBhdGNoLg0KPiANCj4gT24gU3VuLCBBdWcgMTMsIDIwMjMgYXQgMDc6MDU6
MTFQTSArMDEwMCwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gVGhlIEFEVjc1MTEgbmVlZHMgbGluayBj
b25maWd1cmF0aW9uIHdoZXJlYXMgQURWNzV7MzMsMzV9IGRvZXMgbm90DQo+ID4gbmVlZCBpdC4g
QWRkIGEgZmVhdHVyZSBiaXQgbGlua19jb25maWcgdG8gc3RydWN0IGFkdjc1MTFfY2hpcF9pbmZv
IHRvDQo+ID4gaGFuZGxlIHRoaXMgZGlmZmVyZW5jZS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6
IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTEuaCAgICAgfCAxICsNCj4gPiAgZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTFfZHJ2LmMgfCA3ICsrKystLS0NCj4g
PiAgMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+ID4N
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTEu
aA0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTEuaA0KPiA+IGlu
ZGV4IDJhMDE3YmIzMWExNC4uNjI3NTMxZjQ4Zjg0IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExLmgNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMS5oDQo+ID4gQEAgLTM0MCw2ICszNDAsNyBAQCBzdHJ1
Y3QgYWR2NzUxMV9jaGlwX2luZm8gew0KPiA+ICAJY29uc3QgY2hhciAqIGNvbnN0ICpzdXBwbHlf
bmFtZXM7DQo+ID4gIAl1bnNpZ25lZCBpbnQgbnVtX3N1cHBsaWVzOw0KPiA+ICAJdW5zaWduZWQg
aGFzX2RzaToxOw0KPiA+ICsJdW5zaWduZWQgbGlua19jb25maWc6MTsNCj4gDQo+IEkgd291bGQg
dXNlIGEgYm9vbCBoZXJlIHRvby4NCg0KT0ssIHdpbGwgdXNlIEJvb2xlYW4uDQoNCkNoZWVycywN
CkJpanUNCg0KPiANCj4gSSdtIG5vdCBlbnRpcmVseSBzdXJlIGFib3V0IHRoaXMgcGFydGljdWxh
ciBwYXRjaCwgaXQgc2VlbXMgdGhhdCB0ZXN0aW5nDQo+IHRoZSBjaGlwIHR5cGUgd291bGQgYmUg
YmV0dGVyLiBJJ20gbm90IHRvdGFsbHkgYWdhaW5zdCBpdCB0aG91Z2gsIHNvDQo+IA0KPiBSZXZp
ZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQu
Y29tPg0KPiANCj4gPiAgfTsNCj4gPg0KPiA+ICBzdHJ1Y3QgYWR2NzUxMSB7DQo+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExX2Rydi5jDQo+ID4g
Yi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMV9kcnYuYw0KPiA+IGluZGV4
IDY2YjNmOGZjZjY3ZC4uNjk3NGMyNjdiMWQ1IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExX2Rydi5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTFfZHJ2LmMNCj4gPiBAQCAtMTIwOCw3ICsxMjA4LDcg
QEAgc3RhdGljIGludCBhZHY3NTExX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICppMmMpDQo+ID4N
Cj4gPiAgCW1lbXNldCgmbGlua19jb25maWcsIDAsIHNpemVvZihsaW5rX2NvbmZpZykpOw0KPiA+
DQo+ID4gLQlpZiAoYWR2NzUxMS0+aW5mby0+dHlwZSA9PSBBRFY3NTExKQ0KPiA+ICsJaWYgKGlu
Zm8tPmxpbmtfY29uZmlnKQ0KPiA+ICAJCXJldCA9IGFkdjc1MTFfcGFyc2VfZHQoZGV2LT5vZl9u
b2RlLCAmbGlua19jb25maWcpOw0KPiA+ICAJZWxzZQ0KPiA+ICAJCXJldCA9IGFkdjc1MzNfcGFy
c2VfZHQoZGV2LT5vZl9ub2RlLCBhZHY3NTExKTsgQEAgLTEyOTcsNw0KPiArMTI5Nyw3DQo+ID4g
QEAgc3RhdGljIGludCBhZHY3NTExX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICppMmMpDQo+ID4N
Cj4gPiAgCWkyY19zZXRfY2xpZW50ZGF0YShpMmMsIGFkdjc1MTEpOw0KPiA+DQo+ID4gLQlpZiAo
aW5mby0+dHlwZSA9PSBBRFY3NTExKQ0KPiA+ICsJaWYgKGluZm8tPmxpbmtfY29uZmlnKQ0KPiA+
ICAJCWFkdjc1MTFfc2V0X2xpbmtfY29uZmlnKGFkdjc1MTEsICZsaW5rX2NvbmZpZyk7DQo+ID4N
Cj4gPiAgCXJldCA9IGFkdjc1MTFfY2VjX2luaXQoZGV2LCBhZHY3NTExKTsgQEAgLTEzNjIsNyAr
MTM2Miw4IEBAIHN0YXRpYw0KPiA+IHZvaWQgYWR2NzUxMV9yZW1vdmUoc3RydWN0IGkyY19jbGll
bnQgKmkyYykgIHN0YXRpYyBjb25zdCBzdHJ1Y3QNCj4gPiBhZHY3NTExX2NoaXBfaW5mbyBhZHY3
NTExX2NoaXBfaW5mbyA9IHsNCj4gPiAgCS50eXBlID0gQURWNzUxMSwNCj4gPiAgCS5zdXBwbHlf
bmFtZXMgPSBhZHY3NTExX3N1cHBseV9uYW1lcywNCj4gPiAtCS5udW1fc3VwcGxpZXMgPSBBUlJB
WV9TSVpFKGFkdjc1MTFfc3VwcGx5X25hbWVzKQ0KPiA+ICsJLm51bV9zdXBwbGllcyA9IEFSUkFZ
X1NJWkUoYWR2NzUxMV9zdXBwbHlfbmFtZXMpLA0KPiA+ICsJLmxpbmtfY29uZmlnID0gMQ0KPiA+
ICB9Ow0KPiA+DQo+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYWR2NzUxMV9jaGlwX2luZm8gYWR2
NzUzM19jaGlwX2luZm8gPSB7DQo+IA0KPiAtLQ0KPiBSZWdhcmRzLA0KPiANCj4gTGF1cmVudCBQ
aW5jaGFydA0K
