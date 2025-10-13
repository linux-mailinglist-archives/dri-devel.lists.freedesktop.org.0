Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE87BD5D73
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 21:03:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24E8E10E4D1;
	Mon, 13 Oct 2025 19:02:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="P52z39tP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010064.outbound.protection.outlook.com [52.101.69.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2173F10E4CF
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 19:02:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YEgdRIBQzK8gdBBKSo2xQXcc+Qp1YNwxmIHVt//lhyOYpXTmjJ0WmzzBWdWBjgc6hsUhEvrvzfjCRVlrsA+sAuas3YGEXT3677HlZMgFI0Ntlt168F+O7PGsbghwNktT3jrVgWlOYVz8YV6odta4/0GgZCprVci4PNN+2CQJN4P2VFW5CY3Hf0ZeeWxDerz4JeOso8eMr5YcvZjHmVF0ZQYtr6K7/Rn9Mm1aTy68reDNRWiySxYgqMg2YdJg3kSavneOluUQeEBejyKqD4+M+KbGYq0CAL1cptZW3/lcGRPLS1dtH2aVrHwnc18JSpctHRzYlc3ddtqkI+KeAgjoYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a34kh5T2mozgkg1W/uOOaZMOq3WaD5G0JAlPZK03qxM=;
 b=Ve0024qb4lWM8U7GbYYZKuel3oPpCg3Z9C9zxO6KZxgh+Uaqjb7CRvUO4gSWNZuPgFxrvG7gU6qj/CY0QZEIClEmpdbaG54/NrLJwCqpqbqAJUmi4RjD9JvujJ2IMHrAifq2vs0apu8mK17IiuSnwqVJVtgoCJKxdQwvaLWQX5L4zMaKsua21QcsixXtT5nShN2HDR6nDabP6KIheJegwmKSA7Fkwu+HN4Iuu/XcaWI/FROVR0WU1X3mfvTUejdWJGEHIXDqrtlfLWc4Xu1Fzu5Y+osQaYH7YbfHS1olXr4iIH6nhQ7Nx793RrEXyngGUJbFQMGKzukm1TsrL/0ozw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a34kh5T2mozgkg1W/uOOaZMOq3WaD5G0JAlPZK03qxM=;
 b=P52z39tP2IO0On0f4K/Qbaqji48wdeyevt5V+XP6ZzLlGXME+k+noNy5qf0EDj3lGnHxDu9R4mFx6GQtAff3HfLdJX2cpFeSu1XQ7GwsO34d6701LjJF5vnDhyFIgGTnaSKzHYZBEmNkk30HHHtaDqx1/KHQpB8LWZgjZBqTBIvoKb2vzH0v7P0/XIrml+5Lq54Hr4Yfu4efi9JMD1z7tn4qvwkrZBUZPmO25eAtyBDOlSt0QgVw90a3SOs0JRuKP5GtEcYcY8sal4dG+OXiF9McZhMwxHHG2iw9MqDnzwbu5e5IALyJwjsrILxJ7zKhZnjDWdIYlKLNUvKz2OzMVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by GVXPR04MB9758.eurprd04.prod.outlook.com (2603:10a6:150:110::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 19:02:44 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 19:02:43 +0000
Date: Mon, 13 Oct 2025 15:02:34 -0400
From: Frank Li <Frank.li@nxp.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, Liu Ying <victor.liu@nxp.com>,
 Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH 26/39] drm/bridge: imx: Add NXP i.MX95 pixel interleaver
 support
Message-ID: <aO1MygVhvQRtrO47@lizhi-Precision-Tower-5810>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-27-marek.vasut@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011170213.128907-27-marek.vasut@mailbox.org>
X-ClientProxiedBy: BYAPR06CA0034.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::47) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|GVXPR04MB9758:EE_
X-MS-Office365-Filtering-Correlation-Id: b04240b7-33c2-4d15-08e6-08de0a8b16d3
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|52116014|376014|7416014|1800799024|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Tkm7vEtljbtwh0U5bpp/pTdV5zzqOJSbVT42MQ3Ekf0HMMxmGOyKUFUfH0Oy?=
 =?us-ascii?Q?IupDmhbF5czWR+M1STLtIBldHnn22cbraxgMIAMYEB6Emdy+nE4mfMw+e2Yr?=
 =?us-ascii?Q?HdknhG1P74FNnUHiZ9zC796MegpWyKtiN8Ba4br8UMQ2r5Vw+NYw0GTvUL+b?=
 =?us-ascii?Q?nLmEyj4TBxvfzlgg1x8nZi6fa2Vch6W61+csCY+VGfZCp65csnJ3k2nYsP1z?=
 =?us-ascii?Q?pNxH+d4RSgrqfkcvOLXC6SGBZC/tUsl2foTzWOlB+CKjeemcZbeHfY8QR0fd?=
 =?us-ascii?Q?c8GPkp8VeACl9PiAA6JHX/0TRmAV2zVV1cd6vASqt1gj1ZQ7VaTQV24qlwLT?=
 =?us-ascii?Q?r22kynNKE7RZBoJBn9zB4/gxidOct16L98eQNGhg2rU6k8ALWRSigetShcPe?=
 =?us-ascii?Q?4OlggOEkiknYHQ1wNCbBIWDFiTNJBUDN8xolS9ON1vC2c5YEY0VR2+YgqtuV?=
 =?us-ascii?Q?RVf/na2DYcXuRwpwJhMiZ3+GEAp6BquSCMDy1pyrGG7dpvBiHU0PZTdRTzRg?=
 =?us-ascii?Q?pEo4s2BTj4eXHzoaQRjIIIlKHOVsv6reh64V1Tx3eWD5lwbgxk6QlO/Qcigj?=
 =?us-ascii?Q?9iFVHJBXVxAAFx5htSbOFNzFlPwdOgfpVZzTHsDO/htjCSgZDJGh+wigg0Yv?=
 =?us-ascii?Q?xl+Xj3dSJzv9F72sC1sVz32rdVkeqrLFVR8aBpm+8OYkxys23I9myKAtFPTU?=
 =?us-ascii?Q?QwG9d4NbZmll6JGD/fxkm7HtQbiAoGtNLyqXz9/AXyUWNRENqSn9lrjMAbaS?=
 =?us-ascii?Q?lMpG0UoCaYyg4njeLQ24a4C8TaTauD11QTHjjl1eQPe4vnSV8LEDtp9m7oQ8?=
 =?us-ascii?Q?xI2lT/zYTSM4eob+EwB3svt1QuLxEdO+ga5FY2cnwGHkV+Aor/oloIQXfLtg?=
 =?us-ascii?Q?mwIVCsqmXiXPqj0M62hvPRQ08mjTzzDUfPjpx0baBcrAAxFqML64Sde7Ncrg?=
 =?us-ascii?Q?3huCPZXWCXMIhOVS/x92UG/iSYEp92FV+4njJ3FuBpApwJxQYxI5fgGFg1hG?=
 =?us-ascii?Q?5VRh075NJHp+ZfLkNUTsMa+u9PlQ1Wu/3x0dezPQrWfO0pLzqN/IUmqdBl6T?=
 =?us-ascii?Q?2quCCmKeMxLLZ8NCewAB2Lk61xnIk4BuisQ+VTbp6AFkv+E28Qgr7wh4lgLY?=
 =?us-ascii?Q?r/RBtCWUrxaH1XEOzwI4/kCpGRWf8ovNLmBTPTE4aNfzOI1pMA+r20gM3fe0?=
 =?us-ascii?Q?/66tVgKA6qCx/bdFA56PzSQufx7HCUOl+yIjIxnA+unN6drOv9yozHVUYcHF?=
 =?us-ascii?Q?q6b5iC9hgEInP2ZlUqm7247Q8lDpRBMbfgzCMLZeq3kaz2xHGNrgWX+zuNii?=
 =?us-ascii?Q?76FyewAfws9O1BQxbYJ+neu/4+0XytIWJsDA8y8d5aOcLQDPTe61MDG1UPtW?=
 =?us-ascii?Q?2JZVs2u/MFg98hd242unE/hPTieq5B1/qu+gpJbQ1xcMhpc4JnXLHuZXCO7/?=
 =?us-ascii?Q?wpGj8S6Cx45Ykn2IXYx9EBlRkDAenZqJgZrfXU5yh4FcGVEQbUaccitjuZoO?=
 =?us-ascii?Q?jKCyK4Ll3czpwfMZ35b65MctXl++ydGDzMZm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9621.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(52116014)(376014)(7416014)(1800799024)(366016)(7053199007)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VEemF9uyDbWl+1hj7r28a52K1eWinQ3spswM/7oGX4P1CKVjGHw4N46iFW82?=
 =?us-ascii?Q?3z23dVVQvkKxuqO5ZuqioWScucHor68n8A+4stho3eYBY2p81Ve71bh/FDqC?=
 =?us-ascii?Q?jhlMHYkOdDKPihRtVFMNuaBkSBcgJms+PDqsyIGCUVPJ2BSG5VqiPAmMZCRU?=
 =?us-ascii?Q?WoYXaPggxIxSXm23IbTUnzYToL/lgwj4bkW8e6LPw32SvICWcVf9LlY32WYy?=
 =?us-ascii?Q?r8P74ovefvG/tLZeW66uaLsYwWDPh16UqtjLY2kwtOnEMHlASei1PZzYIt3H?=
 =?us-ascii?Q?D/XKd0t2TSrjqcmKOkkZkeaNVuwEDVKwxnF6rd1xslmAwrjFQcSbM6g96PGo?=
 =?us-ascii?Q?uBnJ9XD3iduLyfH1nRbjUzFstpAl0oLYZTzq8AHYZrEqO6ofCsb91CL/aIT6?=
 =?us-ascii?Q?NLjwX0PIR7bW92+3a0pnBvoirTjemU9rNdFLM99KurEa3jAV8ITFvyQoYwn6?=
 =?us-ascii?Q?7fGfBwPm/ce4E5eDrkUIHRjpjCZZU6+9QNv96Ji4BT26kBl7XNkeUKdFjzPf?=
 =?us-ascii?Q?JkhoBX/oO9g0+PaxMcE1G/B7ivBVqD6R3swtAz7Cxyf8cPhaycp7DnDuNtl0?=
 =?us-ascii?Q?pHZXPyc7WT5dG5SBAywT+eVC7neXmsxuJiQSVMMH1sYLq0ZVWMEPxj7/Y7iw?=
 =?us-ascii?Q?bQHxDlBLqOVuAgiyQ5u5VrLZ3W0VdnHfza0GWAES0RY0QBMF2hZlnsOwpvfx?=
 =?us-ascii?Q?xWWb/NSjuJfIZc8+qdMQ2zq1TnukEkR/cG11GIyDU4sXWP2n7WOh86WDKIIQ?=
 =?us-ascii?Q?Sym58tblife24JbS/Fr2KB3/FmvkiYYCrIJR/wzsKYJnZNo8xKuyAftHnQoy?=
 =?us-ascii?Q?pbHAtTU+M1laro1EX5h8QQyroGXRAKUZmlOEAcR3x5cmE4JQdRTqqK8V1s9b?=
 =?us-ascii?Q?WNYd3jhemm4ekh07c8iPSvk5bgQvMZNP/mJJVjWeRUCmgo/ibR+9f6TeNhpT?=
 =?us-ascii?Q?EFO/0FPl0W4YdHM2IFXirL7lS0oT7ufP7pb/OiD+5BSakKpNEE8XPdPaNa58?=
 =?us-ascii?Q?WRoKBEY/eX4Mz/vzrk2qj2ezdluarubU11yezLZdKXqvucYWZSQkNPLjHGP0?=
 =?us-ascii?Q?tX9hNgCfI8845R4cJRSlH80I/NqE2Q3/VLEf+oVFulwRtrijT5FAIlMJgNaA?=
 =?us-ascii?Q?ohxewb2w8i+zax3OGZrGpb0UNNX2w58a750JQN8qDtGYWJUjxELZoQleWaUl?=
 =?us-ascii?Q?QD+/cMPDy/sDQrE8RuO/NWj9DzyVm0o1t7SG/uLECiRXWdu6ApvlalvQUow7?=
 =?us-ascii?Q?teW3KF8H4MfMZ+FQPbWkkHoPiht7459ISo0QYyIF64RevH5eHgPVeS5OkKNc?=
 =?us-ascii?Q?gXtNkqzvHctq8sqVpyqE+eYiwj6MGIOfjvQAKvLLhUQ9xcVpRZcPzL8E43xy?=
 =?us-ascii?Q?SSNTNRPXcDuusT9Urj/qFgecFr4OfzVWtuVQmMUpr3bgNIpLd4bjrYwaDHme?=
 =?us-ascii?Q?CEzWhPRQpG8llMJFrnZJ2oRn72zp5s1YWnogINPIAPvc+1Wu6y+tlARF/nUw?=
 =?us-ascii?Q?2HswE/EryRPoG28ZCKtGn2cuyXMdwWd1/+KgeKNr5g1/8eICr2EvWedH23FS?=
 =?us-ascii?Q?kMOQwnrTqzMdX0LTgsM=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b04240b7-33c2-4d15-08e6-08de0a8b16d3
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 19:02:43.6585 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xc+ljKnpnO0WhsDnj1hBtIzBNMIKYSqFLPOcuN4+O01/ymLwVzKKU6z3tgsx52n/Kn5nRV3MdyQImyuDmvSgCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9758
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

On Sat, Oct 11, 2025 at 06:51:41PM +0200, Marek Vasut wrote:
> From: Liu Ying <victor.liu@nxp.com>
>
> Add NXP i.MX95 pixel interleaver support.
>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
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
>  drivers/gpu/drm/bridge/imx/Kconfig            |   9 +
>  drivers/gpu/drm/bridge/imx/Makefile           |   1 +
>  .../drm/bridge/imx/imx95-pixel-interleaver.c  | 217 ++++++++++++++++++
>  3 files changed, 227 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/imx/imx95-pixel-interleaver.c
>
> diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
> index 9a480c6abb856..3e1b1d825d7bf 100644
> --- a/drivers/gpu/drm/bridge/imx/Kconfig
> +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> @@ -88,4 +88,13 @@ config DRM_IMX93_MIPI_DSI
>  	  Choose this to enable MIPI DSI controller found in Freescale i.MX93
>  	  processor.
>
> +config DRM_IMX95_PIXEL_INTERLEAVER
> +	tristate "NXP i.MX95 pixel interleaver"
> +	depends on OF && MFD_SYSCON && COMMON_CLK
> +	select DRM_KMS_HELPER
> +	select REGMAP_MMIO
> +	help
> +	  Choose this to enable pixel interleaver found in NXP i.MX95
> +	  processors.
> +
>  endif # ARCH_MXC || COMPILE_TEST
> diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
> index dd5d485848066..583054c70f002 100644
> --- a/drivers/gpu/drm/bridge/imx/Makefile
> +++ b/drivers/gpu/drm/bridge/imx/Makefile
> @@ -8,3 +8,4 @@ obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) += imx8qxp-pixel-combiner.o
>  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK) += imx8qxp-pixel-link.o
>  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK_TO_DPI) += imx8qxp-pxl2dpi.o
>  obj-$(CONFIG_DRM_IMX93_MIPI_DSI) += imx93-mipi-dsi.o
> +obj-$(CONFIG_DRM_IMX95_PIXEL_INTERLEAVER) += imx95-pixel-interleaver.o
> diff --git a/drivers/gpu/drm/bridge/imx/imx95-pixel-interleaver.c b/drivers/gpu/drm/bridge/imx/imx95-pixel-interleaver.c
> new file mode 100644
> index 0000000000000..e6d96e68db895
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/imx/imx95-pixel-interleaver.c
> @@ -0,0 +1,217 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +/*
> + * Copyright 2023 NXP

2025?

> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/interrupt.h>
> +#include <linux/media-bus-format.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_graph.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include <drm/drm_atomic_state_helper.h>
> +#include <drm/drm_bridge.h>
> +
> +#define PIXEL_INTERLEAVER_CTRL	0x4
> +#define  DISP_IN_SEL		BIT(1)
> +#define  MODE			BIT(0)
> +
> +#define CTRL			0x0
> +#define  VSYNC_POLARITY		BIT(10)
> +#define  HSYNC_POLARITY		BIT(9)
> +
> +#define SWRST			0x20
> +#define  SW_RST			BIT(1)
> +
> +#define IE			0x30

Register name is too short. add prefix for it.

> +
> +#define DRIVER_NAME		"imx95-pixel-interleaver"

Only use once, needn't it.

> +
> +struct imx95_pixel_interleaver_bridge {
> +	struct drm_bridge bridge;
> +	struct drm_bridge *next_bridge;
> +	struct device *dev;
> +	void __iomem *regs;
> +	struct regmap *regmap;
> +	struct clk *clk_bus;
> +};
> +
> +static void
> +imx95_pixel_interleaver_bridge_sw_reset(struct imx95_pixel_interleaver_bridge *pi)
> +{
> +	clk_prepare_enable(pi->clk_bus);

need check ret value.

> +
> +	writel(SW_RST, pi->regs + SWRST);
> +	usleep_range(10, 20);
> +	writel(0, pi->regs + SWRST);
> +
> +	clk_disable_unprepare(pi->clk_bus);
> +}
> +
> +static int
> +imx95_pixel_interleaver_bridge_attach(struct drm_bridge *bridge,
> +					     struct drm_encoder *encoder,
> +					     enum drm_bridge_attach_flags flags)
> +{
> +	struct imx95_pixel_interleaver_bridge *pi = bridge->driver_private;
> +
> +	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> +		dev_err(pi->dev, "do not support creating a drm_connector\n");
> +		return -EINVAL;
> +	}
> +
> +	return drm_bridge_attach(encoder, pi->next_bridge, bridge,
> +				 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> +}
> +
> +static void
> +imx95_pixel_interleaver_bridge_mode_set(struct drm_bridge *bridge,
> +					       const struct drm_display_mode *mode,
> +					       const struct drm_display_mode *adjusted_mode)
> +{
> +	struct imx95_pixel_interleaver_bridge *pi = bridge->driver_private;
> +
> +	imx95_pixel_interleaver_bridge_sw_reset(pi);
> +
> +	clk_prepare_enable(pi->clk_bus);
> +
> +	/* HSYNC and VSYNC are active low. Data Enable is active high */
> +	writel(HSYNC_POLARITY | VSYNC_POLARITY, pi->regs + CTRL);
> +
> +	/* Disable interrupts */
> +	writel(0, pi->regs + IE);
> +
> +	clk_disable_unprepare(pi->clk_bus);
> +}
> +
> +static void
> +imx95_pixel_interleaver_bridge_enable(struct drm_bridge *bridge)
> +{
> +	struct imx95_pixel_interleaver_bridge *pi = bridge->driver_private;
> +
> +	regmap_write(pi->regmap, PIXEL_INTERLEAVER_CTRL, 0);

Look like it can use standard reset interface

Frank
> +}
> +
> +static u32 *
> +imx95_pixel_interleaver_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> +							 struct drm_bridge_state *bridge_state,
> +							 struct drm_crtc_state *crtc_state,
> +							 struct drm_connector_state *conn_state,
> +							 u32 output_fmt,
> +							 unsigned int *num_input_fmts)
> +{
> +	u32 *input_fmts;
> +
> +	if (output_fmt != MEDIA_BUS_FMT_RGB888_1X24)
> +		return NULL;
> +
> +	*num_input_fmts = 1;
> +
> +	input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
> +	if (!input_fmts)
> +		return NULL;
> +
> +	input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
> +
> +	return input_fmts;
> +}
> +
> +static const struct drm_bridge_funcs imx95_pixel_interleaver_bridge_funcs = {
> +	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset		= drm_atomic_helper_bridge_reset,
> +	.attach			= imx95_pixel_interleaver_bridge_attach,
> +	.mode_set		= imx95_pixel_interleaver_bridge_mode_set,
> +	.enable			= imx95_pixel_interleaver_bridge_enable,
> +	.atomic_get_input_bus_fmts =
> +				imx95_pixel_interleaver_bridge_atomic_get_input_bus_fmts,
> +};
> +
> +static int imx95_pixel_interleaver_bridge_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *remote, *remote_port, *np = dev->of_node;
> +	struct imx95_pixel_interleaver_bridge *pi;
> +
> +	pi = devm_drm_bridge_alloc(dev, struct imx95_pixel_interleaver_bridge, bridge,
> +				   &imx95_pixel_interleaver_bridge_funcs);
> +	if (IS_ERR(pi))
> +		return PTR_ERR(pi);
> +
> +	pi->dev = dev;
> +	platform_set_drvdata(pdev, pi);
> +
> +	pi->regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(pi->regs))
> +		return PTR_ERR(pi->regs);
> +
> +	pi->regmap = syscon_regmap_lookup_by_phandle(np, "fsl,syscon");
> +	if (IS_ERR(pi->regmap))
> +		return dev_err_probe(dev, PTR_ERR(pi->regmap), "failed to get regmap\n");
> +
> +	pi->clk_bus = devm_clk_get(dev, NULL);
> +	if (IS_ERR(pi->clk_bus))
> +		return dev_err_probe(dev, PTR_ERR(pi->clk_bus), "failed to get clock\n");
> +
> +	pi->bridge.driver_private = pi;
> +	pi->bridge.of_node = np;
> +
> +	remote = of_graph_get_remote_node(np, 1, 0);
> +	if (!remote)
> +		return dev_err_probe(dev, -EINVAL, "no remote node for port@1 endpoint\n");
> +
> +	remote_port = of_graph_get_port_by_id(remote, 0);
> +	of_node_put(remote);
> +	if (!remote_port)
> +		return dev_err_probe(dev, -EINVAL, "no remote port\n");
> +
> +	pi->next_bridge = of_drm_find_bridge(remote_port);
> +	of_node_put(remote_port);
> +	if (!pi->next_bridge) {
> +		dev_err(dev, "failed to find next bridge for port@1 endpoint\n");
> +		return -EPROBE_DEFER;
> +	}
> +
> +	imx95_pixel_interleaver_bridge_sw_reset(pi);
> +
> +	drm_bridge_add(&pi->bridge);
> +
> +	return 0;
> +}
> +
> +static void imx95_pixel_interleaver_bridge_remove(struct platform_device *pdev)
> +{
> +	struct imx95_pixel_interleaver_bridge *pi = platform_get_drvdata(pdev);
> +
> +	drm_bridge_remove(&pi->bridge);
> +}
> +
> +static const struct of_device_id imx95_pixel_interleaver_bridge_dt_ids[] = {
> +	{ .compatible = "fsl,imx95-pixel-interleaver", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, imx95_pixel_interleaver_bridge_dt_ids);
> +
> +static struct platform_driver imx95_pixel_interleaver_bridge_driver = {
> +	.probe	= imx95_pixel_interleaver_bridge_probe,
> +	.remove	= imx95_pixel_interleaver_bridge_remove,
> +	.driver	= {
> +		.of_match_table = imx95_pixel_interleaver_bridge_dt_ids,
> +		.name = DRIVER_NAME,
> +	},
> +};
> +
> +module_platform_driver(imx95_pixel_interleaver_bridge_driver);
> +
> +MODULE_DESCRIPTION("i.MX95 display pixel interleaver bridge driver");
> +MODULE_AUTHOR("NXP Semiconductor");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:" DRIVER_NAME);

Drop it, see
https://lore.kernel.org/imx/daf6fb72-5849-49f7-b17a-818944eb9f1e@kernel.org/

> --
> 2.51.0
>
