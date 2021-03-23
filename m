Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15625345883
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 08:22:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24B726E843;
	Tue, 23 Mar 2021 07:22:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80102.outbound.protection.outlook.com [40.107.8.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B949A6E05F
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 00:34:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YyYwYT6AW4iXwD2pEht+ejxrx45JwrNjrs27bxyAeW/nv6yaKuNt8k2MytdU6yBMAiGp9THN+PyFtK06plyDyUxfhEUKiQ9zVE6GXp8ZdlTJEJG5FhntjZCTuDiFXPJCRMmQgrJkoxBmC3joXouqe/fPCs3K0E5Mu8ELahmhrjCt/UEHgrr9+5wPGgozNjeqej5+ZwRlxcCnThSrerYM9YwKqfCYMRztTyioM1wnTzCopShrQieYJeTGbn7GkIrQK4V9WjyV0Zmlpx140LGrUC5jaZk1v+U0II+76NDycQkoXMJJmYPdquPL/O502go6PJMkArWSkk5skPddZmzPgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ONfivx7RC+QAuH6UOO0PIDhyafnTOtkY0R8cRBCP7Yc=;
 b=lZrNOsw1xqJ2lgnjTVcZVQO+8afR3HevE4uNpf7spKZ1rqZMbmFCH2m3xVNy9ByITQWQ/kMn4WJ0Cc9RZyuR3Yh7+6rY0mNNzLnaWRoBdqOAAVfRt1XA8YUV7+I1OhK4oVPvLrxhsYa4vCh+19M9NvHuApdBDli3DIlnQTzxoq3j2TuKmO/k2EoNsLxaJ/b9pn9FDWKtyAlxdvqx1+jG0vGQxO2My5592xqiGlQhjySCMbvgfSQ1YKQlE1guvqU68Rg/H+UeH77P1Pe3LquCtn9yGJhZsUsWiecMSeNuN6QHSE55P0dMOviTJ9h3r8X3wo75Vt/nc9znR+WaKPsyZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toradex.com; dmarc=pass action=none header.from=toradex.com;
 dkim=pass header.d=toradex.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ONfivx7RC+QAuH6UOO0PIDhyafnTOtkY0R8cRBCP7Yc=;
 b=KFRpzDalUJuhy+tKluRvqnjZUj/wy9NOkcdljxSuqRsBrTD09r1i8bUox26EsKGfAH03awIHCU+cRB2mz0bAL3xBcSfJz5xiMdUQvTkzmfAZXhjwSAW0pGRzg5+VZwNa2GUCDzsrv6sxjeSmtNOHHpBOhZYsxPGjK7oqKrp1bNk=
Received: from DB7PR05MB5431.eurprd05.prod.outlook.com (2603:10a6:10:55::32)
 by DB6PR05MB4661.eurprd05.prod.outlook.com (2603:10a6:6:4d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 00:34:28 +0000
Received: from DB7PR05MB5431.eurprd05.prod.outlook.com
 ([fe80::65bd:95f4:78b0:bcd1]) by DB7PR05MB5431.eurprd05.prod.outlook.com
 ([fe80::65bd:95f4:78b0:bcd1%5]) with mapi id 15.20.3955.024; Tue, 23 Mar 2021
 00:34:28 +0000
From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "victor.liu@nxp.com"
 <victor.liu@nxp.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>
Subject: Re: [PATCH v6 03/14] dt-bindings: display: bridge: Add i.MX8qm/qxp
 pixel combiner binding
Thread-Topic: [PATCH v6 03/14] dt-bindings: display: bridge: Add i.MX8qm/qxp
 pixel combiner binding
Thread-Index: AQHXH3xINnprqdE6QUa8b2nC962YYg==
Date: Tue, 23 Mar 2021 00:34:28 +0000
Message-ID: <ab437e190dc3f7e1f63b927f16dea2d5f806d59c.camel@toradex.com>
References: <1615952569-4711-1-git-send-email-victor.liu@nxp.com>
 <1615952569-4711-4-git-send-email-victor.liu@nxp.com>
In-Reply-To: <1615952569-4711-4-git-send-email-victor.liu@nxp.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=toradex.com;
x-originating-ip: [2a01:2ac:51dd:d885:51ae:2f9c:9f1e:70f4]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f23ccde6-bef9-4ae0-45b4-08d8ed936b1f
x-ms-traffictypediagnostic: DB6PR05MB4661:
x-microsoft-antispam-prvs: <DB6PR05MB4661AA091E76405E0B3B3B8EFB649@DB6PR05MB4661.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mS+TQ15dg7ZC3ltoHVtDLSEsliAk2Z0hHzZVvs66EEatBycXVTqn2JPeMI/I3V01vWhJQ1IqPAG5dr+9dTOmxdlu+H+k2H6ii1RHGNGUqFS0qAHPXzmzfoqurX8LYbQJLhhyqZrCOYl8eQzjfQEyx+wojBxRv5ZSDZqEvVIKeVEF7G93DOQoKsgaX6e1ob6bwBL+olixYlgu1Vp6//g9N42zwhexrzXrBtOle7+TOoZ7vaRwa8PtalGDwxbOTAEbj1D0tx2QKgibXTSLxBkwYbGgvuZbjL6DJ3ksJ16Z5gQ8W3/Z8aZZdhpv7e4T3NVMWKbTkA32MSVekns3yB7XWUHYN41C6nz1E0yfoCcTtUFHSS/pChwAIfFgU8HYqWIignYYxJ63oS8pZ8FHCyE8sHdt916Onp0sfzGHCJ9/5HTtLRnF2pMgsW5ER6IjL1ZJMnw2ySpKOqrDT4RMUYMLrS1Ek/gNrkltwqCzPdJOwXsuxEWFLN4dvpgk0IBjpHhB0uhDuLk1mLHLoz935zIng/y/Qr+U9i2E17w/RY8MfGn8ESMoLrOq6jtoNaCAZtR0Wi9SGUzawepqLEJuxXM/C65vIq0S09bAUlfTXTZjCMK60M8UtOeqe4yj0UVWg+05b85wE0QMJy5Z6wTnT5cE+0cAmnRboTR0bGb9A83+5uzlmgHdo6Q3mNH5I3NKXikE0fc5E7UXVXQNPhvOLIYU336htyA2rZbMAyfr5sQ/AMA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7PR05MB5431.eurprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(346002)(376002)(39840400004)(136003)(8936002)(76116006)(110136005)(86362001)(44832011)(91956017)(54906003)(7416002)(4326008)(64756008)(5660300002)(6506007)(6512007)(316002)(83380400001)(8676002)(186003)(66556008)(66946007)(66446008)(2906002)(36756003)(2616005)(38100700001)(71200400001)(6486002)(966005)(478600001)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?VDkrQTFENzFYd0N0MFVGdDlGbUczc2hDOXpGWGRjQ3pYWnlKNUhncmdPd3Y5?=
 =?utf-8?B?cTFFTTRZMFg1Ung1OXZLUnpCWHl2Rm5XbTFLV3krMlE5OENhT1VkMFBlcm5I?=
 =?utf-8?B?Vi9SRWJBSW5EQ2NLTlk3WXh0OUlEMjZPWnFTS08wQnNERUFBNjRkWUxCdjdY?=
 =?utf-8?B?QzF5My8ySEkxNkxSTU5jWnQ4Q0E3cVZzMmpURWQzdG5zNVgwZFpJNHE5VHZE?=
 =?utf-8?B?VmRKZnhnM2dFU25USVRvK254Q0FlQWNmLzdUdHZXN3ZzM0pLTEF4V2g2NllK?=
 =?utf-8?B?L1d3SWdsbVhmUnhIWXlMc01iNmNnaHJubFJWbW11cm0zZU1aamFieUJyVDNN?=
 =?utf-8?B?dG81NVpvVE5YeW9nbnNDdkF4ZS9RSGlGK0JqL1dRcFluaWMzbGN6Y0Z0VnV4?=
 =?utf-8?B?YU9CeTZSZmxtYkxldGNzV1NyNFpVa1pKUG5tUUwwREZOQithVTkya3JyVHJ6?=
 =?utf-8?B?alFOMFBJWVNJNkVjS0krKzA5a1NaUG9lME5lc0h4UDIwL2VibkJQM2RGYzBR?=
 =?utf-8?B?SHU0dUFOcjhEYy9jQUVwMG9aMTVVdkdleEJiLzQ3Y3hUSUhWQjFuL0pKV0lp?=
 =?utf-8?B?bitHdWlTS2UySGxnbVBZOU5GZzN3NWw3NXdvbzVRakE2d0UrRDl0Um1BTTB6?=
 =?utf-8?B?MnV6aU1MNnlTcFJwaGcrbkM0bVhkWXhpR1BUd0FHMTRiUXNCelVnbm5UQzZJ?=
 =?utf-8?B?dEFmcmdkMGFxV204cTNoT1dJQ3pzYUpNTTVPRUI1REkwc25KT0VrcEFManRo?=
 =?utf-8?B?TFRzbTJpd0lVUlB5bFZINDFpWVJJamNpZDFjVWNiSVk3eGtZRWdsU1VTanZN?=
 =?utf-8?B?NGR1NDhEVmNLN1l4ZnN3R3FkTHVLTkZYa0RwVSs0ZXYva3Z1VmdtY2RXUzJK?=
 =?utf-8?B?RlNJNjNHeW41SmtqUVA4MXZUTExuQ1R1aDFMUjFqN2R1ZUhUT0xvMnZXQTNT?=
 =?utf-8?B?RGdTcWRwVUVDdmNwR0p2cElGSHkzTDNEM3NCQjVqdnNYSXZueCtzTEp6RXRq?=
 =?utf-8?B?d3ZiVURqRitUOEVKWkt0dS9zVHJtTUdoRlpJVGpiR2VONmhaL3ZLdG5Zd3p3?=
 =?utf-8?B?SHd0TDV1NjEzRTltSVpSdW05UlFVdEtESCtMYnlQVXN4Q0c5bE9CeU5zdXVq?=
 =?utf-8?B?TEo2clh3MFFpODRMR1dVaWIxTFlqRnN0VW44ZWh6a1N2Z1FtZUdDTU4vNXdQ?=
 =?utf-8?B?TEtINTZybXNqWk5UK3Z6Nms5MnYzVFFRWVVZa0wvUHFDR0JQOVJ3V3Arb1pq?=
 =?utf-8?B?WGdHeFJHc2cva3lJcGcrY2YvYk9yTUdSbGVuT2MrY1RBRUNzbStTby9MSm1W?=
 =?utf-8?B?a2pldEordUpNQXQrR2o5NWd2QXRZYlhnYnVaRzdXUnBFdFJQanprbEZGM013?=
 =?utf-8?B?N0l3dFFQYm91RkhJeTYwTCtNTGlIcUliVm8xb201eTl1RHI3YUNtYWhjb2Mv?=
 =?utf-8?B?bmlJTlJINDBwUHFGWUhHODMwd1pXMzlkZERxWWdmVzZiZERyTXl6MEVJeldp?=
 =?utf-8?B?M3Q0UFJPaU82YWR3eTBBOTNpeVZCejJRMTl5VWcwSHpUNG90NEdvYzB6NTZT?=
 =?utf-8?B?ZmZNTUx0dEdtbEhRd2FPdWlnMjNNYjhNWlZZUEZOTDFqL1dzV1hHRkJJdW5M?=
 =?utf-8?B?aTJPVjQ0WjRjb293UlhXQmlacVY3ei9DMnlTTEtNNTI5Vld3QlR3Mmk5VFlX?=
 =?utf-8?B?c0NLOHdSOFczcUcyM3prdUJyc1N3YW9YRXZLNVVXS004Q2MwQ1FmYlJOVzQz?=
 =?utf-8?B?a1ZCU2Ywdjl0QUZKcmJpUVJPZEsyYmkrSnlOMUdaUVYyY3h0eW84MUI0Q0Ur?=
 =?utf-8?B?OURaSkNOaG43K0QrSkJ4WmlEU05BSGtneXhXcndtaDVYWGlQSnZ4emdNMlQ0?=
 =?utf-8?B?eStrZFlERWJRdzVmVVY1ZkVkUnVkWjljd01QbEVzdFRrL1E9PQ==?=
x-ms-exchange-transport-forked: True
Content-ID: <E43177B28B37084BB0924906FA224AEC@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR05MB5431.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f23ccde6-bef9-4ae0-45b4-08d8ed936b1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2021 00:34:28.5302 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QpIDcb/rGioRjPDFjSe8BD6RuubQLcRUAloi1PmpRpJ2K0fbB/lVaYXw7u64fMesUgruYY6CbvpWmchMPN5IvRtM/no2L94KnE5BZxD9OpA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR05MB4661
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
cyBwYXRjaCBhZGRzIGJpbmRpbmdzIGZvciBpLk1YOHFtL3F4cCBwaXhlbCBjb21iaW5lci4NCj4g
DQo+IFJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPg0KPiBTaWduZWQt
b2ZmLWJ5OiBMaXUgWWluZyA8dmljdG9yLmxpdUBueHAuY29tPg0KPiAtLS0NCj4gdjUtPnY2Og0K
PiAqIE5vIGNoYW5nZS4NCj4gDQo+IHY0LT52NToNCj4gKiBObyBjaGFuZ2UuDQo+IA0KPiB2My0+
djQ6DQo+ICogTm8gY2hhbmdlLg0KPiANCj4gdjItPnYzOg0KPiAqIEFkZCBSb2IncyBSLWIgdGFn
Lg0KPiANCj4gdjEtPnYyOg0KPiAqIFVzZSBncmFwaCBzY2hlbWEuIChMYXVyZW50KQ0KPiAqIFVz
ZSBlbnVtIGluc3RlYWQgb2Ygb25lT2YgKyBjb25zdCBmb3IgdGhlIHJlZyBwcm9wZXJ0eSBvZiBw
aXhlbCBjb21iaW5lcg0KPiDCoCBjaGFubmVscy4gKFJvYikNCj4gDQo+IMKgLi4uL2Rpc3BsYXkv
YnJpZGdlL2ZzbCxpbXg4cXhwLXBpeGVsLWNvbWJpbmVyLnlhbWwgfCAxNDQgKysrKysrKysrKysr
KysrKysrKysrDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDE0NCBpbnNlcnRpb25zKCspDQo+IMKgY3Jl
YXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L2JyaWRnZS9mc2wsaW14OHF4cC1waXhlbC1jb21iaW5lci55YW1sDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2ZzbCxp
bXg4cXhwLXBpeGVsLWNvbWJpbmVyLnlhbWwNCj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS9icmlkZ2UvZnNsLGlteDhxeHAtcGl4ZWwtY29tYmluZXIueWFtbA0K
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMC4uNTBiYWUyMQ0KPiAtLS0g
L2Rldi9udWxsDQo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L2JyaWRnZS9mc2wsaW14OHF4cC1waXhlbC1jb21iaW5lci55YW1sDQo+IEBAIC0wLDAgKzEs
MTQ0IEBADQo+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJT
RC0yLUNsYXVzZSkNCj4gKyVZQU1MIDEuMg0KPiArLS0tDQo+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0
cmVlLm9yZy9zY2hlbWFzL2Rpc3BsYXkvYnJpZGdlL2ZzbCxpbXg4cXhwLXBpeGVsLWNvbWJpbmVy
LnlhbWwjDQo+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2Nv
cmUueWFtbCMNCj4gKw0KPiArdGl0bGU6IEZyZWVzY2FsZSBpLk1YOHFtL3F4cCBQaXhlbCBDb21i
aW5lcg0KPiArDQo+ICttYWludGFpbmVyczoNCj4gK8KgIC0gTGl1IFlpbmcgPHZpY3Rvci5saXVA
bnhwLmNvbT4NCj4gKw0KPiArZGVzY3JpcHRpb246IHwNCj4gK8KgIFRoZSBGcmVlc2NhbGUgaS5N
WDhxbS9xeHAgUGl4ZWwgQ29tYmluZXIgdGFrZXMgdHdvIG91dHB1dCBzdHJlYW1zIGZyb20gYQ0K
PiArwqAgc2luZ2xlIGRpc3BsYXkgY29udHJvbGxlciBhbmQgbWFuaXB1bGF0ZXMgdGhlIHR3byBz
dHJlYW1zIHRvIHN1cHBvcnQgYSBudW1iZXINCj4gK8KgIG9mIG1vZGVzKGJ5cGFzcywgcGl4ZWwg
Y29tYmluZSwgWVVWNDQ0IHRvIFlVVjQyMiwgc3BsaXRfUkdCKSBjb25maWd1cmVkIGFzDQo+ICvC
oCBlaXRoZXIgb25lIHNjcmVlbiwgdHdvIHNjcmVlbnMsIG9yIHZpcnR1YWwgc2NyZWVucy7CoCBU
aGUgcGl4ZWwgY29tYmluZXIgaXMNCj4gK8KgIGFsc28gcmVzcG9uc2libGUgZm9yIGdlbmVyYXRp
bmcgc29tZSBvZiB0aGUgY29udHJvbCBzaWduYWxzIGZvciB0aGUgcGl4ZWwgbGluaw0KPiArwqAg
b3V0cHV0IGNoYW5uZWwuDQo+ICsNCj4gK3Byb3BlcnRpZXM6DQo+ICvCoCBjb21wYXRpYmxlOg0K
PiArwqDCoMKgIGVudW06DQo+ICvCoMKgwqDCoMKgIC0gZnNsLGlteDhxbS1waXhlbC1jb21iaW5l
cg0KPiArwqDCoMKgwqDCoCAtIGZzbCxpbXg4cXhwLXBpeGVsLWNvbWJpbmVyDQo+ICsNCj4gK8Kg
ICIjYWRkcmVzcy1jZWxscyI6DQo+ICvCoMKgwqAgY29uc3Q6IDENCj4gKw0KPiArwqAgIiNzaXpl
LWNlbGxzIjoNCj4gK8KgwqDCoCBjb25zdDogMA0KPiArDQo+ICvCoCByZWc6DQo+ICvCoMKgwqAg
bWF4SXRlbXM6IDENCj4gKw0KPiArwqAgY2xvY2tzOg0KPiArwqDCoMKgIG1heEl0ZW1zOiAxDQo+
ICsNCj4gK8KgIGNsb2NrLW5hbWVzOg0KPiArwqDCoMKgIGNvbnN0OiBhcGINCj4gKw0KPiArwqAg
cG93ZXItZG9tYWluczoNCj4gK8KgwqDCoCBtYXhJdGVtczogMQ0KPiArDQo+ICtwYXR0ZXJuUHJv
cGVydGllczoNCj4gK8KgICJeY2hhbm5lbEBbMC0xXSQiOg0KPiArwqDCoMKgIHR5cGU6IG9iamVj
dA0KPiArwqDCoMKgIGRlc2NyaXB0aW9uOiBSZXByZXNlbnRzIGEgZGlzcGxheSBzdHJlYW0gb2Yg
cGl4ZWwgY29tYmluZXIuDQo+ICsNCj4gK8KgwqDCoCBwcm9wZXJ0aWVzOg0KPiArwqDCoMKgwqDC
oCAiI2FkZHJlc3MtY2VsbHMiOg0KPiArwqDCoMKgwqDCoMKgwqAgY29uc3Q6IDENCj4gKw0KPiAr
wqDCoMKgwqDCoCAiI3NpemUtY2VsbHMiOg0KPiArwqDCoMKgwqDCoMKgwqAgY29uc3Q6IDANCj4g
Kw0KPiArwqDCoMKgwqDCoCByZWc6DQo+ICvCoMKgwqDCoMKgwqDCoCBkZXNjcmlwdGlvbjogVGhl
IGRpc3BsYXkgc3RyZWFtIGluZGV4Lg0KPiArwqDCoMKgwqDCoMKgwqAgZW51bTogWyAwLCAxIF0N
Cj4gKw0KPiArwqDCoMKgwqDCoCBwb3J0QDA6DQo+ICvCoMKgwqDCoMKgwqDCoCAkcmVmOiAvc2No
ZW1hcy9ncmFwaC55YW1sIy9wcm9wZXJ0aWVzL3BvcnQNCj4gK8KgwqDCoMKgwqDCoMKgIGRlc2Ny
aXB0aW9uOiBJbnB1dCBlbmRwb2ludCBvZiB0aGUgZGlzcGxheSBzdHJlYW0uDQo+ICsNCj4gK8Kg
wqDCoMKgwqAgcG9ydEAxOg0KPiArwqDCoMKgwqDCoMKgwqAgJHJlZjogL3NjaGVtYXMvZ3JhcGgu
eWFtbCMvcHJvcGVydGllcy9wb3J0DQo+ICvCoMKgwqDCoMKgwqDCoCBkZXNjcmlwdGlvbjogT3V0
cHV0IGVuZHBvaW50IG9mIHRoZSBkaXNwbGF5IHN0cmVhbS4NCj4gKw0KPiArwqDCoMKgIHJlcXVp
cmVkOg0KPiArwqDCoMKgwqDCoCAtICIjYWRkcmVzcy1jZWxscyINCj4gK8KgwqDCoMKgwqAgLSAi
I3NpemUtY2VsbHMiDQo+ICvCoMKgwqDCoMKgIC0gcmVnDQo+ICvCoMKgwqDCoMKgIC0gcG9ydEAw
DQo+ICvCoMKgwqDCoMKgIC0gcG9ydEAxDQo+ICsNCj4gK8KgwqDCoCBhZGRpdGlvbmFsUHJvcGVy
dGllczogZmFsc2UNCj4gKw0KPiArcmVxdWlyZWQ6DQo+ICvCoCAtIGNvbXBhdGlibGUNCj4gK8Kg
IC0gIiNhZGRyZXNzLWNlbGxzIg0KPiArwqAgLSAiI3NpemUtY2VsbHMiDQo+ICvCoCAtIHJlZw0K
PiArwqAgLSBjbG9ja3MNCj4gK8KgIC0gY2xvY2stbmFtZXMNCj4gK8KgIC0gcG93ZXItZG9tYWlu
cw0KPiArDQo+ICthZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UNCj4gKw0KPiArZXhhbXBsZXM6
DQo+ICvCoCAtIHwNCj4gK8KgwqDCoCAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2svaW14OC1s
cGNnLmg+DQo+ICvCoMKgwqAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Zpcm13YXJlL2lteC9yc3Jj
Lmg+DQo+ICvCoMKgwqAgcGl4ZWwtY29tYmluZXJANTYwMjAwMDAgew0KPiArwqDCoMKgwqDCoMKg
wqAgY29tcGF0aWJsZSA9ICJmc2wsaW14OHF4cC1waXhlbC1jb21iaW5lciI7DQo+ICvCoMKgwqDC
oMKgwqDCoCAjYWRkcmVzcy1jZWxscyA9IDwxPjsNCj4gK8KgwqDCoMKgwqDCoMKgICNzaXplLWNl
bGxzID0gPDA+Ow0KPiArwqDCoMKgwqDCoMKgwqAgcmVnID0gPDB4NTYwMjAwMDAgMHgxMDAwMD47
DQo+ICvCoMKgwqDCoMKgwqDCoCBjbG9ja3MgPSA8JmRjMF9waXhlbF9jb21iaW5lcl9scGNnIElN
WF9MUENHX0NMS180PjsNCj4gK8KgwqDCoMKgwqDCoMKgIGNsb2NrLW5hbWVzID0gImFwYiI7DQo+
ICvCoMKgwqDCoMKgwqDCoCBwb3dlci1kb21haW5zID0gPCZwZCBJTVhfU0NfUl9EQ18wPjsNCj4g
Kw0KPiArwqDCoMKgwqDCoMKgwqAgY2hhbm5lbEAwIHsNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgI2FkZHJlc3MtY2VsbHMgPSA8MT47DQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICNzaXpl
LWNlbGxzID0gPDA+Ow0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWcgPSA8MD47DQo+ICsN
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcG9ydEAwIHsNCj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCByZWcgPSA8MD47DQo+ICsNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBkYzBfcGl4ZWxfY29tYmluZXJfY2gwX2RjMF9kcHVfZGlzcDA6IGVuZHBvaW50IHsN
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlbW90ZS1lbmRwb2lu
dCA9IDwmZGMwX2RwdV9kaXNwMF9kYzBfcGl4ZWxfY29tYmluZXJfY2gwPjsNCg0KV2hpbGUgSSBh
Y2tub3dsZWRnZSB0aGlzIGp1c3QgYmVpbmcgYW4gZXhhbXBsZSB5b3Ugc2VlbSB0byBjYWxsIHRo
ZXNlIGFzIGZvbGxvd3MgZWxzZXdoZXJlOg0KDQpEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9icmlkZ2UvZnNsLGlteDhxeHAtcGl4ZWwtY29tYmluZXIueWFtbA0KDQpk
YzBfZHB1X2Rpc3AwX2RjMF9waXhlbF9jb21iaW5lcl9jaDANCnBpeGVsX2NvbWJpbmVyMF9jaDBf
ZHB1MF9kaXNwMA0KDQpPciBhbSBJIGp1c3QgbWlzc2luZyBzb21ldGhpbmc/DQoNCj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Ow0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9
Ow0KPiArDQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBvcnRAMSB7DQo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVnID0gPDE+Ow0KPiArDQo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgZGMwX3BpeGVsX2NvbWJpbmVyX2NoMF9kYzBfcGl4ZWxfbGluazA6IGVu
ZHBvaW50IHsNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlbW90
ZS1lbmRwb2ludCA9IDwmZGMwX3BpeGVsX2xpbmswX2RjMF9waXhlbF9jb21iaW5lcl9jaDA+Ow0K
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH07DQo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIH07DQo+ICvCoMKgwqDCoMKgwqDCoCB9Ow0KPiArDQo+ICvCoMKgwqDCoMKgwqDCoCBj
aGFubmVsQDEgew0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAjYWRkcmVzcy1jZWxscyA9IDwx
PjsNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgI3NpemUtY2VsbHMgPSA8MD47DQo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHJlZyA9IDwxPjsNCj4gKw0KPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBwb3J0QDAgew0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlZyA9IDww
PjsNCj4gKw0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRjMF9waXhlbF9jb21i
aW5lcl9jaDFfZGMwX2RwdV9kaXNwMTogZW5kcG9pbnQgew0KPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVtb3RlLWVuZHBvaW50ID0gPCZkYzBfZHB1X2Rpc3AxX2Rj
MF9waXhlbF9jb21iaW5lcl9jaDE+Ow0KDQpkaXR0bw0KDQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfTsNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfTsNCj4gKw0KPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBwb3J0QDEgew0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHJlZyA9IDwxPjsNCj4gKw0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGRjMF9waXhlbF9jb21iaW5lcl9jaDFfZGMwX3BpeGVsX2xpbmsxOiBlbmRwb2ludCB7DQo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZW1vdGUtZW5kcG9pbnQgPSA8
JmRjMF9waXhlbF9saW5rMV9kYzBfcGl4ZWxfY29tYmluZXJfY2gxPjsNCg0KZG8uDQoNCj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Ow0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB9Ow0KPiArwqDCoMKgwqDCoMKgwqAgfTsNCj4gK8KgwqDCoCB9Ow0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
