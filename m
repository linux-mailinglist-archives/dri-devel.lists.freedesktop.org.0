Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F619DF942
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 03:58:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93C8310E638;
	Mon,  2 Dec 2024 02:58:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="MxbYiJp1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2085.outbound.protection.outlook.com [40.107.21.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D0DE10E63E
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 02:58:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZytiNelWFuvNscBVyBRAsWLmH8QLwQ0WFBXrDofZpbRH2CTViTxW7UsfP7slDOADLFgt/rFS3C2FlomHsLGoL3cTHZEIWyeWlX+UvSvTG7kwenVG6W+KS+I6MgL5RtPI9gvcegzhKN0hQfNDYICXFvpxIcrUR3jQpDD8h1hQ8Dfj5W+dEGgUgSO6yODySFqlYJ0hOf6FxAv/1Ky0iDSzlMRO1mOr/7GUpHiItlj+iN2X8fqxJKpECzUvNI2D/tN9XcGE6QQMOiRYOujH42C+sI8DhPJfOV/3pNoZ1km8T/KifbVaIO6LiWBP75iCVJkihUpox9Va2GtG9oyHlB6b7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rgia5aQI5wH4ef0uSKDaectWOyE6PJ/NhEeq+pN5wcU=;
 b=TcBrns+ovy8ZYwX7jDpkrPqacUlwwf6+LokRtL53c2Dl6aaFEwsqze72yb53bHvGUJoZnoMXS6dVwBRocySXR829n1LM4Ui8iaQHrAIkV1THIyoz64sZU1XlletiWfz9n0QW38ZhaRoTxQSCj+cBdmH/fqpd+4mxCsm3NGyP1rCp8kySrqAFf+YnfIuqH9kyqsHVvmjDNGr0vL6mMTK/jIUJxQWGcqLs2TmEqhLnmDUPThzo5FQH6tGlLcwPZkWn1Klo5X9AwZj0urPCEJhtAjzND7m14stJ84CqUzmtBLx8RpjptqBpCGNxKv/VBN6oFZTAo2pxl369SNLsQrnMbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rgia5aQI5wH4ef0uSKDaectWOyE6PJ/NhEeq+pN5wcU=;
 b=MxbYiJp1hTGWJeZB7orG8CBel/Fdj1Bz6f4Qnm2/qR5/WP314F3CwNHiQGE6rPSEjYPKeKmTWXeF10NtGWaCSYDk70lmj/3sQn/9MP+Kp23km6mWu+R24qsMrrnoEM+FkeDpOOlcM/v7Xe15TlpHXrLQCBKeJJy+D0noxHSwbVWJ8GqbS7AJEgDRKC2velJwdppE43wVnZkpVxOxQCaXg53fARkuRlze7CU1aCyFzfIZSNUm/86V5r/dnOtKnRav5HHn2WxxtfLpFBFES7CHvDxVT7acxATEwDKlp+AqpvZLuMhDgTdaFDaCiQhcPp9ACcNPpJ7uJUu0RhtvjG+98g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DBBPR04MB7643.eurprd04.prod.outlook.com (2603:10a6:10:203::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Mon, 2 Dec
 2024 02:58:45 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 02:58:45 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, glx@linutronix.de, vkoul@kernel.org, kishon@kernel.org,
 aisheng.dong@nxp.com, agx@sigxcpu.org, francesco@dolcini.it,
 frank.li@nxp.com, dmitry.baryshkov@linaro.org, u.kleine-koenig@baylibre.com
Subject: [DO NOT MERGE PATCH v5 18/19] arm64: dts: imx8qxp-mek: Enable display
 controller
Date: Mon,  2 Dec 2024 10:56:34 +0800
Message-Id: <20241202025635.1274467-19-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202025635.1274467-1-victor.liu@nxp.com>
References: <20241202025635.1274467-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0005.apcprd06.prod.outlook.com
 (2603:1096:4:186::12) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DBBPR04MB7643:EE_
X-MS-Office365-Filtering-Correlation-Id: a2c17306-ea6a-4e27-1e02-08dd127d3c70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?haRK0MY9kdafR42yj5XnOwpb99M2JNUhodjOvoRQXBn335QTdXoYlh4rCBAy?=
 =?us-ascii?Q?josmOVVtwElWjtBGG/jgu+p2U2swUytL04rbWfm7pA9XqhlZRKoHOuwjrsAE?=
 =?us-ascii?Q?wJZYgpsO4zMV1vE3CRQRAzwbLyVuYx3pU4NMw539iGM2z6zzT3OcIbGIdTCr?=
 =?us-ascii?Q?j6yjSt9pL8RU583vPEQHRpcP7+kZtuOrCWqqIiRYO+XQo6H9XmNRO2T6Tnin?=
 =?us-ascii?Q?1EL6mJvc/K++tPJnbJhrs9SVh//V79gPbZlsEFJ+HD23LePuS0EKdVcFno4a?=
 =?us-ascii?Q?VGI+WOVEtycbtLwYZf1hFSN9nSR+cXE4808wIsM0UY1FhyOEFntSNAASJl2e?=
 =?us-ascii?Q?T2GUgfGVp5MwqnjaX/YDnPYO70Zn9ky9jLrWTP4C5CnKqRhoOCheTRlGOzHo?=
 =?us-ascii?Q?OWrBS5W64jqAN/Aajxd7BNhZhAsYpYCEz8eqLRp6V90Ay4TxS+szu6WjMl8C?=
 =?us-ascii?Q?DndyBWZ7cxCQafbh4B1G0sVKbOi3/Gour4pGyS05tfurpme3FBvxnKWakjxl?=
 =?us-ascii?Q?0ZqBtAUMdMgJuQWt20APl5UgQ9JGr7a/HkwRMYZYnbf6wH491NS4rzN26GNz?=
 =?us-ascii?Q?r/HHNPb+A/TjTOilMR8uH83Udc1+nDJrHGIqZHo8p3Y6xzKyLWpwI0uNZ/Z4?=
 =?us-ascii?Q?7f2G92If498RoXhCXIRlN4qjOcj8aboM64c+9MU0zfaO2OCbk902iT0nAp30?=
 =?us-ascii?Q?IVxHj2Q8hPiC2PjfNUgKKUu1tghJcBGVimUuScYmDOIQ+m41u6DZwK3tZ+3u?=
 =?us-ascii?Q?pUuzd1e8osXIk4RTmVTzSyuLTJfl1qdvdKVdxpFItkW3rwDdcOXc+z6cCg1+?=
 =?us-ascii?Q?wQVN93JHJRrSLWRDP/YBc3B1ieppQDuTI82kSQxia1AX0+6OvQY+O0E3rS0C?=
 =?us-ascii?Q?BZMLyLEOn6Zkl48ujdcWFX1rSvgSHgU8j0l45fOEGrIVdL2JcWqCrWSsuLGL?=
 =?us-ascii?Q?kURBzQVv2VTYYyPw9/Pxdladid/8cUvQsZ3COQZHQwuL26gQY6rEDZc20TOO?=
 =?us-ascii?Q?mcuvGUTX9OPn1lAuM65oyHIY93dHc4B4RGALq1b1K5tshIbCVaahkfnNdkd9?=
 =?us-ascii?Q?mWJeRZanCe4TQ34Afq24kv+/RCoz4hg0j/hV4RvilUf78oq4Dq6GpkF7tOuf?=
 =?us-ascii?Q?raMaGdjNzdmerU8ZDiXmO96P4gqgC1M9zUBCp5SJ2sOUm6U2hLOTezRLN+Wg?=
 =?us-ascii?Q?lpjbpJEMNrfvU6cgw+ENDaBh1ZboGsWIcEuDJaSeVrMX5WqBYPoOt00s73Rl?=
 =?us-ascii?Q?p1RYi6YU62Y3BvbTNRoSjJWN8uXSgNOytWzZiHDtzKXk855yTP42qMemnK45?=
 =?us-ascii?Q?ldxPAqZB+7PadD4DuhjL92D7Mv5+VceWGVGau5iUOi1fMfVbU4V69iMTDSXK?=
 =?us-ascii?Q?AbRPCLx2YFanUKExm3ujciUtIIh/m0vOIhMAE3AX1v4VfcfMfA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q06xgY0oZAjp5FYcD75hex1YcphqCMuwsNFw6x0RN0RREbBdg+Rz3VlHn7yR?=
 =?us-ascii?Q?n2PDwZwzSEcKdahs9Oim+URpj208BvmpwlSl8irb4nh+zVRpYu+tjI2u3Xhm?=
 =?us-ascii?Q?HimCDAUQWEyiJbCnUdT+t8Uy1IIcixLqgODQ8qpro76ozsfCV8ktsJczRccI?=
 =?us-ascii?Q?CTSELOhD//sxrrMvXNZoPmgVx+G4cAfam82+I1FFTSpc5ypXrW8d22ThYjTG?=
 =?us-ascii?Q?BW24hMSe3Qw6BdSPTlIE8gncnO8RzKjsKM1RIt0vbgrLHe28DQpB/63X7saD?=
 =?us-ascii?Q?bzltmcEV84EJof+xqaC7GZMPmgn349YT8QaWhuj5jVDWED24qIZTz7433LiI?=
 =?us-ascii?Q?fzep/tDkjZ6KIg5hVGw0DGCQuNSvuCwg1Sx6H+M7MXtlEbXYf0K5wzlsoOvY?=
 =?us-ascii?Q?qIznuY+qphHNmtcUbH+B4ZLMOejpU49jX2tHhnqWUyR/osnhKRASlvDQh2D8?=
 =?us-ascii?Q?EM5fPRWuA7DKRgzZQa/YTD8nxT4DOHAYHvX1caGriP5BF4qdiN6nJvG/hXds?=
 =?us-ascii?Q?8OYQPHOxVCk1ouHNrgqc5Dc+emvrNDxBQRieenI4oTrBaeC3vtVTpbqKq0oP?=
 =?us-ascii?Q?MZd/IMikLcGCd4jWKHjoHLtaFg/gol8cx5KVGFjOAIoxJs48qKOuDjr9H8YE?=
 =?us-ascii?Q?+9Mcy7eRrybav4JBXuWKz/ODV9cCkjT5DpnkV2JSJzEzWzfLmR3mNtEf/+Ca?=
 =?us-ascii?Q?rWCdSxjON1XkoSXScZY4ZbmB5LqjnbS1d1coggL1sE9f0imtpBRiQjLoPqyE?=
 =?us-ascii?Q?NkYygjE0YJ1PgY+IvXpx9is2YqqD22lNMsMpzE4yqdse8OZZa+lKoxNlEw53?=
 =?us-ascii?Q?Ld/pueDzRSRs/ek3vXYbFLp8LA9zyh7+DH+kzZL/bk1hM3/9aZQC7YdtjzfA?=
 =?us-ascii?Q?bRf+fqsZzKxrOkKclQJy9vhDObpLIMVZFLO6Nn6YPsAQtWpcfUL0HpgpPRFG?=
 =?us-ascii?Q?vOBaVxKRpqMLYUo20oI0FuZSIfsgzI2eTXaA88JJwcAyhs22pEg15WzF0r7r?=
 =?us-ascii?Q?gBNkGNVfwzV0FH36ecWdrDp4ECp7ZmrE+SHoC5iiS9bOsafd/RSyT671RJHD?=
 =?us-ascii?Q?NyEF9T1Qmi9fyfShG3Yfft4daT/y2ijZRBvBofeExZH6+rVLYjC73CZyyDvx?=
 =?us-ascii?Q?p77W9akoF5+LnTYDUbY4xwF7BsNyBfH/th9oi+/7zKEGkeiDFlfPTeAtWuBx?=
 =?us-ascii?Q?TDI/J9LNcS+h1kU896/TxWlioxAbQr88IwgdlBo4IsAa7IeAYYXPUNdGVfcM?=
 =?us-ascii?Q?yz3JA0UYNjOSWOnghVWGnur2W6FyaCeH4hJ2cyk+R4BExbY4qcj27Xh6A5PG?=
 =?us-ascii?Q?Jrp5K1nPTxgFcWr/Afh7Twl9ZH83wznDdMZj2K8SZg4xPJQBhRv2XZ8r1C8t?=
 =?us-ascii?Q?uCKe1/4i+o1Bsno77ltUXiH0lLNpbYJQiQnFJDEbovG/3tU+34bscacDj+AH?=
 =?us-ascii?Q?O6Yi7jEAfWPbexT7yhgZcAhkXAUpE9gGyzm7HWKvNUJ9NxjiplyKLg9zXL0p?=
 =?us-ascii?Q?Bo1rl7+lBTAKdctcqXflmYtUF7o16L6mRwd91qz09T7FISbi9WVZ9kAm2kdY?=
 =?us-ascii?Q?yG7swFTb+W3ICklkEa0JPZG4Px2hvi0zB0Sirgg9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2c17306-ea6a-4e27-1e02-08dd127d3c70
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 02:58:45.4158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7rNhT0abWANfueKfK6Zz/Q3MfMjKpQF6jFSnqSRVECLi8CmeT/AprJpBZtfWS9jC3WqzssD+gqvvqmxhpf1g3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7643
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

Enable display controller for i.MX8qxp MEK.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v5:
* No change.

v4:
* No change.

v3:
* No change.

v2:
* New patch. (Francesco)

 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
index be79c793213a..c7b4015c7bf7 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -234,6 +234,10 @@ &asrc0 {
 	status = "okay";
 };
 
+&dc0 {
+	status = "okay";
+};
+
 &dsp {
 	memory-region = <&dsp_vdev0buffer>, <&dsp_vdev0vring0>,
 			<&dsp_vdev0vring1>, <&dsp_reserved>;
-- 
2.34.1

