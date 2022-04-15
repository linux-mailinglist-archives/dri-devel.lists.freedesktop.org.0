Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A319450209E
	for <lists+dri-devel@lfdr.de>; Fri, 15 Apr 2022 04:43:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABA5C10E1D5;
	Fri, 15 Apr 2022 02:43:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2045.outbound.protection.outlook.com [40.107.20.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62CDA10E1D5
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 02:43:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J+FF9fDl5smCUaxLHdzzerEyq0GLxSZ3kYoOHK4EUi2DpqSjfbYNsjxceHy9t0Ip5ZElRqGyVn048mgs0RrL2SzEjGkXyHDnN2AciF1RZn1+3fzH4t8KDZUYmjsasTLCzvs+m6T5JTXeyUrW4tFJSco18xSfiqGucFkkpE2VJ23ZpKGYr7Oqo0KqybOjDIOj/yF4tLmq4V8t7bdi48wpZMbzxt3OIIyBK3fIVp/XiUvN8iSFMfRCkwuBWDXf9b87Y74EyAd/GBuPK6sZ76PAjDitwEWO3yAV7rCvvs0ZOpHscjdIpSmOKNWjcCWFi1mswP+R5v5z3+bTTBG9moKaZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hAYBAL7+SzQueKdJpb+rBSVhKrelAtUcMRB/xGxq8bM=;
 b=jINVJsyVraUpscW3NXMnSj4Be68+9rdmNwz7sZUdt06ET6k/OGeTlcyWUsUyh9hGatA5OWHJEJ03W93f0Vf+1EQpLfIesf4MzHAUe6y6B4LcbYT/U2CICaVlMWHp3GoF4t7aO7wfNLY9KWG+05tBHbyTdKIWNWRrslVb2vr4UWjImpUw4m5UXbmdnnuRz5ToFZSXBTl8V5KA+eYvoDBfTV27wHrt1O95UNEgcCHxJuU2mOONS/U1dYIS8v8tkpv6N8lsxDP1zy/57Skzx40Luw2DhBLw0xxlJSfU4EE9rscLpu0n+C2eTo7aBxI4S+JUYwcVv2EkcZfKTD+Bf0Te2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hAYBAL7+SzQueKdJpb+rBSVhKrelAtUcMRB/xGxq8bM=;
 b=IeTeU0xTSyu0vTEbxvpUhiaIemZFFzfrsYxk4SL0YAxuLFNCSHFFwxwTkooH0jsl1ivkKCwqA3KsPfnjnCG0isKYYxzIncgidIy228Euugq/QR2bUIAsBLiZUNpm8PQECmSPygVRAg1s/o/3tS9st/PdeDxRCk1ewCyiyx2Lssg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB5450.eurprd04.prod.outlook.com (2603:10a6:10:86::11)
 by DU2PR04MB9132.eurprd04.prod.outlook.com (2603:10a6:10:2f7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Fri, 15 Apr
 2022 02:43:46 +0000
Received: from DB7PR04MB5450.eurprd04.prod.outlook.com
 ([fe80::7997:2892:d230:2430]) by DB7PR04MB5450.eurprd04.prod.outlook.com
 ([fe80::7997:2892:d230:2430%7]) with mapi id 15.20.5144.030; Fri, 15 Apr 2022
 02:43:46 +0000
From: Sandor.yu@nxp.com
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 andrzej.hajda@intel.com, narmstrong@baylibre.com, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, hverkuil-cisco@xs4all.nl
Subject: [PATCH v3 0/4] DRM: Bridge: DW_HDMI: Add new features and bug fix
Date: Fri, 15 Apr 2022 10:42:46 +0800
Message-Id: <cover.1649989179.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0013.APCP153.PROD.OUTLOOK.COM (2603:1096::23) To
 DB7PR04MB5450.eurprd04.prod.outlook.com (2603:10a6:10:86::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5bfffed5-94be-41da-7fdd-08da1e89c33b
X-MS-TrafficTypeDiagnostic: DU2PR04MB9132:EE_
X-Microsoft-Antispam-PRVS: <DU2PR04MB913211B69FF2BC55CF26FB99F4EE9@DU2PR04MB9132.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5aQw3iBdXRHdHtwpDV56zX+D/ou1Lmq0RMJZTiC810TMrMDta2LTklQ1UTzTPdtwBiw8oICha9jLMw/VG7rvv/86IzvQe+URamk36qjGoRIf1DnDVpqkqqmq5S4k8gr+QO8F12eJ5GsabOk9wbrCDRLxJynC00uufN4eFAFGN0nfYRuMyFC33B//Nfjq670eVeGpFNEfuJ4jnQ6hqOqTwk9fh7V6t1r6HIwJyjHfbcR+bb23pgqapHYYLGs27TqUb8pxhKCQenjMlQWG0jVZQXMxQjxKsSMgp3CowoegCaRBLqd0ImrrlRlWTY6M6BrBlHypHtKVfuxphzqI6UymZu+XepZqiW0BoXNcLmSoVJkGwMA4HI2tYZ1x0jabyH5+MC/fswXlGO4OSTyEb6EePZ/E2WDpuSUgJ1wy/ywqz/M9RfiD1EuE+TzbTZYV/hC84QmkOfg0zGxBlF0s6PsOMBXhS/i+83PJ9SfQYbYsplbpWaEOX/mimaEig7i2iNRXx9zF4UJvvY5shPJziKqnbgzE+EYsa40xXjoND6g9FkDAN0ZQk5oi3O6Zh6HgJqSRqOVJt/47uYmiXCzwpU7tjE5B7NHMIybUAyurs0tQ5a1vK8xTgM9VgU+VaGRKmKCEJ3Z02FqJLQwP803swnN96jP/iqpOfCN8nh1yUTc8g+HxuebA0uhWQhpy7aqtpNKFfKGcVuzDf/k2TqJJ+4ikWQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7PR04MB5450.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(2906002)(6512007)(26005)(2616005)(9686003)(186003)(6506007)(38100700002)(38350700002)(86362001)(66476007)(66556008)(66946007)(4326008)(7416002)(508600001)(8676002)(316002)(5660300002)(6486002)(36756003)(8936002)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JSZi9RyNK6Z0t/IQBU7DFmyGZRacb7gQRsE1DrqTRab5KxAwrlbMH0X2XHJx?=
 =?us-ascii?Q?BrjpAsiCMqM4Q/BuG+nYjOpgs9hO4UVLOZqF3rrisPaKV5efrU6jPm5rx/Yz?=
 =?us-ascii?Q?RPXWbJ15vD+iRzHFm0mV4CFO3KzAcMT6xA1Oc8mDI4sG49i8TWJpOt60X0Nm?=
 =?us-ascii?Q?mS/u8k2pNWjiiScu52p93qV7D1giGSE783RjhLcIUS/XDKX/CnArZjmO1Gwd?=
 =?us-ascii?Q?HPXqm1cpVzBeg5smZykKN+zq0lNLWWNRmDHTQoVblgOPdM3Qm11xvlu/btTM?=
 =?us-ascii?Q?lz7wS15g2fUaKSqveHo88e+rOILD1Bab52la63XC5RrycmMrzQCrz164Tyn/?=
 =?us-ascii?Q?vOItwUhxAyNS1hO1txiFztsVMb9Sb8cZpyiRzyJM+M4tOLyN3pTE23uKTrUR?=
 =?us-ascii?Q?6mfxygRtw/76eHLUkbjXFHOnt2wDYKSkXxSBdObmcf/81YIVTaD6vEhxc3An?=
 =?us-ascii?Q?/EAsmInIs+DDygGPT82ReRG9eiwO3DGIcjqQXs807a5eQJPjTygqfbFtGOS/?=
 =?us-ascii?Q?07Ii7mqutOGYFBIAALXz19JsB9CZa14+c2/Sofh9oHLsyyQwBhnbqiaT18AB?=
 =?us-ascii?Q?3Mm3/aNdbfY9/YTFaEtPNEBmZIxy2RmUp0F63+moY8UcxXySHkfc0YfSr9Te?=
 =?us-ascii?Q?otDopTFr7T4bcbB1qrwNT4LCDZCl1KjAOxZfLFmG/4SXcT6tgxz80jeSgrsA?=
 =?us-ascii?Q?zvl0YNHhy4s1SkIA7XSluCXnQZDQoELaFuL3ink7YEgtSO6DGCgIFYnndU5C?=
 =?us-ascii?Q?TJNyhwqGPEayRhiECBCfVUYztOYgZdVi7YpVxs5sDtiR7YY3eg7sp+LPRW9P?=
 =?us-ascii?Q?NxdNc9HbP72nHEIU2ktpmEhd6uXiu0D68UFrAmVaBmZrppG/+bxKUCWoe0+g?=
 =?us-ascii?Q?j+P3nyv2896rrZxiTIcSEqKf4wiyTYD+tW10zfRrGhViamE9zRVM6Lqt1uGw?=
 =?us-ascii?Q?tFm2TEKwXqgxmQ4OOKdSQRvMqZFqci6D21Y9IfaR1f6/4VAHyv4CrYdC9uqU?=
 =?us-ascii?Q?4T3KDjmk5nax6GdgWMny8h6W6mmaxVzHxi+EhKyprUkkR7nvvGW25ER9t6xf?=
 =?us-ascii?Q?LUCu9jxjId1ozxJf9LZmiYlatm8HWXMQ46dMckQ18jpBvKz7V3NV+alRo316?=
 =?us-ascii?Q?BhmlNlZyt9HDSckEEHQCKcmv33svjLzYxoCsEyPVDrY6Ar04cegxinen3FmP?=
 =?us-ascii?Q?u/VOtsAdE6GjMX0xnoAX5F27jZZKcrlY3nkTipUr+t3knHBMOSIIWvpu21MT?=
 =?us-ascii?Q?2Xn3V2AmVXQE42vx3Gx/s07mBqvVDYf1qzS5EBfXUJbFaM2PQ/VWglKMCLa+?=
 =?us-ascii?Q?aDcczWZjqYXF1JGKEcitIrOwskCBBH8ARUn77yCMbod/F+BLtfGXBhGiOVI/?=
 =?us-ascii?Q?vb40U3/RYryjJ1GqUsZ/Dh/2DZTE7dFlW/41d6AwWUUk3biL4jG+2BLlNrmb?=
 =?us-ascii?Q?NuTELK9utYx1q2Pe3vw4YhyRmFoczggEASl0tXod9vDRDv91YFwtFPd/yPM6?=
 =?us-ascii?Q?YvlrPqRnfaAnO756rmubiMOYOrHjRsieAQHHcITq3272bY0t1QcKzYj/M17T?=
 =?us-ascii?Q?L25DGij+GKl6kikoInyAI7sNm+PlufdqbwcsIUunUKSaRKetp+DkZ7jUi7QO?=
 =?us-ascii?Q?HcGyiA0v/CwPSFUGO0bkS3O1dtqwa8nVOKXzyn4PVHYv20/Ypw53cHMrLifZ?=
 =?us-ascii?Q?ye90gHGqb3iY4mVWlvZmvEvymlwWHsrcmKqlNscY8/JsiBodLpjHaM5ZTs/y?=
 =?us-ascii?Q?v7jiwJFu2Q=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bfffed5-94be-41da-7fdd-08da1e89c33b
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5450.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2022 02:43:46.3186 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: orfLpY02LBQPck1ftM2iOx/tiEv2nltiSjPv/vTyo72HGU60LZh/wKM4VoZXAtboDdx+f1XYIhVa0Juy5t9Rlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9132
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
Cc: Sandor.yu@nxp.com, shengjiu.wang@nxp.com, cai.huoqing@linux.dev,
 maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sandor Yu <Sandor.yu@nxp.com>

This is new features and bug fix patch set for DW_HDMI DRM bridge driver
that has verified by NXP i.MX8MPlus.
Two new feature added:
1. Add GPA interface for DW_HDMI Audio.
3. New API for reset PHY Gen1.
Two bugs fixed:
1. Enable overflow workaround for all IP versions later than v1.30a.
2. Clear GCP_Auto bit for 24-bit color depth to pass CTS.

v1->v2:
1. Save CEC interrupt registers in struct dw_hdmi_cec
2. Restore CEC logical address register by cec->addresses.
3. Default enable overflow workaround for all versions later than v1.30a.
4. Add clear_gcp_auto flag to clear gcp_auto bit for all 24-bit color.
5. Remove i.MX8MPlus specific reference.

v2->v3:
1. Drop the patch of Add CEC Suspend/Resume to restore registers.
Because it is not a general feature for other SOCs, their CEC engine are
enabled in suspend for CEC wakeup.
2. More detail comments for patch GCP only for Deep Color.
3. Address coments for patch GPA driver and move enable_audio/disable_audio
from dw_hdmi_phy_ops to dw_hdmi_plat_data.

Sandor Yu (4):
  drm: bridge: dw_hdmi: default enable workaround to clear the overflow
  drm: bridge: dw_hdmi: Enable GCP only for Deep Color
  drm: bridge: dw_hdmi: add reset function for PHY GEN1
  drm: bridge: dw_hdmi: Audio: Add General Parallel Audio (GPA) driver

 drivers/gpu/drm/bridge/synopsys/Kconfig       |  10 +
 drivers/gpu/drm/bridge/synopsys/Makefile      |   1 +
 .../drm/bridge/synopsys/dw-hdmi-gp-audio.c    | 199 ++++++++++++++++++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     | 186 ++++++++++++++--
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.h     |  16 +-
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c        |   2 +-
 include/drm/bridge/dw_hdmi.h                  |  11 +-
 7 files changed, 400 insertions(+), 25 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c

-- 
2.25.1

