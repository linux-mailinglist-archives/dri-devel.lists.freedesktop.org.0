Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E248259D1C1
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 09:15:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B12BEAFD62;
	Tue, 23 Aug 2022 07:14:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2138.outbound.protection.outlook.com [40.107.215.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F10B0AFD57;
 Tue, 23 Aug 2022 07:14:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iaXLr4EdMSA5WCeR9cvA1Vzv8QZyvS5eOUogUYKmbXVcSj99p8bNs1c5visfrB+dL/RpFcTMMyBpEHz+Zcwxx4b9GoKwz9mo/rEoyQtOySlKFc7IYrz/1cz0X+DphOCLOIs5WcC5i6kVWl/RxPqbSKDeFGHVcm1YcouBH6LEqqOWqjE3uMxVJkH9LDF6q1s87AkRmDpCrZiqszrLqSECZMZLMDbeyptecpfas8KFbQ+FNyNiOFbOxAMz8GZORmgbvvafh7d6EgNCmxVs1VSI3CSnnZ6jmPuS6OfNcEvTHJbcO/bUXFIm6/UNhqXgdXoN2H4+RCRAOKglSd94A9zmJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jqTYgpmA2/CsH4qvbQpsKKPLYuXjR2N63sSOhaOzSZQ=;
 b=Rge48lKk9g5RBJ0VHgM1Ly9mrU8AWa9w/x7KwhKmbBWYJJjo+XFdmp6vW8hguSsPCyLoBhVB2lFjaJSWHK+eGajmVjgHQz5NVr4qY7ZWC49KNGzogpcvqUYl8LnNxbMpRgBc+LF6jCwaxXo+JpNDneGlHynMcY8/UmnpL05tG64mWES6PsA3pzj3GuybreYjTipsK1/8ARQaaEn9IEf2Vs70cGCBwZcsCq7oa9dMOAdj6/2OpumY36NqfALekZ8Z3UuSybQ5wbIV66EaCBsft6KdNiTqYNRNX3VmgzgqMhWm+aXjv9G1hSv/BJfEnBnO5iB5UrttDV/axmBYUR7LuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jqTYgpmA2/CsH4qvbQpsKKPLYuXjR2N63sSOhaOzSZQ=;
 b=CYuyQH8BPml7xHCYPA9hOI4GCByk1+PiW9PdEmGDczd/ODUMAl48diliAqSYPBGgZX2YNkFw10cPoZO8GwvEvnmAWerrW5jTFz1VHRnb4PwVd8TcdeMEtIyr3ReICVhgG4cTsAVoreJIyQrPImcipF2pZF39bKK5YuB96eEVvxU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4021.apcprd06.prod.outlook.com (2603:1096:301:37::11)
 by PU1PR06MB2359.apcprd06.prod.outlook.com (2603:1096:803:3a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Tue, 23 Aug
 2022 07:14:37 +0000
Received: from PSAPR06MB4021.apcprd06.prod.outlook.com
 ([fe80::5c66:2101:a7ac:8df0]) by PSAPR06MB4021.apcprd06.prod.outlook.com
 ([fe80::5c66:2101:a7ac:8df0%9]) with mapi id 15.20.5546.023; Tue, 23 Aug 2022
 07:14:37 +0000
From: Bernard Zhao <bernard@vivo.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Samson Tam <Samson.Tam@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/amd: remove duplicated argument to &&
Date: Tue, 23 Aug 2022 00:14:22 -0700
Message-Id: <20220823071426.26015-1-bernard@vivo.com>
X-Mailer: git-send-email 2.33.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0057.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::20) To PSAPR06MB4021.apcprd06.prod.outlook.com
 (2603:1096:301:37::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0775d4b0-fff3-4b72-e273-08da84d7232c
X-MS-TrafficTypeDiagnostic: PU1PR06MB2359:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GJ64khzAPA6RXuI8dRHON/duMTeF21gfypPuDssEFsrDxz064yx/ceeWs0wbWlK+zLFQ78uidVeUUHUFzwRp6vwDDdNTlnsKQVxVnCOTVCc3Mob30EoYg1Fs1Xq6WKKISRwdM/9yArfTOi6mxdX/cfp7zyIQBEccQppp0vh+zf7IsEaxghFCsG2oSw4ZYyfG0bucTTnGHXMdVWdAgUmQTvkEGsknN9fEIgnSRGMdTIgKEs8Q/cKQJxM7AiCDiO/IZUzzxrdc3qKSrADUklEQH+Agfg0S1TBrd8Ef5221aMHW3i0Gr3m0lstZV8kW7d90U8TbYTFOl6iM32E9/QKuYp7hOYgsO2qfqvcy2wRQy4UzBcRn9vXDN80qQ0S04pGMesfq51jeXq/FSL4Ny7wgVUCvwM+3dwQzMIlRNvc1C9mxh30XFVJQPEfQZs1IWanQiczgAGhiJbbQWykY+DiEpBKoIpgDylB72wQuvQyjWRtNEZdGP0t/1ebuCPpOxHMRRzy8abh2FWonXGzbs+wKOoOFvGVGnXEzAR9hG2S8XQiXcBkuno9wgzhieZngryrGGUTLYwxamhEmvCd7fdJzz4/MXPy8m+OMia4tOYfWStT5nEc7Q3/z8QFM/Emjkn/rvDewg2j+WdsB/U0JyhYI43GYABhYLhDxG0QK9+JckBC4Qm3HyXtj/6Caeb/QsZf5sZuPn8uYXRq+xbKjbQdyUf7OuIjcGSt0uZ23QWpTjguCYxHfk1tvJ8+27HednJ/Z7JxgsvUVxdeWO32QQpMnMw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4021.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(39860400002)(366004)(346002)(376002)(136003)(110136005)(36756003)(921005)(186003)(1076003)(2616005)(38100700002)(38350700002)(86362001)(83380400001)(6486002)(316002)(4326008)(8676002)(41300700001)(66556008)(66476007)(66946007)(478600001)(7416002)(6512007)(2906002)(8936002)(52116002)(6666004)(6506007)(26005)(5660300002)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FFbVe/x+mkverdp6NqgLu4WtC936a2fZRLbLPU/NVZTgkdkyqKS2vC8uhqNd?=
 =?us-ascii?Q?tV+CZs8Gh97Ncny/m4W9kIvlgU36ouPr8PR3o13UqixX84DQDYV2amGp+GCr?=
 =?us-ascii?Q?HzPgkS4xc0xs1dRt7M2OGnTXjptRqMqd9Wjx/ei/BLiy7i8OEfdtwhlulgDq?=
 =?us-ascii?Q?upCvzastvvhtPYXELK/d/6CvzwnUPD90wt6f3aUGfgQ5bAO4fUNcRskprROM?=
 =?us-ascii?Q?U1zToD1CtvwGuzgRgSOjBvBpe4j7LhwpuXGgg3KnylSvYRU0gw4CQCKS7stJ?=
 =?us-ascii?Q?6Keiy1RcfzxJHwkDJ3Ncn/7ni9S7vP56HMGaFSM4ML5Bwd8joneSmFxkpfnH?=
 =?us-ascii?Q?vK2I9i4n9Isld1zeOqA7NTdSG5sULhg8CnxS+jeI2bZOgQGfabIN+zAZcrsD?=
 =?us-ascii?Q?IRrTiPNGofClNaP6ICSCUdI25K2dY/6OGwoNzRNuSC9nFiRV5XN3fiwV9lv3?=
 =?us-ascii?Q?Z1u3eU9582Xjqtv22RoHbt2zLffxmGPMo9FEIfbq3aha0lW+38jt79N+Juj5?=
 =?us-ascii?Q?eKaVrqEP00valtOaKFpvQwbVDYg/B4EHO0UMWukLb2efVE9U7rbQOhRByUAG?=
 =?us-ascii?Q?ed+I20mtcabtARfXTXzZk9Y6g+TzlpOx96HMHZPr4cIIsWsBlnuR3kztAI6a?=
 =?us-ascii?Q?s5Xh92lncVYrs0XxzUdJ60z4Aedb28adTKdwx4m9nHOZ40L/em69FjmjvAy3?=
 =?us-ascii?Q?CSS6T8zXW+dMAOGI/T8o61mox8KHUSjhlBjv0rjOWzCbaV9Z6q2UBQzuiwkT?=
 =?us-ascii?Q?YGeg6L4nhnQfEPbLjt/RLSzB0NBSpV5ezjZ6jE2s9M5l9RcDofn3ZwNY3DsY?=
 =?us-ascii?Q?hl7jXMP0+PHgUOOtls5raEl6q1UJ4E1jHfs21jJhHB21BEW0hSxquqb5lfU8?=
 =?us-ascii?Q?xALVbn18ASn9l+0lGZhEozhxwoKyk5beUoRZu00y+z5WbgaWLUcbTIqhQYs2?=
 =?us-ascii?Q?Pv76mugdZ0/RR+beV9MLE2CWd3/NUFkMfAx67BxbsPkmmIiwKmkaBFEAM0de?=
 =?us-ascii?Q?j6Ez/LTF3fVgcQ4PqqHM+snznJ3nvg0rkOPVU29BSUdT1eE7JrE1dU2QjWOp?=
 =?us-ascii?Q?Ae43RQug2z0QN6DlMeOgd7POOjFRtkUYS6tfzifdsw+mUjYNGIpobIjsGtLK?=
 =?us-ascii?Q?3MLQDUtaNcDUNdgBU96Eoa8Q9ig6iL277IjdN2MYeChKiUuNlZrnyNFAHafY?=
 =?us-ascii?Q?VmZKHovDGRrEoo0W5AMa/WOJeI+Q2CSz4gBSqUO0kE+77wRhCh40bQUB/Se+?=
 =?us-ascii?Q?ziKywh2SZpLWcK0BtyK6wsHunBFia1+TJ1zeerztvFxHz50FuT5V3tPyjqqR?=
 =?us-ascii?Q?i4OHTshDb1iM6MlSo1EdjfP/wevgNcTo+ayMUDbGsVL0IPWPXRLogX1Oxfbm?=
 =?us-ascii?Q?pdji55iU/AdTm8PPW4eRIe2PZIS0yHtaWioJcu8jIZigZT2YJ1uk/muyEJCG?=
 =?us-ascii?Q?kWyBqpVidoJ46EbyJ+9+QPhh+WeASGOs8JKA69kDvHeBTx/ZPfsvUEkne1w6?=
 =?us-ascii?Q?k3tXf8lrIGQKGf8cSB2abPmL1aMa84cQsqQkimXg8PKbTIeSkH06Cx5ah3GF?=
 =?us-ascii?Q?sEhOOd/W62CqRCHrN3LqSOp+vmBrlcPhLvXCRt3/?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0775d4b0-fff3-4b72-e273-08da84d7232c
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4021.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 07:14:37.1669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yzf5GkOVhiXIVwRJFF29JRA1FL/DJaH7sB0W8GXn8rB7R0LTcYqdHf13TvVxD/Cl8zJXzzqtrFrUCuPIHKsCZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1PR06MB2359
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
Cc: Bernard Zhao <bernard@vivo.com>, zhaojunkui2008@126.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch trf to fis cocci warning:
drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c:
2349:8-34: duplicated argument to && or ||
drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c:
3680:8-55: duplicated argument to && or ||

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 .../gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c    | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
index cb2025771646..f99c1696a1f6 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
@@ -2346,8 +2346,7 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 
 			if (mode_lib->vba.DSCEnable[k] && mode_lib->vba.ForcedOutputLinkBPP[k] != 0)
 				mode_lib->vba.DSCOnlyIfNecessaryWithBPP = true;
-			if ((mode_lib->vba.DSCEnable[k] || mode_lib->vba.DSCEnable[k])
-					&& mode_lib->vba.OutputFormat[k] == dm_n422
+			if (mode_lib->vba.DSCEnable[k] && mode_lib->vba.OutputFormat[k] == dm_n422
 					&& !mode_lib->vba.DSC422NativeSupport)
 				mode_lib->vba.DSC422NativeNotSupported = true;
 
@@ -3678,7 +3677,6 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 			if (mode_lib->vba.SourcePixelFormat[k] != dm_444_64
 					&& mode_lib->vba.SourcePixelFormat[k] != dm_444_32
 					&& mode_lib->vba.SourcePixelFormat[k] != dm_444_16
-					&& mode_lib->vba.SourcePixelFormat[k] != dm_444_16
 					&& mode_lib->vba.SourcePixelFormat[k] != dm_444_8
 					&& mode_lib->vba.SourcePixelFormat[k] != dm_rgbe) {
 				if (mode_lib->vba.ViewportWidthChroma[k] > mode_lib->vba.SurfaceWidthC[k]
-- 
2.33.1

