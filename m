Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C71A25F037F
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 06:11:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A64210E135;
	Fri, 30 Sep 2022 04:11:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2085.outbound.protection.outlook.com [40.107.247.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C83B10E135
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 04:11:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=meFK8ENGLZMnBfuQMJSzSHhqg+FSvL2rPmORfW+Fx/3lBdzYB8A6fQVnuCVLSJbuIHW4biABrZXXsB5pwC/kqEe9tZC1iw5WG1kS+7b0qZKEUs0oj16m/q/Y22BKKQdZBM8IQ0m3/d4lH+Yw0b//zjvtx+ktn4nK1nwTH6G/nvnCh9sKoJvMt86qCidhJ2KWXLvu6On3WbXPt6/xo1H+TFxaMIBqOXhQTfFn+Cn2DHEqvgsi3rteiKI4Q9UydiFW9TqiJioO62AopwO9fXsGNxit18y9YfOUvz2p+BRsqVwaBJCyyOIUBmsE6LfEQvyU9MYNasqjzz2hexgx65lvqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g82BWUghQ3DMVNztST+FkucEBz3JbWolWRb8cBIjWIE=;
 b=O4a5DfG1fXxkpKn+UGS9FadoI4gCiHqlMEOKT1A3ukwSvlESzFJihZ+coGpIDYgWjCrEUGO84ytLmAuKdS2CowILDpUGsf57D4HJMQhKifHg02OoQEdxezxphcD0dkE8lDzHFsAC04Npj1YYUbmye6Qsnigct2NJwW6jbTcuhdbC47ZqwQKWP6ihCTRkMUu7n4+VHZGDI3qp5q8+2zwzLnqmRt9kMm9pW4jNflMQtF8o09RXLErcxg+LiG2ijYEHwoZUSA1nYCozj4JzhS3iyDC7fXZPfMR5uq5oTsfbBAuupCq2Adie4MmtOofcVTgAVeST9O6/c1shScVANJEryA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g82BWUghQ3DMVNztST+FkucEBz3JbWolWRb8cBIjWIE=;
 b=bCgqmRU2TANWWhiZZudO5RSaFbAolSjciQ+9bHQm6mHU2TiIy7+kNBkQTdOnjpdPo8O9syNttniZbjC2bqkQYjPPhUEZchaN9TzGwXSl7PkJeXzE5MFyzUIbp2qyOFd8eS0p0vvRAYzLkJga+tYQLXI98uTA/H1EaGsl0GCMHI8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM8PR04MB7394.eurprd04.prod.outlook.com (2603:10a6:20b:1d1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 04:11:25 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::181b:75f7:dbc8:b4bc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::181b:75f7:dbc8:b4bc%6]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 04:11:25 +0000
Message-ID: <ac158d92e663015968791ecb4ff3e6e0ed76c228.camel@nxp.com>
Subject: Re: [PATCH v3 4/4] drm: lcdif: Add support for YUV planes
From: Liu Ying <victor.liu@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 dri-devel@lists.freedesktop.org
In-Reply-To: <20220929204235.773-5-laurent.pinchart@ideasonboard.com>
References: <20220929204235.773-1-laurent.pinchart@ideasonboard.com>
 <20220929204235.773-5-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 30 Sep 2022 12:01:39 +0800
User-Agent: Evolution 3.36.4-0ubuntu1 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0011.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::14) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM8PR04MB7394:EE_
X-MS-Office365-Filtering-Correlation-Id: eb105924-0af3-43af-8093-08daa299d70a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ecRbDOF/UYPAAeS/oox0XrImHoFQaGRB4PF8i6uypGcSMSQ03oEpKhLuos1lO1E7nb+4pcMlDkzLIppwJ6QBy1mAY/H9B/sCQ2wlyYZ/j1BhkxE9qvn6ae2jO29jV6KeGTS7lY9Iy4b6UCzd0Q4Rr+TTlsBlF1r3yc0WFWO30p0X3NIda7S7SKCkyI3yg/ZNzNlRKn2kpuUPx676LBBiDY8T8azVOeVDRdePlI6MIl4cOKdIaKP+WQUbvacA6+3pLlIKrYxZSmrJpIuQgUfvnXfc4rybKi5gka57X2SP9fqWGllosGn6sThFcPC+HUTfJCsSeg0aaTY3r1PdUkvksLRXJ6cBZbLToOhFrgNaKYR1SiX8w+x2nKn4tzGvDD4OU0BurAXd9NZqvbB08WZ8i7R2G+ZpkT6Aq5QwnqRnWOsdjwOoNl/2rxDoKvb0rzaLbnPH/e4c7lfk1lKmH5NGrTkMbgqwTlxtNybfqVHCiK31igMUNPrUNOF3Wlo5zvgRhgaMBR2JsFp28EbRSm9tQyvVzM7EUiN7v/8YTdUpw/KqnZ3B5cO8W5ADW0Vyz6049/14Eecr3jgOivBigjb8HoJLCYjP/q/3gPM+mR2SYRlo8HdU2DOmWOm5nP7wLUkH8o7Zu4S/J9HstHvrbyFwKjANsQJF7bNKI71spV3lit9OVQ+aO5C72ScxdEHAIT/xDZt0hqlm0WXSJ44Alfo1tUrHawYLKWavLN4/agvSlCpHDcExYTbQwEs0VMVPpvGjtlKGrtGNwsaQFB8pX3elEg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39860400002)(376002)(346002)(396003)(136003)(451199015)(36756003)(38100700002)(86362001)(186003)(5660300002)(2906002)(26005)(52116002)(6512007)(478600001)(6506007)(2616005)(83380400001)(6666004)(38350700002)(66556008)(66476007)(66946007)(4326008)(8676002)(54906003)(316002)(41300700001)(8936002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTMrVThzYXBrbU51RWJ2djB4RXdLSTl1QjNrSkJXRDdtK202WG5mWlVVMkx6?=
 =?utf-8?B?bnpoT3h4dXVJZWRKRUdab00wUk1ZR0VQV1I1Wkw4ZzQzVXc5b2FIQzlYQ0lx?=
 =?utf-8?B?dUdCaDk1Y2J2c1h3U3BwWEVIZ2lobDlHVVo0TUFWeTQrbW9QVU5nZ21Pc1Bp?=
 =?utf-8?B?UjJ1c0tESmhiWnhUUE00UmQ1WklrOHlrdFcxWXJoc0pDd0R4ODN3bkp4MW93?=
 =?utf-8?B?QjJnOFVST2pnSktFcHNqc3hnNVB6dUtyRVl2RkZyNDhEbi9PSGtMSytjelFU?=
 =?utf-8?B?b2dZRGNhVHE4NnpaRWNGUzRzWjNPbWJtcFc4L2U5N05EOTNXVm9UK1NxV1ZE?=
 =?utf-8?B?d01CWlErVmVrYjRXSU1WTFVzNVN5V3FzSmJ4Y0ZkeTlXdW1oeVlrbHB0bEIz?=
 =?utf-8?B?SllRVHp4MTlrdVZuZnZZcm9vdDdwd1R5THYzd3kwMUxPNkt0R2d5djgvMWVw?=
 =?utf-8?B?Rko1RmdmaVlvbHZEa2pXTVhXWUNIOVhJa1JKSWhRRFF6MTlJL0t3eVFseHRB?=
 =?utf-8?B?RkJkSHhtUkZ2cmMwK09KY2NpQnFqU0lDYjdEVE9FRXVvRE1XTVAvQW43Z3ZH?=
 =?utf-8?B?MzR2SnZLWkJiWFpXcmdrTjlZdWNITE9GejAxVzNyc1EvT2tlQTM2WVdvRTI2?=
 =?utf-8?B?RmNpQVBHY0Q3bXBGR3IwK1ROWVVZUllNVjhJQ2dKbmpBZEpNV3VyY2tOM0to?=
 =?utf-8?B?cUdtMnlVOUR5ZVpjbm1WR0VvYm8rSkZoVXdEakx1ajJlKzRkYVRmZ3BscWZJ?=
 =?utf-8?B?SXJZbDNMZHdlZ1lYRktuU3gwc0MvSndVZzNLOWlGdXdjbjVmamxQemJ5WnJG?=
 =?utf-8?B?aUU1b0ZVWXNxNitwM0pKWjJ5WWRDaFVvUkdkSDc3VzFuQU5xa0M2VGZvSERV?=
 =?utf-8?B?YlRBc1ZXWWpoZWZrRk5yaGxJM1I3N2JpTC9paVhtcHd0ZGhxV2pwRGxGUnFt?=
 =?utf-8?B?SDJmc3JVZE5UWHRhUFlNQmkwYlFNQmFJS203TU45VGwrM2x5YUxyYUIzK0FU?=
 =?utf-8?B?SUgrcGZycmhlOXh2NG1wV01qTFFwYmVZeFpnaGxadTQwOC9GTGZvNDVCRWhN?=
 =?utf-8?B?V2NoM0hlTVBHRGhtQlkySFhCb3VzK1hORTErSVNkRUtYYmZ1NXN6MTlTOTBi?=
 =?utf-8?B?OWJCcU11MzdUT2luTTlKQkkzN1NlZXVhVWdDZHZUS3lMSDRnY2hNOXk1ZWd5?=
 =?utf-8?B?bWxyNDFmRStQc2RxN2hralFBTTRDa0FtMjlwYmJzL3BhN3FiT3h5YkM3UGZB?=
 =?utf-8?B?YzJWN1NBTEZ1alNJSkVjdFNETDNyS25zSDZHOVFJUkNDVnZlbFRkTzhvWkdl?=
 =?utf-8?B?U0IrQmVhTzN3Y1d2RXA0WG1lc1hlK3RBT2V5SGROS1lHZ1BnbDI3REZwTDdM?=
 =?utf-8?B?TjVGYlJNTDU3V1BVdm4vdklwVUVQVTFHUlZNQTExa3VEaFlKVnYvQWJSQitM?=
 =?utf-8?B?RmtQN1VFNjFkdWYzT0xZNTZINkx6ME5vWjJpSEsrNDlHdUR4S2djMy9RNU9M?=
 =?utf-8?B?cXJTelZFUVdtVjhiSzRrZS9zaDJXNk42enF6aDhKVmw0VlRJZk5tZE9kMER3?=
 =?utf-8?B?YW8rSXNQZTc1OUJtZmUyTzdpVkxFQlFwN09tR1FSdEk1eWZ5WndndzRLdjBV?=
 =?utf-8?B?SjFIQXVYWkVyZSsxMWxyb2drTk9XS2lMUXBwNFBRNm5FWGIvQmVtOEc1Qlhz?=
 =?utf-8?B?a2VjQmJ6cDkzV0tSVWtzc3ZNWFUvdHp1S2tXcDhvY1RMc2JlR2RGOFY4RDFx?=
 =?utf-8?B?OGRzYTJMclVFUENlNnRaNW9pRTlLckpEZUg5MTVvMjFTWlRFYUh3TWZFVTdF?=
 =?utf-8?B?ZlA4a1FCaHBlTzlHT3NwaStqNEFpc2ZmVnJzRWNudEYxUzNRREcxeFJ5WTBq?=
 =?utf-8?B?ejFRTUZLZXR2MVRGUE9lZ1h0SmVwRkN3eG9hc211d0VVaTNpQjhJNE9SZG1l?=
 =?utf-8?B?NXVmN2J3aGd0d3h2QXZCb2ZzSVF4K05ncTFialVPRTBOYStRalUvTDVYZ3Bw?=
 =?utf-8?B?SktSYWJIbEZSSFh2OFJDamR1VC9xeEpsSko2QkxsRSsraVVaeC8ybm9RUVZG?=
 =?utf-8?B?UTJnQ1Rwc3h1Y3k5WkRMdkgzS0E4b2xtNzI0Y0FJd01wZEtBdUtUUHRVTVdB?=
 =?utf-8?Q?r4xxLbaESLGfUFO29z0TyT7aD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb105924-0af3-43af-8093-08daa299d70a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 04:11:24.9394 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gjjoamNgfLBdf/6DnBZjo+Nwx4KBuk0oLtgJ9qLrRRVOA4W7DPWlmgBBwMmXZs+wfcIOE/5EUT5wxNcLRg3ikw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7394
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
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Daniel Scally <dan.scally@ideasonboard.com>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Thu, 2022-09-29 at 23:42 +0300, Laurent Pinchart wrote:
> From: Kieran Bingham <kieran.bingham@ideasonboard.com>
> 
> The LCDIF includes a color space converter that supports YUV input. Use
> it to support YUV planes, either through the converter if the output
> format is RGB, or in conversion bypass mode otherwise.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Marek Vasut <marex@denx.de>
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
> Changes since v2:
> 
> - Fix YUV to RGB coefficients
> - List floating point coefficient values in comment
> - Express CSC coefficients with three hex digits
> - Move | to the end of the line
> - Add comment header before RGB formats
> 
> Changes since v1:
> 
> - Support all YCbCr encodings and quantization ranges
> - Drop incorrect comment
> ---
>  drivers/gpu/drm/mxsfb/lcdif_kms.c  | 260 ++++++++++++++++++++++++-----
>  drivers/gpu/drm/mxsfb/lcdif_regs.h |   5 +-
>  2 files changed, 224 insertions(+), 41 deletions(-)

Hmmm, 'git am' fails to apply this one to drm-misc-next but it's ok
with v6.0-rc1.  I should have tried drm-misc-next with v2.

> 
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> index 08e4880ec6cf..81454b53936f 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> @@ -15,6 +15,7 @@
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
> +#include <drm/drm_color_mgmt.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_framebuffer.h>
> @@ -32,13 +33,119 @@
>  /* -----------------------------------------------------------------------------
>   * CRTC
>   */
> +
> +/*
> + * Despite the reference manual stating the opposite, the D1, D2 and D3 offset
> + * values are added to Y, U and V, not subtracted. They must thus be programmed
> + * with negative values.

Can you add the generic conversion equations with [A-D][1-3]
coefficient symbols as comments in code, like imx-pxp.c does?  It will
improve code readability better and tell which coefficient is which.
Also for RGB to YCbCr conversion if you want to do that with this
series.  Sorry for not pointing this out in v2 review cycle.

> + */
> +static const u32 lcdif_yuv2rgb_coeffs[3][2][6] = {

[...]

> +	/* YUYV Formats */

'YUV Formats' would be better?  Again, failed to catch this in v2...

Regards,
Liu Ying

> +	case DRM_FORMAT_YUYV:
> +		writel(CTRLDESCL0_5_BPP_YCbCr422 | CTRLDESCL0_5_YUV_FORMAT_VY2UY1,
> +		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +		in_yuv = true;
> +		break;
> +	case DRM_FORMAT_YVYU:
> +		writel(CTRLDESCL0_5_BPP_YCbCr422 | CTRLDESCL0_5_YUV_FORMAT_UY2VY1,
> +		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +		in_yuv = true;
> +		break;
> +	case DRM_FORMAT_UYVY:
> +		writel(CTRLDESCL0_5_BPP_YCbCr422 | CTRLDESCL0_5_YUV_FORMAT_Y2VY1U,
> +		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +		in_yuv = true;
> +		break;
> +	case DRM_FORMAT_VYUY:
> +		writel(CTRLDESCL0_5_BPP_YCbCr422 | CTRLDESCL0_5_YUV_FORMAT_Y2UY1V,
> +		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +		in_yuv = true;
> +		break;
> +
> +	default:
> +		dev_err(drm->dev, "Unknown pixel format 0x%x\n", format);
> +		break;
> +	}

