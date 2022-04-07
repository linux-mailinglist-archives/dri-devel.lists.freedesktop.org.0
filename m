Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5140B4F79C8
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 10:31:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2246110E9FD;
	Thu,  7 Apr 2022 08:31:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80084.outbound.protection.outlook.com [40.107.8.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68EAA10E9F2
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 08:31:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FWdQAoSsiq8Hcke5Ps5e4KIZBvfzhFgIH28GvGk5qpBj8KPNin9YlnmAw1XjstUAMy5mWtnDT+NO9hFdrMIvu7Il+oxiWK6nK3sIMVmWR7uCi0UliVDWzTqEoQfUB415yNbEEl7274WY30pGtZ44Quwesb9ptC3w6koeOOqfwUhK5FGbIFpVTCNYw8w3IPIzdzZ4x8KmtweJet7PRjWldPaNGgA7vqTQCT+nKchmuE5fdiru61b6LAx7K89MEKNrmtG1OwSzI5VgWdHx+sWyr69DOET+RqUtOgK2zS7Mc4bV+j2IcJy9T0c6R2i1IJECnT/NF5Rlh519q85YcDpK+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uGTr5uDFV/8zk0Z2jT5GpKr5+kiZDbzU5uUmAZ9JIPs=;
 b=jqfgMv/DnMYMfqtn31a1AGMtZ7reijeuuRX2hobKa3erlLx64gz647js1/6wpRyzrw9V+lDkNB6DkOapNHoZXvG1M8JuvsrEtkXWee1gM2Ny6aEIEAB8vFd9vr2p5rDxRDBlQsO+ss41dMt2SWYZQQb1TvwdgYnEB9CZ7Z6y8KQYTgTBctfe+KhgtL+0UWewoFGQoCKGJ2A1jjJB5awLkjEompEtsRmEdHYZAmCWjkJpjkaq8wpZ+KCkAMH4dsXqgsf4yWdgervNwmOW+WNuHxsd8pYzRdQoWyGWz6DLJaTSKRkNfCCjJVHRRvfqo3iV277BeFLYWQp7nbc8HBTf2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uGTr5uDFV/8zk0Z2jT5GpKr5+kiZDbzU5uUmAZ9JIPs=;
 b=rqZX9SE1ezUUib94it7Lu7jx24vyL7kgIKc96Im1xmwfOQgz8uAbCZpTh4ATsJFZ0zI12JF1QtvlW4KIgSmjRWOHOGVzy6Lbinsiej7ckTcpWD3H8W6m8zIx/6fV6kD8ehrM8hUKqG6XNKF2nzeHJDB23cx91s4LbbXPW3jXShY=
Received: from DB7PR04MB5450.eurprd04.prod.outlook.com (2603:10a6:10:86::11)
 by VE1PR04MB6717.eurprd04.prod.outlook.com (2603:10a6:803:129::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Thu, 7 Apr
 2022 08:31:31 +0000
Received: from DB7PR04MB5450.eurprd04.prod.outlook.com
 ([fe80::dcb:d345:1503:d921]) by DB7PR04MB5450.eurprd04.prod.outlook.com
 ([fe80::dcb:d345:1503:d921%7]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 08:31:31 +0000
From: Sandor Yu <sandor.yu@nxp.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>, "robert.foss@linaro.org"
 <robert.foss@linaro.org>, "Laurent.pinchart@ideasonboard.com"
 <Laurent.pinchart@ideasonboard.com>, "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>
Subject: RE: [EXT] Re: [PATCH v1 3/5] drm: bridge: dw_hdmi: Enable GCP only
 for Deep Color
Thread-Topic: [EXT] Re: [PATCH v1 3/5] drm: bridge: dw_hdmi: Enable GCP only
 for Deep Color
Thread-Index: AQHYSYkU0Pmm2kwPDEuESvcSh60xgazim/sAgAF5I+A=
Date: Thu, 7 Apr 2022 08:31:31 +0000
Message-ID: <DB7PR04MB54508F0ACD00B482201D7916F4E69@DB7PR04MB5450.eurprd04.prod.outlook.com>
References: <cover.1649230434.git.Sandor.yu@nxp.com>
 <ebd9830fe35d79153cb0051bed0d255fb004fb63.1649230434.git.Sandor.yu@nxp.com>
 <203a2b93-a842-8cf2-b265-864f520c16a6@baylibre.com>
In-Reply-To: <203a2b93-a842-8cf2-b265-864f520c16a6@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 689c371f-a4ef-489b-6843-08da187104ea
x-ms-traffictypediagnostic: VE1PR04MB6717:EE_
x-microsoft-antispam-prvs: <VE1PR04MB67174E4A0620F1EC3CF737E8F4E69@VE1PR04MB6717.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: C9RZLa1r3Pnvb0J4XzrLixkPdAme0uOi1mpoHqxEtBWpdcR0lzP+tv+RuUgIShBnbhXOqDmqJ41cU/XvbmPt/3Y1ARTVq34vjdWYDc+90B5xmIhoBVGsXHX3sINMTFHJcNksTUuF7Y7ViBIlllqzJR0Yvl5U9ChvLJUqZNtWqrhgMuk2w4GRg8erHt7VF9tHbk/h4D520PVDzxWwVT6uHTgY1hJLVmx2xESXh9P9p5RrbwtZyVYabLI/h/W6+QNvU4PPoF7cXSaL1pqHsYCzEQcAjKcf8IZBxrNbORG2eSrT/RXrbu/IJ+PxVGVtaHw2DXPe/EbKk1Fc5v1cYShgaETzZnt266Gi1jCjFTKZCZtNU0fMikj5vLPY34J+d5NMHAks+NkKS4RlSV8iwIfb/NwJWoAPYRpuTY4sklKV/2L1mpeMvl3Uzm7Gy9zR1YOO2BKxwhKJbzy3bSTJ0oZ8XahxT7JkmsuCodrh1tTyYP96zPpKzi9KW/RFqGzfJXa+jya0G76zqLIUreR+KomAzZytjxJAoearyAZRIUOCUKSLOGnCXhtZphYwgdEh40MHnWtfZ9CsE/sQZT9tycnOLM1NJuiEysilzmb5KjpmWTRrIlccMf+XCVF2gF6wb2vGF0TW6zH5Qu3gitEsFwTrIf5WSC+OwOL/mo3JHgVPGLubFInhgclr9TG+7CsSlDZ7oX3DQKoOKTfqGGmLWoLu1g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7PR04MB5450.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(8676002)(4326008)(83380400001)(64756008)(76116006)(66446008)(66476007)(53546011)(5660300002)(66946007)(66556008)(55016003)(33656002)(86362001)(38070700005)(8936002)(7416002)(9686003)(6506007)(71200400001)(44832011)(52536014)(7696005)(316002)(110136005)(38100700002)(508600001)(122000001)(186003)(54906003)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RUpXekF5L3plYnhPV1pxSCtGU256cVQxUlhnSk9pUWZDczVVT0RwbDRlWnJ4?=
 =?utf-8?B?QnNaU01iNHB5Z2ZmbzRka1E5SzdMbGJQT282UjZEbnlSRDNScThsRFRHQ3E5?=
 =?utf-8?B?T3M0UnlYd1FuTmsvU1VKcnJSSlRSN3RDTTJTTzlDckpyVlIwbU02UllLQTlZ?=
 =?utf-8?B?WkpIN2R2SlRFVFljaVJzTFBXNHNIWWRtZW5ISytZRHdZUnZpbmdaV0JsamV3?=
 =?utf-8?B?amY1Q2g4TUNTUVJ1NTFrSEp4d2lNNDhBTGREcFcwd0RMa2xkM1FVNS9sMmlq?=
 =?utf-8?B?bW05TXFqdHk1RTlleU16ckNtV3dxckFoemt1UEhLM3hQeGRhSTE1eHArSUo5?=
 =?utf-8?B?cktVYjZKMGZMTHVGTzdKZkNWU09MYmNMa2pjY1NPWjhnY2RuOHdTaCt5RWRZ?=
 =?utf-8?B?VVFjT2E5NEJpZ0F0L2lkQmpXRkhvUXN5WU5RM3NhcmRRY0FndE5BQ1hDS2dy?=
 =?utf-8?B?aXNMdnBuazBSOXAwRnF2UU8xUExaaFBMUWltUmxqajNadkpVQXNUWkg2eDJj?=
 =?utf-8?B?SFl4MklOVGV5SUVCSkFnQTRPQTRyMmtxNHlBOXE4bnI1L1QzWS9YWDVjL0xL?=
 =?utf-8?B?MmVmZVhkandMQkpDVE51UnVodmJPWEJrQi9tU3BrTjUxVG5WSzg2N3oyWWI2?=
 =?utf-8?B?M0VDelBxTlZHZnpyaGlFUXhSVGlUSFlLek83RkVGU1VqWkhhRVVLblRDcHhM?=
 =?utf-8?B?KzJkWmg2dlltUUhaWjlxaWExQmtOME96YTNqNmFZY2hnWmFLOXJlUzVNMm9J?=
 =?utf-8?B?RHpYTXF1UVJaMTlGWFBMMkVtVWJNZFFSRXl2YmVWaGR6azZweUtrYVF3bktE?=
 =?utf-8?B?Z2NGYWxsdUxiSEJNTmpMSmJWQ1hCQStKeTZmRDVSMnBCRXJXdFozcWI0UnV1?=
 =?utf-8?B?UG9wK0k4UDhmU09HUnhoZXhmYk1IK04ram5QR1R3QTFTeVM2WDNDNDVpbFZm?=
 =?utf-8?B?enhpY3N1S1o3WmRkTWJ3QU4yRThIdUJkT25MUXFOQ2ZxK0pUSjlzSncwWFhs?=
 =?utf-8?B?MzcyaUw1L1BkMGNGN2JUY1ZWYzFjNnNrbzkrWnBTK1dRV2JodXJNTGpoNk5m?=
 =?utf-8?B?OVYrK05lS1c3b1NuU1lScGtBT1p5cjIyblhaSEQ1cnlUZy81UFU0WFdtcSs4?=
 =?utf-8?B?dGh0WEFOcGVUaDU0VEdTTDZWWnlNMldZaytqOE5aUmN2UkMrVzhOMFZjcVVm?=
 =?utf-8?B?SWdaMytkYlhPbGxZa2UxTUhvVmh1WGkwQ25XNGI0Sjl6UmszeTBrQTRZME9t?=
 =?utf-8?B?dVBsOWVuTXhoY2IvR2dCOUh5SHUrR1BFaS90c3lkU0t6MElCVWZuNlRxbEUy?=
 =?utf-8?B?MWQvNkJ0ZDU5YXZyUURVOHRXdHcxei9DVDFsc2NSemFLaHpVUVNESVFMTzYw?=
 =?utf-8?B?clFzM05RRXAvL1JyRzdpS05CNmJydHlZM2hrWFJhSmp6UlI4SXZDendHeGk4?=
 =?utf-8?B?VENSZU45Y3FrWloxdU5BYjZLS2hIKzNOemc4czRLL256U1ZqejYyZk5GQXpw?=
 =?utf-8?B?SDc3bmliKy9mMUtZOEY5VVdBM0JieUF2L3l6T2oraWJBT3JWVFdiYzBnam8r?=
 =?utf-8?B?d2pzVXZ2VC93T2tnSytkZ3FITDlpNm55TkcvZU5OY2NDSUZSanhSOVFYbnhX?=
 =?utf-8?B?czZvbkQyaDE0d0lPMCtORGhrVWcvYWJKNHRhUW5KcTJ0RUlKNGtNUndnYW1D?=
 =?utf-8?B?bWdrY0ZxOG5rL2xhdnBXb2UvR3N0SzA0bVdQWjZxRmg4MWtSK3A2NDBIU3o3?=
 =?utf-8?B?MWdZbFJrUE5mQmhqbWRSS2hwS2tHUENxNTNUKzZ6dkM2aHpVY1NSb2dYS1lJ?=
 =?utf-8?B?cG1UZUlrZWlGS3lrdGNWWTc4ZXllbmdwSkM0NmRBQjR1N3JaRXVyZkc3RXdR?=
 =?utf-8?B?OUtVWVFoNlBKd1E3bGZMaDdMd0lnVDhUMWtLaXY3dVNFbUlqZDhlcksvK1py?=
 =?utf-8?B?M2VsYnNqc20vdC9EUVdja0M0WUVFUUYzSFVTaDY3TGlTUUg3VnY4djZMUmY1?=
 =?utf-8?B?VGZlRHcxdnBVTlJ5b1JEWS9RaC9ZNndMaWhYSEFKemtsK1VpdDN6Q0VsSW5S?=
 =?utf-8?B?Q0VXd3JteXdPVlJES3B1cGxacWJaQ1dKQXB0VjZZUFJudGQxRkg5SW5TN1g4?=
 =?utf-8?B?SFU0c0ZNbmV2c0FlM0NUQ0t4NVp0dFdJOVk5aFRqc3Vqd3Y5a0NOMlI0aVQ2?=
 =?utf-8?B?YmoyVlAveDM5TzdXbktsZ3BoTWlyRWFiRkN5NTRmS0VSK1pvYm5TSTBsY1Vx?=
 =?utf-8?B?WGMyMXlhVFJHMEppN2sxK2NRSE4wZUhicTlMRmJpVG43N09LSmc3L3dYa1Rs?=
 =?utf-8?B?SHVxaDdyUkJZZTVSNGw1SmFRUXM5c1p2bGFuUTZGOTZnMHYvSXhjUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5450.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 689c371f-a4ef-489b-6843-08da187104ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2022 08:31:31.8094 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WQBBugCzLZca7UgQUnY/WRq5oj7HY+VAN6LC+mtRtWWbZNavJwjVXZmKtAHx3hXTHyKk/89G7UWeQPC8ppXCOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6717
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
Cc: "S.J. Wang" <shengjiu.wang@nxp.com>,
 "amuel@sholland.org" <amuel@sholland.org>,
 "cai.huoqing@linux.dev" <cai.huoqing@linux.dev>,
 "maxime@cerno.tech" <maxime@cerno.tech>,
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTmVpbCBBcm1zdHJv
bmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPg0KPiBTZW50OiAyMDIy5bm0NOaciDbml6UgMTc6
MjANCj4gVG86IFNhbmRvciBZdSA8c2FuZG9yLnl1QG54cC5jb20+OyBkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnOw0KPiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBhbmRyemVq
LmhhamRhQGludGVsLmNvbTsNCj4gcm9iZXJ0LmZvc3NAbGluYXJvLm9yZzsgTGF1cmVudC5waW5j
aGFydEBpZGVhc29uYm9hcmQuY29tOw0KPiBqb25hc0Brd2lib28uc2U7IGplcm5lai5za3JhYmVj
QGdtYWlsLmNvbQ0KPiBDYzogUy5KLiBXYW5nIDxzaGVuZ2ppdS53YW5nQG54cC5jb20+OyBjYWku
aHVvcWluZ0BsaW51eC5kZXY7DQo+IG1heGltZUBjZXJuby50ZWNoOyBoYXJyeS53ZW50bGFuZEBh
bWQuY29tOyBodmVya3VpbC1jaXNjb0B4czRhbGwubmw7DQo+IGFtdWVsQHNob2xsYW5kLm9yZw0K
PiBTdWJqZWN0OiBbRVhUXSBSZTogW1BBVENIIHYxIDMvNV0gZHJtOiBicmlkZ2U6IGR3X2hkbWk6
IEVuYWJsZSBHQ1Agb25seSBmb3INCj4gRGVlcCBDb2xvcg0KPiANCj4gQ2F1dGlvbjogRVhUIEVt
YWlsDQo+IA0KPiBPbiAwNi8wNC8yMDIyIDEwOjQ4LCBTYW5kb3IueXVAbnhwLmNvbSB3cm90ZToN
Cj4gPiBGcm9tOiBTYW5kb3IgWXUgPFNhbmRvci55dUBueHAuY29tPg0KPiA+DQo+ID4gSERNSTEu
NGIgc3BlY2lmaWNhdGlvbiBzZWN0aW9uIDYuNS4zOg0KPiA+IFNvdXJjZSBzaGFsbCBvbmx5IHNl
bmQgR0NQcyB3aXRoIG5vbi16ZXJvIENEIHRvIHNpbmtzIHRoYXQgaW5kaWNhdGUNCj4gPiBzdXBw
b3J0IGZvciBEZWVwIENvbG9yLg0KPiA+DQo+ID4gRFcgSERNSSBHUEMgZGVmYXVsdCBlbmFibGVk
LCBjbGVhciBncGNfYXV0byBiaXQgZm9yIGJwcCAyNC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6
IFNhbmRvciBZdSA8U2FuZG9yLnl1QG54cC5jb20+DQo+ID4gLS0tDQo+ID4gICBkcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYyB8IDggKysrKysrKysNCj4gPiAgIDEgZmls
ZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMNCj4gPiBpbmRleCBiMTE1NzdkZTQ4MzYuLmM3YjEx
NTgyNTI5ZSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lz
L2R3LWhkbWkuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHct
aGRtaS5jDQo+ID4gQEAgLTExNjAsNiArMTE2MCwxNCBAQCBzdGF0aWMgdm9pZCBoZG1pX3ZpZGVv
X3BhY2tldGl6ZShzdHJ1Y3QNCj4gZHdfaGRtaSAqaGRtaSkNCj4gPiAgICAgICAgICAgICAgIEhE
TUlfVlBfUFJfQ0RfREVTSVJFRF9QUl9GQUNUT1JfTUFTSyk7DQo+ID4gICAgICAgaGRtaV93cml0
ZWIoaGRtaSwgdmFsLCBIRE1JX1ZQX1BSX0NEKTsNCj4gPg0KPiA+ICsgICAgIHZhbCA9IGhkbWlf
cmVhZGIoaGRtaSwgSERNSV9GQ19EQVRBVVRPMyk7DQo+ID4gKyAgICAgaWYgKGNvbG9yX2RlcHRo
ID09IDQpDQo+ID4gKyAgICAgICAgICAgICAvKiBkaXNhYmxlIEF1dG8gR0NQIHdoZW4gYnBwIDI0
ICovDQo+ID4gKyAgICAgICAgICAgICB2YWwgJj0gfjB4NDsNCj4gPiArICAgICBlbHNlDQo+ID4g
KyAgICAgICAgICAgICB2YWwgfD0gMHg0Ow0KPiA+ICsgICAgIGhkbWlfd3JpdGViKGhkbWksIHZh
bCwgSERNSV9GQ19EQVRBVVRPMyk7DQo+ID4gKw0KPiA+ICAgICAgIGhkbWlfbW9kYihoZG1pLA0K
PiBIRE1JX1ZQX1NUVUZGX1BSX1NUVUZGSU5HX1NUVUZGSU5HX01PREUsDQo+ID4gICAgICAgICAg
ICAgICAgIEhETUlfVlBfU1RVRkZfUFJfU1RVRkZJTkdfTUFTSywNCj4gSERNSV9WUF9TVFVGRik7
DQo+ID4NCj4gDQo+IERvIHlvdSBoYW5kbGUgdGhlIGNhc2Ugd2hlbiBjb2xvcl9kZXB0aCA9PSAw
IHdoZW4gb3V0cHV0IGlzIFlVVjQyMiA/DQpGb3IgWVVWNDIyIGNvbG9yIGRlcHRoIDgsIHRoZSBn
Y3BfYXV0byBiaXQgbmVlZCBjbGVhciB0b28sIEkgd2lsbCBhZGQgaXQuDQo+IA0KPiBOZWlsDQpU
aGFua3MsDQpTYW5kb3INCg==
