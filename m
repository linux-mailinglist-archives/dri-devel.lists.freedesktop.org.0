Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB34768A60
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 05:39:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7008610E167;
	Mon, 31 Jul 2023 03:38:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E19410E167
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 03:38:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PF9Da6m9jCX2TD2HJxARy+V81WqziDHutGseGUKIHZLfRG+zeArC3N2iM8L0OKDCkJKtS+A73G1t6eUE2jZsFuG8Scrjv5iQ3h06D6wZQZ+igfejOd3hn2+KrrNoXZHIjlVO8gRo7/KQIo7+5FhKK1OrJLnWecyNsyCCx0A3upc1+gf0OzAuReO2CVotgYrVDpZkUvWDNpCJ0k6k1zzaC7KrAV3414DtHGV0bK5MgBBDwe6s19SkuUTz+QdG2rVzrk20b8HkW9OazRyZoMVUCIzSK5wfsGhY1hQM72YpPekFZPEXZVInAtnOB1J7KkxFgXMtpGKTlj4sflYisgEfDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vicoPL4TQjzgT8Hwng28Lgip8vJ8WIUL9L5kftKl6WQ=;
 b=QP5Hec+UNzTKVbtkWn1G66x07rLiWXVQqx08brTiHKl8lID/sr3819x9Bep0CeKi681Rah1EeoK+W5HiG2hzw3ZU2GYIP6tyfcO+yugdT/L+i0uK/9CjdDbrvmpg5yEkS51jHKE5Q/K7rXi439P4Pq+pkUQQpD8TDi0vEjZxydEJBmwptXVfuWbH5bTOjh5ojU9jslTbzzz9Pmzsg4l7tyx76DGucbDhsVH1CfhGPjyVD4X6CtB6XH7czKbQwGJJJv1J/hZBw0vB1zA4mZBTDTgkTMiS/NqCWjtHOQMNYGozFDaJ4gTSubBSsI0oyKbAJo8jUocGS8CQyLKwsp2QMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vicoPL4TQjzgT8Hwng28Lgip8vJ8WIUL9L5kftKl6WQ=;
 b=Qv9ZMC+aC86x42tWlrN/kPxrFXP/1JBSl9DsCZqPDa1anoMcuVMQk2Fv2LpiQUY3D83YfjO8VOls2mKikOU0qm26yZQe5DJ9uDMZnza+HP//ec+JZ7/RMAyzty8Bymxh+O8Nd4Y247sMbWAny/pAqYdsaMtygZN0tQmc6I75qQM=
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB8852.eurprd04.prod.outlook.com (2603:10a6:20b:42f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Mon, 31 Jul
 2023 03:38:53 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b%4]) with mapi id 15.20.6631.043; Mon, 31 Jul 2023
 03:38:52 +0000
From: Ying Liu <victor.liu@nxp.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: RE: [PATCH v2 2/9] drm/bridge: synopsys: dw-mipi-dsi: Add input bus
 format negotiation support
Thread-Topic: [PATCH v2 2/9] drm/bridge: synopsys: dw-mipi-dsi: Add input bus
 format negotiation support
Thread-Index: Adm62TK6XpKEKypROket2EgKxcczbAIPJSaAABEB5RA=
Date: Mon, 31 Jul 2023 03:38:52 +0000
Message-ID: <AM7PR04MB7046D0D27AFE31DB682356DF9805A@AM7PR04MB7046.eurprd04.prod.outlook.com>
References: <20230720071430.259892-1-victor.liu@nxp.com>
 <20230720071430.259892-3-victor.liu@nxp.com>
 <CAMty3ZABMfRPiXM-N0d=AK8+CJZgBqd4zUeFz5-R8GY3fQQRrA@mail.gmail.com>
In-Reply-To: <CAMty3ZABMfRPiXM-N0d=AK8+CJZgBqd4zUeFz5-R8GY3fQQRrA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR04MB7046:EE_|AS8PR04MB8852:EE_
x-ms-office365-filtering-correlation-id: 5a480b2b-e86d-461c-cd98-08db9177a91a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: n6ha42sPP4FBeEvGd2iAkANfoklNeRZUqKGC/vN2x2gbghUFcF7SVDX8m2yIa7ZwNM8Cqbcy9OtEYH1lwgDTdL6Fvz7aPCtfDce7LO2I11a7YqLGqj46OYKYUkfufyN1mm9SmRvJ4OUx93MZh+4Ae6CUmCoGhjNtYUkHU8pk84EPw8FmUz6BKxwACIiaSzzyGeEbHA/JCsL6A+3Mudly0DgffaUlQgd/MFvsW8R+Q3wVkd/vxcVu0laI0tvt4qBBYd3jS0gKr04g27tXkR/zf9N7dmFNDw+Wvb5wFqYWt4CojKSebhTs9jbawgPlrDk/s4JecaH5VX8YFxwEBGeX2YgnessKKLd32eog9/uc0RVtqg7iZhbxAiJ4ScL5KKB5qvaz3h4ZbhmlI5Tx0IBDfKis8K4gXT05VatuqB8cof8zIwR598qAnzw4tK48R12HYwgC/ChpDRnTc/n93ApqZwh8H72UumsYcKjvIRMN6u4tf0DBdZKnJ5y0w4LUpKUtyjPfUFoEurqrVF/iXOZcWUY254N1PPZ/TitegKLl/wr28TNlPu3rX07GxPU8tVfOnCVQEpyRsw84d7cBgKcGixuGU5a5PsmF8LDV74LtkR8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(366004)(346002)(376002)(396003)(136003)(451199021)(9686003)(966005)(7696005)(55016003)(53546011)(6506007)(26005)(186003)(33656002)(76116006)(66946007)(66556008)(52536014)(7416002)(38070700005)(122000001)(54906003)(41300700001)(86362001)(66476007)(316002)(64756008)(66446008)(4326008)(5660300002)(6916009)(8936002)(8676002)(38100700002)(2906002)(71200400001)(66899021)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OU1ZUk4rMmlkMmF5SDZ1K3JFYlpWdzgvRk1hL3hjQUdrMnk4bjZPSDF0YXhs?=
 =?utf-8?B?amZWbEUwK2U2TUduQjU0UWE0ZGdzakNIdUV4QWRSNWd4VkZCQUZPYkVNTWtH?=
 =?utf-8?B?b0d4UVd1Sm9qUGViZzR6dkRDeTZqaWMzZ0RDUzM1R3JMOENxb0JXWFhjb1Zj?=
 =?utf-8?B?QVRVcmU0MHB2a1cxelV0SWxFS2hsczBaKzJQNmltdFcxR2pYWXlzR0RVRGxa?=
 =?utf-8?B?NmVWcWxaNHVYRW5qVDVYb0hXc0xLdTRCWFd0V0d6emx4MlV6UlRLR0s3ck9L?=
 =?utf-8?B?QkJJTkVLTEI5ZXhlZXR5dElWTzZuSjlHVTZMdVBkOFA5OFRqWVFHamIzU0tF?=
 =?utf-8?B?ZGV1VldNdE9Sa2drYWQwZ05oL0t6THk1TUtSa21hOVYzMkd5OHBwaVROZ1VL?=
 =?utf-8?B?YXBIVGFoc0FUQlVkQnBKMGNwWjkyRDY4OVNabkxRRVRyZDNYam5CVHFxRFlp?=
 =?utf-8?B?Rm9Va1RmTWlWSTNVeEVvQ2M5KzJpczQ5c3A4cGhlTXZNaTY3dHBERU5sS0tB?=
 =?utf-8?B?WW5IbnBaYVRkWkY4eEgrSmsxa0FyS2RtVDR4RFNUSGFpNjVpTERSTE1PNHRq?=
 =?utf-8?B?bFVKbE9KS1U4MTNLQmZKN1lPWkhTR1JQcHk3d2lmUm54MkdWZU9mdDRPbTE5?=
 =?utf-8?B?U2NGb3JqUDhoNnBlcnhIcmdFbDd2MDVETU9MbnJJa1RVNXRSOVlPVXdEVENw?=
 =?utf-8?B?VFBXMGNKQVVUZ3gxMHJDZlhSWkpXc2VmYk5WZE9tbUNVck13SGxqKzhvZHZu?=
 =?utf-8?B?S3RjMi8rL0VCM25sNnNZVVVUVXVXS1o0d2JtWjVqV255QlhObFRNQTZYR0RT?=
 =?utf-8?B?bEJwYStlVXQrUjlKNjZBblc5cm9FSGEzZlhvU0IxTUh6Ri85ZURqeEFhaUpC?=
 =?utf-8?B?K0lPTlhySlhDSlNxZkd3M1dVdWFsYkRDYkZ4WWVHNEhyejEvdTltUzRsSzlC?=
 =?utf-8?B?NHNHTXpQWVNuWjVvd1I3V245UmswOVpRTzZpSFEvb1ZjWUU4SmxlbUZyL0Ux?=
 =?utf-8?B?eXdLUVBvbUI5WUpWd0loOHNLWmQrY2JXQWRyeU03YWRIemRLU09QaG54NGZJ?=
 =?utf-8?B?aFFqWGl2aElLczIyaTVrV1lCcFRabUlSdm5TQk1xV2RNanJQQVhtVWs5bjh6?=
 =?utf-8?B?V3htY3psZk1aYitWMVNjemY3S1FDY3BXWjNtTmRHVTNja2l4bnUxYTlBd2E1?=
 =?utf-8?B?WGVzZHhPYStYVjh2Sjl0VjFQaWJOWGpvdFJaVFNoT1FqR3I2YTcrWEpXUFhi?=
 =?utf-8?B?U0lFNWVOSUVLamlHb2dkWitMbVdUUUpmd3ZvZVRmY0ZYZTNFell0WkhYeDRr?=
 =?utf-8?B?UHdOYjArT2pmV0x5UHBpMVREcWVnbzkwM0VPVGlMSm5iYiswcDM2Y1I0Z0NV?=
 =?utf-8?B?Q3FFcG5EYmFveTZac0UvRnRHK1lGbEdON1VtaFg2aHU0SXJtNW0zV1RMd2hm?=
 =?utf-8?B?NklKOGpTMkFDTnZ3cjUwTmU5VkZySUtLMXpEbVE4aXkzMWUrWkJVN0t6S1B1?=
 =?utf-8?B?OVArOWFYNmt5aXhJbUNwWHJidGM5SXFKSERyMjRuc0Y0cnJhQmJLYkdxcFdK?=
 =?utf-8?B?anFrSjlyZGZQcks1WnFYMkdaZmIwbC9zMnhpRjlsbDhTZVNuWVdQRmpNYkNF?=
 =?utf-8?B?UytUbFo4T3pLbnd0SWduSHdZNTVFOE1jd2o3UWVaZ2U3eHNaKzlTUm1UZnFz?=
 =?utf-8?B?SEdtTXF1WFRtRFVLRE5HVEFKaHpCTWttcFVPcUV3bzRLd0lkUWUvZ1RIdzhl?=
 =?utf-8?B?eEhoTmx6UXc0bENBQ0FrVC93R3lXdGlNd1B3Q1h6M2lxY3h1STBkVk10WE5P?=
 =?utf-8?B?VkVFbG00SzRPa09ESEJLK3haNG10T3lpSGJpZVBjZVl0WnVLL3gvVE1QQVdn?=
 =?utf-8?B?Q3I3Ulk1Q0FNN2tXcVJTblozWkFXSnYyMGRXM0FDSXdNQmk0RmxUSUtaZGdX?=
 =?utf-8?B?K1ozOTFyU2E3N0pRN2tyQ05kZThFTmd5aDRPQUtwdEtVWlFacHlKMk9FZXhU?=
 =?utf-8?B?NTR4V0ZOazRYa2NsVWRwSzY1N0FxeC9LRWxVUG1QL2pUSjZYaFpnYnoyeWRO?=
 =?utf-8?B?dkM4KzJxUU9rU1JLc0ZMTmtqTTc3SUo5UlI5QmhPUFBvM0oyNFpDY1lDYTdj?=
 =?utf-8?Q?YHII=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a480b2b-e86d-461c-cd98-08db9177a91a
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2023 03:38:52.7171 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IlHAVS6sC7qq1KdvP3tiZIwzWiutaUEQ4OwstXTlDE20HIAsWlO+vabXylQkTyaX9t53YlG1K6YF0afwHqn6oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8852
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
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "rfoss@kernel.org" <rfoss@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "alexander.stein@ew.tq-group.com" <alexander.stein@ew.tq-group.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 dl-linux-imx <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uZGF5LCBKdWx5IDMxLCAyMDIzIDI6NDQgQU0gSmFnYW4gVGVraSA8amFnYW5AYW1hcnVs
YXNvbHV0aW9ucy5jb20+IHdyb3RlOg0KPiANCj4gT24gVGh1LCBKdWwgMjAsIDIwMjMgYXQgMTI6
NDDigK9QTSBZaW5nIExpdSA8dmljdG9yLmxpdUBueHAuY29tPiB3cm90ZToNCj4gPg0KPiA+IElu
dHJvZHVjZSAtPmdldF9pbnB1dF9idXNfZm10cygpIGNhbGxiYWNrIHRvIHN0cnVjdCBkd19taXBp
X2RzaV9wbGF0X2RhdGENCj4gPiBzbyB0aGF0IHZlbmRvciBkcml2ZXJzIGNhbiBpbXBsZW1lbnQg
c3BlY2lmaWMgbWV0aG9kcyB0byBnZXQgaW5wdXQgYnVzDQo+ID4gZm9ybWF0cyBmb3IgU3lub3Bz
eXMgRFcgTUlQSSBEU0kuDQo+ID4NCj4gPiBXaGlsZSBhdCBpdCwgaW1wbGVtZW50IGEgZ2VuZXJp
YyBjYWxsYmFjayBmb3IgLQ0KPiA+YXRvbWljX2dldF9pbnB1dF9idXNfZm10cygpLA0KPiA+IHdo
ZXJlIHdlIHRyeSB0byBnZXQgdGhlIGlucHV0IGJ1cyBmb3JtYXRzIHRocm91Z2ggcGRhdGEtDQo+
ID5nZXRfaW5wdXRfYnVzX2ZtdHMoKQ0KPiA+IGZpcnN0LiAgSWYgaXQncyB1bmF2YWlsYWJsZSwg
ZmFsbCBiYWNrIHRvIHRoZSBvbmx5IGZvcm1hdCAtDQo+IE1FRElBX0JVU19GTVRfRklYRUQsDQo+
ID4gd2hpY2ggbWF0Y2hlcyB0aGUgZGVmYXVsdCBiZWhhdmlvciBpZiAtPmF0b21pY19nZXRfaW5w
dXRfYnVzX2ZtdHMoKSBpcw0KPiBub3QNCj4gPiBpbXBsZW1lbnRlZCBhcyAtPmF0b21pY19nZXRf
aW5wdXRfYnVzX2ZtdHMoKSdzIGtlcm5lbGRvYyBpbmRpY2F0ZXMuDQo+ID4NCj4gPiBTaWduZWQt
b2ZmLWJ5OiBMaXUgWWluZyA8dmljdG9yLmxpdUBueHAuY29tPg0KPiA+IC0tLQ0KPiA+IHYxLT52
MjoNCj4gPiAqIE5vIGNoYW5nZS4NCj4gPg0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5
bm9wc3lzL2R3LW1pcGktZHNpLmMgfCAzMA0KPiArKysrKysrKysrKysrKysrKysrDQo+ID4gIGlu
Y2x1ZGUvZHJtL2JyaWRnZS9kd19taXBpX2RzaS5oICAgICAgICAgICAgICB8IDExICsrKysrKysN
Cj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA0MSBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1taXBpLWRzaS5jDQo+IGIv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1taXBpLWRzaS5jDQo+ID4gaW5kZXgg
NTdlYWUwZmRkOTcwLi44NTgwYjhhOTdmYjEgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1taXBpLWRzaS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1taXBpLWRzaS5jDQo+ID4gQEAgLTEyLDYgKzEyLDcgQEAN
Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L2NvbXBvbmVudC5oPg0KPiA+ICAjaW5jbHVkZSA8bGludXgv
ZGVidWdmcy5oPg0KPiA+ICAjaW5jbHVkZSA8bGludXgvaW9wb2xsLmg+DQo+ID4gKyNpbmNsdWRl
IDxsaW51eC9tZWRpYS1idXMtZm9ybWF0Lmg+DQo+ID4gICNpbmNsdWRlIDxsaW51eC9tb2R1bGUu
aD4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4L29mX2RldmljZS5oPg0KPiA+ICAjaW5jbHVkZSA8bGlu
dXgvcG1fcnVudGltZS5oPg0KPiA+IEBAIC01MzYsNiArNTM3LDM0IEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgbWlwaV9kc2lfaG9zdF9vcHMNCj4gZHdfbWlwaV9kc2lfaG9zdF9vcHMgPSB7DQo+ID4g
ICAgICAgICAudHJhbnNmZXIgPSBkd19taXBpX2RzaV9ob3N0X3RyYW5zZmVyLA0KPiA+ICB9Ow0K
PiA+DQo+ID4gK3N0YXRpYyB1MzIgKg0KPiA+ICtkd19taXBpX2RzaV9icmlkZ2VfYXRvbWljX2dl
dF9pbnB1dF9idXNfZm10cyhzdHJ1Y3QgZHJtX2JyaWRnZQ0KPiAqYnJpZGdlLA0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkcm1fYnJpZGdl
X3N0YXRlICpicmlkZ2Vfc3RhdGUsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgc3RydWN0IGRybV9jcnRjX3N0YXRlICpjcnRjX3N0YXRlLA0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkcm1fY29u
bmVjdG9yX3N0YXRlICpjb25uX3N0YXRlLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHUzMiBvdXRwdXRfZm10LA0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCAqbnVtX2lucHV0X2ZtdHMp
DQo+ID4gK3sNCj4gPiArICAgICAgIHN0cnVjdCBkd19taXBpX2RzaSAqZHNpID0gYnJpZGdlX3Rv
X2RzaShicmlkZ2UpOw0KPiA+ICsgICAgICAgY29uc3Qgc3RydWN0IGR3X21pcGlfZHNpX3BsYXRf
ZGF0YSAqcGRhdGEgPSBkc2ktPnBsYXRfZGF0YTsNCj4gPiArICAgICAgIHUzMiAqaW5wdXRfZm10
czsNCj4gPiArDQo+ID4gKyAgICAgICBpZiAocGRhdGEtPmdldF9pbnB1dF9idXNfZm10cykNCj4g
PiArICAgICAgICAgICAgICAgcmV0dXJuIHBkYXRhLT5nZXRfaW5wdXRfYnVzX2ZtdHMocGRhdGEt
PnByaXZfZGF0YSwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgYnJpZGdlLCBicmlkZ2Vfc3RhdGUsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNydGNfc3RhdGUsIGNvbm5fc3RhdGUsDQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG91dHB1dF9m
bXQsIG51bV9pbnB1dF9mbXRzKTsNCj4gDQo+IFdoeSBkbyB3ZSBuZWVkIHBsYXRmb3JtLWNvbnRy
b2xsZWQgYnVzIGZvcm1hdHM/IFRoZSBzdXBwb3J0ZWQgYnJpZGdlDQo+IGZvcm1hdHMgYXJlIGNv
bW1vbiBhY3Jvc3MgYWxsIHBsYXRmb3JtcyBhbmQgaXQgaXMgc3BlY2lmaWMgdG8gdGhlIGxpc3QN
Cj4gb2YgZm9ybWF0cyBzdXBwb3J0ZWQgYnkgRFctTUlQSSBEU0kuIGlzbid0IGl0Pw0KDQpJZGVh
bGx5LCB5ZXMuICBCdXQsIGlmIHdlIGNvbnNpZGVyIHNvbWUgU29DIGxvZ2ljcyBpbnRyb2R1Y2Vk
IGR1ZSB0bw0KRFcgTUlQSSBEU0kgaW50ZWdyYXRpb24obGlrZSB0aGUgRElTUExBWV9NVVggcmVn
aXN0ZXIgaW4gaS5NWDkzDQptZWRpYSBibGstY3RybCBhcyBhIHN5c2NvbiksIHRoZW4gcGRhdGEt
PmdldF9pbnB1dF9idXNfZm10cyBpcyBoYW5keQ0KdG8gY292ZXIgdGhlIGxvZ2ljcy4gTWVzb24n
cyBNSVBJX0RTSV9UT1BfQ05UTCByZWdpc3RlciBhbmQgc3RtJ3MNCkRTSV9XQ0ZHUiByZWdpc3Rl
ciBhcmUgdGhlIHNpbWlsYXIgY2FzZXMgZm9yIGludGVncmF0aW9uLiAgUm9ja2NoaXANCmRpcmVj
dGx5IHNldHMgZGlzcGxheSBjb250cm9sbGVyJ3Mgb3V0cHV0IGJ1cyBmb3JtYXQgaW4gLT5hdG9t
aWNfY2hlY2soKS4NCg0KR3JhbnRlZCB0aG9zZSBTb0MgbG9naWNzIGNhbiBiZSBhIHN0YW5kYWxv
bmUgRFJNIGJyaWRnZSBhcyB0aGUgcHJldmlvdXMNCmJyaWRnZSBvZiB0aGUgRFcgTUlQSSBEU0kg
YnJpZGdlLiAgSG93ZXZlciwgdGhlIHF1ZXN0aW9uIGlzIHRoYXQgYXJlIHRoZQ0KbG9naWNzIHdv
cnRoIGEgc2VwYXJhdGUgRFJNIGJyaWRnZSBkcml2ZXIsIGNvbnNpZGVyaW5nDQpwZGF0YS0+Z2V0
X2lucHV0X2J1c19mbXRzIGlzIHF1aXRlIGhhbmR5Pw0KDQpJbXBsZW1lbnRpbmcgYSBzZXBhcmF0
ZSBEUk0gYnJpZGdlIGRyaXZlciBmb3IgaS5NWDkzIERJU1BMQVlfTVVYDQp0byBhZGQgdHdvIERS
TSBicmlkZ2VzIGlzIGEgYml0IGhhcmQsIGJlY2F1c2UgdGhlIHNpbmdsZSByZWdpc3RlciBjb250
cm9scw0KYm90aCBleHRlcm5hbCBwYXJhbGxlbCBkaXNwbGF5IHBpeGVsIGZvcm1hdCBhbmQgRFNJ
IGNvbnRyb2xsZXIgaW5wdXQgcGl4ZWwNCmZvcm1hdCB3aXRoIGRpZmZlcmVudCBiaXQgZmllbGRz
LiAgQW5kLCBJJ3ZlIGFscmVhZHkgc2VudCBhIHBhdGNoIHNlcmllc1sxXQ0KdG8gYWRkIGEgRFJN
IGJyaWRnZSBkcml2ZXIgZm9yIHRoZSBleHRlcm5hbCBwYXJhbGxlbCBkaXNwbGF5IHBpeGVsIGZv
cm1hdA0KY29udHJvbC4NCg0KWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9z
ZXJpZXMvMTEzNDU3Lw0KDQpSZWdhcmRzLA0KTGl1IFlpbmcNCg0KPiANCj4gVGhhbmtzLA0KPiBK
YWdhbi4NCg==
