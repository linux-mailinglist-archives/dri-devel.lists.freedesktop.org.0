Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 465FE4CF01D
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 04:23:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E98010E0F9;
	Mon,  7 Mar 2022 03:23:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2136.outbound.protection.outlook.com [40.107.237.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD32110E0F9
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 03:23:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oATRpnBU3rPVmVCwNelD42QPFO7uGq3YalfGotF/XE5t6tD90yiX2Ci4rhoTCz0zx3ABO8n4oZjoclGIgB85UEUTdV0QfzJOtkgCP/gOj+XwwpYqmCL+bO7fPcOvT5ra5DbugcjrhaKIpJhUsOJ6YeAnPLuFyEDI6Vmi6mhuLW/873YPhZYzlg5unIWiCoR+PNtFN5HFNv5bF3Ku/T8Cs1o970J0zjrZvrq6O5y65XoGN3Jb19yjitIEYHRwdZiyuLTlP/lnWSpHNR57DaR94HFzLOwKYW3esSRJFzvIl/eZE2v7nLjd+Y1WLxZuSoGFCmylAX+nZnrLDHy1jA6WEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6bKljKAtQOxBClwIczBNh/WwJXwjmZKhbBqP2SCqyqM=;
 b=FkLGesX2UTXvL7QNqm3o8YC82iixQPTULxjtRcdAs7YmrsJZv+iA4CZkdAhbRynfmwS7dah4slbeoYuIAnnGRttbb6lbA3gr5oXp+8bybsxfahxA76VYHfu/9J8QffNXW4zJ4IEqBSu5XI3fNh1z8ZjUp4uU4FM4WWQaylURk3UaymiJJi0Dq0Jbn18pvuNoS81q9/4g+bAdyMP5ckQOeRbg/FBYUaVixqG/4eJ19MxAdvWRv7ZeOJQ87gX5/iFpRB2RtpqRAiWE03Ni/PGcnNEoDV9101j7YXdDzVGKAkMf4nIqqexl60AaT1L4JyLNcktCX8gOODa6nn9GpeiYSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6bKljKAtQOxBClwIczBNh/WwJXwjmZKhbBqP2SCqyqM=;
 b=vlob1hr9j1T71G1mkNEz+q9nW2P0eW028ZZOy8tg708oTgRROPM4uRLXUnjSth6aOWffiNcWhPZXhtGL+piNgU2W/Hv/hY5f/WmJ8vQLAKWyGm0snSEgLs3ACYdhx9wuUMFPQaVTmYY6+JzsxiB2olIy+JpwzkQBwyjZe8Su/qE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BN8PR04MB5649.namprd04.prod.outlook.com (2603:10b6:408:72::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.17; Mon, 7 Mar
 2022 03:22:58 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::a865:6d10:c4a9:1142]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::a865:6d10:c4a9:1142%9]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 03:22:58 +0000
Date: Mon, 7 Mar 2022 11:22:48 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v12 3/4] drm/bridge: anx7625: add MIPI DPI input feature
Message-ID: <20220307032248.GA4173850@anxtwsw-Precision-3640-Tower>
References: <20211105031904.2641088-1-xji@analogixsemi.com>
 <20211105031904.2641088-3-xji@analogixsemi.com>
 <YiTruiCIkyxs3jTC@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YiTruiCIkyxs3jTC@pendragon.ideasonboard.com>
X-ClientProxiedBy: SG2PR03CA0090.apcprd03.prod.outlook.com
 (2603:1096:4:7c::18) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a15c6f80-a3d2-447d-dbf4-08d9ffe9c6a7
X-MS-TrafficTypeDiagnostic: BN8PR04MB5649:EE_
X-Microsoft-Antispam-PRVS: <BN8PR04MB56492B6A1C6E8997E06C5A3EC7089@BN8PR04MB5649.namprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vzNqgPf3QA+8vlwpl34USDLEv4g/PjWULwpSLHCk+lFWkS9iXdh3H1DMV0sN/0FYvSoFq78STLQZPfZXBxj2Id52n5ABvw92TRbpMeBAjI3uwDW5o8HOcpBEXrQyoei6X85RuYw3nDWgWn+SdlNrFUMgaQL+dRdjPC6EkLiTETHFSm7nvaNZ6ny1DPGD54MXBeDai4aWpgrSD7vnkaHP2HJabrGO2H+KvGmd+zQJyo+3WfAodRu31FMvpsZ2UoZVqYU+ux7KRXV5FoHIVr2khBajyF6hR8LsyBQcMNymQc2oaZVB5sIt8Dm/PLbU+3B+DExdJMLMI1cCm9gswYAdfOS6/YeoudqGeqKYGpNIq0W/K/993TBkN71UW28hpbQjQbnA0nkN5EG3umeumLQed9YJehCrwlEA+NKwDU+ED/PsahwzpbUxdTtY5qwC0LqrqE8QORjt8PduUh2WwGdx/B3sZ8FQZ2ZF/VqYhCnOd7gIFFbNLWiaPP4ctEaS+eWCRBUStg9uBpznw24JQX+l91KsqqFFaR93/JTIlMEWGwiCLyg27as2Vtb0RpeFDN3kxlMNevT4SFMSXkxIxG+z3abR2BvJ5Wv8kQ/+vDPYDAnR9DLCzq3DJj55JQQxUXpPXq6DEJ7G0QPyLJ9tAS1buDGVK1wmk3yJYC6s8FgBmkaPCm5qeaWjCHp7oUED8WNXfh3y9EshASLLNUhl9sxAyQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(316002)(83380400001)(55236004)(33656002)(6916009)(38100700002)(38350700002)(2906002)(52116002)(6486002)(9686003)(30864003)(7416002)(66476007)(66556008)(66946007)(5660300002)(1076003)(186003)(508600001)(26005)(6512007)(6666004)(6506007)(8676002)(4326008)(33716001)(8936002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?65xe2635cJnlaJYoLNDMMDClCHYIYjZkx1I9w7bVE6JZLcwEK1MOqWFK3QzU?=
 =?us-ascii?Q?DjVFFEpYsjSOiDSb07MGxr71SUExP39MEbb5Iq8A77OWpK5NeHZyZFbFsKeV?=
 =?us-ascii?Q?HeePw/QbAoaix31VtqfrFlVcfGOT08ejXN7onReiBy2KrcB1qVDziWzsG31Z?=
 =?us-ascii?Q?kD0HW5XrgOx1sEdAWqhyPcJTInRdllzGmYfKuYFsmvLr6NbBvGBrroTZt8q/?=
 =?us-ascii?Q?lm1wel/tb3UF/UR2ktzDwgoSqNF9YDtnfRfocG+adPblVKZ9w8kdo4PY2aK/?=
 =?us-ascii?Q?TUrn2u9bwWAcy+Cb7sTmJGJb4f0ionEAaGWIYRX6vF3lK0jA32F7qFHwBuBa?=
 =?us-ascii?Q?rhgrhRzemQPqHonY9VeToTOiQA1F6Y8C8ts5r6tEWWYZxYlHgI81/jDwA47P?=
 =?us-ascii?Q?IU5yQneHT4mr7h5FADXK87QMfZLfMxsVFOwvL1reQe0LH6N2a9NYVXpr5M4s?=
 =?us-ascii?Q?Gi7xCcNIheCDmirIVq1ZeHUCtfU0f6t/owpUCQL9D5RbGXjp1KiCBrF+mzsV?=
 =?us-ascii?Q?rqER4Kn9p2eTMB7oSWuU8g5KJvit/1rVeKrJ2JOPEdBW4saqbHrfNlo6EdIi?=
 =?us-ascii?Q?/U0DQ/js/0DXHKijPOk1fPkgnYmpoiw1ILxqdblDt94k/tMCobqTf9iGQc/0?=
 =?us-ascii?Q?e5XvxRwFo0yKQK2gLaL32ozK9Sy0j5okrXEMYfzy1D+XemIbA79Z/Jl+LdIe?=
 =?us-ascii?Q?4/7xk4NNsw8eQtW1AwtIKmuD+N4JpTkJUb3CqX5ZAznoLAOroH5waFAkTCGV?=
 =?us-ascii?Q?DnZLooJNDWXtnNlYzTzaMaQvhHjJI+ddzg4VetU/aazvEOXFACqTBVSteKqI?=
 =?us-ascii?Q?I+5mFjZj+fgzTTNjEmjhCTiR4iX6BOxEfXpl3KDb9sCZFwtTZ9XtBV2zAXBt?=
 =?us-ascii?Q?3pOyx/LBY5lEsCwtO8GES+Sp65c0OZIYBEG0McU6rrkB4v/7L6NBX/mW9iRi?=
 =?us-ascii?Q?xa+JY5YqWdkH7MkJExIBVzAyvxRWDKMMntQmHSEK1XCC23FIGF5wnCUg1hTC?=
 =?us-ascii?Q?sOGnbcfOW4+ZU0x9nZtZ3kw+7yfy31TN/aurn64N7lUqus+nV+9HQCjxbpS5?=
 =?us-ascii?Q?XI46E98+VS+Tl0xl5E6hr4JsyM+Ly2AhzwQ8RmE9wGQYVAWt2dm0xl8spD4F?=
 =?us-ascii?Q?sAdjaNC88ICDDZHvM7+qo/Z7NBt3CePDfaKCRCp8eRH4esObitLLaeKj3uVA?=
 =?us-ascii?Q?Q57aqiFhvZaZ3BOX9NsWqdgFFAtTaBkRcyIEfuUxNl5GtgdGlqJtL1YHkpKf?=
 =?us-ascii?Q?/nfaILg266t8xrjfzdB694ewwoeuK1gx9PsQUq2BS56ef0WBVor1b0Btw4Y3?=
 =?us-ascii?Q?WfnKzbFDSoSvxIIpQ+urMAGu0JHSOo7XpdM3yQE5jwZAa1mbwMhw3jfXmjEo?=
 =?us-ascii?Q?tdHz5cLVnGQM3w9v0vEIgsmzuuDnLUDvOFkXr877dW/myTmOABkjlXCU5anh?=
 =?us-ascii?Q?82tSu4UeMjQAH5Zigdr5uNFdqlkXRPnew3KnF/S1iJnMITdb3vEKZReN/GeN?=
 =?us-ascii?Q?bE7doJGjS9L5YOZ/L8kRCfaySASKLl8leeO+/haKPIZ08XMflCpbIGBQyJsZ?=
 =?us-ascii?Q?moyQn2mVBAebalTIoHAibqNhNwPOG53Q++mxpTtlK9Fn2TvDnyXD1M+JjdWc?=
 =?us-ascii?Q?gV4dgLT13a2JV85x66vc+S0=3D?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a15c6f80-a3d2-447d-dbf4-08d9ffe9c6a7
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 03:22:57.9668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XQxQoCZu6i8GeuaFCBTjv00W5D0/lVXXCHBDMKGFcktdkb968yMqBPc86YJBNF2iFw6yDdZgvk7O+uikYe0vag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR04MB5649
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
Cc: drinkcat@google.com, pihsun@chromium.org, jonas@kwiboo.se, airlied@linux.ie,
 bliang@analogixsemi.com, dri-devel@lists.freedesktop.org,
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 jernej.skrabec@gmail.com, a.hajda@samsung.com, devicetree@vger.kernel.org,
 robh+dt@kernel.org, robert.foss@linaro.org, hsinyi@chromium.org,
 tzungbi@google.com, sam@ravnborg.org, qwen@analogixsemi.com,
 dan.carpenter@oracle.com, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 06, 2022 at 07:13:30PM +0200, Laurent Pinchart wrote:
> Hello Xin,
> 
> (Question for Rob below, and I'm afraid this is urgent as we need to
> merge a fix in v5.17).
> 
> On Fri, Nov 05, 2021 at 11:19:03AM +0800, Xin Ji wrote:
> > The basic anx7625 driver only support MIPI DSI rx signal input.
> > This patch add MIPI DPI rx input configuration support, after apply
> > this patch, the driver can support DSI rx or DPI rx by adding
> > 'bus-type' in DT.
> > 
> > Reviewed-by: Robert Foss <robert.foss@linaro.org>
> > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > ---
> >  drivers/gpu/drm/bridge/analogix/anx7625.c | 247 ++++++++++++++++------
> >  drivers/gpu/drm/bridge/analogix/anx7625.h |  18 +-
> >  2 files changed, 205 insertions(+), 60 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > index f48e91134c20..f7c3386c8929 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > @@ -32,6 +32,7 @@
> >  #include <drm/drm_print.h>
> >  #include <drm/drm_probe_helper.h>
> >  
> > +#include <media/v4l2-fwnode.h>
> >  #include <video/display_timing.h>
> >  
> >  #include "anx7625.h"
> > @@ -152,18 +153,18 @@ static int anx7625_write_and(struct anx7625_data *ctx,
> >  	return anx7625_reg_write(ctx, client, offset, (val & (mask)));
> >  }
> >  
> > -static int anx7625_write_and_or(struct anx7625_data *ctx,
> > -				struct i2c_client *client,
> > -				u8 offset, u8 and_mask, u8 or_mask)
> > +static int anx7625_config_bit_matrix(struct anx7625_data *ctx)
> >  {
> > -	int val;
> > +	int i, ret;
> >  
> > -	val = anx7625_reg_read(ctx, client, offset);
> > -	if (val < 0)
> > -		return val;
> > +	ret = anx7625_write_or(ctx, ctx->i2c.tx_p2_client,
> > +			       AUDIO_CONTROL_REGISTER, 0x80);
> > +	for (i = 0; i < 13; i++)
> > +		ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
> > +					 VIDEO_BIT_MATRIX_12 + i,
> > +					 0x18 + i);
> >  
> > -	return anx7625_reg_write(ctx, client,
> > -				 offset, (val & and_mask) | (or_mask));
> > +	return ret;
> >  }
> >  
> >  static int anx7625_read_ctrl_status_p0(struct anx7625_data *ctx)
> > @@ -221,38 +222,6 @@ static int anx7625_video_mute_control(struct anx7625_data *ctx,
> >  	return ret;
> >  }
> >  
> > -static int anx7625_config_audio_input(struct anx7625_data *ctx)
> > -{
> > -	struct device *dev = &ctx->client->dev;
> > -	int ret;
> > -
> > -	/* Channel num */
> > -	ret = anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
> > -				AUDIO_CHANNEL_STATUS_6, I2S_CH_2 << 5);
> > -
> > -	/* FS */
> > -	ret |= anx7625_write_and_or(ctx, ctx->i2c.tx_p2_client,
> > -				    AUDIO_CHANNEL_STATUS_4,
> > -				    0xf0, AUDIO_FS_48K);
> > -	/* Word length */
> > -	ret |= anx7625_write_and_or(ctx, ctx->i2c.tx_p2_client,
> > -				    AUDIO_CHANNEL_STATUS_5,
> > -				    0xf0, AUDIO_W_LEN_24_24MAX);
> > -	/* I2S */
> > -	ret |= anx7625_write_or(ctx, ctx->i2c.tx_p2_client,
> > -				AUDIO_CHANNEL_STATUS_6, I2S_SLAVE_MODE);
> > -	ret |= anx7625_write_and(ctx, ctx->i2c.tx_p2_client,
> > -				 AUDIO_CONTROL_REGISTER, ~TDM_TIMING_MODE);
> > -	/* Audio change flag */
> > -	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p0_client,
> > -				AP_AV_STATUS, AP_AUDIO_CHG);
> > -
> > -	if (ret < 0)
> > -		DRM_DEV_ERROR(dev, "fail to config audio.\n");
> > -
> > -	return ret;
> > -}
> > -
> >  /* Reduction of fraction a/b */
> >  static void anx7625_reduction_of_a_fraction(unsigned long *a, unsigned long *b)
> >  {
> > @@ -431,7 +400,7 @@ static int anx7625_dsi_video_timing_config(struct anx7625_data *ctx)
> >  	ret |= anx7625_write_and(ctx, ctx->i2c.rx_p1_client,
> >  			MIPI_LANE_CTRL_0, 0xfc);
> >  	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client,
> > -				MIPI_LANE_CTRL_0, 3);
> > +				MIPI_LANE_CTRL_0, ctx->pdata.mipi_lanes - 1);
> >  
> >  	/* Htotal */
> >  	htotal = ctx->dt.hactive.min + ctx->dt.hfront_porch.min +
> > @@ -615,6 +584,76 @@ static int anx7625_dsi_config(struct anx7625_data *ctx)
> >  	return ret;
> >  }
> >  
> > +static int anx7625_api_dpi_config(struct anx7625_data *ctx)
> > +{
> > +	struct device *dev = &ctx->client->dev;
> > +	u16 freq = ctx->dt.pixelclock.min / 1000;
> > +	int ret;
> > +
> > +	/* configure pixel clock */
> > +	ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > +				PIXEL_CLOCK_L, freq & 0xFF);
> > +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > +				 PIXEL_CLOCK_H, (freq >> 8));
> > +
> > +	/* set DPI mode */
> > +	/* set to DPI PLL module sel */
> > +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> > +				 MIPI_DIGITAL_PLL_9, 0x20);
> > +	/* power down MIPI */
> > +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> > +				 MIPI_LANE_CTRL_10, 0x08);
> > +	/* enable DPI mode */
> > +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> > +				 MIPI_DIGITAL_PLL_18, 0x1C);
> > +	/* set first edge */
> > +	ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
> > +				 VIDEO_CONTROL_0, 0x06);
> > +	if (ret < 0)
> > +		DRM_DEV_ERROR(dev, "IO error : dpi phy set failed.\n");
> > +
> > +	return ret;
> > +}
> > +
> > +static int anx7625_dpi_config(struct anx7625_data *ctx)
> > +{
> > +	struct device *dev = &ctx->client->dev;
> > +	int ret;
> > +
> > +	DRM_DEV_DEBUG_DRIVER(dev, "config dpi\n");
> > +
> > +	/* DSC disable */
> > +	ret = anx7625_write_and(ctx, ctx->i2c.rx_p0_client,
> > +				R_DSC_CTRL_0, ~DSC_EN);
> > +	if (ret < 0) {
> > +		DRM_DEV_ERROR(dev, "IO error : disable dsc failed.\n");
> > +		return ret;
> > +	}
> > +
> > +	ret = anx7625_config_bit_matrix(ctx);
> > +	if (ret < 0) {
> > +		DRM_DEV_ERROR(dev, "config bit matrix failed.\n");
> > +		return ret;
> > +	}
> > +
> > +	ret = anx7625_api_dpi_config(ctx);
> > +	if (ret < 0) {
> > +		DRM_DEV_ERROR(dev, "mipi phy(dpi) setup failed.\n");
> > +		return ret;
> > +	}
> > +
> > +	/* set MIPI RX EN */
> > +	ret = anx7625_write_or(ctx, ctx->i2c.rx_p0_client,
> > +			       AP_AV_STATUS, AP_MIPI_RX_EN);
> > +	/* clear mute flag */
> > +	ret |= anx7625_write_and(ctx, ctx->i2c.rx_p0_client,
> > +				 AP_AV_STATUS, (u8)~AP_MIPI_MUTE);
> > +	if (ret < 0)
> > +		DRM_DEV_ERROR(dev, "IO error : enable mipi rx failed.\n");
> > +
> > +	return ret;
> > +}
> > +
> >  static void anx7625_dp_start(struct anx7625_data *ctx)
> >  {
> >  	int ret;
> > @@ -625,9 +664,10 @@ static void anx7625_dp_start(struct anx7625_data *ctx)
> >  		return;
> >  	}
> >  
> > -	anx7625_config_audio_input(ctx);
> > -
> > -	ret = anx7625_dsi_config(ctx);
> > +	if (ctx->pdata.is_dpi)
> > +		ret = anx7625_dpi_config(ctx);
> > +	else
> > +		ret = anx7625_dsi_config(ctx);
> >  
> >  	if (ret < 0)
> >  		DRM_DEV_ERROR(dev, "MIPI phy setup error.\n");
> > @@ -1075,6 +1115,7 @@ static void anx7625_start_dp_work(struct anx7625_data *ctx)
> >  		return;
> >  	}
> >  
> > +	ctx->hpd_status = 1;
> >  	ctx->hpd_high_cnt++;
> >  
> >  	/* Not support HDCP */
> > @@ -1084,8 +1125,10 @@ static void anx7625_start_dp_work(struct anx7625_data *ctx)
> >  	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client, 0xec, 0x10);
> >  	/* Interrupt for DRM */
> >  	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client, 0xff, 0x01);
> > -	if (ret < 0)
> > +	if (ret < 0) {
> > +		DRM_DEV_ERROR(dev, "fail to setting HDCP/auth\n");
> >  		return;
> > +	}
> >  
> >  	ret = anx7625_reg_read(ctx, ctx->i2c.rx_p1_client, 0x86);
> >  	if (ret < 0)
> > @@ -1104,6 +1147,10 @@ static void anx7625_hpd_polling(struct anx7625_data *ctx)
> >  	int ret, val;
> >  	struct device *dev = &ctx->client->dev;
> >  
> > +	/* Interrupt mode, no need poll HPD status, just return */
> > +	if (ctx->pdata.intp_irq)
> > +		return;
> > +
> >  	ret = readx_poll_timeout(anx7625_read_hpd_status_p0,
> >  				 ctx, val,
> >  				 ((val & HPD_STATUS) || (val < 0)),
> > @@ -1131,6 +1178,21 @@ static void anx7625_remove_edid(struct anx7625_data *ctx)
> >  	ctx->slimport_edid_p.edid_block_num = -1;
> >  }
> >  
> > +static void anx7625_dp_adjust_swing(struct anx7625_data *ctx)
> > +{
> > +	int i;
> > +
> > +	for (i = 0; i < ctx->pdata.dp_lane0_swing_reg_cnt; i++)
> > +		anx7625_reg_write(ctx, ctx->i2c.tx_p1_client,
> > +				  DP_TX_LANE0_SWING_REG0 + i,
> > +				  ctx->pdata.lane0_reg_data[i] & 0xFF);
> > +
> > +	for (i = 0; i < ctx->pdata.dp_lane1_swing_reg_cnt; i++)
> > +		anx7625_reg_write(ctx, ctx->i2c.tx_p1_client,
> > +				  DP_TX_LANE1_SWING_REG0 + i,
> > +				  ctx->pdata.lane1_reg_data[i] & 0xFF);
> > +}
> > +
> >  static void dp_hpd_change_handler(struct anx7625_data *ctx, bool on)
> >  {
> >  	struct device *dev = &ctx->client->dev;
> > @@ -1146,9 +1208,8 @@ static void dp_hpd_change_handler(struct anx7625_data *ctx, bool on)
> >  	} else {
> >  		DRM_DEV_DEBUG_DRIVER(dev, " HPD high\n");
> >  		anx7625_start_dp_work(ctx);
> > +		anx7625_dp_adjust_swing(ctx);
> >  	}
> > -
> > -	ctx->hpd_status = 1;
> >  }
> >  
> >  static int anx7625_hpd_change_detect(struct anx7625_data *ctx)
> > @@ -1225,20 +1286,72 @@ static irqreturn_t anx7625_intr_hpd_isr(int irq, void *data)
> >  	return IRQ_HANDLED;
> >  }
> >  
> > +static int anx7625_get_swing_setting(struct device *dev,
> > +				     struct anx7625_platform_data *pdata)
> > +{
> > +	int num_regs;
> > +
> > +	if (of_get_property(dev->of_node,
> > +			    "analogix,lane0-swing", &num_regs)) {
> > +		if (num_regs > DP_TX_SWING_REG_CNT)
> > +			num_regs = DP_TX_SWING_REG_CNT;
> > +
> > +		pdata->dp_lane0_swing_reg_cnt = num_regs;
> > +		of_property_read_u32_array(dev->of_node, "analogix,lane0-swing",
> > +					   pdata->lane0_reg_data, num_regs);
> > +	}
> > +
> > +	if (of_get_property(dev->of_node,
> > +			    "analogix,lane1-swing", &num_regs)) {
> > +		if (num_regs > DP_TX_SWING_REG_CNT)
> > +			num_regs = DP_TX_SWING_REG_CNT;
> > +
> > +		pdata->dp_lane1_swing_reg_cnt = num_regs;
> > +		of_property_read_u32_array(dev->of_node, "analogix,lane1-swing",
> > +					   pdata->lane1_reg_data, num_regs);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  static int anx7625_parse_dt(struct device *dev,
> >  			    struct anx7625_platform_data *pdata)
> >  {
> > -	struct device_node *np = dev->of_node;
> > +	struct device_node *np = dev->of_node, *ep0;
> >  	struct drm_panel *panel;
> >  	int ret;
> > +	int bus_type, mipi_lanes;
> > +
> > +	anx7625_get_swing_setting(dev, pdata);
> >  
> > +	pdata->is_dpi = 1; /* default dpi mode */
> >  	pdata->mipi_host_node = of_graph_get_remote_node(np, 0, 0);
> >  	if (!pdata->mipi_host_node) {
> >  		DRM_DEV_ERROR(dev, "fail to get internal panel.\n");
> >  		return -ENODEV;
> >  	}
> >  
> > -	DRM_DEV_DEBUG_DRIVER(dev, "found dsi host node.\n");
> > +	bus_type = V4L2_FWNODE_BUS_TYPE_PARALLEL;
> > +	mipi_lanes = MAX_LANES_SUPPORT;
> > +	ep0 = of_graph_get_endpoint_by_regs(np, 0, 0);
> > +	if (ep0) {
> > +		if (of_property_read_u32(ep0, "bus-type", &bus_type))
> > +			bus_type = 0;
> > +
> > +		mipi_lanes = of_property_count_u32_elems(ep0, "data-lanes");
> > +	}
> > +
> > +	if (bus_type == V4L2_FWNODE_BUS_TYPE_PARALLEL) /* bus type is Parallel(DSI) */
> 
> This is not correct *at all*. V4L2_FWNODE_BUS_TYPE_PARALLEL has nothing
> to do with DSI. DSI stands for Digital *Serial* Interface. If anything,
> the V4L2_FWNODE_BUS_TYPE_PARALLEL type would map better to DPI, even if
> it's not an exact match.
> 
> This patch has landed in v5.17-rc1, along with the corresponding
> bindings. As DT bindings are an ABI, we should really fix this before
> v5.17 is released. There is no DSI bus types defined in DT, and adding
> one as a fix so late in the v5.17-rc cycle seems a bit of a stretch to
> me (unless Rob disagrees).
> 
> It would seem best to revert this series and the corresponding bindings,
> and retry in v5.18.
Hi, what about make a patch to change this line to:
if (bus_type != V4L2_FWNODE_BUS_TYPE_PARALLEL), and then change the DTS
file?

Thanks,
Xin
> 
> > +		pdata->is_dpi = 0;
> > +
> > +	pdata->mipi_lanes = mipi_lanes;
> > +	if (pdata->mipi_lanes > MAX_LANES_SUPPORT || pdata->mipi_lanes <= 0)
> > +		pdata->mipi_lanes = MAX_LANES_SUPPORT;
> > +
> > +	if (pdata->is_dpi)
> > +		DRM_DEV_DEBUG_DRIVER(dev, "found MIPI DPI host node.\n");
> > +	else
> > +		DRM_DEV_DEBUG_DRIVER(dev, "found MIPI DSI host node.\n");
> >  
> >  	ret = drm_of_find_panel_or_bridge(np, 1, 0, &panel, NULL);
> >  	if (ret < 0) {
> > @@ -1301,9 +1414,13 @@ static enum drm_connector_status anx7625_sink_detect(struct anx7625_data *ctx)
> >  {
> >  	struct device *dev = &ctx->client->dev;
> >  
> > -	DRM_DEV_DEBUG_DRIVER(dev, "sink detect, return connected\n");
> > +	DRM_DEV_DEBUG_DRIVER(dev, "sink detect\n");
> >  
> > -	return connector_status_connected;
> > +	if (ctx->pdata.panel_bridge)
> > +		return connector_status_connected;
> > +
> > +	return ctx->hpd_status ? connector_status_connected :
> > +				     connector_status_disconnected;
> >  }
> >  
> >  static int anx7625_attach_dsi(struct anx7625_data *ctx)
> > @@ -1332,7 +1449,7 @@ static int anx7625_attach_dsi(struct anx7625_data *ctx)
> >  		return -EINVAL;
> >  	}
> >  
> > -	dsi->lanes = 4;
> > +	dsi->lanes = ctx->pdata.mipi_lanes;
> >  	dsi->format = MIPI_DSI_FMT_RGB888;
> >  	dsi->mode_flags = MIPI_DSI_MODE_VIDEO	|
> >  		MIPI_DSI_MODE_VIDEO_SYNC_PULSE	|
> > @@ -1460,6 +1577,10 @@ static bool anx7625_bridge_mode_fixup(struct drm_bridge *bridge,
> >  
> >  	DRM_DEV_DEBUG_DRIVER(dev, "drm mode fixup set\n");
> >  
> > +	/* No need fixup for external monitor */
> > +	if (!ctx->pdata.panel_bridge)
> > +		return true;
> > +
> >  	hsync = mode->hsync_end - mode->hsync_start;
> >  	hfp = mode->hsync_start - mode->hdisplay;
> >  	hbp = mode->htotal - mode->hsync_end;
> > @@ -1835,14 +1956,22 @@ static int anx7625_i2c_probe(struct i2c_client *client,
> >  
> >  	platform->bridge.funcs = &anx7625_bridge_funcs;
> >  	platform->bridge.of_node = client->dev.of_node;
> > -	platform->bridge.ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_HPD;
> > -	platform->bridge.type = DRM_MODE_CONNECTOR_eDP;
> > +	platform->bridge.ops = DRM_BRIDGE_OP_EDID;
> > +	if (!platform->pdata.panel_bridge)
> > +		platform->bridge.ops |= DRM_BRIDGE_OP_HPD |
> > +					DRM_BRIDGE_OP_DETECT;
> > +	platform->bridge.type = platform->pdata.panel_bridge ?
> > +				    DRM_MODE_CONNECTOR_eDP :
> > +				    DRM_MODE_CONNECTOR_DisplayPort;
> > +
> >  	drm_bridge_add(&platform->bridge);
> >  
> > -	ret = anx7625_attach_dsi(platform);
> > -	if (ret) {
> > -		DRM_DEV_ERROR(dev, "Fail to attach to dsi : %d\n", ret);
> > -		goto unregister_bridge;
> > +	if (!platform->pdata.is_dpi) {
> > +		ret = anx7625_attach_dsi(platform);
> > +		if (ret) {
> > +			DRM_DEV_ERROR(dev, "Fail to attach to dsi : %d\n", ret);
> > +			goto unregister_bridge;
> > +		}
> >  	}
> >  
> >  	DRM_DEV_DEBUG_DRIVER(dev, "probe done\n");
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
> > index 6dcf64c703f9..3ef1d8f4e575 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.h
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
> > @@ -141,12 +141,20 @@
> >  #define  HORIZONTAL_BACK_PORCH_H      0x22  /* Bit[7:4] are reserved */
> >  
> >  /******** END of I2C Address 0x72 *********/
> > +
> > +/***************************************************************/
> > +/* Register definition of device address 0x7a */
> > +#define DP_TX_SWING_REG_CNT		0x14
> > +#define DP_TX_LANE0_SWING_REG0		0x00
> > +#define DP_TX_LANE1_SWING_REG0		0x14
> > +/******** END of I2C Address 0x7a *********/
> > +
> >  /***************************************************************/
> >  /* Register definition of device address 0x7e */
> >  
> >  #define  I2C_ADDR_7E_FLASH_CONTROLLER  0x7E
> >  
> > -#define FLASH_LOAD_STA 0x05
> > +#define FLASH_LOAD_STA          0x05
> >  #define FLASH_LOAD_STA_CHK	BIT(7)
> >  
> >  #define  XTAL_FRQ_SEL    0x3F
> > @@ -349,12 +357,20 @@ struct s_edid_data {
> >  
> >  /***************** Display End *****************/
> >  
> > +#define MAX_LANES_SUPPORT	4
> > +
> >  struct anx7625_platform_data {
> >  	struct gpio_desc *gpio_p_on;
> >  	struct gpio_desc *gpio_reset;
> >  	struct regulator_bulk_data supplies[3];
> >  	struct drm_bridge *panel_bridge;
> >  	int intp_irq;
> > +	int is_dpi;
> > +	int mipi_lanes;
> > +	int dp_lane0_swing_reg_cnt;
> > +	int lane0_reg_data[DP_TX_SWING_REG_CNT];
> > +	int dp_lane1_swing_reg_cnt;
> > +	int lane1_reg_data[DP_TX_SWING_REG_CNT];
> >  	u32 low_power_mode;
> >  	struct device_node *mipi_host_node;
> >  };
> 
> -- 
> Regards,
> 
> Laurent Pinchart
