Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E45FA519885
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 09:46:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8D7410EDE9;
	Wed,  4 May 2022 07:45:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80043.outbound.protection.outlook.com [40.107.8.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A0A9112040
 for <dri-devel@lists.freedesktop.org>; Tue,  3 May 2022 15:23:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EXXmu72Yuaikn7skLoR4VBCOVdcUL9RohNuiprNpGLiS5JluItQyvxvRnm9y+Hgr9j+2S0h5fz5hWiudzSxQ+0Z/SpF+yGLrbzCZ9tC2+KHxhw716jifMtjKo1RTxC26v8FGlXKKBmTFxlp2IVSiIqFpIJcbwvLrzJhNeJkbNQzpH6dlaBVOmczBeUdu8vuhJZRJpqlhD+nsPrCaXlarqLeWnOt54Z9RZCbepKko5BrP4PtLkBl1z6y4wpIOwNRMgFJlSfm7Nt0d3ig7cmopCAi6Oi1ItxOhgPE7ZpnfItX7psYJdIt79QOQZxbE3+choB0yPLJan6xjs0G7M+WXKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HUguABPNYAJI/VdVJbafwtKJ4TL4HC5mvaQ4UMGlEOw=;
 b=ZeGp67aSVQC7lG9gbBcmhAPbOwX59o4Zk53KpfdG69xnghzHvdkLBDcSfzpMvCmqieeBJ/uny1MhIFZ/etU5dz+ar3B9FSTRXgsCbhWQdoHMQL+78aoet/AlOA3L3N1HDyGf+MaC7ecc+LtSOMhS5cOoq+feMRlrzoNYBVnrotgLXGPyycbeXng7gwifMNpm8mcD06S+SBetLzHmXcOl9Hd2VXx9cBTeXgKGtOdTbPrqvKQLCSqfYMFakVGtQfcRxstymG99+wGESkkcGe6HtY+xmTSL5HfhWja1lXbGm2mN5upeyWUU6Clk4erRfBoqc7e3OnI/Z4UY3fsaEvt0Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HUguABPNYAJI/VdVJbafwtKJ4TL4HC5mvaQ4UMGlEOw=;
 b=Kl7RepRmaGxqHVUJEmARK7ol2EVn+uBq7o1OYs8G5SRIF70n4xwOe6dffu4YTLSWjJwyQGUFnQmJodUHylejy/MMoS05v/1Zs3KxRNggCfa9y55y6oTFvyaSKiT2PUPUvfWGlbQ70LblMC2UACOkZ0xIm3ltJijCLS5EIJ0GPK4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by AM6PR04MB4006.eurprd04.prod.outlook.com (2603:10a6:209:3f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Tue, 3 May
 2022 15:23:23 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::28d3:b4fa:2319:83fb]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::28d3:b4fa:2319:83fb%5]) with mapi id 15.20.5206.024; Tue, 3 May 2022
 15:23:23 +0000
Message-ID: <7091bd70-d7d1-8e88-d0d9-22ec944ff9df@theobroma-systems.com>
Date: Tue, 3 May 2022 17:23:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/3] drm/panel: ltk050h3146w: add
 mipi_dsi_device.mode_flags to of_match_data
Content-Language: en-US
References: <20220131164723.714836-1-quentin.schulz@theobroma-systems.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220131164723.714836-1-quentin.schulz@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0137.eurprd06.prod.outlook.com
 (2603:10a6:20b:467::29) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 755a7280-1f5f-4287-3aaf-08da2d18dcce
X-MS-TrafficTypeDiagnostic: AM6PR04MB4006:EE_
X-Microsoft-Antispam-PRVS: <AM6PR04MB400669D872C79854995943D4C2C09@AM6PR04MB4006.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5xUl/N/cocd0sS7Wqy43JXdJ0zO12hfHcCRZHFe4vJzGkcSuf4gI9B0TvfgJI7VTMIc1XzlKUWg5yy3icnAKe0m5tzVh5+dpNUyJULbFFQtLv/eGn5yiNeAWglIT6Jg+nzsh6e4/FYOsbyQcJAEh2E3MTmug74FivQtbQqGO49CFakPrLZwTXGPgv1Of6bo1inTE68jK8reTF25NNEU7MN+naolvRsSC58ST1uJvvCeBPX0jqFZxsEpyrT5I0/d13pP7wcA17VEzYjsTzHxV2ddX9mxGunZ70tj+j4afk8c7blq/KKJdT3DWERCMi0jBpXkEfMHIKE4+edCftiyIRgpelcAZSIUDmrIbaqNWuTpTFjNe6sdERVUIBvgkwXsGNGjM18ZKbqZ1nICRlxrmLVYHbyMD10hO6AnK5uNyUM7I23tGzqf8HK+ExqERoQaUn88+sAhhafVkL+iRXSq8Axy6d3HlbtDxZeRAXqNO+qdDMcc0BfENibB+YtohhV2g73M44ZnyJZa0h9y/xjAHuPxBR7f0DaFrjKS6j4KT0y5sXhiuEmMCbBayEi5wC8PqpqHFhefuy5+QP//Vj4Ul5YTWgC0rAqjsBSiehMUkaM4yg+HCKtU0CGePQrOBksdkyFreEDH1pddrEcFaw2TW5PrDmbf/QPWi9DZnu/+1QeVqzIwbxkIWHR2sMdFU7HJpL8YYdRRkbnaMu8jNNpHnzL/b6ufgC3unk3KSaTHxk44=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB9367.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(186003)(316002)(6486002)(2906002)(86362001)(53546011)(6506007)(44832011)(508600001)(6512007)(26005)(38100700002)(109986005)(8676002)(8936002)(4326008)(2616005)(66556008)(66946007)(66476007)(83380400001)(31686004)(31696002)(5660300002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnlBYVhTQndVSnplSDBEOWJwT3dtVGI4Mm9nQlhHWjNhbDRSNzFKT2JXMGpv?=
 =?utf-8?B?WkRtRmN0ekRMV0FYZGpjcUIrQTNIMVk5c2JGNXhtV3Znamk3OGJLelpOTUF1?=
 =?utf-8?B?cUQ2WkN6enMrYjBOU1d5TktlU2dNS1Ftamg3MmtkNXRjbmRDRk1sSEFGanh6?=
 =?utf-8?B?eHNiOFZFdWRTUHJoV0JXbzFtb3JyWTJKMVluRDZoc0ZqVldkNGZrNmhvclVm?=
 =?utf-8?B?TDNKYkRFTDJRSm1nSzJTdTRERjdvRzMyTTc3dXBCWWZybXQrL3FZcGw1KzNR?=
 =?utf-8?B?eDFqVnRubGc1U2J1amJlRzB2NWkrcTR5Wmgrdysxa25EQ0lBRlFIYmxXMHNE?=
 =?utf-8?B?cTlBWmtocTVpY0RyKzdwZkhjOFd3MVA0RFJlSlZJaDluamNLTlB4TWVwbUxk?=
 =?utf-8?B?OWhmb0hjU1ZsY3FkeW8vOHBHVU40cjhpSnc3QmgveXhROXlHcUJUWnVBYTlr?=
 =?utf-8?B?UHNVbHBaTXVrWUpJUFh0ZFlacjdLL3FaYXlHOW1IZCtkbnE4cllIM3d2WjVv?=
 =?utf-8?B?WXN2UG9XaHAwOE9SUHJSN1I1RDB6RWV2VmtPM1ZlaFlmaHdQQVVoaEY3aUp0?=
 =?utf-8?B?cjBvVlhKd1FmV3VRSDFkL0I4Z08ybnNJWUFOTUk1bkZIZWNIeXFSa0NncE1l?=
 =?utf-8?B?azJjOW9ZMkxPMTdETXc0MnJKV3lTYXRKVytrNEVsMG5VN2pFdE56eDNmZVVt?=
 =?utf-8?B?T3B6UksxOTYrYUR3MXhBTGpRL3NNYjJ6SEE1YjloOW1rdFpPRXZHMGhPb1JX?=
 =?utf-8?B?N29IUFNzWGhnTUpKYnMyT21FRVlIbGwvUzFqVTJFbUV5bDNwOVFkdjBPZFBr?=
 =?utf-8?B?U3BSdXRpM2JnSUVzVUUyQzV4VjhRQXM0SmZqSThvOWhFWWkvK2NXVUdxK1JJ?=
 =?utf-8?B?amRRU1BmcFVqMDRsZTlJUERjZXgzMkNteGpvMytjcHlhYUU2Z0ZITThqN1J0?=
 =?utf-8?B?Zkpma0ZlTGl5QjZqanJxR01ReHJvVk51WDhqZUIva3M3eVl0VDBSSTRVSE05?=
 =?utf-8?B?Q1BRZndkcnR6OVhST0lUT2xyZ01ON2ZOZG1GRVo3eU9OKzY3bHBwM2w4QVFS?=
 =?utf-8?B?VWlqVHlBU09nb01vT3JyTFUzcG90L1k0Tk92dW1DRnpQTFRhSzFQcGJwWW9z?=
 =?utf-8?B?ZjB6SkM2UFVjU1hSNnFVa0I1SDU3d1A3ZGVKNXhsUEJqdTVlbGI0OHFmTVZX?=
 =?utf-8?B?YzZSTUl4M2tBVWo2bnBHQUpSSmZxZ01pTm1UQ1RmeFhiaC9MSW01UXVSUzFk?=
 =?utf-8?B?Wkl6Q3J3dnluMzh5Y0FGaFlKa3NhTjBkMUY4bHA1bUFzYW90VzRMaTV3a0VC?=
 =?utf-8?B?M0QwVElNTDRFM1p1YW9KUjc3NWhYM3ZIWXE0MGRtVHFZU0NNTDVKMWsrbmVB?=
 =?utf-8?B?Z1U3bnpjZldGTkM2RnRBZndmcVppMUpKNmhpa21UelIvS3NKb0o2VzdDM3RZ?=
 =?utf-8?B?RkdyWFp1Z1ZNRE9yYmNJNUlzeEhWUjU5K3c1OHlZT3ozOGgwQUJZSFRzNGFn?=
 =?utf-8?B?TEUwdVgzd1pjV1E1MDRtWS9RQy9XcVhhRVF5Z2loVG1YbmhwcndXNXI4QS9S?=
 =?utf-8?B?U2RmQ0tBMFlPNm9LREtBczMrL1A4QmwycEw2M0dxZ0dkSmZlTUh4Yi9objhP?=
 =?utf-8?B?SUlKMG9Ebk9NRVpRMXpTcDZHd2FvQnlabDRzRG8wcDVwSFk4eU1pVkV1OUxs?=
 =?utf-8?B?QUlxTWxjS1NEZ3ZZRGhnQlcwbUplZHMra0RsNDg1TEdMTTlOeks3TzZnaFdV?=
 =?utf-8?B?dWNjVWpNb3pFdFNPcDg1L0EvVWZJUzlFSi9TV3dyMnVGbUxoUkI4aVZqOTA5?=
 =?utf-8?B?YW9MbW5ETWROWWJWQnBtZFozZWZhZDBqM2REN1RieXNqcmhmd2UyaU9Pbmho?=
 =?utf-8?B?MzNKbnc1TEVqVFo3VXJTbVdXTjBJdnRyMytUZW9tS1ZnMHREQnJ6c3gvUnpX?=
 =?utf-8?B?WXFhTThMeisvdDQzVTA3aVZ1THNSSTBpYUhPZUE1aEppWHo3TmY5bG1FSmdi?=
 =?utf-8?B?ZGx0ZEwvOGVoRW1GbkFKV0NmOTBGWGVNTUJyWEMwRmJFWFVDaE1Cdk9VWXAv?=
 =?utf-8?B?R1hHT1g4eFlhOWJDdkpyMXdhNmIrdnZuOE05YjRWeXVBYjBxRksyVHExaHBM?=
 =?utf-8?B?WXJmTjRQaUxjTm5DZW0rYnBDbmRnOVZDWnNQd3pDUHYyUDZLMHdLL0FoaG9C?=
 =?utf-8?B?WGhwRnk1V1NUbnJaQ0FXQStLaFpnTzNtVzZreUxOSVFrY0xZZzAzczd5ZUR0?=
 =?utf-8?B?dU43ZUZrUy9yMmFMaVNrWUQrdGQ1ZDhvNTdKZnd6YlZRTThUbXJXaFRJTGNS?=
 =?utf-8?B?dGhTT2xzNWRzcEN3WE50aWE2Q1BTT084RGx4a1ZlU01pU08xMDNQblBNS1Jw?=
 =?utf-8?Q?hLjVtjj7P0/Z5AgghJO3odN+D1B3PS0FjkdNV?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 755a7280-1f5f-4287-3aaf-08da2d18dcce
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 15:23:23.5501 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q+db7K6Uu8qGyaIVvGB1rTPjvRl5r+iJT1Fb7yjmtdzTfcWXc1kizdVHzCB0G7aZcnlWYQdrE5tA7j7iF9iatVQTLy3GmVdv2Ij38cmhlsLqPszHc0oZKrVtsExPScF6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4006
X-Mailman-Approved-At: Wed, 04 May 2022 07:45:57 +0000
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Quentin Schulz <foss+kernel@0leil.net>,
 robh+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

Seems I'm not the only one who forgot about this patch series, so, 
kindly pinging :)

Thanks!
Quentin

On 1/31/22 17:47, quentin.schulz@theobroma-systems.com wrote:
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> 
> To prepare for a new display to be supported by this driver which has a
> slightly different set of DSI mode related flags, let's move the
> currently hardcoded mode flags to the .data field of of_device_id
> structure.
> 
> Cc: Quentin Schulz <foss+kernel@0leil.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> ---
>   drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
> index a5a414920430..67eb474e28c6 100644
> --- a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
> +++ b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
> @@ -25,6 +25,7 @@ struct ltk050h3146w_cmd {
>   
>   struct ltk050h3146w;
>   struct ltk050h3146w_desc {
> +	const unsigned long mode_flags;
>   	const struct drm_display_mode *mode;
>   	int (*init)(struct ltk050h3146w *ctx);
>   };
> @@ -339,6 +340,8 @@ static const struct drm_display_mode ltk050h3146w_mode = {
>   static const struct ltk050h3146w_desc ltk050h3146w_data = {
>   	.mode = &ltk050h3146w_mode,
>   	.init = ltk050h3146w_init_sequence,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> +		MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET,
>   };
>   
>   static int ltk050h3146w_a2_select_page(struct ltk050h3146w *ctx, int page)
> @@ -433,6 +436,8 @@ static const struct drm_display_mode ltk050h3146w_a2_mode = {
>   static const struct ltk050h3146w_desc ltk050h3146w_a2_data = {
>   	.mode = &ltk050h3146w_a2_mode,
>   	.init = ltk050h3146w_a2_init_sequence,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> +		MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET,
>   };
>   
>   static int ltk050h3146w_unprepare(struct drm_panel *panel)
> @@ -592,8 +597,7 @@ static int ltk050h3146w_probe(struct mipi_dsi_device *dsi)
>   
>   	dsi->lanes = 4;
>   	dsi->format = MIPI_DSI_FMT_RGB888;
> -	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> -			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET;
> +	dsi->mode_flags = ctx->panel_desc->mode_flags;
>   
>   	drm_panel_init(&ctx->panel, &dsi->dev, &ltk050h3146w_funcs,
>   		       DRM_MODE_CONNECTOR_DSI);
