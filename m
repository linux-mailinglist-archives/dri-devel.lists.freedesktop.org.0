Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB20A4AFF88
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 22:56:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8694510E5E0;
	Wed,  9 Feb 2022 21:56:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70081.outbound.protection.outlook.com [40.107.7.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66BC810E53D
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 21:56:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BelQHjsTDp/ynfPy2Xid0mUbaTa84iJl7xWyEcYWnCQzp/6mJal+BtZbq7DBq8Row4kTC6LJp1EfnUaHr/8P2DlDozWVplVCvJ6pxWAgeoPy0kHfFm/b4jeuhAXFwXB5eAWUjUFky56GvzBcRqSI4wnqpyazlDlD5stMDF1LEEtxhRwDi8bLY1HfYUXGjDFWo+4sqoYTdnREKna5I/lqJ5RcLPEj6P9eWsxvoz5jkQeRCcNNM13dZY4bMKNTCdzfxqYzH+ju1mkx08b2rCH3Shk9rvITND6Sme5TlQxusPp7vXyd/PcOcRY9SaztFAYpgD03cTMjBycVGclKqp1buA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8+ZeP3sg0/Td589Z2ryGgBECGTfyTWxkXdYv5CB/8HQ=;
 b=Qn8zrXW0aN3AYX0mg8epWAEiEfHZ6nBkIGwdkVodHfbCljaKtnHMj7IhmNMF/QpqkSJ5M3bcNLQ+5GrPcQkrQpIs3yIqZ7rJx8cC5GWSVq/WD+XUT9M2dg1ch8dHH3iaWEmCkLj1Bgay+XyeoRwMQ0xUwdb+OFtb3vC6R/oNL7u+OCDnQiC6Wdq9xaYu12S+OJOSKNxQOX4iEXwCVkTfaHWljgAo58qCJv2rcUtFNRc49VohomEEUW9Q0M7NIpViF7QcUvzpHmUB31flTgQucgVP7eWLzGMxYXxCpKSMRi5eghKu3BkCCMaCuKkqUeGIlnMfNqGWPajKVP6+SWk16Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+ZeP3sg0/Td589Z2ryGgBECGTfyTWxkXdYv5CB/8HQ=;
 b=wNnl3fQLgycmW11MxnQKzYXo7McpxX3uHvqpjAsxhSvcyAFUes/Odia5jWsrBLd6gbjcc2RM35CSzwiktjz6saFEwhMDD54xCr2DqU1NoqpMqUqJ81utvl483SfHCBTLUyi1xhAV1KKM+VtkcXqQr+xoMlVQIfo3Q7tnDY8xVPo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from HE1PR0802MB2426.eurprd08.prod.outlook.com (2603:10a6:3:e1::23)
 by VI1PR08MB4575.eurprd08.prod.outlook.com (2603:10a6:803:eb::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Wed, 9 Feb
 2022 21:56:02 +0000
Received: from HE1PR0802MB2426.eurprd08.prod.outlook.com
 ([fe80::e14f:197:5001:4c56]) by HE1PR0802MB2426.eurprd08.prod.outlook.com
 ([fe80::e14f:197:5001:4c56%3]) with mapi id 15.20.4951.019; Wed, 9 Feb 2022
 21:56:02 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: [PATCH v6 0/5] Add GPU for RK356x SoCs
Date: Wed,  9 Feb 2022 22:55:44 +0100
Message-Id: <20220209215549.94524-1-michael.riesch@wolfvision.net>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0197.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::8) To HE1PR0802MB2426.eurprd08.prod.outlook.com
 (2603:10a6:3:e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 12851dd6-0c72-49f5-82fd-08d9ec16f6a1
X-MS-TrafficTypeDiagnostic: VI1PR08MB4575:EE_
X-Microsoft-Antispam-PRVS: <VI1PR08MB4575F4E0D00F500599FB429FF22E9@VI1PR08MB4575.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AL4k/Uibvr0U4yE6pbwo5qXoB+25aPyJx/QGpdNPkqHHCwiJ9jUoHlxMi+2Hh/RV/5a+PqmUPmWh3nn43pMv0hSeXosZHfN6xUetSH6JxzaSxHIp8sagtu5IwxT6BTjkjILF1+QAC6w4X0vAb/Ydo4PAqK8Nn7A8FEqiA0K99omNK251isOEMd7hP5iR5XQEFsx1tlKjFNnbNFMLSY+R2JxxkM5APJKhb+ArBMcSWAJH+fyHsmFFVSyxn9EMF+P4nfXgap+ZtEytKiVjT6t1/D5zx169WBV1Oa3F12pJAz3XVhDniE2e5skbjifi9SNvuq7YhgqH7uI1D7Z62jG/5v8jbdoJW6qXr5/SxUmOfUNJcJeMn79HeIFIhXegeMQo+NCXDiL5C9a/w73d7jYL5ExJ1E98gpBTwnobHt8qtCC5zcdfIvq7p648Ia1EdPKtdluCZ+caHyf1Dm+Fie5k26+v+s+MMsn2SXKiM0kMCXIzhnyF/s5VyJymYTr/fwsUfUv/irDJn55Lb89zFk6/v1MrFss+UkETQMc1kptt3/iog8iYmelTNuje9D34aFAii7j0DLaiG8HirV4jOt1twI2Vq3EPpd+8h3LQ3oMK6duiYdkoCmWTM70O5zl1mSbdWp4vzjvEEkSXcNuKtEePjGJN5VXVs+ycnL5w6MxmFH8sQlQZ5QyIHP74BBsGrou4OHyiYToVhte7q4SHNK8UkGIrTCNjLrqrVjVNo41viduaT6ZIiBYIFEWpWqbtaom/WKhRl6sSNEgxRpOR6WYPfQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1PR0802MB2426.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(6029001)(4636009)(366004)(6512007)(38100700002)(2906002)(4326008)(508600001)(316002)(54906003)(52116002)(36756003)(6666004)(6506007)(6486002)(966005)(2616005)(44832011)(1076003)(86362001)(7416002)(66946007)(66556008)(186003)(8676002)(66476007)(8936002)(5660300002)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9Z/CgbYy/J7B7tGFrQixvyaY/13RIz6MUKZeejuiFzGD46x8sEDVn88pNlpc?=
 =?us-ascii?Q?8wvzAvblWBhg06K21JcMiZsiXo53daC45IydbBcp0s33mqqGpd3kypZIHvaC?=
 =?us-ascii?Q?prH4VU+vUmnPAaR04ZP8Q3xwPp6/UWuQabN1CNDQXlJmjropM2VGn7cEwZeP?=
 =?us-ascii?Q?b7AWwDgZP6wq493mGjpjWZTzz9NcXvQq317EQpGHu8Itom7N0b7VL1JWP4UW?=
 =?us-ascii?Q?xACwMWa+CYRAXcjHgouBhJ2rsCnGcrGyfPMLqLWKRB4+A62BWDEBsidchyq5?=
 =?us-ascii?Q?xotPSQVJ7WyF0+9FMeKvz4DQSsJaGZ7ga8Q6/EXDA1cUI9Ix1zKfy2qn2ASW?=
 =?us-ascii?Q?/CVzgvyluf6fm3z2who6uokKFW+urf50R7jEFs77yy4hdLEjbQ6JHR1wtCaJ?=
 =?us-ascii?Q?aukOHPa05htGU/1NyrJy0mZJNyKXsgvylgjqEETCuwtp3jiG6OEM4LnTtwA0?=
 =?us-ascii?Q?ndRbePXAPDyOKIXfpv+W+gORkdyYIDRn1D39+7+DxhSnTFghKkeS4790Lb1Q?=
 =?us-ascii?Q?FlphT37N0N7Nvfgk7A4vCvHEGv/Zvkz4V2HTxxvIPVZz12+bznqbceD+mkvE?=
 =?us-ascii?Q?gBGDs5BNQR1UUZzMuiDa9i2BbSLz835Plh9DK0DAWUFi0cPKo+WZNYO+syNa?=
 =?us-ascii?Q?bVFfsMTQKRi4Fbf6Z+r0gtD66oT1hQjagd6OqwrcgDvwji/TNd5FVqX/uwI6?=
 =?us-ascii?Q?FY7Tc4nURT4GWZ/iIkAwbBispDkEXmOrcIbOF6R3odTPni8sJ5RCGDQGFXXm?=
 =?us-ascii?Q?crA8qv3/YbQdjFlH21oUOqkngMu/fK+dNHjcEPgpm9uXxjrjA2NPrJUifGFA?=
 =?us-ascii?Q?7FuFSFcMGAqjjDBgslEBnoh96cfpo7DFZmA/Kyqgs7KkAiFPh9CYHv4P5fi0?=
 =?us-ascii?Q?cI8TXVF7k+giH6fAj9F43o3SOcZ+/3gi7doY7vJJuMqYIkmx4zDreXEzGsPk?=
 =?us-ascii?Q?4mt55qj4GwjFdB+Ju4KvUpd2baklUK2mjM5mqQM61DFICp6vSR5uvgDgs+KW?=
 =?us-ascii?Q?abUMqyMNapWMfF8ASb9ZyPpdOUqnIBSpTH5dCpGwV4WguRDiXIHVluallodK?=
 =?us-ascii?Q?asj3h5G3XEO++YuR8ZMeKjpxEHp4E+ls363UZ2knPmbEOi+/63cIMX40TG5Y?=
 =?us-ascii?Q?x8x8id39B0ysGap0CtHJrWCdwe+SWfXApBVVL0njYFRnsA+BTEj2RndH3nm7?=
 =?us-ascii?Q?584zGDRzWFlaDJWzEn0z/tuguHxNxv9qT5agx+w+S9xZ485+qlV9WKN7CY/b?=
 =?us-ascii?Q?Meef7XvZR/fwHOYXifuAY8JaXfAR8ws+YfdypBr9WR2eMcsGbwJaYfN0uIA4?=
 =?us-ascii?Q?QRJjm0i2+EF4+Brm9g4MpNhdm7EqGApIjNxPjkKAZ4HbVEmJi4VG+n9xGkmj?=
 =?us-ascii?Q?w4voj4tv6S+lS04dH9TXXeUcDBmlBrpGo//shFUKZGyoPUTNRAtok3O74hpC?=
 =?us-ascii?Q?2kx7WftbBcKPc8nGzd9QLk22RttW/WbfupN8y5Lrqhhi3w6aUnIwZRAAvTD8?=
 =?us-ascii?Q?IhOfoWsWTv0sCdZrhoSY6Qq9VaVcnU/TC38nRXebsh0mWcidOShTivWRl2Tg?=
 =?us-ascii?Q?YqsxCycIwu3bgE2JRxJB34sF9orMHXLaNGg28KNICxoNDY0Upk21Rmy2QTnF?=
 =?us-ascii?Q?/+3RJnM9bS8zxfGnXOIqgK6nnhQySwGQYJSQno4mtDrHafk8iNvtIos1eGZs?=
 =?us-ascii?Q?o5BwEYwjDEo4pfBbfiVW3Nn0CNBZ7nPYKb10MqLnjgD0Bj6uOeKeWuDLxBqa?=
 =?us-ascii?Q?pkv7Ae9d3X3gUnhFzKAFws557ZTQnpc=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 12851dd6-0c72-49f5-82fd-08d9ec16f6a1
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0802MB2426.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 21:56:02.4288 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v0GaM73yMgA5j+kzLHbUCJtM4jXUpcqDum7PexujISXt6T2YQYyc975Puf6WyDkdy47KHq/YOjt3xkyFIajE9/DID1ugK0u1n8e9Kxee9eM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4575
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
Cc: David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>,
 Alex Bee <knaerzche@gmail.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Peter Geis <pgwipeout@gmail.com>, Liang Chen <cl@rock-chips.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

This series aims to bring the GPU support for the RK356x mainline. In
conjunction with the VOP2/HDMI TX patches v4 [0]) it has been tested
successfully on a RK3568 EVB1 with weston and glmark2-es2-wayland.

It should be noted that on the RK3568 EVB1 the supply of the GPU power
domain needs to be set to "always-on" in the device tree. There is an
ongoing discussion to provide a clean solution [1], in the meantime one
has to apply a hack.

Looking forward to your comments!

Best regards,
Michael

v6:
- use existing clock name "gpu" instead of "core"
- fix missing space in indentation

v5:
- address Rob's comments, describe clocks in SoC specific region
- move gpu_opp_table so that nodes without a reg are sorted alphabetically
- add GPU support to the RK3568 EVB1

v4: see https://lore.kernel.org/linux-rockchip/20211126151729.1026566-1-knaerzche@gmail.com/
v3: see https://lore.kernel.org/linux-rockchip/20210805025948.10900-1-ezequiel@collabora.com/
v2: see https://lore.kernel.org/linux-rockchip/20210730164515.83044-1-ezequiel@collabora.com/

[0] https://lore.kernel.org/linux-rockchip/20220126145549.617165-1-s.hauer@pengutronix.de/
[1] https://lore.kernel.org/linux-rockchip/20211217130919.3035788-1-s.hauer@pengutronix.de/

Alex Bee (2):
  dt-bindings: gpu: mali-bifrost: describe clocks for the rk356x gpu
  arm64: dts: rockchip: add cooling map and trip points for gpu to
    rk356x

Ezequiel Garcia (2):
  arm64: dts: rockchip: add gpu node to rk356x
  arm64: dts: rockchip: enable the gpu on quartz64-a

Michael Riesch (1):
  arm64: dts: rockchip: enable the gpu on rk3568-evb1-v10

 .../bindings/gpu/arm,mali-bifrost.yaml        | 15 ++++
 .../boot/dts/rockchip/rk3566-quartz64-a.dts   |  5 ++
 .../boot/dts/rockchip/rk3568-evb1-v10.dts     | 11 +++
 arch/arm64/boot/dts/rockchip/rk356x.dtsi      | 76 +++++++++++++++++++
 4 files changed, 107 insertions(+)

-- 
2.30.2

