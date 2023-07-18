Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBE575720A
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 04:58:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 442DF10E055;
	Tue, 18 Jul 2023 02:58:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0c::61c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0A8510E055
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 02:58:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YaiWvSFZW67Cn3ZQ/8wHmg2BWteqBNUjAwkMeR4FhHq6u4f3RGT3JR7znQoqCiFUBbLhp6KND/aHftbUWUKI6F03wWFAaa8S1i4lM3sUzbHNrmt660lyqsJaoQgraHoGhiLLZY117RKmtLXEbM7y4rdQ1zZJGLWe9i4LHal5u90e0I/TESpcKono0NYkrdZuVUw07S1J4YwWn/ZrL+UK7UTB//UJ/yRElItOohGMLscWjvMmlaDcLMGMCTazA0DKOqdnofv6w1Er6cdP4YhBnAAgjFR/UvPgpZvL75aM6WqAVOa2K9Wt8Io4d1ZyStBBLzv8xB+1Lor8B0FlWLuMNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SfTmxRHymJ7hrAvWNYYfvJ9KAdCdlwWlRPIEWQWR8lM=;
 b=Awa+kTuuXWYh72rU8M3sTwIrGV+u5MOQIC+kEKsXbTgOy2ZKGImG4LYdUgg+C1ydpZOZ22S4S+aaqxVDj+MMLEFqp1s9K6QNeCXDN+k/O0t0Z07CjRBBMxbJIno18UIPfgaD+xGQ8Vluvv16R0/9jcRhKcUe8Fw5irRr9ngLT+nAJAo574BX7EeURPu3ri7WXjx1NCp4CGuNjhONlYnPjg8zak0h0U3vIG6FCChaj7Aq9Yc5UulaEFYfts4QzjO9UnvxSRuoMMzUXbzHlO3HpP/7Y+OeugXttZ2xqtm3WenAcHAjUOS5vwBmOE3BZKJmEbFtVy2kwXeDfEva/8NbDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SfTmxRHymJ7hrAvWNYYfvJ9KAdCdlwWlRPIEWQWR8lM=;
 b=oxDSuZ1+tbhTD0ca09XolM4zrsDBqp5fdGZU2DytDuUeC/SDC7x54BLgfbqNInqHEdL5bhLA1zwNULei8UelLyJKK7uARtz5bQ1m8AIoPRByWJhILy53DcEtJwL55wd6ccEvaU31W8kv+SnENUfEXCHcTZcf9pfcZkBeHoYQJPs=
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB8883.eurprd04.prod.outlook.com (2603:10a6:20b:42e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Tue, 18 Jul
 2023 02:58:11 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::7af:d8d5:d0ce:f68e]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::7af:d8d5:d0ce:f68e%2]) with mapi id 15.20.6588.027; Tue, 18 Jul 2023
 02:58:11 +0000
From: Ying Liu <victor.liu@nxp.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: RE: [PATCH 9/9] drm/bridge: imx: Add i.MX93 MIPI DSI support
Thread-Topic: [PATCH 9/9] drm/bridge: imx: Add i.MX93 MIPI DSI support
Thread-Index: AQHZuHX2kU9tVwb+/k68aHvm3zH4HK+9gzeAgAFOwzA=
Date: Tue, 18 Jul 2023 02:58:11 +0000
Message-ID: <AM7PR04MB7046BF03266ED1CE21CFC3A99838A@AM7PR04MB7046.eurprd04.prod.outlook.com>
References: <20230717061831.1826878-1-victor.liu@nxp.com>
 <20230717061831.1826878-10-victor.liu@nxp.com>
 <CAMty3ZAdzASJCz+j4iOTJ+wCXWP2Z48jFL687kxDmJLPU7T6gA@mail.gmail.com>
In-Reply-To: <CAMty3ZAdzASJCz+j4iOTJ+wCXWP2Z48jFL687kxDmJLPU7T6gA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR04MB7046:EE_|AS8PR04MB8883:EE_
x-ms-office365-filtering-correlation-id: f9c43a70-d1aa-4329-8e5a-08db873ad283
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dLEI5jIRuWlkLywXp+X4O3x3O71lH4+spHtZQzS3SZX7Y/aAh9DXvUT4HKZCx4C6Wg3ad/HIjfImR8Ex+aWYDjjetJaqvQCShiEKvW7/oQzm++JJbYl3VplarKhfzCSTiiKduzGqOLHx2RX1n7avMqZxRecrGWYdA3iaAR8ZkrZ0GBuQuXbagFrvf10b5NrQn5ZrEvwIrF2NO7ft+2eMRevdqGmD3DfsnJ4XUBMa4VokQDCAoE9/JaJF6jtbaIJkuBxu3zx+gQGdw/lZFKZAHTi9Igi1IU0Uy1qxUE8kSC8vMa2a/QJ8t3y6ZUu6EDqRkbS17MdQI3a63hHY3wUDiS14lA3mKkXumKJZdwODXq2YFVj4cCIPxR2IHDNKyGDhipTR9G7tttYzjT2IBWvxD2LqVcruLZTqHqoQqingiCdojynebmYt63iTJBk5dMZn5HLjyjR+7L0LflQpz42s7zIZsatczFKx3GkiDPpIx58TdkzMciMzAM9eECy6FVPtOOwwRe8AP+PFC015RoPiu0F5ttm4Z5te2JRPE3dX170FFSW3cic52V2g4PggBOIqlQ5JsM91SNnFbyrVJjwDOOJxnMtbDuDFfIEhR5njeYJTVSbm5JSIk2S1al7dGHt6
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(376002)(346002)(39860400002)(366004)(136003)(451199021)(71200400001)(33656002)(6506007)(38100700002)(186003)(26005)(55016003)(478600001)(38070700005)(53546011)(54906003)(66476007)(7416002)(8676002)(41300700001)(7696005)(66946007)(66446008)(2906002)(8936002)(66556008)(6916009)(316002)(4326008)(52536014)(5660300002)(9686003)(64756008)(86362001)(122000001)(76116006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cFZnWEZUaUVSSGw4ZG5VT09iSGlKNHhuNS9xQVRHSkJVamtyMzFnR2pabUgy?=
 =?utf-8?B?MEJkK0NvTExDRkVmemlteS9jUGl3QmtweDVYdHJqbHFQVlArdDd1dDRmNlZ0?=
 =?utf-8?B?a1pVd0J1TUc1R09zQk0zd0hsL1lPTG9ldVY2ZmhvQWcwRDB4eUhvZGJXZFRo?=
 =?utf-8?B?aHdSdXhtK0RCTlM1MTFtRjJGdVJ6c1lBYWN2YzZnRUdKRlRlTEJiMW45blNp?=
 =?utf-8?B?UVJaRXppNW9qLzJxK3NwQmhrMVZFQmx0dFhVNzdyMkpLV0JKQ251N1JRUHdj?=
 =?utf-8?B?MGZRdkNFZGN6YTJReDNPOTN0bjFSZXBjU2pOWDZ4V0JxUTNWd0t5NllUbVlZ?=
 =?utf-8?B?cytoRzJnak9IL083S3dENVV3alFPSXhxYXlLZDA0SHV0TDhvKzc0bitxQ05W?=
 =?utf-8?B?S3NDYk0yaitQL2hneW9qaGlzYW1RdDE3ajB2VVFwNzFNU29qTG56ai9FS0h4?=
 =?utf-8?B?Nld4blNBajdlVWhVZGpJN2hWK1pTT0krdmc4RFB0MWpGaFYrZmt5Q2hIbUJM?=
 =?utf-8?B?L1RvK1ppampxWGtQZXdvdGVWMHY0R2xBOXN2TTFpRHpmZ0dUaTZqMUNjNEsy?=
 =?utf-8?B?WjdVOFVmNjJzSmgrV3V3bzRSU1BwbHRMUXlGbzFtbTlVNVdQYXFWenlGSE5X?=
 =?utf-8?B?SDNCRlNNN2dMNm9VY1p2MWJCd2E4VDJ6UUlnSDBRZWZMNFBsTUpDZ3BRZ3ly?=
 =?utf-8?B?ZTdWZTk1RFFkQ2NCMWJkVkhSbDhLNEUyWGJkbjJVRmIxdHd3Q2dWZVBtUFpE?=
 =?utf-8?B?THU5QnB0Rm5nS1R5bTBkYnJucGtzTkdnaVpTZENaTmphc3I4WUtFWU10aHlJ?=
 =?utf-8?B?MVo3SFBsNGJ0YkVNdmU5V0JmVXVGUjR4Q3JPTEk1MjdZQVR3TUpPZi9YZTFi?=
 =?utf-8?B?ckZYVFR1dncvUWlqQ1NDbHFKVEhBY3lITzE5MHdqVW1GcHkzK25DM2FxUFZJ?=
 =?utf-8?B?eXFjOGFHa0p3V0xnWnZaZXNjV1JhZFBuU3QvOXoxQkt4Q1VQSzlTZ2R3Ym1r?=
 =?utf-8?B?YkwxYW9RRjFocTBBTG1zWGpvRElxME14K29vQ3kyNC8vbWRKMTVoa2o5cjFB?=
 =?utf-8?B?WGk1UVp1S1UwWUVQZHVDQ1JRbzgyWGFBUUZ4cjl5VFlESGdsTi9jYU82VHJo?=
 =?utf-8?B?RWkwcTY1bTUzeVlENkJZbkhSNDREWm44ZDA0UDI3VmNLallrSVRQdzR4a3NI?=
 =?utf-8?B?K2NDM3Vmb3hGYzVPZkNIYVFSZWJ4Z0k0ZWRMZURPanNjVndxcTZXK0pyNTlk?=
 =?utf-8?B?MXNrYlEyR205UXlQZjJxUFBZSk9QSGtCY1IzWTU1ZEVZZGVuWFdFV0xuWjVC?=
 =?utf-8?B?VU1jMUIxb3pkb2pJUUY1QnN0blFvQmdDSnN6SlVKL1VsRTB2YTM2NzR1eFRj?=
 =?utf-8?B?Umw2ZSt0WmhHcWVqR3JDa2sxSTVtVVJTMWh5OEFIelBmaExaSURFdEcrNmVt?=
 =?utf-8?B?Z2MvOUU4Z3hVWTY2RVpDMm01SnNLM1pnTFBNUEo4QUFTdXJjOThqRmJ0R1JL?=
 =?utf-8?B?L0FIWWdwYXYvb1ZMTXl6c2dTeGphYnpOVE1mdktQU09CcTIrdHk3SUhSTGtt?=
 =?utf-8?B?THBiSHdLWFpwZXpZMHRXdWVRM3JhaXdSRFVrbWsvdE9paUtITkhZZitBSnRT?=
 =?utf-8?B?UEtjWCs4bzFjMjNYdW91a0szV3RacEhnU1pYT3VZMU5wQmVGQTJLUit0TllH?=
 =?utf-8?B?aUtBWkNCVTd6eVYxbG9DQ09hTE1rVVNuc2lpS1l2cHZMOEYrRThTcVhTckp2?=
 =?utf-8?B?a2p4NGpIOENiRCswbE5YWXMybUpRMGs0SGRBUk1OcVprV0hYZnA5R3VNdTdn?=
 =?utf-8?B?YVpQMXorZEpHbU9mV3NlOHUwTTJrbE1xY1lHUHJoYXVvbTVqdWMzdUNKbTdC?=
 =?utf-8?B?ZXZYSHBidmlEUGcxOVdQY3VLR0VqeElzYmQ4WVpSM2RTNjZwaEVtYXEyK0sv?=
 =?utf-8?B?M085TXNNZmorMXpFRlMzaHgxL1E2K1Z5d0pLOVBFS0VXOXZLcG9WdDVhQlMr?=
 =?utf-8?B?UjViS1B4bWdvNS9ISGduOU81ZmUxanAzWXptZy80bzBzR1daWHg0OGtqQWlJ?=
 =?utf-8?B?WEVFZHB4STlJbXAxejU5Y2dMVmh1WnRPSGMvRFVrNFZOb1M4MEdIbjJza0RK?=
 =?utf-8?Q?Bh/g=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9c43a70-d1aa-4329-8e5a-08db873ad283
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2023 02:58:11.2479 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ++XvpqHYh8cd84qHnu2PwwfcaFen0Ephj6UpoBf31+DAj7/k/3LB8nZk3kAHUScHdTZlHlQZ4uUOFQEDTpHISA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8883
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
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "rfoss@kernel.org" <rfoss@kernel.org>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, dl-linux-imx <linux-imx@nxp.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFnYW4sDQoNCk9uIE1vbmRheSwgSnVseSAxNywgMjAyMyAyOjQ0IFBNIEphZ2FuIFRla2kg
PGphZ2FuQGFtYXJ1bGFzb2x1dGlvbnMuY29tPiB3cm90ZToNCj4gT24gTW9uLCBKdWwgMTcsIDIw
MjMgYXQgMTE6NDTigK9BTSBMaXUgWWluZyA8dmljdG9yLmxpdUBueHAuY29tPiB3cm90ZToNCj4g
Pg0KPiA+IEZyZWVzY2FsZSBpLk1YOTMgU29DIGVtYmVkcyBhIFN5bm9wc3lzIERlc2lnbndhcmUg
TUlQSSBEU0kgaG9zdA0KPiA+IGNvbnRyb2xsZXIgYW5kIGEgU3lub3BzeXMgRGVzaWdud2FyZSBN
SVBJIERQSFkuICBTb21lIGNvbmZpZ3VyYXRpb25zDQo+ID4gYW5kIGV4dGVuc2lvbnMgdG8gdGhl
bSBhcmUgY29udHJvbGxlZCBieSBpLk1YOTMgbWVkaWEgYmxrLWN0cmwuDQo+ID4NCj4gPiBBZGQg
YSBEUk0gYnJpZGdlIGZvciBpLk1YOTMgTUlQSSBEU0kgYnkgdXNpbmcgZXhpc3RpbmcgRFcgTUlQ
SSBEU0kNCj4gPiBicmlkZ2UgaGVscGVycyBhbmQgaW1wbGVtZW50aW5nIGkuTVg5MyBNSVBJIERT
SSBzcGVjaWZpYyBleHRlbnNpb25zLg0KPiANCj4gSSB0aGluayB0aGUgYmV0dGVyIHdheSB3b3Vs
ZCBhZGQgY29tcGF0aWJpbGl0eSB0byBiZSBwYXJ0IG9mIGV4aXN0aW5nDQo+IGR3LW1pcGktZHNp
LmMgd2l0aCBzcGVjaWZpYyBkcml2ZXIgZGF0YS4gVGhpcyB3YXkgaXQgYXZvaWRzIGFsbCB0aGUN
Cj4gcGxhdGZvcm0tcmVsYXRlZCBoZWxwZXJzKGV4dGVuc2lvbnMpIGFuZCBtYWtlcyB0aGUgZHJp
dmVyIGdlbmVyaWMgdG8NCj4gYWxsIFNvQ3Mgd2hpY2ggdXNlIERXIERTSSBJUC4gSXQgd291bGQg
YmUgYSBzdHJhaWdodGZvcndhcmQgY2hhbmdlIGFzDQo+IHRoZSBpbXg5MyBkcm0gcGlwZWxpbmUg
YWxyZWFkeSBzdXBwb3J0cyBicmlkZ2UgdG9wb2xvZ3kuDQoNClRoZSBwbGF0Zm9ybS1yZWxhdGVk
IHN0dWZmIGlzIGhhbmRlZCBvdmVyIHRvIGR3LW1pcGktZHNpLmMgdmlhIHN0cnVjdA0KZHdfbWlw
aV9kc2lfcGxhdF9kYXRhIGFzIGFuIGFyZ3VtZW50IG9mIGR3X21pcGlfZHNpX3Byb2JlKCkuICBJ
dCBsb29rcw0Kb2sgZm9yIHZlbmRvciBkcml2ZXJzIHRvIGNhbGwgZHdfbWlwaV9kc2lfcHJvYmUo
KSB0byBzZXQgdGhlIHBsYXRmb3JtLXJlbGF0ZWQNCmluZm9ybWF0aW9uKHJvY2tjaGlwLCBtZXNv
biBhbmQgc3RtIGRvIHRoYXQpLCBsaWtlIHBkYXRhLnBoeV9vcHMgYW5kDQpwZGF0YS5ob3N0X29w
cy4NCg0KZHctbWlwaS1kc2kuYyBpcyBnZW5lcmljIHcvd28gdGhpcyBwYXRjaCBzZXJpZXMuDQoN
CkNhbiB5b3UgZWxhYm9yYXRlIG1vcmUgYWJvdXQgYWRkaW5nIGNvbXBhdGliaWxpdHkgdG8gYmUg
cGFydCBvZiBleGlzdGluZw0KZHctbWlwaS1kc2kuYyB3aXRoIHNwZWNpZmljIGRyaXZlciBkYXRh
PyAgSSBkb24ndCBzZWUgY2xlYXIgYXBwcm9hY2ggdG8gZG8NCnRoYXQuDQoNClJlZ2FyZHMsDQpM
aXUgWWluZw0KDQo+IA0KPiBUaGFua3MsDQo+IEphZ2FuLg0K
