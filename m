Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 688F29A5AAA
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 08:46:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D42FC10E408;
	Mon, 21 Oct 2024 06:46:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="dfUFZ/U/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2069.outbound.protection.outlook.com [40.107.249.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C5CD10E408
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 06:46:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LAyHFF4R4/i52U8e1Kv1vjcZ+ukp17C5lMneFbLvj2xZG5utj5HhNWdWa8My1dbDl1VriIiVrZxd3Q2QDbbWz2cXgmNkqao7jz6hJMYcIpCohVwTjUxYgR1wiJRD7C6d1V7tNZequB8miJV0CzZzL7CXikG76DaNpNvbqcNc119ddtxnw9ZcWczFhtdrME+pYYNpJYUzKYzpGkEs4o9eczucYaeGyptnnFrYHn7R0lPJfRYG/5Ewkbr1Qa2FpsGvj6HCviyI00+h8OX80W4ULfUwngs2c9cxpBUySJFIvG1U4lst/3RNxLIw8PE3Qw6qnQXCWNWcLfUxjUnSNAuxGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ggvmD3n24BdIPMUEWaPP5wE/R1edbKTSVNFeFODbZ64=;
 b=mpmh/RyJIVO6MWysX/11SrKNqSBaGsmEA4QI9/E7lV4wF+UsUPNnWPd52XrR0hBrKFOjWxQjCFQAD36WtlPHT4gJSsMx+YfbTz2fPL+gBid5FYvRW73nOBImLsn0SK+ewRCmVSQGk9kIwJzQ3251xgC1VgAfq0MxIAOLVqLvfvl+0g5m4whZXn5WVAaqOv1PCq2bWcau5IxavfZM6ZQuxwv8e0gb/klCt3j6Z6AY1cEhUA4E70/BM9yJrB5r7WvRG30WLvoOWCpk7Ls1SbKb26vbD+S2pIMFi1AvOQeFc5/GIBVyuYR04ErnY3XE/ISoYoxoeD5CDtfuV0Ko82jWSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ggvmD3n24BdIPMUEWaPP5wE/R1edbKTSVNFeFODbZ64=;
 b=dfUFZ/U/iQ7LwYHELkZWsZA/+mdwrt7zsG6z1E/S0e6seENdP5v8Gsbq8fpnZKlaRynBYfq9DFlOSrpgFsocCQWzhrSD5AyCr+wNxN6zoviDzGdQhQ6+84Cc9leRnGkrp5y2jpWDYEq5qOv4ZSb7BtTptPq8eMHJ8zo4+8727hrDI0GF3P1snWkRKTfyiPOTILPo2gJocR5Xq1JIybVfRfqmuKHAjlVSzWJ3DKFu8tvVo0yQaGruunYcNSqNcCzJYZgxjeMGePnjGSNklpUa8VNN0wcVqLOAWOISG1Ft/vtlgosufdQtFKlOS4/+1Kcn/rbFCqzsY9XETnmiBbz+Yw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8440.eurprd04.prod.outlook.com (2603:10a6:20b:3df::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.21; Mon, 21 Oct
 2024 06:46:01 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 06:46:01 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quic_jesszhan@quicinc.com, mchehab@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 catalin.marinas@arm.com, will@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil@xs4all.nl, tomi.valkeinen@ideasonboard.com,
 quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 thierry.reding@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 sam@ravnborg.org, marex@denx.de, biju.das.jz@bp.renesas.com
Subject: [PATCH v3 04/15] media: uapi: Add MEDIA_BUS_FMT_RGB101010_1X7X5_{SPWG, JEIDA}
Date: Mon, 21 Oct 2024 14:44:35 +0800
Message-Id: <20241021064446.263619-5-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241021064446.263619-1-victor.liu@nxp.com>
References: <20241021064446.263619-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0111.apcprd03.prod.outlook.com
 (2603:1096:4:91::15) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB8440:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c6318d2-d5c0-4a29-1e12-08dcf19c06e5
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|1800799024|366016|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+Vh4zbH6nbQASmdOWZQZv2anhqTfHgnTxWfTR/dP2QBoLgrN+/JVmMRrbY6v?=
 =?us-ascii?Q?IpQB0O8y5JHACA6/t9OKiVNjj4NmaD4lUjxsBvNDigq20AqVT6YcIntUQjYD?=
 =?us-ascii?Q?a9HBbTYwKj4dpffKRUIIGHO85zcCHik6xJo0D/qTjLUSZFLqMMOd98G9lwJm?=
 =?us-ascii?Q?409WCO9nT67dTJOMEdPSUfJQCieDm+gXo6No3Gn0raOWOfdFNEtAIG8aW7gK?=
 =?us-ascii?Q?aniN/ipfcR0MvDuYXeFgsTLMy3HiLcw74XGOXQVFzEykHLMy0vQhg8bV0rXX?=
 =?us-ascii?Q?gSYCI4Us5nPdFRPQJYC5M+D+i6SyXMtn5wlU7YGO6ZUCOmtyHVP1UwzxOQ9N?=
 =?us-ascii?Q?IqQ4wuAEwJJQ3rEeJJCauBxlWDkSA33m4ldHnfHeJjeFENrY4SCzotpYHVE5?=
 =?us-ascii?Q?JNR9PEwW88MRWM/P7CZeS7ixcjf0FEz0qZ6r/jYY1w+PKinZlRh9q/E7bR2o?=
 =?us-ascii?Q?CctviDKDSK1cE3lmRd8hYO4BjNJitcKFYELoYc6+mqEYegQOJSgLmNcrVXjD?=
 =?us-ascii?Q?eA69PAWjbJq+nZsYsfFjVw+r7LzUhA0ySb3Al/9N/apmoup2x68oD3dKvZ3y?=
 =?us-ascii?Q?9hcsD0visxjJ1nxnXsBpgGc4rj40lwlz9W9NNpV4qGrimmF5WhEt5qA7Gs6I?=
 =?us-ascii?Q?NLQhv3pX+awq2SuumyUvNQsyPW+U1rqNazzF2spBOeIGRv1u20Dd6/ioNWTo?=
 =?us-ascii?Q?QNVcxfWdUPIePzvEx/mrHlHe2HwO3/jcXCmW03idznrwE+j4TVC07Wm7Ejw0?=
 =?us-ascii?Q?hnshFdRomK0oz+NGUUqzMA29GTvSXALnqIaBnbic1F2ukGQfbiM/hJU6IC78?=
 =?us-ascii?Q?CknrzgEoJhWQB2Cd71NIJGP/WePEM05/BQbpspHX/FQrMzRBP9CJj/sf5WSB?=
 =?us-ascii?Q?8jXoL1WMQgzyBItG09T1aDQQyYdVqn9cVScK0IgsBeSo0NszLJtE8NVpoZ1m?=
 =?us-ascii?Q?27MWcKTBoQqBs4BU9IiWkeG7USfjGQjR3trJi3G4ltjNN5eBx4vOKnaYvwBO?=
 =?us-ascii?Q?Mp6AhKtdSgZy2MbrbMt6fL/h8Vz/5dFuedzLqNxVbpuQrUKnbbn1GgR6XU1D?=
 =?us-ascii?Q?Xsm+ONzd//p4GF5LCeyh72kGRP+8XTHx0eKh+tVfKSHeEUGpWy2NoZlXeZys?=
 =?us-ascii?Q?TXYuJlLIX92dj8U2rEgXeWwWI+rN8glGM7q95S+dSo0l1QNt7+DjGegFTYeV?=
 =?us-ascii?Q?M5pmKa/AMUb5T0lxw+NdTbwKl1AuWAukT5AoR/NRuaWUGM6/cF0U1vXv3gd4?=
 =?us-ascii?Q?7iZq2EDUctecLKxxK0fht2PoqtsR8kuMVHXYyijfEsH1qF/wgKqN0R8ww5kj?=
 =?us-ascii?Q?3qLzwPN9CYPPuNDZBskATiyNGfQ3wVkMZnYRU5Cno9/rBLOT4tyOGfdIos5M?=
 =?us-ascii?Q?MjPMJlM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(1800799024)(366016)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?C1Y3w2VrMb2/Yfm6iiSsxLbjUV16zH3XEU3c1eTJLOUhbiKLPAxhAmssjVlq?=
 =?us-ascii?Q?b7UAmG1swDueHGwoXFXq3wb2WHk8ryz/2eK2mv3Q12UOmhkfTi6IfosilzBF?=
 =?us-ascii?Q?vvNJDzGPMMNIPk60+xWHMSkqH9cUIpCZ40Fl69bHCyOUcY63LEMRY7IG7etM?=
 =?us-ascii?Q?nLp5umF8ugBS4qtqXsMpU7kTrBePm9sZVXzGVimwWaOd8KtOFjUP2vbAKWnB?=
 =?us-ascii?Q?0obtHBEzxvp8zOygX+QsQYHznvvuD91heEpU7Accukg+MC4IJaB1K3h8OcUu?=
 =?us-ascii?Q?3tJYhFv21bi5OoyFmAldgiN9GGiOEoBVQ6QYYSB4WnLKjsKweAwTCEd/nqZH?=
 =?us-ascii?Q?8SlSynFWOwifWs6y+a4Ysw+wAtowDkEl7nq884XsfiTZz9qDOXO7ZSXmwyEw?=
 =?us-ascii?Q?H9jhbAv5tv6N6Eq/UevlGL4Tfmdfv18kRxkIwnhBKp8/RL3HqgkNmRqf2LiJ?=
 =?us-ascii?Q?VqUhyTPEhqCgXAD+RLMu9yt1qdRZKr9d57hXl0m3aX0ZH+cwLw9FhFxJmiNK?=
 =?us-ascii?Q?9GYKaRPZoHJUT8Ob52v/DmcL7XdLXHOOxZhO/SOrAFNpzjB2q20L3srQPPE2?=
 =?us-ascii?Q?+dn6jlgUI0bvNAaP/Rni2yXXGKduR1PnWYWG64lRGM76BDh+GRtlDsy8ouj6?=
 =?us-ascii?Q?/QagIpbx0RPFE7jTptbgMM9e1rT7ky1jzWnxqzsNCef02PRhezNvDTHMjkpu?=
 =?us-ascii?Q?bMB8wDJeBnjZ7+g4SciFuXKrZ71yZ0VvBRJ6+heFv1lxiGl/RHqISj+qz4FV?=
 =?us-ascii?Q?oRKbgJ5kZTVR405BkUi8WH/UzyzZfmfdIz6CskMUElLeHnaJqdI2QB7Lm6Uo?=
 =?us-ascii?Q?nbxCS9nf8H/3LeDyLaWBQZ4VUQG2obu4w7XvrFom0YQo+Ie4oIQ6Lm+BbYLg?=
 =?us-ascii?Q?Zttg818uOYfy22tGwBZ1HXlyiq9h/TU44NZxMBwc92XVF0Sxjd3zKknn5i0t?=
 =?us-ascii?Q?+THDt/uzXbVhSB+6ti0NYi5u4KYPSVJLsr4b9RS1jrDPPK0w9cCRqTJm351J?=
 =?us-ascii?Q?+Mbf7y2QMFelw2Q+HBi2J7/NZSfdViCDf2wUKtrFJmi89O2KbYII00kNUT74?=
 =?us-ascii?Q?vrj45PSGlxaFaZJzbfjCDgj7AN7+4nbi99QT1Fw7UUr48anbkWe9guJe6d6t?=
 =?us-ascii?Q?joesPPMbAfpQ7xtVCDtQlXwzr/yEvaRjT2jfPSTRdqlE9XRpjh4aFU2tiYJ3?=
 =?us-ascii?Q?NQlGM/S7m8I2i1gHpr4eU47uwSsu2GHjQyTyZihDk6zLoEiGG9p+zHa8BZ59?=
 =?us-ascii?Q?8YcapmTkf6oORWJ2Ia41ShdZuTXE7NbNjxEzrr4cCWBP50E/TonCknAh5uL9?=
 =?us-ascii?Q?x7Ws2HQy03F3g7GJPpNwzvZsOjDbutp9jeFn4oIZKoiOYvuGqiGPD6U79y8N?=
 =?us-ascii?Q?JmXwWd/p5sKZMgzqlYQ80XFwISIK2yfsGVb00THtHlm0sBlkUd9c69yde7uO?=
 =?us-ascii?Q?IuZYjppfKul9ZMVfbCy5wIHJqHznq/tMxSBoGuXm1qEFA/UpOWA+E4VkJL8J?=
 =?us-ascii?Q?MsO4/o+Uv/CxYzGxrNxWmBtf8F3t5uRfK5aPSMpRv5SWUH9D7AdUXBL1tFrH?=
 =?us-ascii?Q?sEbIMj4hJAwjNVehlNefJpLEx9zOnWEnXbTaiJgT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c6318d2-d5c0-4a29-1e12-08dcf19c06e5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 06:46:01.4426 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Q7LdAa7xJO5T6Nas9aNEakuzxEcUhOQ5uN90WOaZDg7GgMDCCTdxygZI27qJ9iaz6z2989JiodrHnU9hLp/+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8440
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

Add two media bus formats that identify 30-bit RGB pixels transmitted
by a LVDS link with five differential data pairs, serialized into 7
time slots, using standard SPWG/VESA or JEIDA data mapping.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v3:
* New patch.

 .../media/v4l/subdev-formats.rst              | 156 +++++++++++++++++-
 include/uapi/linux/media-bus-format.h         |   4 +-
 2 files changed, 157 insertions(+), 3 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index d2a6cd2e1eb2..2a94371448dc 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -2225,7 +2225,7 @@ The following table list existing packed 48bit wide RGB formats.
     \endgroup
 
 On LVDS buses, usually each sample is transferred serialized in seven
-time slots per pixel clock, on three (18-bit) or four (24-bit)
+time slots per pixel clock, on three (18-bit) or four (24-bit) or five (30-bit)
 differential data pairs at the same time. The remaining bits are used
 for control signals as defined by SPWG/PSWG/VESA or JEIDA standards. The
 24-bit RGB format serialized in seven time slots on four lanes using
@@ -2246,11 +2246,12 @@ JEIDA defined bit mapping will be named
       - Code
       -
       -
-      - :cspan:`3` Data organization
+      - :cspan:`4` Data organization
     * -
       -
       - Timeslot
       - Lane
+      - 4
       - 3
       - 2
       - 1
@@ -2262,6 +2263,7 @@ JEIDA defined bit mapping will be named
       - 0
       -
       -
+      -
       - d
       - b\ :sub:`1`
       - g\ :sub:`0`
@@ -2270,6 +2272,7 @@ JEIDA defined bit mapping will be named
       - 1
       -
       -
+      -
       - d
       - b\ :sub:`0`
       - r\ :sub:`5`
@@ -2278,6 +2281,7 @@ JEIDA defined bit mapping will be named
       - 2
       -
       -
+      -
       - d
       - g\ :sub:`5`
       - r\ :sub:`4`
@@ -2286,6 +2290,7 @@ JEIDA defined bit mapping will be named
       - 3
       -
       -
+      -
       - b\ :sub:`5`
       - g\ :sub:`4`
       - r\ :sub:`3`
@@ -2294,6 +2299,7 @@ JEIDA defined bit mapping will be named
       - 4
       -
       -
+      -
       - b\ :sub:`4`
       - g\ :sub:`3`
       - r\ :sub:`2`
@@ -2302,6 +2308,7 @@ JEIDA defined bit mapping will be named
       - 5
       -
       -
+      -
       - b\ :sub:`3`
       - g\ :sub:`2`
       - r\ :sub:`1`
@@ -2310,6 +2317,7 @@ JEIDA defined bit mapping will be named
       - 6
       -
       -
+      -
       - b\ :sub:`2`
       - g\ :sub:`1`
       - r\ :sub:`0`
@@ -2319,6 +2327,7 @@ JEIDA defined bit mapping will be named
       - 0x1011
       - 0
       -
+      -
       - d
       - d
       - b\ :sub:`1`
@@ -2327,6 +2336,7 @@ JEIDA defined bit mapping will be named
       -
       - 1
       -
+      -
       - b\ :sub:`7`
       - d
       - b\ :sub:`0`
@@ -2335,6 +2345,7 @@ JEIDA defined bit mapping will be named
       -
       - 2
       -
+      -
       - b\ :sub:`6`
       - d
       - g\ :sub:`5`
@@ -2343,6 +2354,7 @@ JEIDA defined bit mapping will be named
       -
       - 3
       -
+      -
       - g\ :sub:`7`
       - b\ :sub:`5`
       - g\ :sub:`4`
@@ -2351,6 +2363,7 @@ JEIDA defined bit mapping will be named
       -
       - 4
       -
+      -
       - g\ :sub:`6`
       - b\ :sub:`4`
       - g\ :sub:`3`
@@ -2359,6 +2372,7 @@ JEIDA defined bit mapping will be named
       -
       - 5
       -
+      -
       - r\ :sub:`7`
       - b\ :sub:`3`
       - g\ :sub:`2`
@@ -2367,6 +2381,7 @@ JEIDA defined bit mapping will be named
       -
       - 6
       -
+      -
       - r\ :sub:`6`
       - b\ :sub:`2`
       - g\ :sub:`1`
@@ -2377,6 +2392,7 @@ JEIDA defined bit mapping will be named
       - 0x1012
       - 0
       -
+      -
       - d
       - d
       - b\ :sub:`3`
@@ -2385,6 +2401,7 @@ JEIDA defined bit mapping will be named
       -
       - 1
       -
+      -
       - b\ :sub:`1`
       - d
       - b\ :sub:`2`
@@ -2393,6 +2410,7 @@ JEIDA defined bit mapping will be named
       -
       - 2
       -
+      -
       - b\ :sub:`0`
       - d
       - g\ :sub:`7`
@@ -2401,6 +2419,7 @@ JEIDA defined bit mapping will be named
       -
       - 3
       -
+      -
       - g\ :sub:`1`
       - b\ :sub:`7`
       - g\ :sub:`6`
@@ -2409,6 +2428,7 @@ JEIDA defined bit mapping will be named
       -
       - 4
       -
+      -
       - g\ :sub:`0`
       - b\ :sub:`6`
       - g\ :sub:`5`
@@ -2417,6 +2437,7 @@ JEIDA defined bit mapping will be named
       -
       - 5
       -
+      -
       - r\ :sub:`1`
       - b\ :sub:`5`
       - g\ :sub:`4`
@@ -2425,10 +2446,141 @@ JEIDA defined bit mapping will be named
       -
       - 6
       -
+      -
+      - r\ :sub:`0`
+      - b\ :sub:`4`
+      - g\ :sub:`3`
+      - r\ :sub:`2`
+    * .. _MEDIA-BUS-FMT-RGB101010-1X7X5-SPWG:
+
+      - MEDIA_BUS_FMT_RGB101010_1X7X5_SPWG
+      - 0x1026
+      - 0
+      -
+      - d
+      - d
+      - d
+      - b\ :sub:`1`
+      - g\ :sub:`0`
+    * -
+      -
+      - 1
+      -
+      - b\ :sub:`9`
+      - b\ :sub:`7`
+      - d
+      - b\ :sub:`0`
+      - r\ :sub:`5`
+    * -
+      -
+      - 2
+      -
+      - b\ :sub:`8`
+      - b\ :sub:`6`
+      - d
+      - g\ :sub:`5`
+      - r\ :sub:`4`
+    * -
+      -
+      - 3
+      -
+      - g\ :sub:`9`
+      - g\ :sub:`7`
+      - b\ :sub:`5`
+      - g\ :sub:`4`
+      - r\ :sub:`3`
+    * -
+      -
+      - 4
+      -
+      - g\ :sub:`8`
+      - g\ :sub:`6`
+      - b\ :sub:`4`
+      - g\ :sub:`3`
+      - r\ :sub:`2`
+    * -
+      -
+      - 5
+      -
+      - r\ :sub:`9`
+      - r\ :sub:`7`
+      - b\ :sub:`3`
+      - g\ :sub:`2`
+      - r\ :sub:`1`
+    * -
+      -
+      - 6
+      -
+      - r\ :sub:`8`
+      - r\ :sub:`6`
+      - b\ :sub:`2`
+      - g\ :sub:`1`
       - r\ :sub:`0`
+    * .. _MEDIA-BUS-FMT-RGB101010-1X7X5-JEIDA:
+
+      - MEDIA_BUS_FMT_RGB101010_1X7X5_JEIDA
+      - 0x1027
+      - 0
+      -
+      - d
+      - d
+      - d
+      - b\ :sub:`5`
+      - g\ :sub:`4`
+    * -
+      -
+      - 1
+      -
+      - b\ :sub:`1`
+      - b\ :sub:`3`
+      - d
       - b\ :sub:`4`
+      - r\ :sub:`9`
+    * -
+      -
+      - 2
+      -
+      - b\ :sub:`0`
+      - b\ :sub:`2`
+      - d
+      - g\ :sub:`9`
+      - r\ :sub:`8`
+    * -
+      -
+      - 3
+      -
+      - g\ :sub:`1`
       - g\ :sub:`3`
+      - b\ :sub:`9`
+      - g\ :sub:`8`
+      - r\ :sub:`7`
+    * -
+      -
+      - 4
+      -
+      - g\ :sub:`0`
+      - g\ :sub:`2`
+      - b\ :sub:`8`
+      - g\ :sub:`7`
+      - r\ :sub:`6`
+    * -
+      -
+      - 5
+      -
+      - r\ :sub:`1`
+      - r\ :sub:`3`
+      - b\ :sub:`7`
+      - g\ :sub:`6`
+      - r\ :sub:`5`
+    * -
+      -
+      - 6
+      -
+      - r\ :sub:`0`
       - r\ :sub:`2`
+      - b\ :sub:`6`
+      - g\ :sub:`5`
+      - r\ :sub:`4`
 
 .. raw:: latex
 
diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
index d4c1d991014b..ff62056feed5 100644
--- a/include/uapi/linux/media-bus-format.h
+++ b/include/uapi/linux/media-bus-format.h
@@ -34,7 +34,7 @@
 
 #define MEDIA_BUS_FMT_FIXED			0x0001
 
-/* RGB - next is	0x1026 */
+/* RGB - next is	0x1028 */
 #define MEDIA_BUS_FMT_RGB444_1X12		0x1016
 #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE	0x1001
 #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE	0x1002
@@ -68,6 +68,8 @@
 #define MEDIA_BUS_FMT_ARGB8888_1X32		0x100d
 #define MEDIA_BUS_FMT_RGB888_1X32_PADHI		0x100f
 #define MEDIA_BUS_FMT_RGB101010_1X30		0x1018
+#define MEDIA_BUS_FMT_RGB101010_1X7X5_SPWG	0x1026
+#define MEDIA_BUS_FMT_RGB101010_1X7X5_JEIDA	0x1027
 #define MEDIA_BUS_FMT_RGB666_1X36_CPADLO	0x1020
 #define MEDIA_BUS_FMT_RGB888_1X36_CPADLO	0x1021
 #define MEDIA_BUS_FMT_RGB121212_1X36		0x1019
-- 
2.34.1

