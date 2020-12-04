Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E34D2CE9CE
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 09:34:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ABAF6EC65;
	Fri,  4 Dec 2020 08:33:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00077.outbound.protection.outlook.com [40.107.0.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DCA06E139
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 07:42:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hyx5Q0uRNIX2N/CS7/q5zuEjvu9PeW8kvLZUlqYuVxn518htGLzBpzXItijVCZ+Op+YA229HLBgN0jDauMH9INmislnM1UnrinJGWNphCfNl/jUEpn6ThagvJ4HkZu+VbD6VMQPAdbzuKMEez7yE6tXwFl/YVDKcEMbuFEdEnyJFEoDbbBUCAA429sYSd1XzOZh83tWcOnU5t+foBS/YOfvhHJ4oqJ+XNdgLgwx5wjXRvAVqRh9pCjBDVO4VD5vKeGq2cDwWtyEMTCdrtMT75cZe6sfp+Q4+MEAcBKd+f56P2lfNbRlkIA0hcF4hl1VnAPM02tA7P6nvSKOZrVhE5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nDkx75d8BodAfPnizTup55/foyEQ8eu4JZgxq2YzmLU=;
 b=WYFeBtdAA/AcadVV8cYyJC+gHiWxDImyx3/TTmbQMgzm7qy6Rvhv1HowOH5JaI7ds2g7Diaq2/1+MqvOImfWR6rJO1ZFZaurQM2eNWbGVlRVKsYmS1NomYBzCTgVhoxhtLSUDZmzhORtwNgAwZvdsnV2rJskizphqlr+FDDgMqcXypCoLKEOKzZfQTVxsXoj37nyyu2aLKH3Zfsoy1ctqz+n6iv7LzvRVpGFjGJ1aPaFsvSeE81YR8TNo9yOK9cBPnKHljxFIgtdkV/NXMxfZahP07yqqTuFz8RVQJXiPmeyo8t9bAYIWdCnMwJ9tOgV/YdTjPuDQvuqSHJxwXrMSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nDkx75d8BodAfPnizTup55/foyEQ8eu4JZgxq2YzmLU=;
 b=lRXavAtZZ+b3e6/VIgmk5hSLlwaBF+qCnVTiUb0+Dhm332qc9vpsf2/8c9dyn0daFYxTqyRP5ZuMtO/puNelzsIh4wHy3kUAm4CpaX+idnv+UtM5zYRGVPMmb6fb1Q0GhP7qmfB4MraTh4vKs1Afpp9MojvmuOpXYxOgTZzWyMU=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0402MB3421.eurprd04.prod.outlook.com (2603:10a6:803:5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21; Fri, 4 Dec
 2020 07:42:20 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3611.025; Fri, 4 Dec 2020
 07:42:20 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/4] dt-bindings: phy: mixel: mipi-dsi-phy: Add Mixel combo
 PHY support for i.MX8qxp
Date: Fri,  4 Dec 2020 15:33:43 +0800
Message-Id: <1607067224-15616-4-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607067224-15616-1-git-send-email-victor.liu@nxp.com>
References: <1607067224-15616-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR01CA0098.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::24) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR01CA0098.apcprd01.prod.exchangelabs.com (2603:1096:3:15::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3632.17 via Frontend
 Transport; Fri, 4 Dec 2020 07:42:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d95f1bfa-abc5-4b48-e57f-08d898282179
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3421:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB34212834B2DDF2A7CC3719A398F10@VI1PR0402MB3421.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fqgUd2eJOUGUzXguqrN1UCBZq/Y3IEugVoME6dvPoLcy6Lo2JBKLkFlRlpCni5poUYOwAxE8nGG/d1RFILfUqfKKgeMpIObaSkgpVqnEGDGGgrLIqR/aqyCDYJi25yQR+wITq2Ov6NSSXmKpD0q+4wwhFe9U48frpG7Q9y7Sihy6Zl5iLDk0Lgjdpc4wQ0alDqLgG4m1iSt/e4muFK1PL0jsL0Gwc3Zvn2q8l9AHz0Fb38/ODZvBLTWQQpuN8FBTEJMABqbcmKUawCM3BsEmN7qHgMGfD7KuuvLxo2rLlNc2coRYCnij1fAkmrN5/LjAjsablujllpghJC399d/y2A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(39860400002)(346002)(396003)(4326008)(66556008)(6512007)(66476007)(66946007)(83380400001)(316002)(8676002)(36756003)(7416002)(2906002)(86362001)(6486002)(8936002)(26005)(186003)(66574015)(52116002)(16526019)(2616005)(956004)(478600001)(6666004)(5660300002)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QU5ybXNQTVZTS2tKS1Faa3NUb0llTjNkdGVGdThIaGNqOS9GbFlONVIzSjdj?=
 =?utf-8?B?dTRpaXJKemwrdjk0TUhua2syS24rSDNaVmFZamIwcUR4eUZXdk0xN1djVkRJ?=
 =?utf-8?B?bWY5MStRZlBHTk1PcGRNcmJqL3pwU0dJVndEbTFVY2pXTmp0N2t1SUtqOGtI?=
 =?utf-8?B?WnBodlVnSlMwWGhHcyt0b3k5OUVMQzRYSGVteGNOZ3NqSC9HUzRhQ3crcmky?=
 =?utf-8?B?Rk1lVEs5dHMrU2RvejBDRUtveU4rL3B2YVVaSnBUV1o0akZwdDZPQ0JvM1U5?=
 =?utf-8?B?eE4rVlBubDEyVUNPd1BqLzZONkRyZStWNVJnN1lRV3ZDa3F4T2NWRlkzcG5Q?=
 =?utf-8?B?QkhZa1kzWWx2b2c4MDcvanpicFdDV0hpajY3WlVpdXZmU0ZXd1FLTjNYRE0w?=
 =?utf-8?B?dFBSV1dlQUR5TGt2Y1RsTXMybUpjaGsvekMrYUMvRGRlTnVLNWxNazY2bXA2?=
 =?utf-8?B?THJDNytiUFE5NjZPUUh6SGpUUVpwNm43ZmxablptR3pzV3R1NmRyb2lBcnNY?=
 =?utf-8?B?YXdaN1BoYS8zQmZad1FMbmlOaTRmNE53U1NjZ3RDZUorVEYxV1BHQytOK1RW?=
 =?utf-8?B?SFpCaUpmeThZQlhHSEJLMGl6S0JJMnJuTVRKU2VIaG8yZWluTk9mYkV5N2tC?=
 =?utf-8?B?L1pwdWxIRVFCTmFxZzRWMEl6aGpZdjZtaDR5ZWdrV2VieWNXbWFmdjVsc3V1?=
 =?utf-8?B?VTZ4TWg3cFpEU0xNOW1KRXI2a1RCQXV3Q0dlUmdxRlg5Y1hKd1p3dURZVG4y?=
 =?utf-8?B?WjhoZklRNjArTjIxSE5seTlPWEZaK3Q1TXBna1NhQTdRNDMwdnVodVNpNVZE?=
 =?utf-8?B?UEhVNEFjWjU1TXlrRFQ4NktNL3NVMFpKT1VaTSt2ZXRIUEcyVzllczcwNUp4?=
 =?utf-8?B?cjA1TVZsRTZnaDRBN2puRXQwckhFdVhvTzZsMlV4Mk9hNUdkVmlpeFFJK3E1?=
 =?utf-8?B?anZ6UHdXRW1wVHZwYm9Xang0UjlQU3VtVmhrMVdHeDVBVy9hYmt4T0IyWlhw?=
 =?utf-8?B?YnN1SU83cjd6aGdHUTJ0UitqM3ZDaHJXUVM5eUVHY2Rnb2NMdHpwcmtCaHFD?=
 =?utf-8?B?c2xHSytRc2ZtZlRURzdUMVk3dm1iQTlEWnc5N3ByU21oREpCUUhEUjQ2KzdI?=
 =?utf-8?B?M1E5akZFVlovakJwVDEyWnloWER4K21hZDYraGtiQ3RtVlJUY2JyTTlpQXh0?=
 =?utf-8?B?SHp2aUQ1MzdoNm9pck1MaytObkMwdVdaM29VVFcySDE3b3NzdWFvYUhiZG05?=
 =?utf-8?B?MmtqL0JRMXZGS21OWWNtTUhsbFZlRmtpQm9kajg1TUFnZndXMTB6QVhkRTJm?=
 =?utf-8?Q?GSjfYyjKOBhQ5g2tNg5a1BQBVSPgRQJweh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d95f1bfa-abc5-4b48-e57f-08d898282179
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2020 07:42:20.2854 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pe1WaRUVPNwY5zK2tY8wTtidWCmltW6hW0/E925L+26mJBIQnUgGduaWdVjHM1KB75lGke/XwfCW+PWJWsBGFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3421
X-Mailman-Approved-At: Fri, 04 Dec 2020 08:33:33 +0000
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
Cc: martin.kepplinger@puri.sm, jernej.skrabec@siol.net, kernel@pengutronix.de,
 narmstrong@baylibre.com, airlied@linux.ie, s.hauer@pengutronix.de,
 jonas@kwiboo.se, kishon@ti.com, a.hajda@samsung.com, vkoul@kernel.org,
 robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com, robert.chiras@nxp.com,
 shawnguo@kernel.org, agx@sigxcpu.org, linux-imx@nxp.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIHN1cHBvcnQgZm9yIE1peGVsIE1JUEkgRFBIWSArIExWRFMgUEhZIGNvbWJvIElQCmFzIGZv
dW5kIG9uIEZyZWVzY2FsZSBpLk1YOHF4cCBTb0MuCgpDYzogR3VpZG8gR8O8bnRoZXIgPGFneEBz
aWd4Y3B1Lm9yZz4KQ2M6IEtpc2hvbiBWaWpheSBBYnJhaGFtIEkgPGtpc2hvbkB0aS5jb20+CkNj
OiBWaW5vZCBLb3VsIDx2a291bEBrZXJuZWwub3JnPgpDYzogUm9iIEhlcnJpbmcgPHJvYmgrZHRA
a2VybmVsLm9yZz4KQ2M6IE5YUCBMaW51eCBUZWFtIDxsaW51eC1pbXhAbnhwLmNvbT4KU2lnbmVk
LW9mZi1ieTogTGl1IFlpbmcgPHZpY3Rvci5saXVAbnhwLmNvbT4KLS0tCiBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcGh5L21peGVsLG1pcGktZHNpLXBoeS50eHQgfCA4ICsrKysr
KystCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9taXhlbCxtaXBp
LWRzaS1waHkudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9taXhl
bCxtaXBpLWRzaS1waHkudHh0CmluZGV4IDliMjM0MDcuLjBhZmNlOTkgMTAwNjQ0Ci0tLSBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvbWl4ZWwsbWlwaS1kc2ktcGh5LnR4
dAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L21peGVsLG1pcGkt
ZHNpLXBoeS50eHQKQEAgLTQsOSArNCwxMyBAQCBUaGUgTWl4ZWwgTUlQSS1EU0kgUEhZIElQIGJs
b2NrIGlzIGUuZy4gZm91bmQgb24gaS5NWDggcGxhdGZvcm1zIChhbG9uZyB0aGUKIE1JUEktRFNJ
IElQIGZyb20gTm9ydGh3ZXN0IExvZ2ljKS4gSXQgcmVwcmVzZW50cyB0aGUgcGh5c2ljYWwgbGF5
ZXIgZm9yIHRoZQogZWxlY3RyaWNhbCBzaWduYWxzIGZvciBEU0kuCiAKK1RoZSBNaXhlbCBQSFkg
SVAgYmxvY2sgZm91bmQgb24gaS5NWDhxeHAgaXMgYSBjb21ibyBQSFkgdGhhdCBjYW4gd29yawor
aW4gZWl0aGVyIE1JUEktRFNJIFBIWSBtb2RlIG9yIExWRFMgUEhZIG1vZGUuCisKIFJlcXVpcmVk
IHByb3BlcnRpZXM6Ci0tIGNvbXBhdGlibGU6IE11c3QgYmU6CistIGNvbXBhdGlibGU6IFNob3Vs
ZCBiZSBvbmUgb2Y6CiAgIC0gImZzbCxpbXg4bXEtbWlwaS1kcGh5IgorICAtICJmc2wsaW14OHF4
cC1taXBpLWRwaHkiCiAtIGNsb2NrczogTXVzdCBjb250YWluIGFuIGVudHJ5IGZvciBlYWNoIGVu
dHJ5IGluIGNsb2NrLW5hbWVzLgogLSBjbG9jay1uYW1lczogTXVzdCBjb250YWluIHRoZSBmb2xs
b3dpbmcgZW50cmllczoKICAgLSAicGh5X3JlZiI6IHBoYW5kbGUgYW5kIHNwZWNpZmllciByZWZl
cnJpbmcgdG8gdGhlIERQSFkgcmVmIGNsb2NrCkBAIC0xNCw2ICsxOCw4IEBAIFJlcXVpcmVkIHBy
b3BlcnRpZXM6CiAtICNwaHktY2VsbHM6IG51bWJlciBvZiBjZWxscyBpbiBQSFksIGFzIGRlZmlu
ZWQgaW4KICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9waHktYmluZGlu
Z3MudHh0CiAgIHRoaXMgbXVzdCBiZSA8MD4KKy0gZnNsLHN5c2NvbjogUGhhbmRsZSB0byBhIHN5
c3RlbSBjb250cm9sbGVyLCBhcyByZXF1aXJlZCBieSB0aGUgUEhZCisgIGluIGkuTVg4cXhwIFNv
Qy4KIAogT3B0aW9uYWwgcHJvcGVydGllczoKIC0gcG93ZXItZG9tYWluczogcGhhbmRsZSB0byBw
b3dlciBkb21haW4KLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
