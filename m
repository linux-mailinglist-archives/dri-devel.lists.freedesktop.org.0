Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4071531E465
	for <lists+dri-devel@lfdr.de>; Thu, 18 Feb 2021 03:57:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0585B89D44;
	Thu, 18 Feb 2021 02:57:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2044.outbound.protection.outlook.com [40.107.20.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A86F189D44
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Feb 2021 02:57:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eJmw0ntmXorVUIq2EVuznHVuNeIo3I4FVAt3Gz+LiBW2HNEI4yrUnrNi1mItfjsN04DB9Kwcu0fH6FuhzCTgVHywUoW4IiexlhQMj3+EzOkLKZsPtl2oTfM+i3CVqVcBc4wwxV+4GnkGt1aIwJYfAzj1yd7gIURHKK+5EUUA/LS6prJLJCBVx8y685X8U2WfKsgAZ3gmrxwPro6vXkkAOByVOotIuGESIeFpPEFkcjSiZzkY217XyqBQugsjIeFt+764Aj+3YiJkw1SqIl6dQduviruraNxV5XOG6pwFwBJibsSoMZN7Bie5xVwD8eOEifZe12ChNLLeXDYUHT8QgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wjOfEK1LdgVhSnQhlgaQOVKJp3zxp0lraEx6cUjL6Ko=;
 b=BoC4VXYECWcDQ+ThUHOSgo1CgyLdMVlaGntBO0Dptg71YD2+2kgZz4r5zhOdyhmk8gcnvuhUSQzBQQh92/TzZqBXuX+sMNlDSOeUzvlnn6lam1raKK1CjDe9er/tiK9CV+e17FOr0pq/mcOZqq0SFlO7pQHE9gr52k186FtFxI+apMzfkOCOVazJqtO3dhfMLiHVyHS9JCOobWEDD4rQxhS3knpulXR/FND/UDAJ/9OE8PQkmxxw15tsTQDOzYNyMhwodKbZrGkFHNGcUiuDu2Zbwxh+gelJNX/MQ2CJ/YzjM5bUyvid2iHmNuvuspyIpOv7KNHb7xgX5mb7hel/8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wjOfEK1LdgVhSnQhlgaQOVKJp3zxp0lraEx6cUjL6Ko=;
 b=ZN8qkLJwl2g+rBcdck0C4qOHhktQfKvfeinmdnClR6Xw+/oeKtMJCtIzvKHv5ZZxmpCE0sYVeKmfYjJvQxNDSG2MtKfVjMoGIGyNuJIFXMFgRNfRyIw69eKBNarvMrJ/j9+BRRw3x/SXgByxht/uXQ+aHvfh3qUcEJ10XqJFgc4=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0402MB3405.eurprd04.prod.outlook.com (2603:10a6:803:3::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.29; Thu, 18 Feb
 2021 02:57:43 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3868.027; Thu, 18 Feb 2021
 02:57:43 +0000
Message-ID: <28cb279081ef09216de91bddaafe5be339a9601e.camel@nxp.com>
Subject: Re: [PATCH v3 09/14] drm/bridge: imx: Add i.MX8qxp pixel link to
 DPI support
From: Liu Ying <victor.liu@nxp.com>
To: Rob Herring <robh@kernel.org>
Date: Thu, 18 Feb 2021 10:56:08 +0800
In-Reply-To: <20210209181510.GA4045547@robh.at.kernel.org>
References: <1611737488-2791-1-git-send-email-victor.liu@nxp.com>
 <1611737488-2791-10-git-send-email-victor.liu@nxp.com>
 <20210209181510.GA4045547@robh.at.kernel.org>
User-Agent: Evolution 3.36.4-0ubuntu1 
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR0601CA0018.apcprd06.prod.outlook.com (2603:1096:3::28)
 To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from blueberry.ap.freescale.net (119.31.174.66) by
 SG2PR0601CA0018.apcprd06.prod.outlook.com (2603:1096:3::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.27 via Frontend Transport; Thu, 18 Feb 2021 02:57:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3a7eeb18-a887-427d-eb98-08d8d3b8f5b2
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3405:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB340540895F8514E36C1FC78498859@VI1PR0402MB3405.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f8ahYERRcq/ubdRf3CFXmVLVG1vsvhLD3wg8z8hnQ5QbVnP0g2xRVwNuzm5muDEydMtpxGeNU+FMNsRf/Bmc2vyA/vue5zO0696qOlIjOBTXsJx4e3V/HktcUo7xLzARDsPaJscAqU/aAjVbSJA99yUR2B8Jh4Mb9isUlXn2xtcqv9ubLvb22NdsVM+89UQEYY6bBq4dQ6QosCfq+3ezI0kCEDLS9R0AgyMO9eB4l/KVQd37+CoGDZVKGpIIFQBYLJrH6xzmtZG+DGFj36fmzjQ6a2odxx3JCYGPalsSOmSbk9fc+DKTZ9HMjptndBEQuuJfj/FY2S1W8uhjUCrkKPw9MC0kZ6gHFCpanw3IIuKezrXYaCFSRZZeNN/FlWtLuqMaGE6tyIHJnb00CHUMxGOgLMAgL6N2mKknleqqboVEOEcwhwdqmkndL6QE0DjB6wyOtu+2/qrgHp5fcd3XG2PiMu16458I8wIb+I4csoJtJUGeF4EKXYJDygbUMbzsTAqKAdna4ctumtfwvbqMcw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(376002)(136003)(346002)(396003)(366004)(16526019)(52116002)(6486002)(26005)(186003)(4326008)(8936002)(2616005)(956004)(6916009)(66946007)(7416002)(8676002)(36756003)(2906002)(86362001)(66476007)(66556008)(316002)(6512007)(478600001)(5660300002)(6506007)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bEFscHdwaHVucmxmMVBhZDJSNkxqQ0NjMTFTeXZ6R1RnUG9KVEpHZFJ5QTR3?=
 =?utf-8?B?S3d1UWJxQndkTXVwSGRBbXB2UDlabVhWTUI4dVNZTHJaSVVGZ0RXQzNTM0kw?=
 =?utf-8?B?RHVuWjIzYk0rTmx2K3QvTkkxME56RHovcDZVVEFWNk9TeW53YURvLzRQTVh1?=
 =?utf-8?B?d280SndsekY5STNYdHlmWXZmZStxTGU5WjdvRUVTY1hkc1NhaGZyTFRQbnVO?=
 =?utf-8?B?Tm0rTWMvbDRDU2VxZUJXdER2OU1zV3lNNXk0SUFZQWdYcjJpVVlSRzJianhO?=
 =?utf-8?B?elNFWGF5cWFvOXAwRUdac3dYUXFNcjBYaWNiOFhrdEZWZmdXRC9tODJKYUV5?=
 =?utf-8?B?NlMvVFd2Um1udFdISHA2dHNxbHNtVm5vdUR4K280NDBKMXpQbG55VXkybmtm?=
 =?utf-8?B?amJnSGRCbXRwSHNrZXZrU3hnZmRWQ3k2c3Eyak0xdEkrUVB2eUE5enh4bXBY?=
 =?utf-8?B?RVVoeDRnSjlpY0RIZVBDWjhSL2IwbnNOKyswNzhseERndTJrcVJWcU5abDVL?=
 =?utf-8?B?YkFXNnZ6MnIwY1BXNW5CTnpRZUpGcG0zUXRQY1dHamZxM0pxQTNVamIzRkl1?=
 =?utf-8?B?L05hdGVSWU9NNmk2V2pzVXBTZDNCcWFBb3dzWEkxeDJFZG5RSFI2VTJ5OHVm?=
 =?utf-8?B?bFZkYlcxL1BsK1p2bTZ1N3J0bnJYSWsvZ2lzMlhWcWZtSUdJQkd6dFUyL1VX?=
 =?utf-8?B?SDlxam4wM0gwaGFOZ3pORlJPb1RqcFg1M2VPVG5Qdkd4NXg1YlpWc3RFTTVq?=
 =?utf-8?B?dTJ5WmdyRjRDMjdwckREKytzWnM0Z0IzZENjbS82emdhL005M1FkNHhXdHo0?=
 =?utf-8?B?M3VVeHFFN3BlT1g2TCtlWVJuTHl3YVhEdmhFWk4yb0l1dHFsbkd1UjdrNG5k?=
 =?utf-8?B?L2ozTkJ5Qm4xN015MWFDMllCODQwdE9vM2tTRUZGRzVobXRsZ3RZUTRUdWxV?=
 =?utf-8?B?aldpVFkveEhDaVBJN0txQmc0NHZCdy9yRk0ycVlWczJGWklHK1RRT25xMDI0?=
 =?utf-8?B?N0JUa042V1BlRlhCQ05iV0JnSDZmR3JFR1FGbHpHSW9iVEZwN2p1cDRjbno3?=
 =?utf-8?B?dGY0czZTOWRvY1h2eE4rMmlDWGc1R0dnNWFObXBKVFZpV0tVS1VvYW02UURv?=
 =?utf-8?B?eXpSN1R0MGxQVlJjdHQva2JRcGlLK3dOQ0tEaldXSWFSRmw3Q3pwRDNKVklM?=
 =?utf-8?B?K0k4aExMckxDdHIvQnUrQXRqTlN5dHJxL2hzcVBqTnBkSEE1UGRPNm1od2l0?=
 =?utf-8?B?WjV6aU1WbUFjWVBBeDRuYmRIVmVJU3k3VURyNk1xallUQUZXT2xxV1A3MytD?=
 =?utf-8?B?b3Y5VEtoOTFaaEZPZFNIczJCRUdRbDhPUGxRRlVWK0ZWRm9kbHNwZmRFN1o3?=
 =?utf-8?B?SktpL3FpR3M3RFUzb3JxdU5MaUNkVit3NU04WDJhb2pyTW52cWh3K2cvR212?=
 =?utf-8?B?OWZLb1c5QlFPd3EzSzQzRjY4eDA2ZVlCd00yekRWUzFUQnZnWllxeE9ScVVN?=
 =?utf-8?B?eGQxaGU2c2RlcmNiWVk3QmlJcFMzV25vNFBPYjdRTmZhT1NCNjNRcU9IdS96?=
 =?utf-8?B?cVlCSDFlNlM5eWpjYmNFK3FIYTF1dTkyNEF5M0EwZTlSTXpyVm1GZ2FiT1Vw?=
 =?utf-8?B?UFczeUdHd3ROaDl5eUhUak1ZZXl3aWNOQU1LMjBQQ1RqdHpNeDNaMmwyY1dt?=
 =?utf-8?B?L21Ba1NPZytMWGhXeTBFNSsyRkVpVDBSUDI5cFdTQUozM0xVODUycngxU09w?=
 =?utf-8?Q?Aw98JPEoEvx8n9tr3T0RkAlAO5wZ94QXPvmxMPn?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a7eeb18-a887-427d-eb98-08d8d3b8f5b2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 02:57:43.0477 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iQ76ftJWXK+a4//nYh6CKhOdGgblP4D57peu1bsZ4lQCh7aIpMS8mLIC8IXS5mgLVPhR+FgxwmJUPebyn/8jmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3405
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

T24gVHVlLCAyMDIxLTAyLTA5IGF0IDEyOjE1IC0wNjAwLCBSb2IgSGVycmluZyB3cm90ZToKPiBP
biBXZWQsIEphbiAyNywgMjAyMSBhdCAwNDo1MToyM1BNICswODAwLCBMaXUgWWluZyB3cm90ZToK
PiA+IFRoaXMgcGF0Y2ggYWRkcyBhIGRybSBicmlkZ2UgZHJpdmVyIGZvciBpLk1YOHF4cCBwaXhl
bCBsaW5rIHRvIGRpc3BsYXkKPiA+IHBpeGVsIGludGVyZmFjZShQWEwyRFBJKS4gIFRoZSBQWEwy
RFBJIGludGVyZmFjZXMgdGhlIHBpeGVsIGxpbmsgMzYtYml0Cj4gPiBkYXRhIG91dHB1dCBhbmQg
dGhlIERTSSBjb250cm9sbGVy4oCZcyBNSVBJLURQSSAyNC1iaXQgZGF0YSBpbnB1dCwgYW5kCj4g
PiBpbnB1dHMgb2YgTFZEUyBEaXNwbGF5IEJyaWRnZShMREIpIG1vZHVsZSB1c2VkIGluIExWRFMg
bW9kZSwgdG8gcmVtYXAKPiA+IHRoZSBwaXhlbCBjb2xvciBjb2RpbmdzIGJldHdlZW4gdGhvc2Ug
bW9kdWxlcy4gVGhlIFBYTDJEUEkgaXMgcHVyZWx5Cj4gPiBjb21iaW5hdG9yaWFsLgo+ID4gCj4g
PiBTaWduZWQtb2ZmLWJ5OiBMaXUgWWluZyA8dmljdG9yLmxpdUBueHAuY29tPgo+ID4gLS0tCj4g
PiB2Mi0+djM6Cj4gPiAqIENhbGwgc3lzY29uX25vZGVfdG9fcmVnbWFwKCkgdG8gZ2V0IHJlZ21h
cCBpbnN0ZWFkIG9mCj4gPiAgIHN5c2Nvbl9yZWdtYXBfbG9va3VwX2J5X3BoYW5kbGUoKS4KPiA+
IAo+ID4gdjEtPnYyOgo+ID4gKiBEcm9wIHVubmVjZXNzYXJ5IHBvcnQgYXZhaWxhYmlsaXR5IGNo
ZWNrLgo+ID4gCj4gPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9pbXgvS2NvbmZpZyAgICAgICAg
ICAgfCAgIDggKwo+ID4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvaW14L01ha2VmaWxlICAgICAg
ICAgIHwgICAxICsKPiA+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2lteC9pbXg4cXhwLXB4bDJk
cGkuYyB8IDQ4OCArKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ICAzIGZpbGVzIGNoYW5n
ZWQsIDQ5NyBpbnNlcnRpb25zKCspCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvaW14L2lteDhxeHAtcHhsMmRwaS5jCj4gPiArCXAyZC0+cmVnbWFwID0gc3lz
Y29uX25vZGVfdG9fcmVnbWFwKG5wLT5wYXJlbnQpOwo+ID4gKwlpZiAoSVNfRVJSKHAyZC0+cmVn
bWFwKSkgewo+ID4gKwkJcmV0ID0gUFRSX0VSUihwMmQtPnJlZ21hcCk7Cj4gPiArCQlpZiAocmV0
ICE9IC1FUFJPQkVfREVGRVIpCj4gPiArCQkJRFJNX0RFVl9FUlJPUihkZXYsICJmYWlsZWQgdG8g
Z2V0IHJlZ21hcDogJWRcbiIsIHJldCk7Cj4gPiArCQlyZXR1cm4gcmV0Owo+ID4gKwl9Cj4gPiAr
Cj4gPiArCXAyZC0+aWQgPSBvZl9hbGlhc19nZXRfaWQobnAsICJweGwyZHBpIik7Cj4gCj4gRG9u
J3QgYWRkIHJhbmRvbSBhbGlhc2VzLiBJJ2QgcmF0aGVyIHNlZSBhIHByb3BlcnR5IGluIHRoaXMg
bm9kZSBhcyBsb25nIAo+IGFzIGl0IGlzIHNwZWNpZmljIHRvIHdoYXQgdGhpcyBpcyB1c2VkIGZv
ciAoYW5kIG5vdCBhIGdlbmVyaWMgaW5kZXgpLgoKT2suICBJJ2xsIHVzZSBhIERUIHByb3BlcnR5
IHRvIGdldCB0aGUgU0NVIHJlc291cmNlIElEIGFzc29jaWF0ZWQgd2l0aAp0aGUgUFhMMkRQSSBp
bnN0YW5jZS4gIFRoYW5rcy4KCkxpdSBZaW5nCgo+IAo+IFJvYgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
