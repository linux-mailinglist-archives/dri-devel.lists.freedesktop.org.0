Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F679355C35
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 21:33:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B8AF6E894;
	Tue,  6 Apr 2021 19:33:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00088.outbound.protection.outlook.com [40.107.0.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFF6B6E830;
 Tue,  6 Apr 2021 13:22:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B5JKMDbt2BcB6dXa7lHeBqYzbHA9zHCWhcr4w/j2zNMQAFiOf+vvky4vmwZ4mN24Vzu7nwri/ecJ5HE2nuo4dwk5ASctdRBM9vw00SAMaOwv10z4DBqT6S17wcl29myntKbTCXgXGvsKtG6tiR2VxweY+yAlsMPZb4UEGSHMKIwZmv/H7vCOVoW0aWhcBkYAxhwlLQeCu0M+BRDyY9bbidwEUFWallpg8YspxMfQGshGrxP8RZRqrNPamq1R4z8hB0vUzoZasM3nzMHFh0iUSMi7pafmxqrHJ5sKe5Ii8VbMnP9xFuAsxUXIuVQjRzhFf2UnUOXzsf2d97wIAfY8/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qtd8gvQkC/IEZjs+QNhEGsJ787STdoNDmrkRpjvuHj4=;
 b=U5F2gJaQxYJj2i2xX3gO0FKI/dxZRiRvD7JK8qSKtjoDFwstSW0YdMjFVKKOKO2Z4927MGN+gNCSQeyod8GE57OhmCV5Fq2XIO8LA62m1tZtNQt/Nq3ZyTc8M7OkRyzem8mU/3pHj55KObKxODArViD6v6SjnSez9AIIOqsYEyoN/PgnHzNJ+yzOA3GRAqsAP59TRCm7QsKTEzLiu+zQqqqSQ6AJS6u4gi4rtlpj/+FZtgNywVY3eapXY06WaT7Ohpje6zIb1nURRPS6sI/mxG8rC6qYfJSecbq7t3ASBBREAfGfcbkM14pDSpO/9X2pMgXONzY/V0J0pRUoD9i32g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qtd8gvQkC/IEZjs+QNhEGsJ787STdoNDmrkRpjvuHj4=;
 b=gWFTe+2n3YJtUSAoy6S+xvJgo5TtZ1TyziEh3MY+C6S95MTi8XDyNUkzVRdDVhm0ZvYf4NiJy5qCAGJHL0Zkg70gYXL2KWN9ybV9b6vXbXKOvYUze59G42T/J2x2zhLjwFKrL9oNWFlg9iq/NN4DfGz3HTN63KPaduPMTmoYdTI=
Received: from AM6SPR01MB04.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:12::26)
 by AS8PR10MB4742.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:333::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Tue, 6 Apr
 2021 13:22:50 +0000
Received: from AM6SPR01MB04.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1152:3d6a:3b1c:65b1]) by AM6SPR01MB04.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1152:3d6a:3b1c:65b1%5]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 13:22:50 +0000
From: Roy Im <roy.im.opensource@diasemi.com>
To: =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>
Subject: RE: [PATCH] pwm: Rename pwm_get_state() to better reflect its semantic
Thread-Topic: [PATCH] pwm: Rename pwm_get_state() to better reflect its
 semantic
Thread-Index: AQHXKrbIYOm9jeEfEkmtC3D+NOwLyKqnWvoQ
Date: Tue, 6 Apr 2021 13:22:49 +0000
Message-ID: <AM6SPR01MB04C9AC9A426F531B65A7E685769@AM6SPR01MB04.EURPRD10.PROD.OUTLOOK.COM>
References: <20210406073036.26857-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20210406073036.26857-1-u.kleine-koenig@pengutronix.de>
Accept-Language: ko-KR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: pengutronix.de; dkim=none (message not signed)
 header.d=none; pengutronix.de; dmarc=none action=none header.from=diasemi.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [1.230.217.117]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bacbf46c-3c6d-421e-d683-08d8f8ff13a1
x-ms-traffictypediagnostic: AS8PR10MB4742:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AS8PR10MB4742C00428DC02F3BAE0BC1FA2769@AS8PR10MB4742.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BWiP6/pUTa+U9U1GI1mCqOWONI7dcSgisT/bcsqLhDgwgWk9dJnF5grewi72MB0F9zYjoLDOx5kVBmvz8WlwzerPhLJPHA6sCYQV3qD7S7ixodnfZZO89IrlpVIPUesE/6Rso+Fexk5HV9JUXDDsDWB/WBpSFOmSf8nw9L+Kt2S6szHcc8A1cbWANYo5s/mdVODSnCa8afMeFSVEGkUPmvWN8PtOAdD1Y1evpHY3PM1Jiv/1sUvqf7xBOFz1ygU7oCD21Hhr9+riTU3frXTn3hN2IIxKR+htBjul2JARbiNliA4FBcoWaHeVln0/P1mf0o+gW/hmY/+ZIbovPbEHvUb/0F5OKydTFq242goMhHGvPSAmk+wgoBcGPb2bu+DEuyFpxTuWZ4MzKMOnorllYsAsZ1S8DNeU7uq0JFOejn9D+NEeBJZJd3kBqWM2U3D7bIOH5Z4iLo+vX6Sklx2VoiIsVYjFfKEmpk40qau78V0nZnvDO6etmBkP197wyiqjXZzBVtDwGthqzdayVnZDO8lrTVkNUb1e1nL5FG7tRplrW6tOLg8nbunfF1s5p1QkW3yC6RyQYHY56at+sHXnsfpSUpavodvM9tPLmFqOk880RdsmsVioad0e/u71fHwsJVakfKM7BOqO67hCJh1qQyzwxLJ6HXDSYnMYZh0z968=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6SPR01MB04.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(71200400001)(8936002)(4744005)(55016002)(5660300002)(4326008)(52536014)(110136005)(54906003)(8676002)(83380400001)(9686003)(26005)(66946007)(7406005)(66476007)(64756008)(66556008)(66574015)(186003)(76116006)(38100700001)(33656002)(86362001)(2906002)(498600001)(6506007)(7696005)(7416002)(66446008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?RlBUcmI3ODVnOHVJZVdkaCtRdUI4NTk3RXdTbHlVQmhBU0tKbGI3NmMyY056?=
 =?utf-8?B?a1BRSkRSUXMxeUdGd3hRdGk5RzVwQjhONVMyZFZVZ24wNGVJTG94bzMzdU9p?=
 =?utf-8?B?eEx0a1k4cGZ2Y1FmUnJzc2JPV3RWOVpwY0ovZmZ5QnFJMnlyd0ZWN2xQbDR4?=
 =?utf-8?B?UjBsNFMvM1QyNVZ5dkdzTlZ4TGgwUXk1Tmpsd2FWbG1XRGs4czEzWEtma3J4?=
 =?utf-8?B?dWpGNmtoOHJMcGlqb056RERteWM4aHJYb0NhL05xQk9ENXJsdFlrRW5SU2pl?=
 =?utf-8?B?S0o1a0g4WHB5dHZ1dzl4TVRseXBGVHB2UlZZaUt6WE5ERUlBUzFITDM1bnpK?=
 =?utf-8?B?c0ptRHJrWThEV1VxUzVkVVV6d1IxN0czVzBJVnBPM0NVZUsyWnZjbU9lQ0VM?=
 =?utf-8?B?K2xZL1FYUmVxOVlCamZmM1Y4Nm55YXdpajRRS01RbEYwYUNUdUMzRENiTHBS?=
 =?utf-8?B?SUFFeTMxVm0wTWlXK1N0NXl0aDVkd2tFRSttVVo5VlFaTmpMMTY3OEFTZHd3?=
 =?utf-8?B?OGxkVHl1SlFZNUhwRnFFWHo2dHF3WGw1S0tkUWVsZWJ4VFJZK2preWd0OTAw?=
 =?utf-8?B?dzBEOG10SFY2V25MaVcwZlBqN0dzTHRqdnJ2VkRZRW84bnNSSHdJYjZOUDdG?=
 =?utf-8?B?SDRTVzN1R2JvZzY2Zlk5czdlRzJKeDRMNEZMejY0N1dUVm9pUmRhbWFpbExa?=
 =?utf-8?B?RGEvYWJOUmcvaEV4OXh2QU5MU1M0L3VPNFY3RU9Nb1AwenhRVGlFTzcxQnJX?=
 =?utf-8?B?Y3o1RDUyWWZrUkN3VXpVV05UczQvS0I0SWdpUlNvWElGZ2tMMW9mZDk1Y3Q5?=
 =?utf-8?B?VFJQOThPOTB3VmdjV2lSR0JoNTg3cXF0elorS24vU1dBRlpjYkpnK21ReENI?=
 =?utf-8?B?WW1oREpwbXlWQVVyR0VrWSthT2ZGZy9ybzVkV2JhMGcyc0ZwRGJJeExnOXFT?=
 =?utf-8?B?ZnhUcTVGWXdmVGdSamo4OEp4bGtNbjRDaUFBT0RvSHRMaGNhazEzcWFWcEU2?=
 =?utf-8?B?dGg0eTZ0aFUwSWcvNHMwZ1c3Qm42TTQvR3EyR0RpN3JZY09GWE9ZbEZrMkdS?=
 =?utf-8?B?M2FVcGlNcjRGb3BnZ1hzZVpLWVFuTTdjQWlHK28zamxSeWF0U2dGd1cyblQx?=
 =?utf-8?B?SzJRa2k3N0VlWWZ0TE1yaXRkWkhhTFVEb1MxcXhwamIyVzBuSFZtWmhHM3Rx?=
 =?utf-8?B?d2xLYTI1OHRqbEdTd3ZlY1FzMTMvSkplN1ZkWUtwVVNoZWhUN2xaS0xmOTN3?=
 =?utf-8?B?eEowSWgxTVdQeDVNcTZXY1NxMlZUSWV5UkNYY1ROTUc2c3BtTWRpL3BEQUFV?=
 =?utf-8?B?QjNzT1FNcXc5TDVPdjJ0aDhMWm9qLzZYem9tNTJUOGxheGVxTG5JaFRXMXZO?=
 =?utf-8?B?UXJSdUhWd3pEYklNeXpMNklaUXdKM0I2Tzh6K3E4VHJod0g1cGhadm1BWjRI?=
 =?utf-8?B?ekNhOEdoNWdHYkVzdWhhRzE0dmhodXhDem92NmtscWx3bmYwVm4xMTlNRWFl?=
 =?utf-8?B?a1hKODFQc0w5N2ZmZGR4b1VXeWNvdGNxcW1EZmNOMmhhQmhXWTQvSmRKVFZQ?=
 =?utf-8?B?eXdhWFUvUkhIUk5ycDBVUEVyR05vQ2JzeFEwOWdYVXljTG5YTDkrRzFKaVVx?=
 =?utf-8?B?TUVvcVI5S1RvVkI0ZXF0MUtYOUdNV3h0T0ZLTWtUeFh5Vk1vdnZaVGZLYTNZ?=
 =?utf-8?B?ZnZzQ0lmRVZXYU80YmVzdXdjcXhnR2hBY1ExUXNpK3VoUWxUTDg2cDZxM0ZY?=
 =?utf-8?Q?KWZ5eVmVBo04ZON9yWQQ0SJZCn6toxVZVlHqhDP?=
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6SPR01MB04.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: bacbf46c-3c6d-421e-d683-08d8f8ff13a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2021 13:22:50.0278 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jb0XKMUxTdh71U4MLJCNXUGvh8cL8u/K8IjL1vUqTTj32tJMDbsM1xx+lAMt6NZSLQ2zqVAc425BaxeGGGdA6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB4742
X-Mailman-Approved-At: Tue, 06 Apr 2021 19:33:52 +0000
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Michael Turquette <mturquette@baylibre.com>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Chen-Yu Tsai <wens@csie.org>, "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Mark Brown <broonie@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Support Opensource <Support.Opensource@diasemi.com>,
 Stephen Boyd <sboyd@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAwNiBBcHIgMjAyMSwgVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0Bw
ZW5ndXRyb25peC5kZT4gd3JvdGU6DQo+IEdpdmVuIHRoYXQgbG93bGV2ZWwgZHJpdmVycyB1c3Vh
bGx5IGNhbm5vdCBpbXBsZW1lbnQgZXhhY3RseSB3aGF0IGEgDQo+IGNvbnN1bWVyIHJlcXVlc3Rz
IHdpdGggcHdtX2FwcGx5X3N0YXRlKCkgdGhlcmUgaXMgc29tZQ0KPiByb3VuZGluZyBpbnZvbHZl
ZC4NCj4gDQo+IHB3bV9nZXRfc3RhdGUoKSB0cmFkaXRpb25hbGx5IHJldHVybmVkIHRoZSBzZXR0
aW5nIHRoYXQgd2FzIHJlcXVlc3RlZCANCj4gbW9zdCByZWNlbnRseSBieSB0aGUgY29uc3VtZXIg
KG9wcG9zZWQgdG8gd2hhdCB3YXMNCj4gYWN0dWFsbHkgaW1wbGVtZW50ZWQgaW4gaGFyZHdhcmUg
aW4gcmVwbHkgdG8gdGhlIGxhc3QgcmVxdWVzdCkuDQo+IFRvIG1ha2UgdGhpcyBzZW1hbnRpYyBv
YnZpb3VzIHJlbmFtZSB0aGUgZnVuY3Rpb24uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xl
aW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPg0KPiAtLS0NCj4gIGRy
aXZlcnMvaW5wdXQvbWlzYy9kYTcyODAuYyAgICAgICAgICAgICAgICB8ICAyICstDQoNCkFja2Vk
LWJ5OiBSb3kgSW0gPHJveS5pbS5vcGVuc291cmNlQGRpYXNlbWkuY29tPg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
