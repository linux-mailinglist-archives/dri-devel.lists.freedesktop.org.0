Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B82BD5B9C
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 20:31:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AFE410E4BD;
	Mon, 13 Oct 2025 18:31:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="SNtHeaJ3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012013.outbound.protection.outlook.com [52.101.66.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE91B10E4B9
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 18:31:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pM7cpajlq7kfXbx9HuI9z2g/MYXmFJfN1cUTZAeLVwI4I2cZcJceYfCqQTPyXjcRyGnHZSFCZQciDjqyVgbGHigb7oHVnm6tdQxbdER8fuzMFUCmogxWcnjqazmneRPt68RC8ei8r7UfYzdUZU40+HlybD1S0StiXg2AMsL6DFOME/z0Zp+Q7z6+u6/xUPFCTqN3DXVb9k0kjwuz7HuM8Sut13qWzHxkY9IYoV/Egzshaa0fPnIDSJvzuYGGKGOmQdKvamx/RwXktOVxD7VYmlXUAWDIiX2sl3u8FCwy47lZifFurUyhm/wOm6c6MYmKMF/I/sFK61nJGp3Mped31A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M+QYGLxmECyUwP0mAJR/AYb2pBzF42AvLYb24pnR75U=;
 b=eDDP5xjA7wkP98ShGfYcLuvUwmKNPSNHnftw6/z+M5rbS24gBLJcaCUh+QciRB3rM3C5iQ0IF4nFy+YMBfnZjq9gQvtRmiqIXpGoC+OOJ+hgEbjIpGwguWzSALO3aOZ0M22RF+ADQetL9uwg4RqVlQi+n7x0qW7WypAwcXP9UOAwitTWoU6aEk+6TEB6YdXniNasOtnzeiovllu03T/2B/h42/aqKNsWMvSYZjNiKEzQv6D4CIV9wneNg30AbqzaBw/z/8lRxLyAsYxSjeSZwVcpGfxplNxxQ/BhrfY+Q0FJmWr0RlDjqYz/JQCX+88LDEU0BwcCgi8dd24lhuyNrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M+QYGLxmECyUwP0mAJR/AYb2pBzF42AvLYb24pnR75U=;
 b=SNtHeaJ3v5Z9RvwTMfxmblZCJRWmBiWEpx+teETKfbEGy35k1AaEVSqnQI1UNyYAVNmf2iKTzRhRvkqZkp4biFdRbICTkj3qMO5/zHbVIvdgL9P7CcxbA3acBoR9wRjT86BgWDqHVfG/H1ZpgaBt1onTC+mv11+InEl7VE/AOIBw3Xxur3djzOhiHWpLuidVfB7FKQz3JZe+V2aKFVNojNAANUK1tEfTIxC6oPjA5M8Jn6giJh9eT5HwWO1q2TXLRLAzpI2KK18nTpHEUOiQOM296hwuNMySLbI9S/CyhJV2WNfPyMYpGzCh+wj0tJysMTwfNktgJeiYGF/CWbfhig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by AS1PR04MB9383.eurprd04.prod.outlook.com (2603:10a6:20b:4d9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Mon, 13 Oct
 2025 18:31:45 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 18:31:45 +0000
Date: Mon, 13 Oct 2025 14:31:36 -0400
From: Frank Li <Frank.li@nxp.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH 12/39] drm/imx: dc: ed: Pass struct
 dc_fg_subdev_match_data via OF match data
Message-ID: <aO1FiCu9cHKtwT94@lizhi-Precision-Tower-5810>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-13-marek.vasut@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011170213.128907-13-marek.vasut@mailbox.org>
X-ClientProxiedBy: PH8PR21CA0013.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::22) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|AS1PR04MB9383:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fcc09a4-b5bf-48b7-0358-08de0a86c2f1
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|52116014|19092799006|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qGLmZBMne/PXAdl/TdJLgOFYyAikI2Hr4an9or58jRf+da423tBPNgCatuAp?=
 =?us-ascii?Q?ljmgiqOwfSvVyRAIkq1cqlD3mNmJGGmWExReqt1IIT+cxojlU+vye1wKCv+g?=
 =?us-ascii?Q?tjqzY1x3aSCgS1VJ4kURquXjTw7vHECA4OK5xOWCX5TfM8Qxv6ZRgPj9zX4W?=
 =?us-ascii?Q?dGAOsMeXTzDhYynUU0M1szL2tuyS114j5qMKZFombaqSxVd9S2L2Mw2wGk4M?=
 =?us-ascii?Q?MRvfFHdbfoMJNQ4KE/vLlj5d0nRU9NQXF+AAR9/AaeRju8SJeJVszxE8o3c7?=
 =?us-ascii?Q?hsTmN1jlfdkRuIVUTZgiYqH6tjQtimzPN8WcPwFwYyxvtRFV1gpxgoURE2Sp?=
 =?us-ascii?Q?JfECMc2+zXEC4RnM5DsmUDAdHWFx47JyRyaZgmEkPaWuWi30FY1l3FybDLBa?=
 =?us-ascii?Q?puS5JJuqlbBgvIxTWH/lLYsu1VNuxnFz5+/t7+kkWJ3h+BWeHkbV0f06EEA8?=
 =?us-ascii?Q?rwag1E+zAGvxZrl9i4m8Y5rdj+EejtDAaAP+nOnhnuhzt1rcfXeq4cenEJgI?=
 =?us-ascii?Q?Y7wKTPQNX7xdtES/s6fJNVU7Rd+U4tz0ApsENQMPOgtwbeocGZzp4reQkDFE?=
 =?us-ascii?Q?r6TZWU4raSnMYCD95Ke3TY84HYRyMsBamT9nWt/0xi9a8vS3AwJ2SEZQ0Ig2?=
 =?us-ascii?Q?7N3b9p+OXkcBWfbtSb9mt3pBPU5SPUqukrw5LGPDQOb40Cv0sfMOdtWUV1L0?=
 =?us-ascii?Q?NnR0r0sD3W2i6ZEuABAfhbUmOcQ/QVzKl4XnKCUqIfdmTkYFZPloyWrHA0KV?=
 =?us-ascii?Q?2NPEumMpi3Qh4juF0taDLa1+bzRnguvmsgBP2ShN/RtP5Jd83IRoXwo/dV3n?=
 =?us-ascii?Q?/Vzogt+Na1NxGtgYvNpYe/kckulV/B29JWTju16XTgV3OFAq5z/a6+CPm0ZK?=
 =?us-ascii?Q?q6CaqCc1d+jUzxb/qfWSROaGFu2/viJ1hztmxDAfrSlnIFvNk3mmZbJnH8im?=
 =?us-ascii?Q?+j/xn7b8bU1TmylR4N97TdVx9O2FOouYtWQRdnQnokyCRtMaoYxnf6wP6Kkt?=
 =?us-ascii?Q?RVfCmuyOdYfBzlZQvOlm1td1av+n2xGuK0RNZ4wid9wEUbVUnIaQPkbmwcpe?=
 =?us-ascii?Q?NKBkftsNNBJb4/FXuORlnjGwKs8Y8i8CSlwWz6zYBo9QHtVJn6FD42NLlHp0?=
 =?us-ascii?Q?FTlotzEOS2da8+fVY+9fsbPX9hU4c7GTFZfVlpjO6ib1fA0BFK8gNhvfU8DA?=
 =?us-ascii?Q?tfsc9hXicwi0geRXlif1SsofbjGVdyLJWUrIveqE+IpHJ+C6hee8cTXOPN6C?=
 =?us-ascii?Q?Am7Ifs91gMy+uC+zl3vLt/w6GiqMT6zaKBmXPkYKGSquZoJwNsUpqwXoWRXL?=
 =?us-ascii?Q?6N0JitWiQYvZ7uo7vcs0+VqLth1CN8RdqY1FjO9Mzbnf6+c91SEL6r+sRSoh?=
 =?us-ascii?Q?3SOqfwdnL01EjEKC7Riw3b/xIxfCKWTm87jhwJce2f/mv3Xvb6FAfyb2fr+4?=
 =?us-ascii?Q?48CpdN1mxhbIRyIPaR7lK0dnhi9cSR3OcLR4k8exzImc8IAzt5+HVCQcg6dX?=
 =?us-ascii?Q?cgTZ8a555C10y//SqB/e8bpMR/UHEECDRn15?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9621.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(19092799006)(366016)(7053199007)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?R5uFmoZTlb+lqkwaV/yrFlBEYIfympb89iQbiE03BpgttLvg2M8IdYbdMeC1?=
 =?us-ascii?Q?32m+FZxgfu5Q3zo0PZXjkOBcLG3suRIbFOWfz/qpXpwJ4mzSptO+XhrEQxBV?=
 =?us-ascii?Q?6SoXzufGf2fbEs0k9lp030YSiBUJHQbldwM1unJqKgmslnEd0+VbG/NPvuIV?=
 =?us-ascii?Q?5rCgFqeYghqgPIMQsLdetDj75q49UMBFipzwMgkolFDwOAMXdpCiGNe3YIeU?=
 =?us-ascii?Q?3SSTLv9Ffpe1Dq6C1H5K7amTySRljBhcoJaWf2m8EzI0chLHYj8w76rrU8BS?=
 =?us-ascii?Q?1IfHFmV82Xl/kxAdWD8YXSvJxfM6rdzp1fhlIwq7dFVnHkLqIKsXUGjIPNzL?=
 =?us-ascii?Q?/qX5MkRdDV4LaaNm3V6a5dUJboMCc3e5tysup1BRLk2BrQXlA+I0hWQB5229?=
 =?us-ascii?Q?pCMa6x4r5vWXsyr99qLx4aGXa3DmMVjYam5vzDvWE1C0+cpzA8IMAQsWJTSI?=
 =?us-ascii?Q?6w+gniCPYSO2qSKp9iOe/5EljzMVNmpXfcm1tIdtQqPT2eNaW0knB5orRz1E?=
 =?us-ascii?Q?rVTstYUwm+9rohUQIyzp5n7Q2rp1rxdxhIRTeEpDU3qdYVweb65W6rMFUTDT?=
 =?us-ascii?Q?ii8//tSk5gUoR9QaGmWHosUxDsK0Z4YGZI1+MS5twoUlU756Rn7iXvvEW4kp?=
 =?us-ascii?Q?85lXH1YIpvniXySaSd3phLO2z8pySe84mG7bime9dltd+SCVfpGeFSMt7QSs?=
 =?us-ascii?Q?Qq48XAQtgXz8NwlpzC74J4CQ+nnre/UtOkWIukdPHCTGGbc7YG62r6EbI/rV?=
 =?us-ascii?Q?5l47ZfeFYqf/7KrtrwS1Nj3ZyrlyWPpImc5Phjl1uB256XyHxFnzzNkIV/DL?=
 =?us-ascii?Q?GK0uoafR4gcePxSTrRDndZO0gtrglzo/3j229EHEGRAiAUG/gRQBAQVOsl1L?=
 =?us-ascii?Q?2jV+r5uTHitE0pLguJyz352e4Fwjn7WNlMziSjwGXQeqvgszICeCLBYw5DOF?=
 =?us-ascii?Q?6kp4T8ml/ePycgg9RObvUEyZrhOrTMNJIWTJiWNFTSGfT3SZ6J12S19Jd/fy?=
 =?us-ascii?Q?WEApWhE/Digg1Y0nSj2eAmJXKD1nUxrF+MIHBc9tl1VsISee92y/aUEFpVa8?=
 =?us-ascii?Q?WzhzAhDdv2us9utWkh//siNbhZTRML8aTcDhBfR7FcLcJGfAGqw/xoNa23HW?=
 =?us-ascii?Q?awR0juN5i+RM09AgWlR2/5JHw4f5kZ1eArTHzCd8zKy4iuV0Y3odAULE/6xu?=
 =?us-ascii?Q?NZdMVGxc/q9DyzBSNdnLjLyztGQXgC/ACr51PEo7d/C6Z8xGioMfcKiAPvRa?=
 =?us-ascii?Q?dHDEnV/0/+rK2O3vYAyBkgfd97NvBeNXzjiu8AIf4U6fPCLbVy2VpAs4dgSo?=
 =?us-ascii?Q?MwAOB4X0Uu+UXF40EE8Gl9V8ONe8zTNnc50kGu+vQXacjeC8JqtVf1IJZeFl?=
 =?us-ascii?Q?2ZuTu+FA6V3s30538MSuiIwWx1V9jT0X+NKllDPvS1hPY+4NQH8WtAdwmq2z?=
 =?us-ascii?Q?P9NHy+Jc6imOXQDSR2RTwTeH5d/nxDz6MRMmud/v1XgiqEbO4r3RX/jRdtOv?=
 =?us-ascii?Q?YQkl+u7NKWcv5cCzdGZM5dyBSY92/qBfuXy+Nri/TBNBq1nFiZAbBE44bB9g?=
 =?us-ascii?Q?sQK1sAKuHHtNz2DADfaSSBiHUkgZHS8BIMgaAakq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fcc09a4-b5bf-48b7-0358-08de0a86c2f1
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 18:31:44.9359 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MsGPUG0dU6AHAHDk9Zk3pWaECdlnsO2Pne/Lg2qPovO9kHXGjxCPXFMvuyHbmg9JKINeuDc3t8FLq5ER66iWvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9383
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

On Sat, Oct 11, 2025 at 06:51:27PM +0200, Marek Vasut wrote:
> Introduce struct dc_fg_subdev_match_data which describes the differences
> between i.MX8QXP and i.MX95, which in this case is registers offset and
> address space offsets, and pass it as OF match data into the driver, so
> the driver can use the match data to apply correct offset to access the
> IP registers on each SoC. This is a preparatory patch for i.MX95 addition.
> No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
> Cc: Abel Vesa <abelvesa@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> ---
>  drivers/gpu/drm/imx/dc/dc-de.h |  1 +
>  drivers/gpu/drm/imx/dc/dc-fg.c | 74 +++++++++++++++++++++-------------
>  2 files changed, 46 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/gpu/drm/imx/dc/dc-de.h b/drivers/gpu/drm/imx/dc/dc-de.h
> index e054ad88190e1..797056a09ddb4 100644
> --- a/drivers/gpu/drm/imx/dc/dc-de.h
> +++ b/drivers/gpu/drm/imx/dc/dc-de.h
> @@ -26,6 +26,7 @@ struct dc_fg {
>  	struct device *dev;
>  	struct regmap *reg;
>  	struct clk *clk_disp;
> +	unsigned int reg_offset;

the same as other comments, pointer to dc_fg_subdev_match_data.

Frank
>  };
>
>  struct dc_tc {
> diff --git a/drivers/gpu/drm/imx/dc/dc-fg.c b/drivers/gpu/drm/imx/dc/dc-fg.c
> index 05e635fdb4f9c..e13b057a92ffb 100644
> --- a/drivers/gpu/drm/imx/dc/dc-fg.c
> +++ b/drivers/gpu/drm/imx/dc/dc-fg.c
> @@ -12,6 +12,7 @@
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> +#include <linux/property.h>
>  #include <linux/regmap.h>
>  #include <linux/units.h>
>
> @@ -82,6 +83,12 @@
>  #define FGCHSTATCLR(o)		(0x7c + (o))
>  #define  CLRSECSTAT		BIT(16)
>
> +struct dc_fg_subdev_match_data {
> +	const struct regmap_config	*regmap_config;
> +	unsigned int			reg_offset;
> +	const struct dc_subdev_info	*info;
> +};
> +
>  enum dc_fg_syncmode {
>  	FG_SYNCMODE_OFF,	/* No side-by-side synchronization. */
>  };
> @@ -91,46 +98,52 @@ enum dc_fg_dm {
>  	FG_DM_SEC_ON_TOP = 0x5,	/* Both inputs overlaid with secondary on top. */
>  };
>
> -static const struct dc_subdev_info dc_fg_info[] = {
> +static const struct dc_subdev_info dc_fg_info_imx8qxp[] = {
>  	{ .reg_start = 0x5618b800, .id = 0, },
>  	{ .reg_start = 0x5618d400, .id = 1, },
>  	{ /* sentinel */ },
>  };
>
> -static const struct regmap_range dc_fg_regmap_write_ranges[] = {
> +static const struct regmap_range dc_fg_regmap_write_ranges_imx8qxp[] = {
>  	regmap_reg_range(FGSTCTRL, VTCFG2),
>  	regmap_reg_range(PKICKCONFIG, SKICKCONFIG),
>  	regmap_reg_range(PACFG(OFFSET_MX8QXP), FGSLR(OFFSET_MX8QXP)),
>  	regmap_reg_range(FGCHSTATCLR(OFFSET_MX8QXP), FGCHSTATCLR(OFFSET_MX8QXP)),
>  };
>
> -static const struct regmap_range dc_fg_regmap_read_ranges[] = {
> +static const struct regmap_range dc_fg_regmap_read_ranges_imx8qxp[] = {
>  	regmap_reg_range(FGSTCTRL, VTCFG2),
>  	regmap_reg_range(PKICKCONFIG, SKICKCONFIG),
>  	regmap_reg_range(PACFG(OFFSET_MX8QXP), FGENABLE(OFFSET_MX8QXP)),
>  	regmap_reg_range(FGTIMESTAMP(OFFSET_MX8QXP), FGCHSTAT(OFFSET_MX8QXP)),
>  };
>
> -static const struct regmap_access_table dc_fg_regmap_write_table = {
> -	.yes_ranges = dc_fg_regmap_write_ranges,
> -	.n_yes_ranges = ARRAY_SIZE(dc_fg_regmap_write_ranges),
> +static const struct regmap_access_table dc_fg_regmap_write_table_imx8qxp = {
> +	.yes_ranges = dc_fg_regmap_write_ranges_imx8qxp,
> +	.n_yes_ranges = ARRAY_SIZE(dc_fg_regmap_write_ranges_imx8qxp),
>  };
>
> -static const struct regmap_access_table dc_fg_regmap_read_table = {
> -	.yes_ranges = dc_fg_regmap_read_ranges,
> -	.n_yes_ranges = ARRAY_SIZE(dc_fg_regmap_read_ranges),
> +static const struct regmap_access_table dc_fg_regmap_read_table_imx8qxp = {
> +	.yes_ranges = dc_fg_regmap_read_ranges_imx8qxp,
> +	.n_yes_ranges = ARRAY_SIZE(dc_fg_regmap_read_ranges_imx8qxp),
>  };
>
> -static const struct regmap_config dc_fg_regmap_config = {
> +static const struct regmap_config dc_fg_regmap_config_imx8qxp = {
>  	.reg_bits = 32,
>  	.reg_stride = 4,
>  	.val_bits = 32,
>  	.fast_io = true,
> -	.wr_table = &dc_fg_regmap_write_table,
> -	.rd_table = &dc_fg_regmap_read_table,
> +	.wr_table = &dc_fg_regmap_write_table_imx8qxp,
> +	.rd_table = &dc_fg_regmap_read_table_imx8qxp,
>  	.max_register = FGCHSTATCLR(OFFSET_MX8QXP),
>  };
>
> +static const struct dc_fg_subdev_match_data dc_fg_match_data_imx8qxp = {
> +	.regmap_config = &dc_fg_regmap_config_imx8qxp,
> +	.reg_offset = OFFSET_MX8QXP,
> +	.info = dc_fg_info_imx8qxp,
> +};
> +
>  static inline void dc_fg_enable_shden(struct dc_fg *fg)
>  {
>  	regmap_write_bits(fg->reg, FGSTCTRL, SHDEN, SHDEN);
> @@ -174,15 +187,15 @@ void dc_fg_cfg_videomode(struct dc_fg *fg, struct drm_display_mode *m)
>  	regmap_write(fg->reg, SKICKCONFIG, COL(kick_col) | ROW(kick_row) | EN);
>
>  	/* primary and secondary area position configuration */
> -	regmap_write(fg->reg, PACFG(OFFSET_MX8QXP), STARTX(0) | STARTY(0));
> -	regmap_write(fg->reg, SACFG(OFFSET_MX8QXP), STARTX(0) | STARTY(0));
> +	regmap_write(fg->reg, PACFG(fg->reg_offset), STARTX(0) | STARTY(0));
> +	regmap_write(fg->reg, SACFG(fg->reg_offset), STARTX(0) | STARTY(0));
>
>  	/* alpha */
> -	regmap_write_bits(fg->reg, FGINCTRL(OFFSET_MX8QXP), ENPRIMALPHA | ENSECALPHA, 0);
> -	regmap_write_bits(fg->reg, FGINCTRLPANIC(OFFSET_MX8QXP), ENPRIMALPHA | ENSECALPHA, 0);
> +	regmap_write_bits(fg->reg, FGINCTRL(fg->reg_offset), ENPRIMALPHA | ENSECALPHA, 0);
> +	regmap_write_bits(fg->reg, FGINCTRLPANIC(fg->reg_offset), ENPRIMALPHA | ENSECALPHA, 0);
>
>  	/* constant color is green(used in panic mode)  */
> -	regmap_write(fg->reg, FGCCR(OFFSET_MX8QXP), CCGREEN(0x3ff));
> +	regmap_write(fg->reg, FGCCR(fg->reg_offset), CCGREEN(0x3ff));
>
>  	ret = clk_set_rate(fg->clk_disp, m->clock * HZ_PER_KHZ);
>  	if (ret < 0)
> @@ -191,34 +204,34 @@ void dc_fg_cfg_videomode(struct dc_fg *fg, struct drm_display_mode *m)
>
>  static inline void dc_fg_displaymode(struct dc_fg *fg, enum dc_fg_dm mode)
>  {
> -	regmap_write_bits(fg->reg, FGINCTRL(OFFSET_MX8QXP), FGDM_MASK, mode);
> +	regmap_write_bits(fg->reg, FGINCTRL(fg->reg_offset), FGDM_MASK, mode);
>  }
>
>  static inline void dc_fg_panic_displaymode(struct dc_fg *fg, enum dc_fg_dm mode)
>  {
> -	regmap_write_bits(fg->reg, FGINCTRLPANIC(OFFSET_MX8QXP), FGDM_MASK, mode);
> +	regmap_write_bits(fg->reg, FGINCTRLPANIC(fg->reg_offset), FGDM_MASK, mode);
>  }
>
>  void dc_fg_enable(struct dc_fg *fg)
>  {
> -	regmap_write(fg->reg, FGENABLE(OFFSET_MX8QXP), FGEN);
> +	regmap_write(fg->reg, FGENABLE(fg->reg_offset), FGEN);
>  }
>
>  void dc_fg_disable(struct dc_fg *fg)
>  {
> -	regmap_write(fg->reg, FGENABLE(OFFSET_MX8QXP), 0);
> +	regmap_write(fg->reg, FGENABLE(fg->reg_offset), 0);
>  }
>
>  void dc_fg_shdtokgen(struct dc_fg *fg)
>  {
> -	regmap_write(fg->reg, FGSLR(OFFSET_MX8QXP), SHDTOKGEN);
> +	regmap_write(fg->reg, FGSLR(fg->reg_offset), SHDTOKGEN);
>  }
>
>  u32 dc_fg_get_frame_index(struct dc_fg *fg)
>  {
>  	u32 val;
>
> -	regmap_read(fg->reg, FGTIMESTAMP(OFFSET_MX8QXP), &val);
> +	regmap_read(fg->reg, FGTIMESTAMP(fg->reg_offset), &val);
>
>  	return FRAMEINDEX(val);
>  }
> @@ -227,7 +240,7 @@ u32 dc_fg_get_line_index(struct dc_fg *fg)
>  {
>  	u32 val;
>
> -	regmap_read(fg->reg, FGTIMESTAMP(OFFSET_MX8QXP), &val);
> +	regmap_read(fg->reg, FGTIMESTAMP(fg->reg_offset), &val);
>
>  	return LINEINDEX(val);
>  }
> @@ -251,21 +264,21 @@ bool dc_fg_secondary_requests_to_read_empty_fifo(struct dc_fg *fg)
>  {
>  	u32 val;
>
> -	regmap_read(fg->reg, FGCHSTAT(OFFSET_MX8QXP), &val);
> +	regmap_read(fg->reg, FGCHSTAT(fg->reg_offset), &val);
>
>  	return !!(val & SFIFOEMPTY);
>  }
>
>  void dc_fg_secondary_clear_channel_status(struct dc_fg *fg)
>  {
> -	regmap_write(fg->reg, FGCHSTATCLR(OFFSET_MX8QXP), CLRSECSTAT);
> +	regmap_write(fg->reg, FGCHSTATCLR(fg->reg_offset), CLRSECSTAT);
>  }
>
>  int dc_fg_wait_for_secondary_syncup(struct dc_fg *fg)
>  {
>  	unsigned int val;
>
> -	return regmap_read_poll_timeout(fg->reg, FGCHSTAT(OFFSET_MX8QXP), val,
> +	return regmap_read_poll_timeout(fg->reg, FGCHSTAT(fg->reg_offset), val,
>  					val & SECSYNCSTAT, 5, 100000);
>  }
>
> @@ -305,6 +318,8 @@ void dc_fg_init(struct dc_fg *fg)
>
>  static int dc_fg_bind(struct device *dev, struct device *master, void *data)
>  {
> +	const struct dc_fg_subdev_match_data *dc_fg_match_data = device_get_match_data(dev);
> +	const struct dc_subdev_info *dc_fg_info = dc_fg_match_data->info;
>  	struct platform_device *pdev = to_platform_device(dev);
>  	struct dc_drm_device *dc_drm = data;
>  	struct resource *res;
> @@ -320,7 +335,7 @@ static int dc_fg_bind(struct device *dev, struct device *master, void *data)
>  	if (IS_ERR(base))
>  		return PTR_ERR(base);
>
> -	fg->reg = devm_regmap_init_mmio(dev, base, &dc_fg_regmap_config);
> +	fg->reg = devm_regmap_init_mmio(dev, base, dc_fg_match_data->regmap_config);
>  	if (IS_ERR(fg->reg))
>  		return PTR_ERR(fg->reg);
>
> @@ -336,6 +351,7 @@ static int dc_fg_bind(struct device *dev, struct device *master, void *data)
>  	}
>
>  	fg->dev = dev;
> +	fg->reg_offset = dc_fg_match_data->reg_offset;
>  	dc_drm->fg[id] = fg;
>
>  	return 0;
> @@ -363,7 +379,7 @@ static void dc_fg_remove(struct platform_device *pdev)
>  }
>
>  static const struct of_device_id dc_fg_dt_ids[] = {
> -	{ .compatible = "fsl,imx8qxp-dc-framegen" },
> +	{ .compatible = "fsl,imx8qxp-dc-framegen", .data = &dc_fg_match_data_imx8qxp },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, dc_fg_dt_ids);
> --
> 2.51.0
>
