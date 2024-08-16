Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC179543AB
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 10:09:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2D1210E075;
	Fri, 16 Aug 2024 08:09:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="N8g6/NyY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2075.outbound.protection.outlook.com [40.107.104.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D371C10E075
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 08:09:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jgJtcUFzGZ/Ta26QnpTCF5WOwf/H8TAVW88lZnneuDhL1fmzPizZIBbC9olo2PIEdd26BWbuAaqmh0jjnGwJaDLkc0lKkqc8xSSCBQYcjShR8DcWZZSVbPtIxOW0dJi2SwkbC8lBWlx6XqyyIDoRFcnT4mwOrckj8DyFXWE4JzEiBKxb4G4Jrr+CUiNVV7PxX1nrZBe+5qaZPbllxoa6Xh6oP2+eLtGSXWpymANdquF/efjOV8se+XjJY49VCup4SsFATvfEfNzJMP1o4FfDrVAaeMXK3xJRPH3lPDssFcj5FoZLmzNMU7T89Ht3WsRM3WCnCHGp0kt7LdtKUm4f3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qQ5nX+LAM3uhAJhyA6UlKk++zVokcdCUtTEfenGzDWQ=;
 b=rZn7rs2x/c4xQWH4UhIhKD2f65lzKyMvBxNQyksUJZc2jJqDTAH186cDR8YXrkxkyd75OWpycHpKvD7J3c8Ng0tNoFCJu5tcvtXHMOpXn3GSgG1h4FmD+4WnVMwUc8IwP4yPzsozmxq0iSAK2Cet71FMvxGzyxCrpyRzkF6Y2iJMug/uxoZyDIb+WTK/oifcrMmv1j5PDL65EEoEualjCgCroLi8Kh4sxV4WC0W0yIMy1uxMJ3xlo3nm2yoUq1m+/jU1Djvb1kYzK+EQBTYjxDRRekDuJvIqsJAUTBhP7b/5JWzMESDmMYFum2ucbmlbiSh9tt1EXn1DNtsUqgSq5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qQ5nX+LAM3uhAJhyA6UlKk++zVokcdCUtTEfenGzDWQ=;
 b=N8g6/NyYcaIWBf9oTA4nH6tBilbY8eMdLtEg5x77eUWFF0DW9oJxjugn+si4+zNRYa4Pdhbrp7Zuhg9P79a5pEfDGzafTCM7YEw4dmEwfLKgWJHTp2Fm9dMsx0GP9UMTGKHiWOHG6lXi2YEkMms3t3B4cMMkXrnqtMbUXr4HaLnIW0OSkd2n1aWPx5HsIwUdQsMYsxC2tgTJVRWTHUKDDpU0bJroHOAh/dOcJWyjydnu+QyTHA1RiaFImV+eIHeqVE4x7Pj+98zJBzLEwYcq+bjBBjITjV0jfa43jTGZY/KQ14K9rKT521Y2hqslBr9aBtR11DmpFv120nS5GWc8ag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8508.eurprd04.prod.outlook.com (2603:10a6:20b:433::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Fri, 16 Aug
 2024 08:09:34 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7875.018; Fri, 16 Aug 2024
 08:09:33 +0000
From: Liu Ying <victor.liu@nxp.com>
To: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, victor.liu@nxp.com, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, peng.fan@nxp.com
Subject: [PATCH v3 RESEND 0/2] drm/bridge: imx: Add i.MX93 parallel display
 format configuration support
Date: Fri, 16 Aug 2024 16:09:31 +0800
Message-Id: <20240816080933.440594-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0035.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::13) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB8508:EE_
X-MS-Office365-Filtering-Correlation-Id: 2daf5875-1cdc-425d-aea7-08dcbdcac338
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZEhAJ9oTS9OggOed2Ig0qKTsHZHKzoYaP2evJb5G8Fp8EwCpy3oKlM1em+8+?=
 =?us-ascii?Q?5NahMnl4bdIIXFW2W99azOz7B5rT+MHI8t9gAa2ZjfUg5pXbr7X4SmA5+aVT?=
 =?us-ascii?Q?VMYdqAMPRqR6onBYJgQ+OF6JUmPMmTRRCGuOhH2cxJ7o8VHTnRFz+/36HizZ?=
 =?us-ascii?Q?ITu+CGqIE0PV2km1zhMemZaF+waQye8wedw1xV6LeHPF0pNua7saaeWrjjmm?=
 =?us-ascii?Q?STaxaNhUVRtJoOoTTM0aeIfY42dDMupV4gDFiQZz44Ci70jk4TyNtmsbyn+u?=
 =?us-ascii?Q?uvapksLf+GlBpvf+nlmZeJrlP1a7oJSFo8dDtF828qyfSj+oTDjQWXmx9KSY?=
 =?us-ascii?Q?3OT6PPaQVdkoBpVz4aH3uB33OIjKhrx5NNDyJCckk/Ba5Ry9oFRtUq49Pafc?=
 =?us-ascii?Q?f5jfaSs5Vy0xD1BqcxuF26m/VKeZ4j1Fk7TmkJeWcqGzvbNjASrd5WJ+l/kn?=
 =?us-ascii?Q?10JD9CfKQwcNk2SYaZHRdsvYwhUcSl4Lwmbf4VVZkbDhKGeyZFoyV2q714Ui?=
 =?us-ascii?Q?8GHTzyJ2LmfuLAv1LtB4B6CpfC82hhNZVXLQmoLRJ+GbKd5lBBLveULhJpvW?=
 =?us-ascii?Q?96EaWf4OdYkr1uLxqaGulrhyREHNbGfQnNHkW0St5+qalfZTEMne/IOzFXVf?=
 =?us-ascii?Q?3StU7yCpMn0OuKtph7bncVZQrPjbbwiCputR+6NGJ4VGklAXFyAr2qF+ENNJ?=
 =?us-ascii?Q?gvlyL5qlJZuulw+iC3B7wzLkc5gGzkmlAyqd1Unn/NxLrCRmseNV5sh8/V3m?=
 =?us-ascii?Q?JZk+BsofHjZHChFufik80UgFh+5CRLYdjavHwxXWjHTCExynAy7lumDbqQ0O?=
 =?us-ascii?Q?Ks3BwKXXCc2SuaDknhkiJWf7y8Q1ZfOLUVw1HzdkRSbZMl0oc62Ut2t77oXN?=
 =?us-ascii?Q?rZ8RRYactmJPKbsg/48rOqgPP66+DiO2qeOIqdZT2/dqEoRABqmDODXzt6sg?=
 =?us-ascii?Q?jY9j6zI2sui4M9auovAKbBiFoTZC8QCe/Cwau4r3D8O8gqAS5td/Bc1IyDkf?=
 =?us-ascii?Q?Gg9WMNlYUxhwoIFEO656auigT64v51POMztW5/9/d+F5l55H4VPpOcyvQmto?=
 =?us-ascii?Q?aPn1xupLBIDDFnatX9qMqf68ao3x8WPTImY/HwVkcEHirUHUrEBpD1+gE8zw?=
 =?us-ascii?Q?KENGC1Cu9ZjEAFEYD9Ua7PkYtIg32+sCfGQ10z51/qwz2pFZFnAs8lQbGya8?=
 =?us-ascii?Q?AYth5MvjstM5vepw/v19ubWVBBZqI16tY2JIeJdgRwd+VOf+fHtuRE4aqyBc?=
 =?us-ascii?Q?l0EcilRqjqDGm08r7wAXclnv77ZUmn7H7EEZcCHJ2dZJHrLLrd0CgH5SBk5r?=
 =?us-ascii?Q?UavcAoXBZiRN8ilVuDp9TfiqnmpWmI62Q8wlysxNCmf4imR+os3wJdmnqXfp?=
 =?us-ascii?Q?fYhJed3SmBYfVaCx1s4F2fH//ZpsyNb+YoLcIKD9v1fm6DJMFg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tDkGvnvN1JWT9FPqjSCDxHlPZQIUjfoIyWZBHhDratzCA60/xzI70laMmTBY?=
 =?us-ascii?Q?J4gX3bYRfWkBn95ndgP4xh2hJMJLeW+U5/SGxacWGIdmZp//ZsyT0a8QxKz5?=
 =?us-ascii?Q?rCdHB3N1vaatep3vWKd1obpqFuYozzY7vX062tZMRo76vHZPfEScyd+ExWBT?=
 =?us-ascii?Q?xgOuTYHpjwh+R0aAbBlxji8gEgfSXe0VbBHrjDXyL+h8D7HtHZkcfYq2FF0H?=
 =?us-ascii?Q?RlsxAS/SQEWatmevvjufNZnZVuomBF4lFZ0E9j2uuflTOGM1XbdOpeTfV6O0?=
 =?us-ascii?Q?oLUw29hU1BVct6R0pPdpJM7N8a7mQ9o3UqjRJG86cy3flYjEj+ztXZtv/C+8?=
 =?us-ascii?Q?jkJVdtz5QoX53r4ZctBJ2dpvF1eSIZKYx8oGqYRXDJBOVTpte5fEZwihl+kj?=
 =?us-ascii?Q?iaXOWwQ3b2KcxXoxyJACRmnbrrZFzRum54cz/G4RZjnQiWsT5xZH3kmi+F6D?=
 =?us-ascii?Q?cX4G7FvlvzQxZgSA3EOdw1bJGoLeo5dlrAspzmzWxHPQ9/UtrGtFPKYIk8DR?=
 =?us-ascii?Q?vsi/msA3Ugv6HA2+yFjAGGd7VaA5geXLjECDUHLf07VBPh6Dr1Pjjy+mhyra?=
 =?us-ascii?Q?su6hL3/nYmtWW+amkiD/C0SU4jl1Gqe63bTn0hxi/5aQ6CMM1SfClbZeGfQk?=
 =?us-ascii?Q?tp7gIbBzG9oNPInj+JRjne2/3HSpLd/zNJu4CQVHI0CKjsVGu7EKIY+BoVQh?=
 =?us-ascii?Q?5HK0tv6fuHOHjhZnt02HW5x7TTf0QXzvhwWGQI9j/Bg/wpBDaJd2huo4EHJ5?=
 =?us-ascii?Q?rCz1AQFBeyoGq1Ryv/Z6jl+sO1VBWCkj/4sWCwBkxU0TTpkSUH5EWMk2aOvc?=
 =?us-ascii?Q?A/UqmLatOBkH2u3pyN3IwsucuaKgjiqYRWxoNDD4tNi8F0Z4wz1gym3lQ7WF?=
 =?us-ascii?Q?fFI6uyLAABATtHJQRwTa1GdY7jIuJ/XlXUtbbMkSKdd4SZGOD9YPW/GuF+aN?=
 =?us-ascii?Q?/hrv0DFaMlgC9+1d1UGEwRrSK2jhKgTZCa1VU2+yQF+0qi6mqYUdDo9EBsVP?=
 =?us-ascii?Q?y6kCXHgRhccZvaPdSRcxSVgOtbbsxHxEZmBUjnFhfVA0Vu8f4m15g1KPst2p?=
 =?us-ascii?Q?t5dkRTdfpIqwfUhVmplrMfYDgZGliyw3DTh0y6VMzT4CH8a6np7HF2Ve3oP8?=
 =?us-ascii?Q?NcScPkzr5WVN1vzvO+u8kRZBzVMkBgw2zZaPnEqORbzfeieQAKoVwFPnalN0?=
 =?us-ascii?Q?v55ElT1fTK5XwTPv/c0f3QaB9xmsSDhFpL5E8YPJGquZVbblYr8+UzX4BH0H?=
 =?us-ascii?Q?9HiCg4X3UIRlxuuJaVHs68bl0S1ubnrzbtbUU7xOmEjyB3hona119X3l8Ie5?=
 =?us-ascii?Q?9KAxEAbcfWNVMybp/XhD3Sb/O8iHjFTS98X7z9hzSE+wx03Yju8pCVfq/xIW?=
 =?us-ascii?Q?LFTj063rxs6l13LFVlFPkDFCppx8Vsm90TQr6sAcQy+Pazi181fvxCl6GawU?=
 =?us-ascii?Q?0tlC/6gF3yUP3gWBZWGJSSVD4spDKlU3mYIRq5w5U00gJgIFA0mZBShG0H/E?=
 =?us-ascii?Q?DljZbxWHzYMYBoJB5usXvGd/RIogeOG/CEd481ZvgV5oMCiOtNVrJzfxlzcB?=
 =?us-ascii?Q?9Yzr03MCUUyKR/XJAP1E7eCbe7J/iRds4Pz1jumt?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2daf5875-1cdc-425d-aea7-08dcbdcac338
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 08:09:33.8002 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 15rWqbW5No+1hPhOl6SETD8kBdQNcEMqr/vDqAdMxRV9BkC+Ie5LTul4iB523V5viCPoN0msnvdTvbgEMaIO5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8508
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

Hi,

This patch set aims to add NXP i.MX93 parallel display format configuration
DRM bridge driver support. i.MX93 mediamix blk-ctrl contains one
DISPLAY_MUX register which configures parallel display format by using
the "PARALLEL_DISP_FORMAT" field. i.MX93 LCDIF display controller's
parallel output connects with this piece of small logic to configure
parallel display format.

Patch 1/2 adds NXP i.MX93 parallel display format configuration subnode
in i.MX93 mediamix blk-ctrl dt-binding.

Patch 2/2 adds NXP i.MX93 parallel display format configuration DRM bridge
driver support.

v2->v3:
* Define i.MX93 parallel display format configuration subnode in
  i.MX93 mediamix blk-ctrl dt-binding. (Rob)
* Resend with Conor's R-b tag on patch 1/2 and with the patch set rebased
  upon v6.11-rc1.

v1->v2:
* Set *num_input_fmts to zero in case
  imx93_pdfc_bridge_atomic_get_input_bus_fmts() returns NULL in patch 2/2.
* Replace .remove callback with .remove_new callback in
  imx93_pdfc_bridge_driver in patch 2/2.


Liu Ying (2):
  dt-bindings: soc: imx93-media-blk-ctrl: Add PDFC subnode to schema and
    example
  drm/bridge: imx: Add i.MX93 parallel display format configuration
    support

 .../soc/imx/fsl,imx93-media-blk-ctrl.yaml     |  68 ++++++
 drivers/gpu/drm/bridge/imx/Kconfig            |   8 +
 drivers/gpu/drm/bridge/imx/Makefile           |   1 +
 drivers/gpu/drm/bridge/imx/imx93-pdfc.c       | 209 ++++++++++++++++++
 4 files changed, 286 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/imx/imx93-pdfc.c

-- 
2.34.1

