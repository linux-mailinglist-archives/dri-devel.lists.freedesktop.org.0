Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10112D1DC14
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 10:58:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7584210E05A;
	Wed, 14 Jan 2026 09:58:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="COD86YnI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011002.outbound.protection.outlook.com [40.107.74.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA7B110E05A
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 09:58:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SBZqcFaO630Y5KCY1/oT7aiPFA+EP50w0g7mdLouAcC0J/MqEhtR8sQKW9S2guH8AZh5tRx+HLNHTenkdA2dLbzSbFS/+eerqjD8MPtiVvdyZ9zBOcMTYAyQJbZa+7yNsy1v1KcBG9nLHGkIYgnRbYxM+9BI0Bx9lB1VdmPsPsiJAaepCscf3LfQ1SiOE1hDiO4lVUhfUO2y5h3rf5LSa3AKN5OMQ5fgEbBblhWtz7NKY9tHI7OTYzjPqRhs8PGy1/e4QjaC+wFBryA6Ww31IYmw0uNTYfGDhLCTz+iMA5Jxr3ALIH/hhMMbSeul8ltwpISLMpjm8Q/eoUJJ9oqTYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3JSyd0II6pcVOhb9dv7ynRUUKpiCZeYdbhjRHR2d38w=;
 b=x0mi2s7u4b0dTBttPq306IW8cvUacIVMjgwxD0NYwK/3qXnRoxmLXT4QJvbUEdFv15YLG/XTxdmai0O4EHsT1Pqrs0D49+5N/fW+zawYFAkUlJi0vExwU6MO/b5NjP4J/LNJKw4fn1t/zRjrd4YZooZluw0kRc6K2WI6JF5ECJFfX4+9sjdyLhPtsmQjD+47HBkYwCQwc29GdTv7CV5tWEyE9S2Oqsn/J881bDQmH9ZHflWvuH++MxQlymLshVP1WaXk5yLw77Ucjy8N+AyXfFDsIQZ2xMmLksUkgc4aFIn/RyKI6f7NGDqgs118+h9owxvhYQX0qhZqoi3L4P15Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3JSyd0II6pcVOhb9dv7ynRUUKpiCZeYdbhjRHR2d38w=;
 b=COD86YnIeECxAcLoChp7zetrjo97OdWCEddqneS38UV/XnuibvKDOmGoNTaX2kSx+1mRwJaL4TEEKG7Q+EbIzRs1HTHR1l1Di3UFxDu2iiuFt0+qW2qRgXfI7wN0FRfAHZpFrD1HfYlruomW52dbJcLfPDhNIzE71co7/4+C8zc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYRPR01MB15090.jpnprd01.prod.outlook.com (2603:1096:405:225::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 09:58:27 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 09:58:27 +0000
Date: Wed, 14 Jan 2026 10:58:06 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 14/22] drm: renesas: rz-du: Add RZ/G3E support
Message-ID: <aWdoros0gYXj_fxE@tom-desktop>
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <d7361a77744b7c8720addaaa064162470e7f3581.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7361a77744b7c8720addaaa064162470e7f3581.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
X-ClientProxiedBy: FR4P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::16) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYRPR01MB15090:EE_
X-MS-Office365-Filtering-Correlation-Id: 15758ad5-1f05-433c-3208-08de535376ab
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|52116014|366016|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3gBWJb8Vamqz8Hcsv0kovvCy0SQHFiW03f3v+cykkM6Xcc8nx0RgGElvPJB4?=
 =?us-ascii?Q?zhKjj3acn04SkdoGYxUt429DIMn6/S/9o7AHzwTen11sKTNOcN8RXV8lVRcl?=
 =?us-ascii?Q?W+hueXy6xgwpm+P0jpbRk7pfeWppjprEri7Sb42+5jvj2zfnqpRD7DGeZ+Yf?=
 =?us-ascii?Q?r+BMMS2zFCSqSvmm5uIEOp6YxMXe2EawyMDdXnXkEYDqEbRAE91KpzYiHfsc?=
 =?us-ascii?Q?Vn8nITySVcBRd1o8ynJGhTuI4CiK2J5mEsjp9lIJfWTkg4ZmOALNl/OZbnHS?=
 =?us-ascii?Q?3ulCDui+pzWv6VUrdwMXMEAoYKK9dvuT1R1q18alRzDamov8j1gLNP0Z6Vsx?=
 =?us-ascii?Q?SaudAPC9ToUSI8O8zCkVRWr+jBKeMa6z+G2sliPgulArz5PTiEAfBL7dNRWm?=
 =?us-ascii?Q?sv4vvzWNkb9t/iayN/nl7oMIc+rllOiTnUnx41U4J8SFD3wbXYX/dzRxeSvA?=
 =?us-ascii?Q?Uz02ME37DV5+ccIzMFnAaSdrcSF2rIVL1TgQgULdDi05zD9MZkAxZhBgjqbI?=
 =?us-ascii?Q?C8VPmmvaIwhV+Fa//DAOKb1YNSXmV1Ua4AdMMTDnngAC89lKm29/2k766Glb?=
 =?us-ascii?Q?2cZ55b848EnnRbBMJdMU0nLXlityyQKhODJAT4imkJVnP01E96qE2a+9KozC?=
 =?us-ascii?Q?LYUsMRJm2lA8mQ/TLPSUah4bcU5Npbmy5VwYGbbM4jz05qyU9Bw4nYkmyfCD?=
 =?us-ascii?Q?NJNLZacufTH0BG3LdhJQ/kUAxjIUiznFcZGMwDDpouFb4SwKsKPivNfSyzpY?=
 =?us-ascii?Q?h1b//j60DKnK8GHdVLxnhrclbu6pUphiZr8U932ajLWBPZe+nySnE7eIS19B?=
 =?us-ascii?Q?PUIbwUnOKTNli22057lJ4ajWYvc4OHUcQK4FccmdQdwd9nsZOy8qcjMZeDMy?=
 =?us-ascii?Q?0NYky/az4pJfD3EbvpOAzZTeOnSatGQtR9J3zM27qFg0fTbKXk8hkzMIRVGk?=
 =?us-ascii?Q?mtCKzVoQGFhGZA0SvjLoZPBXMtHAy6HYFx5tWDgIpuY4evDV5oGtbeInRH0g?=
 =?us-ascii?Q?SAT5wGosd7jxisuGeimRvsCyqDk4/+/+cdeeQ/eqIDsHvlng1F+pjCF9Npng?=
 =?us-ascii?Q?qv9JlvgB7xQRjbk2kiD6Lu0mft7zAq4hA2Teja1qzIQSeGQ+wM5d/HDJMg8o?=
 =?us-ascii?Q?mfSbVJ5IRi88Kh/tqLOIwWy5fBsJkya7YjiUIKIN64WS++ecSrOCsbIukzvp?=
 =?us-ascii?Q?hqcHI8IUgKNuVoQRmLsnIvPJePYyRzvNabV2ioAtTYmmc558kIi8lxs8f8nA?=
 =?us-ascii?Q?tgoAOEWSwp9R9SixqyIn2sUjYgigdqeFVqxk7AMeu4qOQGD8q3p6J3p+N3Zm?=
 =?us-ascii?Q?U+vFWKoKsSwNbQD8EoytLP7iBXHlFMlgZQmovh+1K0uWlnziVrjbEX+6HmIx?=
 =?us-ascii?Q?SgZldbY6f7eVFnSvQWV0lpF5PR2MAXzVbSIKqIb/MgevcSJvmG6Mxposff0x?=
 =?us-ascii?Q?/AXNqA3S2Srri16PY1V4mpJ+EXS3vJWK2oK5AeFPdCNmkt2QyBl1PoaZmNJs?=
 =?us-ascii?Q?CwMGagyOQWHfSbOsFhQnF5L5IwAjau8XXb98?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(52116014)(366016)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cZlJ/JQNm6MIw++5WLnJsnnpYsnmYwqjFCefgnXG445qJKBylXe0/4n9gFZS?=
 =?us-ascii?Q?IVy2hqogS2slyCfY+yHktFHQVqDGuNBbNL3t+r8o1+eflBm/dY8XOIJAwVQd?=
 =?us-ascii?Q?yuinVce2vIHXTH38ZlykJRsoaTCdnxXDVmIrEfr24issL6I1W16heId1RTC8?=
 =?us-ascii?Q?epxJ0qu5/2GO+/0zxdtD3VnRBmiL3eo3FVUvkgHETC0vtDRqSedseikYSS3G?=
 =?us-ascii?Q?9H+o8BxCp6ljx6qcsx4jPH2nUd7O1Crg2DiKWTiS0C4ZsSoOokRaVdLiEgKF?=
 =?us-ascii?Q?sKBaHBWb765A06DaTeMdF8o9cDYzYizze6GpNQMT953TmNOXydeKe5EJr1bR?=
 =?us-ascii?Q?bDYapcyrhieQdw1pwBQfnJ24S40Xt0iMBW7F4mxV7lMbGxOhZC2JWtjPj5X4?=
 =?us-ascii?Q?CXvPuXHWJVkcZ9UwJxyzLjKxb6hGvCcd3Er7+3v94Zn+rAjZbVZ4fNpZVkqk?=
 =?us-ascii?Q?MjhqKRdrcmnd9pN2huc3W0J+CmaI2+diZ+eNy7j7G5wNOJDGZvqkLnNAWxlX?=
 =?us-ascii?Q?Hia5th8QDORXLDiOYKm075i0jADRbNC4/u4Cwi+2GcNrPvQNuXaap8h7seUr?=
 =?us-ascii?Q?zDd3Hgdt8li675Mpif1XfWCnTsEP8bwGbpWrxnjqjDi7oxzDP7K6KrZk1pxD?=
 =?us-ascii?Q?84M+gTm1WfmOAH7dpvV/LMpX9XmXL7P/qxnGdm2D9FDG75+gJdEHecBHgQWy?=
 =?us-ascii?Q?pMpcKMmlitRCDugVOQ58/V1EzfB0dMBoeDWeXy5FBPLjQ77Dm37u43HAdrxj?=
 =?us-ascii?Q?6zTq/JwpssBQXORxAfinbklBf5mgpvXUAucEVScXAk40UeCE9Si935qreO2x?=
 =?us-ascii?Q?IRW3J7fM6YmRIUymJPusP4kDtgccvJHPB3xz92Fgu6jiA6q/TGXF+RFeBWkL?=
 =?us-ascii?Q?KAyRwpX58y4OxAkXoaeFT5Mu50yyoYlReBCheV4cHUotTS2XMvw1jO6RhZD2?=
 =?us-ascii?Q?IhdTXgGncjVkG2bT0IjGOlS3Qn7mAreMyn2FrO0XECPj1p9YRSQ23+VjzxdS?=
 =?us-ascii?Q?8VfhpB9C3rAfeHnOimonH5CgGep+kQAoV3/+n27DYXsj3sp8Imp0XH6xRmbC?=
 =?us-ascii?Q?wtZj/V4oZcNu4h2qZ3h4DATNYnwv0huqkXVsiDH0AdDWDBY23UPIVvXRJZtw?=
 =?us-ascii?Q?tB4Mx03rtMd4HUndq+ry7xoSzTatwq/ftY8RfiKc1KPhzzhpALhsqX+XmY04?=
 =?us-ascii?Q?5J2iHEw9xOwYX/Ld2rAGvMvweozPRP0wpbluQhQZ2ZQFfWKwoT3E7krN4JH3?=
 =?us-ascii?Q?vlypvIHYJbVQc41DelPV+9WyEMQ+c+PdMxybV/D/YWlMq9zezlGbqnMpZt4C?=
 =?us-ascii?Q?F+Mph0JQPr4I2Dej0Gwf0oU3cwAiLm5udCt3HGpas5ZqSZ9ze53fPyZMy1pL?=
 =?us-ascii?Q?CfhE8Q3y6RwROfVElQvhWTHTLg14yH9EFxPwLuK0AdUBqUnWhMlJFD2HVIT9?=
 =?us-ascii?Q?JO8Vmh1Tn/2TuKiIVF4begDVFwFNyNmbfG9GAYHrbxgaK8Iqfl59Z+nKoi4R?=
 =?us-ascii?Q?j0139cGqHCCC3H2lCSB+3kLzbFt24XyWFZifKiZr3KS0ByWiMGJ3zc2lhI1A?=
 =?us-ascii?Q?DuPUbtYnQ4qjW686uSJ/xNm2aktW1647ElQ1IK81nW49Yz4wdTz2+G00nRsy?=
 =?us-ascii?Q?96UMpH7KK4ocW+9hHlhbU1qKSj7MnkX8ptFCLWH+lDt8qUSEifCnnGhcYvHR?=
 =?us-ascii?Q?FC6PwtdldThCQ1x/XsBEPPCz27uBVtg3safp8UwL+vKVxsnf/CTFipxNJz4l?=
 =?us-ascii?Q?tERtqwWV6Oc5l8gH4mGWtBb37VmmLuk/xOyboFWV/TWBVuc4UlZv?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15758ad5-1f05-433c-3208-08de535376ab
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 09:58:27.5809 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sYUcXTLjVJa+jCBmDA6eXk6ob9ANesNYaEVo/Aikc70Ds7wIJMb2Czvg4Fci3vxbRPwyLZ2IpeAecohCXmBCVCp6mxZwUd8HiaAWMLQFGXwLV3u2XvLZDuIV5kLEh00g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15090
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

Hi Geert, Laurent,

On Wed, Nov 26, 2025 at 03:07:26PM +0100, Tommaso Merciai wrote:
> The RZ/G3E Soc has 2 LCD controller (LCDC), contain a Frame Compression
> Processor (FCPVD), a Video Signal Processor (VSPD), Video Signal
> Processor (VSPD), and Display Unit (DU).
> 
> LCDC0 supports DSI and LVDS (single or dual-channel) outputs.
> LCDC1 supports DSI, LVDS (single-channel), and RGB outputs.
> 
> Depending on the selected output, the correct SMUX2 clock parent must be
> chosen:
> 
>  - Index 0 if LVDS0 or LVDS1 is used
>  - Index 1 for all other cases
> 
> To support this behavior, introduce the `RG2L_DU_FEATURE_SMUX2_DSI_CLK`
> feature flag and extend the `rzg2l_du_device_info` structure to include a
> features field. Also, add a new helper function `rzg2l_du_has()` to check
> for feature flags.
> 
> Add support for the RZ/G3E SoC by introducing:
>  - `rzg2l_du_r9a09g047_du{0,1}_info` structures
>  - The `renesas,r9a09g047-du{0,1}` compatible strings
> 
> Additionally, introduce the missing output definitions
> `RZG2L_DU_OUTPUT_LVDS{0,1}`.
> 
> Introduce `rzg2l_du_crtc_atomic_check()` helper to store the routes from
> the CRTC output to the DU outputs.
> 
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c | 51 +++++++++++++++++++
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  | 42 +++++++++++++++
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  | 11 ++++
>  3 files changed, 104 insertions(+)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> index 6e7aac6219be..044ac16256c7 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> @@ -8,6 +8,7 @@
>   */
>  
>  #include <linux/clk.h>
> +#include <linux/clk-provider.h>
>  #include <linux/mutex.h>
>  #include <linux/platform_device.h>
>  #include <linux/reset.h>
> @@ -64,11 +65,34 @@
>  static void rzg2l_du_crtc_set_display_timing(struct rzg2l_du_crtc *rcrtc)
>  {
>  	const struct drm_display_mode *mode = &rcrtc->crtc.state->adjusted_mode;
> +	struct rzg2l_du_crtc_state *rstate =
> +		to_rzg2l_crtc_state(rcrtc->crtc.state);
>  	unsigned long mode_clock = mode->clock * 1000;
>  	u32 ditr0, ditr1, ditr2, ditr3, ditr4, pbcr0;
>  	struct rzg2l_du_device *rcdu = rcrtc->dev;
>  
>  	clk_prepare_enable(rcrtc->rzg2l_clocks.dclk);
> +
> +	if (rzg2l_du_has(rcdu, RG2L_DU_FEATURE_SMUX2_DSI_CLK)) {
> +		struct clk_hw *hw_parent, *hw_pparent;
> +		struct clk *clk_parent;
> +
> +		clk_parent = clk_get_parent(rcrtc->rzg2l_clocks.dclk);
> +		hw_parent = __clk_get_hw(clk_parent);
> +
> +		/*
> +		 * SMUX2_DSI0_CLK: if LVDS0 is used, be sure to set 0b.
> +		 * SMUX2_DSI1_CLK: if LVDS1 is used, be sure to set 0b.
> +		 */
> +		if (rstate->outputs == BIT(RZG2L_DU_OUTPUT_LVDS0) ||
> +		    rstate->outputs == BIT(RZG2L_DU_OUTPUT_LVDS1))
> +			hw_pparent = clk_hw_get_parent_by_index(hw_parent, 0);
> +		else
> +			hw_pparent = clk_hw_get_parent_by_index(hw_parent, 1);
> +
> +		clk_set_parent(clk_parent, hw_pparent->clk);
> +	}
> +

Here is the reason on why we need the CLK_TYPE_PLLDSI_SMUX.
As LVDS needs clock parent = vclk * 7

For that we need the custom mux (rzv2h_cpg_plldsi_smux_determine_rate())
to generate the rights pll rate.

What do you think? Please gently let me know.

Thanks & Regards,
Tommmaso

>  	clk_set_rate(rcrtc->rzg2l_clocks.dclk, mode_clock);
>  
>  	ditr0 = (DU_DITR0_DEMD_HIGH
> @@ -248,6 +272,32 @@ static void rzg2l_du_crtc_stop(struct rzg2l_du_crtc *rcrtc)
>   * CRTC Functions
>   */
>  
> +static int rzg2l_du_crtc_atomic_check(struct drm_crtc *crtc,
> +				      struct drm_atomic_state *state)
> +{
> +	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
> +									  crtc);
> +	struct rzg2l_du_crtc_state *rstate = to_rzg2l_crtc_state(crtc_state);
> +	struct drm_encoder *encoder;
> +
> +	/* Store the routes from the CRTC output to the DU outputs. */
> +	rstate->outputs = 0;
> +
> +	drm_for_each_encoder_mask(encoder, crtc->dev,
> +				  crtc_state->encoder_mask) {
> +		struct rzg2l_du_encoder *renc;
> +
> +		/* Skip the writeback encoder. */
> +		if (encoder->encoder_type == DRM_MODE_ENCODER_VIRTUAL)
> +			continue;
> +
> +		renc = to_rzg2l_encoder(encoder);
> +		rstate->outputs |= BIT(renc->output);
> +	}
> +
> +	return 0;
> +}
> +
>  static void rzg2l_du_crtc_atomic_enable(struct drm_crtc *crtc,
>  					struct drm_atomic_state *state)
>  {
> @@ -296,6 +346,7 @@ static void rzg2l_du_crtc_atomic_flush(struct drm_crtc *crtc,
>  }
>  
>  static const struct drm_crtc_helper_funcs crtc_helper_funcs = {
> +	.atomic_check = rzg2l_du_crtc_atomic_check,
>  	.atomic_flush = rzg2l_du_crtc_atomic_flush,
>  	.atomic_enable = rzg2l_du_crtc_atomic_enable,
>  	.atomic_disable = rzg2l_du_crtc_atomic_disable,
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> index 0fef33a5a089..73ff095e49ae 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> @@ -51,6 +51,44 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a07g044_info = {
>  	}
>  };
>  
> +static const struct rzg2l_du_device_info rzg2l_du_r9a09g047_du0_info = {
> +	.features = RG2L_DU_FEATURE_SMUX2_DSI_CLK,
> +	.channels_mask = BIT(0),
> +	.routes = {
> +		[RZG2L_DU_OUTPUT_DSI0] = {
> +			.possible_outputs = BIT(0),
> +			.port = 0,
> +		},
> +		[RZG2L_DU_OUTPUT_LVDS0] = {
> +			.possible_outputs = BIT(0),
> +			.port = 1,
> +		},
> +		[RZG2L_DU_OUTPUT_LVDS1] = {
> +			.possible_outputs = BIT(0),
> +			.port = 2,
> +		},
> +	},
> +};
> +
> +static const struct rzg2l_du_device_info rzg2l_du_r9a09g047_du1_info = {
> +	.features = RG2L_DU_FEATURE_SMUX2_DSI_CLK,
> +	.channels_mask = BIT(0),
> +	.routes = {
> +		[RZG2L_DU_OUTPUT_DSI0] = {
> +			.possible_outputs = BIT(0),
> +			.port = 0,
> +		},
> +		[RZG2L_DU_OUTPUT_LVDS0] = {
> +			.possible_outputs = BIT(0),
> +			.port = 1,
> +		},
> +		[RZG2L_DU_OUTPUT_DPAD0] = {
> +			.possible_outputs = BIT(0),
> +			.port = 2,
> +		},
> +	},
> +};
> +
>  static const struct rzg2l_du_device_info rzg2l_du_r9a09g057_info = {
>  	.channels_mask = BIT(0),
>  	.routes = {
> @@ -64,6 +102,8 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a09g057_info = {
>  static const struct of_device_id rzg2l_du_of_table[] = {
>  	{ .compatible = "renesas,r9a07g043u-du", .data = &rzg2l_du_r9a07g043u_info },
>  	{ .compatible = "renesas,r9a07g044-du", .data = &rzg2l_du_r9a07g044_info },
> +	{ .compatible = "renesas,r9a09g047-du0", .data = &rzg2l_du_r9a09g047_du0_info },
> +	{ .compatible = "renesas,r9a09g047-du1", .data = &rzg2l_du_r9a09g047_du1_info },
>  	{ .compatible = "renesas,r9a09g057-du", .data = &rzg2l_du_r9a09g057_info },
>  	{ /* sentinel */ }
>  };
> @@ -74,6 +114,8 @@ const char *rzg2l_du_output_name(enum rzg2l_du_output output)
>  {
>  	static const char * const names[] = {
>  		[RZG2L_DU_OUTPUT_DSI0] = "DSI0",
> +		[RZG2L_DU_OUTPUT_LVDS0] = "LVDS0",
> +		[RZG2L_DU_OUTPUT_LVDS1] = "LVDS1",
>  		[RZG2L_DU_OUTPUT_DPAD0] = "DPAD0"
>  	};
>  
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> index 58806c2a8f2b..c6f9dc46ab31 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> @@ -20,8 +20,12 @@
>  struct device;
>  struct drm_property;
>  
> +#define RG2L_DU_FEATURE_SMUX2_DSI_CLK	BIT(0)	/* Per output mux */
> +
>  enum rzg2l_du_output {
>  	RZG2L_DU_OUTPUT_DSI0,
> +	RZG2L_DU_OUTPUT_LVDS0,
> +	RZG2L_DU_OUTPUT_LVDS1,
>  	RZG2L_DU_OUTPUT_DPAD0,
>  	RZG2L_DU_OUTPUT_MAX,
>  };
> @@ -46,6 +50,7 @@ struct rzg2l_du_output_routing {
>   * @routes: array of CRTC to output routes, indexed by output (RZG2L_DU_OUTPUT_*)
>   */
>  struct rzg2l_du_device_info {
> +	unsigned int features;
>  	unsigned int channels_mask;
>  	struct rzg2l_du_output_routing routes[RZG2L_DU_OUTPUT_MAX];
>  };
> @@ -73,6 +78,12 @@ static inline struct rzg2l_du_device *to_rzg2l_du_device(struct drm_device *dev)
>  	return container_of(dev, struct rzg2l_du_device, ddev);
>  }
>  
> +static inline bool rzg2l_du_has(struct rzg2l_du_device *rcdu,
> +				unsigned int feature)
> +{
> +	return rcdu->info->features & feature;
> +}
> +
>  const char *rzg2l_du_output_name(enum rzg2l_du_output output);
>  
>  #endif /* __RZG2L_DU_DRV_H__ */
> -- 
> 2.43.0
> 
