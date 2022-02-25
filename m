Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B82DE4C3C22
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 04:06:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C379110E1EC;
	Fri, 25 Feb 2022 03:06:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2041.outbound.protection.outlook.com [40.107.22.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 777CD10E1EC
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 03:06:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TUelatWHVXNxpb5JfruYa0cbA6NP0LzZjy3M3mJ576ikqsX61/EKkVQCaWTQ8X6i/2JU2nXBjYPwqZ5nYu/ehyKHLYKCk6PpLEzJQU/Pe1n9G48IJn/FGoisF3UENvLuTCzxrlNPZXrg2NStDEozE+2CxJtm9KQl6/J+gakzkMaV3WEtFp/rVUGC8Or/WHmQsFA5uyaI/kFKk/SPGxaiMgz0OG/771CGVm88+a1FsCMQvWIcRYXHnV6HIn7khe19pj+Q8JeuijB2MbTV0AhpTMMNcLJpnIl5lBrdRwu76axu9N4+y2wtNjJJTasFlcFLPKOJIGvVk5SwbyZBEYM+UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZCEfvFO+yRM0HepZGQqSsGQ2KGooN9eHNczwr+naOXA=;
 b=Lv8gSk/6c7nTZkqqJxRmBM/UsqzIzbjUj4G3/ujFSa40iKx0cfBFduv3/zYSUTpTBylPJZgQsOh0AhP6VXnFW3Xgwfh7PUx8INC0tffMxkTmo22ICZDIPJWtlK4PhMchEfqQ/1UlJNXhJseEECd+2vGeYxhmxiLB93bOgFxoIWpl2rzPArT5ODVqPl/DRu0TDAQhRPelFql1YQQCCZX69oDT+9Y5RcANCOwbCjA/GonLjqwR+74xCT+Q/loxqAH8K/pkflWCjx8+6gdayW1Ci5qrGHRgpk2oIfxFR/G5HYwNOir3DUV/wYv35IyLvelo1a3SkoHiBh9h4SWxTTe2rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZCEfvFO+yRM0HepZGQqSsGQ2KGooN9eHNczwr+naOXA=;
 b=epOu4D6uowmTx11vXMid12H0gKO8jDOxeGkqeNiy1Fexns1BCLYZF/uXrfSVMYhbA1lv7EaQDYtXWft8r9IwCX44FJXbggqYBgTMzkovCDaVgeDs4nPk9qW5Y2MRCLGEzUkhwKcM2OYrq0dmhowoHBCfCuhHaCsb1Cko0m+DaYQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM6PR04MB4710.eurprd04.prod.outlook.com (2603:10a6:20b:3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Fri, 25 Feb
 2022 03:06:20 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::ddca:beb1:95b0:1ae1]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::ddca:beb1:95b0:1ae1%4]) with mapi id 15.20.5017.025; Fri, 25 Feb 2022
 03:06:19 +0000
Message-ID: <f6c4e3213bf102d0986bd90f41d61d2a7df8d495.camel@nxp.com>
Subject: Re: [PATCH] drm/imx: dw_hdmi-imx: Fix bailout in error cases of probe
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Date: Fri, 25 Feb 2022 11:06:21 +0800
In-Reply-To: <20220128091944.3831256-1-victor.liu@nxp.com>
References: <20220128091944.3831256-1-victor.liu@nxp.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0042.apcprd02.prod.outlook.com
 (2603:1096:4:196::19) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d007ef8-5342-4d9a-477c-08d9f80bcb8a
X-MS-TrafficTypeDiagnostic: AM6PR04MB4710:EE_
X-Microsoft-Antispam-PRVS: <AM6PR04MB4710FAAEB76892E5A1063F10983E9@AM6PR04MB4710.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9qepKMSvgjQZI2JyFGNabM1+p0X69DhVUmh6JVvEVAOj8FTSApnLubpCBBgbYgh7U708jNNy7t/1OZtd95JKruRRZbqSOvWA9go47hYszhU0IJx3hy02vsJ8aGkAgfaNZ57DrtTWTGPqT94bPj1ZiYLwzcHb22qquh6JjJ/OJIw7yTf38wyEp8LAf91PRcNaCOKc7wODkQt3g7+vYO/9NtmZ02lJRMKnnROxVRjeNNHugPSFDN80Ju32m1X8F1O/Rp+HGy5vj0xrE1OpB4h/HN4moF51bfTA06pgupaiolxURTImkHKLYprg0swhs50uu9+LH5Xs9W0BafuwT0ng1hPRKvW3wN33vVDvLMvOz7Cbbi29BTCzfh6cRQ6WAtgY7pi/yoreNriAHsQ/3XtBTAEhf3xYZhCO6KhWoeVmLlTVsgQlFVkSMI/wyeQnetR6SsytLDYfnGhEqH0fwU+kKpThk5GN1HQfbxcYDYHs/TkhfzPQjqfN5riKRd0aBa4bBrjKDQacnmWSjuXmUiDJf1RUI2GmkDDlVLtof+vCDoGTrUA8L4WQnuQJPZpxN67rFTXeJQJcROORwV0W4Tkpqn58pCi381fgMs7VS8eAydMAgAd8ekQmozEGu7IL3nqNyWNC5yWHt5jZTQOS+UkKtVkZI9xrH26lt+jFdiwRVp5lILGCG465khmctOsQxHFiTBvfKkh5nZrMaekuUWSVSA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38350700002)(86362001)(508600001)(8676002)(66946007)(66556008)(52116002)(2906002)(66476007)(4326008)(38100700002)(8936002)(54906003)(6506007)(7416002)(36756003)(186003)(5660300002)(316002)(6666004)(6512007)(83380400001)(2616005)(6486002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFg0ejhhK0c4bUloc2R2L3FzRVB4MFNmUzhCYWZCSmJNVjg1NkV4c2FmV3h3?=
 =?utf-8?B?ZllqR25EQllQNUtZN094U01ZOG5xWXh0MmhMMThVaUFZTi93b3Awbmc5NkZ2?=
 =?utf-8?B?TS9VcGM0WlB1M0NkbXJ6cHVIaGM0bzMzMkc2STRjSGplWnZSc2kvTFZaemhE?=
 =?utf-8?B?SFJ5VVhsYUpEOG9ZSGFSNTJhRFV4cGUwWVFuZERLb3pvamt2enI5aU1SeDNm?=
 =?utf-8?B?bGk3MDZrclVRL0ZWRGxIS0dvMERqTE5wT3g4b2RCdTA1QlhnQlA0dTZ1ZXZZ?=
 =?utf-8?B?cmRqd1VhaTR6eTB0MTBnZklKcnFYUk1wbnlsaEMvaGZaa1BINERBVDNPNHFV?=
 =?utf-8?B?eVkzaWUxS09DbHhnbzdPUDBXMXMrVzB4M0pvUmszcWxhaDJOMU5kUWNxVHps?=
 =?utf-8?B?UVVaZGFNSUU3THNGMW16dVNHMnIrREE1T1JjclBFTjVGRzdjZStNVzdqZXhp?=
 =?utf-8?B?bEN6cEw4RWlpMzViMXRXZlhGdy9JNzVpQnpKZXZEbnpKMFVxalNXTGNtNWdW?=
 =?utf-8?B?dUlQaEFOQk9VYjRpbG5qMUNKNjZaeDRDUUJ1U2lJeisxWWxiSTFKM3FaWHh6?=
 =?utf-8?B?eDJweFVhTHNqY3ZlVS9mVHN0U2FtRm8wbzVOWnE3YVFwUUNVMXBnRldzaGtk?=
 =?utf-8?B?NUZDS3dLN0o1MWs1eitMVnM2Um1ubXJ4L0lnVURCbFB6RDIxazc2enQ3YTR0?=
 =?utf-8?B?UGNpY2xCeC9GNGdQMEtYcWpXeGVzRUZBdnRLN1gzTSs2OWV4MUplTGlRWjVC?=
 =?utf-8?B?QUpEYU1GN0VNUEw3anV3UWNaYnY4NFBmcSsyREMwckVoNlJWS1d5UzR4VnIr?=
 =?utf-8?B?dTlPQzNkNnd0ZzBra1IvMjJTUGdRdVNXUWtSY2tXWUNyZld4WEFiSnlqVzZT?=
 =?utf-8?B?VXJGbkI0VC82SHAySDNJRnRZZ25ZVnNQbFVmOGIxQWU0STlSVGE4aHlCTXNo?=
 =?utf-8?B?SW1LYndKbkdVaDdxR1N0YjcxRlhoUk5WVzc0T2YyR0VhV2w3dGc4RUVVSTdP?=
 =?utf-8?B?MUNSWXlpSk1xWDlhUEdqSlRWUVBiK2pjSWhnU3puMFBVL1YxamZSb2ZYZjNa?=
 =?utf-8?B?eGpkU0xTM2h6SzFGVW1TUGVodzZyU016QU0wVUpkaTFmQUpPcmlBcHl2ZnMx?=
 =?utf-8?B?eEJ2dG9JYTJOT1lTNnJCZWo4WXZXclUzbVFnZzJuRmNjbFZsSXhZNlpRbSs0?=
 =?utf-8?B?aXVSNkg2N0QrRjk4Z3F3N3VFVnZYeWZKRUtaN2phdkJPWlJYL0w0SXBEaXY0?=
 =?utf-8?B?UFhTQlF6dXlyK3lYYkF5K290dXNuejQ1dTRGanBMT21PUEtzMUEyWW5wR3dY?=
 =?utf-8?B?UHRhOThETWVjc1phci9TUE9HZ0UxaTRhNGdtbnR5d1VHWmJ2OUs5TkJ6OFk2?=
 =?utf-8?B?Tk5pRmNIbyswTTI4U0NrRXVjaWZsNzV1Sm1KcW4vQWNoWU01TTV6MitSamt3?=
 =?utf-8?B?T0VIVnR3YWJzd3lxdzQ3TTNzbnlrZXNTU0R0eWVDeUtPamRaenNIRWlOVHBJ?=
 =?utf-8?B?UkQwRTJyKzU5c0tOaEVzc1BrV0R3MVVEQ1hycnl1bmF3T3Z1N2FhVXYyTXR2?=
 =?utf-8?B?TS8ya3E0NzVwZlZvRXdlOHJJeXB0UkZtKzlHK2JEakVKT3RGdzlZTWhyaXh5?=
 =?utf-8?B?WDQvUFlWSGN2T2l2cTlUOXpuQjgrVzJBNldNZGoxaHdSQ1hZRHE3RXl5eFps?=
 =?utf-8?B?N0w4c3l2MUVFRHpta1JCeFBqSEJQdy9pWXRFSXJmUG83aTRHT2l1OE1PbHI3?=
 =?utf-8?B?OTQ4Z0VITjhWYUlFeHd4ZzB2TXNyVEVDR2IzNEFvME1NSjE3YU5IRm83NFBr?=
 =?utf-8?B?SGMwY2FkVGFhYVRYL2RTelRlNWYxTG1BWEYrVXBDOWRnZ3NaRkgxeGxWNE04?=
 =?utf-8?B?SzZraEtmc3ppa3pkdGJXNlE0SWs5REl6UTNUZHdQeUQrT1dXNGx1UzFaTDJW?=
 =?utf-8?B?VVFycWd5Vjdsa2UrMG1od1o0NzliZWJaZGx3VmJ1bWxDMFN6cnU2cHpHT0cz?=
 =?utf-8?B?bTU3eFMxbjZQZm0yeUxudVBFSFJ3Tk9DdDU1eUpiVnhPYU5peHkyYzhXdFlY?=
 =?utf-8?B?TkFlay9KaVpEYjdBa2dUbmgvLzBVUlJoY1p6UVJqNk94N2szSkJSMnhZWGpE?=
 =?utf-8?B?d0k2RVlHQTJsNEpVUWNpR0ZpSkp3WFhCclp6L0lGRGxGT0lVeENzVndkWno2?=
 =?utf-8?Q?2g6HY9Z2/fklZO5QF7FTCko=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d007ef8-5342-4d9a-477c-08d9f80bcb8a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 03:06:19.5926 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tqdlJoSwG9DsKJmT9aTZq53y/BAaudSDEIOdbmaNZYfF4TiBN02tC3ZrWbttVbnYysqTiwfmuLJUptSh62AK0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4710
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
Cc: David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Philipp,

On Fri, 2022-01-28 at 17:19 +0800, Liu Ying wrote:
> In dw_hdmi_imx_probe(), if error happens after dw_hdmi_probe() returns
> successfully, dw_hdmi_remove() should be called where necessary as
> bailout.
> 
> Fixes: c805ec7eb210 ("drm/imx: dw_hdmi-imx: move initialization into probe")
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

Any comments?  Can you please pick this up?

Regards,
Liu Ying

> ---
>  drivers/gpu/drm/imx/dw_hdmi-imx.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/imx/dw_hdmi-imx.c b/drivers/gpu/drm/imx/dw_hdmi-imx.c
> index 87428fb23d9f..a2277a0d6d06 100644
> --- a/drivers/gpu/drm/imx/dw_hdmi-imx.c
> +++ b/drivers/gpu/drm/imx/dw_hdmi-imx.c
> @@ -222,6 +222,7 @@ static int dw_hdmi_imx_probe(struct platform_device *pdev)
>  	struct device_node *np = pdev->dev.of_node;
>  	const struct of_device_id *match = of_match_node(dw_hdmi_imx_dt_ids, np);
>  	struct imx_hdmi *hdmi;
> +	int ret;
>  
>  	hdmi = devm_kzalloc(&pdev->dev, sizeof(*hdmi), GFP_KERNEL);
>  	if (!hdmi)
> @@ -243,10 +244,15 @@ static int dw_hdmi_imx_probe(struct platform_device *pdev)
>  	hdmi->bridge = of_drm_find_bridge(np);
>  	if (!hdmi->bridge) {
>  		dev_err(hdmi->dev, "Unable to find bridge\n");
> +		dw_hdmi_remove(hdmi->hdmi);
>  		return -ENODEV;
>  	}
>  
> -	return component_add(&pdev->dev, &dw_hdmi_imx_ops);
> +	ret = component_add(&pdev->dev, &dw_hdmi_imx_ops);
> +	if (ret)
> +		dw_hdmi_remove(hdmi->hdmi);
> +
> +	return ret;
>  }
>  
>  static int dw_hdmi_imx_remove(struct platform_device *pdev)

