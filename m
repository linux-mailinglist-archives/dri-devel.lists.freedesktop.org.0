Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AEDB07D42
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 20:58:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F5A210E2D0;
	Wed, 16 Jul 2025 18:58:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="MuzS/1YB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011070.outbound.protection.outlook.com [52.101.70.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5477210E2D0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 18:58:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nuqWkzD2AXXLQYCDmUBbztRnnPKSg6MYKCQ+1OylAr9ZM0lCpKpedDKYrFq78H8xznlHIa8hgRxZzNRVeye373zhk/feLxPI/xu0C7rZISGPT0sIzELVDj/H1kMPzXvJOJJauxe/WzDffAeqtvYkqU9fWJJmxbiDEmZnvRuteXDNriUY5Mm7iHt7aA/fy8tG8zrfYgCpsZ8GkR9Km54MfwAFiTOgguvoT6m/B+IQQssCN/EOMf/OZt6qniT29qoc9FZMNK8t6C8Cr3u/7Eh0qe+R7xrl5uCa81H45TQZleu2WDGXKt4oAMJjqMUvl1MjCJi3lNKH5SsTlufFs6eNSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gzrQROSNPQrEgAmLNfmorjZ1wwZXgB3JDz673SBHJdE=;
 b=zEcqk56tRFSOkvZIjRxFJJsT4jJKvp3uF2Uq+xbDPdjd79wXLtj7pZ36OgTWy7QwUO63V2awZvGKZ112NVB8QNvN5Iu6sNjtv8st6nmbfC+oHtjCOSKLb4OVj+zIAHmo9IpBuB4dgQaGGxUfCpLxaxNRGx6a7RH5qcBj4xgN1quFQn4+xFYBp+qb+GICFvj9rDGFpsr2nvz6MSIAeawyQ6AWH7VoKi0ivn0rIn2mlTS4jRHnoOOD+YsMYqo4UERWxADVIAGbZSFH+2K3aTHZ0VLEhXj0p3G7wGUfeX8Ve7/oowQoTde1H9aXxVkFmK0pMY0129I1EwV1UCYgf2eR8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gzrQROSNPQrEgAmLNfmorjZ1wwZXgB3JDz673SBHJdE=;
 b=MuzS/1YB4ZoMNVlGPibjE7fcD16wiMLVQNZqCZZpyppTZ+cwW2R6es3HkYfi283iexy5Jx6ZghA47xfehs9Ps1cJ/3TB35xB5LBs5+9GL7QdQ8joX355cxtPcZvQr6GNsyfKbG5IBRzWKe/wg7Wn84oSx75nn6A89ShCFwkZhJmro1Cc6AWTj3h0N8hu03B9ElUbAlxZy6Pp46gvSSRvSNoVjL7ra6SPQ7myfnjBi6p8IsmzP+aJ7dbq75Wq2nniF+YENKAUI57wh7EgE6sRwZBgp4ZP3Qzi4A7lD8jUXhm4XueKnmy9OPEQwiUANACa+12Pg9UKgnfT+b4BW2jUYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBAPR04MB7287.eurprd04.prod.outlook.com (2603:10a6:10:1a4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Wed, 16 Jul
 2025 18:58:40 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8922.028; Wed, 16 Jul 2025
 18:58:40 +0000
Date: Wed, 16 Jul 2025 14:58:34 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: imx@lists.linux.dev, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
 Sandor Yu <sandor.yu@nxp.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 07/10] drm/imx: Add support for i.MX94 DCIF
Message-ID: <aHf2WlIHRaUUM4bw@lizhi-Precision-Tower-5810>
References: <20250716081519.3400158-1-laurentiu.palcu@oss.nxp.com>
 <20250716081519.3400158-8-laurentiu.palcu@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716081519.3400158-8-laurentiu.palcu@oss.nxp.com>
X-ClientProxiedBy: AM0PR02CA0011.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::24) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBAPR04MB7287:EE_
X-MS-Office365-Filtering-Correlation-Id: abe81aee-34a9-49da-3963-08ddc49ac6cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|52116014|7416014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XHJ3KOiP69zeyk8xMx4gIWKNDp3mUUbmFDtMi9QuLwjGS7nEx/3j6GVzL8nA?=
 =?us-ascii?Q?YYFFKhK1BAGuMJx4OWxTVISTQhfMF3NquvdGQKJz+D/QmHTALbcnxxaDG32Z?=
 =?us-ascii?Q?xry4xiQa7NEUysJcO7NfPyJ+CWEHJL3T81IWkTrxpfVlV3mjPCvy4CqDWVP0?=
 =?us-ascii?Q?t/TwD+dGB2EQK2lOt4XJFNm+9WggZT/62cfyw+wgeA9d0HT1nvzDVE0btqba?=
 =?us-ascii?Q?F1dKFnPFl53mWH3Aiv+O0EHdXRRbGES/ZnTAvL3lmRq7qEm39+NO+oCy7sSW?=
 =?us-ascii?Q?AhlN3XQfYKkM762zbOiXfXmh1a0C9FTVLFzPR4SLFa3CNIhZ+prHOZ4fZDD4?=
 =?us-ascii?Q?3/widztrsJ5xAoN87zZ5Yxpbi5SQLdoG1anZd46wkZVkKGtj1+O3Z3dow+4F?=
 =?us-ascii?Q?nCCEvG31CAhR73TnlNBHW1BH7NT61o/JFVPQ1ZnfGZpqjoVpobdWkoN+D4cT?=
 =?us-ascii?Q?dvWQYU73mrDKn6JyywMUbNp/krth5wPunoiX2NvDSV4EMH6UDse+/E8vTTn5?=
 =?us-ascii?Q?0Yj465rTyZqtqYtHWsKWOKcAdS5Uvj6L3Gg/rqriBNhVylK0/St8PuLEwG5a?=
 =?us-ascii?Q?2zrSbnonpNiIOh5q6lX9skQFfGDb/udjUYRnF7ZQooIGmbf1dEzWvv+iPJkH?=
 =?us-ascii?Q?W66aBQkfM7AGuWdIe7uOzT9iOBrom9uVPeW0Mpq9+M0D7A3ESfBDom/R3yvb?=
 =?us-ascii?Q?fbRzwCUGgJHZH0n/phQvNlbPifEcXzr9nSQ7HwpuityE0PAaeI4ENXsTwt5s?=
 =?us-ascii?Q?wpF+ZcW+/N0VIZG1Tq1BuVQEVv7zLr97zCu3mPmn85Q0KZMxcQX4K05wtpOm?=
 =?us-ascii?Q?zNkpmj77sYLRDXdf/IE3NoMCIcWm+6K/RYVO1vtWT2whuD08MULiWR/H3m40?=
 =?us-ascii?Q?Id3KjVKqaAgxUjP5ZMwKy3fA4l4nCMDI8AYC85RoLJrFZ69ZJuF3uUC0ADoF?=
 =?us-ascii?Q?oEJzoYBV7y2QtnGZ2cMtIZKqqyCAlEEL1KfDabA0yzcnc7jwAbHPR1PCvJDh?=
 =?us-ascii?Q?fo/jqP2Gt+KGa/n1CIc1ZUDYkUoh4jkYDLoEOGOMVgE+bg+PWyorvbKmFp0y?=
 =?us-ascii?Q?YcJHZcL2qL+SDZkZPQdTgFIzMBrGi0ae/l9Mwod6PL96FuDZujzBmBLoueUT?=
 =?us-ascii?Q?GgzS9XYKkVBYpyTHdHpF/OJm2bQwehtviqQCISPE5UEva6qsXAyMw3/IT+Hc?=
 =?us-ascii?Q?vW4A2tHokuSt/mtcQrwFMiUCIHiwCXV/8ZAXYNetOzfzHA5svXOxaL8z9fnO?=
 =?us-ascii?Q?d8pr2qHQkwuYWGgGj/ClkQXMnvPiAk90c2MPM5lRpab5aytezBNNGVPrVnHt?=
 =?us-ascii?Q?VUqJ97G7EbPm0UnmMKcoTPCbUf1w4neHkwokflOlhoCtawrukGy8cS4vYEQS?=
 =?us-ascii?Q?3jL6ssSqloQOCn8WwILzUPQ8rXUvcHzhmed4+dOfZSYq0TNu3UN4sEKfM5uy?=
 =?us-ascii?Q?Vvxd7hmSP3hKs3e2arREb97BpTHntfghRTy0PGG5IyACgi8H8DGOZw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(52116014)(7416014)(366016)(19092799006)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MzE72JZZxOku1M63b7iSGuV12fn5buFYdcBcR61p0+18qfeXpRCyy9Isf1Ht?=
 =?us-ascii?Q?8kx/MG5ZjrI/wzZ+VMzNoQF6lPaIHxXGyLd4AFYq3OL2hxv1gQuHx23p3+NE?=
 =?us-ascii?Q?vC51HwTW1TOnKfUUHwFE0/Qse9k0M8/TN4V0wwhAtVBk7bXb5pVGPytibek3?=
 =?us-ascii?Q?M8XU696tFiCesSFVAPquedX5U8KPaITccZexpkaubzRltkF3A1w5zRrfmXCE?=
 =?us-ascii?Q?VdqlyXPNl4hvqNPb+1d3tjndwBMkBJLQ1DUyt2ORPyhmlh+mnc/w9Zzt8O+1?=
 =?us-ascii?Q?pOVRDTN8jHWo+FUfhx5XfnavsroyOUz5YPEBkADD1Q+1nRgjA9O05PWgznl3?=
 =?us-ascii?Q?lHMkvhAgs1GtnCqjtJEb00K3RnKQdfu8OVDY2LRyGAJfTQ2WwvIo62qL8gtN?=
 =?us-ascii?Q?l1Yf0QMCpPL/UPSvxUrgkQBvMojshkT+KHkbVh6slpOP3zxbMuS4V4GjyR+T?=
 =?us-ascii?Q?sF6pVTTIzFqI1x3VxY9XcSMysKwHI0HUZxqJai4HxWuESVAugA/WovQ11+wT?=
 =?us-ascii?Q?bJBHiHx6+90/dQF9fECB8KIMJKRV5DA9YGkxl7x5/wEmkT87YoWhG1SbbCf3?=
 =?us-ascii?Q?FcOEYVXbvRGFqkplwkXvuTpC5fji1bNPvbu/X0A5yEuNx56ReuRY7ms++9cU?=
 =?us-ascii?Q?tKybiGgIYERO9urkn0mJWmAVLq9IXmZ8b4o04jUiVDQj8v/yhGcRHCeD+uCh?=
 =?us-ascii?Q?5wuDJHPdH81TK32webf46SBAgLw+jmOlWgopwbVxdauILYxfHykTc4rBTF7w?=
 =?us-ascii?Q?dyqgKH3PpXFbr8r2faQf6x4QAV6F/PihbHG9Le9zfLJEvBJc8h4syvIcsKV8?=
 =?us-ascii?Q?u/tqFB9iVWDjg2VO2sNIgGL2yNAQgLQ1ehqYgTdYL3aAATlbDasV1nD0a6dn?=
 =?us-ascii?Q?lCxdTIbfiWxnO6EWc7GCQFIOkCodV2z/J6aMKKdoCpvOEHClosMnKsuYg3b4?=
 =?us-ascii?Q?LYjZV/Mo3lAbB2xFRSPNUKmrsqbKlm+ZkrPcOQoICkqGUR9tjhbqDUlTXS4+?=
 =?us-ascii?Q?3041MD/4p9zeRaQeHpQT/rYyy86ymp6kAxv0vQC0s1lbqaDX/l0GS/hemMiv?=
 =?us-ascii?Q?mHfyOwx3/0K8h1nsnsNbUFRgyrcddl9bcbmu6LVFQ5cWmZtapWibr6aFdnf9?=
 =?us-ascii?Q?3NpvtSlXcXPymJNXvwpZ7mRhY330+XbiGnQLtho8IHxdW6iK9whSe4nyrG2U?=
 =?us-ascii?Q?rQ28prPQUOTfjjUPC8CR+8j0Wwe47NdCYMa9GQn7mFQ1SrhAD/BLC5TOSyks?=
 =?us-ascii?Q?lUPybKUydO0AwsO0X+BHKrloC8K3WI474Jkc7VYQutiNKJL/0u4vV6GfRovu?=
 =?us-ascii?Q?dd0uE22/1mhSd1TTDYrwvbrueqOdQ3ce9+CtQP6pZg/1Q0cIBspt2wX357iv?=
 =?us-ascii?Q?uzeos8yHhawS8f5SJJRjeAnbRxf8YMXB9f0ZJ3GlnM/xxR84uQOel4NCpyq7?=
 =?us-ascii?Q?kio3NU6g1TEZKCtGPDYLJaoRN7Ke8wRa/TPOFFZ0l2aPpKOU+sW15oePjwk5?=
 =?us-ascii?Q?n6iwC5PFqB2vnAGIFfWPN0GGZuePVtNHHdJ1Fe/Epm5XK0Z0FIR4cdwmUwSH?=
 =?us-ascii?Q?7jsbipGaVriAJ+i5YpRAqj1Q+rE04a4HO80+tjRR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abe81aee-34a9-49da-3963-08ddc49ac6cf
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 18:58:39.9547 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G7gJm2LYsspTj5IEwPPL05/Hgy9rl+Obp/NS03FlPifSbln8QMJPaiuVx0fPAwUNWhwFeuEevYnQYZU/PIVZGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7287
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

On Wed, Jul 16, 2025 at 11:15:11AM +0300, Laurentiu Palcu wrote:
> From: Sandor Yu <sandor.yu@nxp.com>
>
> The i.MX94 Display Control Interface features:
>  * Up to maximum 3 layers of alpha blending:
>     - 1 background layer(Layer 0);
>     - 1 foreground layer(Layer 1);
>     - A programmable constant color behind the background layer;
>  * Each layer supports:
>     - programmable plane size;
>     - programmable background color;
>     - embedded alpha and global alpha;
>  * Data output with CRC checksum for 4 programmable regions;
>
> Signed-off-by: Sandor Yu <sandor.yu@nxp.com>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> ---
>  drivers/gpu/drm/imx/Kconfig           |   1 +
>  drivers/gpu/drm/imx/Makefile          |   1 +
>  drivers/gpu/drm/imx/dcif/Kconfig      |  15 +
>  drivers/gpu/drm/imx/dcif/Makefile     |   5 +
>  drivers/gpu/drm/imx/dcif/dcif-crc.c   | 211 ++++++++
>  drivers/gpu/drm/imx/dcif/dcif-crc.h   |  52 ++
>  drivers/gpu/drm/imx/dcif/dcif-crtc.c  | 695 ++++++++++++++++++++++++++
>  drivers/gpu/drm/imx/dcif/dcif-drv.c   | 282 +++++++++++
>  drivers/gpu/drm/imx/dcif/dcif-drv.h   |  87 ++++
>  drivers/gpu/drm/imx/dcif/dcif-kms.c   | 101 ++++
>  drivers/gpu/drm/imx/dcif/dcif-plane.c | 269 ++++++++++
>  drivers/gpu/drm/imx/dcif/dcif-reg.h   | 266 ++++++++++
>  12 files changed, 1985 insertions(+)
>  create mode 100644 drivers/gpu/drm/imx/dcif/Kconfig
>  create mode 100644 drivers/gpu/drm/imx/dcif/Makefile
>  create mode 100644 drivers/gpu/drm/imx/dcif/dcif-crc.c
>  create mode 100644 drivers/gpu/drm/imx/dcif/dcif-crc.h
>  create mode 100644 drivers/gpu/drm/imx/dcif/dcif-crtc.c
>  create mode 100644 drivers/gpu/drm/imx/dcif/dcif-drv.c
>  create mode 100644 drivers/gpu/drm/imx/dcif/dcif-drv.h
>  create mode 100644 drivers/gpu/drm/imx/dcif/dcif-kms.c
>  create mode 100644 drivers/gpu/drm/imx/dcif/dcif-plane.c
>  create mode 100644 drivers/gpu/drm/imx/dcif/dcif-reg.h
>
> diff --git a/drivers/gpu/drm/imx/Kconfig b/drivers/gpu/drm/imx/Kconfig
> index 3e8c6edbc17c2..1b6ced5c60b51 100644
> --- a/drivers/gpu/drm/imx/Kconfig
> +++ b/drivers/gpu/drm/imx/Kconfig
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>
>  source "drivers/gpu/drm/imx/dc/Kconfig"
> +source "drivers/gpu/drm/imx/dcif/Kconfig"
>  source "drivers/gpu/drm/imx/dcss/Kconfig"
>  source "drivers/gpu/drm/imx/ipuv3/Kconfig"
>  source "drivers/gpu/drm/imx/lcdc/Kconfig"
> diff --git a/drivers/gpu/drm/imx/Makefile b/drivers/gpu/drm/imx/Makefile
> index c7b317640d71d..2b9fd85eefaa3 100644
> --- a/drivers/gpu/drm/imx/Makefile
> +++ b/drivers/gpu/drm/imx/Makefile
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>
>  obj-$(CONFIG_DRM_IMX8_DC) += dc/
> +obj-$(CONFIG_DRM_IMX_DCIF) += dcif/
>  obj-$(CONFIG_DRM_IMX_DCSS) += dcss/
>  obj-$(CONFIG_DRM_IMX) += ipuv3/
>  obj-$(CONFIG_DRM_IMX_LCDC) += lcdc/
> diff --git a/drivers/gpu/drm/imx/dcif/Kconfig b/drivers/gpu/drm/imx/dcif/Kconfig
> new file mode 100644
> index 0000000000000..c33c662721d36
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dcif/Kconfig
> @@ -0,0 +1,15 @@
> +config DRM_IMX_DCIF
> +	tristate "DRM support for NXP i.MX94 DCIF"
> +	select DRM_KMS_HELPER
> +	select VIDEOMODE_HELPERS
> +	select DRM_GEM_DMA_HELPER
> +	select DRM_DISPLAY_HELPER
> +	select DRM_BRIDGE_CONNECTOR
> +	select DRM_CLIENT_SELECTION
> +	depends on DRM && OF && ARCH_MXC
> +	depends on COMMON_CLK
> +	help
> +	  Enable NXP i.MX94 Display Control Interface(DCIF) support. The DCIF is
> +	  a system master that fetches graphics stored in memory and displays
> +	  them on a TFT LCD panel or connects to a display interface depending
> +	  on the chip configuration.
> diff --git a/drivers/gpu/drm/imx/dcif/Makefile b/drivers/gpu/drm/imx/dcif/Makefile
> new file mode 100644
> index 0000000000000..b429572040f0e
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dcif/Makefile
> @@ -0,0 +1,5 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +imx-dcif-drm-objs := dcif-crc.o dcif-crtc.o dcif-drv.o dcif-kms.o dcif-plane.o
> +
> +obj-$(CONFIG_DRM_IMX_DCIF) += imx-dcif-drm.o
> diff --git a/drivers/gpu/drm/imx/dcif/dcif-crc.c b/drivers/gpu/drm/imx/dcif/dcif-crc.c
> new file mode 100644
> index 0000000000000..f7d182039d06c
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dcif/dcif-crc.c
> @@ -0,0 +1,211 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +#include <linux/regmap.h>
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_rect.h>
> +
> +#include "dcif-crc.h"
> +#include "dcif-reg.h"
> +
...
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_fbdev_dma.h>
> +#include <drm/drm_gem_dma_helper.h>
> +#include <drm/drm_modeset_helper.h>
> +#include <drm/drm_probe_helper.h>
> +
> +#include "dcif-drv.h"
> +#include "dcif-reg.h"
> +
> +#define QOS_SETTING			0x1c
> +#define  DISPLAY_PANIC_QOS_MASK		0x70
> +#define  DISPLAY_PANIC_QOS(n)		(((n) & 0x7) << 4)
> +#define  DISPLAY_ARQOS_MASK		0x7
> +#define  DISPLAY_ARQOS(n)		((n) & 0x7)
> +
> +#define DCIF_CPU_DOMAIN			0
> +
> +#define DRIVER_NAME			"imx-dcif-drm"

Only use once, needn't such define. There are a bunch of patch to remove
this kind define in recent mail list.

> +
> +DEFINE_DRM_GEM_DMA_FOPS(dcif_driver_fops);
> +
> +static struct drm_driver dcif_driver = {
> +	.driver_features	= DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
> +	DRM_GEM_DMA_DRIVER_OPS,
> +	DRM_FBDEV_DMA_DRIVER_OPS,
> +	.fops			= &dcif_driver_fops,
> +	.name			= "imx-dcif",
> +	.desc			= "i.MX DCIF DRM graphics",
> +	.major			= 1,
> +	.minor			= 0,
> +	.patchlevel		= 0,
> +};
> +
> +static int dcif_set_qos(struct dcif_dev *dcif)
> +{
> +	struct drm_device *drm = &dcif->drm;
> +	int ret;
> +
> +	ret = regmap_update_bits(dcif->blkctrl_regmap, QOS_SETTING,
> +				 DISPLAY_PANIC_QOS_MASK | DISPLAY_ARQOS_MASK,
> +				 DISPLAY_PANIC_QOS(0x3) | DISPLAY_ARQOS(0x3));

Are you sure have to set qos here? This kind of private interface to other
controller is not perferred now.

Frank
> +	if (ret < 0)
> +		dev_err(drm->dev, "failed to set QoS: %d\n", ret);
> +
> +	return ret;
> +}
> +
> +static void dcif_read_chip_info(struct dcif_dev *dcif)
> +{
> +	struct drm_device *drm = &dcif->drm;
> +	u32 val, vmin, vmaj;
> +
> +	pm_runtime_get_sync(drm->dev);
> +
> +	regmap_read(dcif->regmap, DCIF_VER, &val);
> +
> +	dcif->has_crc = val & 0x2;
> +
> +	vmin = DCIF_VER_GET_MINOR(val);
> +	vmaj = DCIF_VER_GET_MAJOR(val);
> +	DRM_DEV_DEBUG(drm->dev, "DCIF version is %d.%d\n", vmaj, vmin);
> +
> +	pm_runtime_put_sync(drm->dev);
> +}
> +
> +static const struct regmap_config dcif_regmap_config = {
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +	.fast_io = true,
> +	.max_register = 0x20250,
> +	.cache_type = REGCACHE_NONE,
> +	.disable_locking = true,
> +};
> +
> +static const char * const dcif_clks[] = {
> +	"apb",
> +	"axi",
> +	"pix",
> +};
> +
> +static int dcif_probe(struct platform_device *pdev)
> +{
> +	struct device_node *np = pdev->dev.of_node;
> +	struct dcif_dev *dcif;
> +	struct drm_device *drm;
> +	int ret;
> +	int i;
> +
> +	if (!pdev->dev.of_node)
> +		return -ENODEV;

Needn't check this.

> +
> +	dcif = devm_drm_dev_alloc(&pdev->dev, &dcif_driver, struct dcif_dev, drm);
> +	if (IS_ERR(dcif))
> +		return PTR_ERR(dcif);
> +
> +	/* CPU 0 domain for interrupt control */
> +	dcif->cpu_domain = DCIF_CPU_DOMAIN;
> +
> +	drm = &dcif->drm;
> +	dev_set_drvdata(&pdev->dev, dcif);
> +
> +	dcif->reg_base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(dcif->reg_base))
> +		return dev_err_probe(drm->dev, PTR_ERR(dcif->reg_base),
> +				     "failed to get reg base\n");
> +
> +	for (i = 0; i < 3; i++) {
> +		dcif->irq[i] = platform_get_irq(pdev, i);
> +		if (dcif->irq[i] < 0)
> +			return dev_err_probe(drm->dev, dcif->irq[i],
> +					     "failed to get domain%d irq\n", i);
> +	}
> +
> +	dcif->blkctrl_regmap = syscon_regmap_lookup_by_phandle(np, "nxp,blk-ctrl");
> +	if (IS_ERR(dcif->blkctrl_regmap))
> +		return dev_err_probe(drm->dev, PTR_ERR(dcif->blkctrl_regmap),
> +				     "failed to get blk-ctrl regmap\n");
> +
> +	dcif->regmap = devm_regmap_init_mmio(drm->dev, dcif->reg_base, &dcif_regmap_config);
> +	if (IS_ERR(dcif->regmap))
> +		return dev_err_probe(drm->dev, PTR_ERR(dcif->regmap),
> +				     "failed to init DCIF regmap\n");
> +
> +	dcif->num_clks = ARRAY_SIZE(dcif_clks);
> +	dcif->clks = devm_kcalloc(drm->dev, dcif->num_clks, sizeof(*dcif->clks), GFP_KERNEL);
> +	if (!dcif->clks)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < dcif->num_clks; i++)
> +		dcif->clks[i].id = dcif_clks[i];
> +
> +	ret = devm_clk_bulk_get(drm->dev, dcif->num_clks, dcif->clks);

If use devm_clk_bulk_get_all() will simplify code much. needn't
dcif->clks = devm_kcalloc(drm->dev, dcif->num_clks, sizeof(*dcif->clks), GFP_KERNEL)
and dcif_clks.

> +	if (ret)
> +		return dev_err_probe(drm->dev, ret, "cannot get required clocks\n");
> +
> +	dma_set_mask_and_coherent(drm->dev, DMA_BIT_MASK(32));
> +
> +	devm_pm_runtime_enable(drm->dev);
> +
> +	ret = devm_request_irq(drm->dev, dcif->irq[dcif->cpu_domain],
> +			       dcif_irq_handler, 0, drm->driver->name, drm);
> +	if (ret < 0) {
> +		dev_err(drm->dev, "failed to install IRQ handler: %d\n", ret);
> +		return ret;

return dev_err_probe

> +	}
> +
> +	dcif_read_chip_info(dcif);
> +
> +	ret = dcif_kms_prepare(dcif);
> +	if (ret)
> +		return ret;
> +
> +	ret = drm_dev_register(drm, 0);
> +	if (ret) {
> +		dev_err(drm->dev, "failed to register drm device: %d\n", ret);
> +		return ret;

return dev_err_probe

Frank
> +	}
> +
> +	drm_client_setup(drm, NULL);
> +
> +	return 0;
> +}
> +
> +static void dcif_remove(struct platform_device *pdev)
> +{
> +	struct dcif_dev *dcif = dev_get_drvdata(&pdev->dev);
> +	struct drm_device *drm = &dcif->drm;
> +
> +	drm_dev_unregister(drm);
> +
> +	drm_atomic_helper_shutdown(drm);
> +}
> +
> +static void dcif_shutdown(struct platform_device *pdev)
> +{
> +	struct dcif_dev *dcif = dev_get_drvdata(&pdev->dev);
> +	struct drm_device *drm = &dcif->drm;
> +
> +	drm_atomic_helper_shutdown(drm);
> +}
> +
> +static int dcif_runtime_suspend(struct device *dev)
> +{
> +	struct dcif_dev *dcif = dev_get_drvdata(dev);
> +
> +	clk_bulk_disable_unprepare(dcif->num_clks, dcif->clks);
> +
> +	return 0;
> +}
> +
> +static int dcif_runtime_resume(struct device *dev)
> +{
> +	struct dcif_dev *dcif = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = clk_bulk_prepare_enable(dcif->num_clks, dcif->clks);
> +	if (ret) {
> +		dev_err(dev, "failed to enable clocks: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = dcif_set_qos(dcif);
> +	if (ret) {
> +		clk_bulk_disable_unprepare(dcif->num_clks, dcif->clks);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int dcif_suspend(struct device *dev)
> +{
> +	struct dcif_dev *dcif = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = drm_mode_config_helper_suspend(&dcif->drm);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (pm_runtime_suspended(dev))
> +		return 0;
> +
> +	return dcif_runtime_suspend(dev);
> +}
> +
> +static int dcif_resume(struct device *dev)
> +{
> +	struct dcif_dev *dcif = dev_get_drvdata(dev);
> +	int ret;
> +
> +	if (!pm_runtime_suspended(dev)) {
> +		ret = dcif_runtime_resume(dev);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return drm_mode_config_helper_resume(&dcif->drm);
> +}
> +
> +static const struct dev_pm_ops dcif_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(dcif_suspend, dcif_resume)
> +	SET_RUNTIME_PM_OPS(dcif_runtime_suspend, dcif_runtime_resume, NULL)
> +};
> +
> +static const struct of_device_id dcif_dt_ids[] = {
> +	{ .compatible = "nxp,imx94-dcif", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, dcif_dt_ids);
> +
> +static struct platform_driver dcif_platform_driver = {
> +	.probe	= dcif_probe,
> +	.remove	= dcif_remove,
> +	.shutdown = dcif_shutdown,
> +	.driver	= {
> +		.name		= DRIVER_NAME,
> +		.of_match_table	= dcif_dt_ids,
> +		.pm		= pm_ptr(&dcif_pm_ops),
> +	},
> +};
> +module_platform_driver(dcif_platform_driver);
> +
> +MODULE_AUTHOR("NXP Semiconductor");
> +MODULE_DESCRIPTION("i.MX94 DCIF DRM driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/gpu/drm/imx/dcif/dcif-drv.h b/drivers/gpu/drm/imx/dcif/dcif-drv.h
> new file mode 100644
> index 0000000000000..f4073c90b40d4
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dcif/dcif-drv.h
> @@ -0,0 +1,87 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +#ifndef __DCIF_DRV_H__
> +#define __DCIF_DRV_H__
> +
> +#include <linux/clk.h>
> +#include <linux/irqreturn.h>
> +#include <linux/kernel.h>
> +
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_encoder.h>
> +#include <drm/drm_plane.h>
> +#include <drm/drm_vblank.h>
> +
> +struct dcif_crc;
> +
> +struct dcif_dev {
> +	struct drm_device drm;
> +	void __iomem *reg_base;
> +
> +	struct regmap *regmap;
> +	struct regmap *blkctrl_regmap;
> +	int irq[3];
> +
> +	unsigned int num_clks;
> +	struct clk_bulk_data *clks;
> +
> +	struct drm_crtc crtc;
> +	struct {
> +		struct drm_plane primary;
> +		struct drm_plane overlay;
> +	} planes;
> +	struct drm_encoder encoder;
> +
> +	struct drm_pending_vblank_event *event;
> +	/* Implement crc */
> +	bool has_crc;
> +	bool crc_is_enabled;
> +
> +	/* CPU domain for interrupt control */
> +	int cpu_domain;
> +};
> +
> +enum dcif_crc_source {
> +	DCIF_CRC_SRC_NONE,
> +	DCIF_CRC_SRC_FRAME,
> +	DCIF_CRC_SRC_FRAME_ROI,
> +};
> +
> +struct dcif_crc {
> +	enum dcif_crc_source	source;
> +	struct drm_rect		roi;
> +};
> +
> +struct dcif_crtc_state {
> +	struct drm_crtc_state	base;
> +	struct dcif_crc		crc;
> +	u32			bus_format;
> +	u32			bus_flags;
> +};
> +
> +static inline struct dcif_dev *to_dcif_dev(struct drm_device *drm_dev)
> +{
> +	return container_of(drm_dev, struct dcif_dev, drm);
> +}
> +
> +static inline struct dcif_dev *crtc_to_dcif_dev(struct drm_crtc *crtc)
> +{
> +	return to_dcif_dev(crtc->dev);
> +}
> +
> +static inline struct dcif_crtc_state *to_dcif_crtc_state(struct drm_crtc_state *s)
> +{
> +	return container_of(s, struct dcif_crtc_state, base);
> +}
> +
> +irqreturn_t dcif_irq_handler(int irq, void *data);
> +int dcif_crtc_init(struct dcif_dev *dcif);
> +int dcif_plane_init(struct dcif_dev *dcif);
> +int dcif_kms_prepare(struct dcif_dev *dcif);
> +
> +#endif
> diff --git a/drivers/gpu/drm/imx/dcif/dcif-kms.c b/drivers/gpu/drm/imx/dcif/dcif-kms.c
> new file mode 100644
> index 0000000000000..4e4c9248d7cb7
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dcif/dcif-kms.c
> @@ -0,0 +1,101 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_bridge_connector.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_print.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_simple_kms_helper.h>
> +
> +#include "dcif-drv.h"
> +#include "dcif-reg.h"
> +
> +static int dcif_kms_init(struct dcif_dev *dcif)
> +{
> +	struct drm_device *drm = &dcif->drm;
> +	struct device_node *np = drm->dev->of_node;
> +	struct drm_connector *connector;
> +	struct drm_bridge *bridge;
> +	int ret;
> +
> +	ret = dcif_crtc_init(dcif);
> +	if (ret)
> +		return ret;
> +
> +	bridge = devm_drm_of_get_bridge(drm->dev, np, 0, 0);
> +	if (IS_ERR(bridge))
> +		return dev_err_probe(drm->dev, PTR_ERR(bridge), "Failed to find bridge\n");
> +
> +	dcif->encoder.possible_crtcs = drm_crtc_mask(&dcif->crtc);
> +	ret = drm_simple_encoder_init(drm, &dcif->encoder, DRM_MODE_ENCODER_NONE);
> +	if (ret) {
> +		drm_err(drm, "failed to initialize encoder: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = drm_bridge_attach(&dcif->encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> +	if (ret) {
> +		drm_err(drm, "failed to attach bridge to encoder: %d\n", ret);
> +		return ret;
> +	}
> +
> +	connector = drm_bridge_connector_init(drm, &dcif->encoder);
> +	if (IS_ERR(connector)) {
> +		drm_err(drm, "failed to initialize bridge connector: %d\n", ret);
> +		return PTR_ERR(connector);
> +	}
> +
> +	ret = drm_connector_attach_encoder(connector, &dcif->encoder);
> +	if (ret)
> +		drm_err(drm, "failed to attach encoder to connector: %d\n", ret);
> +
> +	return ret;
> +}
> +
> +static const struct drm_mode_config_funcs dcif_mode_config_funcs = {
> +	.fb_create     = drm_gem_fb_create,
> +	.atomic_check  = drm_atomic_helper_check,
> +	.atomic_commit = drm_atomic_helper_commit,
> +};
> +
> +static const struct drm_mode_config_helper_funcs dcif_mode_config_helpers = {
> +	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
> +};
> +
> +int dcif_kms_prepare(struct dcif_dev *dcif)
> +{
> +	struct drm_device *drm = &dcif->drm;
> +	int ret;
> +
> +	ret = drmm_mode_config_init(drm);
> +	if (ret)
> +		return ret;
> +
> +	ret = dcif_kms_init(dcif);
> +	if (ret)
> +		return ret;
> +
> +	drm->mode_config.min_width	= 1;
> +	drm->mode_config.min_height	= 1;
> +	drm->mode_config.max_width	= 1920;
> +	drm->mode_config.max_height	= 1920;
> +	drm->mode_config.funcs		= &dcif_mode_config_funcs;
> +	drm->mode_config.helper_private	= &dcif_mode_config_helpers;
> +
> +	ret = drm_vblank_init(drm, 1);
> +	if (ret < 0) {
> +		drm_err(drm, "failed to initialize vblank: %d\n", ret);
> +		return ret;
> +	}
> +
> +	drm_mode_config_reset(drm);
> +
> +	drmm_kms_helper_poll_init(drm);
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/imx/dcif/dcif-plane.c b/drivers/gpu/drm/imx/dcif/dcif-plane.c
> new file mode 100644
> index 0000000000000..54ab8edd11e0c
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dcif/dcif-plane.c
> @@ -0,0 +1,269 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +#include <linux/regmap.h>
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_blend.h>
> +#include <drm/drm_fb_dma_helper.h>
> +#include <drm/drm_fourcc.h>
> +#include <drm/drm_framebuffer.h>
> +#include <drm/drm_gem_atomic_helper.h>
> +#include <drm/drm_gem_dma_helper.h>
> +#include <drm/drm_print.h>
> +#include <drm/drm_rect.h>
> +
> +#include "dcif-drv.h"
> +#include "dcif-reg.h"
> +
> +static const u32 dcif_primary_plane_formats[] = {
> +	/* RGB */
> +	DRM_FORMAT_RGB565,
> +	DRM_FORMAT_RGB888,
> +	DRM_FORMAT_XBGR8888,
> +	DRM_FORMAT_XRGB1555,
> +	DRM_FORMAT_XRGB4444,
> +	DRM_FORMAT_XRGB8888,
> +
> +	/* Packed YCbCr */
> +	DRM_FORMAT_YUYV,
> +	DRM_FORMAT_YVYU,
> +	DRM_FORMAT_UYVY,
> +	DRM_FORMAT_VYUY,
> +};
> +
> +static const u32 dcif_overlay_plane_formats[] = {
> +	/* RGB */
> +	DRM_FORMAT_RGB565,
> +	DRM_FORMAT_RGB888,
> +	DRM_FORMAT_XBGR8888,
> +	DRM_FORMAT_XRGB1555,
> +	DRM_FORMAT_XRGB4444,
> +	DRM_FORMAT_XRGB8888,
> +};
> +
> +static inline struct dcif_dev *plane_to_dcif_dev(struct drm_plane *plane)
> +{
> +	return to_dcif_dev(plane->dev);
> +}
> +
> +static inline dma_addr_t drm_plane_state_to_baseaddr(struct drm_plane_state *state)
> +{
> +	struct drm_framebuffer *fb = state->fb;
> +	struct drm_gem_dma_object *dma_obj;
> +	unsigned int x = state->src.x1 >> 16;
> +	unsigned int y = state->src.y1 >> 16;
> +
> +	dma_obj = drm_fb_dma_get_gem_obj(fb, 0);
> +
> +	return dma_obj->dma_addr + fb->offsets[0] + fb->pitches[0] * y + fb->format->cpp[0] * x;
> +}
> +
> +static int dcif_plane_get_layer_id(struct drm_plane *plane)
> +{
> +	return (plane->type == DRM_PLANE_TYPE_PRIMARY) ? 0 : 1;
> +}
> +
> +static int dcif_plane_atomic_check(struct drm_plane *plane, struct drm_atomic_state *state)
> +{
> +	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
> +	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
> +	struct dcif_dev *dcif = plane_to_dcif_dev(plane);
> +	struct drm_framebuffer *fb = new_plane_state->fb;
> +	struct drm_framebuffer *old_fb = old_plane_state->fb;
> +	struct drm_crtc_state *crtc_state;
> +
> +	if (!fb)
> +		return 0;
> +
> +	crtc_state = drm_atomic_get_new_crtc_state(state, &dcif->crtc);
> +	if (WARN_ON(!crtc_state))
> +		return -EINVAL;
> +
> +	/*
> +	 * Force CRTC mode change if framebuffer stride or pixel format have changed.
> +	 */
> +	if (plane->type == DRM_PLANE_TYPE_PRIMARY && old_fb &&
> +	    (fb->pitches[0] != old_fb->pitches[0] || fb->format->format != old_fb->format->format))
> +		crtc_state->mode_changed = true;
> +
> +	return drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
> +						   DRM_PLANE_NO_SCALING, DRM_PLANE_NO_SCALING, true,
> +						   true);
> +}
> +
> +static void dcif_plane_atomic_update(struct drm_plane *plane, struct drm_atomic_state *state)
> +{
> +	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state, plane);
> +	struct dcif_dev *dcif = plane_to_dcif_dev(plane);
> +	int layer_id = dcif_plane_get_layer_id(plane);
> +	struct drm_framebuffer *fb = new_state->fb;
> +	u32 crtc_x, crtc_y, crtc_h, crtc_w;
> +	u32 layer_fmt = 0, yuv_fmt = 0;
> +	dma_addr_t baseaddr;
> +	u32 reg;
> +
> +	if (!fb)
> +		return;
> +
> +	crtc_x = new_state->crtc_x;
> +	crtc_y = new_state->crtc_y;
> +	crtc_h = new_state->crtc_h;
> +	crtc_w = new_state->crtc_w;
> +
> +	/* visible portion of plane on crtc */
> +	regmap_write(dcif->regmap, DCIF_CTRLDESC1(layer_id),
> +		     DCIF_CTRLDESC1_POSX(crtc_x) | DCIF_CTRLDESC1_POSY(crtc_y));
> +	regmap_write(dcif->regmap, DCIF_CTRLDESC2(layer_id),
> +		     DCIF_CTRLDESC2_WIDTH(crtc_w) | DCIF_CTRLDESC2_HEIGHT(crtc_h));
> +
> +	/* pitch size */
> +	reg = DCIF_CTRLDESC3_P_SIZE(2) | DCIF_CTRLDESC3_T_SIZE(2) |
> +	      DCIF_CTRLDESC3_PITCH(fb->pitches[0]);
> +	regmap_write(dcif->regmap, DCIF_CTRLDESC3(layer_id), reg);
> +
> +	/*  address */
> +	baseaddr = drm_fb_dma_get_gem_addr(new_state->fb, new_state, 0);
> +
> +	drm_dbg_kms(plane->dev, "[PLANE:%d:%s] fb address %pad, pitch 0x%08x\n",
> +		    plane->base.id, plane->name, &baseaddr, fb->pitches[0]);
> +
> +	regmap_write(dcif->regmap, DCIF_CTRLDESC4(layer_id), baseaddr);
> +
> +	/* Format */
> +	switch (fb->format->format) {
> +	/* RGB Formats */
> +	case DRM_FORMAT_RGB565:
> +		layer_fmt = CTRLDESCL0_FORMAT_RGB565;
> +		break;
> +	case DRM_FORMAT_RGB888:
> +		layer_fmt = CTRLDESCL0_FORMAT_RGB888;
> +		break;
> +	case DRM_FORMAT_XRGB1555:
> +		layer_fmt = CTRLDESCL0_FORMAT_ARGB1555;
> +		break;
> +	case DRM_FORMAT_XRGB4444:
> +		layer_fmt = CTRLDESCL0_FORMAT_ARGB4444;
> +		break;
> +	case DRM_FORMAT_XBGR8888:
> +		layer_fmt = CTRLDESCL0_FORMAT_ABGR8888;
> +		break;
> +	case DRM_FORMAT_XRGB8888:
> +		layer_fmt = CTRLDESCL0_FORMAT_ARGB8888;
> +		break;
> +
> +	/* YUV Formats */
> +	case DRM_FORMAT_YUYV:
> +		layer_fmt = CTRLDESCL0_FORMAT_YCBCR422;
> +		yuv_fmt = CTRLDESCL0_YUV_FORMAT_VY2UY1;
> +		break;
> +	case DRM_FORMAT_YVYU:
> +		layer_fmt = CTRLDESCL0_FORMAT_YCBCR422;
> +		yuv_fmt = CTRLDESCL0_YUV_FORMAT_UY2VY1;
> +		break;
> +	case DRM_FORMAT_UYVY:
> +		layer_fmt = CTRLDESCL0_FORMAT_YCBCR422;
> +		yuv_fmt = CTRLDESCL0_YUV_FORMAT_Y2VY1U;
> +		break;
> +	case DRM_FORMAT_VYUY:
> +		layer_fmt = CTRLDESCL0_FORMAT_YCBCR422;
> +		yuv_fmt = CTRLDESCL0_YUV_FORMAT_Y2UY1V;
> +		break;
> +
> +	default:
> +		dev_err(dcif->drm.dev, "Unknown pixel format 0x%x\n", fb->format->format);
> +		break;
> +	}
> +
> +	if (plane->type == DRM_PLANE_TYPE_OVERLAY && yuv_fmt == CTRLDESCL0_YUV_FORMAT_Y2UY1V) {
> +		dev_err(dcif->drm.dev, "Overlay plane could not support YUV format\n");
> +		return;
> +	}
> +
> +	reg = DCIF_CTRLDESC0_EN | DCIF_CTRLDESC0_SHADOW_LOAD_EN |
> +	      DCIF_CTRLDESC0_FORMAT(layer_fmt) | DCIF_CTRLDESC0_YUV_FORMAT(yuv_fmt);
> +
> +	/* Alpha */
> +	reg |= DCIF_CTRLDESC0_GLOBAL_ALPHA(new_state->alpha >> 8) | ALPHA_GLOBAL;
> +
> +	regmap_write(dcif->regmap, DCIF_CTRLDESC0(layer_id), reg);
> +}
> +
> +static void dcif_overlay_plane_atomic_disable(struct drm_plane *plane,
> +					      struct drm_atomic_state *state)
> +{
> +	struct dcif_dev *dcif = plane_to_dcif_dev(plane);
> +
> +	regmap_update_bits(dcif->regmap, DCIF_CTRLDESC0(1),
> +			   DCIF_CTRLDESC0_EN | DCIF_CTRLDESC0_SHADOW_LOAD_EN,
> +			   DCIF_CTRLDESC0_SHADOW_LOAD_EN);
> +}
> +
> +static const struct drm_plane_helper_funcs dcif_primary_plane_helper_funcs = {
> +	.prepare_fb	= drm_gem_plane_helper_prepare_fb,
> +	.atomic_check	= dcif_plane_atomic_check,
> +	.atomic_update	= dcif_plane_atomic_update,
> +};
> +
> +static const struct drm_plane_helper_funcs dcif_overlay_plane_helper_funcs = {
> +	.atomic_check	= dcif_plane_atomic_check,
> +	.atomic_update	= dcif_plane_atomic_update,
> +	.atomic_disable = dcif_overlay_plane_atomic_disable,
> +};
> +
> +static const struct drm_plane_funcs dcif_plane_funcs = {
> +	.update_plane		= drm_atomic_helper_update_plane,
> +	.disable_plane		= drm_atomic_helper_disable_plane,
> +	.destroy		= drm_plane_cleanup,
> +	.reset			= drm_atomic_helper_plane_reset,
> +	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
> +	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
> +};
> +
> +int dcif_plane_init(struct dcif_dev *dcif)
> +{
> +	const u32 supported_encodings = BIT(DRM_COLOR_YCBCR_BT601) |
> +					BIT(DRM_COLOR_YCBCR_BT709) |
> +					BIT(DRM_COLOR_YCBCR_BT2020);
> +	const u32 supported_ranges = BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
> +				     BIT(DRM_COLOR_YCBCR_FULL_RANGE);
> +	int ret;
> +
> +	/* primary plane */
> +	drm_plane_helper_add(&dcif->planes.primary, &dcif_primary_plane_helper_funcs);
> +	ret = drm_universal_plane_init(&dcif->drm, &dcif->planes.primary, 1, &dcif_plane_funcs,
> +				       dcif_primary_plane_formats,
> +				       ARRAY_SIZE(dcif_primary_plane_formats), NULL,
> +				       DRM_PLANE_TYPE_PRIMARY, NULL);
> +	if (ret) {
> +		drm_err(&dcif->drm, "failed to initialize primary plane: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = drm_plane_create_color_properties(&dcif->planes.primary, supported_encodings,
> +						supported_ranges, DRM_COLOR_YCBCR_BT601,
> +						DRM_COLOR_YCBCR_LIMITED_RANGE);
> +	if (ret)
> +		return ret;
> +
> +	ret = drm_plane_create_alpha_property(&dcif->planes.primary);
> +	if (ret)
> +		return ret;
> +
> +	/* overlay plane */
> +	drm_plane_helper_add(&dcif->planes.overlay, &dcif_overlay_plane_helper_funcs);
> +	ret = drm_universal_plane_init(&dcif->drm, &dcif->planes.overlay, 1, &dcif_plane_funcs,
> +				       dcif_overlay_plane_formats,
> +				       ARRAY_SIZE(dcif_overlay_plane_formats), NULL,
> +				       DRM_PLANE_TYPE_OVERLAY, NULL);
> +	if (ret) {
> +		drm_err(&dcif->drm, "failed to initialize overlay plane: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return drm_plane_create_alpha_property(&dcif->planes.overlay);
> +}
> diff --git a/drivers/gpu/drm/imx/dcif/dcif-reg.h b/drivers/gpu/drm/imx/dcif/dcif-reg.h
> new file mode 100644
> index 0000000000000..f918bbb6d2d15
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dcif/dcif-reg.h
> @@ -0,0 +1,266 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +/*
> + * Copyright 2025 NXP
> + */
> +#ifndef __DCIF_REG_H__
> +#define __DCIF_REG_H__
> +
> +#include <linux/bits.h>
> +
> +/* Version ID Register */
> +#define DCIF_VER				0x0
> +#define   DCIF_VER_GET_FEATURE(x)		FIELD_GET(GENMASK(15, 0), x)
> +#define   DCIF_VER_GET_MINOR(x)			FIELD_GET(GENMASK(23, 16), x)
> +#define   DCIF_VER_GET_MAJOR(x)			FIELD_GET(GENMASK(31, 24), x)
> +
> +/* Parameter Registers */
> +#define DCIF_PAR_0				0x4
> +#define   DCIF_PAR_0_LAYER_NUM(x)		FIELD_PREP(GENMASK(3, 0), x)
> +#define   DCIF_PAR_0_DOMAIN_NUM(x)		FIELD_PREP(GENMASK(5, 4), x)
> +#define   DCIF_PAR_0_AXI_DATA_WIDTH(x)		FIELD_PREP(GENMASK(7, 6), x)
> +#define   DCIF_PAR_0_CLUT_RAM_NUM(x)		FIELD_PREP(GENMASK(11, 8), x)
> +#define   DCIF_PAR_0_CSC_NUM(x)			FIELD_PREP(GENMASK(13, 12), x)
> +#define   DCIF_PAR_0_CRC_REGION_NUM(x)		FIELD_PREP(GENMASK(18, 16), x)
> +#define   DCIF_PAR_0_BACKUP(x)			FIELD_PREP(GENMASK(31, 28), x)
> +
> +#define DCIF_PAR_1				0x8
> +#define   DCIF_PAR_1_LAYER0_FIFO_SIZE(x)	FIELD_PREP(GENMASK(3, 0), x)
> +#define   DCIF_PAR_1_LAYER1_FIFO_SIZE(x)	FIELD_PREP(GENMASK(7, 4), x)
> +
> +/* Display Control and Parameter Registers */
> +#define DCIF_DISP_CTRL				0x10
> +#define   DCIF_DISP_CTRL_DISP_ON		BIT(0)
> +#define   DCIF_DISP_CTRL_AXI_RD_HOLD		BIT(30)
> +#define   DCIF_DISP_CTRL_SW_RST			BIT(31)
> +#define DCIF_DISP_PAR				0x14
> +#define   DCIF_DISP_PAR_BGND_B(x)		FIELD_PREP(GENMASK(7, 0), x)
> +#define   DCIF_DISP_PAR_BGND_G(x)		FIELD_PREP(GENMASK(15, 8), x)
> +#define   DCIF_DISP_PAR_BGND_R(x)		FIELD_PREP(GENMASK(23, 16), x)
> +#define DCIF_DISP_SIZE				0x18
> +#define   DCIF_DISP_SIZE_DISP_WIDTH(x)		FIELD_PREP(GENMASK(11, 0), x)
> +#define   DCIF_DISP_SIZE_DISP_HEIGHT(x)		FIELD_PREP(GENMASK(27, 16), x)
> +
> +/* Display Status Registers */
> +#define DCIF_DISP_SR0				0x1C
> +#define   DCIF_DISP_SR0_AXI_RD_PEND(x)		FIELD_PREP(GENMASK(4, 0), x)
> +#define   DCIF_DISP_SR0_DPI_BUSY(x)		FIELD_PREP(GENMASK(14, 14), x)
> +#define   DCIF_DISP_SR0_AXI_RD_BUSY(x)		FIELD_PREP(GENMASK(15, 15), x)
> +#define DCIF_DISP_SR0_TXFIFO_CNT(x)		FIELD_PREP(GENMASK(23, 16), x)
> +
> +#define DCIF_DISP_SR1				0x20
> +#define   DCIF_DISP_SR1_H_CNT(x)		FIELD_PREP(GENMASK(11, 0), x)
> +#define   DCIF_DISP_SR1_V_CNT(x)		FIELD_PREP(GENMASK(27, 16), x)
> +
> +/* Interrupt Enable and Status Registers, n=0-2*/
> +#define DCIF_IE0(n)				(0x24 + (n) * 0x10000)
> +#define DCIF_IS0(n)				(0x28 + (n) * 0x10000)
> +#define   DCIF_INT0_VSYNC			BIT(0)
> +#define   DCIF_INT0_UNDERRUN			BIT(1)
> +#define   DCIF_INT0_VS_BLANK			BIT(2)
> +#define   DCIF_INT0_HIST_DONE			BIT(5)
> +#define   DCIF_INT0_CRC_ERR			BIT(6)
> +#define   DCIF_INT0_CRC_ERR_SAT			BIT(7)
> +
> +#define DCIF_IE1(n)				(0x2C + (n) * 0x10000)
> +#define DCIF_IS1(n)				(0x30 + (n) * 0x10000)
> +#define   DCIF_INT1_FIFO_PANIC0			BIT(0)
> +#define   DCIF_INT1_FIFO_PANIC1			BIT(1)
> +#define   DCIF_INT1_DMA_ERR0			BIT(8)
> +#define   DCIF_INT1_DMA_ERR1			BIT(9)
> +#define   DCIF_INT1_DMA_DONE0			BIT(16)
> +#define   DCIF_INT1_DMA_DONE1			BIT(17)
> +#define   DCIF_INT1_FIFO_EMPTY0			BIT(24)
> +#define   DCIF_INT1_FIFO_EMPTY1			BIT(25)
> +
> +/* DPI Control and Sync Parameter Registers */
> +#define DCIF_DPI_CTRL				0x40
> +#define   DCIF_DPI_CTRL_HSYNC_POL_LOW		BIT(0)
> +#define   DCIF_DPI_CTRL_VSYNC_POL_LOW		BIT(1)
> +#define   DCIF_DPI_CTRL_DE_POL_LOW		BIT(2)
> +#define   DCIF_DPI_CTRL_PCLK_EDGE_FALLING	BIT(3)
> +#define   DCIF_DPI_CTRL_POL_MASK		GENMASK(3, 0)
> +#define   DCIF_DPI_CTRL_DATA_INV(x)		FIELD_PREP(GENMASK(4, 4), x)
> +#define   DCIF_DPI_CTRL_DEF_BGND_EN(x)		FIELD_PREP(GENMASK(5, 5), x)
> +#define   DCIF_DPI_CTRL_FETCH_OPT(x)		FIELD_PREP(GENMASK(9, 8), x)
> +#define   DCIF_DPI_CTRL_DISP_MODE(x)		FIELD_PREP(GENMASK(13, 12), x)
> +#define   DCIF_DPI_CTRL_DATA_PATTERN_MASK	GENMASK(18, 16)
> +#define   DCIF_DPI_CTRL_DATA_PATTERN(x)		FIELD_PREP(GENMASK(18, 16), x)
> +#define   PATTERN_RGB888			0
> +#define   PATTERN_RBG888			1
> +#define   PATTERN_GBR888			2
> +#define   PATTERN_GRB888			3
> +#define   PATTERN_BRG888			4
> +#define   PATTERN_BGR888			5
> +#define   PATTERN_RGB555			6
> +#define   PATTERN_RGB565			7
> +
> +#define DCIF_DPI_HSYN_PAR			0x44
> +#define   DCIF_DPI_HSYN_PAR_FP_H(x)		FIELD_PREP(GENMASK(11, 0), x)
> +#define   DCIF_DPI_HSYN_PAR_BP_H(x)		FIELD_PREP(GENMASK(27, 16), x)
> +
> +#define DCIF_DPI_VSYN_PAR			0x48
> +#define   DCIF_DPI_VSYN_PAR_FP_V(x)		FIELD_PREP(GENMASK(11, 0), x)
> +#define   DCIF_DPI_VSYN_PAR_BP_V(x)		FIELD_PREP(GENMASK(27, 16), x)
> +
> +#define DCIF_DPI_VSYN_HSYN_WIDTH		0x4C
> +#define   DCIF_DPI_VSYN_HSYN_WIDTH_PW_H(x)	FIELD_PREP(GENMASK(11, 0), x)
> +#define   DCIF_DPI_VSYN_HSYN_WIDTH_PW_V(x)	FIELD_PREP(GENMASK(27, 16), x)
> +
> +/* Control Descriptor Registers, n=0-1*/
> +#define DCIF_CTRLDESC0(n)			(0x10000 + (n) * 0x10000)
> +#define   DCIF_CTRLDESC0_AB_MODE(x)		FIELD_PREP(GENMASK(1, 0), x)
> +#define   ALPHA_EMBEDDED			0
> +#define   ALPHA_GLOBAL				1
> +#define   DCIF_CTRLDESC0_YUV_FORMAT_MASK	GENMASK(15, 14)
> +#define   DCIF_CTRLDESC0_YUV_FORMAT(x)		FIELD_PREP(GENMASK(15, 14), x)
> +#define   CTRLDESCL0_YUV_FORMAT_Y2VY1U		0x0
> +#define   CTRLDESCL0_YUV_FORMAT_Y2UY1V		0x1
> +#define   CTRLDESCL0_YUV_FORMAT_VY2UY1		0x2
> +#define   CTRLDESCL0_YUV_FORMAT_UY2VY1		0x3
> +#define   DCIF_CTRLDESC0_GLOBAL_ALPHA(x)	FIELD_PREP(GENMASK(23, 16), x)
> +#define   DCIF_CTRLDESC0_FORMAT_MASK		GENMASK(27, 24)
> +#define   DCIF_CTRLDESC0_FORMAT(x)		FIELD_PREP(GENMASK(27, 24), x)
> +#define   CTRLDESCL0_FORMAT_RGB565		0x4
> +#define   CTRLDESCL0_FORMAT_ARGB1555		0x5
> +#define   CTRLDESCL0_FORMAT_ARGB4444		0x6
> +#define   CTRLDESCL0_FORMAT_YCBCR422		0x7
> +#define   CTRLDESCL0_FORMAT_RGB888		0x8
> +#define   CTRLDESCL0_FORMAT_ARGB8888		0x9
> +#define   CTRLDESCL0_FORMAT_ABGR8888		0xa
> +#define   DCIF_CTRLDESC0_SHADOW_LOAD_EN		BIT(30)
> +#define   DCIF_CTRLDESC0_EN			BIT(31)
> +
> +#define DCIF_CTRLDESC1(n)			(0x10004 + (n) * 0x10000)
> +#define   DCIF_CTRLDESC1_POSX(x)		FIELD_PREP(GENMASK(11, 0), x)
> +#define   DCIF_CTRLDESC1_POSY(x)		FIELD_PREP(GENMASK(27, 16), x)
> +
> +#define DCIF_CTRLDESC2(n)			(0x10008 + (n) * 0x10000)
> +#define   DCIF_CTRLDESC2_WIDTH(x)		FIELD_PREP(GENMASK(11, 0), x)
> +#define   DCIF_CTRLDESC2_HEIGHT(x)		FIELD_PREP(GENMASK(27, 16), x)
> +
> +#define DCIF_CTRLDESC3(n)			(0x1000C + (n) * 0x10000)
> +#define   DCIF_CTRLDESC3_PITCH(x)		FIELD_PREP(GENMASK(15, 0), x)
> +#define   DCIF_CTRLDESC3_T_SIZE(x)		FIELD_PREP(GENMASK(17, 16), x)
> +#define   DCIF_CTRLDESC3_P_SIZE(x)		FIELD_PREP(GENMASK(22, 20), x)
> +
> +#define DCIF_CTRLDESC4(n)			(0x10010 + (n) * 0x10000)
> +#define   DCIF_CTRLDESC4_ADDR(x)		FIELD_PREP(GENMASK(31, 0), x)
> +
> +#define DCIF_CTRLDESC5(n)			(0x10014 + (n) * 0x10000)
> +#define DCIF_CTRLDESC6(n)			(0x10018 + (n) * 0x10000)
> +#define   DCIF_CTRLDESC6_BCLR_B(x)		FIELD_PREP(GENMASK(7, 0), x)
> +#define   DCIF_CTRLDESC6_BCLR_G(x)		FIELD_PREP(GENMASK(15, 8), x)
> +#define   DCIF_CTRLDESC6_BCLR_R(x)		FIELD_PREP(GENMASK(23, 16), x)
> +#define   DCIF_CTRLDESC6_BCLR_A(x)		FIELD_PREP(GENMASK(31, 24), x)
> +
> +/* CLUT control Register */
> +#define DCIF_CLUT_CTRL				0x1003C
> +#define   DCIF_CLUT_CTRL_CLUT0_SEL(x)		FIELD_PREP(GENMASK(0, 0), x)
> +#define   DCIF_CLUT_CTRL_CLUT1_SEL(x)		FIELD_PREP(GENMASK(3, 3), x)
> +#define   DCIF_CLUT_CTRL_CLUT_MUX(x)		FIELD_PREP(GENMASK(29, 28), x)
> +#define   DCIF_CLUT_CTRL_CLUT_SHADOW_LOAD_EN(x)	FIELD_PREP(GENMASK(31, 31), x)
> +
> +/* FIFO Panic Threshold Register, n=0-1 */
> +#define DCIF_PANIC_THRES(n)			(0x10040 + (n) * 0x10000)
> +#define   DCIF_PANIC_THRES_LOW_MASK		GENMASK(11, 0)
> +#define   DCIF_PANIC_THRES_LOW(x)		FIELD_PREP(GENMASK(11, 00), x)
> +#define   DCIF_PANIC_THRES_HIGH_MASK		GENMASK(27, 16)
> +#define   DCIF_PANIC_THRES_HIGH(x)		FIELD_PREP(GENMASK(27, 16), x)
> +#define   DCIF_PANIC_THRES_REQ_EN		BIT(31)
> +#define   PANIC0_THRES_MAX			511
> +
> +/* Layer Status Register 0, n=0-1 */
> +#define DCIF_LAYER_SR0(n)			(0x10044 + (n) * 0x10000)
> +#define   DCIF_LAYER_SR0_L0_FIFO_CNT_MASK	GENMASK(9, 0)
> +#define   DCIF_LAYER_SR0_L0_FIFO_CNT(x)		FIELD_PREP(GENMASK(9, 0), x)
> +
> +/* Color Space Conversion Control and Coefficient Registers for Layer 0 */
> +#define DCIF_CSC_CTRL_L0			0x10050
> +#define   DCIF_CSC_CTRL_L0_CSC_EN		BIT(0)
> +#define   DCIF_CSC_CTRL_L0_CSC_MODE_YCBCR2RGB	BIT(1)
> +
> +#define DCIF_CSC_COEF0_L0			0x10054
> +#define   DCIF_CSC_COEF0_L0_A1(x)		FIELD_PREP_CONST(GENMASK(10, 0), x)
> +#define   DCIF_CSC_COEF0_L0_A2(x)		FIELD_PREP_CONST(GENMASK(26, 16), x)
> +
> +#define DCIF_CSC_COEF1_L0			0x10058
> +#define   DCIF_CSC_COEF1_L0_A3(x)		FIELD_PREP_CONST(GENMASK(10, 0), x)
> +#define   DCIF_CSC_COEF1_L0_B1(x)		FIELD_PREP_CONST(GENMASK(26, 16), x)
> +
> +#define DCIF_CSC_COEF2_L0			0x1005C
> +#define   DCIF_CSC_COEF2_L0_B2(x)		FIELD_PREP_CONST(GENMASK(10, 0), x)
> +#define   DCIF_CSC_COEF2_L0_B3(x)		FIELD_PREP_CONST(GENMASK(26, 16), x)
> +
> +#define DCIF_CSC_COEF3_L0			0x10060
> +#define   DCIF_CSC_COEF3_L0_C1(x)		FIELD_PREP_CONST(GENMASK(10, 0), x)
> +#define   DCIF_CSC_COEF3_L0_C2(x)		FIELD_PREP_CONST(GENMASK(26, 16), x)
> +
> +#define DCIF_CSC_COEF4_L0			0x10064
> +#define   DCIF_CSC_COEF4_L0_C3(x)		FIELD_PREP_CONST(GENMASK(10, 0), x)
> +#define   DCIF_CSC_COEF4_L0_D1(x)		FIELD_PREP_CONST(GENMASK(24, 16), x)
> +
> +#define DCIF_CSC_COEF5_L0			0x10068
> +#define   DCIF_CSC_COEF5_L0_D2(x)		FIELD_PREP_CONST(GENMASK(8, 0), x)
> +#define   DCIF_CSC_COEF5_L0_D3(x)		FIELD_PREP_CONST(GENMASK(24, 16), x)
> +
> +/* CRC Control, Threshold, and Histogram Coefficient Registers */
> +#define DCIF_CRC_CTRL				0x20100
> +#define   DCIF_CRC_CTRL_CRC_EN(x)		(1 << (x))
> +#define   DCIF_CRC_CTRL_HIST_REGION_SEL(x)	FIELD_PREP(GENMASK(17, 16), x)
> +#define   DCIF_CRC_CTRL_HIST_MODE		BIT(21)
> +#define   DCIF_CRC_CTRL_HIST_TRIG		BIT(22)
> +#define   DCIF_CRC_CTRL_HIST_EN			BIT(23)
> +#define   DCIF_CRC_CTRL_CRC_MODE		BIT(28)
> +#define   DCIF_CRC_CTRL_CRC_TRIG		BIT(29)
> +#define   DCIF_CRC_CTRL_CRC_ERR_CNT_RST		BIT(30)
> +#define   DCIF_CRC_CTRL_CRC_SHADOW_LOAD_EN	BIT(31)
> +
> +#define DCIF_CRC_THRES				0x20104
> +#define   DCIF_CRC_THRES_CRC_THRESHOLD_MASK	GENMASK(31, 0)
> +#define   DCIF_CRC_THRES_CRC_THRESHOLD(x)	FIELD_PREP(GENMASK(31, 0), x)
> +
> +#define DCIF_CRC_HIST_COEF			0x20108
> +#define   DCIF_CRC_HIST_COEF_HIST_WB_MASK	GENMASK(7, 0)
> +#define   DCIF_CRC_HIST_COEF_HIST_WB(x)		FIELD_PREP(GENMASK(7, 0), x)
> +#define   DCIF_CRC_HIST_COEF_HIST_WG_MASK	GENMASK(15, 8)
> +#define   DCIF_CRC_HIST_COEF_HIST_WG(x)		FIELD_PREP(GENMASK(15, 8), x)
> +#define   DCIF_CRC_HIST_COEF_HIST_WR_MASK	GENMASK(23, 16)
> +#define   DCIF_CRC_HIST_COEF_HIST_WR(x)		FIELD_PREP(GENMASK(23, 16), x)
> +
> +#define DCIF_CRC_ERR_CNT			0x2010C
> +#define   DCIF_CRC_ERR_CNT_CRC_ERR_CNT_MASK	GENMASK(31, 0)
> +#define   DCIF_CRC_ERR_CNT_CRC_ERR_CNT(x)	FIELD_PREP(GENMASK(31, 0), x)
> +
> +#define DCIF_CRC_SR				0x20110
> +#define   DCIF_CRC_SR_HIST_CNT_SAT_MASK		BIT(13)
> +#define   DCIF_CRC_SR_HIST_CNT_SAT(x)		FIELD_PREP(GENMASK(13, 13), x)
> +#define   DCIF_CRC_SR_HIST_SAT_MASK		BIT(14)
> +#define   DCIF_CRC_SR_HIST_SAT(x)		FIELD_PREP(GENMASK(14, 14), x)
> +#define   DCIF_CRC_SR_HIST_BUSY_MASK		BIT(15)
> +#define   DCIF_CRC_SR_HIST_BUSY(x)		FIELD_PREP(GENMASK(15, 15), x)
> +#define   DCIF_CRC_SR_CRC_STATUS_MASK		BIT(31)
> +#define   DCIF_CRC_SR_CRC_STATUS(x)		FIELD_PREP(GENMASK(31, 31), x)
> +
> +#define DCIF_CRC_HIST_CNT_B(n)			(0x20114 + (n) * 4)
> +#define   DCIF_B_BIN_CNT_MASK			GENMASK(20, 0)
> +#define   DCIF_B_BIN_CNT(x)			FIELD_PREP(GENMASK(20, 0), x)
> +
> +/* CRC Region Position, Size, Value, and Expected Value Registers, n=0-3 */
> +#define DCIF_CRC_POS_R(n)			(0x20214 + (n) * 0x10)
> +#define   DCIF_CRC_POS_CRC_HOR_POS(x)		FIELD_PREP(GENMASK(11, 0), x)
> +#define   DCIF_CRC_POS_CRC_VER_POS(x)		FIELD_PREP(GENMASK(27, 16), x)
> +
> +#define DCIF_CRC_SIZE_R(n)			(0x20218 + (n) * 0x10)
> +#define   DCIF_CRC_SIZE_CRC_HOR_SIZE(x)		FIELD_PREP(GENMASK(11, 0), x)
> +#define   DCIF_CRC_SIZE_CRC_VER_SIZE(x)		FIELD_PREP(GENMASK(27, 16), x)
> +
> +#define DCIF_CRC_VAL_R(n)			(0x2021C + (n) * 0x10)
> +#define   DCIF_CRC_VAL_CRC_VAL_MASK		GENMASK(31, 0)
> +#define   DCIF_CRC_VAL_CRC_VAL(x)		FIELD_PREP(GENMASK(31, 0), x)
> +
> +#define DCIF_CRC_EXP_VAL_R(n)			(0x20220 + (n) * 0x10)
> +#define   DCIF_CRC_EXP_VAL_CRC_EXP_VAL_MASK	GENMASK(31, 0)
> +#define   DCIF_CRC_EXP_VAL_CRC_EXP_VAL(x)	FIELD_PREP(GENMASK(31, 0), x)
> +
> +#endif /* __DCIF_REG_H__ */
> --
> 2.34.1
>
