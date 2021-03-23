Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC85345881
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 08:22:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B25B16E83D;
	Tue, 23 Mar 2021 07:22:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2105.outbound.protection.outlook.com [40.107.20.105])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 906456E05F
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 00:38:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SRHJ8oavwrRA6qbRxkoxArh4gdfDGylE6DPysvphR7rtBoOiYF1Aq6atY9ByFlFPJqK0ARFlFtsT1JOeaoiB2YVCa8cQhA2VKg2pR8EMqyiMMukD+UfhFJvQMNgDdF7RdUdkqSyyhKpBL4w1m/7JBG6SNhBaizQ2OFa+n05S5iRY/ZHxDyBoFjB2vNYb5k6RAkphjb2DDpVl2Df2+N45slfIwpFDfu4MpOpTuGR2mOoDtQnsj648fu8u2nuAruhaHzJvDvAQCJw3csFx4z3RrCp8LdpQU08Ni40qY557Y0omWATx5i4ljLYPLIwXvNkNX5p3Ot5h3Fl1XQPVdsmTpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+5w+uzRejupEkMQgbV6Ai9Oa7fU64PF76P7zNIUzCDk=;
 b=Cg+enwCZXpUMmba9q5y+a46zUEcJi9dkW4bsM0IvUBNU99ucgqYh0kANhAb8sIsjeF9KFCVkad8ooNQlhEz/nVFrOzSDU9fF8dM1WG5ahzf7syhYC+Df+dVvMGS7TtG2YyBzFbcjvjPLB7U2+sRxsSXFGo/Wqr5hK/OemFXYs1fTcnY49gm/cU6MZDsjFV0vQtNbAdse851z6gUwHvYcZWjHm+fluwaktyrydGU7DSa2wtRan1F51iyyDwFTTSelvH/gSm72NMJhkb2f/nqUG44sWRiaibq+jOJL6G0B7HrSnbzRUthN1Oj7lf+bQ4Tn6etcpVxR3THTM3yPD4aVbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toradex.com; dmarc=pass action=none header.from=toradex.com;
 dkim=pass header.d=toradex.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+5w+uzRejupEkMQgbV6Ai9Oa7fU64PF76P7zNIUzCDk=;
 b=hzkVZ1SJyhsREYGguGb0nywlEBIBqvCeUnk2ucPpqjauhiXd4sfUikwZHxCEGMryWXt8iF0YCNcRj7vfmxMLlQAl02Uk0TqComEFe/eGjiQkdvFKq/hCXBcSnRl0F+3N8C1GPyHElWGJ1J480wkmFWAFaVKg1jS6eh2GToKpND0=
Received: from DB7PR05MB5431.eurprd05.prod.outlook.com (2603:10a6:10:55::32)
 by DBAPR05MB7191.eurprd05.prod.outlook.com (2603:10a6:10:1a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 00:38:12 +0000
Received: from DB7PR05MB5431.eurprd05.prod.outlook.com
 ([fe80::65bd:95f4:78b0:bcd1]) by DB7PR05MB5431.eurprd05.prod.outlook.com
 ([fe80::65bd:95f4:78b0:bcd1%5]) with mapi id 15.20.3955.024; Tue, 23 Mar 2021
 00:38:12 +0000
From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "victor.liu@nxp.com"
 <victor.liu@nxp.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>
Subject: Re: [PATCH v6 05/14] dt-bindings: display: bridge: Add i.MX8qm/qxp
 display pixel link binding
Thread-Topic: [PATCH v6 05/14] dt-bindings: display: bridge: Add i.MX8qm/qxp
 display pixel link binding
Thread-Index: AQHXH3zO1PVnFsIWRkW6KL1VZgYesg==
Date: Tue, 23 Mar 2021 00:38:12 +0000
Message-ID: <3b1db5d87773e9352f06e88b460cf0f7f2f7e98d.camel@toradex.com>
References: <1615952569-4711-1-git-send-email-victor.liu@nxp.com>
 <1615952569-4711-6-git-send-email-victor.liu@nxp.com>
In-Reply-To: <1615952569-4711-6-git-send-email-victor.liu@nxp.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=toradex.com;
x-originating-ip: [2a01:2ac:51dd:d885:51ae:2f9c:9f1e:70f4]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 28f5f3eb-3ad8-4ab9-280a-08d8ed93f0b8
x-ms-traffictypediagnostic: DBAPR05MB7191:
x-microsoft-antispam-prvs: <DBAPR05MB71916497E4BCD7120873BE0AFB649@DBAPR05MB7191.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7zN0Va3P7BLP+rdlirCvrpLqMQunxpGhPxQ5ygJnNjdN2hirdxZsZhQ99GlI2pU+vnTO8mnOmS+R7XXp8HgVWv+FJKn0afmrJFIVjwqhDVQpV0FEziHCdV2TqRuJig/4Oc56wLkwv0XEhk3tdoa2jThbRCA2YPC38fkyNImJc+VE8k8iz+/yHMXSftJ/rHSqQc04goJSVGymY+eF/10qn/mVndu3oLYxcRuDnUHcr3Ct+Z9ibnBdkIWALmQt4JC+W+1YpTuMeguWwZ+xiZYAPWMAyqzGkJOTFd1+khMvHoqxJmtxeypKJUf7pb3HhyN9h2GgBlpH8VAf5AWQ/tG3lacgP66FsBh5MhHsttdlf9rwSEUjlEjGmb3KLdn5RP1p8Wd9sxPcx2E7DO2f11unZ6vZCYHEf274wqCgEX4lVHlAUcYgeCIux00MN1t6DoNa+Fpj1MeKwNVpDhMao2DBYdin+AgifNuCdjejzuQq8zvPGmtVbR/R+aK0UhsPL02H/NEBkbB1z+zURjhNF1+49cXj1dUI4evjnDVlTPXapSUSEJd0U1yu4eu4dOCic1zozWg4y8g9MHxziJQTxpX6lvGl1mnubtun7O16YuP+0kx7tWS53rGKQv0Q/7XxbM7WXSnvo2GrIUZUT3cuFV2H1eMfu4bI3+3Bqsv9rPTrQJzZv7ccfAl4anKUyZtDUEPAcwvsnevR+YQozR4qzNzengIed9OTOoOeUMxQLdk/sJA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7PR05MB5431.eurprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(366004)(376002)(396003)(346002)(136003)(71200400001)(54906003)(110136005)(966005)(316002)(478600001)(4326008)(2616005)(186003)(38100700001)(6512007)(7416002)(83380400001)(64756008)(2906002)(5660300002)(66556008)(44832011)(66946007)(66446008)(36756003)(8936002)(8676002)(66476007)(86362001)(6486002)(91956017)(76116006)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?aWZ6MWxIQUoxT25BRlNocS9USWdsTStKTkdJcThtMkxHYmVMZFJmd1dRQ2Zh?=
 =?utf-8?B?VjNIcytJOW1yNGt6RFJUU0JmMmlZS3NXY25ndVl6eWcrKzN2SXJsaUhqd1Iv?=
 =?utf-8?B?NEZxdFFMWTI5NXNjSGRaTlJBbi8vVXM3MElqNXR4a3VjakZCOGwyZWZ5bE0r?=
 =?utf-8?B?QXUwVExDSlFDUkRsM2hVZzhHbCtXQTdPY2U2Y21CNlRVNzMxbFpudGNBcVNi?=
 =?utf-8?B?MjNoWXZIWWEzM2hVSHF4YUhmOWNOWGdGTk1MQnZVbTV4NzJ5SWJaK3Y5YUZP?=
 =?utf-8?B?V3FVZ0xEMnNRZzU1OXRpdVduQ0ZQOUFEazQwSWZqdTVhUXliYU9rNFZaVVM0?=
 =?utf-8?B?WTJMcFp3dnczWlI3djV2OStuNmZrYXJNOUliMUZsaVBsZFhjMHJGckkwNlJF?=
 =?utf-8?B?YWJITDFualgvb3FBVTJPL0VGUnBkS3I2bEMzcU56Yk5CVldpa2JRYlFnTm8y?=
 =?utf-8?B?WWQzZlNZbE1EVEhueThSbENuSlowRHVBVUhIM09EMDh2WHVTT3lpS05uRTJG?=
 =?utf-8?B?SExENUF3T0tDSnNla2syeGhsWitSNyszeGI5RXE5dnRwb3NRNGFvVUFMd1hi?=
 =?utf-8?B?UjR2czlzU3VlWE5qREFlY25scHd5dG5iaU43aWJSbnBLVDVHZjJKZXJvTzZ3?=
 =?utf-8?B?MDRKQzMwalliK3hzZCtUTWw3NGZTWG0xRmdQTEdrWm1GWkRDZS9vOUd1dlZv?=
 =?utf-8?B?T2ZldGp5WWpHTzdGMHZVR2FFQWxzUEFvTWZ3N1BUOXNpQnVWRHgwdWljckNZ?=
 =?utf-8?B?TXd0S1M2eHczbjdXckw2ajZvTFdiNTJVS1JjZ1hveHR5aTVTaFIxL0JvcjlM?=
 =?utf-8?B?WEtHQkVUZ2QzWkFqS3kvS2ZNaUFOUWFDeFZQSWNtRHNBV2p6V2liZEdwV3Ev?=
 =?utf-8?B?TWFCcXJ4NnZZTk1sbjV2cUVwSDB3K2NHUS9VMUtZRXVLeVg5L0wwZElFTUV6?=
 =?utf-8?B?MDQ2UnllTnpadzJ6ZTYza1BaQ0JOa2IzZlc0U2xvUEF4OTRZL1dEalFKMDN3?=
 =?utf-8?B?aGJ4S2JxVDhraEdwWnRuQW1UbXdFUUpnaFJXOTlNS25iejZmZ0Q1MjFFQ2Nq?=
 =?utf-8?B?N2IrOHAvbGhWWCtrZEVxY3JOMHM1L0xpdmd6QVZmcWhJQUpNUGdRVVovM2Zk?=
 =?utf-8?B?MW5PdUh0YnY4dG5WRVBVcXgzb2loKytRQ2FZU1BPb2FvM2g1L1RkUGR6dW5h?=
 =?utf-8?B?VllQcEJEdXpiTEJIRGZIQWpnVFBKb1RNcHJ6RWZTS3ZVWmNvUXJwZVpCSE5Y?=
 =?utf-8?B?eXZIbXZMMXRBRWxDYXN5ZDFBY3NlYUVqZndNakpDZjJaazJpTDRZK0ZlNGFY?=
 =?utf-8?B?ZG14VEo1U0dGVUhPSENhdHJYQU12ajhubUNCMFBuRVpSbTNNY0dsbG5FSXVT?=
 =?utf-8?B?d0ZoS3A3akczalh6OVpWdkFselJFOG1QTzlqbFpDT05DY25tYUNUY0taNE02?=
 =?utf-8?B?TXQ2SXdtcnc5dUNxZDFvU0ozUEhzb04rMmZOZWpEY0hWakgxQUdXSlZVVFRG?=
 =?utf-8?B?MGpvNTdxbGZYS1hGanhVcERqMGJWQm1jQ3NlNlVMc0UyeHhFemlwTHFuSFFV?=
 =?utf-8?B?Q0N2YVY3SU5aZHVaL0lRM2VKK2d6bFBJUTkvZStZdTg0VUJOUnk5NlRDQXRk?=
 =?utf-8?B?aHZXOVN5U3FLa0duZER3bXA2UVRBejQrbWFkNDQ5STNXUSsxdHYvcXpUUVdC?=
 =?utf-8?B?T0d4ZFlBTUFRYUFPVnZuaHZpQmlqZlF1RVovY0hMWTNpS2ZLdkFUdlExU1dW?=
 =?utf-8?B?TTM4WERDbUQ3eUVUZDNlZXlJRlMwMHEwcjczejFWZ29SNm83NWpUZW9YTGNw?=
 =?utf-8?B?Q3h1VXFvbEZGK1Eyc2lUZ3R6ekJkRHVGNEw1c2lUY1puenJGREZ4cHFnZEVW?=
 =?utf-8?B?clJ1TUcxTU1ic1M4UGQ2Y0NNVkJDUXRNWWtNZTY5UWVZU2c9PQ==?=
x-ms-exchange-transport-forked: True
Content-ID: <3E36A88832E89F409CD80752571F9523@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR05MB5431.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28f5f3eb-3ad8-4ab9-280a-08d8ed93f0b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2021 00:38:12.5512 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PcXkFSdjqGOFhcOWlThYdC2zXyhB50zjGL9IttkOG0up3qIjSnLhHaFi/rz6C/yACMRLcM9yQmW/+3bl+NnWhKAsrqTEEbzathSuaXMhASc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR05MB7191
X-Mailman-Approved-At: Tue, 23 Mar 2021 07:22:05 +0000
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
Cc: "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "robert.foss@linaro.org" <robert.foss@linaro.org>,
 "kishon@ti.com" <kishon@ti.com>, "a.hajda@samsung.com" <a.hajda@samsung.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIxLTAzLTE3IGF0IDExOjQyICswODAwLCBMaXUgWWluZyB3cm90ZToNCj4gVGhp
cyBwYXRjaCBhZGRzIGJpbmRpbmdzIGZvciBpLk1YOHFtL3F4cCBkaXNwbGF5IHBpeGVsIGxpbmsu
DQo+IA0KPiBSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmgtRGdFalQrQWkyeWdkbm0reVJP
ZkUwQUBwdWJsaWMuZ21hbmUub3JnPg0KPiBTaWduZWQtb2ZmLWJ5OiBMaXUgWWluZyA8dmljdG9y
LmxpdS0zYXJRaThWTjNUY0BwdWJsaWMuZ21hbmUub3JnPg0KPiAtLS0NCj4gdjUtPnY2Og0KPiAq
IE5vIGNoYW5nZS4NCj4gDQo+IHY0LT52NToNCj4gKiBObyBjaGFuZ2UuDQo+IA0KPiB2My0+djQ6
DQo+ICogTm8gY2hhbmdlLg0KPiANCj4gdjItPnYzOg0KPiAqIEFkZCBSb2IncyBSLWIgdGFnLg0K
PiANCj4gdjEtPnYyOg0KPiAqIFVzZSBncmFwaCBzY2hlbWEuIChMYXVyZW50KQ0KPiAqIFJlcXVp
cmUgYWxsIGZvdXIgcGl4ZWwgbGluayBvdXRwdXQgcG9ydHMuIChMYXVyZW50KQ0KPiAqIE1lbnRp
b24gcGl4ZWwgbGluayBpcyBhY2Nlc3NlZCB2aWEgU0NVIGZpcm13YXJlLiAoUm9iKQ0KPiANCj4g
wqAuLi4vZGlzcGxheS9icmlkZ2UvZnNsLGlteDhxeHAtcGl4ZWwtbGluay55YW1swqDCoMKgwqAg
fCAxMDYgKysrKysrKysrKysrKysrKysrKysrDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDEwNiBpbnNl
cnRpb25zKCspDQo+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9mc2wsaW14OHF4cC1waXhlbC1saW5rLnlhbWwNCj4g
DQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9icmlkZ2UvZnNsLGlteDhxeHAtcGl4ZWwtbGluay55YW1sDQo+IGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2ZzbCxpbXg4cXhwLXBpeGVsLWxpbmsu
eWFtbA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMC4uM2FmNjdjYw0K
PiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L2JyaWRnZS9mc2wsaW14OHF4cC1waXhlbC1saW5rLnlhbWwNCj4gQEAgLTAsMCAr
MSwxMDYgQEANCj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1Ig
QlNELTItQ2xhdXNlKQ0KPiArJVlBTUwgMS4yDQo+ICstLS0NCj4gKyRpZDogaHR0cDovL2Rldmlj
ZXRyZWUub3JnL3NjaGVtYXMvZGlzcGxheS9icmlkZ2UvZnNsLGlteDhxeHAtcGl4ZWwtbGluay55
YW1sIw0KPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3Jl
LnlhbWwjDQo+ICsNCj4gK3RpdGxlOiBGcmVlc2NhbGUgaS5NWDhxbS9xeHAgRGlzcGxheSBQaXhl
bCBMaW5rDQo+ICsNCj4gK21haW50YWluZXJzOg0KPiArwqAgLSBMaXUgWWluZyA8dmljdG9yLmxp
dS0zYXJRaThWTjNUY0BwdWJsaWMuZ21hbmUub3JnPg0KPiArDQo+ICtkZXNjcmlwdGlvbjogfA0K
PiArwqAgVGhlIEZyZWVzY2FsZSBpLk1YOHFtL3F4cCBEaXNwbGF5IFBpeGVsIExpbmsoRFBMKSBm
b3JtcyBhIHN0YW5kYXJkDQo+ICvCoCBhc3luY2hyb25vdXMgbGlua2FnZSBiZXR3ZWVuIHBpeGVs
IHNvdXJjZXMoZGlzcGxheSBjb250cm9sbGVyIG9yDQo+ICvCoCBjYW1lcmEgbW9kdWxlKSBhbmQg
cGl4ZWwgY29uc3VtZXJzKGltYWdpbmcgb3IgZGlzcGxheXMpLg0KPiArwqAgSXQgY29uc2lzdHMg
b2YgdHdvIGRpc3RpbmN0IGZ1bmN0aW9ucywgYSBwaXhlbCB0cmFuc2ZlciBmdW5jdGlvbiBhbmQg
YQ0KPiArwqAgY29udHJvbCBpbnRlcmZhY2UuwqAgTXVsdGlwbGUgcGl4ZWwgY2hhbm5lbHMgY2Fu
IGV4aXN0IHBlciBvbmUgY29udHJvbCBjaGFubmVsLg0KPiArwqAgVGhpcyBiaW5kaW5nIGRvY3Vt
ZW50YXRpb24gaXMgb25seSBmb3IgcGl4ZWwgbGlua3Mgd2hvc2UgcGl4ZWwgc291cmNlcyBhcmUN
Cj4gK8KgIGRpc3BsYXkgY29udHJvbGxlcnMuDQo+ICsNCj4gK8KgIFRoZSBpLk1YOHFtL3F4cCBE
aXNwbGF5IFBpeGVsIExpbmsgaXMgYWNjZXNzZWQgdmlhIFN5c3RlbSBDb250cm9sbGVyIFVuaXQo
U0NVKQ0KPiArwqAgZmlybXdhcmUuDQo+ICsNCj4gK3Byb3BlcnRpZXM6DQo+ICvCoCBjb21wYXRp
YmxlOg0KPiArwqDCoMKgIGVudW06DQo+ICvCoMKgwqDCoMKgIC0gZnNsLGlteDhxbS1kYy1waXhl
bC1saW5rDQo+ICvCoMKgwqDCoMKgIC0gZnNsLGlteDhxeHAtZGMtcGl4ZWwtbGluaw0KPiArDQo+
ICvCoCBwb3J0czoNCj4gK8KgwqDCoCAkcmVmOiAvc2NoZW1hcy9ncmFwaC55YW1sIy9wcm9wZXJ0
aWVzL3BvcnRzDQo+ICsNCj4gK8KgwqDCoCBwcm9wZXJ0aWVzOg0KPiArwqDCoMKgwqDCoCBwb3J0
QDA6DQo+ICvCoMKgwqDCoMKgwqDCoCAkcmVmOiAvc2NoZW1hcy9ncmFwaC55YW1sIy9wcm9wZXJ0
aWVzL3BvcnQNCj4gK8KgwqDCoMKgwqDCoMKgIGRlc2NyaXB0aW9uOiBUaGUgcGl4ZWwgbGluayBp
bnB1dCBwb3J0IG5vZGUgZnJvbSB1cHN0cmVhbSB2aWRlbyBzb3VyY2UuDQo+ICsNCj4gK8KgwqDC
oCBwYXR0ZXJuUHJvcGVydGllczoNCj4gK8KgwqDCoMKgwqAgIl5wb3J0QFsxLTRdJCI6DQo+ICvC
oMKgwqDCoMKgwqDCoCAkcmVmOiAvc2NoZW1hcy9ncmFwaC55YW1sIy9wcm9wZXJ0aWVzL3BvcnQN
Cj4gK8KgwqDCoMKgwqDCoMKgIGRlc2NyaXB0aW9uOiBUaGUgcGl4ZWwgbGluayBvdXRwdXQgcG9y
dCBub2RlIHRvIGRvd25zdHJlYW0gYnJpZGdlLg0KPiArDQo+ICvCoMKgwqAgcmVxdWlyZWQ6DQo+
ICvCoMKgwqDCoMKgIC0gcG9ydEAwDQo+ICvCoMKgwqDCoMKgIC0gcG9ydEAxDQo+ICvCoMKgwqDC
oMKgIC0gcG9ydEAyDQo+ICvCoMKgwqDCoMKgIC0gcG9ydEAzDQo+ICvCoMKgwqDCoMKgIC0gcG9y
dEA0DQo+ICsNCj4gK3JlcXVpcmVkOg0KPiArwqAgLSBjb21wYXRpYmxlDQo+ICvCoCAtIHBvcnRz
DQo+ICsNCj4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KPiArDQo+ICtleGFtcGxlczoN
Cj4gK8KgIC0gfA0KPiArwqDCoMKgIGRjMC1waXhlbC1saW5rMCB7DQo+ICvCoMKgwqDCoMKgwqDC
oCBjb21wYXRpYmxlID0gImZzbCxpbXg4cXhwLWRjLXBpeGVsLWxpbmsiOw0KPiArDQo+ICvCoMKg
wqDCoMKgwqDCoCBwb3J0cyB7DQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICNhZGRyZXNzLWNl
bGxzID0gPDE+Ow0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAjc2l6ZS1jZWxscyA9IDwwPjsN
Cj4gKw0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKiBmcm9tIGRjMCBwaXhlbCBjb21iaW5l
ciBjaGFubmVsMCAqLw0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwb3J0QDAgew0KPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlZyA9IDwwPjsNCj4gKw0KPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRjMF9waXhlbF9saW5rMF9kYzBfcGl4ZWxfY29tYmluZXJf
Y2gwOiBlbmRwb2ludCB7DQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCByZW1vdGUtZW5kcG9pbnQgPSA8JmRjMF9waXhlbF9jb21iaW5lcl9jaDBfZGMwX3BpeGVsX2xp
bmswPjsNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Ow0KPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB9Ow0KPiArDQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIHRvIFBY
TDJEUElzIGluIE1JUEkvTFZEUyBjb21ibyBzdWJzeXN0ZW1zICovDQo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHBvcnRAMSB7DQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgI2Fk
ZHJlc3MtY2VsbHMgPSA8MT47DQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgI3Np
emUtY2VsbHMgPSA8MD47DQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVnID0g
PDE+Ow0KPiArDQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGMwX3BpeGVsX2xp
bmswX21pcGlfbHZkc18wX3B4bDJkcGk6IGVuZHBvaW50QDAgew0KPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVnID0gPDA+Ow0KPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVtb3RlLWVuZHBvaW50ID0gPCZtaXBpX2x2ZHNfMF9weGwy
ZHBpX2RjMF9waXhlbF9saW5rMD47DQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fTsNCj4gKw0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRjMF9waXhlbF9saW5r
MF9taXBpX2x2ZHNfMV9weGwyZHBpOiBlbmRwb2ludEAxIHsNCj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlZyA9IDwxPjsNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHJlbW90ZS1lbmRwb2ludCA9IDwmbWlwaV9sdmRzXzFfcHhsMmRw
aV9kYzBfcGl4ZWxfbGluazA+Ow0KDQpUaG9zZSBhbHNvIHNlZW0gYWJzZW50IGZyb20gb3RoZXIg
ZXhhbXBsZXMuDQoNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Ow0KPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB9Ow0KPiArDQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8q
IHVudXNlZCAqLw0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwb3J0QDIgew0KPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlZyA9IDwyPjsNCj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfTsNCj4gKw0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKiB1bnVzZWQgKi8NCj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcG9ydEAzIHsNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCByZWcgPSA8Mz47DQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH07DQo+ICsN
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyogdG8gaW1hZ2luZyBzdWJzeXN0ZW0gKi8NCj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcG9ydEA0IHsNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCByZWcgPSA8ND47DQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH07DQo+ICvC
oMKgwqDCoMKgwqDCoCB9Ow0KPiArwqDCoMKgIH07DQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
