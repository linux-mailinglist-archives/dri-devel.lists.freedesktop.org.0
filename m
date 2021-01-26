Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1153055C7
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 09:30:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9E196E7D9;
	Wed, 27 Jan 2021 08:29:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60054.outbound.protection.outlook.com [40.107.6.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8B1C6E055
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 09:02:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SFLei8tlOfrK+66frFEdfGm25fVz8cyOYrvcYzUujBluBtor91qYDgRkYoL1vfNpJO6qlHUIJ7KChcEaPbCgwtOoYcJ6/aGj+ZWnLpNGTi1TnYDdYrhUW/N5BEMtTb0RnoqX5t9F963KqX3mlrNiKLC2KRzyFNJWTvXXWJCgfEc1eL1BP4nxTYIYDYrhIhEVW0DcIR6To9gdFuSrrugnloDgiZFuVEUo9qYplzPg4e0jD9p2ibmFNumxLoTn9xL9yB9nFZH8gSjS+SJ6dC8fGxCCssZPxRBOFUS57TlRyN8qz0An082LHMAqA74N1x59vHTh0/12lH2FALG/1WvfwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WS4FUi4lJy8sy5/foKPh2GA49woYwc7TxSiv6kty9bE=;
 b=AOjqU7h+pU3aU5D2e/Kv8l3IEN+GUZhhcRNeFxzZG4Q8vrT3aVOMjcFKZc4rxCl9CKOxjq01s7Nhhmpvu4WdNpvec/FpKZaBrFPU15sX89BzFnyM3hJ4X7pBK7+8mxeL5UO7WOLJfSoP+ZD6ZzRcvz2Jryt7G2cZAQk06Mkisph6DjFcwY00z+mt6FTTGr+wib26GBqJu3mLaA1i+yEdNkzlOmpvhf25WbfTBZj7mrBYNksj3jPel/JlfEohFkergXLRqNHzEUq0jk7sSpTKMuowceBbRsjlDAWbMpYI3zGRLdcV8b4WJVy4ZRGgUD159O+6L4apWJYYAqGxTseUYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WS4FUi4lJy8sy5/foKPh2GA49woYwc7TxSiv6kty9bE=;
 b=f6FiVqRwTJ/pz1SpKrKl7Rd6kv11cLKFuz9j5JtJBl1K3tShVoZiyh305JPbI0i/8syzQ5widpL1qS9okE+BruciTP58P7g/3mZkTNdOFws8Jxz/D+xFSiXWlvtaT9MDgI2+JS6ke89J0BZyaz3pa/d2JOPKXWA57g+tRILf/f8=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB3974.eurprd04.prod.outlook.com (2603:10a6:209:50::12)
 by AS8PR04MB7878.eurprd04.prod.outlook.com (2603:10a6:20b:2af::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Tue, 26 Jan
 2021 09:02:21 +0000
Received: from AM6PR04MB3974.eurprd04.prod.outlook.com
 ([fe80::64a8:cb73:cfb:1674]) by AM6PR04MB3974.eurprd04.prod.outlook.com
 ([fe80::64a8:cb73:cfb:1674%5]) with mapi id 15.20.3784.012; Tue, 26 Jan 2021
 09:02:21 +0000
Message-ID: <5c30dd91498ccac3207a9577f170c8a4b37c17e3.camel@nxp.com>
Subject: Re: [PATCH v2 08/14] dt-bindings: display: bridge: Add i.MX8qxp
 pixel link to DPI binding
From: Liu Ying <victor.liu@nxp.com>
To: Rob Herring <robh@kernel.org>
Date: Tue, 26 Jan 2021 17:00:41 +0800
In-Reply-To: <20210125211316.GA1000096@robh.at.kernel.org>
References: <1610616132-8220-1-git-send-email-victor.liu@nxp.com>
 <1610616132-8220-9-git-send-email-victor.liu@nxp.com>
 <20210125211316.GA1000096@robh.at.kernel.org>
User-Agent: Evolution 3.36.4-0ubuntu1 
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR06CA0181.apcprd06.prod.outlook.com (2603:1096:4:1::13)
 To AM6PR04MB3974.eurprd04.prod.outlook.com
 (2603:10a6:209:50::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from blueberry.ap.freescale.net (119.31.174.66) by
 SG2PR06CA0181.apcprd06.prod.outlook.com (2603:1096:4:1::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Tue, 26 Jan 2021 09:02:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3c0e33df-dd2d-49a4-6637-08d8c1d916d2
X-MS-TrafficTypeDiagnostic: AS8PR04MB7878:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR04MB787850008E997BA8FA3BB19398BC0@AS8PR04MB7878.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aTxTelFGONp1UrkhwvXzHgGq1PN52QMN0Sp8mRYZcso8qzuSadLZT9bNJvZQs8+NewGX1zsc8VsyV5yiE7BIJNFxUusXKwQ0uukwDR1ZNsSpsKN1LIIhTsH6muUt8QugN3pYXEWA75VjTSlzqvED+wyd6agqBSrL1CzsW/Zs+sCBazwwVWGEoZDdYUyn77UEsqtdxjhUbNoPSXLMH6Q8l90Rl6oT0loLc01IINLymU0zHxwIbdGOpAGeQadLHjn8XGA60e6Uw6K+CL/TSdPfJTXgvLtzPBiC23K4kNcjjsqSYi/pdOlR8e6j++bZ4+/lRqW99lhGi4lv0sbXMmilBI/2eBG8I+gg3swj5+ffpDCkDOMmQVZD0N11NIGJSTiLA8Y3d2pQ5H7QhM9vGGPK0zZ4jZE6rni7+H4yZ3mcG8RejBUJjn3OzKI74tjYtMtwSY3RpBKcYS5CoBJJZ7/k/D1vxCuFIYlGs2w+oVqP9yIK9Fu6rIPmYTavMmwhKyjZrtu3S53+IoiNchgknD7h2GvKKdTZPlwshMGQDdOKPb9WmuayJgk10zaOIB6ZEgRtsMBAyQF+Nbrgsd2TzBtdHQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB3974.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(376002)(136003)(396003)(346002)(4326008)(26005)(6512007)(86362001)(52116002)(8936002)(7416002)(66556008)(66946007)(36756003)(316002)(2906002)(478600001)(966005)(6916009)(6506007)(8676002)(66476007)(186003)(2616005)(956004)(6486002)(6666004)(45080400002)(5660300002)(16526019);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dUlxNW4zdnhYRzJwUWxabjRXQ3dYaUhIbzdqL0JRQ3ZhNytTc3Y1SkVCY1pW?=
 =?utf-8?B?TUNWQXB0R1ZORTVrcGVWMFVvTzVxZlVIMnhaZDJmV2xBRjArU0hmeExCbmp3?=
 =?utf-8?B?aEYxaTNIaWlTOWN5V0pFRGlkeitqNTJKdktZa1M1UjNqVStPbHZ4RnptOW80?=
 =?utf-8?B?VGlZdjZFejNDOHhMRGg3QXAvMWt5OGpkRG1JYm1kNzIrR1VwUm9DcngyZGd4?=
 =?utf-8?B?RjZhQUZ1akZ1eExybWNzN251b1E0QVZsc0tnczcyV2ZlT2xqbFhoYzNFcngv?=
 =?utf-8?B?OWFVTk5yTnhLZlpEMXNzZlJCcG05cHhPYk5vU2RkcTljSjgvRjFOdDNGd0NM?=
 =?utf-8?B?NjVKVEVPVWMwLzZUSG9PTTV4Mnc4VGN4Ymh2bndlOS9oUXVSVTRlVzZocUFl?=
 =?utf-8?B?NDc3VWFDczVjbjZaSjBJc0hkVnVzZURCZWRYdVhTMHRaNGhRNlA2V1BkTTRa?=
 =?utf-8?B?WXRIU0gxMEppSmlVSmFmYzRhRkd5cjdtaXdDOWtrWUNKN21WTGRKN3phc0xh?=
 =?utf-8?B?RHo2eGE1SlRyRUFLZThrWldQOEdyRGkweXpBb0o1RitSUjZiRlJnZTRhTGRl?=
 =?utf-8?B?UGFibkhialpxelo3QVdsTDFwVzhqYUFqYUlYejhaaUtTamlTUGFRSTJ1NWN5?=
 =?utf-8?B?aDVuY1o3U1Fjd0t6WjdHM3VlbTAweThZWTNZT2pJVU5uai9YTFRRY1ZnVkVt?=
 =?utf-8?B?eXRpeXJ4aEdsc3JCcFNTcFNJL0RyTExEQlIrdVl6T3ExN0FWbUJield0Mnpm?=
 =?utf-8?B?MGhoYUdNN0hGbTFPSHkyclltdERJRVhBUHZuQ3RvVlgzTEhLOFNNeS9Sbnh4?=
 =?utf-8?B?Rnh3ZjJtV0lpdEYzS1ZHNFV5NGp5eHp3R2dGN0lUS1NQdG9zanBFZ1J2cWJp?=
 =?utf-8?B?WXFmWE9OMzdDamNFczd0Y0ZTK1NoYXkvblhpbWdLaEVNUS9pS1d6U3YzSHdx?=
 =?utf-8?B?WFAvV0czSnphb041eGF2QTFrdjF5dUNlUHZNcVRKc09vWGE1dTliYVJPZTZG?=
 =?utf-8?B?enpDeUp0ZnpKTFA2NFVRZjNyTkc0Yit5RXlvb1VYeWQ4U1ZuQnZYTG1Cd2pp?=
 =?utf-8?B?cVl4c2x6SUprMVB1NFVHUWVmK0c2bnVoMFV5Sk8xZWJOcFV4ODZoVjVnQk84?=
 =?utf-8?B?Rm45YVJ2bUgxejgveVJvVDNjZ09UTWcybG5tK1pFVithemp1Ui96OVZwK3VY?=
 =?utf-8?B?NkpCMFEwOGpsMkszZDhlQkFCZy9wSUo1SnUxOVM2U1o1RWF0dmpHSGJrR1Vr?=
 =?utf-8?B?NHlkVitIbEpTbm9WQTJBb1hnVWRFbkRiSVNnKzAzN2V1a1dnRStHd0cwOHFI?=
 =?utf-8?B?MThrNGdDa0dpT0xrZ0JzcVd3MjgxbWJrMmRoTENKendaNEh1U2xkRURUUjMv?=
 =?utf-8?B?cEhodmd1aFE5V3FxeVpkaVJVbVBFTExTYkJBdFNsalJPY0ZDSXdRN1h4SWxn?=
 =?utf-8?Q?jrIauveM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c0e33df-dd2d-49a4-6637-08d8c1d916d2
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB3974.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 09:02:21.6781 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vy14bFNiMlWGnK1xBqmpPCDBSSDlRCLV9iM8ElShMTW+htutLDh6IBRgvTey3ydAGt3z8H/KA974OTWNnQRXPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7878
X-Mailman-Approved-At: Wed, 27 Jan 2021 08:29:46 +0000
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

T24gTW9uLCAyMDIxLTAxLTI1IGF0IDE1OjEzIC0wNjAwLCBSb2IgSGVycmluZyB3cm90ZToKPiBP
biBUaHUsIEphbiAxNCwgMjAyMSBhdCAwNToyMjowNlBNICswODAwLCBMaXUgWWluZyB3cm90ZToK
PiA+IFRoaXMgcGF0Y2ggYWRkcyBiaW5kaW5ncyBmb3IgaS5NWDhxeHAgcGl4ZWwgbGluayB0byBE
UEkoUFhMMkRQSSkuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IExpdSBZaW5nIDx2aWN0b3IubGl1
QG54cC5jb20+Cj4gPiAtLS0KPiA+IHYxLT52MjoKPiA+ICogVXNlIGdyYXBoIHNjaGVtYS4gKExh
dXJlbnQpCj4gPiAKPiA+ICAuLi4vZGlzcGxheS9icmlkZ2UvZnNsLGlteDhxeHAtcHhsMmRwaS55
YW1sICAgICAgICB8IDEwNSArKysrKysrKysrKysrKysrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgMTA1IGluc2VydGlvbnMoKykKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2ZzbCxpbXg4cXhwLXB4bDJkcGku
eWFtbAo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvYnJpZGdlL2ZzbCxpbXg4cXhwLXB4bDJkcGkueWFtbCBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9mc2wsaW14OHF4cC1weGwyZHBp
LnlhbWwKPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMC4uMTg3ODI0
ZQo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2ZzbCxpbXg4cXhwLXB4bDJkcGkueWFtbAo+ID4gQEAgLTAs
MCArMSwxMDUgQEAKPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5
IE9SIEJTRC0yLUNsYXVzZSkKPiA+ICslWUFNTCAxLjIKPiA+ICstLS0KPiA+ICskaWQ6IGh0dHBz
Oi8vZXVyMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwJTNBJTJG
JTJGZGV2aWNldHJlZS5vcmclMkZzY2hlbWFzJTJGZGlzcGxheSUyRmJyaWRnZSUyRmZzbCUyQ2lt
eDhxeHAtcHhsMmRwaS55YW1sJTIzJmFtcDtkYXRhPTA0JTdDMDElN0N2aWN0b3IubGl1JTQwbnhw
LmNvbSU3QzM5YjA2N2M4MDA1ZTQwMTlhZTZmMDhkOGMxNzYwYzMxJTdDNjg2ZWExZDNiYzJiNGM2
ZmE5MmNkOTljNWMzMDE2MzUlN0MwJTdDMCU3QzYzNzQ3MjA2MDA0NzIwMDcwOSU3Q1Vua25vd24l
N0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJ
NklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0MxMDAwJmFtcDtzZGF0YT11N0h2M2w1aCUyRndBZmwz
MUdjZkJudGR4RFhyQUFNN1hCeEV3aXRUSG8yU2MlM0QmYW1wO3Jlc2VydmVkPTAKPiA+ICskc2No
ZW1hOiBodHRwczovL2V1cjAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9
aHR0cCUzQSUyRiUyRmRldmljZXRyZWUub3JnJTJGbWV0YS1zY2hlbWFzJTJGY29yZS55YW1sJTIz
JmFtcDtkYXRhPTA0JTdDMDElN0N2aWN0b3IubGl1JTQwbnhwLmNvbSU3QzM5YjA2N2M4MDA1ZTQw
MTlhZTZmMDhkOGMxNzYwYzMxJTdDNjg2ZWExZDNiYzJiNGM2ZmE5MmNkOTljNWMzMDE2MzUlN0Mw
JTdDMCU3QzYzNzQ3MjA2MDA0NzIwMDcwOSU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpXSWpv
aU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZDSTZNbjAl
M0QlN0MxMDAwJmFtcDtzZGF0YT1zTSUyRjloNkdMd2hpbTdMaWRzSTZ1cFF6bHk3Tm5ab1RiYWwy
WUJHeWduRUUlM0QmYW1wO3Jlc2VydmVkPTAKPiA+ICsKPiA+ICt0aXRsZTogRnJlZXNjYWxlIGku
TVg4cXhwIFBpeGVsIExpbmsgdG8gRGlzcGxheSBQaXhlbCBJbnRlcmZhY2UKPiA+ICsKPiA+ICtt
YWludGFpbmVyczoKPiA+ICsgIC0gTGl1IFlpbmcgPHZpY3Rvci5saXVAbnhwLmNvbT4KPiA+ICsK
PiA+ICtkZXNjcmlwdGlvbjogfAo+ID4gKyAgVGhlIEZyZWVzY2FsZSBpLk1YOHF4cCBQaXhlbCBM
aW5rIHRvIERpc3BsYXkgUGl4ZWwgSW50ZXJmYWNlKFBYTDJEUEkpCj4gPiArICBpbnRlcmZhY2Vz
IHRoZSBwaXhlbCBsaW5rIDM2LWJpdCBkYXRhIG91dHB1dCBhbmQgdGhlIERTSSBjb250cm9sbGVy
4oCZcwo+ID4gKyAgTUlQSS1EUEkgMjQtYml0IGRhdGEgaW5wdXQsIGFuZCBpbnB1dHMgb2YgTFZE
UyBEaXNwbGF5IEJyaWRnZShMREIpIG1vZHVsZQo+ID4gKyAgdXNlZCBpbiBMVkRTIG1vZGUsIHRv
IHJlbWFwIHRoZSBwaXhlbCBjb2xvciBjb2RpbmdzIGJldHdlZW4gdGhvc2UgbW9kdWxlcy4KPiA+
ICsgIFRoaXMgbW9kdWxlIGlzIHB1cmVseSBjb21iaW5hdG9yaWFsLgo+ID4gKwo+ID4gK3Byb3Bl
cnRpZXM6Cj4gPiArICBjb21wYXRpYmxlOgo+ID4gKyAgICBjb25zdDogZnNsLGlteDhxeHAtcHhs
MmRwaQo+ID4gKwo+ID4gKyAgcG93ZXItZG9tYWluczoKPiA+ICsgICAgbWF4SXRlbXM6IDEKPiA+
ICsKPiA+ICsgIGZzbCxzeXNjb246Cj4gPiArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwj
L2RlZmluaXRpb25zL3BoYW5kbGUKPiA+ICsgICAgZGVzY3JpcHRpb246IHwKPiA+ICsgICAgICBB
IHBoYW5kbGUgd2hpY2ggcG9pbnRzIHRvIENvbnRyb2wgYW5kIFN0YXR1cyBSZWdpc3RlcnMoQ1NS
KSBtb2R1bGUuCj4gCj4gSWYgdGhpcyBpcyB0aGUgb25seSBjb250cm9sIGludGVyZmFjZSwgdGhl
biBtYWtlIGl0IGEgY2hpbGQgbm9kZSBvZiB0aGUgCj4gcGhhbmRsZS4KCldpbGwgZG8uCgpUaGFu
a3MsCkxpdSBZaW5nCgo+IAo+ID4gKwo+ID4gKyAgZnNsLGNvbXBhbmlvbi1weGwyZHBpOgo+ID4g
KyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9waGFuZGxlCj4gPiAr
ICAgIGRlc2NyaXB0aW9uOiB8Cj4gPiArICAgICAgQSBwaGFuZGxlIHdoaWNoIHBvaW50cyB0byBj
b21wYW5pb24gUFhMMkRQSSB3aGljaCBpcyB1c2VkIGJ5IGRvd25zdHJlYW0KPiA+ICsgICAgICBM
VkRTIERpc3BsYXkgQnJpZGdlKExEQikgaW4gc3BsaXQgbW9kZS4KPiA+ICsKPiA+ICsgIHBvcnRz
Ogo+ID4gKyAgICAkcmVmOiAvc2NoZW1hcy9ncmFwaC55YW1sIy9wcm9wZXJ0aWVzL3BvcnRzCj4g
PiArCj4gPiArICAgIHByb3BlcnRpZXM6Cj4gPiArICAgICAgcG9ydEAwOgo+ID4gKyAgICAgICAg
JHJlZjogL3NjaGVtYXMvZ3JhcGgueWFtbCMvcHJvcGVydGllcy9wb3J0Cj4gPiArICAgICAgICBk
ZXNjcmlwdGlvbjogVGhlIFBYTDJEUEkgaW5wdXQgcG9ydCBub2RlIGZyb20gcGl4ZWwgbGluay4K
PiA+ICsKPiA+ICsgICAgICBwb3J0QDE6Cj4gPiArICAgICAgICAkcmVmOiAvc2NoZW1hcy9ncmFw
aC55YW1sIy9wcm9wZXJ0aWVzL3BvcnQKPiA+ICsgICAgICAgIGRlc2NyaXB0aW9uOiBUaGUgUFhM
MkRQSSBvdXRwdXQgcG9ydCBub2RlIHRvIGRvd25zdHJlYW0gYnJpZGdlLgo+ID4gKwo+ID4gKyAg
ICByZXF1aXJlZDoKPiA+ICsgICAgICAtIHBvcnRAMAo+ID4gKyAgICAgIC0gcG9ydEAxCj4gPiAr
Cj4gPiArcmVxdWlyZWQ6Cj4gPiArICAtIGNvbXBhdGlibGUKPiA+ICsgIC0gcG93ZXItZG9tYWlu
cwo+ID4gKyAgLSBmc2wsc3lzY29uCj4gPiArICAtIHBvcnRzCj4gPiArCj4gPiArYWRkaXRpb25h
bFByb3BlcnRpZXM6IGZhbHNlCj4gPiArCj4gPiArZXhhbXBsZXM6Cj4gPiArICAtIHwKPiA+ICsg
ICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Zpcm13YXJlL2lteC9yc3JjLmg+Cj4gPiArICAgIHB4
bDJkcGkgewo+ID4gKyAgICAgICAgY29tcGF0aWJsZSA9ICJmc2wsaW14OHF4cC1weGwyZHBpIjsK
PiA+ICsgICAgICAgIHBvd2VyLWRvbWFpbnMgPSA8JnBkIElNWF9TQ19SX01JUElfMD47Cj4gPiAr
ICAgICAgICBmc2wsc3lzY29uID0gPCZtaXBpX2x2ZHNfMF9jc3I+Owo+ID4gKwo+ID4gKyAgICAg
ICAgcG9ydHMgewo+ID4gKyAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Owo+ID4gKyAg
ICAgICAgICAgICNzaXplLWNlbGxzID0gPDA+Owo+ID4gKwo+ID4gKyAgICAgICAgICAgIHBvcnRA
MCB7Cj4gPiArICAgICAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Owo+ID4gKyAgICAg
ICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsKPiA+ICsgICAgICAgICAgICAgICAgcmVnID0g
PDA+Owo+ID4gKwo+ID4gKyAgICAgICAgICAgICAgICBtaXBpX2x2ZHNfMF9weGwyZHBpX2RjX3Bp
eGVsX2xpbmswOiBlbmRwb2ludEAwIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgIHJlZyA9IDww
PjsKPiA+ICsgICAgICAgICAgICAgICAgICAgIHJlbW90ZS1lbmRwb2ludCA9IDwmZGNfcGl4ZWxf
bGluazBfbWlwaV9sdmRzXzBfcHhsMmRwaT47Cj4gPiArICAgICAgICAgICAgICAgIH07Cj4gPiAr
Cj4gPiArICAgICAgICAgICAgICAgIG1pcGlfbHZkc18wX3B4bDJkcGlfZGNfcGl4ZWxfbGluazE6
IGVuZHBvaW50QDEgewo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwxPjsKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICByZW1vdGUtZW5kcG9pbnQgPSA8JmRjX3BpeGVsX2xpbmsxX21p
cGlfbHZkc18wX3B4bDJkcGk+Owo+ID4gKyAgICAgICAgICAgICAgICB9Owo+ID4gKyAgICAgICAg
ICAgIH07Cj4gPiArCj4gPiArICAgICAgICAgICAgcG9ydEAxIHsKPiA+ICsgICAgICAgICAgICAg
ICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4gPiArICAgICAgICAgICAgICAgICNzaXplLWNlbGxz
ID0gPDA+Owo+ID4gKyAgICAgICAgICAgICAgICByZWcgPSA8MT47Cj4gPiArCj4gPiArICAgICAg
ICAgICAgICAgIG1pcGlfbHZkc18wX3B4bDJkcGlfbWlwaV9sdmRzXzBfbGRiX2NoMDogZW5kcG9p
bnRAMCB7Cj4gPiArICAgICAgICAgICAgICAgICAgICByZWcgPSA8MD47Cj4gPiArICAgICAgICAg
ICAgICAgICAgICByZW1vdGUtZW5kcG9pbnQgPSA8Jm1pcGlfbHZkc18wX2xkYl9jaDBfbWlwaV9s
dmRzXzBfcHhsMmRwaT47Cj4gPiArICAgICAgICAgICAgICAgIH07Cj4gPiArCj4gPiArICAgICAg
ICAgICAgICAgIG1pcGlfbHZkc18wX3B4bDJkcGlfbWlwaV9sdmRzXzBfbGRiX2NoMTogZW5kcG9p
bnRAMSB7Cj4gPiArICAgICAgICAgICAgICAgICAgICByZWcgPSA8MT47Cj4gPiArICAgICAgICAg
ICAgICAgICAgICByZW1vdGUtZW5kcG9pbnQgPSA8Jm1pcGlfbHZkc18wX2xkYl9jaDFfbWlwaV9s
dmRzXzBfcHhsMmRwaT47Cj4gPiArICAgICAgICAgICAgICAgIH07Cj4gPiArICAgICAgICAgICAg
fTsKPiA+ICsgICAgICAgIH07Cj4gPiArICAgIH07Cj4gPiAtLSAKPiA+IDIuNy40Cj4gPiAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
