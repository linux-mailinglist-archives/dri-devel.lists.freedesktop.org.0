Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 984424DD709
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 10:25:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 370FB10E0B6;
	Fri, 18 Mar 2022 09:25:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50079.outbound.protection.outlook.com [40.107.5.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A59610E0B6
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 09:25:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U3DNUTFmkx6KA+L/6elSUndAcEmfZURRQG3vcAIVI5Ic+oqcIJcxW7cv66+1SGU2nKxV/WT902kWcdo2KoriL9tnh43R3Up5Z2BfUH4sV7QYT2p16Dy1Zn0ErT62JRUi4KaEdCTzbJqiqrG32j9RZxL5ElKmGl4ZYXvTDiiA8+Ld0QdVQYBPBeB32d0SxKDhIxwcK724WxZgCk3RONU40WqcyT3rcmSDO1Clt18AN9Q/WtKrM1HOD26jg0zD4qaPgZyg96E7E5LEMBit6YBvr9WDR5HFpLfEXWovOb0bhfexeA1Al0WNdkkt1iV6JZyF+voaECx/RS0gR4/qSsSO0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1fVObxlB+VrJpVwemhItO0oMklaa5RLe6ab7u24PocY=;
 b=GxNhcBhxxsZoRZg+XwXb0tIk7OByR5nnGIMR3lq4kpMNmtN3rU9Opl0IDT8jOxXjzGrokyK9zJmCQsLKaxst2D+GZt9gd4nDQtABmqhLkplNQ50KUQZalnrblfJ6iaB4p01DWAGbCCz1L/36Xui+jh4eFysgnEI1gn+ZEdWL6p3hCJzjAShA2zZ77J5L9jvvTOME/GaWpRojYKwWabdo3M1whUT0bXPSy6Rtrsd1m3wCXH8kAC6jAa95BVMFivwXs9NOZSYrhG9Kw+/TdCv6Obi4sFK7otSExqn6vpSNcyavTB+pzWcn8Du/Mv32i/qMnHuc8KH4aipqEu47nGZnVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1fVObxlB+VrJpVwemhItO0oMklaa5RLe6ab7u24PocY=;
 b=JQLH2I0TeXCEgYPJ2/vWaV7X5+Ou3B+THRg1OArkD/9dcY0MbkB6m7nr1EOnzr/xlZ5/+N79MSSh553wdWusbyiiH11WQjS0t1ovL9LsdTNC4WlW1hcRwj8ERtfdyv8vgzcin1lQX4Dr7GZ3aFNPR3Ql/ExAs9pkUozRkDsFD4c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB7710.eurprd04.prod.outlook.com (2603:10a6:102:e6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.18; Fri, 18 Mar
 2022 09:25:32 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387%9]) with mapi id 15.20.5081.018; Fri, 18 Mar 2022
 09:25:32 +0000
Message-ID: <4bd97d512e95845d7dd5a44d7713c59832676ada.camel@oss.nxp.com>
Subject: Re: [PATCH v2] drm/bridge: nwl-dsi: switch to devm_drm_of_get_bridge
From: Liu Ying <victor.liu@oss.nxp.com>
To: =?ISO-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Date: Fri, 18 Mar 2022 17:24:45 +0800
In-Reply-To: <20220317175852.799432-1-jose.exposito89@gmail.com>
References: <20220317175852.799432-1-jose.exposito89@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HK0PR01CA0066.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::30) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee3abe2e-5c91-492d-666a-08da08c13fd7
X-MS-TrafficTypeDiagnostic: PA4PR04MB7710:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <PA4PR04MB771096753ABC299D91E13DC0D9139@PA4PR04MB7710.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EESW8RL4+e3nlgjfSCZCvBPPIEYsyiCTbwU1oVhtPjZWnP3MuIlJXVN+Caigdo603K6Y8+1xN006/i4on++l28OM05GY0vdcnlGjmeaq3HuRj6xdTBp7H21WJ/j+oc2Q8qOLBsEzbH2XUI7s1rEn1YkLMjwgZ8tmJ+2+x9bRclbLaJzio/bYktdEWFdzkt6nhON+OEBve+IbTnSBXFErzRZybjdFQ3wI07YEyA9XZ+pH57KmSylfVwTu3Pda4TA6UHM4dqOvbNoSgHTD39d9F3pjAC5xzHRfCo+qvSQZ7+xCU5iXlrSqr3ly+X/ciIQdg1j/Jmi+UAH8kUjAz+zle1oK76svo03CLJzJjnY1vXHUSMmS5oIuOar88TTgL1qwpWrQ0rxsKFD+6F+nay848htCbJIq+wiPG9fQd/JEvpxuYCMA3P7xovdBzpewLfw2zGKtNbnwBojd1kiGrTWUhMmYAng/uGqlMAEftuhdGqEcgNKrSTDl148JVmZIml2NBUkJjo9NlbjlRSXQtlmU21ajIP99vOBzRtP1YSFFhh/G8FffJVmWafgbnn03/GRGA2CMpIMAjhKKEylErUuXwa74vyl2cVRStjJ6JLmeeovuoH5/V2so4JAVGfCUGmA4u2zcgP9x7s870vNLhV4hxVpTywyM27FwmaX+GGeD4ChJOcS7hqNNiXzGEshUiNSi0o+K1VHqK/HoV0UQgeBVnVmBqJmoPUpw/LhVqkGXqNoqWoG15AUUQkGcEjSBTA+xwVdi3Qm8R0pqCX98sjEy+iTeCih4ha5V7hhcO1UHYCY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(7416002)(86362001)(6486002)(508600001)(8936002)(66946007)(83380400001)(316002)(6916009)(66476007)(2906002)(66556008)(8676002)(38350700002)(38100700002)(52116002)(6666004)(4326008)(6512007)(6506007)(186003)(26005)(5660300002)(2616005)(99106002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVRxdTQxVzY3OTVtM3NoUGZLRWpxaWhFZDBrN2JxNk9IVEJmbzRvbXZXOHhh?=
 =?utf-8?B?WjM2NG55OVh4SGRnM211U2ZjSTN4SXZ5RlJmdTlDTC9RQmhidzJwOW5xUTJw?=
 =?utf-8?B?NUxGRVJmSHg5eFN0amsrSXlRU0xOSzQ5VHUxN08yYUxsQzNnTkJRMThkakJh?=
 =?utf-8?B?R21XUFhFM2lvRThzUncxVGJ3bmc0MU81RXozTWFiM2hNNVJUYkxaUVlLN3B2?=
 =?utf-8?B?QVVyRmw5ajdRSTR2TEtaWnJuTkhhR1kwL3RWZjlEYkN4Nm1DMTFYTUR6S1pi?=
 =?utf-8?B?UWFyUm9TUGNoOTUrZW5GRTc5dEZieEJteTZqd3loSmowRjVwdTdOck1xbmQz?=
 =?utf-8?B?UnlySFkyV1RpWkRiT0RIbWtkajhQZG1qZndmQnI2OHhNVzVoY0dUakVrM0o2?=
 =?utf-8?B?d2JuT1JXN2k3Zmh4MXNya3dMcHgzWUg1S3hjejc4eTcrUkYwaHFlblNsME1j?=
 =?utf-8?B?V3FCUEtEcHNtMlRXdmZ4SGR6cWppcWc2RktwY09GWEJNNTBBSndXWmZMSStq?=
 =?utf-8?B?TFlNaFpiUmxSdWcrT0pra0MzRVZKRUg0MnhPWkVNMk5LY3dQZ25sRHliMEhH?=
 =?utf-8?B?dERxK2N5TUhOcVhQTTFVL1U5RVhXSVRPTWlYTVR2MVAzTXpiNE5UVXR3c0Q2?=
 =?utf-8?B?Y3hTa2pwZDhpNS9DZVZBTjQzQU9jaUFDaDJNbzkwKzVYWW9nK0VVNFloR2ho?=
 =?utf-8?B?b2RiZENKQWF4Sk1Ma1g2QnllRjFzeEEycERMc1NNZXIwb1I5eVVMOEZtanVh?=
 =?utf-8?B?aGU3bytNRkJ4WVFLUG41dXNYemJudVRwNU10WkVzUmNzdVRxY0VKbHJJdVo5?=
 =?utf-8?B?Zm5CTW1HUEM0cUoybFRUVzY3QmcrWGcwdGsxakN3ZmhuVHIrZXY0MjEzVmNQ?=
 =?utf-8?B?cmZBMW1RQnJRQWVESGovRTdNa0loNWtMeUFINThBWFlLMituZkhuS2lzaVFS?=
 =?utf-8?B?UFpCeGU1ZU5mTTQ3bTNYZkhBc0MxUThYTGNiOERoN282QnNhUEtmQ0pjcVZP?=
 =?utf-8?B?UkFTUXNxaDJ5SlMyYmlSd0Q1QmRCMTRPaGNTK3VOYS9QT01KQ1NJVnhRZEQr?=
 =?utf-8?B?aVRqMXhOQ0NqWjNYdFVEMXFBQlZnUjBxZDJnRFFkTW14SXZqeGZadktXV3Fl?=
 =?utf-8?B?aUZSZ2JIL2h6U0pyU1Zpa2ZNNTlydFM1TURFNkwxM2U5Q0V2QjRNUWRBNDVT?=
 =?utf-8?B?R2dDeWZia2ZMZXZkVUxrZzlFdVAxblh0ZHBXb3VCZ3FKS0pnVStkU1lDM0c1?=
 =?utf-8?B?c2ErRjBtRDNKNXlhNXpOK2xuN2R3NVVVak9VOTNBY2hkaVlLMXVCbEZpSVFB?=
 =?utf-8?B?VEZkazVDUVF3cGNMa2Jqb1hCMlhPZEhsWmRGekt1cDR6ei9IMXVEZ1JvcnJK?=
 =?utf-8?B?WHBKMWN6LzNlOVNWSnllVEdHQVRDOC9mL3FZNVRYTitPOVIxdnU4ZGd5ZmRp?=
 =?utf-8?B?eHUyRzlZeTVGY0t3aGE2T3YrNGlzVXlmVmV2b2xrMHlIMk9LdUNxbGVqVzky?=
 =?utf-8?B?aDF0WGJWY2h2eUFtRUM3aWMxdEpjVE8zZEg0S2VhajJ5OWN3TjUwVGN4RjUv?=
 =?utf-8?B?bDVIby9hMWd6VWtvek1UU1RTTGJIWUlJWlJ6YTdnVG1YVnE4MVBQa0s5QWNO?=
 =?utf-8?B?alNKZVVGVVJVLzJnZWtmVXF0QklpWDhkTjhzdmE3QUNUOG10Q0FIVzRjdEFa?=
 =?utf-8?B?aEV1UlZob3NPZEFaSzRxdDlOZE5HNFU2MkdhdE9xZENTNHNRL2tFWkFOS29m?=
 =?utf-8?B?WTFqRC9Pait0VDZQN3gwbTlLRG9oQVpQUHdGQzZNZ3RLMkt6d3ZtR1JXS1dD?=
 =?utf-8?B?WWVWWFhsQ1h2ak96QVdpaE51OEZJamlFUHhLUHRaRnUzRkNiekVzeU5vcmps?=
 =?utf-8?B?VGZGcit0ZGRtNlFCMUF6WVVCTmtDVVdpVUVValRaR1JMM3V0OFdQcDJ2R0hi?=
 =?utf-8?B?S0trTkthWG5VUmpmaFloQkF2V3R3dHNoazFUV0JqMW0rSXA4MmVsM2V6VGxk?=
 =?utf-8?B?MlJ5UEJFanN3PT0=?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee3abe2e-5c91-492d-666a-08da08c13fd7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2022 09:25:32.5243 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EtzzuLC90JbI8H4omsWeoat/IrJgSq4SKwg3JiikiyQaQi3Nse6b5tnjQn8Bh3NaXsaiYOZd8MHm+3cz4J0ubA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7710
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
Cc: jonas@kwiboo.se, airlied@linux.ie, robert.foss@linaro.org,
 dri-devel@lists.freedesktop.org, narmstrong@baylibre.com,
 linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2022-03-17 at 18:58 +0100, José Expósito wrote:
> The function "drm_of_find_panel_or_bridge" has been deprecated in
> favor of "devm_drm_of_get_bridge".
> 
> Switch to the new function and reduce boilerplate.
> 
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> 
> ---
> 
> v2: (Thanks to Liu Ying)
> 
>  - Rebase on top of drm-misc-next
>  - Remove drm_of_panel_bridge_remove
> ---
>  drivers/gpu/drm/bridge/nwl-dsi.c | 23 ++++-------------------
>  1 file changed, 4 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c
> b/drivers/gpu/drm/bridge/nwl-dsi.c
> index e34fb09b90b9..de62e3fc6a59 100644
> --- a/drivers/gpu/drm/bridge/nwl-dsi.c
> +++ b/drivers/gpu/drm/bridge/nwl-dsi.c
> @@ -912,19 +912,11 @@ static int nwl_dsi_bridge_attach(struct
> drm_bridge *bridge,
>  {
>  	struct nwl_dsi *dsi = bridge_to_dsi(bridge);
>  	struct drm_bridge *panel_bridge;
> -	struct drm_panel *panel;
> -	int ret;
> -
> -	ret = drm_of_find_panel_or_bridge(dsi->dev->of_node, 1, 0,
> &panel,
> -					  &panel_bridge);
> -	if (ret)
> -		return ret;
>  
> -	if (panel) {
> -		panel_bridge = drm_panel_bridge_add(panel);
> -		if (IS_ERR(panel_bridge))
> -			return PTR_ERR(panel_bridge);
> -	}
> +	panel_bridge = devm_drm_of_get_bridge(dsi->dev, dsi->dev-
> >of_node,
> +					      1, 0);
> +	if (IS_ERR(panel_bridge))
> +		return PTR_ERR(panel_bridge);
>  
>  	if (!panel_bridge)
>  		return -EPROBE_DEFER;

I don't think panel_bridge can be NULL here, so this check can be
removed.  However, even if this patch is not applied, the check is not
necessary.  I think it can be removed with a separate patch.

For this patch:
Reviewed-by: Liu Ying <victor.liu@oss.nxp.com>

> @@ -932,12 +924,6 @@ static int nwl_dsi_bridge_attach(struct
> drm_bridge *bridge,
>  	return drm_bridge_attach(bridge->encoder, panel_bridge, bridge,
> flags);
>  }
>  
> -static void nwl_dsi_bridge_detach(struct drm_bridge *bridge)
> -{	struct nwl_dsi *dsi = bridge_to_dsi(bridge);
> -
> -	drm_of_panel_bridge_remove(dsi->dev->of_node, 1, 0);
> -}
> -
>  static u32 *nwl_bridge_atomic_get_input_bus_fmts(struct drm_bridge
> *bridge,
>  						 struct
> drm_bridge_state *bridge_state,
>  						 struct drm_crtc_state
> *crtc_state,
> @@ -983,7 +969,6 @@ static const struct drm_bridge_funcs
> nwl_dsi_bridge_funcs = {
>  	.mode_set		= nwl_dsi_bridge_mode_set,
>  	.mode_valid		= nwl_dsi_bridge_mode_valid,
>  	.attach			= nwl_dsi_bridge_attach,
> -	.detach			= nwl_dsi_bridge_detach,
>  };
>  
>  static int nwl_dsi_parse_dt(struct nwl_dsi *dsi)

