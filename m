Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A7C2D3D65
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 09:32:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E0246E2D5;
	Wed,  9 Dec 2020 08:32:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2057.outbound.protection.outlook.com [40.107.20.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFA266E10C
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 06:33:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MkfVZQzp53Hpp9zuMIFLiP2NE66oBgAHSMBSQH/zJjoIj/F601PxFY+LJ/oWvUB8We3me89Bpxjk2kExKO+FacoBsuO2qHK9xGrak0sBKPrFX+hpjqETWhZ5SUAL16mJFR6uc1aKNSEsQVq11Ra3PN9QKP+c/5yNFpGgm8U9CcegphqYttUg2Y+Y+rLpwWbgF/+/jWSzh6W34g6iAfCFX1YwPVPLmglJO5rjYa7CUNyzXYlAovLR3tOBY76r2f8cUivIUBYROUi/nxHkXrnEhLBT8MuiPsy7KM8STnRYxMnOoRgL4+JihFoVlB51V3gTv83OcN65gmw7Hjh8dnU0DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kEsZvVVMgoy/JmFSnfE3Xg6oPLliZDQ74ZOmZfzTvxk=;
 b=LrCGYA9tTVKhzWNCAmTMQjs5zEwBAfs9dnsYFK/yWdeYtMiezs9z7OXO199jm/mtrSCPwz6nNzoN4gyuXtzsJEVV7oP5/Lo2NjxTVcOfp1iUZQFGmVKRTvvBJ2GqoOtBb+o8h0VWMWyt8Nh8Wl1U1jMltJxQ1A1OSieXcszvsKCk6Ey5wrmrdFWupty70/VUPOCcTF5l+2VTw5lL3eK6xwqc0mWyrOk9CxeY2wILF6daPVFPFkQhvkzbQ0lPUHFMvtt2Nwg/hw8yi5XOHKTgHI+2iZ49TkRKhSrCJ1tbMWqOocfaac+prqGbpb5MmOHCb5G67R30hMHI6Vi5P1ejdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kEsZvVVMgoy/JmFSnfE3Xg6oPLliZDQ74ZOmZfzTvxk=;
 b=Ab3u5bMhQ0mQiX26qFJsIq6aUsW2/9qrSPdLaL7Z9/CY7n9C8KFXIFbeaTt9L5zX0cX0OBMMf9FVwW39DmNz5f6SZI08mFs9DylflWrQyxZyWNAiTv7g3t91diQNJUaTgiA+Gg1V7fUawLKGvSgjEiw+hrrMTRQfgH84Brm4smk=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB6144.eurprd04.prod.outlook.com (2603:10a6:803:fd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Wed, 9 Dec
 2020 06:33:19 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3632.023; Wed, 9 Dec 2020
 06:33:19 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 4/5] dt-bindings: phy: mixel: mipi-dsi-phy: Add Mixel combo
 PHY support for i.MX8qxp
Date: Wed,  9 Dec 2020 14:24:27 +0800
Message-Id: <1607495069-10946-5-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607495069-10946-1-git-send-email-victor.liu@nxp.com>
References: <1607495069-10946-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR06CA0148.apcprd06.prod.outlook.com
 (2603:1096:1:1f::26) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR06CA0148.apcprd06.prod.outlook.com (2603:1096:1:1f::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3654.12 via Frontend Transport; Wed, 9 Dec 2020 06:33:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d3f85ab4-6ac3-40a8-fb45-08d89c0c51bb
X-MS-TrafficTypeDiagnostic: VI1PR04MB6144:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB614441C7348B121ADE784AE698CC0@VI1PR04MB6144.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SJQkCpR6BwPOcU0zERKKTFSing0AcpEEFOTCp9azpwEnFTetInBT8e870CqLd/d0YhZZdBA4Jk3fC+gumAfF5rtm/o9aBkBXVzS5CfBwuaHFXseTx9Bzf2LeyK0x/OOsz1aQZokU89ZQo6/m6MpUt2IdmJvgrWqb1aaLDKbTulr+bhy0NM1r1YofEWeKgRhO7TYawUkGwSEiQ2aVOZukv+FJkkxq48/QxfT34ofn3QLY+d4vNRwMZRa+NamS3Ua+xahaTrbUI0v+p50PjFf+4Rp9MAa+tk1JVeNzozcrxqDblt+lfxmy7GNpqp3CollZNXeQPxCW9tS23dPzwj0bMnm1EKJNc50/6irNmB3qlixX6ySGOGN6ugxKCKkxGWnA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(376002)(2616005)(26005)(52116002)(5660300002)(186003)(16526019)(34490700003)(8936002)(8676002)(6486002)(6666004)(66476007)(2906002)(7416002)(956004)(36756003)(6512007)(508600001)(66946007)(83380400001)(4326008)(6506007)(86362001)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RFB2R1MwVDBtaTVGWS9LTURRK3JwU0gyR25jaGFBWlJZOTJBbll0UnF1NVF6?=
 =?utf-8?B?aFFYY01ld1JyL2g4cDFtTERoeDRXUUtPSUtqeG82Njg0Mm84d3hhajZpcDN6?=
 =?utf-8?B?elppSzRJdnhFWXd4Zmhma21Cd2ZQSFZzS2JadVpWOUtTbGczaDJ2cW10QjFm?=
 =?utf-8?B?WVFvWTV4V2hDcU4wbkp0S0NDNnp1OFR1NEd3dUgrLzY2dDMzTml6bEZucnFo?=
 =?utf-8?B?RS9DcFBhY3VkUjhNbVE1UWh2TjQ2endMYk5DaFV3UVRONjcxTFcza1l4RGhx?=
 =?utf-8?B?UUFueUtHZlRoVlRpU053WjNKNnhQU0xIaW5rTGhVWDFURWZYelIxei9GVnps?=
 =?utf-8?B?MWNab0UxUXhHS2xMdzRtaCtGaWsvNk5IZXRzdmdWTVNmZWR3aEtibmo5cE1q?=
 =?utf-8?B?Wk1xeERZajM1clBvZ3ZZVVJNZnRvZWc2ZWFGcVk4OUxxSXIvRWpkOGh2TTZD?=
 =?utf-8?B?R1hxSWFXaEEveit6VzhCdXZ6aVlpbStFdWpsbGN4Tys1VFhpeGI3ZWdaV1cz?=
 =?utf-8?B?RUlYWHloeC82NzVlay9Tb3BkU1pEWC9sM2l1Q212elRlMHo2R1c0eVVGTWtv?=
 =?utf-8?B?SU1qVW5lTzlsQlNteURIUjMwbHArOE0vb29aM1hGaDdRR0FJTzljVGtnMW5O?=
 =?utf-8?B?aEtzdDFPWDR6SmlYa2NWRU04TFczc3B6K1NYVkxucTkxM1BWamxrOXJOR0lJ?=
 =?utf-8?B?clU5ZFBqZnRmbG1kMS9qdG9Ock9NTTI4aE8rd2p4cnZHbTJTUzI3U1h3RXFi?=
 =?utf-8?B?cGxpWGNqSEhnR01ZTVhFMDhWVUtKRXJOWTBEcUcrQkkwditjRWQwdnZvaW00?=
 =?utf-8?B?VzhnOGRUSitWdWhHRVZWRkdzRnpjZ0dsRVU3Q2l2dzdoWmVWSG1EeGhjeXV1?=
 =?utf-8?B?c0g2M0l1OXptYmUvOXhySHdGOVhSckh2WUU4QnNUa2N6eHJ2WVdpN2wySFFC?=
 =?utf-8?B?cEtYWHhqMDBNMmVCYVBudDFzWnNCRXBQcjZ3OWpSTlluMXJjMm5jSTg1alVa?=
 =?utf-8?B?OVNSa21SQU9VZllqdGRoOGt0Wm9OU3BhczhWYTcwQndLYTBML243c01ZQXlT?=
 =?utf-8?B?MFRwell5b0dyNDVyanhLd3VneFlvNGRSMWt1VnU4REE0R3pBQTJ5NlZOTDdo?=
 =?utf-8?B?bFBzTHc4am9FNkdaeGt3WDlVc3dQTnpiQmVEb291K1pOVDBTaU9HZ0FrN2xR?=
 =?utf-8?B?VTl0TlVNVUc2TVlOSm16LzBkRkhlM1NaTndRVmcrbzdXZzk1TVRZUXdCL2VR?=
 =?utf-8?B?MnZrWHJCWjB6NFordXB6cCtCWWhIWlRKcDJMQUdqbmp5RFhGS0piWjNNb2tX?=
 =?utf-8?Q?+akkk8D7xnSGsvBOgsxj++wixnoF8M5pnk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2020 06:33:19.6590 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: d3f85ab4-6ac3-40a8-fb45-08d89c0c51bb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DyZh6JqqErHrG4AXHDkvP/CpdjHEUaVkkFOasUMFfjsid52a4GJZ+S0u+D+GTI2bscQsnfx4+PGzlMWmXENG8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6144
X-Mailman-Approved-At: Wed, 09 Dec 2020 08:32:01 +0000
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
LW9mZi1ieTogTGl1IFlpbmcgPHZpY3Rvci5saXVAbnhwLmNvbT4KLS0tCnYxLT52MjoKKiBBZGQg
dGhlIGJpbmRpbmcgZm9yIGkuTVg4cXhwIE1peGVsIGNvbWJvIFBIWSBiYXNlZCBvbiB0aGUgY29u
dmVydGVkIGJpbmRpbmcuCiAgKEd1aWRvKQoKIC4uLi9iaW5kaW5ncy9waHkvbWl4ZWwsbWlwaS1k
c2ktcGh5LnlhbWwgICAgICAgICAgIHwgNDEgKysrKysrKysrKysrKysrKysrKystLQogMSBmaWxl
IGNoYW5nZWQsIDM4IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9taXhlbCxtaXBpLWRzaS1waHku
eWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvbWl4ZWwsbWlwaS1k
c2ktcGh5LnlhbWwKaW5kZXggZjg2OWZkMi4uMDdiOTg0OSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9taXhlbCxtaXBpLWRzaS1waHkueWFtbAorKysg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L21peGVsLG1pcGktZHNpLXBo
eS55YW1sCkBAIC0xNCwxMCArMTQsMTQgQEAgZGVzY3JpcHRpb246IHwKICAgTUlQSS1EU0kgSVAg
ZnJvbSBOb3J0aHdlc3QgTG9naWMpLiBJdCByZXByZXNlbnRzIHRoZSBwaHlzaWNhbCBsYXllciBm
b3IgdGhlCiAgIGVsZWN0cmljYWwgc2lnbmFscyBmb3IgRFNJLgogCisgIFRoZSBNaXhlbCBQSFkg
SVAgYmxvY2sgZm91bmQgb24gaS5NWDhxeHAgaXMgYSBjb21ibyBQSFkgdGhhdCBjYW4gd29yawor
ICBpbiBlaXRoZXIgTUlQSS1EU0kgUEhZIG1vZGUgb3IgTFZEUyBQSFkgbW9kZS4KKwogcHJvcGVy
dGllczoKICAgY29tcGF0aWJsZToKICAgICBlbnVtOgogICAgICAgLSBmc2wsaW14OG1xLW1pcGkt
ZHBoeQorICAgICAgLSBmc2wsaW14OHF4cC1taXBpLWRwaHkKIAogICByZWc6CiAgICAgbWF4SXRl
bXM6IDEKQEAgLTQxLDYgKzQ1LDExIEBAIHByb3BlcnRpZXM6CiAgICIjcGh5LWNlbGxzIjoKICAg
ICBjb25zdDogMAogCisgIGZzbCxzeXNjb246CisgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFt
bCMvZGVmaW5pdGlvbnMvcGhhbmRsZQorICAgIGRlc2NyaXB0aW9uOiB8CisgICAgICBBIHBoYW5k
bGUgd2hpY2ggcG9pbnRzIHRvIENvbnRyb2wgYW5kIFN0YXR1cyBSZWdpc3RlcnMoQ1NSKSBtb2R1
bGUuCisKICAgcG93ZXItZG9tYWluczoKICAgICBtYXhJdGVtczogMQogCkBAIC00OSwxMiArNTgs
MzggQEAgcmVxdWlyZWQ6CiAgIC0gcmVnCiAgIC0gY2xvY2tzCiAgIC0gY2xvY2stbmFtZXMKLSAg
LSBhc3NpZ25lZC1jbG9ja3MKLSAgLSBhc3NpZ25lZC1jbG9jay1wYXJlbnRzCi0gIC0gYXNzaWdu
ZWQtY2xvY2stcmF0ZXMKICAgLSAiI3BoeS1jZWxscyIKICAgLSBwb3dlci1kb21haW5zCiAKK2Fs
bE9mOgorICAtIGlmOgorICAgICAgcHJvcGVydGllczoKKyAgICAgICAgY29tcGF0aWJsZToKKyAg
ICAgICAgICBjb250YWluczoKKyAgICAgICAgICAgIGNvbnN0OiBmc2wsaW14OG1xLW1pcGktZHBo
eQorICAgIHRoZW46CisgICAgICBwcm9wZXJ0aWVzOgorICAgICAgICBmc2wsc3lzY29uOiBmYWxz
ZQorCisgICAgICByZXF1aXJlZDoKKyAgICAgICAgLSBhc3NpZ25lZC1jbG9ja3MKKyAgICAgICAg
LSBhc3NpZ25lZC1jbG9jay1wYXJlbnRzCisgICAgICAgIC0gYXNzaWduZWQtY2xvY2stcmF0ZXMK
KworICAtIGlmOgorICAgICAgcHJvcGVydGllczoKKyAgICAgICAgY29tcGF0aWJsZToKKyAgICAg
ICAgICBjb250YWluczoKKyAgICAgICAgICAgIGNvbnN0OiBmc2wsaW14OHF4cC1taXBpLWRwaHkK
KyAgICB0aGVuOgorICAgICAgcHJvcGVydGllczoKKyAgICAgICAgYXNzaWduZWQtY2xvY2tzOiBm
YWxzZQorICAgICAgICBhc3NpZ25lZC1jbG9jay1wYXJlbnRzOiBmYWxzZQorICAgICAgICBhc3Np
Z25lZC1jbG9jay1yYXRlczogZmFsc2UKKworICAgICAgcmVxdWlyZWQ6CisgICAgICAgIC0gZnNs
LHN5c2NvbgorCiBhZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UKIAogZXhhbXBsZXM6Ci0tIAoy
LjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
