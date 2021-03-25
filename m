Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 314D0348C70
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 10:15:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58AAF6ECD8;
	Thu, 25 Mar 2021 09:15:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150089.outbound.protection.outlook.com [40.107.15.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77D5C6ECD8
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 09:15:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qety/2IcvDS32Gb48e0RqQQP6aE7o/5NfW1uVnOMjdiFqAbGneCBJgwWAjFoe5FujPFg5c11hWQtSgJhCbr7pwzLX7i9ZP0twlzb7pTtVJDuEWmSIHKr1d45fpmy+e12UiP+9fuN1NpzCRcgVEToxJi1jaOd0BfL6DNOCwlmYAYEon3F7UlLwp0+Sl44v/xwidFzwqCqrLLLHSmKgzRpTuTgygxxobqltbt7NTe17wWGDjEEMIBVHsorvsFfIQLBU/dRtNyD/TnXQtrntOgtyN/o5H4IC0md9wU4qMrc6qb6QM8jninNk2oOa7v/k3C6B7aG2FmcQkBaUs2+PwBu4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YcOOD7pxrOjYuc+M/RUhfoMzYz3J2kuDp7WDQUE2p+k=;
 b=nBEzveQzqJIwPPn7EZbfnCCB5ZSU0T/ebwcrFq3lAXOKFV8muNpRjRWXr5AyXYo5a8Tee5wF17EJwnZ193UV3CSBbeM216hpobOKpsA8HugkRAud/zH2T2kZdFvbIJH8uj3fL3L6XCTkPbNVo0gCFI41hO36xSNzMSSgcLTVSMpVqlNLRT1edUA0thRUoXMRUUtGFCslTW67iiun0VAb7CJulwTDdG9araHK562pprUjgRYlTPBblc1mMGO9nJMsgyuD1PGjPquRLnZflWua+4M8eELOSjhPISJ2RUbqsXX0VXrli+U6koeQpNPCBusQMwE079Pzy7ZjDP/H0pxN0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YcOOD7pxrOjYuc+M/RUhfoMzYz3J2kuDp7WDQUE2p+k=;
 b=bjS+F7xsjwKeVhep9RBhdJ4Q+GwqWk4RUorbmx5LpHIoyR0YJe/o2maaHshRAAWrEriZlC4nG8jl8lEWqGsNDA2ym0UyD97HoDAsLp3NNyO/ipCU/AJxBt5RF1OUItHlr22Ug8QraLiqKimzRoP+uUT0w+PRCc2Wn76cpnK93qQ=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0401MB2319.eurprd04.prod.outlook.com (2603:10a6:800:26::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Thu, 25 Mar
 2021 09:15:03 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c%5]) with mapi id 15.20.3977.026; Thu, 25 Mar 2021
 09:15:03 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 3/5] dt-bindings: phy: Convert mixel,
 mipi-dsi-phy to json-schema
Date: Thu, 25 Mar 2021 17:00:30 +0800
Message-Id: <1616662832-27048-4-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616662832-27048-1-git-send-email-victor.liu@nxp.com>
References: <1616662832-27048-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR02CA0164.apcprd02.prod.outlook.com
 (2603:1096:201:1f::24) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 HK2PR02CA0164.apcprd02.prod.outlook.com (2603:1096:201:1f::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3977.25 via Frontend Transport; Thu, 25 Mar 2021 09:14:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 782185a1-bae8-4df3-84cd-08d8ef6e7936
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2319:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB23193AE163F047DD3CEEB58098629@VI1PR0401MB2319.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mFKe3xcwBqCqmufdmQqck9Rm5vL6GrJal41WgW/5h4lCC+VNpUh9dZYSjm+kXYI0DTd6akZHyIL35vNhXo4GQNDAWLbysmQkkYPHxLrskTOBrjkwlnU1f8GQZUJ6hxPl79tgRuSgNhkxolMhM4CTcLuhSQEjW2CiTtQ1FPic7KG+rmSehvKo775ZzhtUP+DF/icGTcUdLjPXdcVAAZwsdTLXABBRuUFvn7gSn2d75t2e2c24eOTb6Y5ZSEUin+SZ0Xv3F7WvTSo2Zl3tbzjPnItuRx/BYfnm/djqA46T+3XPHxoQBbYrjaCC7atSU75w/S71+ri2qZGvnFC4MEEhBLuRb8fNOI54KBV4WhNpbOJr+KYTn7v2poYwCFg+PFOCaEWLOeFk8kTR/5TsyS9ecWFiPBznGcKwP0f9xT5dNv8wdeAHXKri2oN6uE0Asf2hxFT8aC0Ciq1CbIRGoMZb6hzs+dLXqbapuT0nZyV4s0Nii1gI6y5xFWhrcr7J4Qe0xcEEuGjZCyjktshC+wB2m6cSj3/00i4kVvzTVdIsseC6hQWnONpbs7dqVbPHonx1oyUewBFW0C78LRbG71z7nFjM85fk8PQPYx/b+uUxeKKjom6PXUkfSMh69+SliqFYP0JMAQ0SykT/p0IpPMjrQ6OiWdWljV+SjiIm4BosSHtrfC8a3DVvucu/TqqSIw+voI+6UK+ZR8bnetIhet0d1XIWGUFzeZ77DPzNvAijgbk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(396003)(39860400002)(136003)(6512007)(2906002)(7416002)(6666004)(5660300002)(6506007)(8936002)(6486002)(8676002)(966005)(66556008)(66476007)(4326008)(66946007)(2616005)(956004)(316002)(66574015)(38100700001)(16526019)(186003)(52116002)(83380400001)(478600001)(86362001)(36756003)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QUNpWjMvQnAxQ3c0NTI1MGhaKzAwaGpLcFRaS2xwRWNKV01YWGQ5cWU3L2Va?=
 =?utf-8?B?RjZqRnlZWkxWb0NQUkQzKy9iWEZsU3czcWpCa1pUdlRYMmZOTmtKWERtc05D?=
 =?utf-8?B?ZGpPVGVCNUJIMmxUblVwNG0zYTY4bTlXMDdnN1hvVVBkRXRuRTJqZ0JLQWZI?=
 =?utf-8?B?M0FrbHV2dkE2Z2I2SUxEMmtsTEhqZXdFMjdnRlowc2dROVZ4VE5kdk5QN1Zo?=
 =?utf-8?B?NHZydHVTd3ljMkNuNlZxcExSZ0JtM1c3dHV6SDhCNU4xN3VMKzMrQUpkQ0w2?=
 =?utf-8?B?RTBUWVc2YWd0Y1ZiNzV5TVluejV3NzlyYUwyb1g0cWlxak44MTRsWUlIZ0ZI?=
 =?utf-8?B?RllONkx3NzdBeG9xaUN2dHl3ai9MdDRLZmlIK3BBRUVXeFAxaSs2SVRSeDQw?=
 =?utf-8?B?UXZ1alQ0aGllZDhsTVVIRkN2MkM5TlBLckpNNkk3SXBrcHBnbEJxdkF0VWtO?=
 =?utf-8?B?QytVZkxoeUVFMDB2RVMrWXljQWZ2cTNHR2JLWkErcnpoSkRma2JBVG1RWlNh?=
 =?utf-8?B?ZnZ5Ri9meHlXWndCdTdHdWhseDRMZjBLM3pablFaV1VVTFFBZ2NsU1BQUU1Q?=
 =?utf-8?B?RUhqSjdmQW5zbG9JNFY0V3pQL3pEQmJEWjNYNC82T281MjdoMjdyR2FIa3ZD?=
 =?utf-8?B?NGR1cTdZbHRDZVdFMFFvSUgxeGdMbEdpaGhLS2xwWndWTDJMbm0wdEFLb1Z2?=
 =?utf-8?B?bXFUNTMwcFFyS092QklraGVUTlBndHlGV0ozNzhFOXBZTk83TG4xaDVWdTFa?=
 =?utf-8?B?eFRlWlJvRkIraE1IY0s1TzVxYkJKWUtqMmJoUXNsWGhEZC9KRkZ6SmtmSWts?=
 =?utf-8?B?Z3loK0RjSzZLUW9IamJJa1hIR1pCVnFVUFRIeFRxZzdUYW1GUXB4NG9PLzB3?=
 =?utf-8?B?YnZMWmRjQyt2V3hYZndtZDY1OEgrTW1zaTE0eDUwbGYxdDNYTVdoWVB2dDJp?=
 =?utf-8?B?elhmZTcrS2RWQ3djeHNLa2drV1ZDRWRPZ0xqSHJMcmJtekhBWXlrY0ZhakJ5?=
 =?utf-8?B?MlNKUmd5QTk3Y1pqbzNvcllBOC8rMXkyNUFxWTdkNnFraVlVUFNUemppYWxG?=
 =?utf-8?B?ci91akVUZzk1WnVFVXhROUhUQUw1cFpLemdhdlM1clkxdzB6UXZNUlRWajJP?=
 =?utf-8?B?V1pTTmNveUNrdTFYaEM1MFpFcEIxMFlDMWFvc29CMUdMSjlsUllDS1VsRW1a?=
 =?utf-8?B?WHpKUFFqajFCL1kxeXJSVHZYOFNVekxaKytqQk5uSFVFc29MY2JMZnZ1YVNE?=
 =?utf-8?B?OW9DdUUzdFlwRnNSRC9IUzdETVVWMys3NVJHTEgxWGNrdGs4UkxrN1UzRkt5?=
 =?utf-8?B?bXVFMW9OdXJDQ25yd0Z3ZXJaRVRlUkY0emJwc1haWGpuVWphaVNmaXd6VmZq?=
 =?utf-8?B?eTQ0NEk2VU14cGxJbEVrcHBMRmhETHZlVzZrTG1uYldkNzlqdkZOZkQwcTFY?=
 =?utf-8?B?ak1TOU9yM3ltSkVpSHZLTis0S0pJY1o5QmN5ZHVNUENDc3hXa2pleXc1cTVh?=
 =?utf-8?B?NnNIaGgvNm5rSzdrTEdDMWxRWDY0NEh3QVNVeGFLTVRONjF1MXpJNUxJcDVM?=
 =?utf-8?B?cEZMdWV1RGthbWxKZDUvVnE3UU1QL2w0MDNwZjNOVERDWXlxYS9PRmtGTjNy?=
 =?utf-8?B?NkRRSEp5NnpaWERvaHpFTGNySXJXZnBmcGxhVVNXS2dxdjIva3JvbTVlamxw?=
 =?utf-8?B?Qlh0UFEraVYwSHk1alpyVjhUenZGeGVIMjRkdHJwb1pMeG9BMVNqbzgzdnFE?=
 =?utf-8?Q?2EkzozXAPIazIggqPUH3UlmkyJ3P8vka6ed5nok?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 782185a1-bae8-4df3-84cd-08d8ef6e7936
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 09:15:03.5270 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3F0S9PuVgODFc5NcTMn3FYds8WC8VTDZaxGcQfGeMik++NAwuhfLi38CUawRokyHiytaVyPBXUJjrj0Cdv5O8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2319
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
 jonas@kwiboo.se, robert.foss@linaro.org, kishon@ti.com, a.hajda@samsung.com,
 vkoul@kernel.org, robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com,
 robert.chiras@nxp.com, shawnguo@kernel.org, agx@sigxcpu.org, linux-imx@nxp.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBjb252ZXJ0cyB0aGUgbWl4ZWwsbWlwaS1kc2ktcGh5IGJpbmRpbmcgdG8KRFQg
c2NoZW1hIGZvcm1hdCB1c2luZyBqc29uLXNjaGVtYS4KCkNvbXBhcmluZyB0byB0aGUgcGxhaW4g
dGV4dCB2ZXJzaW9uLCB0aGUgbmV3IGJpbmRpbmcgYWRkcwp0aGUgJ2Fzc2lnbmVkLWNsb2Nrcycs
ICdhc3NpZ25lZC1jbG9jay1wYXJlbnRzJyBhbmQKJ2Fzc2lnbmVkLWNsb2NrLXJhdGVzJyBwcm9w
ZXJpdGVzLCBvdGhlcndpc2UgJ21ha2UgZHRic19jaGVjaycKd291bGQgY29tcGxhaW4gdGhhdCB0
aGVyZSBhcmUgbWlzLW1hdGNoZXMuICBBbHNvLCB0aGUgbmV3CmJpbmRpbmcgcmVxdWlyZXMgdGhl
ICdwb3dlci1kb21haW5zJyBwcm9wZXJ0eSBzaW5jZSBhbGwgcG90ZW50aWFsClNvQ3MgdGhhdCBl
bWJlZCB0aGlzIFBIWSB3b3VsZCBwcm92aWRlIGEgcG93ZXIgZG9tYWluIGZvciBpdC4KVGhlIGV4
YW1wbGUgb2YgdGhlIG5ldyBiaW5kaW5nIHRha2VzIHJlZmVyZW5jZSB0byB0aGUgbGF0ZXN0CmRw
aHkgbm9kZSBpbiBpbXg4bXEuZHRzaS4KCkNjOiBHdWlkbyBHw7xudGhlciA8YWd4QHNpZ3hjcHUu
b3JnPgpDYzogS2lzaG9uIFZpamF5IEFicmFoYW0gSSA8a2lzaG9uQHRpLmNvbT4KQ2M6IFZpbm9k
IEtvdWwgPHZrb3VsQGtlcm5lbC5vcmc+CkNjOiBSb2IgSGVycmluZyA8cm9iaCtkdEBrZXJuZWwu
b3JnPgpDYzogTlhQIExpbnV4IFRlYW0gPGxpbnV4LWlteEBueHAuY29tPgpSZXZpZXdlZC1ieTog
Um9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KUmV2aWV3ZWQtYnk6IEd1aWRvIEfDvG50aGVy
IDxhZ3hAc2lneGNwdS5vcmc+ClNpZ25lZC1vZmYtYnk6IExpdSBZaW5nIDx2aWN0b3IubGl1QG54
cC5jb20+Ci0tLQp2NC0+djU6CiogTm8gY2hhbmdlLgoKdjMtPnY0OgoqIEFkZCBSb2IncyBhbmQg
R3VpZG8ncyBSLWIgdGFncy4KCnYyLT52MzoKKiBJbXByb3ZlIHRoZSAnY2xvY2stbmFtZXMnIHBy
b3BlcnR5IGJ5IGRyb3BwaW5nICdpdGVtczonLgoKdjEtPnYyOgoqIE5ld2x5IGludHJvZHVjZWQg
aW4gdjIuICAoR3VpZG8pCgogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L21peGVsLG1pcGkt
ZHNpLXBoeS50eHQgfCAyOSAtLS0tLS0tLS0KIC4uLi9iaW5kaW5ncy9waHkvbWl4ZWwsbWlwaS1k
c2ktcGh5LnlhbWwgICAgICAgICAgIHwgNzIgKysrKysrKysrKysrKysrKysrKysrKwogMiBmaWxl
cyBjaGFuZ2VkLCA3MiBpbnNlcnRpb25zKCspLCAyOSBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2Rl
IDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L21peGVsLG1pcGkt
ZHNpLXBoeS50eHQKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvcGh5L21peGVsLG1pcGktZHNpLXBoeS55YW1sCgpkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9taXhlbCxtaXBpLWRzaS1waHkudHh0IGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9taXhlbCxtaXBpLWRzaS1waHku
dHh0CmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCA5YjIzNDA3Li4wMDAwMDAwMAotLS0g
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L21peGVsLG1pcGktZHNpLXBo
eS50eHQKKysrIC9kZXYvbnVsbApAQCAtMSwyOSArMCwwIEBACi1NaXhlbCBEU0kgUEhZIGZvciBp
Lk1YOAotCi1UaGUgTWl4ZWwgTUlQSS1EU0kgUEhZIElQIGJsb2NrIGlzIGUuZy4gZm91bmQgb24g
aS5NWDggcGxhdGZvcm1zIChhbG9uZyB0aGUKLU1JUEktRFNJIElQIGZyb20gTm9ydGh3ZXN0IExv
Z2ljKS4gSXQgcmVwcmVzZW50cyB0aGUgcGh5c2ljYWwgbGF5ZXIgZm9yIHRoZQotZWxlY3RyaWNh
bCBzaWduYWxzIGZvciBEU0kuCi0KLVJlcXVpcmVkIHByb3BlcnRpZXM6Ci0tIGNvbXBhdGlibGU6
IE11c3QgYmU6Ci0gIC0gImZzbCxpbXg4bXEtbWlwaS1kcGh5IgotLSBjbG9ja3M6IE11c3QgY29u
dGFpbiBhbiBlbnRyeSBmb3IgZWFjaCBlbnRyeSBpbiBjbG9jay1uYW1lcy4KLS0gY2xvY2stbmFt
ZXM6IE11c3QgY29udGFpbiB0aGUgZm9sbG93aW5nIGVudHJpZXM6Ci0gIC0gInBoeV9yZWYiOiBw
aGFuZGxlIGFuZCBzcGVjaWZpZXIgcmVmZXJyaW5nIHRvIHRoZSBEUEhZIHJlZiBjbG9jawotLSBy
ZWc6IHRoZSByZWdpc3RlciByYW5nZSBvZiB0aGUgUEhZIGNvbnRyb2xsZXIKLS0gI3BoeS1jZWxs
czogbnVtYmVyIG9mIGNlbGxzIGluIFBIWSwgYXMgZGVmaW5lZCBpbgotICBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcGh5L3BoeS1iaW5kaW5ncy50eHQKLSAgdGhpcyBtdXN0IGJl
IDwwPgotCi1PcHRpb25hbCBwcm9wZXJ0aWVzOgotLSBwb3dlci1kb21haW5zOiBwaGFuZGxlIHRv
IHBvd2VyIGRvbWFpbgotCi1FeGFtcGxlOgotCWRwaHk6IGRwaHlAMzBhMDAzMCB7Ci0JCWNvbXBh
dGlibGUgPSAiZnNsLGlteDhtcS1taXBpLWRwaHkiOwotCQljbG9ja3MgPSA8JmNsayBJTVg4TVFf
Q0xLX0RTSV9QSFlfUkVGPjsKLQkJY2xvY2stbmFtZXMgPSAicGh5X3JlZiI7Ci0JCXJlZyA9IDww
eDMwYTAwMzAwIDB4MTAwPjsKLQkJcG93ZXItZG9tYWlucyA9IDwmcGRfbWlwaTA+OwotCQkjcGh5
LWNlbGxzID0gPDA+OwotICAgICAgICB9OwpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3BoeS9taXhlbCxtaXBpLWRzaS1waHkueWFtbCBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvbWl4ZWwsbWlwaS1kc2ktcGh5LnlhbWwKbmV3IGZp
bGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAuLmMzNGYyZTYKLS0tIC9kZXYvbnVsbAorKysg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L21peGVsLG1pcGktZHNpLXBo
eS55YW1sCkBAIC0wLDAgKzEsNzIgQEAKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwt
Mi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQorJVlBTUwgMS4yCistLS0KKyRpZDogaHR0cDovL2Rl
dmljZXRyZWUub3JnL3NjaGVtYXMvcGh5L21peGVsLG1pcGktZHNpLXBoeS55YW1sIworJHNjaGVt
YTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCisKK3RpdGxl
OiBNaXhlbCBEU0kgUEhZIGZvciBpLk1YOAorCittYWludGFpbmVyczoKKyAgLSBHdWlkbyBHw7xu
dGhlciA8YWd4QHNpZ3hjcHUub3JnPgorCitkZXNjcmlwdGlvbjogfAorICBUaGUgTWl4ZWwgTUlQ
SS1EU0kgUEhZIElQIGJsb2NrIGlzIGUuZy4gZm91bmQgb24gaS5NWDggcGxhdGZvcm1zIChhbG9u
ZyB0aGUKKyAgTUlQSS1EU0kgSVAgZnJvbSBOb3J0aHdlc3QgTG9naWMpLiBJdCByZXByZXNlbnRz
IHRoZSBwaHlzaWNhbCBsYXllciBmb3IgdGhlCisgIGVsZWN0cmljYWwgc2lnbmFscyBmb3IgRFNJ
LgorCitwcm9wZXJ0aWVzOgorICBjb21wYXRpYmxlOgorICAgIGVudW06CisgICAgICAtIGZzbCxp
bXg4bXEtbWlwaS1kcGh5CisKKyAgcmVnOgorICAgIG1heEl0ZW1zOiAxCisKKyAgY2xvY2tzOgor
ICAgIG1heEl0ZW1zOiAxCisKKyAgY2xvY2stbmFtZXM6CisgICAgY29uc3Q6IHBoeV9yZWYKKwor
ICBhc3NpZ25lZC1jbG9ja3M6CisgICAgbWF4SXRlbXM6IDEKKworICBhc3NpZ25lZC1jbG9jay1w
YXJlbnRzOgorICAgIG1heEl0ZW1zOiAxCisKKyAgYXNzaWduZWQtY2xvY2stcmF0ZXM6CisgICAg
bWF4SXRlbXM6IDEKKworICAiI3BoeS1jZWxscyI6CisgICAgY29uc3Q6IDAKKworICBwb3dlci1k
b21haW5zOgorICAgIG1heEl0ZW1zOiAxCisKK3JlcXVpcmVkOgorICAtIGNvbXBhdGlibGUKKyAg
LSByZWcKKyAgLSBjbG9ja3MKKyAgLSBjbG9jay1uYW1lcworICAtIGFzc2lnbmVkLWNsb2Nrcwor
ICAtIGFzc2lnbmVkLWNsb2NrLXBhcmVudHMKKyAgLSBhc3NpZ25lZC1jbG9jay1yYXRlcworICAt
ICIjcGh5LWNlbGxzIgorICAtIHBvd2VyLWRvbWFpbnMKKworYWRkaXRpb25hbFByb3BlcnRpZXM6
IGZhbHNlCisKK2V4YW1wbGVzOgorICAtIHwKKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xv
Y2svaW14OG1xLWNsb2NrLmg+CisgICAgZHBoeTogZHBoeUAzMGEwMDMwIHsKKyAgICAgICAgY29t
cGF0aWJsZSA9ICJmc2wsaW14OG1xLW1pcGktZHBoeSI7CisgICAgICAgIHJlZyA9IDwweDMwYTAw
MzAwIDB4MTAwPjsKKyAgICAgICAgY2xvY2tzID0gPCZjbGsgSU1YOE1RX0NMS19EU0lfUEhZX1JF
Rj47CisgICAgICAgIGNsb2NrLW5hbWVzID0gInBoeV9yZWYiOworICAgICAgICBhc3NpZ25lZC1j
bG9ja3MgPSA8JmNsayBJTVg4TVFfQ0xLX0RTSV9QSFlfUkVGPjsKKyAgICAgICAgYXNzaWduZWQt
Y2xvY2stcGFyZW50cyA9IDwmY2xrIElNWDhNUV9WSURFT19QTEwxX09VVD47CisgICAgICAgIGFz
c2lnbmVkLWNsb2NrLXJhdGVzID0gPDI0MDAwMDAwPjsKKyAgICAgICAgI3BoeS1jZWxscyA9IDww
PjsKKyAgICAgICAgcG93ZXItZG9tYWlucyA9IDwmcGdjX21pcGk+OworICAgIH07Ci0tIAoyLjcu
NAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
