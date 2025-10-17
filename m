Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9945EBE984D
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 17:10:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73EB410EC4A;
	Fri, 17 Oct 2025 15:10:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Ppg9/JHo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011038.outbound.protection.outlook.com [52.101.65.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A754F10EC4A
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 15:10:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jboEJhDVqZ3OIdoAgajojWnABSDuyCIUWZZbWFaTOmip5NAV4qqczLV3SF0jxEWwruE178F15nPp7okvij+kuC6L+rGwU8NtbEefW6k74OLSwgIC2RWcihPQW9Fnk2HtxduHKQFPJJFS7N5RtOFGM7dhomHN0E1TAWhx0QWSLF/0QSlZPJnmVaMeY3Ln2pv1fduW0HbwxvlMlE7jKlROP2ezRqRdvQOxKn3PSrlsJejRqtwlOg3+5L0vxhmWwcA7XkkIlghP8eEc46ufifnJVlzV4ulWnyhf1aAzPX6hVZuCBf/n6tW7DDdPfAt1HXr9v6OFchQ45PFqw+EGZWAMIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hB4sUAKGwxFEIta3DvzyiGmmC9cW9nn+XnOkns/Y750=;
 b=CuE3EWV0zHILwuy/8ZOtsC1kVnv4kgIcS11N3r92r2BPxVddYG93lZVmS75mTBxkffOaHlae7f3x0pzHzgCCubKhZO+2N5V3P4njM4hXLmlyFHT6hOFu9R5dNYsChBs0nr+6v+q/4mgpmeNT1vxPtLjMBrD+Jg+q0ASzXG16ebdAQXnSVrK4PkA4IvZd+Q2s7ODCvdV7phZa+tk4qaXOlIUeRfo9S3XKQmb0Ad8Ypl4h5p8lbZovmBdn7wV+nOXS3CNoXSzoqVd7NYPjCq/v6vqLH05j7TaMEfMkiRg6vB5tOgd4KORj0o+hplvvrH3282NiqrhWL10uz8kVMOfVTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hB4sUAKGwxFEIta3DvzyiGmmC9cW9nn+XnOkns/Y750=;
 b=Ppg9/JHoem3OglbuFDlbl4OfzFakXz6Ogvskyjo3zu5L828FY7AQpxFaMu2bPU1ufCFvHvXKMUc05q8X4WSRGFIbG91jvSYKbWqKgCh8l0hha4HWlVJgVy0zxegZXbjGTunJdIptphzXhl8Z/tQ9u6mndBhYvC3XL4+XVk8DHtgRvpJQaFFctFy+TspRTYEDGg+AIMZtKNNWhH3KgSJdmeLJvZmduMcywFc6icOMgHFPGh6IviOcaR35XH4OwUeNYlPDqYd2kZupIj9lJTNEgZWmf08/zvO4Iw7EdnJpFIIrtfSZ9GYuI7DVK+4zwLGXO/kKCWT1Fw/FJt9gl8bXaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by PA1PR04MB11455.eurprd04.prod.outlook.com (2603:10a6:102:4f0::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Fri, 17 Oct
 2025 15:10:29 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9228.010; Fri, 17 Oct 2025
 15:10:29 +0000
Date: Fri, 17 Oct 2025 11:10:20 -0400
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
Subject: Re: [PATCH] drm/imx: Add more RGB swizzling options
Message-ID: <aPJcXLcvX15A0HtA@lizhi-Precision-Tower-5810>
References: <20251017144626.66918-1-marek.vasut@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017144626.66918-1-marek.vasut@mailbox.org>
X-ClientProxiedBy: PH7P220CA0030.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::6) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|PA1PR04MB11455:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f823f69-df52-4887-8dea-08de0d8f4eec
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|1800799024|19092799006|7416014|376014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HP31/kC/6r/lvazIgPEPgykDNBpaYArUcjyy+dPny/jaVaovVBYOdHfihJRw?=
 =?us-ascii?Q?nKM6RAqKuk0ATDfwMeXLk3rF78/6wwGuphJR3ayDSs/G+oTnxq1x31eMttTd?=
 =?us-ascii?Q?ov2yv8y8LHdahxGia7kNWzBbkLHoA0pTyZNWsrRsVVJRgxuHDz5aNK2SGlKt?=
 =?us-ascii?Q?jDUH/Mw1BYpkmCdKI3yBZlitHiU6yrGCOcDkYA3g2GjBOTUHkwEbqlZ1r5ii?=
 =?us-ascii?Q?Ztbe3nAD4z96I3sTb0M8yCZYcmCtYMHzWIRrnsM7ekE1DvgHmZFcPJ/d7vzX?=
 =?us-ascii?Q?NHvpV9ToXVnHJRyuLFPWUZSIfIyLqzfucA7R2HYEGazkATCqoKjF798SLwUf?=
 =?us-ascii?Q?M30fyWd0CX6RGDzXrSdOrglA1EyAANYOhMrQwXf0qMA3HbGmKOnnwEKqYPVP?=
 =?us-ascii?Q?M8ZctiiybEKC/lDNx2Unonv/StxRuK+zqo4HDr1dUkv7HiTtc22gAQv0sZdb?=
 =?us-ascii?Q?ZZFv7LVxdlqOXy9K46OHha1V/yIF1bmBD/8iNIDRQc7I0c0K/kbwqtSAMyFp?=
 =?us-ascii?Q?bjpvXINE6ddp+9lkcBmSEtVkzOMcMWwow8kdxVwMjhV68WyXf4XjJLFE2LUz?=
 =?us-ascii?Q?queopmOtfZ/k3savBIIByWJF2guAX/tdNUqGoWQ08Yzp+geM7+/ghp6Bq4sL?=
 =?us-ascii?Q?IOgw16WLCYvuNY5ED71g16UDB9AyFA0HLk9nHYgCghB2qdQ8/caDqpIN7lIi?=
 =?us-ascii?Q?TD+z1B7LCu6+LZHFQkPK+z+DaEBoMFtI3VdNIu+HrQMbpVJrSmRD/ZADfW5k?=
 =?us-ascii?Q?7RzH8zhaN7jiqs0OxPX5rRazlMxDjxyO4h+wEodbdYanHMykyp6gTTka4e9w?=
 =?us-ascii?Q?WGNpv8Zvl7UnG9TEUsvnHvW+h5hMo1Cc0L53iKcnjZxPcVcMTRDxk2J5gS2P?=
 =?us-ascii?Q?JO7cNvQtKNLQsOS7K0RfgipGr6jwsGVHPsD2z8hkNLHqe4UDJmhPJVZ0WKCp?=
 =?us-ascii?Q?e3cNAzovTYgdgHLmkZwlAja/ugEisl3HkdUMltPOhGwqfiF2k3pkcVVTbAA5?=
 =?us-ascii?Q?15rXYhKt3hT5gVF3zsUolZ+ywK8e5Err6cX3KDN4joRPyKkLo3oCvYpjw8Tb?=
 =?us-ascii?Q?p7i3NVnhkFDctFHFsmRenLZeEbpFmOBKgGkbjKpVljOSRmUKiFPxEHn+Sslx?=
 =?us-ascii?Q?MUqQ0FCQuDHKguGWTs/zSYQHvyw8Zjb0hxNvmjMRf3BaMTxt8EIp80g/BYXE?=
 =?us-ascii?Q?hbLioOKYlQ9D6ZzFm19ZObCQU94fpVdKAXDCYGyGO+LxUMwFociMg/3WeH5A?=
 =?us-ascii?Q?zZ9r55kJafls6tY5A9jAtQATBMHjUMU1EsMGPkL7G+uTWdlxiUKQa1DK6LYc?=
 =?us-ascii?Q?/G6+lg9HqFKcRwp5NFUcYZC+j05dyiRoT+0LpCBvAadQ2JJ+tgIXAOyW1NCe?=
 =?us-ascii?Q?t0ywpU3DqO4Nm/LnwcW77fLyrXu9QVSPJ36v/U8Jxg1OaIzzw6TZ+wzJ4xQ+?=
 =?us-ascii?Q?m/JZGryBYOG/eogDpA/k50ymmFLp/fj984QdL6Pn3CdVjqr8T1x4KbNRkGOW?=
 =?us-ascii?Q?CXYZd9ai+SIeZmYVQ/qmTv/1DLlB5QgkV+qc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXSPRMB0053.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(1800799024)(19092799006)(7416014)(376014)(366016)(7053199007)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MrDR5kHO75z5AWMBROkxaLXep7S2ZTDiU6wDavlaE9Y88UID2fgLAQdcY5PV?=
 =?us-ascii?Q?xIRexCp7PzNXdqJMjNL+TrlzkU9S2+Z5mLuqbWJLQ+8Tt8biGyMeiju6ixFO?=
 =?us-ascii?Q?W7QBHsZ8X7zg4RNUihCZ3CzKUgOK3/Ni4+ulG5UR/ZKijX9jrrHMKvifLQ64?=
 =?us-ascii?Q?3s7Py/dwiE+9kS0Y8wg/F81KxduAirI8FFqsnEmZcy2R3YoAE8SEOEpL+e0x?=
 =?us-ascii?Q?AUoVPh2FgN0QfR05FeP6hVdQ2LYwP10GVBlG+yAve6/SzF0NYJuVeIWPru1q?=
 =?us-ascii?Q?JfgqERHlzoNU4XFbdIU9/lKActBREY3NQWNtTsGURa/j8hNCnxoU0eXZDMFu?=
 =?us-ascii?Q?9NoeVRdjrmzfKUkESWhBxc7nPTD94APJquTzdbWQ81Jmd6a/Zhh3dGPGNbQ4?=
 =?us-ascii?Q?DceC1JxfOuq/l0m4JLB/DVM9l+ma3QiBjIf5z3n2ZEzMhoyvTPKurRjXC4kG?=
 =?us-ascii?Q?LtuFp+AjopoeuVtNB46GKcNj3J+UXS2YXA/M9OPCD4e1JMg6Qk/DTKvtr5wN?=
 =?us-ascii?Q?mFHWZlbV05kBuId4l4ulzjfIs2yt9qpSnFAOBCNJgmkdqfoHZIH6liFt5kLx?=
 =?us-ascii?Q?ZgodPV6EwpwlkLSFKic6tu9o31m8h4CQFwJVQBcSjJ+L/Pt/WB26/YHVBZDp?=
 =?us-ascii?Q?1Yg/FvZzKW3VlMMHEKceSm1+4z/DHI1Lrqmouno5RAPflktXO00SN5VEWFok?=
 =?us-ascii?Q?aoqXKrmrU6UUes+zhx93xVeDukjSajRBFppO9ggEgKKoXnphS38Ghi+A5qeJ?=
 =?us-ascii?Q?duNJ9nc2xSjR3/zAne4vzDW9GGIr81slQ0nxZJjNF7qfQ3SgQjPqgLxiBJxf?=
 =?us-ascii?Q?csNYEuVCvFpm5EwJw5z6QQS1kDb4hzgNPJFyw2tHLRgEqdPsSu6oXUGs7QTy?=
 =?us-ascii?Q?8xC2E7HpZvfaiIjcJbuQikpUvvaVlZwr7AKpZ0i1eVkkMFJPuVDPs8f221H1?=
 =?us-ascii?Q?sbzfZYWTzfbWHTGoopIUbuRCAjpI7g/i7x5Baz3LuB/rLCblLNFdhu3SClUu?=
 =?us-ascii?Q?j7wTAl+1B85Li/4jtTKeWlsLdfuBu6HquidfPk1WDpXrctlnCvaqYUKAgwfq?=
 =?us-ascii?Q?wLMdXW2XjiCgJbnhSi8bbHWXRM7oCYTNHWIVV1zpQpyO2KP4ETz9h6/EHgjA?=
 =?us-ascii?Q?NzD91eUsOCbvbezfg3nPsJ6cV5trvo7F5RM77BdQ1hAAv+/E+nWZ76K3IwlM?=
 =?us-ascii?Q?n7MYtlQ8QqBEDgnCHCsEOibwV0lRDZZ6gG5+LNqspko4lfiUzNf6apaJTCiF?=
 =?us-ascii?Q?H3wVK3tnXG2hMFsHIuLw38bxrFEJuGHUdKJd1Hm+puZxjv02AtHcsZP37Yz2?=
 =?us-ascii?Q?J6A2Q3T0EqKI9bdB/WoreL0GaNdTbb7+8XLymv8XZ+7hROgYDlBCMQIyzgEb?=
 =?us-ascii?Q?GzIfZkKZ5q06qEhFw+Cxob2cyGDfsQRaF/nBQOojG2gF+eCuFrk2fXH5iKbI?=
 =?us-ascii?Q?taC6TfakgsTfFaRcDB9Ak+0g/qqT6stpd5DGrdDb/bAsppNvhgBFANI/DId+?=
 =?us-ascii?Q?zDbad1OEf3f8k91ZuucSYUMOVifYA8UiQ5l+o6icFsM3Fo15OijLLYHlNgqY?=
 =?us-ascii?Q?PDjsW1eCqY+uaxcCEFe0upGsmPDI2BM4OhzkikS5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f823f69-df52-4887-8dea-08de0d8f4eec
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 15:10:29.0504 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Stgnvy/sfcAFzP2asXCQgW25K3/4D4nAeFymfafym14kAwvabRcJdszyylF61psms7bFCSosyyo1X/GxHi/29w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11455
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

On Fri, Oct 17, 2025 at 04:45:38PM +0200, Marek Vasut wrote:
> Add additional buffer format swizzling options beyond XR24, the
> hardware is capable of sampling other formats, fill them in.
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
> Liu, please test on MX8qxp , I do not have that hardware.
> ---
>  drivers/gpu/drm/imx/dc/dc-fu.c    | 40 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/imx/dc/dc-plane.c |  8 +++++++
>  2 files changed, 48 insertions(+)
>
> diff --git a/drivers/gpu/drm/imx/dc/dc-fu.c b/drivers/gpu/drm/imx/dc/dc-fu.c
> index 1d8f74babef8a..397af0e9b0236 100644
> --- a/drivers/gpu/drm/imx/dc/dc-fu.c
> +++ b/drivers/gpu/drm/imx/dc/dc-fu.c
> @@ -65,6 +65,46 @@ static const struct dc_fu_pixel_format pixel_formats[] = {
>  		DRM_FORMAT_XRGB8888,
>  		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
>  		R_SHIFT(16) | G_SHIFT(8)  | B_SHIFT(0)  | A_SHIFT(0),
> +	}, {
> +		DRM_FORMAT_ARGB8888,
> +		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(8),
> +		R_SHIFT(16) | G_SHIFT(8)  | B_SHIFT(0)  | A_SHIFT(24),
> +	}, {
> +		DRM_FORMAT_ABGR8888,
> +		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(8),
> +		R_SHIFT(0)  | G_SHIFT(8)  | B_SHIFT(16) | A_SHIFT(24),
> +	}, {
> +		DRM_FORMAT_XBGR8888,
> +		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
> +		R_SHIFT(0)  | G_SHIFT(8)  | B_SHIFT(16) | A_SHIFT(0),
> +	}, {
> +		DRM_FORMAT_RGBA8888,
> +		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(8),
> +		R_SHIFT(24) | G_SHIFT(16) | B_SHIFT(8)  | A_SHIFT(0),
> +	}, {
> +		DRM_FORMAT_RGBX8888,
> +		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
> +		R_SHIFT(24) | G_SHIFT(16) | B_SHIFT(8)  | A_SHIFT(0),
> +	}, {
> +		DRM_FORMAT_BGRA8888,
> +		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(8),
> +		R_SHIFT(8)  | G_SHIFT(16) | B_SHIFT(24) | A_SHIFT(0),
> +	}, {
> +		DRM_FORMAT_BGRX8888,
> +		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
> +		R_SHIFT(8)  | G_SHIFT(16) | B_SHIFT(24) | A_SHIFT(0),
> +	}, {
> +		DRM_FORMAT_RGB888,
> +		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
> +		R_SHIFT(16) | G_SHIFT(8)  | B_SHIFT(0)  | A_SHIFT(0),
> +	}, {
> +		DRM_FORMAT_BGR888,
> +		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
> +		R_SHIFT(0)  | G_SHIFT(8)  | B_SHIFT(16) | A_SHIFT(0),
> +	}, {
> +		DRM_FORMAT_RGB565,
> +		R_BITS(5)   | G_BITS(6)   | B_BITS(5)   | A_BITS(0),
> +		R_SHIFT(11) | G_SHIFT(5)  | B_SHIFT(0)  | A_SHIFT(0),
>  	},
>  };
>
> diff --git a/drivers/gpu/drm/imx/dc/dc-plane.c b/drivers/gpu/drm/imx/dc/dc-plane.c
> index e40d5d66c5c1f..68d32b76fab95 100644
> --- a/drivers/gpu/drm/imx/dc/dc-plane.c
> +++ b/drivers/gpu/drm/imx/dc/dc-plane.c
> @@ -33,6 +33,14 @@ do {									\
>
>  static const uint32_t dc_plane_formats[] = {
>  	DRM_FORMAT_XRGB8888,
> +	DRM_FORMAT_ARGB8888,
> +	DRM_FORMAT_ABGR8888,
> +	DRM_FORMAT_XBGR8888,
> +	DRM_FORMAT_RGBA8888,
> +	DRM_FORMAT_RGBX8888,
> +	DRM_FORMAT_BGRA8888,
> +	DRM_FORMAT_BGRX8888,
> +	DRM_FORMAT_RGB565,

Is it posssible sort by name?

Frank
>  };
>
>  static const struct drm_plane_funcs dc_plane_funcs = {
> --
> 2.51.0
>
