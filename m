Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB761757868
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 11:49:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87D3410E30B;
	Tue, 18 Jul 2023 09:49:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2040.outbound.protection.outlook.com [40.107.104.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A223C10E30B
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 09:49:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lw89M9+/jvPCdiMcn/tWHC6hNWtHIl1/kGezqKkyKdtDZVzbp9yf3HRDrEt3tdLvzvdCR/zHdD3Qn6wEYKMNn5QA1vKbSMQGrwmpvyBks10h86hsY2PszIdRl9mVMff866brTep9fnj7LtdMIXMBhfPBjqeo88KXGaUOiyvmJXLWJ2SlvA7ttEu7ogzTghZIJPKipc1AVktCpt6K2lqRvgRRqCI+ihZTqCVUzBLcAyvg/s1C6sZ9JbP5Tl9St7s71DZvJuKGfr17Jwtf+hKhOZFAUMEnIiK7aiKskbjk0SCiKWoL0Z2wIHFoMXS2gkpu8FBsynRw6yvqRJsg2KvoGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ugK5iXiQjjHPA16dTzsMS3UmZI6UdwbgZ4jdfiGjc/E=;
 b=EbExuscLSQfSx7UO4ka9x9Cub+JO9CTKMg2I5VN+m7QxYYhI3P4SGqtSq0EdSewEznCTQ3pX/rkTaPblAodYUOvWkpEf/vch4Xn3QlDh1xAddBA4K0YprUqSy+CC+TpcEibxyV8+3PxbJTQFLnOAdhtTGX2N05cKtC6/SzflOUX+0McE3qla8dNbAACgSbA0H+AUBjONcTShecF5AmzU7dWHD6Ai5FFGMDAHGYnssWsvkMP/R/dOqiullqTWcBO+uOfMmRJQzpJ156BUsO++H64CzeBKT268wR7YdIRI5tJ80Pkd22f7/JVf4RAYuAZ139C25g5PyBNyyr1a/N1szw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ugK5iXiQjjHPA16dTzsMS3UmZI6UdwbgZ4jdfiGjc/E=;
 b=f0NrvduZTB+tBsSfKYjcGAkxkJYNp+xwoV7tJrryhlH/upv/1MpF/SfPcxqMoGmraGM7UZWmKysBUuzl77RocDNMzZMxui3NBKEc4xKbliPNL5B4eyqTnCK6BCT+BT/Dst258H0NrYNgjvKscUYlYBHUFnEVdZanEeyPahajNJk=
Received: from DB8PR04MB7051.eurprd04.prod.outlook.com (2603:10a6:10:fd::20)
 by AS8PR04MB7496.eurprd04.prod.outlook.com (2603:10a6:20b:29d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.23; Tue, 18 Jul
 2023 09:49:26 +0000
Received: from DB8PR04MB7051.eurprd04.prod.outlook.com
 ([fe80::5073:2966:2774:c741]) by DB8PR04MB7051.eurprd04.prod.outlook.com
 ([fe80::5073:2966:2774:c741%3]) with mapi id 15.20.6588.027; Tue, 18 Jul 2023
 09:49:26 +0000
From: Ying Liu <victor.liu@nxp.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: RE: [PATCH 9/9] drm/bridge: imx: Add i.MX93 MIPI DSI support
Thread-Topic: [PATCH 9/9] drm/bridge: imx: Add i.MX93 MIPI DSI support
Thread-Index: AQHZuHX2kU9tVwb+/k68aHvm3zH4HK+9gzeAgAFOwzCAAHNXgIAAALpw
Date: Tue, 18 Jul 2023 09:49:26 +0000
Message-ID: <DB8PR04MB7051B5AB0D57BCEF2FBEBAE99838A@DB8PR04MB7051.eurprd04.prod.outlook.com>
References: <20230717061831.1826878-1-victor.liu@nxp.com>
 <20230717061831.1826878-10-victor.liu@nxp.com>
 <CAMty3ZAdzASJCz+j4iOTJ+wCXWP2Z48jFL687kxDmJLPU7T6gA@mail.gmail.com>
 <AM7PR04MB7046BF03266ED1CE21CFC3A99838A@AM7PR04MB7046.eurprd04.prod.outlook.com>
 <CAMty3ZDy7Ty2AUV+Ab60nvgBzyLB-ejM=Yij9RFyTNvJBG_EvA@mail.gmail.com>
In-Reply-To: <CAMty3ZDy7Ty2AUV+Ab60nvgBzyLB-ejM=Yij9RFyTNvJBG_EvA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR04MB7051:EE_|AS8PR04MB7496:EE_
x-ms-office365-filtering-correlation-id: c5f555b0-b5ef-4dfd-bcc4-08db877445f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2bY9cEYWIhoASQj5BCdYiBzlpD+DTwsGIyVFh75cu/ogtbzqWPdncSGfxx3ZDLDw+NSFZn15Xlqn+pXqW1jpZhLMtmhbYH9pDMPfMYA/SvK8QX6HDwaB1tATyAYsOTRn20KG+n8frAoqCPMAOly/wCMtU8lq4BmOa3IPpzbHu82bzwvSzxZuQsSCyZu8idnywMybHaQuJ9c22qhoSguA0+nt5AG3Q3OlRb/CIODWSSoiUhIl9JrVnItOyefjQsuIWYGB2562+7V4PxeWQyJh/XTbk/XghjGF/leugZORncTY7zq07iWgHQzp5MV+BTUnzoSPUbOtquax5xW/remLln7zdOeHNuTBwNtxYzmZhjkck5GPHfTQ5e749f91qx+pMj5uHxGIzSdnSAr8ysUjvxIU7urCu1NrS/yxYvxl6EkjEAEIU+MkGtq4n+DnqHRRfXf3+/nxRBEmhutN3MbYDbS1xUH1KDixtVFmaLNaK5K1eXpTaKhIGezTzTV4VAv9xw4XpOgMR8+o/Z/TGdlVmz+01nNQ8Cs49E/v0cEjY2kSgNlrmXqVx8v8QDETZ/1CeAV9dLTSyNuldxObJWJmabkwJWfZolI+RcaLFCerjlF8juoNx3X6TsqKd3xb6hOj
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB8PR04MB7051.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(376002)(366004)(39860400002)(396003)(136003)(451199021)(478600001)(26005)(6506007)(53546011)(9686003)(55016003)(7696005)(71200400001)(8676002)(8936002)(33656002)(38070700005)(7416002)(52536014)(5660300002)(316002)(4326008)(6916009)(41300700001)(86362001)(2906002)(186003)(122000001)(38100700002)(66946007)(54906003)(76116006)(66556008)(66476007)(66446008)(64756008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K3VzTWljT1VnR0x5NlNKa0dpN2tlRURVQ0JlOHJ6RExqQWdHTkJmSmlQWkda?=
 =?utf-8?B?NFRtNmRsSGkwYWUraVFlT3NOdHE4Qk02VnhyeWx5Rld0WndHTlBYTmNOQXZr?=
 =?utf-8?B?NjI1WjdCaFJ0Q0xiL3UyQy9VaVlhdFFlekJmYmJ0NGlNOHdCOFBoanpBWk9i?=
 =?utf-8?B?cmZVQnVhT2s4MEF1WWZlcTRkQTBlZEx2UnZ2V0RacTNaclhNMm93Z0hyaXhm?=
 =?utf-8?B?ckdvbkNTcW5HeGs3R1hiMjhYWUpleUYzNFYvQ3ZQMmVFVndsTTFMM3BTTmZk?=
 =?utf-8?B?a2l6ZVc1aFJuWmQwcDhkRWE1ZzZJb0VkejdRRnRtYmI0VUFwSlhKOThkQmVw?=
 =?utf-8?B?eHR0MVlVa2VsVWpQUTAwVDZzY3lBTjdDT2hZZC8rdXN5U2dURTZoOVRDcFRl?=
 =?utf-8?B?UDUrZThWNC9OWE9td2hqSGJaaFFUNlZoRm5BRkJPQnZxbTRwNU5WOVhiZzNK?=
 =?utf-8?B?cVV1ZUd5Mng4YVgxQUgwZ0d0Mm53TENVVFFyY0xoZWdBWGJrQzBwZUo4MGxF?=
 =?utf-8?B?bzB5dm5LZGtVdkVmWE1oUm1DOFBVMjdDV0RNNkZZam1yU2o5ZS9FbVFjc2Nh?=
 =?utf-8?B?TDJoN3pNWEFHQVIrY3pQb2NBM3p0Q3FISzZUVE9rZTdBR1BRMU1aMjRBUllS?=
 =?utf-8?B?RDBveGh2ZlNWczNuOXh6b2k2ZitncHhBSHlLV0xzcUdrSVAwbVBYemkyaFBJ?=
 =?utf-8?B?S0lNb213MkZiT3g4S1pEa3RncWlQakM1U1pVblB2NWw5N2hpblAvbWxCdkwz?=
 =?utf-8?B?SXh1U0krOTRTNmJRK0h5OWlwNno0Y01FZGpzYXpNZWJjN3FOWTNMQU9LMTBD?=
 =?utf-8?B?QUk5TXRwRlBrZVgzc2Z2SmlkNENCdWZiclhjV1lrWjMxZmpnYmJnRldCS2pr?=
 =?utf-8?B?QTBRUVNycWJVZDB0TlJWVGlINWVlMCs4S2JZRVFYdFg4QzRFaEdQTlhVWTB0?=
 =?utf-8?B?Wi9lNWUyWWJhMzEvbXYxVHJmUE45TDVHV1k5U3VmOWFBeHBIQlhPWEJOSjZN?=
 =?utf-8?B?UnloSXBBSHlkY2hsZDVFV1hJMXU0UWtFOTVzK1FjenhHd2hRWnQwb3IrR21z?=
 =?utf-8?B?T1FMc2tYRkVCVXNBQ3hBa3paQU03U1hneTQ2S2pOYy9wWk03YUgzVWw4NUYy?=
 =?utf-8?B?YzMxRVQyUUJyZTZUYUFTblVCUmU1UmtuYVRuNzlJNERmNHZEaWpYKzRLUmFN?=
 =?utf-8?B?ZEN6a1FvTjNBbG5zZm1qcXRCeWFkcU1tRU5TZm03UE14WU44RllTZjBJcmI2?=
 =?utf-8?B?UnZ5N2d2cEhZSFUrSWJJR1NXeFhlblZlUmtLYjl1TlhYaXhxWWo3Mmc4ZStN?=
 =?utf-8?B?ZnorRk9DNnRVM3h6NmtxYzhwNWh3TGVyTU9iZHFrWkJ4UXJEbVBwaUp1UEM5?=
 =?utf-8?B?LytKaTRPci9SVC82Rm5QSW81T2dNeitGNnhnTFV2WE5IdjQ5WkdQSGMrMkZr?=
 =?utf-8?B?MnVBRkRyMENhcEtvOEJVYnZuTEdjdEpmRnAwcmVKcVF5NkZPNjFVZkx2QmVp?=
 =?utf-8?B?dDVmK1JOWWFVcklTY1d1NzVvNHcxK0NIWVJuNE5OSnJoUWdJWGtVQjRUMDMz?=
 =?utf-8?B?N2dBZnA3OGphdU1tQWJrdkM3bDZGdjhNVDVPbEM5eXhJTk1TcHBuNkttdHpV?=
 =?utf-8?B?c0xaQ0cvQkFRNnc4M2Z0NjZ4OHl1emJGRGhid0FNUktkQTV4VXVENzB0Szk3?=
 =?utf-8?B?aVVKeEd4cWUwSXFCeE5HQkc2MHlrblpTMEM5MUg1M2FBL0lvNzdMN1l5b09B?=
 =?utf-8?B?cEwrblBlTlVUUDU1WlRZdmVCUHEwT2hwQ0pOSmN0TnZXWDVDbEtZSlF1ODFH?=
 =?utf-8?B?NkRHMVNkMjlGSWdvcHJnemo5MWRrdnRFeHlLYmFDK2pkNHhRT0ZEQ3BWeHZ2?=
 =?utf-8?B?bW1XMGpMcm1kbjN4SFRITDlLRlVOTkhURUVCVFlrT3ZlVHNBRUF0dWFGdGlt?=
 =?utf-8?B?cllid2diVytpVEZnRDJ0cGdnSWw1Wm5zbDVSdXJBVHBOQVM2VmJDbXo0dGox?=
 =?utf-8?B?TWF6Z1QyL3A3U3VOc0o1dTEzNEVuTXc2am9EK1p2d2E5aGxVSHBrMisxMWFR?=
 =?utf-8?B?ZEZvM0NMSjFtbmd2Tlp4dlFaRmtmTnFLaEUycVB3a0VpQ3VFTTh3cWJKRFl1?=
 =?utf-8?Q?zluw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7051.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5f555b0-b5ef-4dfd-bcc4-08db877445f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2023 09:49:26.2327 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bQNYYM9OIgctaSVur4ugXI9vkh9Uzj4rGwUhBShzbaU6BvvRaV8mX2+7NqdJ+s+pfBkI89uyRkmD5nXI4KnQbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7496
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

T24gVHVlc2RheSwgSnVseSAxOCwgMjAyMyA1OjM1IFBNIEphZ2FuIFRla2kgPGphZ2FuQGFtYXJ1
bGFzb2x1dGlvbnMuY29tPiB3cm90ZToNCj4gDQo+ID4NCj4gPiBIaSBKYWdhbiwNCj4gPg0KPiA+
IE9uIE1vbmRheSwgSnVseSAxNywgMjAyMyAyOjQ0IFBNIEphZ2FuIFRla2kNCj4gPGphZ2FuQGFt
YXJ1bGFzb2x1dGlvbnMuY29tPiB3cm90ZToNCj4gPiA+IE9uIE1vbiwgSnVsIDE3LCAyMDIzIGF0
IDExOjQ04oCvQU0gTGl1IFlpbmcgPHZpY3Rvci5saXVAbnhwLmNvbT4gd3JvdGU6DQo+ID4gPiA+
DQo+ID4gPiA+IEZyZWVzY2FsZSBpLk1YOTMgU29DIGVtYmVkcyBhIFN5bm9wc3lzIERlc2lnbndh
cmUgTUlQSSBEU0kgaG9zdA0KPiA+ID4gPiBjb250cm9sbGVyIGFuZCBhIFN5bm9wc3lzIERlc2ln
bndhcmUgTUlQSSBEUEhZLiAgU29tZSBjb25maWd1cmF0aW9ucw0KPiA+ID4gPiBhbmQgZXh0ZW5z
aW9ucyB0byB0aGVtIGFyZSBjb250cm9sbGVkIGJ5IGkuTVg5MyBtZWRpYSBibGstY3RybC4NCj4g
PiA+ID4NCj4gPiA+ID4gQWRkIGEgRFJNIGJyaWRnZSBmb3IgaS5NWDkzIE1JUEkgRFNJIGJ5IHVz
aW5nIGV4aXN0aW5nIERXIE1JUEkgRFNJDQo+ID4gPiA+IGJyaWRnZSBoZWxwZXJzIGFuZCBpbXBs
ZW1lbnRpbmcgaS5NWDkzIE1JUEkgRFNJIHNwZWNpZmljIGV4dGVuc2lvbnMuDQo+ID4gPg0KPiA+
ID4gSSB0aGluayB0aGUgYmV0dGVyIHdheSB3b3VsZCBhZGQgY29tcGF0aWJpbGl0eSB0byBiZSBw
YXJ0IG9mIGV4aXN0aW5nDQo+ID4gPiBkdy1taXBpLWRzaS5jIHdpdGggc3BlY2lmaWMgZHJpdmVy
IGRhdGEuIFRoaXMgd2F5IGl0IGF2b2lkcyBhbGwgdGhlDQo+ID4gPiBwbGF0Zm9ybS1yZWxhdGVk
IGhlbHBlcnMoZXh0ZW5zaW9ucykgYW5kIG1ha2VzIHRoZSBkcml2ZXIgZ2VuZXJpYyB0bw0KPiA+
ID4gYWxsIFNvQ3Mgd2hpY2ggdXNlIERXIERTSSBJUC4gSXQgd291bGQgYmUgYSBzdHJhaWdodGZv
cndhcmQgY2hhbmdlIGFzDQo+ID4gPiB0aGUgaW14OTMgZHJtIHBpcGVsaW5lIGFscmVhZHkgc3Vw
cG9ydHMgYnJpZGdlIHRvcG9sb2d5Lg0KPiA+DQo+ID4gVGhlIHBsYXRmb3JtLXJlbGF0ZWQgc3R1
ZmYgaXMgaGFuZGVkIG92ZXIgdG8gZHctbWlwaS1kc2kuYyB2aWEgc3RydWN0DQo+ID4gZHdfbWlw
aV9kc2lfcGxhdF9kYXRhIGFzIGFuIGFyZ3VtZW50IG9mIGR3X21pcGlfZHNpX3Byb2JlKCkuICBJ
dCBsb29rcw0KPiA+IG9rIGZvciB2ZW5kb3IgZHJpdmVycyB0byBjYWxsIGR3X21pcGlfZHNpX3By
b2JlKCkgdG8gc2V0IHRoZSBwbGF0Zm9ybS0NCj4gcmVsYXRlZA0KPiA+IGluZm9ybWF0aW9uKHJv
Y2tjaGlwLCBtZXNvbiBhbmQgc3RtIGRvIHRoYXQpLCBsaWtlIHBkYXRhLnBoeV9vcHMgYW5kDQo+
ID4gcGRhdGEuaG9zdF9vcHMuDQo+IA0KPiBJIHVuZGVyc3RhbmQgdGhpcyB0b3BvbG9neSBvZiBo
YXZpbmcgc29jLXBsYXRmb3JtIGRyaXZlcnMgd2l0aA0KPiBkdy1taXBpLWRzaSBicmlkZ2UuIFdo
YXQgSSdtIHN1Z2dlc3RpbmcgaXMgdG8gbm90IGFkZCBhIHNvYy1wbGF0Zm9ybQ0KPiBkcml2ZXIg
Zm9yIGlteDkzIGluc3RlYWQgYWRkIGFkZCBzdXBwb3J0IGRpcmVjdGx5IG9uIGR3LW1pcGktZHNp
DQo+IGJyaWRnZS4NCg0KSXQgc2VlbXMgdGhhdCBkaXJlY3RseSBzdXBwb3J0aW5nIGkuTVg5MyBN
SVBJIERTSSBpbiBkdy1taXBpLWRzaS5jIGlzDQpub3QgZmVhc2libGUuICBUaGUgbWFpbiByZWFz
b24gaXMgdGhhdCBzdHJ1Y3QgZHdfbWlwaV9kc2lfcGxhdF9kYXRhDQpjb250YWlucyBwaHlfb3Bz
IGFuZCBlYWNoIHZlbmRvciBkcml2ZXIgcHJvdmlkZXMgdmVyeSBkaWZmZXJlbnQNCm1ldGhvZHMg
Zm9yIHBoeSwgd2hpbGUuLi4NCg0KPiANCj4gPg0KPiA+IGR3LW1pcGktZHNpLmMgaXMgZ2VuZXJp
YyB3L3dvIHRoaXMgcGF0Y2ggc2VyaWVzLg0KPiA+DQo+ID4gQ2FuIHlvdSBlbGFib3JhdGUgbW9y
ZSBhYm91dCBhZGRpbmcgY29tcGF0aWJpbGl0eSB0byBiZSBwYXJ0IG9mIGV4aXN0aW5nDQo+ID4g
ZHctbWlwaS1kc2kuYyB3aXRoIHNwZWNpZmljIGRyaXZlciBkYXRhPyAgSSBkb24ndCBzZWUgY2xl
YXIgYXBwcm9hY2ggdG8gZG8NCj4gPiB0aGF0Lg0KPiANCj4gUGxlYXNlIGNoZWNrIHRoZSBhYm92
ZSBjb21tZW50cywgYW4gZXhhbXBsZSBvZiBzYW1zdW5nLWRzaW0uYw0KDQouLi4gaXQgc2VlbXMg
dGhhdCBzYW1zdW5nLWRzaW0uYyB1c2VzIHN0cnVjdCBzYW1zdW5nX2RzaW1fZHJpdmVyX2RhdGEg
dG8NCmRpZmZlcmVudGlhbCBwbGF0Zm9ybSBpbmZvcm1hdGlvbiBhbmQgaXQgZG9lc24ndCBjb250
YWluIGFueSBjYWxsYmFjaywgd2hpY2gNCm1lYW5zIGNvbXBhcmluZyB0byBEVyBNSVBJIERTSSwg
U2Ftc3VuZyBEU0lNIHNob3dzIG1vcmUgY29uc2lzdGVuY3kNCmFjcm9zcyB2ZW5kb3IgU29DcyBm
cm9tIEhXIElQL1NvQyBpbnRlZ3JhdGlvbiBQb1YuDQoNClJlZ2FyZHMsDQpMaXUgWWluZw0KDQo+
IA0KPiBUaGFua3MsDQo+IEphZ2FuLg0K
