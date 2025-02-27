Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A320DA486AA
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 18:32:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1E6710EB58;
	Thu, 27 Feb 2025 17:32:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="YvkFhFsS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011011.outbound.protection.outlook.com [52.101.70.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DCEA10EB57
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 17:32:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ufq4myfWgltv4cKBvei25PNJP5qQIUOcEqvwsUhvKbekT6Q+7S/I2NoI/EOOiZTCPdB2jm2NeWU1EEVbirQj/RIxR0YMUmxvrzSmmRPUaV+jVZxF7stuDesoRlvNrz9rXhqp5KlT+4cE3bqOYny3oKrLUHifN29OtQxM04Ooh3zsYTUMQ58EAjAIwguSHUt33snLKpMeak+P3AMznd3uofD2OU2pDgIZVRlOy5dGooZ2/8uWGFTC/UhBU+FbFA2ZyiDYSMD8/ii70MLAkWubB5zqYHOBl8xE7MkwkeC8wes4s5NdVrbZ5HQ1BJmylL4fthKtd7a06+pd1FaKV9eFUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s7BXN3BcFNtC5Pf+jacedA0ydpJjkY+e4QLUNaw/oSM=;
 b=kbNLALTohOSFe4tApWoBFF0Z/i17Qn9zxWcFk/jM/jMHq+Izr8yrjvKB4dbjn/yQ7rxca5mX7RJ8k3L5mzknGPZbPL435fpij+8WUeXvVD82/s0q7L/VS+W/VOB9cubmkw7w+zD5sr+BdPagbkLbP+l6fO7cz+6CuuzEIKD0iYMHt8vSLeEm3hHEu2wd/QpU7/QZK9GNpEalAXgLOgKVcdoScn3tNoYfBTMuMQjTZjUeQqJcQi5+RkfK83ZttYU6IXVLVpSai6zf77Xw4zJymdaSU35B2RLBg6XHt6g6iRmS3QiQmCv/OBh3/bciHJjVP6m51/BT7PYoak7uQ/endQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s7BXN3BcFNtC5Pf+jacedA0ydpJjkY+e4QLUNaw/oSM=;
 b=YvkFhFsS4Uwi+yQKcnVHUvdhEHLNfsJKExz2CDiksm/dBu89+zRr/NeZoGS9yld5eC0nP/YkBK2y9yPCSxdee+pV13df+eZLTCP0MazksZ3aYe73q0N5tsZzZIzqD/PrjsjRkTjQVNmXfBQ7DE3LBeVDl2utCquLZY80V/Vn9l/fl5/0jAo9cjt3tzMo+F+QBbp3yCymHQxvC7NNFVbU5up/oCdonMZQcS2D8YVds49hy4M1GlOzTaAtO3Vp9DEUX9NQannFI7LvFP5lQQauTOA/spbqETk2bHQGjF1D1Occ8O2v26oTgl1TE7PJHe6W2O8OKSHcz2hdrf5/GrcOOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8828.eurprd04.prod.outlook.com (2603:10a6:20b:40b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Thu, 27 Feb
 2025 17:32:43 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8466.016; Thu, 27 Feb 2025
 17:32:43 +0000
Date: Thu, 27 Feb 2025 12:32:32 -0500
From: Frank Li <Frank.li@nxp.com>
To: Marek Vasut <marex@denx.de>
Cc: linux-arm-kernel@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Sebastian Reichel <sre@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Steven Price <steven.price@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev
Subject: Re: [PATCH 2/9] reset: simple: Add support for Freescale i.MX95 GPU
 reset
Message-ID: <Z8ChsA3h0h5DPu7m@lizhi-Precision-Tower-5810>
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-3-marex@denx.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227170012.124768-3-marex@denx.de>
X-ClientProxiedBy: BYAPR01CA0015.prod.exchangelabs.com (2603:10b6:a02:80::28)
 To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8828:EE_
X-MS-Office365-Filtering-Correlation-Id: 78235ff2-cb53-4d48-165e-08dd5754bde2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|1800799024|376014|7416014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0iWcfo0/3+YATnZjT+5h6RoA3yfKMPZs+Wi0qSxLZ2AMpa1JTjA5wcipYXs5?=
 =?us-ascii?Q?AV6yJJLYjhp/AsMDHhhrIMWANz2p2oODSfII4X1KeOiNiOmOln7AqlNp5pLj?=
 =?us-ascii?Q?SvnRQg8eMjp+7uQsjTI0QioiJVAUmvubuYlO+OSOTUp3cpIzit2gDMmgCI8d?=
 =?us-ascii?Q?//PBP/We/fixii/yVuyCZQnVfTi5R/jlLDiIMF3RN961RrfUJq7qXKViJAUF?=
 =?us-ascii?Q?Fx73z1aSyMUpm9XMFpNbxrlT8jmA0QPvJf8v4ou6oTvzNTdQWO3brJpxrFmp?=
 =?us-ascii?Q?tqnXEG8h1cuij3nziORaq+tdGBSSgavUNswQY+U/cunegtrkY3n04cqC7NJw?=
 =?us-ascii?Q?6nc5dyyc2IiloUIRon+uPHzUNslOkEKHeYr4U+eyTYplgoN1V8Rb9jOqG5hE?=
 =?us-ascii?Q?6OcV752OIVAAJ48YoJE8wUbGG+jjWN10YJThjUVs0qy07f8Jn9Sn7b5mZkZB?=
 =?us-ascii?Q?ITzyrC+VPkb/Z8DjqGXf+WPn3bU96iHoygWHXoSfwYToo67MaCPCx6yxTHoV?=
 =?us-ascii?Q?e7tOr9+PVZAYVTXCSTadUwlpFs4vSvlOXSlrILM/MsJN5wB2jgB7F4hVtaC5?=
 =?us-ascii?Q?SBMF1S6iaZnzVp25Oy7jcTUpiMNAEkdoyw+d0AS6LXynq+bvwf7lB4r/hCZm?=
 =?us-ascii?Q?SNiXi3WaFt7Q/arPGb1RSw243kh72m0qw+dJ4Y/gNZZ0jaedVd5/eAU7Ugy2?=
 =?us-ascii?Q?V6ch7nrA8hGtJRfnIRyeywrWfpDJzo+cUj/lmopAiZmYotp7boVi6IIOqokt?=
 =?us-ascii?Q?YTK3Arsm/pirKzpSCRPVH58NA1zSzAjuNJ6UZyBtCO4Ea9A3PzRHCDNBtB4m?=
 =?us-ascii?Q?nvN6KfPCTluc1Totrva5gnvqLCkc3SJLfsKiE1pwhcxkcwKyvEU+kcxyibGS?=
 =?us-ascii?Q?kc/q2QAsRQkc4AXMOaEb2GMDoBZTRG823tyqlFy5qL31LAcvPFyLfwOKmH/t?=
 =?us-ascii?Q?sPZrel+ArkjSZmbx4RAMnqpYL8hPoOPy4JZCxvjV8olFm/jVIZwo9A3P8m98?=
 =?us-ascii?Q?IEj+QTINTLyzds6AmWuSpQfu6ajEP/mNtAzPnc6WiCd6tS/CvKq4rJeR8Vmh?=
 =?us-ascii?Q?8vVHkrda0vnABF/RXqoXl6U+lR+rF7T5WMyqPZYG0YU6pModw3hU5d01cYYb?=
 =?us-ascii?Q?1jvzvaY4So60zIfRjasPTlXJlknaeUwVJPd52Igj5VxHNi3BFzxfsqk614x8?=
 =?us-ascii?Q?CDwQzeYP547ZzDJUCXxyRij2laCLF98e5/V0poL4icA8r5X0Ay5qT6WRx4ey?=
 =?us-ascii?Q?8MmugpNdCbTG5mMzMijnI64VEg+UX6avGjA1F/2c5hlGxKGa7tPvTLmKmJt4?=
 =?us-ascii?Q?HfvHESEW1bcuQW86h3+lzXgjaTqNDqxZDfIlchtGlibXU4w21ewTicxcV80t?=
 =?us-ascii?Q?ioymzQMN7FyNm68hDdxNcc+3RnUAiX+s19leLvbv8mYIWWzaTaIquR4Kc4t/?=
 =?us-ascii?Q?xdQawSoAGaJQNKletjJX08UCjTwgbWji?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(1800799024)(376014)(7416014)(7053199007)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ixPO+XXmILQz+htsMcXrtS0aBACVX8mh2BjzcaQdWQDYCW2XpZO4F/8pXb1q?=
 =?us-ascii?Q?EgzrDlPqhpaEFZTKCwz/hDAYhmP53N1DUTbGdQv+Z7yuoG3XSTvurCXpH0Qb?=
 =?us-ascii?Q?HhIYY9xYUQkXmqVO2fO3dj2aNQeNcf1Bi1urKTHLxnxr3rhd0U65c17yigGl?=
 =?us-ascii?Q?++6TFfoRvZsWfWi6RXpK3nwQFc4f95BMO7eFZv3rd5vOgx35e72245XRZsht?=
 =?us-ascii?Q?RrrE9VbE6z7M8G70IdpcYSieGwDeWJW7ByrrAjySSwZOvzSnIeQjFr+98bAk?=
 =?us-ascii?Q?2983GCeRPrFuahzWXBcv7SlhIqI069N1/ZsRFCz9yG/SOIWhP1lv+UnhthCt?=
 =?us-ascii?Q?iX1MZ/YcqT2zG1avqe1a4Aq31buAmmrtEhMqU2C0hqZGPJp0WE7nQhJfyqfj?=
 =?us-ascii?Q?jYNAjGglZhLrnQ2b67l8pJ4PPdPfx2/R2BU+xIXRE9z1ixFTd9quf0sDB+NR?=
 =?us-ascii?Q?xXzWblKwmqgRq4V/KRSICiZGy6HkNSWD8YnwaFa9GjD/ABnaN6faNcu85bWB?=
 =?us-ascii?Q?lgQte8ccsqJQlwKNTj0HmytmVl56vKE2eLfK3C0InILk9jk/RsqCLuLF5xQJ?=
 =?us-ascii?Q?ila4GT2zn9YtJs0RkiuUPVbqwl/m56rAtrjRgopnvFuBiPBXFjqHyWze8zsi?=
 =?us-ascii?Q?ew+dlmBOF4zzqA0uxviuvgOI7q+CMQlGzlyLXBwU4PnhkPmGswruRLZEzbG9?=
 =?us-ascii?Q?b9IvJXJksV/dKf3FnxiZEQe8wYnPKYB+B2/YxBCJwVrgSEMbDvKR7I++AOf/?=
 =?us-ascii?Q?Z7PaLPCGc/O26Ov8vmkQQIX8UinA1A6Z/VYBPOjqjf/5g2/W0y0+siJ7EbYG?=
 =?us-ascii?Q?fsXiwS/avm6btxtypxYkT2ydA4l5bHjp1Ka3njnbqZw8rMDZJoZjKeNlEtjo?=
 =?us-ascii?Q?nOX7cnHw7XFBJ/7nvVrk5LgQ4x8IFyoUiaexfttaMyzFZF6JXXn0T16IMju7?=
 =?us-ascii?Q?bZCl94CP1OzGpAQEBnJiGarNo78/SeDnJ1TWM40M5YL0vpjELj+0pB0x4t5k?=
 =?us-ascii?Q?nu2ToVytvWrXA2Pxnm3KAvqX7MKzGNf2nQB7RBWeSnLSEz4CKF09uveq4a9P?=
 =?us-ascii?Q?mZDDY3VOVoxLBNWNmw2YSlMqUH+sCOqq3nv3+uOkSVDw3PDAqvdBovJIcEcC?=
 =?us-ascii?Q?gJrzPXFh4O3jHkYoufSlEm3Fh93bZENU1Btlg6xxmdtIen92tkdjJwFtU6yj?=
 =?us-ascii?Q?OdRB+S7UUB77SqIevTXC/hI1AJFZVvGb57FW7mDH8DegiTBTJjnPuSQR+TUx?=
 =?us-ascii?Q?SnbRaHFahFw4XRmZc1ZdTbxynN2aPeOZ3PoALJYDPnrm8VhiWwyE3wnaShKM?=
 =?us-ascii?Q?EYfwjJvJiERDhMSAkkGcVRgN5LfxiSY6SL0GJ3ZG4NHyxDnB41bPcDfd/XOL?=
 =?us-ascii?Q?GAZN76Db0Nb2WS5M7XbIdfDan7wHgvH6VBBYcywzWqBbX277QNWZQVbuygsQ?=
 =?us-ascii?Q?OVyvOdi+vidRRAKmzCKHyraV/CQU+XkAKKRUN7Qt0lUsUzGD2kE61TuMoDKz?=
 =?us-ascii?Q?eO9iNwMdqmuckJu3gME1/yyw8UMZRbCrD9clyYQQ05CoSAHjtGSwoucZYjbH?=
 =?us-ascii?Q?ttESsLZPTGADAG28+D4=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78235ff2-cb53-4d48-165e-08dd5754bde2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 17:32:43.2159 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jzobrlcxlL81vGQZRDaB7jlDRJHvv9jXa1TnWuRZlMhd0F5pou+F/u9JuZiruH427CnjauvGYww6zL6+aLND5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8828
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

On Thu, Feb 27, 2025 at 05:58:02PM +0100, Marek Vasut wrote:
> The instance of the GPU populated in Freescale i.MX95 does require
> release from reset by writing into a single GPUMIX block controller
> GPURESET register bit 0. Implement support for this reset register.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/reset/reset-simple.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/reset/reset-simple.c b/drivers/reset/reset-simple.c
> index 2760678398308..1415a941fd6eb 100644
> --- a/drivers/reset/reset-simple.c
> +++ b/drivers/reset/reset-simple.c
> @@ -133,9 +133,17 @@ static const struct reset_simple_devdata reset_simple_active_low = {
>  	.status_active_low = true,
>  };
>
> +static const struct reset_simple_devdata reset_simple_fsl_imx95_gpu_blk_ctrl = {
> +	.reg_offset = 0x8,
> +	.active_low = true,
> +	.status_active_low = true,
> +};
> +
>  static const struct of_device_id reset_simple_dt_ids[] = {
>  	{ .compatible = "altr,stratix10-rst-mgr",
>  		.data = &reset_simple_socfpga },
> +	{ .compatible = "fsl,imx95-gpu-blk-ctrl",
> +		.data = &reset_simple_fsl_imx95_gpu_blk_ctrl },
>  	{ .compatible = "st,stm32-rcc", },
>  	{ .compatible = "allwinner,sun6i-a31-clock-reset",
>  		.data = &reset_simple_active_low },
> --
> 2.47.2
>
