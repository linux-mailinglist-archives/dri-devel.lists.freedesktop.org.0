Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD464F7E4B
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 13:46:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 715F810E6EF;
	Thu,  7 Apr 2022 11:46:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80072.outbound.protection.outlook.com [40.107.8.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48F6210E6EF
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 11:46:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IozaLGt2mRhKN3c6+IiILpGSOu0HHDhSxR+Km/NALuLXEb9nU+wjvFWyVfwGBxx292mjKAJIIhnHiKlBydkcNkU5xdlBv6XOGUqZcb5BV0SQqcJe/tRxtL7J/iFbHbQgilzjjiFCapOExbpoecDiVA7E31GXTGKKW/zZ+TjePyNVtvxvvpOcxEBb5SAR5jvMpE3v1eaKWDUJ0FvPOOjvyH/5rLHbJdu4t+lvcP6cSuTtZZYXucqBc1LyvOqpP7xxWPFkunL//Ak82y0o12q8HVF8Ylhvw4i+iEO/W2tTVRpyhfTD3UuTwMD2PAg7l3l3MfTFpI9VapjignY+HCTjNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GFgMfaEsMdqmNWF69fA5pgy20GSOgNATc9HqRwDKuPw=;
 b=AAIxStUs+8DEPrFn9/Uupw9SFhnzPYAOCov7fAWvynfRkNon9eWF+ncS+QrtI6EWNk8RB8XXOLi1+dRBxmKDdUvLEWp57VNQ7mkAaLtihegotso4Dwv3xa5UwiJm2WvizpcyyLcdqqqY3VcgnnAdlnh0vUlJTMpi/scJf5Eqw3Nh6bIXKp0tYwfE/OfsydL3gIfLPTclaPgqOnIskgQ05UG86FEFKCfUSC7wjQDJ/hLuiYUJf4etLicMzeoK8DsO1DenImgKbNnss1+0CN6Dj8K6b6nV5HcG4jTPGg1btxgLF1w0DCigq7yiQqK6RcWZmn5QhlyY9BSTZG2UJbiDDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GFgMfaEsMdqmNWF69fA5pgy20GSOgNATc9HqRwDKuPw=;
 b=HrfcalQf8rnd3A0p3bcM7M3/XbAip4uCIIbyp3Gm1vuVePQwDLFBdg/nFLgEEDGv/yhkne2gopuGMWFsLNNM0aDwjEQExycc3Nco8LCq1tXEKi3WnO9p/HTTBFQZFH3Y+p2fjAzGf4rnj8cPES+9T2KW4iqOQlEUB5bvwjy1geE=
Received: from DB7PR04MB5450.eurprd04.prod.outlook.com (2603:10a6:10:86::11)
 by VI1PR0402MB3440.eurprd04.prod.outlook.com (2603:10a6:803:6::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.19; Thu, 7 Apr
 2022 11:46:07 +0000
Received: from DB7PR04MB5450.eurprd04.prod.outlook.com
 ([fe80::dcb:d345:1503:d921]) by DB7PR04MB5450.eurprd04.prod.outlook.com
 ([fe80::dcb:d345:1503:d921%7]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 11:46:07 +0000
From: Sandor Yu <sandor.yu@nxp.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "andrzej.hajda@intel.com"
 <andrzej.hajda@intel.com>, "narmstrong@baylibre.com"
 <narmstrong@baylibre.com>, "robert.foss@linaro.org" <robert.foss@linaro.org>, 
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, "jernej.skrabec@gmail.com"
 <jernej.skrabec@gmail.com>
Subject: RE: [EXT] Re: [PATCH v1 0/5] DRM: Bridge: DW_HDMI: Add new features
 and bug fix
Thread-Topic: [EXT] Re: [PATCH v1 0/5] DRM: Bridge: DW_HDMI: Add new features
 and bug fix
Thread-Index: AQHYSluHtrzw5i0FmECiQU3EzqgTs6zkUB2A
Date: Thu, 7 Apr 2022 11:46:07 +0000
Message-ID: <DB7PR04MB5450D399E3E039F10B1BE9ABF4E69@DB7PR04MB5450.eurprd04.prod.outlook.com>
References: <cover.1649230434.git.Sandor.yu@nxp.com>
 <cb1e7e1c5527e531a9c864a337aabde1c20b9940.camel@pengutronix.de>
In-Reply-To: <cb1e7e1c5527e531a9c864a337aabde1c20b9940.camel@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ab839e6e-b5e5-48bc-6228-08da188c3424
x-ms-traffictypediagnostic: VI1PR0402MB3440:EE_
x-microsoft-antispam-prvs: <VI1PR0402MB344043A2196F0F74F1C26577F4E69@VI1PR0402MB3440.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fBGFS3r9QQJgPwc1F9KikFCQQlAVkRgBHBkF5lniShhYEP4Y7PYb8Ce4chrV4XyqUg7p0Sy1slKsNXfXAKk+OK7P391TW9dpeI6MF/0c7HR2aVZS78PUpZKavihRenIOIWtynHrlTAPRSQCUVrl1gyH0TpUuNxBcaYvY5EaD+D/QRRHdNujvsh3UARVW3IH/UI1P8cXTGl4btmHaL7Fd0zUr53Z8yB0Z6j4eDNlBwiqJUQXeBN2MP3mRHvmivVIlYpJ2VNRpVUtuuESoUDCWhkfOoNVNfcWAY7FDdbdAxPqfJsIyEUmUuvNSmJpxQGj/sCM1MmoRsZxjT2kkgDXSR4A4Gp78DLWDIfflNsXt2goCJdnBDBYQzRpyipY0/0SrBwtYKMkqBMkDb6884742thj+1ztCF451uDeu3ebF+J+5dRSx3vdNmrRw1EmUYmL79AkyVHKJES7tpnxgHU0Kg/TUOeVPxsb7Zuks9StADVJlsUi+lMgp+6VPUQxupZv2b7ED8pGAbJMhE5ZVha+J6pAn2d3VxXdb9nMAZ8ek5ENvGD/n9VY6bQeRpd+gGnYQTtebFG2JYKDkmGwVDvhXuErTxxw/za8fJ50uYX7YrdM32f52wyTGNrxRjltQX7eCKF3LjTLjLavL6L0RadcbW1UbzXz/JUSMyIxT8BMIKQQO9sxphzDZPt0h08NUZTollwcuB0crCpxUVxhCHN9gHA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7PR04MB5450.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(33656002)(71200400001)(53546011)(9686003)(38100700002)(6506007)(7696005)(186003)(83380400001)(8936002)(4326008)(7416002)(26005)(66476007)(8676002)(2906002)(110136005)(76116006)(38070700005)(64756008)(55016003)(316002)(44832011)(508600001)(66946007)(52536014)(5660300002)(122000001)(54906003)(66556008)(86362001)(66446008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ejBqZkZyc0VERWtHTHFldU9DNE5TYStVQURQbmUzZ0VPQTJFN08rT2hwZDI4?=
 =?utf-8?B?ZXpnb0IweU5wcUowb2k3K0kxcXByKzNuTUdSWnA5dURBN3F1SSt2QmU4aGJr?=
 =?utf-8?B?cEgyN3JQZEsvd3ZXb3hSbVd2dGYyQU95SkI0elVXTkVxMGtpeXduREJMekdt?=
 =?utf-8?B?dE11SFhieGtTZFd6RVY1TEQ0OFZUZ1RnMEFZWktuMjFFNlY0UHRGZ01qTDV5?=
 =?utf-8?B?bEpKS1ZnTXlHM0NGSDJ0eGJvWjY0ZWFadmo0WjBLVitSc25VaUMwOWwyVWMx?=
 =?utf-8?B?QjM3dE8xenA1MUdpOHlJRmF0MGt4MitXTllJcUFacTBHVnJQN2VJbFFCK0wr?=
 =?utf-8?B?ZTlRMHpKREltNHNTVnJreXA0QXZicnBWa1pPWGZ0bGEyZDQ3NHR6RnFSTHZ3?=
 =?utf-8?B?d3hVcVZKc2N4SXJDRml1ZEVVNE5GTUVaMnNCdmwwUUtXVWtMMU1wRGdYWVcr?=
 =?utf-8?B?NDM3bW5aMnczbmdRSmc0bVhkaTJmaUdja3E4ZkNHSGJFYUVwSFl0UWpKdHpP?=
 =?utf-8?B?MDZFUmQ3WnZQdW5FWlh0WjcrT0g3YkdZdEkvOWtwSENWeXF6QUZGdWs4Qjhn?=
 =?utf-8?B?MjYzSmZNSFA1L21iSGRNNjR2dDRQaGY4N0w2eG1zdlBGenNEZktYWXk5S0N6?=
 =?utf-8?B?dW1mU2xzL2lJV0ZoTnlUdU5jalZzd1RkaVBqUE16SFZSb3FMYzU3K0xPRXlp?=
 =?utf-8?B?QjlPbFZ0ZEQ0YnV6MnFPZ0VpMm0yTGQrTkVEVUE1UGF5QkF0V3FvQ09yaVRK?=
 =?utf-8?B?MmduaHdwRFlaUVBrb2UyVDQ0QUxsYWY0LzQrWXcyeW5aVkFQUTRSQTBmak4r?=
 =?utf-8?B?WWJpVjJjYWw5Z3dOendzZ3I0OGh3bDRyWVNsZFJ3OVpIM2x2R2tjaTFJbno4?=
 =?utf-8?B?UWMrc2IzdDZiMzFZSTZtM2luOEVUSmpLYStCREdMWmZoZTYwK05RVVQ5eXYw?=
 =?utf-8?B?T3dRZEJ5K2FFV1UyVjVlcWw1R2hKNW5CMS9hWk5zd01ZajZnQ1dycjJnS2JV?=
 =?utf-8?B?Mnk4ZVVZdnJMKzk5dzdVUE1MRmE3ckRkSG9sSm9qSU1pOUtFZGdDREJrdDlG?=
 =?utf-8?B?VWYxd1gwWVh1R3Vva2pZUnRNYVN4bnpZU21HYWZBUHBzTlNqelFwaTltQi9w?=
 =?utf-8?B?NWUxYTgweTgwRTZSUnVDTmdTSlZJQXF5Y2VNc1llR080c1NWdVRjTVpyMkFW?=
 =?utf-8?B?ZGpyWHo5Z3J2bVYyei8rQ3dKKzBzaDBBZmRyWjkrWWpmMmgwdEFjQWNZL3c0?=
 =?utf-8?B?V2oraTk1YTBQc3hwUGxnaFpmM1V2alJSZkVhN0ZmNThDV3kzRkJFV3QxNXpz?=
 =?utf-8?B?VWRBSzNhcUQ1R2ZCaHVQdy9JNW5kMmJQTGdDUmx2K3ljV09iWDJnaEFYWXY4?=
 =?utf-8?B?T29xTUtLVGNMMnVHQ1p2OVIzOTJHZjROQXpFbmFKOXRPOCtGeUdlemdVQWpt?=
 =?utf-8?B?WUx6akV5SEVuZzh2WFhVL05UNzl5VW8yMFJVclYvUW9LQVdGNnM1elA4dVhl?=
 =?utf-8?B?Ykp6NWVqMjdDZzNPcFJNNDBkajhxbW14YmVFbEhsdEZVaDJyMENETE5IMUtZ?=
 =?utf-8?B?aStqWDhacENvQkxIUGRHNUhxRlRDSDQzTktXMEhsdjZ5aTh1U2tGNlN0Sjhr?=
 =?utf-8?B?UGZBVlBnVlVmWk1VZkc3L0dlRndOdlZ1MCs2UjZyOTlWejZ0ZzgyRzA3RzdU?=
 =?utf-8?B?M2hxNit6b1J4OVowSXdiM2ZnQ2hqWWV3MGhHODdUdFhBZUNjL3BXZW8rNmgy?=
 =?utf-8?B?djFIbjFLemFwazZodEV5WE1QcjdsZFlCYVRQRVhpdjVBMGVUSVkxMzc1QW9l?=
 =?utf-8?B?dTB1Y1dSVXJDUHhnUzBXbkJPTDcvemkwbVJ4N3dybFhpOEQ5YW9EUnUvMXFm?=
 =?utf-8?B?cXFabm1rM2Q0T3lIRklJMkV5N3lWSFQ4SElvU0ZCQit6OXhRSGdMdm4ycVB6?=
 =?utf-8?B?eHVoMzFWekJHTlBGVm5MdStXcGdQbitxUUQ2aU5zSUpSelkrZDVIc0tiWkln?=
 =?utf-8?B?cDA2OTRoRHhmMFc4RjNYR3c4ajZmMTJCS0Examhrb0NXeTRlVlpzMSt5Slpu?=
 =?utf-8?B?SHZZWE1RQmc1L3hDSDQ2dU9aZHNJbDlFek5IcjJkZk9SbFFFc3FDWFRraEV2?=
 =?utf-8?B?UXYrcTJlT2lOTkF5TWJBRXNYVXlwN2dWSHIxd0NPd0o2WWZmaVRSK1JTSFN4?=
 =?utf-8?B?UUN5aXN2bi9SY1lGK3R5YjkrS3M2L1V4M01WUzgwdVpJWDBJblIyNk9IS2xB?=
 =?utf-8?B?VWZaeTRWRmJoNU1lRHhwQ2U5cGI4a3hFeHBDMlBRR1Npa2ZodmxXbHFWbDdG?=
 =?utf-8?B?OVVwNGpHdFdyS2xKRmMyNEM2eXBKa2FPeEdxYXVxQmZEN2Q4dWtCdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5450.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab839e6e-b5e5-48bc-6228-08da188c3424
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2022 11:46:07.2978 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /lDYAIB0HvfW1bPOYLpUpCvSFOuv6V4Pbc1DA6ZLdpt6sUBjAwlAvpexJuy6FPrh+Nf3fQ3nBcg9dAlmzXP3Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3440
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
Cc: "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
 "amuel@sholland.org" <amuel@sholland.org>, "S.J. Wang" <shengjiu.wang@nxp.com>,
 "cai.huoqing@linux.dev" <cai.huoqing@linux.dev>,
 "maxime@cerno.tech" <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUGhpbGlwcA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFBoaWxp
cHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+DQo+IFNlbnQ6IDIwMjLlubQ05pyIN+aX
pSAxNjo0Mw0KPiBUbzogU2FuZG9yIFl1IDxzYW5kb3IueXVAbnhwLmNvbT47IGRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmc7DQo+IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGFu
ZHJ6ZWouaGFqZGFAaW50ZWwuY29tOw0KPiBuYXJtc3Ryb25nQGJheWxpYnJlLmNvbTsgcm9iZXJ0
LmZvc3NAbGluYXJvLm9yZzsNCj4gTGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tOyBq
b25hc0Brd2lib28uc2U7DQo+IGplcm5lai5za3JhYmVjQGdtYWlsLmNvbQ0KPiBDYzogUy5KLiBX
YW5nIDxzaGVuZ2ppdS53YW5nQG54cC5jb20+OyBhbXVlbEBzaG9sbGFuZC5vcmc7DQo+IGNhaS5o
dW9xaW5nQGxpbnV4LmRldjsgbWF4aW1lQGNlcm5vLnRlY2g7IGh2ZXJrdWlsLWNpc2NvQHhzNGFs
bC5ubA0KPiBTdWJqZWN0OiBbRVhUXSBSZTogW1BBVENIIHYxIDAvNV0gRFJNOiBCcmlkZ2U6IERX
X0hETUk6IEFkZCBuZXcgZmVhdHVyZXMNCj4gYW5kIGJ1ZyBmaXgNCj4gDQo+IENhdXRpb246IEVY
VCBFbWFpbA0KPiANCj4gSGkgU2FuZG9yLA0KPiANCj4gT24gTWksIDIwMjItMDQtMDYgYXQgMTY6
NDggKzA4MDAsIFNhbmRvci55dUBueHAuY29tIHdyb3RlOg0KPiA+IEZyb206IFNhbmRvciBZdSA8
U2FuZG9yLnl1QG54cC5jb20+DQo+ID4NCj4gPiBJdCBpcyBuZXcgZmVhdHVyZXMgYW5kIGJ1ZyBm
aXggcGF0Y2ggc2V0IGZvciBEV19IRE1JIERSTSBicmlkZ2UgZHJpdmVyDQo+ID4gdGhhdCBoYXMg
dmVyaWZpZWQgYnkgTlhQIGlNWDg2NS4NCj4gDQo+IElzIHRoYXQgaU1YODY1IG9yIGkuTVg4NjU/
IEJvdGggYXJlIHVzZWQgaW4gZGlmZmVyZW50IHBsYWNlcyBvZiB0aGlzIHBhdGNoc2V0LA0KPiBJ
J2QgcGljayB0aGUgb2ZmaWNpYWwgc3BlbGxpbmcgYW5kIHVzZSBpdCBldmVyeXdoZXJlLg0KPiAN
CkNoZWNrIGl0IGluIE5YUCBpbnRlcm5hbCwgdGhlIGkuTVg4NjUgb2ZmaWNpYWwgbmFtZSBpbiBj
b21tdW5pdHkgc2hvdWxkIGJlIGkuTVggOE0gUGx1cyBvciBpLk1YOE1QbHVzDQpJIHdpbGwgdXNl
IGkuTVg4TVBsdXMgaW4gdGhlIHBhdGNoIHNldCBsYXRlci4NClRoYW5rcyBmb3IgeW91ciBjb21t
ZW50cy4NCg0KPiByZWdhcmRzDQo+IFBoaWxpcHANCg0KQi5SDQpTYW5kb3INCg==
