Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E759679213
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 08:35:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7D6D10E5E2;
	Tue, 24 Jan 2023 07:34:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2054.outbound.protection.outlook.com [40.107.21.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F1C10E5E2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 07:34:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PHtp84hWRJfAnCBIKneKLMpmySAL//sJ/GhNLPHanDR8ZAAIv3QaZPh4PPT27e9UFdCkaRcLOjg78B7zz26gYCX69/66kjWAt4PBv7+s5j98CAZxFyqQCEcKlIpe1ba0myTfoOpbASeA4IBjYazCw8thk3TM43pbjdcU2e4acNY34nhSumeOnSwFW2hF+cFcZehFGUS2c5lt/Cf4xkAUr6EitkJfzgj9lu+UjJrYo7h4eLgprpET1aWGTCYe6ysvBa0WvsNA0k1P1sPd9J2md2ZVR+sSHrb6MoxuwNYtIeKBjKjpXZNZvUg+87I2DZBKvaFf3wOeqD/OAcPBNpEqWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NQlZ4x+YjSCPA3xBPhBm6/hDBDnQuBIt5vtWgg3hI60=;
 b=WR3fsOYsjJe087xQq+gPXzRllNT44EsZ1cHdELVfTBuSchZHXJyHH4LsJv3sLFhfJAwpMQu6O143xTah/80GUrLb1tojauIwTmQbsvrvq/D/G5SUsUHv0M2ZsHfLPGfxFL9/tUA1EhY9m8PRF+Hr5VKQMe8/ZBTVCXY7w15ikaxvK32K1M0NGjpO6xbofeoRmDIoUjY6DbtZWJBmO13Z5YBkLi+8mqwqhb9RZDkexwQt5PFORWLudu5x6TT3bXGt4tyMOUsgK/nWh7J0hCPh81AOGEO4eXJpv2ncTp/hkjw06mQcPF4r08zvzYhOPfG+x1aalK+mtPAsz4x/EyFU3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NQlZ4x+YjSCPA3xBPhBm6/hDBDnQuBIt5vtWgg3hI60=;
 b=j/QIYji1kDtT7WUZGU4gOaZBsvLmSpe9uPsykecl7tzXowy5kxSeiP1yyYmt9j8Xpqz2A3ogW81BnvVlbvY3zk+R1eqw9SX6uRFXOzAEpAgXuRWkVoU+bTZ88rZ2OFSZwVpIzQl1f8UGaxN9YcUs4z9q7a2xJC6qTM87mHL8ggY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM0PR04MB7156.eurprd04.prod.outlook.com (2603:10a6:208:19b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 07:34:51 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc%7]) with mapi id 15.20.6002.028; Tue, 24 Jan 2023
 07:34:51 +0000
Message-ID: <7b8b2ebad62f2b29523e2930ff44e77c3b3a4d24.camel@nxp.com>
Subject: Re: [PATCH 2/2] drm: lcdif: Add i.MX93 LCDIF support
From: Liu Ying <victor.liu@nxp.com>
To: Lothar =?ISO-8859-1?Q?Wa=DFmann?= <LW@KARO-electronics.de>
Date: Tue, 24 Jan 2023 15:34:09 +0800
In-Reply-To: <20230123091307.46ace33f@karo-electronics.de>
References: <20230123072358.1060670-1-victor.liu@nxp.com>
 <20230123072358.1060670-3-victor.liu@nxp.com>
 <20230123091307.46ace33f@karo-electronics.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::10) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM0PR04MB7156:EE_
X-MS-Office365-Filtering-Correlation-Id: bb0240ac-4a55-44a9-05ac-08dafddd7a98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t32NSUqunha0i0tm65vhitmyrXpxO8vN83cGL3zw0rK3foqaxpc2ADJsaOTUfx9B4eS1yj0bbhfpuNbW2H7LWY0Q+v5qFqi+dl0Zw5fgSmBg+W88VPD/+xJCAPWmRzpki5VPCGkcdeQeuVzNO7vZ0QH43OSkgXnjpkuIIDgQst8EO1IbZBvBAw5j3LPQVjzN+e+whx8tEOXpMWA8LyjmRYqvO9aXXwDnzTsvRI/hvph31KkqOqgTmkGmHvdG136PtQgW6cjU8uEqCJyjt0MW+KbI6uMEznuTQFK/bwCkFZbvULYP5wOxVIGitXSJ3PAg6qzAcFRA8jzAKeSWcywDgHFgTfaSGu9b/Y3IhLYvDRK4E+GyhPa3dUvVQrIrpM7aReLc1kNdqw+RWSpMdTfjjQ1N5yLuI8WpoObCU/e4pyftb4JbG/PWN9RU5Encr+avle8q2f+tqqnYBrX5zZ9KwjrubIqxjXgPPqdjov1lDWIqTkB2qYHQuxwaOD4g3tjshrEdIbahptag+RL0F8sAZv2bspUuaReTRJ4jyEIP0NE7EckjPCdxtJPRwLn5yEeiciOsxMys+8yDVLlLSoSLS7jDzFrI1Be/AQ24PPuVlgePm3y432AdCqYT1dQCIu0asaxsG4mnqx1zbpiofSro8M46knvjcBHOoKmCcTFxohAL+OBbHDzuxg8iLY680r+OsxTWRMsJWS5y8fcQLCK/AHCsw6bpV58Xrbooh/nphVs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(346002)(376002)(39860400002)(136003)(451199015)(83380400001)(38350700002)(38100700002)(7416002)(41300700001)(86362001)(2906002)(5660300002)(8936002)(4326008)(8676002)(6512007)(26005)(6916009)(6506007)(186003)(316002)(6666004)(66476007)(66556008)(66574015)(2616005)(478600001)(52116002)(6486002)(66946007)(36756003)(99106002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1BVMTExVFphTmVKTXQrQStEa1NaUGRhNnV3NnUvRWhRNUhIQXRhMUZZSHZy?=
 =?utf-8?B?ZTRrb2RMRWY1aHlRMExnK0RZdU5kSHhKTFRlMndBaGtoMEIzbnNpTXNUd0Y4?=
 =?utf-8?B?bjhyNVBwb1hLTko0NGhua1ExelI0RU1XVjFhT1d0RE9BZnNCOFJJdnZSR2hw?=
 =?utf-8?B?bjJta09kcnhXVU1ab2Voc240VUx5eFZVOWRyQmVHWHNGSjBncCsyU0RjSWtL?=
 =?utf-8?B?NzBOemlqdXB4L1ZDVFExdXJMMHhQczA3UUN3a05tdk1PTnhmd1o4cldWdk9a?=
 =?utf-8?B?QWczdHovKzhuS2QwdXlYb3BmWUQzY0xuem52Q3plbHVkUnFBQTF1ZlQ3a0l1?=
 =?utf-8?B?ME1VNTN6eFJ3R2pwclJOajQ4SHhZVmFrY2FUWXZFZGxCTURyaUFpNlgxR216?=
 =?utf-8?B?ZC9LYStMQzl3MnVhU1lCN2tibmx1R0pBTCtyekJwY0w5c0ozQW1rRmtzNkxh?=
 =?utf-8?B?MzJRMnY2a2FSc1U4eGt4VkVCei9VcjBBOWxOU3ZaV2YyM2dLQ2xqUFQ0YmhB?=
 =?utf-8?B?UkthaUZRd3grS09SRm9CUGRjbnhCd0c1SDRub1BEQ05MRkxPV1hDWi9Ta2JT?=
 =?utf-8?B?U2JBYWVGVElaNTBXRUMxd2pGNWI2bUVtS1p3Z00zOG9SOFhPNkhBVnBHalNz?=
 =?utf-8?B?OUZkQ1lBRnBQcnA3dnVWb2YvUVkyRmMyemVYNDNWaTFHOHhGSnc2TXdtWU5t?=
 =?utf-8?B?ZGFXNUtzVUZFZEQ4WGxjZ1M1U2RlaVJLc2k4US9kdDdWWEh2MEcwN0poaTFV?=
 =?utf-8?B?N3RERTExdE9mOGtUaTdGUnUybnc2SVl5d3JoektNM2dPVjJKQmREeXFSWHI5?=
 =?utf-8?B?cFBnT0RtcW9UbkxKV0NuZ0FFNm94NWVLbTh5Mmc4SGJXdmdjVUtrV0syVERG?=
 =?utf-8?B?dmJ6VTZ5bjgyK01HNXdhWnl4NVpUWFVMWXY0QUpvWTRiaGhSTnNGY01wNlcy?=
 =?utf-8?B?bnp3VFI5OFZnYWNiZ1l1bmE0emswTWQvZCsrS3kzbHhSTUg4dWFwVW9kRW9h?=
 =?utf-8?B?UUNvV1NzakdrdjFLVm9VQ1M1ZDlmS0Q5MkJYTTBjcHdzZ2kxbkJLZjVrU0pX?=
 =?utf-8?B?SHNGZ1NZQXh3WHZ5TGNNOEVVTEFRMm02L0o3cXNOaDBHMmY2WW9RZVhUQTdT?=
 =?utf-8?B?WFFUWVVYRjhrZjMxWWY0VzhuYlJlUjVHZ0NsVER1MHdGcWF2NnVwZkN3NU1X?=
 =?utf-8?B?K1ZnU1BZbDdaNmNZL3FNaWIxNFVTRHFENW80MTU3SGVxZW81WjNZYmFpUUdo?=
 =?utf-8?B?T2FpNHRVZEJDNHNXMUhTa3RiZlkzN09ad21oVm9oL0ZLTUJYbkp5K3NLZU04?=
 =?utf-8?B?bURGZ2k2L3VFMkd0SEJVMlVwVkxWREFUekxpTHNOc1VoWC9Uc09hT1RwcVhL?=
 =?utf-8?B?Wk1XMXBzZFBkR2ZNWUdRQUZZTjAwem52UEtrMlgvOFFXZndhd2FreFlVbTR3?=
 =?utf-8?B?dnZGeE45Tk5xS3MxMEt3bVQ1dHUwaDZia1dsUHM3bUp4c0V6d0xwMElwVE5N?=
 =?utf-8?B?Zzdrb1BjcERUekFBV0NrYUdRNHRRMXpvV1RSQnZ5QnYxbFRPZnNNYnRCbG14?=
 =?utf-8?B?MmkyekUzZjJuWFczeVBjNkx1VisyRkJ3SitkNFl2OGdyaXAvNzFmY1Q2Q0dz?=
 =?utf-8?B?VzlVWXRaVVdteHFIRVN0NE5jYXRnVTdZeng0TDloZERrWFdCckc2ZTJNOURX?=
 =?utf-8?B?aFExd2lVQ0hPVmFGbzIxM2pKZXRkRDlrMFNyZjJNdXRHb1Vndk45bUpEVEZl?=
 =?utf-8?B?YVlvYUg1eWN0K09ab2FmSi9tRGJDa1hnQmswMGpFWEZVRm1CVUZyMVo0S0VL?=
 =?utf-8?B?VjA5b05PVjBYTkpXc1A0aXdGUGhoQktzeW8wRVV6MkszbTRzUWtiOWhUbWxB?=
 =?utf-8?B?SWpQOUdQYlVkUFpWRTJzMG52K3JaaEx2TVFHYnlDR0ZvVFdsWlhROHpXRC9t?=
 =?utf-8?B?TWRIZitHNVJ3Rm1taW5TL0pFdHpVZWVjMjMrQ2V5dFljVk5qVDM4SHFrVGhp?=
 =?utf-8?B?TDdTbm81SW9qRzU2a25CYUw2NUlqR1JWS2RsbTVTbDRSSGZiSXAwM2Q1U04y?=
 =?utf-8?B?WG1ZMEcyVm13N0ZzN3BDT3YxQ3NMKzExYW00bnNKMkpDeXlZVlJqejZwTENo?=
 =?utf-8?Q?YFSVRjf9GIrGjzrVMxbRn2kEq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb0240ac-4a55-44a9-05ac-08dafddd7a98
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 07:34:51.6478 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 876YozweO2eUizzeR1sTLORAOQX1CHPGsH8m2wV4vQDOaxGrt38/0yZyqCpL+qQ3MUGBt9soHCQTOlMqm2okmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7156
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
Cc: marex@denx.de, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2023-01-23 at 09:13 +0100, Lothar Waßmann wrote:
> Hi,

Hi,

> 
> On Mon, 23 Jan 2023 15:23:58 +0800 Liu Ying wrote:
> > The LCDIF embedded in i.MX93 SoC is essentially the same to those
> > in i.MX8mp SoC.  However, i.MX93 LCDIF may connect with MIPI DSI
> > controller through LCDIF cross line pattern(controlled by mediamix
> > blk-ctrl) or connect with LVDS display bridge(LDB) directly or a
> > parallel display(also through mediamix blk-ctrl), so add multiple
> > encoders(with DRM_MODE_ENCODER_NONE encoder type) support in the
> > LCDIF DRM driver and find a bridge to attach the relevant encoder's
> > chain when needed.  While at it, derive lcdif_crtc_state structure
> > from drm_crtc_state structure to introduce bus_format and bus_flags
> > states so that the next downstream bridges may use consistent bus
> > format and bus flags.
> > 
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> >  drivers/gpu/drm/mxsfb/lcdif_drv.c |  73 +++++++++--
> >  drivers/gpu/drm/mxsfb/lcdif_drv.h |   6 +-
> >  drivers/gpu/drm/mxsfb/lcdif_kms.c | 206 ++++++++++++++++++++----
> > ------
> >  3 files changed, 208 insertions(+), 77 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> > b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> > index cc2ceb301b96..4d41f6b6eb14 100644
> > --- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> > +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> > @@ -9,13 +9,16 @@
> >  #include <linux/dma-mapping.h>
> >  #include <linux/io.h>
> >  #include <linux/module.h>
> > +#include <linux/of.h>
> >  #include <linux/of_device.h>
> > +#include <linux/of_graph.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/pm_runtime.h>
> >  
> >  #include <drm/drm_atomic_helper.h>
> >  #include <drm/drm_bridge.h>
> >  #include <drm/drm_drv.h>
> > +#include <drm/drm_encoder.h>
> >  #include <drm/drm_fbdev_generic.h>
> >  #include <drm/drm_gem_dma_helper.h>
> >  #include <drm/drm_gem_framebuffer_helper.h>
> > @@ -38,21 +41,70 @@ static const struct
> > drm_mode_config_helper_funcs lcdif_mode_config_helpers = {
> >  	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
> >  };
> >  
> > +static const struct drm_encoder_funcs lcdif_encoder_funcs = {
> > +	.destroy = drm_encoder_cleanup,
> > +};
> > +
> >  static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
> >  {
> > -	struct drm_device *drm = lcdif->drm;
> > +	struct device *dev = lcdif->drm->dev;
> > +	struct device_node *ep;
> >  	struct drm_bridge *bridge;
> >  	int ret;
> >  
> > -	bridge = devm_drm_of_get_bridge(drm->dev, drm->dev->of_node, 0,
> > 0);
> > -	if (IS_ERR(bridge))
> > -		return PTR_ERR(bridge);
> > -
> > -	ret = drm_bridge_attach(&lcdif->encoder, bridge, NULL, 0);
> > -	if (ret)
> > -		return dev_err_probe(drm->dev, ret, "Failed to attach
> > bridge\n");
> > -
> > -	lcdif->bridge = bridge;
> > +	for_each_endpoint_of_node(dev->of_node, ep) {
> > +		struct device_node *remote;
> > +		struct of_endpoint of_ep;
> > +		struct drm_encoder *encoder;
> > +
> > +		remote = of_graph_get_remote_port_parent(ep);
> > +		if (!remote || !of_device_is_available(remote)) {
> 
> '!remote ||' is redundant, since of_device_is_available already
> checks
> for a NULL pointer.

of_device_is_available() does check for a NULL pointer when it calls
__of_device_is_available() (after it takes devtree_lock raw spinlock
and then releases devtree_lock).  So, if remote is NULL, '!remote ||'
exits the if clause a bit earlier without calling
of_device_is_available() to take/release devtree_lock, which means a
little bit better performance.  But, people may say that the
performance gain is trivial. drm_of_component_probe() in drm_of.c also 
checks '!remote' before checking '!of_device_is_available(remote)'. Do
you still think that both drm_of_component_probe() and
lcdif_attach_bridge() should drop '!remote ||'?

> 
> [...]
> 
> > diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > index 262bc43b1079..ba36447ed900 100644
> > --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> 
> [...]
> > @@ -529,6 +580,46 @@ static void lcdif_crtc_atomic_disable(struct
> > drm_crtc *crtc,
> >  	pm_runtime_put_sync(drm->dev);
> >  }
> >  
> > +static void lcdif_crtc_reset(struct drm_crtc *crtc)
> > +{
> > +	struct lcdif_crtc_state *state;
> > +
> > +	if (crtc->state)
> > +		__drm_atomic_helper_crtc_destroy_state(crtc->state);
> > +
> > +	kfree(to_lcdif_crtc_state(crtc->state));
> > 
> 
> If crtc-state can be NULL at this point, this will only work as long
> as
> 'base' is the first member of the lcdif_crtc_state struct (which
> currently is the case, but there is no guarantee that this will
> always
> be this way), otherwise the if clause above is not needed.

crtc->state can be NULL when e.g. at driver load time, like kerneldoc
for drm_atomic_helper_crtc_reset() mentions.  I may add a comment for
the 'base' member to note that it should be always the first member of
the lcdif_crtc_state structure.  Do you think that will be ok?

Thanks,
Liu Ying

> 
> 
> 
> Lothar Waßmann

