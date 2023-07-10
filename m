Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B301174CF8A
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 10:11:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17B1910E21B;
	Mon, 10 Jul 2023 08:11:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7d00::60e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA64110E21B
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 08:11:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VqBXin4boCuuAqVkzqNeBqJps8Mqb1bztv5IDs9PtJO8d2Ay8nF2KqhuYulhLya+Vp4XPWBzz5IiiH04S2l7t6YPD4BdbVR/9CSl2wX6I61orz+G1BHMkxaTxA4F4IuaCMwKNh7SZ9abyXNPOAo4Wbht3Hlvq7wpqxShG5S5oO0x7CbXkA21WLoqdFkQm9JkfNW9/E7xBvgGa8xNf0+FoFYz8WCqfqjMsbqQ8VC44w9CdNCvr+zwQxKl+hRCt6tppjxFExED1YNX58kCB699ptPZGhVzupRNU0XCw64xU0fXN9SBNbmTISXFSslLjmxCCGYdiiSZEe+zIvU/8Zq+GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7p2MoUdL6xoISiQS0uemGvF3mXZYJvKmKFJAMaU98pU=;
 b=Zjbj/dg3+2VGiuhIdbWPqGTG4vVsP/Qp8RTgQCciFgC3HTRozJS8+HRTpWDwe6LXQoHfp2uCkP16E8UwjRTGb31v4AVOVNxYoKSAz2bd8OfuXRLkne/vLyVW8yyI5ofLWqmG+nbnzQvMa2xKV6mzVVq5NjO/2SoflAG7RPOb6mb23v+f6S1lU98RfP2tUSmAv7D58/LVsLrd7b9nk4Vp0Id6+PhjRPuVUlZUoLnJ4GzRcyWKbVvAkgstUBwLU75EvbESQ2h2CVKpGU9Tb8ObFyGsYTSwPZk/k+nH7q6ZPAsSBJnzJ8DgkMbkImPxQGoZBZiaschJqGSuS3DqGLa3lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7p2MoUdL6xoISiQS0uemGvF3mXZYJvKmKFJAMaU98pU=;
 b=mqTCLh6wrxInODXiotj3VHMHaLHyQlqSQfvLraixEMy7vi2IElQupGgcv8ilWXbYdbIike89eFIsU4anPPP9Db8lwZOaPm3VoyKNdb63g6oasPZtw7Kq2rg5aQ6uVRtCmcBM1fg/QdIe5pDJjiLWVb9XQ/cWFmzZUj5/4fRYUvA=
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by DBBPR04MB7690.eurprd04.prod.outlook.com (2603:10a6:10:200::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 08:11:18 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::8af8:59df:c8ab:ff51]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::8af8:59df:c8ab:ff51%5]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 08:11:18 +0000
From: Sandor Yu <sandor.yu@nxp.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: RE: [EXT] Re: [PATCH v6 4/8] phy: Add HDMI configuration options
Thread-Topic: [EXT] Re: [PATCH v6 4/8] phy: Add HDMI configuration options
Thread-Index: AQHZnyaWSldT+9YfOk2MiOGSER4/uq+aTasAgBhbjaCAAB0kAIAAAGFggAAFm4CAAADIEA==
Date: Mon, 10 Jul 2023 08:11:18 +0000
Message-ID: <PAXPR04MB94484B72902FDEB4858FE5ACF430A@PAXPR04MB9448.eurprd04.prod.outlook.com>
References: <cover.1686729444.git.Sandor.yu@nxp.com>
 <cec469206a166c4b070fd7d7bbf89a8df656ccc6.1686729444.git.Sandor.yu@nxp.com>
 <6f590bb6-7d17-3ae8-684d-2d4403d6ff55@linaro.org>
 <PAXPR04MB9448598256524162A74F0311F430A@PAXPR04MB9448.eurprd04.prod.outlook.com>
 <8966feba-eef9-2ea3-dbec-13fc53232a6b@linaro.org>
 <PAXPR04MB9448480F2A0E0542942A661AF430A@PAXPR04MB9448.eurprd04.prod.outlook.com>
 <CAA8EJppbbeZB-pdPdg+gft+kS8Pzsxvqd9v6DsRNwTkL71XSJQ@mail.gmail.com>
In-Reply-To: <CAA8EJppbbeZB-pdPdg+gft+kS8Pzsxvqd9v6DsRNwTkL71XSJQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9448:EE_|DBBPR04MB7690:EE_
x-ms-office365-filtering-correlation-id: 3df8aff0-c008-41f2-4bb2-08db811d3d55
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nSNm6RfIBmZCMdd+wQrZLDFm0D8ZrJrXamYtwSfdmB+CGWMafXJYbWATpQdJbHQQkwNVJmXiE2UoFB+GtqkjjBnnARmN+zOd2MJeRSPniqwQDsKLB4ligkPwPugKI79sE0nwuJyhIAdKR+QuQ+GAC+Py1wzCADAtQiOyttn9gdRL8GmlEQ9gc9L+9lFgxl7RCokFzWc44dApSNDbNb6JzkKnZeup9vjyB/mHYQRl1IX6ctHQKWvntaNLMgMo+8F0etevytsSckOI7CzZa5LlG0yIbYtlxxQ/PRJzYkabjozSUz9Qj+yRJVr5moU/OYSYj0O0ztwqtIsVgZUDmtgJ2C5KlLAVaD7bLQFi9Sv6EvsC90ZriWShgglGnj2bEJyI+u6+ILlNyfOBCpYwf9+SWtgYg2rcE6LroXy+MguaVKRuiOACv5Tq4QooYkzhzfdqSsd/6cIF8ZeIbTAn4zi2njw2j+5zGb6NSWj9zzOAB9QgigBcQI+T4fTkJBspDsPdVznQvZjrkCa0ZsXB0UNtZJldsptB83YYf7iXVFDGkWedN8QMTMzNGBmnfeiMqYMjoUtXux089QB53TnHa9gb0r7DkUWiDbscvTyUGek8sNi3e8gEkdgkp+skcLTHzf9b
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(39860400002)(136003)(376002)(346002)(396003)(451199021)(7696005)(478600001)(76116006)(54906003)(71200400001)(83380400001)(38070700005)(33656002)(86362001)(55016003)(2906002)(66946007)(186003)(6506007)(53546011)(9686003)(38100700002)(122000001)(64756008)(8676002)(6916009)(4326008)(66446008)(316002)(66556008)(66476007)(41300700001)(5660300002)(8936002)(7416002)(44832011)(52536014);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WWg1ZlBWdXBzNHcyT2FkU0wreklNM25lRHFIWTJGdVFBM1ZQYUdqM21FbUho?=
 =?utf-8?B?WnQyanFxLzc2MTZrZFUyUVpMZ1VrV2pNZSs3Tk5oMjF1WTlsdzRQbzFBZmpz?=
 =?utf-8?B?NUd1YmhVSWJ5ZThwWU92M3BGS3Q2V05WR3AvbVgvQzNzTVBJRHpBNm5RV3Bw?=
 =?utf-8?B?Qm1sNGtGVDg0UFJTdjlHZzZEUXdnQ3VBWVRZSHNIcW1MUkxZYjk2RmNnWVUz?=
 =?utf-8?B?eHA3eXdhQTNoRkhMckNtQ2VjOXpCaFNBb3BGNXQ3NldqZ3FYeldQbFlQdEZu?=
 =?utf-8?B?QmJwZTlvbXdXVSt3MlowMkhQcnI2bER2eDlUM0tkTkZvcVVzRVZEalJRbnFi?=
 =?utf-8?B?TldIbjJVT09keEppVm0yTEJsYTZUNlkxeS8wRUY2d25SZGFvNXlaVkVYUjJI?=
 =?utf-8?B?Umo0V1ZSTWxabFpsa3dQcGdXK3REaUxwOTF5N2FkY21hWFE1dy8zQjhFTDFr?=
 =?utf-8?B?WkhEWGg2aWo0K1JrcUlETWVORE92dEhoRGlNeFpuczNUekR4V0wvS3gyT3ZG?=
 =?utf-8?B?MjBQaGdqWm1wV1JLL0FNbzRpaDhGN1hCVUhXZTE2UTZpaGdCYmdTWVNJV3hk?=
 =?utf-8?B?MlNMNkVKMjVtK0szTjJzbGt1ZW1pbWFIN3NCMVNzUmhTd2Z4dG9ibWtpeHND?=
 =?utf-8?B?MUpIMWZTN3dVWVM3WFVieEdRVTB4aVF4RGEzc2J0R0xJYm13U3dpWC9GanVY?=
 =?utf-8?B?YXY3cC9yNDQwcFVsbW42SUp1cGkxd1FuTGlIMHpoeVh3dkkvQ0c0OHQ0amwz?=
 =?utf-8?B?bUpGVTFIeUNZcnZlVnp4a1Q4aDdXZDRTMytOZ20yUENXVEJiai9hWlRVRmdk?=
 =?utf-8?B?SWczUVI1bXdDV3pxTk1CN0hZT2tMbXB3S2RnNXBwNGhBRzM4K201Z1RhKzlr?=
 =?utf-8?B?Rlc2SVRGUHRSazJkTlkyYTVMdmcrQzd2UGVVNVBHdXV1SU9KaUNJM2NEUFIr?=
 =?utf-8?B?MUZ2TituQlFZLzd2Ym8vTXU0R2VSQWd1NzhYMGtGelkrZDI4YW0zMm9ON1Q5?=
 =?utf-8?B?WklWVWh2VHpVUDFaOVpVbzlhM0xWYS9Wd2xCVGg1Vk5xanEzMW8xaVhiRTZI?=
 =?utf-8?B?RzQ5WU92YW9CZlpKSWJwTUQ1QjZOWkQ0bll5UVorOFVYLzBDU2xNdk04ZzA0?=
 =?utf-8?B?NU5nZTE2VFBHU1pwM0dOaGNUZTZ0bUhFVjhmSklwdXRiU1NrdWNKMUZKRklx?=
 =?utf-8?B?bjMvMnZ6bUluU2pacmVXbWVpdm1PUXFJUzFJMXduTTJNTXE0T1g5UEJqVzFB?=
 =?utf-8?B?bFdKdXp2WUVqUlFvNjJnSHh6ZVJhaGowbEhUMmNGMlBqd2FrZlI1WlM2Wjhu?=
 =?utf-8?B?TzJPd25YU2pvQlBrcXVOaFIyeHQ1MFRnWnVva0d1VDROcjRLemRwV3B4RjYx?=
 =?utf-8?B?c1BQTm92Y3puNzQ5N2NLZXF6MXBSMjZGbzE3TDFYVlc2ZnpUdytGc2JkenNV?=
 =?utf-8?B?dkxLbEJVdTg0a3dLeE0xL0xoWko3SUVYWWhKS0t5UnkrYVBBY0c5aFRSOWs0?=
 =?utf-8?B?ZmZndm9zR0VuWVRXMjZ6OXQrU29BTWljeW9HMWZ2NEZPK0pGTm9kMkFzWkhw?=
 =?utf-8?B?Q2FzSTZ1ZWYyVWFKMFY2OTZFU1FESUpZcEprcWZoOTNmYXdhd2J2NGN5Vmoz?=
 =?utf-8?B?K2RlUmcrSmF5RUU0VXNoWEpnZm5vdnlUcTF3OFR6OVNBZnFHMzBiSXIvbzVM?=
 =?utf-8?B?TlZCQW52dXRYT1R4QXd4c0dvaVpMaU5BK0IzNjdDeFpBZWVYUnJsRkdQMWhp?=
 =?utf-8?B?ekNVd1NWZjB0TDlRbitVTHEvdVRTSjhNUGIycXpGK0RSL2RyQWovbVdTUllZ?=
 =?utf-8?B?em8vS0lWMS9RYnF0UktrQXF0NTgyN001QUlienl0ODBCbjZZeVA0MFhqdmpN?=
 =?utf-8?B?L0EwdlZ1WXErZnJvdnErcDdhRWl3VlRhb0FkRkpmOWtPWUh5Uk8wRXh4enBj?=
 =?utf-8?B?T3pPRERQeDBnYjd3aVB0aWlEcjE5YUhvTkM3NVdEOTlqQjFyb0xXRHZkcVhw?=
 =?utf-8?B?MzJXY29CUlEyRUZGSHFoZ3B5TUNCVlRGRDdnekNoOE1yQVJFbVBOdnE4ZDBx?=
 =?utf-8?B?QU1pOWRES0JsRE1nZDlnZGVyOXhvMkdvQ0hHdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3df8aff0-c008-41f2-4bb2-08db811d3d55
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2023 08:11:18.5901 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TDG4bCGnOQKODWRmbDAXNDSdp7KJhniaKzRAXSiiQ5ajQfvslBOpD/niD3mxUIkTrUH/Ry2UtEnKmY6xjDWG8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7690
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
Cc: "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 dl-linux-imx <linux-imx@nxp.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Oliver Brown <oliver.brown@nxp.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robert.foss@linaro.org" <robert.foss@linaro.org>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQo+IA0KPiANCj4gT24gTW9uLCAxMCBKdWwgMjAyMyBhdCAxMTowMSwgU2FuZG9yIFl1IDxzYW5k
b3IueXVAbnhwLmNvbT4gd3JvdGU6DQo+ID4NCj4gPg0KPiA+DQo+ID4gPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogRG1pdHJ5IEJhcnlzaGtvdiA8ZG1pdHJ5LmJhcnlz
aGtvdkBsaW5hcm8ub3JnPg0KPiA+ID4gU2VudDogMjAyM+W5tDfmnIgxMOaXpSAxNTo0NA0KPiA+
ID4gVG86IFNhbmRvciBZdSA8c2FuZG9yLnl1QG54cC5jb20+OyBhbmRyemVqLmhhamRhQGludGVs
LmNvbTsNCj4gPiA+IG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc7IHJvYmVydC5mb3NzQGxpbmFy
by5vcmc7DQo+ID4gPiBMYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb207IGpvbmFzQGt3
aWJvby5zZTsNCj4gPiA+IGplcm5lai5za3JhYmVjQGdtYWlsLmNvbTsgYWlybGllZEBnbWFpbC5j
b207IGRhbmllbEBmZndsbC5jaDsNCj4gPiA+IHJvYmgrZHRAa2VybmVsLm9yZzsga3J6eXN6dG9m
Lmtvemxvd3NraStkdEBsaW5hcm8ub3JnOw0KPiA+ID4gc2hhd25ndW9Aa2VybmVsLm9yZzsgcy5o
YXVlckBwZW5ndXRyb25peC5kZTsgZmVzdGV2YW1AZ21haWwuY29tOw0KPiA+ID4gdmtvdWxAa2Vy
bmVsLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsNCj4gPiA+IGRldmljZXRy
ZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7
DQo+ID4gPiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsaW51eC1waHlAbGlzdHMuaW5m
cmFkZWFkLm9yZw0KPiA+ID4gQ2M6IGtlcm5lbEBwZW5ndXRyb25peC5kZTsgZGwtbGludXgtaW14
IDxsaW51eC1pbXhAbnhwLmNvbT47IE9saXZlcg0KPiA+ID4gQnJvd24gPG9saXZlci5icm93bkBu
eHAuY29tPg0KPiA+ID4gU3ViamVjdDogUmU6IFtFWFRdIFJlOiBbUEFUQ0ggdjYgNC84XSBwaHk6
IEFkZCBIRE1JIGNvbmZpZ3VyYXRpb24NCj4gPiA+IG9wdGlvbnMNCj4gPiA+DQo+ID4gPg0KPiA+
ID4gT24gMTAvMDcvMjAyMyAxMDoyOCwgU2FuZG9yIFl1IHdyb3RlOg0KPiA+ID4gPiBIaSBEbWl0
cnksDQo+ID4gPiA+DQo+ID4gPiA+IFRoYW5rcyBmb3IgeW91ciBjb21tZW50cywNCj4gPiA+ID4N
Cj4gPiA+ID4+IEZyb206IERtaXRyeSBCYXJ5c2hrb3YgPGRtaXRyeS5iYXJ5c2hrb3ZAbGluYXJv
Lm9yZz4gT24NCj4gPiA+ID4+IDE1LzA2LzIwMjMgMDQ6MzgsIFNhbmRvciBZdSB3cm90ZToNCj4g
PiA+ID4+PiBBbGxvdyBIRE1JIFBIWXMgdG8gYmUgY29uZmlndXJlZCB0aHJvdWdoIHRoZSBnZW5l
cmljIGZ1bmN0aW9ucw0KPiA+ID4gPj4+IHRocm91Z2ggYSBjdXN0b20gc3RydWN0dXJlIGFkZGVk
IHRvIHRoZSBnZW5lcmljIHVuaW9uLg0KPiA+ID4gPj4+DQo+ID4gPiA+Pj4gVGhlIHBhcmFtZXRl
cnMgYWRkZWQgaGVyZSBhcmUgYmFzZWQgb24gSERNSSBQSFkgaW1wbGVtZW50YXRpb24NCj4gPiA+
ID4+PiBwcmFjdGljZXMuICBUaGUgY3VycmVudCBzZXQgb2YgcGFyYW1ldGVycyBzaG91bGQgY292
ZXIgdGhlDQo+ID4gPiA+Pj4gcG90ZW50aWFsIHVzZXJzLg0KPiA+ID4gPj4+DQo+ID4gPiA+Pj4g
U2lnbmVkLW9mZi1ieTogU2FuZG9yIFl1IDxTYW5kb3IueXVAbnhwLmNvbT4NCj4gPiA+ID4+PiAt
LS0NCj4gPiA+ID4+PiAgICBpbmNsdWRlL2xpbnV4L3BoeS9waHktaGRtaS5oIHwgMzgNCj4gPiA+
ID4+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ID4gPj4+ICAgIGlu
Y2x1ZGUvbGludXgvcGh5L3BoeS5oICAgICAgfCAgNyArKysrKystDQo+ID4gPiA+Pj4gICAgMiBm
aWxlcyBjaGFuZ2VkLCA0NCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gPiA+Pj4g
ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgvcGh5L3BoeS1oZG1pLmgNCj4gPiA+
ID4+Pg0KPiA+ID4gPj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3BoeS9waHktaGRtaS5o
DQo+ID4gPiA+Pj4gYi9pbmNsdWRlL2xpbnV4L3BoeS9waHktaGRtaS5oIG5ldyBmaWxlIG1vZGUg
MTAwNjQ0IGluZGV4DQo+ID4gPiA+Pj4gMDAwMDAwMDAwMDAwLi41NzY1YWE1YmMxNzUNCj4gPiA+
ID4+PiAtLS0gL2Rldi9udWxsDQo+ID4gPiA+Pj4gKysrIGIvaW5jbHVkZS9saW51eC9waHkvcGh5
LWhkbWkuaA0KPiA+ID4gPj4+IEBAIC0wLDAgKzEsMzggQEANCj4gPiA+ID4+PiArLyogU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8NCj4gPiA+ID4+PiArLyoNCj4gPiA+ID4+PiAr
ICogQ29weXJpZ2h0IDIwMjIgTlhQDQo+ID4gPiA+Pj4gKyAqLw0KPiA+ID4gPj4+ICsNCj4gPiA+
ID4+PiArI2lmbmRlZiBfX1BIWV9IRE1JX0hfDQo+ID4gPiA+Pj4gKyNkZWZpbmUgX19QSFlfSERN
SV9IXw0KPiA+ID4gPj4+ICsNCj4gPiA+ID4+PiArLyoqDQo+ID4gPiA+Pj4gKyAqIFBpeGVsIEVu
Y29kaW5nIGFzIEhETUkgU3BlY2lmaWNhdGlvbg0KPiA+ID4gPj4+ICsgKiBSR0IsIFlVVjQyMiwg
WVVWNDQ0OkhETUkgU3BlY2lmaWNhdGlvbiAxLjRhIFNlY3Rpb24gNi41DQo+ID4gPiA+Pj4gKyAq
IFlVVjQyMDogSERNSSBTcGVjaWZpY2F0aW9uIDIuYSBTZWN0aW9uIDcuMSAgKi8gZW51bQ0KPiA+
ID4gPj4+ICtoZG1pX3BoeV9jb2xvcnNwYWNlIHsNCj4gPiA+ID4+PiArICAgICBIRE1JX1BIWV9D
T0xPUlNQQUNFX1JHQiwgICAgICAgIC8qIFJHQiA0OjQ6NCAqLw0KPiA+ID4gPj4+ICsgICAgIEhE
TUlfUEhZX0NPTE9SU1BBQ0VfWVVWNDIyLCAgICAgLyogWUNiQ3IgNDoyOjIgKi8NCj4gPiA+ID4+
PiArICAgICBIRE1JX1BIWV9DT0xPUlNQQUNFX1lVVjQ0NCwgICAgIC8qIFlDYkNyIDQ6NDo0ICov
DQo+ID4gPiA+Pj4gKyAgICAgSERNSV9QSFlfQ09MT1JTUEFDRV9ZVVY0MjAsICAgICAvKiBZQ2JD
ciA0OjI6MCAqLw0KPiA+ID4gPj4+ICsgICAgIEhETUlfUEhZX0NPTE9SU1BBQ0VfUkVTRVJWRUQ0
LA0KPiA+ID4gPj4+ICsgICAgIEhETUlfUEhZX0NPTE9SU1BBQ0VfUkVTRVJWRUQ1LA0KPiA+ID4g
Pj4+ICsgICAgIEhETUlfUEhZX0NPTE9SU1BBQ0VfUkVTRVJWRUQ2LCB9Ow0KPiA+ID4gPj4NCj4g
PiA+ID4+IFRoaXMgZW51bSBkdXBsaWNhdGVzIGVudW0gaGRtaV9jb2xvcnNwYWNlIGZyb20gPGxp
bnV4L2hkbWkuaD4NCj4gPiA+ID4+IEhETUkNCj4gPiA+ID4+IDIuMCBkZWZpbmVzICc3JyB0byBi
ZSBJRE8tZGVmaW5lZC4NCj4gPiA+ID4+DQo+ID4gPiA+PiBXb3VsZCBpdCBiZSBiZXR0ZXIgdG8g
dXNlIHRoYXQgZW51bSBpbnN0ZWFkPw0KPiA+ID4gPiBBY2NlcHQuIEkgd2lsbCBjcmVhdGUgaGVh
ZCBmaWxlIGhkbWlfY29sb3JzcGFjZS5oIHRvIHJldXNlIGVudW0NCj4gPiA+IGhkbWlfY29sb3Jz
cGFjZSBpbiA8bGludXgvaGRtaS5oPi4NCj4gPiA+DQo+ID4gPiBFeGN1c2UgbWUsIGl0IHdhcyBz
dXBwb3NlZCB0byBiZSBhIHF1ZXN0aW9uLg0KPiA+ID4NCj4gPiA+IERvIHlvdSBuZWVkIGFub3Ro
ZXIgaGVhZGVyIGZpbGUgdG8gcmV1c2UgdGhpcyBlbnVtPw0KPiA+IEknbSBub3Qgc3VyZSBjb21t
dW5pdHkgd2hldGhlciB3b3VsZCBhY2NlcHQgdGhlIHBhdGNoIHRoYXQgc2ltcGx5DQo+ID4gaW5j
bHVkZSA8bGludXgvaGRtaS5oPiBpbiBwaHktaGRtaS5oIGJlY2F1c2UgdGhlcmUgYXJlIGxvdHMg
b2Ygb3RoZXINCj4gZGVmaW5pdGlvbiBpbiA8bGludXgvaGRtaS5oPiB0aGF0IG5vdCBuZWVkIGJ5
IHBoeS1oZG1pLmguDQo+ID4gSWYgdGhlIGFuc3dlciBpcyB5ZXMsIEkgaGFwcHkgdG8gZm9sbG93
Lg0KPiANCj4gSW4gbXkgb3BpbmlvbiBpdCdzIGEgYmV0dGVyIGFsdGVybmF0aXZlIHRvIGNyZWF0
aW5nIHlldCBhbm90aGVyIGhlYWRlci4NCk9LLCBJIHdpbGwgdHJ5IGluY2x1ZGUgPGxpbnV4L2hk
bWkuaD4gaW4gcGh5LWhkbWkuaCBpbiB0aGUgbmV4dCB2ZXJzaW9uLg0KVGhhbmtzIGZvciB5b3Vy
IGNvbW1lbnRzLg0KQixSDQpTYW5kb3INCj4gDQo+ID4NCj4gPiA+DQo+ID4gPiA+DQo+ID4gPiA+
IEIuUg0KPiA+ID4gPiBTYW5kb3INCj4gPiA+ID4+DQo+ID4gPiA+Pj4gKw0KPiA+ID4gPj4+ICsv
KioNCj4gPiA+ID4+PiArICogc3RydWN0IHBoeV9jb25maWd1cmVfb3B0c19oZG1pIC0gSERNSSBj
b25maWd1cmF0aW9uIHNldA0KPiA+ID4gPj4+ICsgKiBAcGl4ZWxfY2xrX3JhdGU6ICBQaXhlbCBj
bG9jayBvZiB2aWRlbyBtb2RlcyBpbiBLSHouDQo+ID4gPiA+Pj4gKyAqIEBicGM6IE1heGltdW0g
Yml0cyBwZXIgY29sb3IgY2hhbm5lbC4NCj4gPiA+ID4+PiArICogQGNvbG9yX3NwYWNlOiBDb2xv
cnNwYWNlIGluIGVudW0gaGRtaV9waHlfY29sb3JzcGFjZS4NCj4gPiA+ID4+PiArICoNCj4gPiA+
ID4+PiArICogVGhpcyBzdHJ1Y3R1cmUgaXMgdXNlZCB0byByZXByZXNlbnQgdGhlIGNvbmZpZ3Vy
YXRpb24gc3RhdGUNCj4gPiA+ID4+PiArb2YgYSBIRE1JDQo+ID4gPiBwaHkuDQo+ID4gPiA+Pj4g
KyAqLw0KPiA+ID4gPj4+ICtzdHJ1Y3QgcGh5X2NvbmZpZ3VyZV9vcHRzX2hkbWkgew0KPiA+ID4g
Pj4+ICsgICAgIHVuc2lnbmVkIGludCBwaXhlbF9jbGtfcmF0ZTsNCj4gPiA+ID4+PiArICAgICB1
bnNpZ25lZCBpbnQgYnBjOw0KPiA+ID4gPj4+ICsgICAgIGVudW0gaGRtaV9waHlfY29sb3JzcGFj
ZSBjb2xvcl9zcGFjZTsgfTsNCj4gPiA+ID4+PiArDQo+ID4gPiA+Pj4gKyNlbmRpZiAvKiBfX1BI
WV9IRE1JX0hfICovDQo+ID4gPiA+Pg0KPiA+ID4gPj4gW3NraXBwZWQgdGhlIHJlc3RdDQo+ID4g
PiA+Pg0KPiA+ID4gPj4gLS0NCj4gPiA+ID4+IFdpdGggYmVzdCB3aXNoZXMNCj4gPiA+ID4+IERt
aXRyeQ0KPiA+ID4gPg0KPiA+ID4NCj4gPiA+IC0tDQo+ID4gPiBXaXRoIGJlc3Qgd2lzaGVzDQo+
ID4gPiBEbWl0cnkNCj4gPg0KPiA+IEIuUg0KPiA+IFNhbmRvcg0KPiA+DQo+IA0KPiANCj4gLS0N
Cj4gV2l0aCBiZXN0IHdpc2hlcw0KPiBEbWl0cnkNCg==
