Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 17CWGpuGrWk14AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:24:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 009AA230A3D
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:24:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AD5610E465;
	Sun,  8 Mar 2026 14:14:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="MPd4lYHw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012023.outbound.protection.outlook.com [52.101.66.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A16BA10E120;
 Sun,  8 Mar 2026 11:43:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=br+L8QcUv8447SfmCOUZ5D74CaSX/WR6JwrMVuffWZPT9NCjMZ95BDzaCIihta74EEm0vJRmMf7oe4pfyMMEGdvkk24r1ufuLptxVcH5vDAXYgOi+TUw7i7XXdkp8lg83XtFwowd63dFp6rBwbIdcY5UekQmedc1OVBBr/sIgOcEGjRraFiq6kfuBM/nVbSgXFx2cQ/L0Tm76e/mR3LlAsnzli61VPljGNafZJTEMME2f4P/VErOIxhIapdudL2k+PQCJ8riGDlRacfSXHYFroR0+DLHoSlcFUv5qq/ul5de3YtfneKWV7FGg8oPteNdSFXNQZcKXfTiSn8OX/jAvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RijQ0GRPBLyY/+LeJDuMR3eJDlEGbQ7rxDWE/pxE4tA=;
 b=MnXKEFJCrRjGxXLoRo5M1vyFuuIgPKHmP5fWNwjMEnaGpsx7TfPGX13x3D33dT1lPrOLWCEQv0c0mWcvCM0ePHQ92ijSPYN2IZSypsMNF95GkM6xTqu8hh8BZ6Js8Z2kH2hA9fpLudLCMqjwfaZhTiknKAMVa+SQlDKWc5UbtmHcTm2PZNTCT8ZmPBg+ajfUe44LRUgHamUJg7ioA6m8O4vGkR9SWHMzHy474DNBROlsef5YALB0vF2fld9akk9TwPbB4hE4agB18l+R0IDOoZoThcDd/j6nDuvQz+hGL2EtV2txT7W75OX731uyTpP+PRNIWIN86yGIP7fBgaXyxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RijQ0GRPBLyY/+LeJDuMR3eJDlEGbQ7rxDWE/pxE4tA=;
 b=MPd4lYHwSqp9v8m7xn/9iNrZ2l5OPfN9MVx74Ff6Oqhd57tdfrXpB+C/d/jlmRF0Q6uZ5QNG0BNGyu0n2Nq9/rJHQVVDsxoQ8P/8HjgTD4PB30+O/+xGRGAl/9r5tsI+YRKUykxeEY2r6dd0GU+SlzBAa8SFGelRpFrq5ximi3X8Li7N+oH7d4ZhHWu3+CaJXjhDHVXO0cHBMBRWmGAuDU9TqfANIpaEGfWNbfhrcfhLSikq1Rpi52Ot7C5lpqI+XA3QyDTuZm4oMXVQJCManoK/veJWjKFK1ZQPTfZkxd3nitQ2bRlhxHFfLoVGk+SAIFwC4CUTNR7kEeO/DC1CHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by AM9PR04MB8211.eurprd04.prod.outlook.com (2603:10a6:20b:3ea::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.22; Sun, 8 Mar
 2026 11:43:29 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9678.023; Sun, 8 Mar 2026
 11:43:29 +0000
From: vladimir.oltean@nxp.com
To: linux-phy@lists.infradead.org
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 spacemit@lists.linux.dev, UNGLinuxDriver@microchip.com,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Subject: [PATCH v2 phy-next 17/24] media: sunxi: a83-mips-csi2: include PHY
 provider header
Date: Sun,  8 Mar 2026 13:40:02 +0200
Message-ID: <20260308114009.2546587-18-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260308114009.2546587-1-vladimir.oltean@nxp.com>
References: <20260308114009.2546587-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0255.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::22) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|AM9PR04MB8211:EE_
X-MS-Office365-Filtering-Correlation-Id: 1992279a-4c5d-40c8-a014-08de7d07eae5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|19092799006|7416014|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: 6LzvlNmu4l5ykt/pwbhukV+bSrtd5eWu0jA83BEGScLO9lIMcMdH7fYMQxNTVhCUTZ/k8if3JlwdkPHyWyvDYyXilnuoir/PifO0PFGh1cDINPOIXnUu3EgdWYPAqvBi9WEiT+sYqia93zHBWwESZaK5hxFjyKaONN9KTGDRHfEufgEIH5NWEZeOelsQgD9TvFl0Co9kNkAhEaUQCDc5J4M5zVlAztaXd102WsjoAnMNtOpmwNDgtpaCIosrFd+8oL6vJbNoX7amfBfWui85ACCrv4lG1Z0KJLIlSfFfTy+vmN31SFnr8a6DzccX3kmxGw0aPhLfTwBkwkxN7xJD4h7PBSvcrpCTpbyg7OJs718lGQdNwLk988f8W1eR2pCznbwxAVxfg8sWovbTlHs3VClETpShjRUdDe8fc1dr6ytXA9i17TdTTsRdI6Zn6BqjVWzaIVauYtOdHtjUDb1WkNOQH6E0BIvf4/ZlayOf+eAagnguJy599qge3aMQMdJeljDUMrWvzXlXT3y7w2vU3sktoGlAVMIWgTWaTA8WI09jSxR8qzV5dTyhEKhRcdPkYQxmk5qUc7RXpe4Cu1gIyX434DhzFh0vN9Gm2BCGa/vEVeEzeCiAd/rSTH+I/NDKzmmNcT7Ugo+TbaPfTWCyxfC1tfzH5UQHTQd8KtTgnW0YqR0bMUNuY0FmLr2OeXlPP3cgEQ/caCmRB99Nn0NGvR47VXxTk/aaxTmzcYwGEY8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR04MB8585.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(19092799006)(7416014)(376014)(1800799024);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KoIJNXwZdwKT9gCNvwhwpIDV3CHH+ATfhgl8bnN1ETfAdTVa5eFKsed5dZ03?=
 =?us-ascii?Q?dodRTLX/8k2JHgfWOHtWM55zYZmZICPKKgxounKFmv+oxIv2F4bnFBYKCWyl?=
 =?us-ascii?Q?/f6Twwks7pzeeb4KJnr5G37WiWtCoNYXy05xle376CKGOrOTj8t0VjILiCIc?=
 =?us-ascii?Q?AjO6Igesrneev7nRrrUEWh9M7gvr9PbEozhtwk57RyUbQ3liBS5/7khIlSNP?=
 =?us-ascii?Q?YmTwY3R6LmBhiVC5yI439Gu20ZTjde9LJarCcgCO/eLCQn4PS8+eOSsFmG89?=
 =?us-ascii?Q?Rw2+zS/zeOb13O3OCE/GifcIB7m+EMy0FocjgTfHyIKuQWhSHdw5LyiCfRw3?=
 =?us-ascii?Q?MkFIFCe20YUEOSpujTae61//i8D2+zpT1xbWPnqcsZL3lcmi/vHRhS6m+9gX?=
 =?us-ascii?Q?dBirpHOaGFpJYBLfYrs3vXREdSgt8Sv9ZBI+GHr4XodlxXck/6VO4y0/LWf5?=
 =?us-ascii?Q?DFW7rZSqfO9bIngTP/lSgdWZkFAaEte5KujsV5AkbOSw+zm/q1CES7GKj1vB?=
 =?us-ascii?Q?iAeaPVxY2Ugv2AHKE4pibX8gIvIa/jJXdzOjAzHb6IDGWt7apC98ATxQBHtm?=
 =?us-ascii?Q?qq1sHqpgCFn8RVlcS4+1XErZwDPpuh/BO64FGK7QzxGqpUC+Kb0OnlYDEdiB?=
 =?us-ascii?Q?7XNl+epsNcXJgDRAlaLUv2G7r4lUKX5Na3taJDFfT4uDShhDQwibH0HhMdlW?=
 =?us-ascii?Q?PPcGdTcTiaQpe3W0jqh2QUhWyZ/QmTZOA4PJcMx5Oj7dSj2Wi1zLzQPhBNFN?=
 =?us-ascii?Q?UIpOx3xyUdYuN0RBylrdSAz1TIGe4eAW9UWpssbtJP0dd/l09cQZV9HvA1sw?=
 =?us-ascii?Q?kiw+HrQowKawBVAFoydJB/6LJkoyPq3FCFadikH4U24K+mZXxtsLZ23gCZQ6?=
 =?us-ascii?Q?qydCYV/5XXjCvxD5V/r3k11mn9RX9h2L90fiPehc1Xigh9A5+0lTRIGM+tZI?=
 =?us-ascii?Q?cXwqXyCFSQoKWwSF4Cgoucf1jTyPWxlM4knlcyNcIIhJNA6+iPybZHzuddmA?=
 =?us-ascii?Q?F7Zoi5rIdO0h/fxlcZY1Iv7R6bsRGV/ShgcJbvcju3++PyKIAIJHwLsgDaPD?=
 =?us-ascii?Q?15Vr9OE6ciXirt39vw3lVLeHPvvanUehr0nrI29ujO8YJhfuYIlYfmNvOKNm?=
 =?us-ascii?Q?TuFqK+UJs+AzVn/zhHzUWU+jZufIaMvIw2x6fTj0/+f1z/tsh8/WL3INvKPs?=
 =?us-ascii?Q?dqx+nFKB12At1sdfMQ+3w2PHMOIC5OCcsEr2OPKAuFY+eykjB2H5AeZyguK5?=
 =?us-ascii?Q?9koL5ncGdMXVaeTvO5yehNGKvY14v5IDP/EkNuzCVgJ3hUeMhb9I5C6IK5VR?=
 =?us-ascii?Q?HdWNaz7z7d08KXVzeCPX3GIw4zBK1byRPvmLKyk7q/ASU5NBdsqRwJgDF/5Z?=
 =?us-ascii?Q?SrIArK3Jf5p9vL8r5b7y7olhS/OpAmzNjr3GswwQbpOGDx4X06jD4hIjF54z?=
 =?us-ascii?Q?qIHmHXxqcRrKIISaLpQh0LTNsfmlxdGQHcai2tH1APGSS9+YXOZVVP72UIy1?=
 =?us-ascii?Q?yEBCS2lcZnnvvtrmPM/JlmjOsmG0cYB5l4uPNS7bKVhKULj/jqt+1fo5zyLu?=
 =?us-ascii?Q?eWORPk04Bkn2i+smNv0aqpbWp7cwVlsWLnSGw6aTkTSEc/9GplNCM8isvfeM?=
 =?us-ascii?Q?u8NMUeXR3QhVgEXEoK6d52s4igSBH+0xYIe6s0vLS4iOetPM7E28Kq09/xls?=
 =?us-ascii?Q?+qa6nen3l8qLgqx9SKyrUqJWgUcuIraBa4UDl1tq4Uz5NgI3egW/wUHc7JDr?=
 =?us-ascii?Q?eINNy9Ktxdfsh6FYBtnRqhPDihk5asB/1bmpxQeEkvabO3LthaSLJNssSYJ4?=
X-MS-Exchange-AntiSpam-MessageData-1: oUAyHdzoZMwgRj61hWSw3lYd/o7/me1m2CI=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1992279a-4c5d-40c8-a014-08de7d07eae5
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2026 11:43:29.3930 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TZG6s11MH4xmq9ezxm7CeS4yWNgmpCnI++SyOmw9Dv6kKZt/29hECL75NDp40qkb8K0Zm7YI9b4v+UrhtHsiWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8211
X-Mailman-Approved-At: Sun, 08 Mar 2026 14:13:21 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: 009AA230A3D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,lists.freedesktop.org,lists.infradead.org,vger.kernel.org,lists.linux.dev,microchip.com,gmail.com,sholland.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_FAIL(0.00)[bootlin.com:query timed out];
	FROM_NEQ_ENVFROM(0.00)[vladimir.oltean@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Action: no action

The introduction commit 576d196c522b ("media: sunxi: Add support for the
A83T MIPI CSI-2 controller") says:

    This implementation splits the protocol and D-PHY registers and
    uses the PHY framework internally. The D-PHY is not registered as a
    standalone PHY driver since it cannot be used with any other
    controller.

However, this does not matter, and is not the only instance of tight PHY
provider <-> consumer pairing. According to Vinod Koul, having PHY
provider drivers outside of drivers/phy/ is discouraged, although it
would be difficult for me to address a proper movement here.

So just include the private provider API header from drivers/phy/ and
leave a FIXME in place.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>

v1->v2: none
---
 .../media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.c b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.c
index 24bbcc85013d..1143feeb4fcb 100644
--- a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.c
+++ b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.c
@@ -4,9 +4,9 @@
  * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
  */
 
-#include <linux/phy/phy.h>
 #include <linux/regmap.h>
 
+#include "../../../../phy/phy-provider.h" /* FIXME */
 #include "sun8i_a83t_dphy.h"
 #include "sun8i_a83t_mipi_csi2.h"
 
-- 
2.43.0

