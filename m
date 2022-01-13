Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 815A848D100
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 04:40:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50B0210E5D7;
	Thu, 13 Jan 2022 03:40:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2090.outbound.protection.outlook.com [40.107.101.90])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3CC010E5D7
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 03:40:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PHWks+tXlu0sWrMFiO2AgJHl/LN/SXeghLkhd+T/nnn+LinjW5wZvwB0YQCEKQltzE52JJR/9exyiPnQjNkPUqMncJo/JMO8rXn+asHX5BNvvw/5xmhJQdKccGF1OY+ooADBtVS+GOtlz1GykBjy1hXBJ7Q7x9qtWr3tzH7pYp6/fVLboFcLdEE75ptGfx+pWVL2sHjWUox9e9DaitAPkT92MGlKAwcNjDYXlK3Q4qfwfgoNoiSYOrgsiSES4uDLUNARumFwsukKqc10RdW1BvNsK+gdefdZkuTDGUtzM9MwIUuUU7wlRfVVs740JAheVOOi6Oc4ns3nCKEpz499Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oLh77S8XQg2xurf5HAFTfbMU4zjmd58aqadEp85Ym4c=;
 b=lEnOoHi1+ubcORUoW9Kp9xeoi3Lf8iFBuSCUWCfW/YrdMVhZJ31Ia6eWZV+OlcSO4eU5xSHpKWhAVZhERdvX/pweVaCLxpKpz9ddwrwdKmcdHlDZOZMCqzZ/yVkFY6DIRj3U1aRplBoD6rlcuE/fkR4EDCRFD4psni5wbpgtwVDq5UX7bCxt+89xGDpvsjyVrsLjEfZxylxpIcMQf5rL2HghGF8UlvS/fJCLgtivAnFGHz2VkwRaAuOZ1lPc9QLwS0jpciNuO0kaI0cTT9CuPTs4VG5ODO9SX+t9Hi9/f6qPO0UWzhQYa4QNynxdhrW1ozzJLDbiq/c0fq8nj5AzgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oLh77S8XQg2xurf5HAFTfbMU4zjmd58aqadEp85Ym4c=;
 b=KLz63ZZYx68zV5F/cqrzgfdFPoQs09sJ7rYN/uIFGHW+2yM9fR6K0cEbhfbclzj6650zRzbpMVMz9UMxA33GHXEgGu/+aMbA4B80jzQgcXp3U1qqvj/2IN5mqOKokft1VSJ1LQs2x9JNy56MnGIGKnoLs/c0wFMFG4fUlNN9DQ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from DM6PR04MB6748.namprd04.prod.outlook.com (2603:10b6:5:247::8) by
 DM5PR04MB0890.namprd04.prod.outlook.com (2603:10b6:4:41::37) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.9; Thu, 13 Jan 2022 03:40:14 +0000
Received: from DM6PR04MB6748.namprd04.prod.outlook.com
 ([fe80::7dd5:4725:ade2:d8f9]) by DM6PR04MB6748.namprd04.prod.outlook.com
 ([fe80::7dd5:4725:ade2:d8f9%3]) with mapi id 15.20.4867.012; Thu, 13 Jan 2022
 03:40:14 +0000
Date: Thu, 13 Jan 2022 11:40:08 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 2/3] drm/bridge: anx7625: Support reading edid through
 aux channel
Message-ID: <20220113034008.GC2478030@anxtwsw-Precision-3640-Tower>
References: <20220111112701.1064458-1-hsinyi@chromium.org>
 <20220111112701.1064458-2-hsinyi@chromium.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220111112701.1064458-2-hsinyi@chromium.org>
X-ClientProxiedBy: HK0PR03CA0116.apcprd03.prod.outlook.com
 (2603:1096:203:b0::32) To DM6PR04MB6748.namprd04.prod.outlook.com
 (2603:10b6:5:247::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: adf230eb-4b3f-4d1c-32c4-08d9d646686e
X-MS-TrafficTypeDiagnostic: DM5PR04MB0890:EE_
X-Microsoft-Antispam-PRVS: <DM5PR04MB08904DD09BCD0D7DE775ADB1C7539@DM5PR04MB0890.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yg7Shx9VVhwLF+Usy2vvT42fA30pze8NIyR5/jECXDQPjEmiQbJfWH0/0ovB1pUQWUu2bEHQ3Jm5guMMkYbPJqHU9gRz4MUcVS+Mq9pZwg/wtVLrRo3ANAmJ6gyUrXeC8kOrxu/LBpXZpWCYsD2dhQOQjMX7wLfxB5PuM2LU7paSBEEDDVt0nIU2v8mJ47GxQwgTYdZPI5dmKCCgi/+T9mLI63DqF9TYF0eiTCywzNR7F0wh1wKnOxqwUcDCSywcSUSTJ/J1Xb82Sj+WWpJMUvgSw1b8fgXVGJJuoukMzpRTEvGQcGJX+ejsc5wxJ9qyCQKzcrom5SRvRcdCL4WmYvTGVwWcisBiZTt72/q6Fc3mOc3cQFZl87YL4t8kMhBPMgiKfD0dQd0GWYGkFXkb8Co9gh21F6aL2FsCgBpcZGWCB83kEoS8Hsm+xwA5+0XPD6QpZoVNJPqiTssTrtDJARp5iHYa4PcpTp7cozrnJhoHIDxNSkvX3BBU0cSjWwrXIiLMt1LLR6PNcHlYP58MtxPpf9X7fEEVWdIjgrJY2HxQyvyGDPPBVsjqnUD2x140koiOZBONMQWIJS4C6IFtFd+IpTD7Zqi4hCyaL9FPtgEua7e1N+xUHDVqIF7u/7DgopZaysBUrhZynpn6RMfdrwJCNoHWPuELVRDi3g9O8bznJ2fJEdCClZZIpDNAJomdVV1J23DuH5VnLNqqOVTdag==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB6748.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(366004)(33656002)(6506007)(966005)(2906002)(186003)(4326008)(508600001)(6486002)(8676002)(8936002)(83380400001)(86362001)(316002)(66476007)(66556008)(66946007)(7416002)(5660300002)(110136005)(54906003)(26005)(6512007)(6666004)(33716001)(9686003)(52116002)(55236004)(1076003)(38350700002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B8QO1ROf5X+qd6m4sItj/Fkt5vN9HfRJOTQ8dl8DHsjdbvQk/I1+0KP1mrwn?=
 =?us-ascii?Q?HwIzzwNbn2PSFmfTLVRhv7p0NR3TJk0Zj406tT8SsvN4sxHfHUZETI7G2a9N?=
 =?us-ascii?Q?b0f0Z8O4qow05WBbe/TQIF3alZVBbbcfh22oER67Za7E3Q/MQLV8HmjDmH+/?=
 =?us-ascii?Q?WbO51hlbAzK25p9cvcnC/4zwJafhZmEPtHRTU89rzqt8vBc2BMDF+LnffXSS?=
 =?us-ascii?Q?+RyrXZSz/cWKEjEk/YlL0hhzxiyoaARmCs11hSzpmh3p058hlmXEtiVA6KYR?=
 =?us-ascii?Q?xnb7ELbM9nR+5ZOjKYJuTtbT5qybCx7p6iiafIEjRFxTrZmMK/BI5G+2zlIx?=
 =?us-ascii?Q?IdwDLODUYJhvn5gJxmy49m1cJGsRoGkKqroEXnAf5zf8GLAZVYu3h2RQU3z8?=
 =?us-ascii?Q?5Kdzcd23F0JFBBn6bFcdv7ByGLLvUNcC8MkaFojPMV6y3Yi7FAOIZ9eim8Qi?=
 =?us-ascii?Q?KdXevXe5pvVhSunSoY0Ty3hsBCplA7RhgcSt57jTCClH0tpYNh+3YLDdLxhH?=
 =?us-ascii?Q?5y8k5TicTN34LcaZe5ScriTMqui+dmz8T4cSCkx2ecU/IR4Tjm7o5aNdDlHZ?=
 =?us-ascii?Q?tZBs6RdY+dgTaJETwiAuFeHSMxuSKSokxqeDAkVmmrf37qb/1j0ptvY74wFL?=
 =?us-ascii?Q?CmZmhPQOPCaKYlIZnIa+8s8IaDVxyezxjlNiA57GLTV5sZk9JouCqhBpukyl?=
 =?us-ascii?Q?PrMjsSS7FzDQ7q4idhhPdB3v4S+c45qcfC5+9sgmBnzuf39LN9DpzDIbc7VW?=
 =?us-ascii?Q?E0GhYiAOJvXsGYLvyAvI925b1V6lHtsif/KAc4ySLFUHNGpCaeXShIkaGWkX?=
 =?us-ascii?Q?FLOVywx19BF08EP8ob1mzkBeyhgqFutCi8FmMQ+9FNLLRXr77xao/wHznIpd?=
 =?us-ascii?Q?ajnQkhKVKA/ahtYbnnSL5Ow0/Rb8cRsSpCyOt1LIjq//WcxGAyXnlg6Uyht+?=
 =?us-ascii?Q?xDAkYUtl25EXRl7+HF3MSujVDH3AqxHuFjlN8epoYZS7RY22Ty8WW3yznOIe?=
 =?us-ascii?Q?3G8utoPcsvRKjGbteCR3OYmHKNYQj6XAli5Fq0VIoiQs/EzllEdn7ZW+etQu?=
 =?us-ascii?Q?/vBOAPcH8ymx4GyzHDEw8Bjhn7Bs1JKXNaxxwa4jxZWeQ9dilxYLdI9eh8fo?=
 =?us-ascii?Q?GpYyduA4ycFeQv/cgv852871kbrXd1rwklCSIDoS63Hgyb2tFMcaUSAT2oXI?=
 =?us-ascii?Q?nhf4rk5rPhJBkXQgmaqkcV9RuuZtw9UDBPrTDrN8hB7oWDVeJZxbJ/nKWRZ/?=
 =?us-ascii?Q?7Uw1Z1VrVSALcgSgeS3Ws2LQQReDlW3WpjF3LFbHfwMIKdyXwFUjiDqxAyzX?=
 =?us-ascii?Q?uMgYKEoqPy/OJaV499Ggh4uoe/v/HKeYk1exRjsBhnDEJhj5Luzl2CZtZgoW?=
 =?us-ascii?Q?2wREBktEp5+r5aHWiJpL5EugNzrM4XZZJ2brDYtkTYf2/wGkQ7JlKcKyqz2b?=
 =?us-ascii?Q?hPpVr/eYmKmnKanAmXSncRzoPJoZQg6thGbVV3wcF1i73hWE4rJ1x+fegIY1?=
 =?us-ascii?Q?2Gck1hDBDbmHSP97y0I6+mJRXjOfwDvE4+RM0cc9OfTMUEJ3GCcofOAe5rYP?=
 =?us-ascii?Q?X+YQTOOQskvO3raZmCw8hvAEPO07Zzdv0T2/mvCl9CxJ0QCUfgni/069VF9g?=
 =?us-ascii?Q?AJsJmrfq3isfszgaG42OiyU=3D?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adf230eb-4b3f-4d1c-32c4-08d9d646686e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6748.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 03:40:13.9305 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dL9BO/DThYWbW/GNsooVolfRBWuYz2aGpwEElzg1hJly55QYJiXeKxItIIRV5H31XCOPwLRHPk6n/1AjZBr1Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB0890
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hsin-Yi, thanks for the patch! Please fix the follow comment, then
add my id.
Reviewed-by: Xin Ji <xji@analogixsemi.com>

On Tue, Jan 11, 2022 at 07:27:00PM +0800, Hsin-Yi Wang wrote:
> Support reading edid through aux channel if panel is connected to aux
> bus. Extend anx7625_aux_dpcd_trans() to implement aux transfer function:
> 
> 1. panel is populated in devm_of_dp_aux_populate_ep_devices(), so move
>    anx7625_parse_dt() after.
> 2. Use pm runtime autosuspend since aux transfer function is called
>    multiple times when reading edid.
> 3. No-op if aux transfer length is 0.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> This patch is based on drm-misc-next and depends on 
> https://patchwork.freedesktop.org/patch/469081/
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 123 ++++++++++++++++++----
>  drivers/gpu/drm/bridge/analogix/anx7625.h |   4 +
>  2 files changed, 109 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index dbe708eb3bcf11..d60cfc058fbe7d 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -24,6 +24,7 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_crtc_helper.h>
> +#include <drm/drm_dp_aux_bus.h>
>  #include <drm/drm_dp_helper.h>
>  #include <drm/drm_edid.h>
>  #include <drm/drm_hdcp.h>
> @@ -231,19 +232,22 @@ static int wait_aux_op_finish(struct anx7625_data *ctx)
>  	return 0;
>  }
>  
> -static int anx7625_aux_dpcd_trans(struct anx7625_data *ctx, u8 op,
> -				  u32 address, u8 len, u8 *buf)
> +static int anx7625_aux_trans(struct anx7625_data *ctx, u8 op, u32 address,
> +			     u8 len, u8 *buf)
>  {
>  	struct device *dev = &ctx->client->dev;
>  	int ret;
>  	u8 addrh, addrm, addrl;
>  	u8 cmd;
>  
> -	if (len > MAX_DPCD_BUFFER_SIZE) {
> +	if (len > DP_AUX_MAX_PAYLOAD_BYTES) {
>  		dev_err(dev, "exceed aux buffer len.\n");
>  		return -EINVAL;

The native write command is 0x08, I2C Over aux write command is 0x04.
The native read command is 0x09, I2C Over aux read command is 0x05.

>  	}
>  
> +	if (!len)
> +		return len;
> +
>  	addrl = address & 0xFF;
>  	addrm = (address >> 8) & 0xFF;
>  	addrh = (address >> 16) & 0xFF;
> @@ -262,7 +266,7 @@ static int anx7625_aux_dpcd_trans(struct anx7625_data *ctx, u8 op,
>  	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
>  				 AP_AUX_ADDR_19_16, addrh);
>  
> -	if (op == DPCD_WRITE)
> +	if (op == DPCD_WRITE || op == AP_AUX_WRITE)
>  		ret |= anx7625_reg_block_write(ctx, ctx->i2c.rx_p0_client,
>  					       AP_AUX_BUFF_START, len, buf);
>  	/* Enable aux access */
> @@ -275,14 +279,14 @@ static int anx7625_aux_dpcd_trans(struct anx7625_data *ctx, u8 op,
>  	}
>  
>  	ret = wait_aux_op_finish(ctx);
> -	if (ret) {
> +	if (ret < 0) {
>  		dev_err(dev, "aux IO error: wait aux op finish.\n");
>  		return ret;
>  	}
>  
>  	/* Write done */
> -	if (op == DPCD_WRITE)
> -		return 0;
> +	if (op == DPCD_WRITE || op == AP_AUX_WRITE)
> +		return len;
>  
>  	/* Read done, read out dpcd data */
>  	ret = anx7625_reg_block_read(ctx, ctx->i2c.rx_p0_client,
> @@ -292,7 +296,7 @@ static int anx7625_aux_dpcd_trans(struct anx7625_data *ctx, u8 op,
>  		return -EIO;
>  	}
>  
> -	return 0;
> +	return len;
>  }
>  
>  static int anx7625_video_mute_control(struct anx7625_data *ctx,
> @@ -867,7 +871,7 @@ static int anx7625_hdcp_enable(struct anx7625_data *ctx)
>  	}
>  
>  	/* Read downstream capability */
> -	anx7625_aux_dpcd_trans(ctx, DPCD_READ, 0x68028, 1, &bcap);
> +	anx7625_aux_trans(ctx, DPCD_READ, 0x68028, 1, &bcap);
>  	if (!(bcap & 0x01)) {
>  		pr_warn("downstream not support HDCP 1.4, cap(%x).\n", bcap);
>  		return 0;
> @@ -956,7 +960,7 @@ static void anx7625_dp_stop(struct anx7625_data *ctx)
>  	dev_dbg(dev, "notify downstream enter into standby\n");
>  	/* Downstream monitor enter into standby mode */
>  	data = 2;
> -	ret |= anx7625_aux_dpcd_trans(ctx, DPCD_WRITE, 0x000600, 1, &data);
> +	ret |= anx7625_aux_trans(ctx, DPCD_WRITE, 0x000600, 1, &data);
>  	if (ret < 0)
>  		DRM_DEV_ERROR(dev, "IO error : mute video fail\n");
>  
> @@ -1655,11 +1659,60 @@ static int anx7625_parse_dt(struct device *dev,
>  	return 0;
>  }
>  
> +static bool anx7625_of_panel_on_aux_bus(struct device *dev)
> +{
> +	struct device_node *bus, *panel;
> +
> +	bus = of_get_child_by_name(dev->of_node, "aux-bus");
> +	if (!bus)
> +		return false;
> +
> +	panel = of_get_child_by_name(bus, "panel");
> +	of_node_put(bus);
> +	if (!panel)
> +		return false;
> +	of_node_put(panel);
> +
> +	return true;
> +}
> +
>  static inline struct anx7625_data *bridge_to_anx7625(struct drm_bridge *bridge)
>  {
>  	return container_of(bridge, struct anx7625_data, bridge);
>  }
>  
> +static ssize_t anx7625_aux_transfer(struct drm_dp_aux *aux,
> +                                    struct drm_dp_aux_msg *msg)
> +{
> +	struct anx7625_data *ctx = container_of(aux, struct anx7625_data, aux);
> +	struct device *dev = &ctx->client->dev;
> +	u8 request = msg->request & ~DP_AUX_I2C_MOT, op;
> +	int ret = 0;
> +
> +	pm_runtime_get_sync(dev);
> +	msg->reply = 0;
> +	switch (request) {
> +	case DP_AUX_NATIVE_WRITE:
> +	case DP_AUX_I2C_WRITE:
> +		op = AP_AUX_WRITE;

The DPCD native write is different with I2C over aux write.

> +		break;
> +	case DP_AUX_NATIVE_READ:
> +	case DP_AUX_I2C_READ:
> +		op = AP_AUX_READ;
The DPCD native read is different with I2C over aux read.
> +		break;
> +	default:
> +		ret = -EINVAL;
> +	}
> +	if (!ret) {
> +		ret = anx7625_aux_trans(ctx, op, msg->address, msg->size,
> +					msg->buffer);
> +	}
> +	pm_runtime_mark_last_busy(dev);
> +	pm_runtime_put_autosuspend(dev);
> +
> +	return ret;
> +}
> +
>  static struct edid *anx7625_get_edid(struct anx7625_data *ctx)
>  {
>  	struct device *dev = &ctx->client->dev;
> @@ -2066,6 +2119,13 @@ static int anx7625_bridge_attach(struct drm_bridge *bridge,
>  		return -ENODEV;
>  	}
>  
> +	ctx->aux.drm_dev = bridge->dev;
> +	err = drm_dp_aux_register(&ctx->aux);
> +	if (err) {
> +		dev_err(dev, "failed to register aux channel: %d\n", err);
> +		return err;
> +	}
> +
>  	if (ctx->pdata.panel_bridge) {
>  		err = drm_bridge_attach(bridge->encoder,
>  					ctx->pdata.panel_bridge,
> @@ -2079,6 +2139,13 @@ static int anx7625_bridge_attach(struct drm_bridge *bridge,
>  	return 0;
>  }
>  
> +static void anx7625_bridge_detach(struct drm_bridge *bridge)
> +{
> +	struct anx7625_data *ctx = bridge_to_anx7625(bridge);
> +
> +	drm_dp_aux_unregister(&ctx->aux);
> +}
> +
>  static enum drm_mode_status
>  anx7625_bridge_mode_valid(struct drm_bridge *bridge,
>  			  const struct drm_display_info *info,
> @@ -2344,6 +2411,7 @@ static struct edid *anx7625_bridge_get_edid(struct drm_bridge *bridge,
>  
>  static const struct drm_bridge_funcs anx7625_bridge_funcs = {
>  	.attach = anx7625_bridge_attach,
> +	.detach = anx7625_bridge_detach,
>  	.mode_valid = anx7625_bridge_mode_valid,
>  	.mode_set = anx7625_bridge_mode_set,
>  	.atomic_check = anx7625_bridge_atomic_check,
> @@ -2501,6 +2569,12 @@ static const struct dev_pm_ops anx7625_pm_ops = {
>  			   anx7625_runtime_pm_resume, NULL)
>  };
>  
> +static void anx7625_runtime_disable(void *data)
> +{
> +	pm_runtime_dont_use_autosuspend(data);
> +	pm_runtime_disable(data);
> +}
> +
>  static int anx7625_i2c_probe(struct i2c_client *client,
>  			     const struct i2c_device_id *id)
>  {
> @@ -2523,13 +2597,6 @@ static int anx7625_i2c_probe(struct i2c_client *client,
>  
>  	pdata = &platform->pdata;
>  
> -	ret = anx7625_parse_dt(dev, pdata);
> -	if (ret) {
> -		if (ret != -EPROBE_DEFER)
> -			DRM_DEV_ERROR(dev, "fail to parse DT : %d\n", ret);
> -		return ret;
> -	}
> -
>  	platform->client = client;
>  	i2c_set_clientdata(client, platform);
>  
> @@ -2577,6 +2644,19 @@ static int anx7625_i2c_probe(struct i2c_client *client,
>  		}
>  	}
>  
> +	platform->aux.name = "anx7625-aux";
> +	platform->aux.dev = dev;
> +	platform->aux.transfer = anx7625_aux_transfer;
> +	drm_dp_aux_init(&platform->aux);
> +	devm_of_dp_aux_populate_ep_devices(&platform->aux);
> +
> +	ret = anx7625_parse_dt(dev, pdata);
> +	if (ret) {
> +		if (ret != -EPROBE_DEFER)
> +			DRM_DEV_ERROR(dev, "fail to parse DT : %d\n", ret);
> +		return ret;
> +	}
> +
>  	if (anx7625_register_i2c_dummy_clients(platform, client) != 0) {
>  		ret = -ENOMEM;
>  		DRM_DEV_ERROR(dev, "fail to reserve I2C bus.\n");
> @@ -2584,6 +2664,12 @@ static int anx7625_i2c_probe(struct i2c_client *client,
>  	}
>  
>  	pm_runtime_enable(dev);
> +	pm_runtime_set_autosuspend_delay(dev, 1000);
> +	pm_runtime_use_autosuspend(dev);
> +	pm_suspend_ignore_children(dev, true);
> +	ret = devm_add_action_or_reset(dev, anx7625_runtime_disable, dev);
> +	if (ret)
> +		return ret;
>  
>  	if (!platform->pdata.low_power_mode) {
>  		anx7625_disable_pd_protocol(platform);
> @@ -2596,7 +2682,8 @@ static int anx7625_i2c_probe(struct i2c_client *client,
>  
>  	platform->bridge.funcs = &anx7625_bridge_funcs;
>  	platform->bridge.of_node = client->dev.of_node;
> -	platform->bridge.ops = DRM_BRIDGE_OP_EDID;
> +	if (!anx7625_of_panel_on_aux_bus(&client->dev))
> +		platform->bridge.ops |= DRM_BRIDGE_OP_EDID;
>  	if (!platform->pdata.panel_bridge)
>  		platform->bridge.ops |= DRM_BRIDGE_OP_HPD |
>  					DRM_BRIDGE_OP_DETECT;
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
> index 56165f5b254c14..cab19735c22e21 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.h
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
> @@ -231,6 +231,9 @@
>  #define AP_AUX_ADDR_15_8  0x12
>  #define AP_AUX_ADDR_19_16 0x13
>  
> +#define AP_AUX_READ 0x1
> +#define AP_AUX_WRITE 0x4
> +
>  /* Bit[0:3] AUX status, bit 4 op_en, bit 5 address only */
>  #define AP_AUX_CTRL_STATUS 0x14
>  #define AP_AUX_CTRL_OP_EN 0x10
> @@ -474,6 +477,7 @@ struct anx7625_data {
>  	u8 bridge_attached;
>  	struct drm_connector *connector;
>  	struct mipi_dsi_device *dsi;
> +	struct drm_dp_aux aux;
>  };
>  
>  #endif  /* __ANX7625_H__ */
> -- 
> 2.34.1.575.g55b058a8bb-goog
