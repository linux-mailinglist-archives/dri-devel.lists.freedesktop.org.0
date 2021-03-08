Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5740330A98
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 10:53:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 371456E844;
	Mon,  8 Mar 2021 09:53:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40072.outbound.protection.outlook.com [40.107.4.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D4376E844
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Mar 2021 09:53:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=chrYa/9odeDqfrblAAg1U0GohRsap5EZXQqEPvg8Z6Vxhuz+hU/jg4vc9Nr0wlM7qxKTMIL+kpbx1rrUG19UVzGkGEJI45nFQq+lqpcpHVPVyBBWbFxuBcWIO7maHUvsvuuBenvWXg5Riv4J6YumjGKiMBKFAFTQy/MR8X/eUZy7BoDB1YKQYTFcXIRgLzb0IVabIBlWXwJwqy6t01uAz9TBHGS+MFB0nTuF1qiLd7tZ9pr515+t/i4xU3v7mV7cUC/kVz0s9I2Etks8YR727ERSGs3UwmspyFEsTH5kCptK4YL/MX3n/hLAsj3KB1WuMS0Ii9v/8Q4zaT+oGefgHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S+/2WY26xe8Br5GUQyH/6d0BFghH6kFd11wd9V5mjMw=;
 b=LDAUXwJdWyP8gorJJYRtjTxFbRwrmv3e9zHWAt5bVVYuoqHWUojGYKPSs4GEbwfhnvI/Cmq0xyV+jBxxWvGPzHForYCdBW72PWZdTZ2JCYlTsj3IZBFzWC56vkCQCxV2f3CsfT9m3tYZ86sHBPHdhv/XzKP3jPGge801AfrxVc61PO3aU0/yTSIeo5blcxGCLkmP4VxMFmegiZCaRN+4pxy4yWA9yVOJkQTYjnb9fs4o9oKawUdd6X/jGR4t32wzNJ5STVNeNPCDogUUFex90HgIiydP5nXVy23PQpDlRfVIIUs8N2TlXfNQCE6nAYGsBXpnpdVyti/VxN75JuszKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S+/2WY26xe8Br5GUQyH/6d0BFghH6kFd11wd9V5mjMw=;
 b=eDpius+3DaBIkqyNiYF9iaG0nZAGSySoNVuJi2xfQ8YR4UpkXTnU6byNMbNsxa08Kyx9pcpfS2WWVHGW9eTuz2YtG+BTlNL3Es02j3vuOAFaMyL2ECZzYT03BnxHc8Jh1Bf7PEVSzLFE9EayZD4TLzzKUH63suwV8mxjEr0OK50=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB7181.eurprd04.prod.outlook.com (2603:10a6:800:12a::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.26; Mon, 8 Mar
 2021 09:53:31 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3912.027; Mon, 8 Mar 2021
 09:53:31 +0000
Message-ID: <82712e64c5ff62645e0e15f0e99b3454e03d0802.camel@nxp.com>
Subject: Re: [PATCH v4 08/14] dt-bindings: display: bridge: Add i.MX8qxp
 pixel link to DPI binding
From: Liu Ying <victor.liu@nxp.com>
To: Rob Herring <robh@kernel.org>
Date: Mon, 08 Mar 2021 17:52:03 +0800
In-Reply-To: <20210305224227.GA772562@robh.at.kernel.org>
References: <1613619715-28785-1-git-send-email-victor.liu@nxp.com>
 <1613619715-28785-9-git-send-email-victor.liu@nxp.com>
 <20210305224227.GA772562@robh.at.kernel.org>
User-Agent: Evolution 3.36.4-0ubuntu1 
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK0PR01CA0068.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::32) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from blueberry.ap.freescale.net (119.31.174.66) by
 HK0PR01CA0068.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Mon, 8 Mar 2021 09:53:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4f8b9d80-3854-4a50-e373-08d8e2180762
X-MS-TrafficTypeDiagnostic: VI1PR04MB7181:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB7181B41D933A9004398C122198939@VI1PR04MB7181.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7CUlLYaNXgZteC9DvquLCOgXyVSVRAh/UP5lx/F6hwYZD/TZUp4MA1irZS00m9DtCTLxeeh9iedNGJuIRROVPUDn/QJRl0KjNTZ3GW5c5NKCx0JCVPcAqf1dXX2XMNRiwPEgz8+2RtAYT5z4YQWv+Q8llF1TKiP/luzkd5nS05pcpkiNsBD1knefJa+dbpEn9oGQOsAYB73EpG1xMoHFRmXrK9Ter0PvgSNs/P8JFoJXC2T+vnQJ72B3yWCME9tlZvYjfmgjSm7zXc43w4CoI/ysylz6NeKdEjmsjDO4MM7YXxCIt8rVME8k2HCx6H3KM5EZ0j93eqkCL9mhCnSm5HVZrRx830ZjHejJW4RYVAIgHJPDmqvN08zJTnaRdELYQAkj62q6/W3m7Kflln+DEJu+unm6CP/kkEZVtsdVOBJbU2ED2lKqvItNq/zowpWScHX/jLm9Xn6LomXRY3VwzYLz5yy0ERcHBcnUNL66C8JyTSwavLiJmIwDsJbe3NBcjyBKOvQkPH0Vp6VkxAs0KMtol3ldrY8g1hZshrslJGYSP0WDRkb4XWBqMuEcNw9c4Ax2463avo0S4AebQfUqaw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(136003)(396003)(39850400004)(8936002)(6512007)(478600001)(316002)(2906002)(8676002)(6666004)(6506007)(66946007)(2616005)(956004)(66556008)(66476007)(6916009)(4326008)(5660300002)(6486002)(16526019)(52116002)(45080400002)(86362001)(26005)(186003)(966005)(7416002)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Q2Jlck1CRW5CZmJHOTMyRkJVTEEzTDZmb1poWDM4V2ZCbXZyeWNWWFM1em9O?=
 =?utf-8?B?bGhzR2RUaDFHb25NeXJEQnI1U3hyUkpWTDM1S3lNTDM2aUNkY05TUzEybjlD?=
 =?utf-8?B?aFBoRmorL083cGVISnkzZXlsajZyWExxNTBYZkk2ZDVtTnZabnhBUnMyeWpy?=
 =?utf-8?B?REJqVFJFbU43d3lxMEgwRmVlTUZRL3dLN2FuN1FpbnFkREFicnYvVi8yYVUv?=
 =?utf-8?B?dng4LzVsR3VFZm84bHNCcnFoWlVab3V4Tm5ENGdMaEU3MkxkOVJ2NTJkTzBQ?=
 =?utf-8?B?Ymh1SmJJSGp4bGxwY05mYldZSnJSa0FqZFRDVFZHQm01S29zMy9PUTN3MU9F?=
 =?utf-8?B?aWV4OFR3WEJXSldQd0hZdkRybzV2U09BVXF1KzllVDJ4VnZLR2JycGRLQlA0?=
 =?utf-8?B?MFlUQVo3VFZWRlB2Y0FtNFVadmxwVVJOMVpyZHhNOElaVHlRYTJxaXdvSzRU?=
 =?utf-8?B?M2JNc3FOQUhHd1ZOb3J0OXJteUo0bmRuZFp6RUNQanlEelJSTXRuQnhpd25V?=
 =?utf-8?B?dEYvWUJqSVh3emtMOW1xN2RTMjN1aDM0dGZBU0VxcHpEQTF3NlRVakNlNWZi?=
 =?utf-8?B?WVhTa0NxL2ZPNkNEV2NzTXM0Q3lOUUFiZGxoQld5UTdmZ0tWQjFEOGxEeEVR?=
 =?utf-8?B?Zm9RZVpOcEZNY3p5dVJrbm1DZ0tzZW9lTTBlUmIxWVhDYlo3SUV2ajQrdlYy?=
 =?utf-8?B?MWVxMTJJdlFkVG8zQWtUZkx2S3ZPcEYyTUJHeVpFQ25zK1FnbEtjdUdlNVhF?=
 =?utf-8?B?RzIvenBNM0dDUjJzUENBUXFrSGppbE9QZTRCSnc2R2ZrQXFCRjZRQzlJclgz?=
 =?utf-8?B?SUs5Z2N0dHc0RmUwVy9BdnFoS3BvaDJwZVdib0dDc1Rvc1JlMldnbzc0MWF0?=
 =?utf-8?B?bTVBSURhMXhON0orVTZKTjZjTG01R2xlemZqRW1iU29kY05HeFpWQk03Znlp?=
 =?utf-8?B?Wk5YeDY2ME0zNlpJRXpXTHJZelBIZVVNdmpLKzFpamNoczVMUHlld3NkMUVL?=
 =?utf-8?B?STNYRXBvYlZtdkhTekl3bWgrcVdzaU4yRzJPcEZWR0JUei9Ob1NSZ3RqRGdO?=
 =?utf-8?B?N0VRMjRPSHE5NHRBak5QN3RaWU82SW1CNkk1YTM5QlNOVExnYlp3NzAvUTEy?=
 =?utf-8?B?YS9Od014Q2h0SjFZMm1FMjlMRzFRTVprMmJnU2pqSU9IKzV1aHhZMmxTcHl2?=
 =?utf-8?B?dXhENGlXYjFPTkduUnlLQitVLzBsUXVGeFJNcTllbC9GMzhaUzNwZHJaZlBi?=
 =?utf-8?B?WGI5eUtqQ1VjSkR1dHhjcEkzemtoUFFSRkQzdkFwM3ArQStOcUVFMXQxNmoy?=
 =?utf-8?B?azlhZFl2RUNHMUwwcitWS0lnb3JvaWN6K0cxZVJIRmZmOGdua3IzQmN2b1Ir?=
 =?utf-8?B?Q3RmSndHZWNtNVV6SlZNNWR0NC9CRkVyeEk0alYrMy8xTTRMVW1uRFExcXlQ?=
 =?utf-8?B?V2cvaWRleFBNSmRoNkN2aGJTV2NnZGl2NENjc2Zlc2JYMU1JTTFMTDJNT0Jt?=
 =?utf-8?B?R2s1ak9RTXVHdWtBc0I4QTBvbHdxNklUNWhOaHcrTW9DS1RrTFh5WWNlNWRt?=
 =?utf-8?B?cForeEh3VzlpU3UwMU8xaWErWkFmVDhvankrdHJ2WERWdGhNL2lINnA0RzNt?=
 =?utf-8?B?Qy9FUUVreVU3QmNvTEpEeCtxamxKUkxaSFJETmp0cEdRbXZHVjRlYXRpd3dO?=
 =?utf-8?B?amkwY0RLVm1zSjFYajVtMzZPU2pWYVdrcFF6WXEydHpoR01UQVlsQTFoUGkr?=
 =?utf-8?Q?xU3k2+aVHpMcae9f5DYMPpAVTj/HzS7HX2w6YVe?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f8b9d80-3854-4a50-e373-08d8e2180762
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 09:53:31.1634 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rg+MHBCDcQq18GkXe6doI+kIPKKEaMLiuDSGdQp0pgetH+bG6dM83mQ6mNB/tmD72fY6S07+N5kUq3XbJ5T+qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7181
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 Laurent.pinchart@ideasonboard.com, kernel@pengutronix.de,
 narmstrong@baylibre.com, airlied@linux.ie, s.hauer@pengutronix.de,
 jonas@kwiboo.se, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kishon@ti.com, a.hajda@samsung.com, vkoul@kernel.org, linux-imx@nxp.com,
 mchehab@kernel.org, shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iLAoKT24gRnJpLCAyMDIxLTAzLTA1IGF0IDE2OjQyIC0wNjAwLCBSb2IgSGVycmluZyB3
cm90ZToKPiBPbiBUaHUsIEZlYiAxOCwgMjAyMSBhdCAxMTo0MTo0OUFNICswODAwLCBMaXUgWWlu
ZyB3cm90ZToKPiA+IFRoaXMgcGF0Y2ggYWRkcyBiaW5kaW5ncyBmb3IgaS5NWDhxeHAgcGl4ZWwg
bGluayB0byBEUEkoUFhMMkRQSSkuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IExpdSBZaW5nIDx2
aWN0b3IubGl1QG54cC5jb20+Cj4gPiAtLS0KPiA+IHYzLT52NDoKPiA+ICogQWRkICdmc2wsc2Mt
cmVzb3VyY2UnIHByb3BlcnR5LiAoUm9iKQo+ID4gCj4gPiB2Mi0+djM6Cj4gPiAqIERyb3AgJ2Zz
bCxzeXNjb24nIHByb3BlcnR5LiAoUm9iKQo+ID4gKiBNZW50aW9uIHRoZSBDU1IgbW9kdWxlIGNv
bnRyb2xzIFBYTDJEUEkuCj4gPiAKPiA+IHYxLT52MjoKPiA+ICogVXNlIGdyYXBoIHNjaGVtYS4g
KExhdXJlbnQpCj4gPiAKPiA+ICAuLi4vZGlzcGxheS9icmlkZ2UvZnNsLGlteDhxeHAtcHhsMmRw
aS55YW1sICAgICAgICB8IDEwOCArKysrKysrKysrKysrKysrKysrKysKPiA+ICAxIGZpbGUgY2hh
bmdlZCwgMTA4IGluc2VydGlvbnMoKykKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2ZzbCxpbXg4cXhwLXB4bDJk
cGkueWFtbAo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2ZzbCxpbXg4cXhwLXB4bDJkcGkueWFtbCBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9mc2wsaW14OHF4cC1weGwy
ZHBpLnlhbWwKPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMC4uZTRl
NzdmYQo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2ZzbCxpbXg4cXhwLXB4bDJkcGkueWFtbAo+ID4gQEAg
LTAsMCArMSwxMDggQEAKPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1v
bmx5IE9SIEJTRC0yLUNsYXVzZSkKPiA+ICslWUFNTCAxLjIKPiA+ICstLS0KPiA+ICskaWQ6IGh0
dHBzOi8vZXVyMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwJTNB
JTJGJTJGZGV2aWNldHJlZS5vcmclMkZzY2hlbWFzJTJGZGlzcGxheSUyRmJyaWRnZSUyRmZzbCUy
Q2lteDhxeHAtcHhsMmRwaS55YW1sJTIzJmFtcDtkYXRhPTA0JTdDMDElN0N2aWN0b3IubGl1JTQw
bnhwLmNvbSU3Q2EzN2VjNjdiYTMyNzRiY2VhNWM0MDhkOGUwMjdmNjliJTdDNjg2ZWExZDNiYzJi
NGM2ZmE5MmNkOTljNWMzMDE2MzUlN0MwJTdDMCU3QzYzNzUwNTgwOTU0NDAzNzU2MiU3Q1Vua25v
d24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pC
VGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0MxMDAwJmFtcDtzZGF0YT1VTjJJUXBzN3E1dks2
dU5HOGZRVG4xS2xnbjBjVnl1WW5VZXF4cmpDV0hvJTNEJmFtcDtyZXNlcnZlZD0wCj4gPiArJHNj
aGVtYTogaHR0cHM6Ly9ldXIwMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJs
PWh0dHAlM0ElMkYlMkZkZXZpY2V0cmVlLm9yZyUyRm1ldGEtc2NoZW1hcyUyRmNvcmUueWFtbCUy
MyZhbXA7ZGF0YT0wNCU3QzAxJTdDdmljdG9yLmxpdSU0MG54cC5jb20lN0NhMzdlYzY3YmEzMjc0
YmNlYTVjNDA4ZDhlMDI3ZjY5YiU3QzY4NmVhMWQzYmMyYjRjNmZhOTJjZDk5YzVjMzAxNjM1JTdD
MCU3QzAlN0M2Mzc1MDU4MDk1NDQwMzc1NjIlN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lq
b2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4w
JTNEJTdDMTAwMCZhbXA7c2RhdGE9Y3ZKVkwzRnAxaHdiamoxak8xWUFvektkWkFUdDVESjc4RTd2
R1QlMkYyNU9jJTNEJmFtcDtyZXNlcnZlZD0wCj4gPiArCj4gPiArdGl0bGU6IEZyZWVzY2FsZSBp
Lk1YOHF4cCBQaXhlbCBMaW5rIHRvIERpc3BsYXkgUGl4ZWwgSW50ZXJmYWNlCj4gPiArCj4gPiAr
bWFpbnRhaW5lcnM6Cj4gPiArICAtIExpdSBZaW5nIDx2aWN0b3IubGl1QG54cC5jb20+Cj4gPiAr
Cj4gPiArZGVzY3JpcHRpb246IHwKPiA+ICsgIFRoZSBGcmVlc2NhbGUgaS5NWDhxeHAgUGl4ZWwg
TGluayB0byBEaXNwbGF5IFBpeGVsIEludGVyZmFjZShQWEwyRFBJKQo+ID4gKyAgaW50ZXJmYWNl
cyB0aGUgcGl4ZWwgbGluayAzNi1iaXQgZGF0YSBvdXRwdXQgYW5kIHRoZSBEU0kgY29udHJvbGxl
cuKAmXMKPiA+ICsgIE1JUEktRFBJIDI0LWJpdCBkYXRhIGlucHV0LCBhbmQgaW5wdXRzIG9mIExW
RFMgRGlzcGxheSBCcmlkZ2UoTERCKSBtb2R1bGUKPiA+ICsgIHVzZWQgaW4gTFZEUyBtb2RlLCB0
byByZW1hcCB0aGUgcGl4ZWwgY29sb3IgY29kaW5ncyBiZXR3ZWVuIHRob3NlIG1vZHVsZXMuCj4g
PiArICBUaGlzIG1vZHVsZSBpcyBwdXJlbHkgY29tYmluYXRvcmlhbC4KPiA+ICsKPiA+ICsgIFRo
ZSBpLk1YOHF4cCBQWEwyRFBJIGlzIGNvbnRyb2xsZWQgYnkgQ29udHJvbCBhbmQgU3RhdHVzIFJl
Z2lzdGVycyhDU1IpIG1vZHVsZS4KPiA+ICsgIFRoZSBDU1IgbW9kdWxlLCBhcyBhIHN5c3RlbSBj
b250cm9sbGVyLCBjb250YWlucyB0aGUgUFhMMkRQSSdzIGNvbmZpZ3VyYXRpb24KPiA+ICsgIHJl
Z2lzdGVyLgo+IAo+IFNvIHRoaXMgbm9kZSBzaG91bGQgYmUgYSBjaGlsZCBvZiB0aGUgQ1NSLiBJ
ZGVhbGx5LCB0aGlzIHNjaGVtYSBpcyBhbHNvIAo+IHJlZmVyZW5jZWQgZnJvbSB0aGUgQ1NSJ3Mg
c2NoZW1hIChhbmQgaWYgdGhhdCBkb2Vzbid0IGV4aXN0LCBpdCBzaG91bGQgCj4gYmUgdGhlcmUg
Zmlyc3QpLgoKSSBjYW4gYWRkIGEgcGF0Y2ggdG8gaW50cm9kdWNlIGEgc2NoZW1hIGZvciB0aGUg
Q1NSIGluIHRoaXMgc2VyaWVzLApqdXN0IHByaW9yIHRvIHRoaXMgcGF0Y2guICBEbyB5b3UgdGhp
bmsgaWYgdGhhdCB3aWxsIGJlIGZpbmU/CgpUaGFua3MsCkxpdSBZaW5nCgo+IAo+ID4gKwo+ID4g
K3Byb3BlcnRpZXM6Cj4gPiArICBjb21wYXRpYmxlOgo+ID4gKyAgICBjb25zdDogZnNsLGlteDhx
eHAtcHhsMmRwaQo+ID4gKwo+ID4gKyAgZnNsLHNjLXJlc291cmNlOgo+ID4gKyAgICAkcmVmOiAv
c2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzIKPiA+ICsgICAgZGVzY3JpcHRp
b246IFRoZSBTQ1UgcmVzb3VyY2UgSUQgYXNzb2NpYXRlZCB3aXRoIHRoaXMgUFhMMkRQSSBpbnN0
YW5jZS4KPiA+ICsKPiA+ICsgIHBvd2VyLWRvbWFpbnM6Cj4gPiArICAgIG1heEl0ZW1zOiAxCj4g
PiArCj4gPiArICBmc2wsY29tcGFuaW9uLXB4bDJkcGk6Cj4gPiArICAgICRyZWY6IC9zY2hlbWFz
L3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3BoYW5kbGUKPiA+ICsgICAgZGVzY3JpcHRpb246IHwK
PiA+ICsgICAgICBBIHBoYW5kbGUgd2hpY2ggcG9pbnRzIHRvIGNvbXBhbmlvbiBQWEwyRFBJIHdo
aWNoIGlzIHVzZWQgYnkgZG93bnN0cmVhbQo+ID4gKyAgICAgIExWRFMgRGlzcGxheSBCcmlkZ2Uo
TERCKSBpbiBzcGxpdCBtb2RlLgo+ID4gKwo+ID4gKyAgcG9ydHM6Cj4gPiArICAgICRyZWY6IC9z
Y2hlbWFzL2dyYXBoLnlhbWwjL3Byb3BlcnRpZXMvcG9ydHMKPiA+ICsKPiA+ICsgICAgcHJvcGVy
dGllczoKPiA+ICsgICAgICBwb3J0QDA6Cj4gPiArICAgICAgICAkcmVmOiAvc2NoZW1hcy9ncmFw
aC55YW1sIy9wcm9wZXJ0aWVzL3BvcnQKPiA+ICsgICAgICAgIGRlc2NyaXB0aW9uOiBUaGUgUFhM
MkRQSSBpbnB1dCBwb3J0IG5vZGUgZnJvbSBwaXhlbCBsaW5rLgo+ID4gKwo+ID4gKyAgICAgIHBv
cnRAMToKPiA+ICsgICAgICAgICRyZWY6IC9zY2hlbWFzL2dyYXBoLnlhbWwjL3Byb3BlcnRpZXMv
cG9ydAo+ID4gKyAgICAgICAgZGVzY3JpcHRpb246IFRoZSBQWEwyRFBJIG91dHB1dCBwb3J0IG5v
ZGUgdG8gZG93bnN0cmVhbSBicmlkZ2UuCj4gPiArCj4gPiArICAgIHJlcXVpcmVkOgo+ID4gKyAg
ICAgIC0gcG9ydEAwCj4gPiArICAgICAgLSBwb3J0QDEKPiA+ICsKPiA+ICtyZXF1aXJlZDoKPiA+
ICsgIC0gY29tcGF0aWJsZQo+ID4gKyAgLSBmc2wsc2MtcmVzb3VyY2UKPiA+ICsgIC0gcG93ZXIt
ZG9tYWlucwo+ID4gKyAgLSBwb3J0cwo+ID4gKwo+ID4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBm
YWxzZQo+ID4gKwo+ID4gK2V4YW1wbGVzOgo+ID4gKyAgLSB8Cj4gPiArICAgICNpbmNsdWRlIDxk
dC1iaW5kaW5ncy9maXJtd2FyZS9pbXgvcnNyYy5oPgo+ID4gKyAgICBweGwyZHBpIHsKPiA+ICsg
ICAgICAgIGNvbXBhdGlibGUgPSAiZnNsLGlteDhxeHAtcHhsMmRwaSI7Cj4gPiArICAgICAgICBm
c2wsc2MtcmVzb3VyY2UgPSA8SU1YX1NDX1JfTUlQSV8wPjsKPiA+ICsgICAgICAgIHBvd2VyLWRv
bWFpbnMgPSA8JnBkIElNWF9TQ19SX01JUElfMD47Cj4gPiArCj4gPiArICAgICAgICBwb3J0cyB7
Cj4gPiArICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4gPiArICAgICAgICAgICAg
I3NpemUtY2VsbHMgPSA8MD47Cj4gPiArCj4gPiArICAgICAgICAgICAgcG9ydEAwIHsKPiA+ICsg
ICAgICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4gPiArICAgICAgICAgICAgICAg
ICNzaXplLWNlbGxzID0gPDA+Owo+ID4gKyAgICAgICAgICAgICAgICByZWcgPSA8MD47Cj4gPiAr
Cj4gPiArICAgICAgICAgICAgICAgIG1pcGlfbHZkc18wX3B4bDJkcGlfZGNfcGl4ZWxfbGluazA6
IGVuZHBvaW50QDAgewo+ID4gKyAgICAgICAgICAgICAgICAgICAgcmVnID0gPDA+Owo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZkY19waXhlbF9saW5rMF9taXBp
X2x2ZHNfMF9weGwyZHBpPjsKPiA+ICsgICAgICAgICAgICAgICAgfTsKPiA+ICsKPiA+ICsgICAg
ICAgICAgICAgICAgbWlwaV9sdmRzXzBfcHhsMmRwaV9kY19waXhlbF9saW5rMTogZW5kcG9pbnRA
MSB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDE+Owo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgIHJlbW90ZS1lbmRwb2ludCA9IDwmZGNfcGl4ZWxfbGluazFfbWlwaV9sdmRzXzBf
cHhsMmRwaT47Cj4gPiArICAgICAgICAgICAgICAgIH07Cj4gPiArICAgICAgICAgICAgfTsKPiA+
ICsKPiA+ICsgICAgICAgICAgICBwb3J0QDEgewo+ID4gKyAgICAgICAgICAgICAgICAjYWRkcmVz
cy1jZWxscyA9IDwxPjsKPiA+ICsgICAgICAgICAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47Cj4g
PiArICAgICAgICAgICAgICAgIHJlZyA9IDwxPjsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgICAg
bWlwaV9sdmRzXzBfcHhsMmRwaV9taXBpX2x2ZHNfMF9sZGJfY2gwOiBlbmRwb2ludEAwIHsKPiA+
ICsgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwwPjsKPiA+ICsgICAgICAgICAgICAgICAgICAg
IHJlbW90ZS1lbmRwb2ludCA9IDwmbWlwaV9sdmRzXzBfbGRiX2NoMF9taXBpX2x2ZHNfMF9weGwy
ZHBpPjsKPiA+ICsgICAgICAgICAgICAgICAgfTsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgICAg
bWlwaV9sdmRzXzBfcHhsMmRwaV9taXBpX2x2ZHNfMF9sZGJfY2gxOiBlbmRwb2ludEAxIHsKPiA+
ICsgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwxPjsKPiA+ICsgICAgICAgICAgICAgICAgICAg
IHJlbW90ZS1lbmRwb2ludCA9IDwmbWlwaV9sdmRzXzBfbGRiX2NoMV9taXBpX2x2ZHNfMF9weGwy
ZHBpPjsKPiA+ICsgICAgICAgICAgICAgICAgfTsKPiA+ICsgICAgICAgICAgICB9Owo+ID4gKyAg
ICAgICAgfTsKPiA+ICsgICAgfTsKPiA+IC0tIAo+ID4gMi43LjQKPiA+IAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
