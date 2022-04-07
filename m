Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1764F79B2
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 10:30:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA1A510E9DD;
	Thu,  7 Apr 2022 08:30:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80089.outbound.protection.outlook.com [40.107.8.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEE7010E5B8
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 08:30:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YrjAnAOqDTnt+XFgYWA/90q0BZBsW/XklfbpzLboeDQQjR5Da0b4uHXmde0+ejhUU/FIxwwQZ6V7ia1WvOVFeullelRVUa8q+Y3OjsVJQHBH3wRTw+EEewi4PdE6HAn3wjqh61gN/p/GL8IIsAcoTUXzEpIYxXhzdEo0rpnVND9A2Sdx4q1tRKfc60cTKiKOazq2ENbRWBCaRh8dqU4Y0KW7AXdX/T4bFzmk5J6zZ5pGehMLFo8Xki8z6RH6ds/m/iDc4ILh7nZ1rWZ4BZzJuohGsQVl4zd577wKSAZy0Eg9cu1AnYiE9iqvPn0mHF0aZODrhLGxzFYbm/CB7FGrdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P9/9xpb3wd3WZfeOdCWuI1JeluvVtUpGp9/ciWR9cg0=;
 b=ScHcKriy/6XegP4+Dv2y3E5aLIsXTDg72mZ2d/V9NmidHkfGl17neFviUZs7U8TtMX3JzqGN3p/Q0y36ktnN0BwCC1wGBFkJqaO6xO7Od7bD7dhqMrrvxYyY4hZ+L8Mejmj0jRILkvIPVu49wz1L6QXHlGEK/ZZRgAW5fpTGOXxao33448o8WqkoDFVNBWt5Hc5DRuBxQtyGkDSiWpoP9XhQLxwDTL0J66POhO4v4ckseGrCfqthqdEY+5x3foWYPaEjH4eTPpbO5YLts84V08ILwsu6CDN+W7NeKNJDhhHJvX/K8zL3/4ZjYfJQOTPVV9RcS/7JbblcsgBLW26fpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P9/9xpb3wd3WZfeOdCWuI1JeluvVtUpGp9/ciWR9cg0=;
 b=bumpDGplj0zpy77sW6lbQQwTEN3a0sa6vJmQswVLrT8+Xq4wnebVwoJmQZcJ3MPwKptDffYGkkGlqKXhZH01nubUhdHSEM1y6Tr1cnRUTZ10KDB+sq0mqYsADW5du3j/ABuDZUd1pLo3EFCfdx20jiuovX8WCd1C8qex3LOs8Bw=
Received: from DB7PR04MB5450.eurprd04.prod.outlook.com (2603:10a6:10:86::11)
 by VE1PR04MB6717.eurprd04.prod.outlook.com (2603:10a6:803:129::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Thu, 7 Apr
 2022 08:30:27 +0000
Received: from DB7PR04MB5450.eurprd04.prod.outlook.com
 ([fe80::dcb:d345:1503:d921]) by DB7PR04MB5450.eurprd04.prod.outlook.com
 ([fe80::dcb:d345:1503:d921%7]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 08:30:27 +0000
From: Sandor Yu <sandor.yu@nxp.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "andrzej.hajda@intel.com"
 <andrzej.hajda@intel.com>, "narmstrong@baylibre.com"
 <narmstrong@baylibre.com>, "robert.foss@linaro.org" <robert.foss@linaro.org>, 
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, "jernej.skrabec@gmail.com"
 <jernej.skrabec@gmail.com>
Subject: RE: [EXT] Re: [PATCH v1 1/5] drm: bridge: dw_hdmi: cec: Add cec
 suspend/resume function
Thread-Topic: [EXT] Re: [PATCH v1 1/5] drm: bridge: dw_hdmi: cec: Add cec
 suspend/resume function
Thread-Index: AQHYSYkSFTgqCqDkvkOh242o21yDyqzio2MAgAFzP2A=
Date: Thu, 7 Apr 2022 08:30:27 +0000
Message-ID: <DB7PR04MB5450C501F54725378FEC08CAF4E69@DB7PR04MB5450.eurprd04.prod.outlook.com>
References: <cover.1649230434.git.Sandor.yu@nxp.com>
 <27380b83a1b17419a35a13e29a86a1989204d1c3.1649230434.git.Sandor.yu@nxp.com>
 <cf89f24f-292a-44ae-c018-3db6081635b9@xs4all.nl>
In-Reply-To: <cf89f24f-292a-44ae-c018-3db6081635b9@xs4all.nl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e2d23ce5-e38b-449d-96d4-08da1870dead
x-ms-traffictypediagnostic: VE1PR04MB6717:EE_
x-microsoft-antispam-prvs: <VE1PR04MB6717D67B5C0F4BA7D161427DF4E69@VE1PR04MB6717.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EuSYeYa7yq4twtiqItUKOFTZcW1nfj4OyDMqqESpFreVU3vPmfvefugQwzG0+fsaHFgiG1s8Cxknyv8FVJBWFE9gurx1FqVioil+fY5yX3Kwtbr7zOiFa5H0jQUGEVzqPkmfEAfbm1NH1s5+MyrpykdgkuveF6jPjzotrxTg/H2dafJqLqp98P2BiLTJf3koZVMhcnUeOFfL4c+/EcoucsLICoMXMrpqWz15EXGTjCybkdddpZZL97MEPMCstddCSuxCROqDYaGnl2Je5D0n5lY8aIsMpipqCA+khQsIaEGqbYFXxLMunRtQYTYZLeIwOqb4EFWyhHYYntH77Juf0I7Q7giI6jZUs9h7EpWFq9JuqlJOy1smA/IaOu+m+Upj6X46HHrDe+OXCtinIrIzk5M0FAIJ/pj/Ub0iyccKPo+Zzo+tECmzD1Z8Hva4ncFgFOebu7MCgs9z49Y91VPj9TWmkuPnRlRRaVTZ9XACOzR4uzY06QQliLX+GPXXr6D2mqBMnt175dMTM8zTU0ZtWxUhEzQQC4bwVHIKTaHZdCyDYLGh8QdALG7/eTEPHHomXVaByfWJVpJPXRkTl3NTG8uyMzNqz7oITaR7zZmD+4oDOI7Ft0/Bg2x3bFpAKd5SOClFMR0x3cGSiTNl9j9+eICfI6cc1MZ9qJsyfuPyZ7X8Lr7kngjUV+PN7Qtq9FE6gcOX/o3FgL2taD2SLhVBGg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7PR04MB5450.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(8676002)(4326008)(83380400001)(64756008)(76116006)(66446008)(15650500001)(66476007)(53546011)(5660300002)(66946007)(66556008)(55016003)(33656002)(86362001)(38070700005)(8936002)(7416002)(9686003)(6506007)(71200400001)(44832011)(52536014)(7696005)(316002)(110136005)(38100700002)(508600001)(122000001)(186003)(54906003)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YzhoUVk4R3lVTXpJRm4wcUFEcEE2VWFQb0NTOTMvZEV2UFFOVnRXUmZQdjZI?=
 =?utf-8?B?RURWZXB5WTlBa2R0Mk55dlhlczZVWWVJb0N0ZW5iR0pzempwaktjRis1WU9L?=
 =?utf-8?B?TTdOZGpmRmEzZjJlUXFFd2N4ekZhQjJtYzZlb2lXMHFXbWhVbVliaDdoOWxs?=
 =?utf-8?B?WFJEamNPK0xDN0pJMjNBeEZhVmsweDJZOHIxSGZ5TWRzVlg1Zmh0azAwMGpw?=
 =?utf-8?B?UTZtMWZkeVJEMVNhSmFrRkJXQkRrbWNZNk9ZWStIbFM1dXhZSW5tbTFYMmw0?=
 =?utf-8?B?WXltdjcyLytSUmhUQ3cxUnVOWE1ob0NIdkdjenVaRVh5NHduZzlzL1VvVG14?=
 =?utf-8?B?a09ONmcvMkxjM0pwQzlZWUkyV0QwTjdPamhTb3JtR2VTdzJqOUpzQWVXY3Nm?=
 =?utf-8?B?MkNzSndaWTJFU2VYbTV0NnZpenIvaXdmMXJmTktMV2JhUnhYT2s0T0JZZzZX?=
 =?utf-8?B?SmdtRkRjTGg0aUxac3MxZ1pBZ1FsbFpYTHdvTFVzSzBQcVJIc21UZEE3S21q?=
 =?utf-8?B?K1NRZXA2azZLeG9abXJRSXhJTEw3ck91Y3AvU3p0eUhhTzlSbjJDOG54NXdM?=
 =?utf-8?B?VWcyVTF1cjl5U09CcDBZYUhhM1R1bFg2V1VFbmVJNUcxdUhNQTRUQ3JZL1pj?=
 =?utf-8?B?NjIyZnE1U2VTWWVrVTFMM0hWUUtiTitqbnpRQm4xV0gzelpMRzU0L0t2NlBP?=
 =?utf-8?B?RVdXdlBQOFppdlJqWmVUNmdnQzRaeHNyNDRBYzUwem81Q3d2QmFQeUNpdDZK?=
 =?utf-8?B?SGcwUmFkREJVL0Ywc000bnRteldTdmVyeVd6aW4wMCs2aGFyS2IwN1l6b2FI?=
 =?utf-8?B?RDhobjJSN1oxeTdUa3QxUmIySk5nUk50YWM0bUJ3dm5Jc3pQL2JJRjc3Ymxp?=
 =?utf-8?B?Qy9tVUNIQXFmc3dwS3NNQzBmRG9KemNlY1gycVoxRS96bi9wendHdEJHV0FE?=
 =?utf-8?B?bHBEUnNkc2FDbGRBMU8vNTB6K2RKSkRyeUUrdGVXRDMwN1lvK1daM3d1Zmgr?=
 =?utf-8?B?ZkN4YW0yVmZvOXlwWnA0L3FHUEJOZGZNaElNY2pzN0trNmVwMXc5b2lmaWhY?=
 =?utf-8?B?TjdXSzRHNEZVUFY0MWZGSkFxK0pacEIxSGRQNkI3K2hMYm43MU04aVBQbmtk?=
 =?utf-8?B?VDNOc1R1YVQ2SktpV0xNMmJWWndsSzVqV0JVVG9SVTM1aDhRa01iaWQyM3c0?=
 =?utf-8?B?eDVZNWQ2dy8vdExmbFBRQW85aDQ4RjZHczZRSzZxZi91SEZBcnk4ajlZcVNM?=
 =?utf-8?B?QmtnUlRLQmFVSEVhNncvNS9PWHd2QVZjM3gvb1VhZFcybjdDUXAyblIyRUFm?=
 =?utf-8?B?L3c2RWd4b0lnNmR3N0JYQXFZZ0ZDbVZLdVRTdFIzQmQ4aFZhS0dLU1NkK01k?=
 =?utf-8?B?N0JXWUd0UmZXYmdSUXJYZEYzUlhNdzIrYnlxSThkOFl0YTBHYWRMZE1EZTZE?=
 =?utf-8?B?aFdFcys1VGdBVk1QczBZZnlCRHp1d1BJQnJuNDJnNU9ISHVFalN4eHNDOVZM?=
 =?utf-8?B?d3NmblgxbHdhT3NHcW9ZcVRHa05tcjZ1bmFjTG5zWjkwaVJrWFNhWVJVYWxi?=
 =?utf-8?B?Z3BZb2pQWGUwU0xlbW9WNHl1bFZDdThPNjFxbzF6OFVCLzBiRzNTdk5PZ0hH?=
 =?utf-8?B?TVNjcDV6b000dytCS1hUOU13czlKM3VxMzBUeng2Y0pVNXRCeGxmRWFHenp0?=
 =?utf-8?B?eDVSY1RKQnVxL2VSazhOYmMvamdLN21WRkxxcG5kaE96c3JNakFob0dEWlFj?=
 =?utf-8?B?Mmh2Tk5WNnprQTNtRXpXSHllNFR6SEsrZm1PL2RmSVlzd3RHRVh6Wk8vV1J5?=
 =?utf-8?B?M2lnUXRXQlVKL1pHTXMyREtOVnV4aUo0T1pJbTdpYTZLOHQ4OHZRNzVHNnZn?=
 =?utf-8?B?Y0FSaGFTajVxczh1RkwxRVRyMzNZOEVBeDFCeDV3M3dtRnpPVENIYml5cFFs?=
 =?utf-8?B?am0xREY0dVhyTFhLWk45UXBLOWZHWWhuWElXQmFGNkFZWlV1SkdGWTMyRldl?=
 =?utf-8?B?ZU9lQTh0UStPWVA2UVhMRGd2aHRDbFpleFEyTGlPTkt4TmlTZllJY2lxTDFZ?=
 =?utf-8?B?N1hXVUYvSTI4VTNUQWNkZGcwTjR5VjlnT0pJZU1HRVNhR1RuYnFleEZSTEx3?=
 =?utf-8?B?OVlJZGlTUTRIVUZyd2tlbGppY0xEZ1ZHSjZMWEhxM0NHYitoamNKWXhTa044?=
 =?utf-8?B?ODFzQTNtMUc0TnVrRmdEQ296eXY1UDNsNm1vMXNtVkgwYWNFMmV1UlhiSGRo?=
 =?utf-8?B?dW1IQW9xaW82RUs2WVRySEYraDA0UUw5QzhLNTJvOFNwQ1FqVFN2UCt4ZFZT?=
 =?utf-8?B?K0FIajZvcWdNMVF0OWJKcXdDcTgwUHg5ZldpckJ3aktyNXA3SGt5QT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5450.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2d23ce5-e38b-449d-96d4-08da1870dead
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2022 08:30:27.6731 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ln+/GNivYAO1R0c4xAGP3XOOzHG/j7RACLfHDk495c+Wl5oucfkqy2E2Zv7+35bdpFVqwTN1R4RhORrkkoVP5A==
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
 "cai.huoqing@linux.dev" <cai.huoqing@linux.dev>,
 "maxime@cerno.tech" <maxime@cerno.tech>,
 "amuel@sholland.org" <amuel@sholland.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSGFucyBWZXJrdWls
IDxodmVya3VpbC1jaXNjb0B4czRhbGwubmw+DQo+IFNlbnQ6IDIwMjLlubQ05pyINuaXpSAxNzo0
Nw0KPiBUbzogU2FuZG9yIFl1IDxzYW5kb3IueXVAbnhwLmNvbT47IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmc7DQo+IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGFuZHJ6ZWou
aGFqZGFAaW50ZWwuY29tOw0KPiBuYXJtc3Ryb25nQGJheWxpYnJlLmNvbTsgcm9iZXJ0LmZvc3NA
bGluYXJvLm9yZzsNCj4gTGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tOyBqb25hc0Br
d2lib28uc2U7DQo+IGplcm5lai5za3JhYmVjQGdtYWlsLmNvbQ0KPiBDYzogUy5KLiBXYW5nIDxz
aGVuZ2ppdS53YW5nQG54cC5jb20+OyBjYWkuaHVvcWluZ0BsaW51eC5kZXY7DQo+IG1heGltZUBj
ZXJuby50ZWNoOyBoYXJyeS53ZW50bGFuZEBhbWQuY29tOyBhbXVlbEBzaG9sbGFuZC5vcmcNCj4g
U3ViamVjdDogW0VYVF0gUmU6IFtQQVRDSCB2MSAxLzVdIGRybTogYnJpZGdlOiBkd19oZG1pOiBj
ZWM6IEFkZCBjZWMNCj4gc3VzcGVuZC9yZXN1bWUgZnVuY3Rpb24NCj4gDQo+IENhdXRpb246IEVY
VCBFbWFpbA0KPiANCj4gSGkgU2FuZG9yLA0KPiANCj4gT24gMDYvMDQvMjAyMiAxMDo0OCwgU2Fu
ZG9yLnl1QG54cC5jb20gd3JvdGU6DQo+ID4gRnJvbTogU2FuZG9yIFl1IDxTYW5kb3IueXVAbnhw
LmNvbT4NCj4gPg0KPiA+IENFQyBpbnRlcnJ1cHQgc3RhdHVzL21hc2sgYW5kIGxvZ2ljYWwgYWRk
cmVzcyByZWdpc3RlcnMgd2lsbCBiZSByZXNldA0KPiA+IHdoZW4gZGV2aWNlIGVudGVyIHN1c3Bl
bmQuDQo+ID4gSXQgd2lsbCBjYXVzZSBjZWMgZmFpbCB0byB3b3JrIGFmdGVyIGRldmljZSByZXN1
bWUuDQo+ID4gQWRkIENFQyBzdXNwZW5kL3Jlc3VtZSBmdW5jdGlvbnMsIHNhdmUgdGhlc2UgcmVn
aXN0ZXJzIHN0YXR1cyB3aGVuDQo+ID4gc3VzcGVuZCBhbmQgcmVzdG9yZSB0aGVtIHdoZW4gcmVz
dW1lLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogU2FuZG9yIFl1IDxTYW5kb3IueXVAbnhwLmNv
bT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1p
LWNlYy5jIHwgMzUNCj4gPiArKysrKysrKysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCAzNSBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLWNlYy5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL3N5bm9wc3lzL2R3LWhkbWktY2VjLmMNCj4gPiBpbmRleCBjOGY0NGJjYjI5OGEuLmNlYjYx
OWIzMmZkZSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lz
L2R3LWhkbWktY2VjLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lz
L2R3LWhkbWktY2VjLmMNCj4gPiBAQCAtMTgsNiArMTgsOCBAQA0KPiA+DQo+ID4gICNpbmNsdWRl
ICJkdy1oZG1pLWNlYy5oIg0KPiA+DQo+ID4gK3N0YXRpYyB1OCBjZWNfc2F2ZWRfcmVnc1s1XTsN
Cj4gDQo+IEV3d3csIG5vdCBhIGdsb2JhbC4gSnVzdCBzYXZlIGl0IGluIHN0cnVjdCBkd19oZG1p
X2NlYy4NCg0KPiANCj4gPiArDQo+ID4gIGVudW0gew0KPiA+ICAgICAgIEhETUlfSUhfQ0VDX1NU
QVQwICAgICAgID0gMHgwMTA2LA0KPiA+ICAgICAgIEhETUlfSUhfTVVURV9DRUNfU1RBVDAgID0g
MHgwMTg2LCBAQCAtMzA2LDExICszMDgsNDQNCj4gQEAgc3RhdGljDQo+ID4gaW50IGR3X2hkbWlf
Y2VjX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+ICAgICAgIHJldHVy
biAwOw0KPiA+ICB9DQo+ID4NCj4gPiArc3RhdGljIGludCBfX21heWJlX3VudXNlZCBkd19oZG1p
X2NlY19yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KSB7DQo+ID4gKyAgICAgc3RydWN0IGR3X2hk
bWlfY2VjICpjZWMgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4gPiArDQo+ID4gKyAgICAgLyog
UmVzdG9yZSBsb2dpY2FsIGFkZHJlc3MgYW5kIGludGVycnVwdCBzdGF0dXMvbWFzayByZWdpc3Rl
ciAqLw0KPiA+ICsgICAgIGR3X2hkbWlfd3JpdGUoY2VjLCBjZWNfc2F2ZWRfcmVnc1swXSwgSERN
SV9DRUNfQUREUl9MKTsNCj4gPiArICAgICBkd19oZG1pX3dyaXRlKGNlYywgY2VjX3NhdmVkX3Jl
Z3NbMV0sIEhETUlfQ0VDX0FERFJfSCk7DQo+IA0KPiBObyBuZWVkIHRvIHN0b3JlIEhETUlfQ0VD
X0FERFJfTC9SLCBqdXN0IHVzZSBjZWMtPmFkZHJlc3Nlcy4NCkFncmVlLCBJIHdpbGwgdXNlIGl0
IGxhdGVyLg0KPiANCj4gPiArICAgICBkd19oZG1pX3dyaXRlKGNlYywgY2VjX3NhdmVkX3JlZ3Nb
Ml0sIEhETUlfQ0VDX1BPTEFSSVRZKTsNCj4gPiArICAgICBkd19oZG1pX3dyaXRlKGNlYywgY2Vj
X3NhdmVkX3JlZ3NbM10sIEhETUlfQ0VDX01BU0spOw0KPiA+ICsgICAgIGR3X2hkbWlfd3JpdGUo
Y2VjLCBjZWNfc2F2ZWRfcmVnc1s0XSwNCj4gSERNSV9JSF9NVVRFX0NFQ19TVEFUMCk7DQo+IA0K
PiBUaGlzIGRvZXNuJ3QgY2FsbCBjZWMtPm9wcy0+ZGlzYWJsZS9lbmFibGUuIEl0IG1pZ2h0IGJl
IGJldHRlciB0byBqdXN0IGNhbGwNCj4gZHdfaGRtaV9jZWNfZW5hYmxlKCkgYW5kIHN0b3JlIHRo
ZSBlbmFibGUgc3RhdGUgaW4gc3RydWN0IGR3X2hkbWlfY2VjLg0KSWYgY2FsbCBjZWMtPm9wcy0+
ZGlzYWJsZS9lbmFibGUgaW4gc3VzcGVuZC9yZXN1bWUsIENFQyBzdGFjayB3aWxsIGJlIHJlc2V0
Lg0KQ0VDIHVzZXIgc3VjaCBhcyBFQVJDL0FSQywgdGhlIENFQyBsaW5rIGlzIGV4cGVjdCBrZWVw
IGluIGFjdGl2ZSBhZnRlciBkZXZpY2UgcmVzdW1lLg0KU28gSSBwcmVmZXIgb25seSBzYXZlIHRo
b3NlIHJlZ2lzdGVycyBmb3IgYmV0dGVyIHVzZXIgZXhwZXJpZW5jZS4NCj4gDQo+IFJlZ2FyZHMs
DQo+IA0KPiAgICAgICAgIEhhbnMNCj4gDQpUaGFua3MNClNhbmRvcg0KPiA+ICsNCj4gPiArICAg
ICByZXR1cm4gMDsNCj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIGludCBfX21heWJlX3VudXNl
ZCBkd19oZG1pX2NlY19zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikgew0KPiA+ICsgICAgIHN0
cnVjdCBkd19oZG1pX2NlYyAqY2VjID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQo+ID4gKw0KPiA+
ICsgICAgIC8qIHN0b3JlIGxvZ2ljYWwgYWRkcmVzcyBhbmQgaW50ZXJydXB0IHN0YXR1cy9tYXNr
IHJlZ2lzdGVyICovDQo+ID4gKyAgICAgY2VjX3NhdmVkX3JlZ3NbMF0gPSBkd19oZG1pX3JlYWQo
Y2VjLCBIRE1JX0NFQ19BRERSX0wpOw0KPiA+ICsgICAgIGNlY19zYXZlZF9yZWdzWzFdID0gZHdf
aGRtaV9yZWFkKGNlYywgSERNSV9DRUNfQUREUl9IKTsNCj4gPiArICAgICBjZWNfc2F2ZWRfcmVn
c1syXSA9IGR3X2hkbWlfcmVhZChjZWMsIEhETUlfQ0VDX1BPTEFSSVRZKTsNCj4gPiArICAgICBj
ZWNfc2F2ZWRfcmVnc1szXSA9IGR3X2hkbWlfcmVhZChjZWMsIEhETUlfQ0VDX01BU0spOw0KPiA+
ICsgICAgIGNlY19zYXZlZF9yZWdzWzRdID0gZHdfaGRtaV9yZWFkKGNlYywNCj4gSERNSV9JSF9N
VVRFX0NFQ19TVEFUMCk7DQo+ID4gKw0KPiA+ICsgICAgIHJldHVybiAwOw0KPiA+ICt9DQo+ID4g
Kw0KPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGRldl9wbV9vcHMgZHdfaGRtaV9jZWNfcG0gPSB7
DQo+ID4gKyAgICAgU0VUX1NZU1RFTV9TTEVFUF9QTV9PUFMoZHdfaGRtaV9jZWNfc3VzcGVuZCwN
Cj4gZHdfaGRtaV9jZWNfcmVzdW1lKQ0KPiA+ICt9Ow0KPiA+ICsNCj4gPiAgc3RhdGljIHN0cnVj
dCBwbGF0Zm9ybV9kcml2ZXIgZHdfaGRtaV9jZWNfZHJpdmVyID0gew0KPiA+ICAgICAgIC5wcm9i
ZSAgPSBkd19oZG1pX2NlY19wcm9iZSwNCj4gPiAgICAgICAucmVtb3ZlID0gZHdfaGRtaV9jZWNf
cmVtb3ZlLA0KPiA+ICAgICAgIC5kcml2ZXIgPSB7DQo+ID4gICAgICAgICAgICAgICAubmFtZSA9
ICJkdy1oZG1pLWNlYyIsDQo+ID4gKyAgICAgICAgICAgICAucG0gPSAmZHdfaGRtaV9jZWNfcG0s
DQo+ID4gICAgICAgfSwNCj4gPiAgfTsNCj4gPiAgbW9kdWxlX3BsYXRmb3JtX2RyaXZlcihkd19o
ZG1pX2NlY19kcml2ZXIpOw0K
