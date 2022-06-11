Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7D0547553
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jun 2022 16:13:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BBF710E6F9;
	Sat, 11 Jun 2022 14:13:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70071.outbound.protection.outlook.com [40.107.7.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B361E10E6F9
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jun 2022 14:13:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=INFo5PvARtYAQuNPtQORV+3gF1qhk8An6xxPL2C5tQgk5lmCaph8bji6nqyiZALqKn5kVCmD3UymdwGtlDyOXRNr7XLOdvXsu6KSnKSv6qSSAwPCnRGWF+0K4GmibfQYZa20lqzwDr1ihRXFdAJfdojf1E0gY0DevrtClZkcf/En4rRHbfSn5ICklZH+KcY6IZCn0p3NMJtM0ZeAO+3V0CWjjsNGeIM2YhXI4MK/jy7eh0pnL6Q439YwXc9mxIg8r9r+0SHwaU7rFvOa4AkylDV0Z1vHao51sFerZOGEOtuWs5eJZVuZF/E/u8QW9+019iqbfN2rp3cPJgNwub+MwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Vbjlx1f2d0W7MpjweSmd3hwR+10ZDfxDVnklOGbVOM=;
 b=AD5t9lxoxbjBg3sOD3Ob+ozOgm0J0CohaCicv/lstf8TV73fzLIxY+9zVszkl8bWB6mlB6qIGKV+BOqLb0uQ4vKAkuVgt5pby7LzlSNuUtn0k4ERupf+m7uzP/VRQ6FLEIQwSf78PnoQH8GGxyBBo2zCAKz/oFL6fHPyMtQABglG96QZuYpi4U9dp0R7oNkza0tg4joCZT0W7Sc/j/jQTCRZ+5nAfj2tRFXHFQT28FlBwdE5s1vI/XGEfJJvYAa3IIDjGc3fzHXeh1jmgVzE02mhPHszbJsS8oSWWK2FZTvw6srrpgeI5ECRlthfoZu/4GiYmGfww5W0jqy0pwfalQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Vbjlx1f2d0W7MpjweSmd3hwR+10ZDfxDVnklOGbVOM=;
 b=CB2YHESdVFtyi0HOJtbhuG92l7NCBh3DmpREGQtbJa8xfhyEl6JEhyNrOze2qKIUHC7xBzTa+QJFYv23qWzTBfEyECoO+9Dge0R94k4pV/HPTFGTPCJLRdWjkKCAJj2eoeD3UN3K51RJeUcGht0jRfr6IyBxL9IF+5lWG6OoyVM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB8PR04MB6347.eurprd04.prod.outlook.com (2603:10a6:10:107::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Sat, 11 Jun
 2022 14:13:12 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502%7]) with mapi id 15.20.5332.016; Sat, 11 Jun 2022
 14:13:06 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v9 02/14] media: docs: Add some RGB bus formats for
 i.MX8qm/qxp pixel combiner
Date: Sat, 11 Jun 2022 22:14:09 +0800
Message-Id: <20220611141421.718743-3-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220611141421.718743-1-victor.liu@nxp.com>
References: <20220611141421.718743-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0118.apcprd03.prod.outlook.com
 (2603:1096:4:91::22) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f6e335ec-c11c-406d-38d6-08da4bb48110
X-MS-TrafficTypeDiagnostic: DB8PR04MB6347:EE_
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-Microsoft-Antispam-PRVS: <DB8PR04MB6347A1F088DDB35A38ABAD7398A99@DB8PR04MB6347.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wMN2SIu6LS2hRqd+E/Z9u8gQhWqgWjShVgUkYO7DT/ynL3RDz/tF8WwNMS8BAHfBALcfy9udKbdkrD6IgUEgdKmI+TD5SWL+hXBTnbCQdSvkSVItqCLTbC04tFCr55Ug5dFC+5oyFdLvG7HhNK+OjyNzGhhRZNUr9+Tf+UcWNJctfkMjuKXecuEdCXNxn40BRYZ2HJ8K1lKM/+nHsduEGP276Z7ytG7a90IbUBwWQegTUEfz9u2KJ8icSfmQWCWuUtNjpYZy8P1bvS9J2WiZtfqPz96N9C8SBWTg6oSMkDhym6y01gnNL8Pgz4ue7jvs002tthquRSsk9/kr0x68T027n12mMaJd/TVNqN6079ri5L40GPoXQGdsj2ciSVUlKkiD5TZkDF1/BBVRCvM0XfqaEptKo49EZYSP1QXBDTzARS1Dzn56c86biPsu9d/kmCufj8HxGK9ecpVSFJ7vamD3EAwOAjJavzhpZmvK2SHfUTgo2N6dwtkJqS5ztcVqNmCSF201D1PLHawcrfwJDPjiMKVT/S17iM1VyK7xLSyCdHwflBQDXOsXji5xueGQDYwEM5XojI8cJVai1M1otZr4ZcTpV98aaQmw0U226XnVZbtmZb79x47uFeAyMQ4B5uOtBvj6LAKo6q7D0cREd90LtEws7sLNuGK5e69hIbD1MiwGwioNIa49Eee1MRBjIq8c4tjmO6l281NgbDj98Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(5660300002)(66556008)(66476007)(66946007)(1076003)(4326008)(8676002)(86362001)(316002)(186003)(8936002)(2616005)(7416002)(36756003)(52116002)(38350700002)(38100700002)(6512007)(26005)(6506007)(508600001)(6486002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O5h8tzKAE+eV7cwgOW3x6W+3e36wPndKX4rzozpK9MUTRQP36IIhzPkxXWTc?=
 =?us-ascii?Q?1DiBBCSzPAb/LOLpXX9M5X5I1KsmGcFaMrKvih6WnRJxlc5LVL02lXBmHW3p?=
 =?us-ascii?Q?ahOiLvBTltmTfBKeTDlYLWESfwb7xdlt9lAUINGbbMS8ZUYoUBvIDMqOtdCU?=
 =?us-ascii?Q?2hfyh+PnRaG5LasxT3joQobRtt7pfKnvaSU2lfhj9+L9aGJH0yQw7n3Y/Kch?=
 =?us-ascii?Q?pHgaada8q90aA9gNH8oTpj1Z4C09SMtqy81kAEio7roilD+jY85mJ0uLHCEG?=
 =?us-ascii?Q?9KzLinU/8bx3O0a4dwIpY6Q5MVjkkVLCs8MHQIK6Arqc1emWVM2jWMLpmpZn?=
 =?us-ascii?Q?u/yaDuAx40cDZGBN0jYwcVSlL6VxZyLbOSA0MGa4TTJjE4rSiXF14QXNtCww?=
 =?us-ascii?Q?JmvTf5WTt+Eqp9Ifuo3DSo308ZnQXd90Zli2hnjv1Q14i6xjIDHGMNgN72Hk?=
 =?us-ascii?Q?5uSizZuUSzx79jT+8V4HflBKvBgFIXX7pb4mUbe+7NQS8cNgjYqRK8if9AiN?=
 =?us-ascii?Q?pGK+1+VoI+exGLH4svTnsdm5uaLiuPJq1rrQsoF/UdJfjeIKAoL0wAgsIE9O?=
 =?us-ascii?Q?3wJV0izIbC6eJi0O7T3UGvg3oBXRQ7xday/Ne0X7/trCd/2VSVjqybFdqmIJ?=
 =?us-ascii?Q?vAQ/mpPweBfLJd0WfC2lnlBuIhcneEc51fjbygep9lJaLX/iwnRR0wOX2xMW?=
 =?us-ascii?Q?xaV4SaBcb3973QN3KRDcBf5rckv6QP5iSnrjhZ/3BdfPpK6o4Yqoqp5Sx1kN?=
 =?us-ascii?Q?bO7cC802L5e98oiSrE8xWmQeG2GdcM5scW33WbIDI15BazCxiRyiw9/5vw2W?=
 =?us-ascii?Q?xmHO8xH//zUWlnsrOZFaKWaFgNH46XNRf8RQ6dQ1UL8ro8nrsxd5grqaGZ0Z?=
 =?us-ascii?Q?51A8TaraagdkXMtyWmdRkOunTOgLPVIgL98HqgBSf63SibOaiW1hpkrjaKTh?=
 =?us-ascii?Q?fzq8Yzlab+/FNK/X/HeiwzMYzAXJpSf0Bd/8zD1yuKjbyIYVebsHwzTnAXqZ?=
 =?us-ascii?Q?tYmvsa3d6MrSbX1ggwq1QaDUxwyz2dnBwI+msu8DE0coZm5w+JRncH7Y6Jge?=
 =?us-ascii?Q?BxU/lV0YXGelTXcrSyMXjWbRgbIWirck7IWqhxahB7d+zoP4F+uf2mDnSRLl?=
 =?us-ascii?Q?lD6XRVmEiaY8LFLX7QXepZZyq72oxL5kGJyuOO0cLNyYDsvsFS46fDp7bTU3?=
 =?us-ascii?Q?fbGlMcUUOMVDQroVNdG8MIvd9Os0CpjhL/QSAjHZ6MoEw/wRLs+ZSaKq/pMs?=
 =?us-ascii?Q?ez4E4IZotL5ZURWJb8TKA0i2b2B85s8UCPynUWkSatc+ZESfcZtIROKfsGWf?=
 =?us-ascii?Q?EaIj8LrJCjavVWldF5Zz4wZrzuhDMkP4TBjBBdGuuuxhCelN671dZMYa1mVY?=
 =?us-ascii?Q?KYbtgF6BHgQSr0R+Vxi1EXEfl6VBV/yI9tJ3U6Ve/H9Vd+jm60sDOvxPSow1?=
 =?us-ascii?Q?tPgzq4/lKpGY8kWJuj+a9eZo0wf1SumhiQt+NCJG5jFCKENTblMnvbwOKBQs?=
 =?us-ascii?Q?lOF01esah3CWh+gSJlhvW7IkBGYR8E8wNnPZ5edv/BsqnBQH8fApLjSL1cPQ?=
 =?us-ascii?Q?if77hR5DWYZevB/6UAoR0piBvkhMfGZLSHC+lWCd0vgj+GT188t9bAhQ1yFu?=
 =?us-ascii?Q?aRY7CMNxo2QeM8IvZtV4+At1TvmzrF6vYgdf9rQocPNLt+wCpiCwrLrL8zp3?=
 =?us-ascii?Q?afXMipqF3VKy7hKmYxNZcFxNUCyPCHF7r6EWVBDRKl96S39MnrtDWVba/c1a?=
 =?us-ascii?Q?6T64sMe/HQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6e335ec-c11c-406d-38d6-08da4bb48110
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2022 14:13:05.9272 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q2zTHvNR0OORVUYN3O9DTC9ObfxBLYrKLnL2kfaFV3tgRxnW/5jSzRl47oPWgEX6oZ9ukDO3eQhmiMmmS7uiJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6347
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
Cc: krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se, airlied@linux.ie,
 robert.foss@linaro.org, s.hauer@pengutronix.de, narmstrong@baylibre.com,
 jernej.skrabec@gmail.com, marcel.ziswiler@toradex.com, robh+dt@kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, andrzej.hajda@intel.com,
 lee.jones@linaro.org, mchehab@kernel.org, shawnguo@kernel.org,
 kernel@pengutronix.de, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds documentations for RGB666_1X30_CPADLO, RGB888_1X30_CPADLO,
RGB666_1X36_CPADLO and RGB888_1X36_CPADLO bus formats used by i.MX8qm/qxp
pixel combiner.  The RGB pixels with padding low per component are
transmitted on a 30-bit input bus(10-bit per component) from a display
controller or a 36-bit output bus(12-bit per component) to a pixel link.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
Robert, I keep your R-b tag from v5. Let me know if you want me to drop it, as
v6 contains a fix.

v8->v9:
* No change.

v7->v8:
* No change.

v6->v7:
* No change.

v5->v6:
* Fix data organizations of MEDIA_BUS_FMT_RGB{666,888}_1X30-CPADLO. (Laurent)
* Add Laurent's R-b tag.

v4->v5:
* Add Robert's R-b tag.

v3->v4:
* No change.

v2->v3:
* No change.

v1->v2:
* No change.

 .../media/v4l/subdev-formats.rst              | 156 ++++++++++++++++++
 1 file changed, 156 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index 0cbc045d5df6..d21d532eee15 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -1492,6 +1492,80 @@ The following tables list existing packed RGB formats.
       - b\ :sub:`2`
       - b\ :sub:`1`
       - b\ :sub:`0`
+    * .. _MEDIA-BUS-FMT-RGB666-1X30-CPADLO:
+
+      - MEDIA_BUS_FMT_RGB666_1X30-CPADLO
+      - 0x101e
+      -
+      -
+      -
+      - r\ :sub:`5`
+      - r\ :sub:`4`
+      - r\ :sub:`3`
+      - r\ :sub:`2`
+      - r\ :sub:`1`
+      - r\ :sub:`0`
+      - 0
+      - 0
+      - 0
+      - 0
+      - g\ :sub:`5`
+      - g\ :sub:`4`
+      - g\ :sub:`3`
+      - g\ :sub:`2`
+      - g\ :sub:`1`
+      - g\ :sub:`0`
+      - 0
+      - 0
+      - 0
+      - 0
+      - b\ :sub:`5`
+      - b\ :sub:`4`
+      - b\ :sub:`3`
+      - b\ :sub:`2`
+      - b\ :sub:`1`
+      - b\ :sub:`0`
+      - 0
+      - 0
+      - 0
+      - 0
+    * .. _MEDIA-BUS-FMT-RGB888-1X30-CPADLO:
+
+      - MEDIA_BUS_FMT_RGB888_1X30-CPADLO
+      - 0x101f
+      -
+      -
+      -
+      - r\ :sub:`7`
+      - r\ :sub:`6`
+      - r\ :sub:`5`
+      - r\ :sub:`4`
+      - r\ :sub:`3`
+      - r\ :sub:`2`
+      - r\ :sub:`1`
+      - r\ :sub:`0`
+      - 0
+      - 0
+      - g\ :sub:`7`
+      - g\ :sub:`6`
+      - g\ :sub:`5`
+      - g\ :sub:`4`
+      - g\ :sub:`3`
+      - g\ :sub:`2`
+      - g\ :sub:`1`
+      - g\ :sub:`0`
+      - 0
+      - 0
+      - b\ :sub:`7`
+      - b\ :sub:`6`
+      - b\ :sub:`5`
+      - b\ :sub:`4`
+      - b\ :sub:`3`
+      - b\ :sub:`2`
+      - b\ :sub:`1`
+      - b\ :sub:`0`
+      - 0
+      - 0
     * .. _MEDIA-BUS-FMT-ARGB888-1X32:
 
       - MEDIA_BUS_FMT_ARGB888_1X32
@@ -1669,6 +1743,88 @@ The following table list existing packed 36bit wide RGB formats.
       - 2
       - 1
       - 0
+    * .. _MEDIA-BUS-FMT-RGB666-1X36-CPADLO:
+
+      - MEDIA_BUS_FMT_RGB666_1X36_CPADLO
+      - 0x1020
+      -
+      - r\ :sub:`5`
+      - r\ :sub:`4`
+      - r\ :sub:`3`
+      - r\ :sub:`2`
+      - r\ :sub:`1`
+      - r\ :sub:`0`
+      - 0
+      - 0
+      - 0
+      - 0
+      - 0
+      - 0
+      - g\ :sub:`5`
+      - g\ :sub:`4`
+      - g\ :sub:`3`
+      - g\ :sub:`2`
+      - g\ :sub:`1`
+      - g\ :sub:`0`
+      - 0
+      - 0
+      - 0
+      - 0
+      - 0
+      - 0
+      - b\ :sub:`5`
+      - b\ :sub:`4`
+      - b\ :sub:`3`
+      - b\ :sub:`2`
+      - b\ :sub:`1`
+      - b\ :sub:`0`
+      - 0
+      - 0
+      - 0
+      - 0
+      - 0
+      - 0
+    * .. _MEDIA-BUS-FMT-RGB888-1X36-CPADLO:
+
+      - MEDIA_BUS_FMT_RGB888_1X36_CPADLO
+      - 0x1021
+      -
+      - r\ :sub:`7`
+      - r\ :sub:`6`
+      - r\ :sub:`5`
+      - r\ :sub:`4`
+      - r\ :sub:`3`
+      - r\ :sub:`2`
+      - r\ :sub:`1`
+      - r\ :sub:`0`
+      - 0
+      - 0
+      - 0
+      - 0
+      - g\ :sub:`7`
+      - g\ :sub:`6`
+      - g\ :sub:`5`
+      - g\ :sub:`4`
+      - g\ :sub:`3`
+      - g\ :sub:`2`
+      - g\ :sub:`1`
+      - g\ :sub:`0`
+      - 0
+      - 0
+      - 0
+      - 0
+      - b\ :sub:`7`
+      - b\ :sub:`6`
+      - b\ :sub:`5`
+      - b\ :sub:`4`
+      - b\ :sub:`3`
+      - b\ :sub:`2`
+      - b\ :sub:`1`
+      - b\ :sub:`0`
+      - 0
+      - 0
+      - 0
+      - 0
     * .. _MEDIA-BUS-FMT-RGB121212-1X36:
 
       - MEDIA_BUS_FMT_RGB121212_1X36
-- 
2.25.1

