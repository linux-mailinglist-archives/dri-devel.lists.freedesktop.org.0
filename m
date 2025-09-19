Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1F9B8A4AF
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 17:30:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46A4610E00D;
	Fri, 19 Sep 2025 15:30:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="RP9aRdA2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011069.outbound.protection.outlook.com [52.101.65.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D5EF10E00D
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 15:30:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xj3U80Bwm/7ak+Cf83ECKCS3A2uQqJSt0nSNdeSvUQ5sqUvZysTYTWNY/ZxWbGsqs/z0yvIdAqB9eENT4g2eNtkWrmO13c2+3JBz9S9+14/dbV2nFb5ig72a3aI1tKQ07zzWLoxq6cT0Yjov0chKrLo1KRV/6iWx612O2j+HTPQJpCnRBj7+mQacHajfgHQYkj3S+YcyHYg/UuxnEl30H1EjvdFZvd6smhiBqJyD3f0uJ5oO6+CUUDpIKhqMrpzJkTd8Fn5yUnRNzn6CDMKtsDpOmxN0xIgk6m1jbM0eooxxScgU4mbxK+mTfAdCC5niaUYVhYz5uIvuWzOHSgZ7Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZnO4FD7H3PLjJLec5claaAM5LkbPJCTggmTe2zDd6x0=;
 b=BH04Ng08KA9RJRox7xd3060NewHdD9pY2aNVkS337+b3fK0Fa5RKargHTPielZ/7Yp8b24fp7k0/jgD1v2lpKOrPhs/9FqxSqhD9ku75sSE6fMgxdegXoAiriw6J74q31T8zMH1N2gypceiBGu1SnrXKjztwgf8tmKS5XyzxbIWl3bLVtBc2kZuqb60Zui30sijSv2P9zFsbMqCkBg/9ICE7NnYVSiFzDsPkcLP4kenbBP5NXjmWFSkAgxEqv6dKqu/jKUD6doeCwBD7Ir5Un9b1kGgwdMRjb9wvsLHfLJMWeTW45zOSNi9PmQKYTCIzJsnb9bMFBZWiNbLpuNxqWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZnO4FD7H3PLjJLec5claaAM5LkbPJCTggmTe2zDd6x0=;
 b=RP9aRdA2WAHoo3iL0WtZA+59gu+g2UCDmsVTSIVYLAFxk3zghOvlfOjaI3pVV38Busmmqw5B3hwDeDRmCyX5FqGU1TU3ouFupTSSKd5L0zjE2Xi5zAUoCvd2vQPm6kUrsFoPE2vxufn0r1EcWLy3IfBhSWPuj1e3CB85JPxCXcnyuHNRi2/X1DQmtqW5rMt0bn7o6KEYBjsV+rblNPLWj979D7Wui8RKKS6piAsM0R5CxEQTH5E0RCdvJnzd30CBH1U6Kv6HZaRMAjQX9fwwiyH443Wx0WJHi9QoDNM2L5DGEq8HWJGMmTYMFGlIBLrBtjE5E6LZi+AZsMV9PvESAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by PAXPR04MB9204.eurprd04.prod.outlook.com (2603:10a6:102:227::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.16; Fri, 19 Sep
 2025 15:30:49 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9137.015; Fri, 19 Sep 2025
 15:30:49 +0000
Date: Fri, 19 Sep 2025 11:30:39 -0400
From: Frank Li <Frank.li@nxp.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 12/14] drm/imx: dc-lb: Drop initial primary and secondary
 input selections
Message-ID: <aM13H9AkD6JDalex@lizhi-Precision-Tower-5810>
References: <20250704-imx8-dc-prefetch-v1-0-784c03fd645f@nxp.com>
 <20250704-imx8-dc-prefetch-v1-12-784c03fd645f@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704-imx8-dc-prefetch-v1-12-784c03fd645f@nxp.com>
X-ClientProxiedBy: BYAPR08CA0051.namprd08.prod.outlook.com
 (2603:10b6:a03:117::28) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|PAXPR04MB9204:EE_
X-MS-Office365-Filtering-Correlation-Id: 19cef4e0-9f0d-4559-7e8e-08ddf79182d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Yn1a4eAGMQkGHYh6KVfyLg4F6/Jgzcj2ILDQ4AkL8098QYxjpdt8tDLnQdlI?=
 =?us-ascii?Q?h5YhQWNeu9sxLe3IeChWEjPR7uG44gmiTMpp6A65KtIj1ya8hB8ct0kQWoig?=
 =?us-ascii?Q?nT5yJm8Lo9IeJtBVN9GDA03E6LGODGrCoy8E8d7AOHC5Pxy2U82vwhQV5yct?=
 =?us-ascii?Q?ZePfXEHzuP/PqpigluwB01rXSmMXfYGQ0tTo1EHmifVzDPJYBhs4TbMeNwDT?=
 =?us-ascii?Q?3VoYjIVv/Eg0wfx+QDOEIE2/AB9ZYfCRG57UIgCpM2g/KkuOANIm8F4MzZdM?=
 =?us-ascii?Q?SYbnZ1zz5XZFx6M/9bqIaNwGNpvbr55y9hp2GsIWSwqhn46/NjXHaebunzcN?=
 =?us-ascii?Q?cAax4KT0/JC1Vj7U0OB4P7U34cUtO0UfqB6kj++P9HOxohg0jbn9uQZk0buT?=
 =?us-ascii?Q?Ck26vuLrL7+nPOLcGA8BnS8kYXcwmZbv0nKdmm+ql93Izn+V/pIREOipZXTP?=
 =?us-ascii?Q?Qj3iSyUccvPIHK148HYEVL9I1XQL0RYZOO5GF0bYIIP4LnPkS6JsySWKs+Rn?=
 =?us-ascii?Q?tvPBpJLTz4+m/pfcXEnE/THt14DvPtXP+ZJ6Uy6St7QPXW2RnE+bif0FJ3pa?=
 =?us-ascii?Q?C91hgxMASKG63VNEFsp5DbO/vT0X6SFcn1yHmaN/00sPwgmQRzd8V1b/6aYF?=
 =?us-ascii?Q?Tq2VIVMyoARvSSKDksEJuiX1pPM2Jco9GPPALoghviPHBt02a+qeFUBQN11e?=
 =?us-ascii?Q?P/zmzqtLoOBXGXJUGYpJaUHfErIedrVFcFRvWkKmasG+S9dWGEXt4S90W/gb?=
 =?us-ascii?Q?JNNPYMD9EZqfWLunPV4nD0rBTOUdh3R0D/mnyY6ssOx0Oz7c1ReAkz4AfnQh?=
 =?us-ascii?Q?urc/Yzz+D/DBdThwl5TBF69Glpqje0nRFnIO328wCMDkWHaCyV9mkbYhafNZ?=
 =?us-ascii?Q?FR/QrmeIfFJEDw0ba9Mn/DTkwiUkrDjSJT5ANbmvdajM1iLYIjknnpDDYz+a?=
 =?us-ascii?Q?HtwdbLC0/UUpb4c5yxClZg0X9V/0LBRTTdAEN9qhdyxZn1m1rREwP2rCbiyE?=
 =?us-ascii?Q?qq0FZ07U21A1sUmU/Le2NRtWkd4L/qc+DZY3pUflDWmd4I/VCh4us7x79R+9?=
 =?us-ascii?Q?J18TQBytZgC03v6jB5uRbWoPZO+6HJb4GwTmIEVY3n4GN55dq1b4dBw72eA5?=
 =?us-ascii?Q?VwJB62myGzdzjcMP8WryxWGan79I2hIYS0opLzrmcx/P29j0HOk7GTGK+1/6?=
 =?us-ascii?Q?aaWXb5pSYy43fwuXw0IMJ0ZP8QF6/km1rujSXGO+Q6P0Uey2qxZdyJetNfn7?=
 =?us-ascii?Q?d2JCUGH0biPmnmO/VIdN8l15B4dlYvdt8m/mlTilynm1PQqvpw80OQnIg511?=
 =?us-ascii?Q?CIU0uhkJMPFVsrAzvxUSxdo0kUKFQnLfX8Zb/8isobspY+7CCmtw8DAbO+Z3?=
 =?us-ascii?Q?cy3UuGCEUEHFELmJ9VKj+OxGQ9oSpyS4J97oFmgHcuAwsZavX8Cz6ku3u7R7?=
 =?us-ascii?Q?vI8lhC5nt46EFLHGgpj+i/JhPIxPISXPKOS52hUvBaYjaVKqpgI72A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXSPRMB0053.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t769uNyBeYAJRM7PW9y59PjubSY8LLSDlr2BaeHluwzHZXrV6zr9S+Mf7BBl?=
 =?us-ascii?Q?SDc8PsZ7gLFnuhWiGuSC7Mz1gQtbQbXmT7oRzLnSLn0io/9ULZzKu+ZXjZFs?=
 =?us-ascii?Q?as9677V8Gbg2ktsQDRS6bcmu//MYnWVnC70OAfVmVeKTIogSxOwVB54Doxul?=
 =?us-ascii?Q?VnM9oJZdwCz4ku5YF7svp5BPMYQPwzUg0K56qeMOQW7fwyYEhUGdQRaHkALf?=
 =?us-ascii?Q?IGYzTBui15hpRc3Ft755J8AGaIMhnLEB4edbtN9LD5WtP4t9iMf1sPJ1Kku5?=
 =?us-ascii?Q?SRP59/0ryXUWkPM90Ky/3GKrsmoBlD1T7rmMxe/acnnV6NWTuXfJ449DIwtH?=
 =?us-ascii?Q?F2mDJChdRXBsJUPZEGn8TaR7TOoRzLpRl1xAo87ZelOFYKFGCVLebUdwoilC?=
 =?us-ascii?Q?1cYws5S0lNCAF49ckFECxiEi+PN7SmtQncjvjKGaT7i3+OBhKpiB2Qz+WbL/?=
 =?us-ascii?Q?BMWkVigH8ZoRSOHWWjiwMY6WBeOJaY7XApDx8l2JYNn2ylew4O1fQ2sjDeGi?=
 =?us-ascii?Q?PSG4B4rQIoH49ThbxP5ldKBh/MrVIi68v8LhQCc2tv5lkBxweH8GLgUSjUfM?=
 =?us-ascii?Q?pOnxGReb9TD0Ot+aoP7wmedTlYAx/xc9y1PKbK48Hk4/erKPc3mE6Lks/HLi?=
 =?us-ascii?Q?FtFufH5wom1EJ0Tt/Q3VEB0qUEmaD+LMpHjUnYXVxb/CV5Z8ZTcmAFIFfZ8Q?=
 =?us-ascii?Q?Fz5y6Z74Z4mQJxq7rf3vZ+1wuIW1mtsH34slJyRSZpGjzY3ME8ZS6Cx0+m9O?=
 =?us-ascii?Q?UWiJJD7DcnDmgX3fSQJe5pgrv1g2vL4yQxYzRlerOau0jhb88lHTiyJ1/E7U?=
 =?us-ascii?Q?3szWIuqyWWhKbPaE1OvC59xM6/vb1O2EO0l4FAjvTt/Jhk7TscDudY3L7mMw?=
 =?us-ascii?Q?HTtvM+tgCid4WB3N2WdQIxEl7q2lAb1N6mFLO6xSgYkV7D3+opW7nvUuE5p3?=
 =?us-ascii?Q?z0amRFn6NPt5bkEJUVRaDKHNFGZKBi6ixZ9NrJW/uf6E+THc4rPlBlQ64J3s?=
 =?us-ascii?Q?kJbL0L50trCtHUiMUnKKPmuCulAed01L3hGcGlyksFcwuhqFHi0Kw1IU4paE?=
 =?us-ascii?Q?FSxXwe2i70A6Ol7SVvkePG5FLwmwkjVgIja1sYJdV70Au4pZeH1/s22JgKVr?=
 =?us-ascii?Q?bUwzNGkuk1nQayinx7vcJgjF41A2t6RGDUuQzkMZEw4zEMJTMirF83DO74DD?=
 =?us-ascii?Q?GlLq6WScawY3pzzaJtqlKG01CJRfb5+ZKJe9bvpvlAoEocxWJJadQZjmAm3o?=
 =?us-ascii?Q?RPFoWW/1oc/iv6rdScw1PXnYZ8cVOCVAqqdfZFUj/2EcOdz6wKKL+Iv+yuD/?=
 =?us-ascii?Q?T582FMzhuFBAzknaPpoJEtHzvBED22tVRdfRPVSvs7Pu+BJY0YkrptRQAUsK?=
 =?us-ascii?Q?fXfXV4lN0flqZx1QlEkrZUheSy3Ox4KNxTa2tI6xmWJHdGDrSOCncoVQ8w5t?=
 =?us-ascii?Q?JinXIZ4qo6aRwS/XKdsVBBrZT+072TbWGnLs7H29SOKRxg/62yqMh5FtrBw/?=
 =?us-ascii?Q?V1jpTPr431ewnfvWTuZRc90iOlD+2VzFwVdNsaI5bYX4L+m4066q9LgOuC6t?=
 =?us-ascii?Q?q7Owo+MWB+Na1lpmj7SuHl1yEdTE6+qfBOf0wqIZ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19cef4e0-9f0d-4559-7e8e-08ddf79182d9
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 15:30:49.5046 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n76JDVw7YaoTdqezGjAOUEFY27S0XCUhNjxx1QlWYInviJYWnluPaJ7vr6Zdu55e1Phx9sZhwyWbNRg2Zl07JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9204
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

On Fri, Jul 04, 2025 at 05:03:59PM +0800, Liu Ying wrote:
> It's unnecessary to set initial primary and secondary input selections
> because KMS driver would do that when doing atomic commits.  Drop the
> selections.  This is needed as a preparation for reading LayerBlend
> secondary input selection when trying to disable CRTC at boot in an
> upcoming commit.
>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  drivers/gpu/drm/imx/dc/dc-lb.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/imx/dc/dc-lb.c b/drivers/gpu/drm/imx/dc/dc-lb.c
> index b0f3fb818799b58597e8ae41d868338c3fd40800..d0a805469ae79d467c7e71ebf75e1befb80e15f3 100644
> --- a/drivers/gpu/drm/imx/dc/dc-lb.c
> +++ b/drivers/gpu/drm/imx/dc/dc-lb.c
> @@ -254,8 +254,6 @@ int dc_lb_get_id(struct dc_lb *lb)
>
>  void dc_lb_init(struct dc_lb *lb)
>  {
> -	dc_lb_pec_dynamic_prim_sel(lb, LINK_ID_NONE);
> -	dc_lb_pec_dynamic_sec_sel(lb, LINK_ID_NONE);
>  	dc_lb_pec_clken(lb, CLKEN_DISABLE);
>  	dc_lb_shdldsel(lb, BOTH);
>  	dc_lb_shdtoksel(lb, BOTH);
>
> --
> 2.34.1
>
