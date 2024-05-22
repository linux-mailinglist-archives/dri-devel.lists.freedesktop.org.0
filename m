Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6A28CBAD5
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 07:58:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66A6110E11E;
	Wed, 22 May 2024 05:58:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn
 (mail-sh0chn02on2100.outbound.protection.partner.outlook.cn
 [139.219.146.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C54AE10E11E
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 05:58:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R/MbTqOzmKzZrc/bVHVeNn90CSB/iPnuFuuv1JnhQaNKrLNC0mts+0PxeLh+yY0W/kumjNB1gPeTTze8sm0pafY1Wj1jltdbwnxW/UffqT4TFAeXygf7kOQbfwDK8F/6YK54AcsEXJB1vjs1DcfS8AK5yVdA6ohaKCbgSFHspeS2EAbj74Ibx3NZCB5rQqUty1VRe7/u9H6qYKLHpSqpy/nJmbcnbfPBx4K6WlLmmbWTDA+6Ygn3Ocnqec4MctaAYpYJ8ATJNrGImIHFxq5WNqzqzwWmRrbpEExTMv1Sb14MF1sq9H2JJyXynoBQe4MPUUWNrTCyVWmbRSCS9sgvOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AeZXmL0y9uTc0ob+YJvkQD44fPbgEFm+ivv1PkYmefs=;
 b=fkV0/D8EHYtM+OTtdS2QVNquJue/mvOdu4Uo7zAHzBuj9dR5vo5tLftz4REv9iC0S+EfL2ahW54bwyeavJtJ4Azz2+p0IJfDyu1tE0+IlWQ1DrBXBC+eUo+bjlu7JBN7+uCDXsa6JVnF6IJ5vvHar4TCpDLs0Br7Hu/YVda1otzbeSopQv9NHOx0vC/3sawzK/5urqXTwG5ci9ooP/21/1TZRiyYx5Iyga5Ci4wWTbfT27ULjUeKFgp3W94EwDdwCuofFnXFs0PWMv6aiez6LE1pcXi6Xff8kXelVKegYzHarwHA5y43QflfQ1z69hZ2Ah1CnzdJYxzIug77Fwr4UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:1::6) by NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:8::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Wed, 22 May
 2024 05:58:01 +0000
Received: from NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn
 ([fe80::eebb:dd26:e152:5c54]) by
 NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn ([fe80::eebb:dd26:e152:5c54%4])
 with mapi id 15.20.7587.035; Wed, 22 May 2024 05:58:00 +0000
From: Keith Zhao <keith.zhao@starfivetech.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Alex Bee
 <knaerzche@gmail.com>
CC: "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, "rfoss@kernel.org"
 <rfoss@kernel.org>, "jonas@kwiboo.se" <jonas@kwiboo.se>,
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
Subject: RE: [PATCH v4 02/10] drm/bridge: add common api for inno hdmi
Thread-Topic: [PATCH v4 02/10] drm/bridge: add common api for inno hdmi
Thread-Index: AQHaqyrBlb4I5AuQ+kOBcoEcy00DlbGh0weAgAABgQCAAMMbsA==
Date: Wed, 22 May 2024 05:58:00 +0000
Message-ID: <NTZPR01MB1050CA92FFE17AE1C9E38BF8EEEB2@NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn>
References: <20240521105817.3301-1-keith.zhao@starfivetech.com>
 <20240521105817.3301-3-keith.zhao@starfivetech.com>
 <58ddfc8f-1995-4f41-9d63-35a00c6f92b9@gmail.com>
 <20240521154206.GA1935@pendragon.ideasonboard.com>
In-Reply-To: <20240521154206.GA1935@pendragon.ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: NTZPR01MB1050:EE_|NTZPR01MB0956:EE_
x-ms-office365-filtering-correlation-id: c87aefa9-5730-43c8-46c7-08dc7a242338
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: k8yFhQ/c2GlrdZAJ9p6UyCZIOxeT+/HhSbKDlAxtMy9F2HiqtaGrSZ1uTSFlDfBgEg1PVnsiZZFpVpgxHEiyqFzJPAdro8BBH8TlY+sMrVE8B5lL+wDLOwooQgrKdXNvvVbDFFJn3RxH0m6a+J0EiIBLanC4EtdFpiPRvAaE/Q7HOh35oMs5h0+SPoCBqcP0+cseDirXFHzUaaZBFBXj/8M9YemYj7PeplowUDscw0Mbtfskt9t4ddvFZEe4a1myhDFGLJTGJ1O/Udvl4mmlkeM3KBhhSdCdcrqrIWiSqsGEnp8waAO+M7qLlvDX8Xk2jHQyoU5Ym4+bRe8QogHljXD2pwhCmN4GPB0wxKOQBAFp6fv6LJUNlEDAia61NWilC1BEM5BMhU2ywytNieZg39RNeZEAl5d/dW5tbl9qHols0OpQERdD7RZ2W2vbTAbz4ObwsstG46lsIB3XkFRouMjvI3SXZdilHk0cuXMVcLO2x6ZIF1ew7xIpkCnFfBnkMB+kFzupQMPmWyi07EzMKyg8A5TJ6iKoA9GA3VAZcmz4V2nUslWCM169X/LQBb6+EyPvIVbpYEsUFmiBZSBl25dllATDmfx4MRvpbo2tGHbBE0EEe8HRxSGTb0m26Ggi
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230031)(366007)(7416005)(41320700004)(1800799015)(38070700009); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Yi9LNmxyeVUzcmo2NnNMSEgrczlLVmVPTjh4aEp6MU55eGJuNngwQ3V1UWNu?=
 =?utf-8?B?bHRYVWpscm1xY3NYNllpM3lMTW52SUIvKzFTeG10L1V5MjZsbXd3ZzJCK015?=
 =?utf-8?B?bi9uREJnY0FoM3RLUDhVUkJMK0IvM2srUVAvc3NZM0dyZE8wMXIwRkhUb2xh?=
 =?utf-8?B?aDBLaE5ub0FzTDNFZnA2NGdQakVaT0tuRjU4QmJrajRJU3l4NUEzQXlxZ2pE?=
 =?utf-8?B?R3BXdE01RFdrWVRlUjMyWlQ0Y1FVdFY3NDFTdUUxcW1yYk1YWktrUFJNOElw?=
 =?utf-8?B?Umx3V3hYeEN5aHVWUzFqdDluQkxvYXFoMy82Tk96MWdiZFVqVTB2cDNsZHl0?=
 =?utf-8?B?N3hYckdhODU3V3VZMTFyRlhzRFBTVm1lR001MEluOEZ5THlGbi9FaGxSMUkw?=
 =?utf-8?B?VWs5bi9VdGlLUzAyTVNJUWpBQTRHeHdGcmZmUDVaYW1jRzl3dDlxUm02RVZl?=
 =?utf-8?B?UmUxN1UzeUloR1NBSEJ4TkZsa1J5Y2VMQXB3c0F3VmFxT1dNNndZZ0RIVDUz?=
 =?utf-8?B?VkU3cG56YTJkMkd3aTYyMGFOSzQxUjN1dU9sYXdKdzJmK29iNlFDOEtyVVdn?=
 =?utf-8?B?eTRKSnoxUXNhRHpqcWVVNGwvdFNieEJ1WnNxODBVUW5TWmYwbkJtdGx2WGti?=
 =?utf-8?B?Y3RiS096UTJSdkl0SFVWcUlQV1J2empjUFJwenVPT05oelZXa2NXTVh3QXlE?=
 =?utf-8?B?cW5ic00rcFZQbjFYVi81RmN2bkdtM3Y4NEpqSC9waVFUWTV2TlRGbjg1bVht?=
 =?utf-8?B?aktld09Pdk1UMFQ2YTY1UTNVemlYZ1NUTDl5amZOSUo2emt5OW1JcU5rZFFI?=
 =?utf-8?B?M2NJY0dML3BwZC96RVJQR2ZxYnhyY01yNlV0SUpYWC9wd200aU8xOXVHTXkz?=
 =?utf-8?B?bWdPcFREVStzSlpXcGJybXJQSDY5TXJWeXArd3Z3LytZY2IzYlhTd1NIMTFp?=
 =?utf-8?B?STFXeHJxdnhudFdjTWU5cjBVV1dQY3NRTkxJUW5IZlZxMk9Ed3dDNnYzbExh?=
 =?utf-8?B?MlBJRjhTNVVETHh1Ym9DUnYyTFVKNHh5cUJacVJvUW5uZC9oWmRheHBBbnht?=
 =?utf-8?B?R2hHdkdhdWg0MWY4U0x3ZGpyMjk4eG1rOUV0YTFHN3B0dXVXSjhTeFFNYitu?=
 =?utf-8?B?aUw3NDRQazRUMmlnN2Y3NTljb2w5TWovdE5CL1ZpN2d6eTFFUzF3MWlVcGNa?=
 =?utf-8?B?aXZ3NzlFSnFQWnVSMVdiYTRpWkltYmJaZFVld09jVVhaYlZjbW5oRWorcVJY?=
 =?utf-8?B?dHRKZEl6bkgyaThWTmYvOFcycUYxYzlWRGxnMGhRSFdzU2hxZkxRV3NqZVFw?=
 =?utf-8?B?a3QvZjlRcE1UUDlreFVxU0lyZ0ZVQi83WXRNN3QxaGw1M1BSekg4UUJrSnk1?=
 =?utf-8?B?UHNwU3FLZjQ1SHVPRGZXMG1CMGVHMklTMnZTTWNlWFlLSktOWDAzNUJMRTJE?=
 =?utf-8?B?TU9oVFQzUVc2a0FKandOTnNlN2s1eVlnUFNzbkFHc0dLWllLMTl6eGhyZkMv?=
 =?utf-8?B?MHRCbVFrTVlrVG5uUWxnZzZsVkZMSjNRdTRvclBYRndNSFpoMm5LV0xIMVV6?=
 =?utf-8?B?OHpVTGpwK1lpUnluOVgxcVdBR2FlV0g2bFp0U3dBK2luN0h3STc4OXZURUVt?=
 =?utf-8?B?YU1ZKzl1UUNzTGFaN0phV0Q0LzRvS3JxYTg5cksvVDIyaUxyWWtMdGR2Z0R3?=
 =?utf-8?B?T1dvclFYeHdFVDZBektPNTNxcktnSHVEeGM4RUN4VEd1SzA2M1kwenBNTzZi?=
 =?utf-8?B?Y3N5KzBDK0FVUGpZWFgrS2RkbTBOUGhGaXlsb1pCUmVNaUJ4dzVTTjRpdGo0?=
 =?utf-8?B?T2NKeFNzc01lU0pjVTR0U0w3bmc3cFZMNDIxa2pPVFZJa0hmQXI5RE13YlVQ?=
 =?utf-8?B?eXIzSWZ2em5yQmtEQ2F6R3M0dG5DWnJiYlYxNjBEMGtISUhrTkhwSGtRUE1y?=
 =?utf-8?B?Q0ZpQWxmQ3VBM2NUcTVPcjk3RXY2WmF1NVE3N0xxRkJNbmowRTVLUG5Ba0xo?=
 =?utf-8?B?cm56YmFNZm9tWGF5bkFabWhwcG8rV082OS9QYmRlZ3FSeGxWV3oydTBHVHBB?=
 =?utf-8?B?b29qZ0VXa1lyMGQvREhLaTNyY3BsMXB0czJoaG5lYkFHZnRwaUlkQlYxeDdW?=
 =?utf-8?B?eVh1ZHNzYS8rMW4wQlE4OGJ3UXRUd2VPd0FxMXFUaVJJcFhQc0YxanhjaUI1?=
 =?utf-8?B?bEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: c87aefa9-5730-43c8-46c7-08dc7a242338
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2024 05:58:00.7681 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dmvgn4w5rTSWScQfvjUowC8YxDsD4DZzFW/AY06mi1StXI6OR1KWaoOz+igf88lBzMa5zGyH7EIaBFCqogA4GoQcT709ayQHcxm3/c7+JKU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NTZPR01MB0956
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

SGkgQWxleCwgTGF1cmVudDoNCg0KSSB3YW50IHRvIG1ha2UgYXMgZmV3IGNoYW5nZXMgYXMgcG9z
c2libGUgb24gdGhlIGN1cnJlbnQgYmFzaXMsIGFuZCBhZGQgYnJpZGdlX2Z1biwgDQoNCg0KPiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVy
ZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+DQo+IFNlbnQ6IDIwMjTlubQ15pyIMjHml6Ug
MjM6NDINCj4gVG86IEFsZXggQmVlIDxrbmFlcnpjaGVAZ21haWwuY29tPg0KPiBDYzogS2VpdGgg
WmhhbyA8a2VpdGguemhhb0BzdGFyZml2ZXRlY2guY29tPjsgYW5kcnplai5oYWpkYUBpbnRlbC5j
b207DQo+IG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc7IHJmb3NzQGtlcm5lbC5vcmc7IGpvbmFz
QGt3aWJvby5zZTsNCj4gamVybmVqLnNrcmFiZWNAZ21haWwuY29tOyBtYWFydGVuLmxhbmtob3Jz
dEBsaW51eC5pbnRlbC5jb207DQo+IG1yaXBhcmRAa2VybmVsLm9yZzsgdHppbW1lcm1hbm5Ac3Vz
ZS5kZTsgYWlybGllZEBnbWFpbC5jb207DQo+IGRhbmllbEBmZndsbC5jaDsgcm9iaEBrZXJuZWwu
b3JnOyBrcnprK2R0QGtlcm5lbC5vcmc7IGNvbm9yK2R0QGtlcm5lbC5vcmc7DQo+IGhqY0Byb2Nr
LWNoaXBzLmNvbTsgaGVpa29Ac250ZWNoLmRlOyBhbmR5LnlhbkByb2NrLWNoaXBzLmNvbTsgWGlu
Z3l1IFd1DQo+IDx4aW5neXUud3VAc3RhcmZpdmV0ZWNoLmNvbT47IHAuemFiZWxAcGVuZ3V0cm9u
aXguZGU7IEphY2sgWmh1DQo+IDxqYWNrLnpodUBzdGFyZml2ZXRlY2guY29tPjsgU2hlbmd5YW5n
IENoZW4NCj4gPHNoZW5neWFuZy5jaGVuQHN0YXJmaXZldGVjaC5jb20+OyBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnOw0KPiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgt
a2VybmVsQHZnZXIua2VybmVsLm9yZzsNCj4gbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRl
YWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMDIvMTBdIGRybS9icmlkZ2U6IGFkZCBj
b21tb24gYXBpIGZvciBpbm5vIGhkbWkNCj4gDQo+IE9uIFR1ZSwgTWF5IDIxLCAyMDI0IGF0IDA1
OjM2OjQzUE0gKzAyMDAsIEFsZXggQmVlIHdyb3RlOg0KPiA+IEhpIEtlaXRoLA0KPiA+DQo+ID4g
dGhhbmtzIGEgbG90IGZvciB3b3JraW5nIG9uIHRoaXMuIFNlZSBzb21lIGdlbmVyYWwgcmVtYXJr
cyBiZWxvdw0KPiA+DQo+ID4gQW0gMjEuMDUuMjQgdW0gMTI6NTggc2NocmllYiBrZWl0aDoNCj4g
PiA+IEFkZCBJTk5PIGNvbW1vbiBhcGkgc28gdGhhdCBpdCBjYW4gYmUgdXNlZCBieSB2ZW5kb3Ig
ZHJpdmVycyB3aGljaA0KPiA+ID4gaW1wbGVtZW50IHZlbmRvciBzcGVjaWZpYyBleHRlbnNpb25z
IHRvIElubm9zaWxpY29uIEhETUkuDQo+ID4gPg0KPiA+ID4gU2lnbmVkLW9mZi1ieToga2VpdGgg
PGtlaXRoLnpoYW9Ac3RhcmZpdmV0ZWNoLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gICBNQUlOVEFJ
TkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKw0KPiA+ID4gICBk
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25maWcgICAgICAgICAgICAgICAgfCAgIDIgKw0KPiA+
ID4gICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL01ha2VmaWxlICAgICAgICAgICAgICAgfCAgIDEg
Kw0KPiA+ID4gICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2lubm9zaWxpY29uL0tjb25maWcgICAg
fCAgIDYgKw0KPiA+ID4gICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2lubm9zaWxpY29uL01ha2Vm
aWxlICAgfCAgIDIgKw0KPiA+ID4gICAuLi4vZ3B1L2RybS9icmlkZ2UvaW5ub3NpbGljb24vaW5u
by1oZG1pLmMgICAgfCA1ODcNCj4gKysrKysrKysrKysrKysrKysrDQo+ID4gPiAgIC4uLi9ncHUv
ZHJtL2JyaWRnZS9pbm5vc2lsaWNvbi9pbm5vLWhkbWkuaCAgICB8ICA5NyArKysNCj4gPiA+ICAg
aW5jbHVkZS9kcm0vYnJpZGdlL2lubm9faGRtaS5oICAgICAgICAgICAgICAgIHwgIDY5ICsrDQo+
ID4gPiAgIDggZmlsZXMgY2hhbmdlZCwgNzY2IGluc2VydGlvbnMoKykNCj4gPiA+ICAgY3JlYXRl
IG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvaW5ub3NpbGljb24vS2NvbmZpZw0K
PiA+ID4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9pbm5vc2ls
aWNvbi9NYWtlZmlsZQ0KPiA+ID4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9pbm5vc2lsaWNvbi9pbm5vLWhkbWkuYw0KPiA+ID4gICBjcmVhdGUgbW9kZSAxMDA2
NDQgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9pbm5vc2lsaWNvbi9pbm5vLWhkbWkuaA0KPiA+ID4g
ICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9kcm0vYnJpZGdlL2lubm9faGRtaS5oDQo+ID4g
Pg0KPiA+IC4uLi4NCj4gPg0KPiA+ID4gKwlkcm1fZW5jb2Rlcl9oZWxwZXJfYWRkKGVuY29kZXIs
IHBkYXRhLT5oZWxwZXJfcHJpdmF0ZSk7DQo+ID4gPiArDQo+ID4gPiArCWhkbWktPmNvbm5lY3Rv
ci5wb2xsZWQgPSBEUk1fQ09OTkVDVE9SX1BPTExfSFBEOw0KPiA+ID4gKw0KPiA+ID4gKwlkcm1f
Y29ubmVjdG9yX2hlbHBlcl9hZGQoJmhkbWktPmNvbm5lY3RvciwNCj4gPiA+ICsJCQkJICZpbm5v
X2hkbWlfY29ubmVjdG9yX2hlbHBlcl9mdW5jcyk7DQo+ID4gPiArDQo+ID4gPiArCWRybW1fY29u
bmVjdG9yX2luaXQoZHJtLCAmaGRtaS0+Y29ubmVjdG9yLA0KPiA+ID4gKwkJCSAgICAmaW5ub19o
ZG1pX2Nvbm5lY3Rvcl9mdW5jcywNCj4gPiA+ICsJCQkgICAgRFJNX01PREVfQ09OTkVDVE9SX0hE
TUlBLA0KPiA+ID4gKwkJCSAgICBoZG1pLT5kZGMpOw0KPiA+ID4gKw0KPiA+DQo+ID4gSSByZWFs
bHkgZG9uJ3Qgd2FudCB0byBhbnRpY2lwYXRlIGJyaWRnZSBtYWludGFpbmVyJ3MgZmVlZGJhY2ss
IGJ1dA0KPiA+IG5ldyBicmlkZ2UgZHJpdmVycyBtdXN0IG5vdCBjb250YWluIGNvbm5lY3RvciBj
cmVhdGlvbi4gVGhhdCBtdXN0DQo+ID4gaGFwcGVuIHNvbWV3aGVyZSBlbHNlLg0KPiANCj4gWW91
J3JlIGFic29sdXRlbHkgcmlnaHQgOi0pIENvbm5lY3RvciBjcmVhdGlvbiBzaG91bGQgYmUgaGFu
ZGxlZCBieSB0aGUNCj4gZHJtX2JyaWRnZV9jb25uZWN0b3IgaGVscGVyLiBUaGUgSERNSSBicmlk
Z2UgZHJpdmVyIHNob3VsZCBmb2N1cyBvbiB0aGUNCj4gSERNSSBicmlkZ2UgaXRzZWxmLg0KDQpz
dGF0aWMgaW50IGlubm9fYnJpZGdlX2F0dGFjaChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLA0K
CQkJCSBlbnVtIGRybV9icmlkZ2VfYXR0YWNoX2ZsYWdzIGZsYWdzKQ0Kew0KCXN0cnVjdCBpbm5v
X2hkbWkgKmhkbWkgPSBicmlkZ2VfdG9faW5ubyhicmlkZ2UpOw0KDQoJaWYgKGZsYWdzICYgRFJN
X0JSSURHRV9BVFRBQ0hfTk9fQ09OTkVDVE9SKSB7DQoJCURSTV9FUlJPUigiRml4IGJyaWRnZSBk
cml2ZXIgdG8gbWFrZSBjb25uZWN0b3Igb3B0aW9uYWwhIik7DQoJCXJldHVybiAtRUlOVkFMOw0K
CX0NCgloZG1pLT5jb25uZWN0b3IucG9sbGVkID0gRFJNX0NPTk5FQ1RPUl9QT0xMX0hQRDsNCg0K
CWRybV9jb25uZWN0b3JfaGVscGVyX2FkZCgmaGRtaS0+Y29ubmVjdG9yLA0KCQkJCSAmaW5ub19o
ZG1pX2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3MpOw0KDQoJZHJtbV9jb25uZWN0b3JfaW5pdChkcm0s
ICZoZG1pLT5jb25uZWN0b3IsDQoJCQkgICAgJmlubm9faGRtaV9jb25uZWN0b3JfZnVuY3MsDQoJ
CQkgICAgRFJNX01PREVfQ09OTkVDVE9SX0hETUlBLA0KCQkJICAgIGhkbWktPmRkYyk7DQoNCglk
cm1fY29ubmVjdG9yX2F0dGFjaF9lbmNvZGVyKCZoZG1pLT5jb25uZWN0b3IsIGVuY29kZXIpOw0K
fQ0KDQpzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9icmlkZ2VfZnVuY3MgaW5ub19icmlkZ2VfYXR0
YWNoID0gew0KCS5hdHRhY2ggPSBpbm5vX2JyaWRnZV9hdHRhY2gsDQp9Ow0KDQpDb25uZWN0b3Ig
Y3JlYXRpb24gaXMgaGFuZGxlZCBieSB0aGUgZHJtX2JyaWRnZV9mdW5jcyAtPmF0dGFjaC4NCklz
IGl0IG9rPw0KDQpSZWdhcmRzDQpLZWl0aA0KPiANCj4gPiBBbHNvIEknbSBuZWl0aGVyIHNlZWlu
ZyBhbnkgZHJtX2JyaWdlIHN0cnVjdCBub3IgZHJtX2JyaWRnZV9mdW5jcywNCj4gPiB3aGljaCBh
cmUgYm90aCBlc3NlbnRpYWwgZm9yIGEgYnJpZGdlIGRyaXZlci4gSSBkb24ndCB0aGluayBtb3Zp
bmcgYQ0KPiA+IHBhcnQgb2YgYSBkcml2ZXIgdG8gLi4uL2RybS9icmlkZ2UvIG1ha2VzIGl0IGEg
YnJpZGdlIGRyaXZlci4NCj4gPg0KPiA+ID4gKwlkcm1fY29ubmVjdG9yX2F0dGFjaF9lbmNvZGVy
KCZoZG1pLT5jb25uZWN0b3IsIGVuY29kZXIpOw0KPiA+ID4gKw0KPiA+ID4gKwlyZXR1cm4gMDsN
Cj4gPiA+ICt9DQo+ID4gPiArDQo+ID4gLi4uLg0KPiA+DQo+IA0KPiAtLQ0KPiBSZWdhcmRzLA0K
PiANCj4gTGF1cmVudCBQaW5jaGFydA0K
