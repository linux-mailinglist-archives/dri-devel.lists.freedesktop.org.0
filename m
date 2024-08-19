Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CADB956126
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 04:40:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 438FC10E18F;
	Mon, 19 Aug 2024 02:40:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="NpYyzXPL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11013053.outbound.protection.outlook.com [52.101.67.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45BE110E18F
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 02:40:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YkD7V0XK8BNu82SxOhO7fAgsqDXSBovM0d0ftc6xH7Br6vylZnWJwZOfdqFfSeGWpz1AbPvAYFNpVDKhcwZumM7a6OieLiuEDRnYJ788SxDhLdrFREjlC4UZ1jX1yKlsjRvXifNVuoG5QjYLMDvHEb/ecLa7mH7yKvQEwn2q8HbaY6O1PtumvZlHVNOdPCgw0wKpML4vMNelMdNYWC4/ONUN0lPRbzjNGQL4iEk7Vw2cKbp3Zs71aKYWa4pKp6FvvdFt78XIyTFjeLwffsVeN9mjzVGQnNgP9UAwTMx4dFnxzpw1yfcoz2dZ+Ls4Ljdmod3EPqyjua5NW//b9EdZyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zEr2CU8a5fcXR5YEMr/axLT++IYP4/hEAnv0FxNp1PA=;
 b=l/fXjNottEkN8AXqkRk7P9Ivi2uolJxblaHF/BljWTMVMbtlnm4P+NUrkJBBTFZvlaIhgv04aAbT8L4vEruNZ1g6kLyrO8INdMX2ps6XuuXnwNQxtlmsqpxnhrf0F9cSEf2Eczh33bt2SpG32HgQ6EZK6D4YJAFHf1/KQdmGsecXBH1500z8CwqPqzCpkr8VSqgkSYtQbXxTYR75SrqshZiCNqEt9YlVZc7fmy4bcXP2uiGPfFXN3wH7CO03vHI07g4dP5l/5NLw/QH0ocQLASym0ZQp/Wf5/VCW6XP/TGdq0vb6oG6Q8XToHrBEWX4cyfIgp6UTvUwB2rgdq4rhHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zEr2CU8a5fcXR5YEMr/axLT++IYP4/hEAnv0FxNp1PA=;
 b=NpYyzXPLpKdXyBZRScrjxJKHdvgldYPKrCDFKHIWJypCo0PhbEL5tA1HNS9+gOjAo30eelCT0acah8k87j/a4EIlHx3iRqxStXm0s/dYuXhsRABwTRCe4Y05Tr6yKCMBoz3UcIJzFY76FzKIIpK0RvKhr6XgC5CjGuHOUgGpdGoAHgg1NlhoqmYVAWfUoVpuYxehYxFDbTXfIEHq0ofclS85T4dohojpRGoTwrzlZ3Tp/7rCt+ZcfCBY8eyeerZMJiG6Ns7W+3xhnDaPb7iV2TaegOqetHOxig8rPx9lgM2RvcSWZPHJ4fPq+YOjsy2NS2MH6AHCwkp/l33c0OGdgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DU2PR04MB8807.eurprd04.prod.outlook.com (2603:10a6:10:2e2::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 02:40:03 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 02:40:03 +0000
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
 daniel@ffwll.ch, peng.fan@nxp.com, krzk@kernel.org
Subject: [PATCH v4 0/2] drm/bridge: imx: Add i.MX93 parallel display format
 configuration support
Date: Mon, 19 Aug 2024 10:39:59 +0800
Message-Id: <20240819024001.850065-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0025.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::12)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DU2PR04MB8807:EE_
X-MS-Office365-Filtering-Correlation-Id: c241be51-8dff-48b9-a1c5-08dcbff83a22
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|52116014|7416014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fc9IP2K9+pG4KN+FMvQjfiVZX9UuIOFz4J/fJsQBjS5uCPY4FrxQV+OTHWFb?=
 =?us-ascii?Q?H9eXQaVsjHqkiSJCezz2QBt55Hp7TPa9tBVsDxn/pkDpdA4vxu7vxn/b0wHA?=
 =?us-ascii?Q?bFUAl7AoC2F2/2cPyd88qAJh/06wLjXIv/yIF6hSIkUXq5BWv+rlG5ClsP+A?=
 =?us-ascii?Q?J7a0C/zSMX1ZxI7hMheHIb6+ee52rZClHjKieuNVK+yEWarsJ6qAu15hvLsw?=
 =?us-ascii?Q?24Lh/CJJ/6oWbImyOz4L05Lxk8zOg8v7vnf5jZTWWU0bCIhDRYp8FrGHDZEZ?=
 =?us-ascii?Q?WjD2drHRCIsMHF4alVZ3ZXt7W0h1ijILnZYz/OekWG6lrec+JPnV6+66dd1k?=
 =?us-ascii?Q?a2/TJF87vvktsn4jansUUfaNhnLFt4qgtgREtL9V7jGW6oSmiTD9kapGpqwo?=
 =?us-ascii?Q?61Sy5fltt66QaxMxMIxmGjBbutNZwRPN1jSJJ1ElqwAV1mfxJXMbEvejuZhl?=
 =?us-ascii?Q?tb0qfCcZJq+P0t32rIFwIkQvHR9SP4w2ddRMmqQJCCYnZrSoDyXNKW9ORNbt?=
 =?us-ascii?Q?coH/1CqyoelWiN5heSA9xZ2PjtyeYq2XhWJ/8nlOQ+JmXlpLuuFwrEVcu6j0?=
 =?us-ascii?Q?xGO3n1gZ6qKX5ZYRtYO13a5Af5IFpWWDHDIYgVlJF9FUkH85fhxE5YUdlORp?=
 =?us-ascii?Q?lBaHzhxcAgSo5jpiT1CkNiYdW+nLpwyf8PJl/6otAeFcdbHyWDrWMsOnw7ht?=
 =?us-ascii?Q?CxrGkx9bKXtQKYysJ5ZSHt7wUrDPwGyvC5v/HSd0tc0TNobC2RmRNkBmHlSy?=
 =?us-ascii?Q?EZ07P+S8+FmnuG6Zys7WUfD3dXI18HiBea6eLonHSMbCfRDXJFJxVkVbajJp?=
 =?us-ascii?Q?G2wFIfTT1jdySIhve78e1UwXOaZV5IZCjnEUYhM9Guu0mzc4NIih49iIjyUG?=
 =?us-ascii?Q?QHoVuc4XvwZMIABTZIb3PFNscoq7TH+iQd0OcPYP99SUOuW14FUXgf3OvGV8?=
 =?us-ascii?Q?A9ynk0HrXWcImJtOxKHV2QryNvqt7A5Rli/FE5SQngWKAc94dmF/RKp0tvS7?=
 =?us-ascii?Q?1IPtAKWBWh8xL8BfEG0IFn3c+E95cRJOEgWjro6AWcIiwA591EHlAlhuz3bD?=
 =?us-ascii?Q?hGVUrvEm6F8EO6dHHg+Yr3/uK2qXVnzJsoYynmKgNv0MFXjUNURnoho9MpVQ?=
 =?us-ascii?Q?ucbHY4+7/AY05mKUhJBMo97oLEpnVOjZNNZw8pf1ZSOp1NaYQIVsuTtpyc+G?=
 =?us-ascii?Q?d8GvW0n2wmtwpffuE7HxGPAS9OxvbldnttdmEdHo4FgxZrXQxlj6iO3DfFRl?=
 =?us-ascii?Q?/otxUB8TzGWBO+B1h+ftEH5Wd02Nx3XmPl0QC9O+TJWHr/69XDCRsAiO1eL8?=
 =?us-ascii?Q?HZ0ejdrjN73BoasK9lKU9hdTI8N+9DoDK87Mo5M4JqJCyWukUe4nrX97mSYb?=
 =?us-ascii?Q?gSvx4d5/5zwrTs7gIwseZHT1XWct5PhHbGYz1uUtPfJBuOwDZw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(52116014)(7416014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ppO8LbZbpZXYeh1KmCtxdjDbQjnnEOTLg4EyBfa7t/4gDqZDgxebj3XSEZTF?=
 =?us-ascii?Q?qBmES7zcWBVrK4HDvJ4NbFTidGaIyPaCUQ7nsaaH6++cvo7kFBDsYW2LeHPe?=
 =?us-ascii?Q?ws3NlVI1w8IPxzisr7tD1knfgpujcGbWyspvDLHDXz7F6lTIUacFKafGCfHS?=
 =?us-ascii?Q?hA4mizNwXyqemNZeZ1DxhgCKJEkw2JAJFCCiOaZkh3q2JV/ZbF+ce5sblojb?=
 =?us-ascii?Q?++KqkLwyRZ5ChGXRm112B98N7cL1I/pE+tbMKU+UEO5G3+MB2VRdIL6OWrkS?=
 =?us-ascii?Q?AKRKyKoYqVlHt5jhC0pWeNkQR8dVpdgo79sr5ALPzodTw1+CKz1edKmOdyrU?=
 =?us-ascii?Q?tBGRIx3IOF6mHJB+SYNgbgGu4c3w43PMhCw07vXvAomriUuHObPUAmUYKGRb?=
 =?us-ascii?Q?AE3hvlG+LNiI9Q4Wic4nWm8VExiviHFitUOmJpVkgeZo0Ot2Coy7n1lsslay?=
 =?us-ascii?Q?oQ8RvOrWHAhYMeZAzhtr0pHjheqknOzrKJPJlsEE4NyvtBcK6Hl5uZK6iT3e?=
 =?us-ascii?Q?rC6srxNrwVfHTIIijyfvhJtvz+xx8NiyUx67F+k+VcoCbhhJeQ/v943lIGMC?=
 =?us-ascii?Q?DBg+13zQDtyz/y73UlCy9kVZtYTmLKgY1q1ahThVbHHnM3x9QUrNAQUxECFm?=
 =?us-ascii?Q?WBtvDau8oCAJVOQ7KQPUWnEQBaU6C8yYRF8hqr+y1/Py6xMD+6ir2uZuexQh?=
 =?us-ascii?Q?XLBB7Uo45HqHu11JqiSA1sYNG2GPa1QAoc0GvEuz9j0DJvDD5N6OvSQLEPm+?=
 =?us-ascii?Q?VJqMt0HzX0iIvoh8nH5GdLb2dT5OVgXqxAr89+TCUN8nPhd7YQONcoIP+jOa?=
 =?us-ascii?Q?08gl2u5q+FMTK3gMnkw+mvIgyT+pFdiuNhAi94MkUkwaTGbEDGwb2N1wnBGI?=
 =?us-ascii?Q?Up0ExSjzFnW4rCx0N/d4Edwqvn7IkNNYJeF8IRC2idEuNVOv+11315aXWwxo?=
 =?us-ascii?Q?Uk2vGKp56/IMsWbFs++1ZrKoSDufvHIKY26ojh6Ytz+XlC6S5+aQrnnwwCIL?=
 =?us-ascii?Q?OJHzpEQ7Kaerg/ifypNMGlClandK3J1n1Qi5XKtXExxW1kGQGhFVcyWfeiCM?=
 =?us-ascii?Q?4y9xzapLrAYGYdaVxaKNmh2RbGR4NUnHNZ+OiYgldR/1ar6weer+8VYb3eYs?=
 =?us-ascii?Q?S1q3D26BxLy4+5cyQnMwLojUPU+/+PT/AlGtBvhEQU+X/yYKePpzRk1OL1J8?=
 =?us-ascii?Q?fgKW/SEQQ9+utXrn89TJpgTkcJ8HijHoBuebEszuT1XIKqDkESv90Xb2TdRW?=
 =?us-ascii?Q?cXx2gNQz2uDBCwc8rfajBe3jgS254Ea7jXvUnzz5uq/y5hCQO0U6Y7KblY3s?=
 =?us-ascii?Q?clRfQzGOqjLSMQ5An3LersyUWLwr+JbQe1kYiofvypMMzfDYQkBWNxOMYh5i?=
 =?us-ascii?Q?B3PrIqenOFbv+MRyEvF7TgKhR9V37eAUw5/E7jicFUn1H3d1IfqDsDGWx9yb?=
 =?us-ascii?Q?Jhw1zBAhRzc/jd9LsxRyhrAq1/7qHJ6cBTYCV2Ba4126yX77W3zXEwu6B6Dq?=
 =?us-ascii?Q?81rfFq+1t5tNhl8/PrfnspFgv03AuVVqLjgpk82KryIvMK3delKyx3gY0Ptf?=
 =?us-ascii?Q?NjSHne7z2YkR0CMif3qo/ZddOzec4HbAjIq1DADk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c241be51-8dff-48b9-a1c5-08dcbff83a22
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 02:40:03.0610 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p1CV+tOHsErDQfAf97lhDq0QZVvlC3nN0M7hUV0zeb5+uODTf8n90YbiGP1DOpzQ2qEybwrJJUjAEZU5Bp5rcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8807
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

v3->v4:
* Use dev_err_probe() in imx93_pdfc_bridge_probe() in patch 2/2. (Krzysztof)
* Drop MODULE_ALIAS() in patch 2/2. (Krzysztof)
* Update year of Copyright in patch 2/2.

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
 drivers/gpu/drm/bridge/imx/imx93-pdfc.c       | 199 ++++++++++++++++++
 4 files changed, 276 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/imx/imx93-pdfc.c

-- 
2.34.1

