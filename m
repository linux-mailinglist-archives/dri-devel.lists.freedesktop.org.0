Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FB84CF0D2
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 06:10:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA96C10ED66;
	Mon,  7 Mar 2022 05:10:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2101.outbound.protection.outlook.com [40.107.92.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7F4010ED64
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 05:09:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iW6ytXGzFODzv5l4NoHmHr8lm2FiU4k8Lw+EdyK+/hYG8P5MdwlxjbABprLlqoYloRr3kfBNDFvBOz3XgTt7HW3PI9UmfSmguuCzS/z6zYAuTFz1v6fa6sPfXlV6q8ycpWIvNd6e41bVsuUrus1kQZ7mua8KNu5B2Ohh+/C03VUZ6DagPnzQb8cvVI1wc2Im5YSO2HTWVADjBLa/wLOL/cFjGdWTTUUe4ZY/hJca1B6XU/QZbgJZ8PuL2EV3aTa5wttQdJ8fky/LdWBgUCJKY8u57EwvoEedjQkLhrrnu+ux0WKef1ZoQU8Tk+IXg2AlIzgllzYy6z2+cwH5Xn4vEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rL3k1zYyok+37rDH0cDqiBlZJn9gxyBSrAX3tsIdzCI=;
 b=Nr/DXkTu6fpLi2ezkJCLroYN051pAOPDE4bzHIbLzb6MgXatdcWEzOlRcJrCASKVSiizLNbU4E3NO6CKkrPJ7SwdLiHG83e5Y2uElj55zsVkca42dIvKIcpAHNY0J5iBs30YRXh/+SmXC9z/Cc25/BbetaYucJj8eb6NT7VnJrDbYxSFXAK1rBInSVS0TKTxnOFuiPZeBMWLzsjscjYY76yEPEfuBoPUzzwfAMBgYdtbWGuLoWYMKCtMyh31WKd/oPVQHNIMNp64AhsiFldV7cK5pkKP7UAYDTKF08pFy9fr92aOBlOq6cZ1tG2OLDZPyO80OkstQd8hY80/7GlWxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rL3k1zYyok+37rDH0cDqiBlZJn9gxyBSrAX3tsIdzCI=;
 b=TGtkz6T5xcViNEmCjsZefIvkuR7W6FIOoGdQ2OHulI9Ql7mwn7AHOQ4xo+Gp3MDkdcGq3kLrCoB9viJ969E4hP/6Ixouuxk3b8ZMWjPo+rIxrdhRssz8eByl+v7eSmZa+p8hRJR91KpmnSbfulTPVngdPkgj9ywcOZ+6N/bMijM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by CH2PR04MB6601.namprd04.prod.outlook.com (2603:10b6:610:6d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Mon, 7 Mar
 2022 05:09:55 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::a865:6d10:c4a9:1142]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::a865:6d10:c4a9:1142%9]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 05:09:54 +0000
Date: Mon, 7 Mar 2022 13:09:45 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v12 3/4] drm/bridge: anx7625: add MIPI DPI input feature
Message-ID: <20220307050945.GA4174176@anxtwsw-Precision-3640-Tower>
References: <20211105031904.2641088-1-xji@analogixsemi.com>
 <20211105031904.2641088-3-xji@analogixsemi.com>
 <YiTruiCIkyxs3jTC@pendragon.ideasonboard.com>
 <20220307032248.GA4173850@anxtwsw-Precision-3640-Tower>
 <YiV8QX+9jszI1uEO@pendragon.ideasonboard.com>
 <20220307043249.GA4174029@anxtwsw-Precision-3640-Tower>
 <YiWOcOGIUGO0OrlO@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YiWOcOGIUGO0OrlO@pendragon.ideasonboard.com>
X-ClientProxiedBy: SG2PR0601CA0019.apcprd06.prod.outlook.com (2603:1096:3::29)
 To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9be1ea47-dcfe-49b1-4f30-08d9fff8b755
X-MS-TrafficTypeDiagnostic: CH2PR04MB6601:EE_
X-Microsoft-Antispam-PRVS: <CH2PR04MB660138CB07EAAACF4E021FF7C7089@CH2PR04MB6601.namprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j3votNr3Cl06rX2ZHHblK12t9kUps6woUfnejU6/w/WFChwkhP7yA5C4j3LQ433W0hbXl1lHkQcjXFrLgAAct7pqcpRoJxa6JKQp1VpjTz1ZebrstgHUQWw8ldLMctHkWqT9oytP+fATA5BVmX9j3cscLcpiq4N9Pa+k90/OiR3EpY4Ry3t9NRFrbyMYjPVNY8hZAPiH2EBTO6giju2/TnzSe51IGE31HglLsE4Db/gRzcJPW3WPzbZhwn4YDmqwsD4Uf9Dp6sfzqLdjBk9tZsar2grtxAXY/I9Tup9khM+yfvFJiJ1MUMfLNFswwsgOFs1HkAcl0ENNs7ebQzNNQT0lRO/Tlk3liaPTGHHtKHCMhCkbm/OhasVYsewnhP3Y2nt/eAG0EpzwTZL5P3Y5eETLeZ5RQ3CUobOagZabOsGJj75NBtU7JZz+tWronb51uj+++mwCBQL6D4ytrlxnBCzzCEzmFd+Md5oF1ZkT98tbVv0rXoYNlHHZJR2E6mLzqwtXiWtxg/aGEXW4eQ3lQ/K+Pds591lC3udBu/5khskKQFOrWUmlEsSoToBSJegZAQHK9nz9/nejjJYisuWlmSOnazsO0xnjcHxPvSD/CThv05I6wXdSw/RLBe5KnU8Hb4e5cbxhAK+3fKSJWe3kVKH2qAXOcJZGGUH4DvCXk213lA8yeyqAKoT6FfUuELvjY7aI6+rQYWK4FgqNgYOs1w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(66556008)(4326008)(26005)(8936002)(55236004)(6666004)(66946007)(8676002)(66476007)(7416002)(6916009)(5660300002)(186003)(83380400001)(52116002)(30864003)(1076003)(6486002)(86362001)(2906002)(6506007)(6512007)(9686003)(498600001)(33656002)(33716001)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Aa4hcPeNHsd4XNqCzXDAzWFnZgk006iuGITFVRp28n7HCyaxNOcjIa21dqH6?=
 =?us-ascii?Q?tAe0PZhru6oEs3nx6NKrIyiC5f/3QUadaLkBtAYi1uxLFTq01jr+5z/jgoIK?=
 =?us-ascii?Q?bAdF9TVgRQ8/DLGV3l9VUk3FEvujX13c8jRnRZ8RSK2wZ4UWw1wV4kwG13/N?=
 =?us-ascii?Q?R1L8CVsuLTjVqTVjl7hWIdRq8mGCy5ozK0CnUmuxqVCaaYFCB8y49mmHNNxX?=
 =?us-ascii?Q?q/kCqCl84Xmseaq0C62GQcIc8Hpi32I1THsW9N4lCuCfdQ6W078rsKvFxaUl?=
 =?us-ascii?Q?Z5b9uKaVWzXQ0M2KSeuZuhAmWnNIeWGJecG/YwibXWGq7MA+xLZ+5G2H7i+6?=
 =?us-ascii?Q?8u2Y3yFt6XM4wfjeJ/GhR8D5Sg4g+/GSWuPI/vCnXVcYfqAZxCTdPe4YZXId?=
 =?us-ascii?Q?yTHtyy+73Ave/7Z+80NJvckaHbUMkPLG2/dnGNnjWN456K4dTk5sPp4BXBPX?=
 =?us-ascii?Q?jaDdB/0F8ou3mdAPq5abKAPJ2JE+VuLPzEa1l+ZObG4I1On1it5fh1O+ZNbS?=
 =?us-ascii?Q?k6vX5VAinSM0negHTM/K+JqwTTdfMD3PFQHqLcF8FtuKgjkXlb6IIlwmxJfA?=
 =?us-ascii?Q?ZfGQNqYGf3hDhOS/kOaCKFCORSF/xFiPM0wllcgT7vUdiNLzLJZOvA3xPkRX?=
 =?us-ascii?Q?7MCE8uh95OUt4Pswaat1e37dfrEChNf81fKJXykAUl1NDziWoJ+at7G/kXA0?=
 =?us-ascii?Q?hzZXiVzmInTpH0bfdzP2LHUUjFZ4PSvdmR7CO5H1o0ZYSHMSDGsQCkrAzv+S?=
 =?us-ascii?Q?5uZPmSotLogfaO3S453lXeAx/necMUyM/mSFkPP3SjTnPmOQ1HiMZEXI10h6?=
 =?us-ascii?Q?5T0j2EcVvLXaLjV8+qd0msLC5ab9Pqm+n78vrY5vOKeMlvlvSCJEGGHFdf3y?=
 =?us-ascii?Q?cQCtCA9oGesDg0UhxzuBdMuznsKvbjKrSWAloFrEIaCuxwKDfjC33J1gsF4/?=
 =?us-ascii?Q?nEGZxHNqDH2x8aek9G+1jmslMWKwpu0m6ceqAQ9RnE/Mj1qUjOtokjNU/Mde?=
 =?us-ascii?Q?QfslEE5OrptqSfen2PPzbaCyMYWyunobMATjL6qRZpORBXQP06h+VmG7Tu0x?=
 =?us-ascii?Q?945Oy8W7iwIqOU4ZLL3+WNYdJT8VOii5x9o8z5Tn4uNCpO8bQdxPvRrtxRDb?=
 =?us-ascii?Q?tZZJylnSoIcsa2c7hbfClqlTz+R3aQds8h82Cs0LZcqCAWhurFKEBKVtW961?=
 =?us-ascii?Q?+fvL8TC/hbQa9evupvi6HM46O/0DB1nzDxkiFLihMQ+tziEEWMVDVMFcUSp6?=
 =?us-ascii?Q?7X6dmEyYmgnR73j7sBW+xG7K2r4djGwfDrVkET+TNRgjJ23mYROki/Y/ftB9?=
 =?us-ascii?Q?C+O3TSYk5FkPNNmw2bRYiqSHesG4pzB7Ix/6wZs0AOArJbaqZAZ9y+SP7ysU?=
 =?us-ascii?Q?aYpD/Ruiz6T0TYv7ZrO/bn239/dWT1inrh7P0umTvsjqxPvLKTw7neLj6wvI?=
 =?us-ascii?Q?EnpT4CmsQsUkCSbzKjDngCQ5jec1ryvvBBtLvB+RseA55EY1MNqkxxPGsSHn?=
 =?us-ascii?Q?DqdDQeR5yJbLp9D72uRDZfdTyA5ZsPBy9reivnxySVK29OYHCtKwKu/KDgRp?=
 =?us-ascii?Q?dSimui93zND6Rdp4F4z+K6pehIPr7B0EuQwRV6e9RsqEr9/WWPUKdv2CTmnB?=
 =?us-ascii?Q?a7FLu3LrrP2CGQilYWGMpGw=3D?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9be1ea47-dcfe-49b1-4f30-08d9fff8b755
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 05:09:54.6659 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1NbrKjnANw8HRiJlZAmBjsEOc96g6JjJYUjN4xk8KpVKSUnPzf+lAeiyvGA6bpGmFdImrgmtuouNdMoAIgmY2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6601
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

On Mon, Mar 07, 2022 at 06:47:44AM +0200, Laurent Pinchart wrote:
> Hello Xin,
> 
> On Mon, Mar 07, 2022 at 12:32:49PM +0800, Xin Ji wrote:
> > On Mon, Mar 07, 2022 at 05:30:09AM +0200, Laurent Pinchart wrote:
> > > On Mon, Mar 07, 2022 at 11:22:48AM +0800, Xin Ji wrote:
> > > > On Sun, Mar 06, 2022 at 07:13:30PM +0200, Laurent Pinchart wrote:
> > > > > Hello Xin,
> > > > > 
> > > > > (Question for Rob below, and I'm afraid this is urgent as we need to
> > > > > merge a fix in v5.17).
> > > > > 
> > > > > On Fri, Nov 05, 2021 at 11:19:03AM +0800, Xin Ji wrote:
> > > > > > The basic anx7625 driver only support MIPI DSI rx signal input.
> > > > > > This patch add MIPI DPI rx input configuration support, after apply
> > > > > > this patch, the driver can support DSI rx or DPI rx by adding
> > > > > > 'bus-type' in DT.
> > > > > > 
> > > > > > Reviewed-by: Robert Foss <robert.foss@linaro.org>
> > > > > > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/bridge/analogix/anx7625.c | 247 ++++++++++++++++------
> > > > > >  drivers/gpu/drm/bridge/analogix/anx7625.h |  18 +-
> > > > > >  2 files changed, 205 insertions(+), 60 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > > > index f48e91134c20..f7c3386c8929 100644
> > > > > > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > > > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > > > @@ -32,6 +32,7 @@
> > > > > >  #include <drm/drm_print.h>
> > > > > >  #include <drm/drm_probe_helper.h>
> > > > > >  
> > > > > > +#include <media/v4l2-fwnode.h>
> > > > > >  #include <video/display_timing.h>
> > > > > >  
> > > > > >  #include "anx7625.h"
> > > > > > @@ -152,18 +153,18 @@ static int anx7625_write_and(struct anx7625_data *ctx,
> > > > > >  	return anx7625_reg_write(ctx, client, offset, (val & (mask)));
> > > > > >  }
> > > > > >  
> > > > > > -static int anx7625_write_and_or(struct anx7625_data *ctx,
> > > > > > -				struct i2c_client *client,
> > > > > > -				u8 offset, u8 and_mask, u8 or_mask)
> > > > > > +static int anx7625_config_bit_matrix(struct anx7625_data *ctx)
> > > > > >  {
> > > > > > -	int val;
> > > > > > +	int i, ret;
> > > > > >  
> > > > > > -	val = anx7625_reg_read(ctx, client, offset);
> > > > > > -	if (val < 0)
> > > > > > -		return val;
> > > > > > +	ret = anx7625_write_or(ctx, ctx->i2c.tx_p2_client,
> > > > > > +			       AUDIO_CONTROL_REGISTER, 0x80);
> > > > > > +	for (i = 0; i < 13; i++)
> > > > > > +		ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
> > > > > > +					 VIDEO_BIT_MATRIX_12 + i,
> > > > > > +					 0x18 + i);
> > > > > >  
> > > > > > -	return anx7625_reg_write(ctx, client,
> > > > > > -				 offset, (val & and_mask) | (or_mask));
> > > > > > +	return ret;
> > > > > >  }
> > > > > >  
> > > > > >  static int anx7625_read_ctrl_status_p0(struct anx7625_data *ctx)
> > > > > > @@ -221,38 +222,6 @@ static int anx7625_video_mute_control(struct anx7625_data *ctx,
> > > > > >  	return ret;
> > > > > >  }
> > > > > >  
> > > > > > -static int anx7625_config_audio_input(struct anx7625_data *ctx)
> > > > > > -{
> > > > > > -	struct device *dev = &ctx->client->dev;
> > > > > > -	int ret;
> > > > > > -
> > > > > > -	/* Channel num */
> > > > > > -	ret = anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
> > > > > > -				AUDIO_CHANNEL_STATUS_6, I2S_CH_2 << 5);
> > > > > > -
> > > > > > -	/* FS */
> > > > > > -	ret |= anx7625_write_and_or(ctx, ctx->i2c.tx_p2_client,
> > > > > > -				    AUDIO_CHANNEL_STATUS_4,
> > > > > > -				    0xf0, AUDIO_FS_48K);
> > > > > > -	/* Word length */
> > > > > > -	ret |= anx7625_write_and_or(ctx, ctx->i2c.tx_p2_client,
> > > > > > -				    AUDIO_CHANNEL_STATUS_5,
> > > > > > -				    0xf0, AUDIO_W_LEN_24_24MAX);
> > > > > > -	/* I2S */
> > > > > > -	ret |= anx7625_write_or(ctx, ctx->i2c.tx_p2_client,
> > > > > > -				AUDIO_CHANNEL_STATUS_6, I2S_SLAVE_MODE);
> > > > > > -	ret |= anx7625_write_and(ctx, ctx->i2c.tx_p2_client,
> > > > > > -				 AUDIO_CONTROL_REGISTER, ~TDM_TIMING_MODE);
> > > > > > -	/* Audio change flag */
> > > > > > -	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p0_client,
> > > > > > -				AP_AV_STATUS, AP_AUDIO_CHG);
> > > > > > -
> > > > > > -	if (ret < 0)
> > > > > > -		DRM_DEV_ERROR(dev, "fail to config audio.\n");
> > > > > > -
> > > > > > -	return ret;
> > > > > > -}
> > > > > > -
> > > > > >  /* Reduction of fraction a/b */
> > > > > >  static void anx7625_reduction_of_a_fraction(unsigned long *a, unsigned long *b)
> > > > > >  {
> > > > > > @@ -431,7 +400,7 @@ static int anx7625_dsi_video_timing_config(struct anx7625_data *ctx)
> > > > > >  	ret |= anx7625_write_and(ctx, ctx->i2c.rx_p1_client,
> > > > > >  			MIPI_LANE_CTRL_0, 0xfc);
> > > > > >  	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client,
> > > > > > -				MIPI_LANE_CTRL_0, 3);
> > > > > > +				MIPI_LANE_CTRL_0, ctx->pdata.mipi_lanes - 1);
> > > > > >  
> > > > > >  	/* Htotal */
> > > > > >  	htotal = ctx->dt.hactive.min + ctx->dt.hfront_porch.min +
> > > > > > @@ -615,6 +584,76 @@ static int anx7625_dsi_config(struct anx7625_data *ctx)
> > > > > >  	return ret;
> > > > > >  }
> > > > > >  
> > > > > > +static int anx7625_api_dpi_config(struct anx7625_data *ctx)
> > > > > > +{
> > > > > > +	struct device *dev = &ctx->client->dev;
> > > > > > +	u16 freq = ctx->dt.pixelclock.min / 1000;
> > > > > > +	int ret;
> > > > > > +
> > > > > > +	/* configure pixel clock */
> > > > > > +	ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > > > > +				PIXEL_CLOCK_L, freq & 0xFF);
> > > > > > +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > > > > +				 PIXEL_CLOCK_H, (freq >> 8));
> > > > > > +
> > > > > > +	/* set DPI mode */
> > > > > > +	/* set to DPI PLL module sel */
> > > > > > +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> > > > > > +				 MIPI_DIGITAL_PLL_9, 0x20);
> > > > > > +	/* power down MIPI */
> > > > > > +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> > > > > > +				 MIPI_LANE_CTRL_10, 0x08);
> > > > > > +	/* enable DPI mode */
> > > > > > +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> > > > > > +				 MIPI_DIGITAL_PLL_18, 0x1C);
> > > > > > +	/* set first edge */
> > > > > > +	ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
> > > > > > +				 VIDEO_CONTROL_0, 0x06);
> > > > > > +	if (ret < 0)
> > > > > > +		DRM_DEV_ERROR(dev, "IO error : dpi phy set failed.\n");
> > > > > > +
> > > > > > +	return ret;
> > > > > > +}
> > > > > > +
> > > > > > +static int anx7625_dpi_config(struct anx7625_data *ctx)
> > > > > > +{
> > > > > > +	struct device *dev = &ctx->client->dev;
> > > > > > +	int ret;
> > > > > > +
> > > > > > +	DRM_DEV_DEBUG_DRIVER(dev, "config dpi\n");
> > > > > > +
> > > > > > +	/* DSC disable */
> > > > > > +	ret = anx7625_write_and(ctx, ctx->i2c.rx_p0_client,
> > > > > > +				R_DSC_CTRL_0, ~DSC_EN);
> > > > > > +	if (ret < 0) {
> > > > > > +		DRM_DEV_ERROR(dev, "IO error : disable dsc failed.\n");
> > > > > > +		return ret;
> > > > > > +	}
> > > > > > +
> > > > > > +	ret = anx7625_config_bit_matrix(ctx);
> > > > > > +	if (ret < 0) {
> > > > > > +		DRM_DEV_ERROR(dev, "config bit matrix failed.\n");
> > > > > > +		return ret;
> > > > > > +	}
> > > > > > +
> > > > > > +	ret = anx7625_api_dpi_config(ctx);
> > > > > > +	if (ret < 0) {
> > > > > > +		DRM_DEV_ERROR(dev, "mipi phy(dpi) setup failed.\n");
> > > > > > +		return ret;
> > > > > > +	}
> > > > > > +
> > > > > > +	/* set MIPI RX EN */
> > > > > > +	ret = anx7625_write_or(ctx, ctx->i2c.rx_p0_client,
> > > > > > +			       AP_AV_STATUS, AP_MIPI_RX_EN);
> > > > > > +	/* clear mute flag */
> > > > > > +	ret |= anx7625_write_and(ctx, ctx->i2c.rx_p0_client,
> > > > > > +				 AP_AV_STATUS, (u8)~AP_MIPI_MUTE);
> > > > > > +	if (ret < 0)
> > > > > > +		DRM_DEV_ERROR(dev, "IO error : enable mipi rx failed.\n");
> > > > > > +
> > > > > > +	return ret;
> > > > > > +}
> > > > > > +
> > > > > >  static void anx7625_dp_start(struct anx7625_data *ctx)
> > > > > >  {
> > > > > >  	int ret;
> > > > > > @@ -625,9 +664,10 @@ static void anx7625_dp_start(struct anx7625_data *ctx)
> > > > > >  		return;
> > > > > >  	}
> > > > > >  
> > > > > > -	anx7625_config_audio_input(ctx);
> > > > > > -
> > > > > > -	ret = anx7625_dsi_config(ctx);
> > > > > > +	if (ctx->pdata.is_dpi)
> > > > > > +		ret = anx7625_dpi_config(ctx);
> > > > > > +	else
> > > > > > +		ret = anx7625_dsi_config(ctx);
> > > > > >  
> > > > > >  	if (ret < 0)
> > > > > >  		DRM_DEV_ERROR(dev, "MIPI phy setup error.\n");
> > > > > > @@ -1075,6 +1115,7 @@ static void anx7625_start_dp_work(struct anx7625_data *ctx)
> > > > > >  		return;
> > > > > >  	}
> > > > > >  
> > > > > > +	ctx->hpd_status = 1;
> > > > > >  	ctx->hpd_high_cnt++;
> > > > > >  
> > > > > >  	/* Not support HDCP */
> > > > > > @@ -1084,8 +1125,10 @@ static void anx7625_start_dp_work(struct anx7625_data *ctx)
> > > > > >  	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client, 0xec, 0x10);
> > > > > >  	/* Interrupt for DRM */
> > > > > >  	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client, 0xff, 0x01);
> > > > > > -	if (ret < 0)
> > > > > > +	if (ret < 0) {
> > > > > > +		DRM_DEV_ERROR(dev, "fail to setting HDCP/auth\n");
> > > > > >  		return;
> > > > > > +	}
> > > > > >  
> > > > > >  	ret = anx7625_reg_read(ctx, ctx->i2c.rx_p1_client, 0x86);
> > > > > >  	if (ret < 0)
> > > > > > @@ -1104,6 +1147,10 @@ static void anx7625_hpd_polling(struct anx7625_data *ctx)
> > > > > >  	int ret, val;
> > > > > >  	struct device *dev = &ctx->client->dev;
> > > > > >  
> > > > > > +	/* Interrupt mode, no need poll HPD status, just return */
> > > > > > +	if (ctx->pdata.intp_irq)
> > > > > > +		return;
> > > > > > +
> > > > > >  	ret = readx_poll_timeout(anx7625_read_hpd_status_p0,
> > > > > >  				 ctx, val,
> > > > > >  				 ((val & HPD_STATUS) || (val < 0)),
> > > > > > @@ -1131,6 +1178,21 @@ static void anx7625_remove_edid(struct anx7625_data *ctx)
> > > > > >  	ctx->slimport_edid_p.edid_block_num = -1;
> > > > > >  }
> > > > > >  
> > > > > > +static void anx7625_dp_adjust_swing(struct anx7625_data *ctx)
> > > > > > +{
> > > > > > +	int i;
> > > > > > +
> > > > > > +	for (i = 0; i < ctx->pdata.dp_lane0_swing_reg_cnt; i++)
> > > > > > +		anx7625_reg_write(ctx, ctx->i2c.tx_p1_client,
> > > > > > +				  DP_TX_LANE0_SWING_REG0 + i,
> > > > > > +				  ctx->pdata.lane0_reg_data[i] & 0xFF);
> > > > > > +
> > > > > > +	for (i = 0; i < ctx->pdata.dp_lane1_swing_reg_cnt; i++)
> > > > > > +		anx7625_reg_write(ctx, ctx->i2c.tx_p1_client,
> > > > > > +				  DP_TX_LANE1_SWING_REG0 + i,
> > > > > > +				  ctx->pdata.lane1_reg_data[i] & 0xFF);
> > > > > > +}
> > > > > > +
> > > > > >  static void dp_hpd_change_handler(struct anx7625_data *ctx, bool on)
> > > > > >  {
> > > > > >  	struct device *dev = &ctx->client->dev;
> > > > > > @@ -1146,9 +1208,8 @@ static void dp_hpd_change_handler(struct anx7625_data *ctx, bool on)
> > > > > >  	} else {
> > > > > >  		DRM_DEV_DEBUG_DRIVER(dev, " HPD high\n");
> > > > > >  		anx7625_start_dp_work(ctx);
> > > > > > +		anx7625_dp_adjust_swing(ctx);
> > > > > >  	}
> > > > > > -
> > > > > > -	ctx->hpd_status = 1;
> > > > > >  }
> > > > > >  
> > > > > >  static int anx7625_hpd_change_detect(struct anx7625_data *ctx)
> > > > > > @@ -1225,20 +1286,72 @@ static irqreturn_t anx7625_intr_hpd_isr(int irq, void *data)
> > > > > >  	return IRQ_HANDLED;
> > > > > >  }
> > > > > >  
> > > > > > +static int anx7625_get_swing_setting(struct device *dev,
> > > > > > +				     struct anx7625_platform_data *pdata)
> > > > > > +{
> > > > > > +	int num_regs;
> > > > > > +
> > > > > > +	if (of_get_property(dev->of_node,
> > > > > > +			    "analogix,lane0-swing", &num_regs)) {
> > > > > > +		if (num_regs > DP_TX_SWING_REG_CNT)
> > > > > > +			num_regs = DP_TX_SWING_REG_CNT;
> > > > > > +
> > > > > > +		pdata->dp_lane0_swing_reg_cnt = num_regs;
> > > > > > +		of_property_read_u32_array(dev->of_node, "analogix,lane0-swing",
> > > > > > +					   pdata->lane0_reg_data, num_regs);
> > > > > > +	}
> > > > > > +
> > > > > > +	if (of_get_property(dev->of_node,
> > > > > > +			    "analogix,lane1-swing", &num_regs)) {
> > > > > > +		if (num_regs > DP_TX_SWING_REG_CNT)
> > > > > > +			num_regs = DP_TX_SWING_REG_CNT;
> > > > > > +
> > > > > > +		pdata->dp_lane1_swing_reg_cnt = num_regs;
> > > > > > +		of_property_read_u32_array(dev->of_node, "analogix,lane1-swing",
> > > > > > +					   pdata->lane1_reg_data, num_regs);
> > > > > > +	}
> > > > > > +
> > > > > > +	return 0;
> > > > > > +}
> > > > > > +
> > > > > >  static int anx7625_parse_dt(struct device *dev,
> > > > > >  			    struct anx7625_platform_data *pdata)
> > > > > >  {
> > > > > > -	struct device_node *np = dev->of_node;
> > > > > > +	struct device_node *np = dev->of_node, *ep0;
> > > > > >  	struct drm_panel *panel;
> > > > > >  	int ret;
> > > > > > +	int bus_type, mipi_lanes;
> > > > > > +
> > > > > > +	anx7625_get_swing_setting(dev, pdata);
> > > > > >  
> > > > > > +	pdata->is_dpi = 1; /* default dpi mode */
> > > > > >  	pdata->mipi_host_node = of_graph_get_remote_node(np, 0, 0);
> > > > > >  	if (!pdata->mipi_host_node) {
> > > > > >  		DRM_DEV_ERROR(dev, "fail to get internal panel.\n");
> > > > > >  		return -ENODEV;
> > > > > >  	}
> > > > > >  
> > > > > > -	DRM_DEV_DEBUG_DRIVER(dev, "found dsi host node.\n");
> > > > > > +	bus_type = V4L2_FWNODE_BUS_TYPE_PARALLEL;
> > > > > > +	mipi_lanes = MAX_LANES_SUPPORT;
> > > > > > +	ep0 = of_graph_get_endpoint_by_regs(np, 0, 0);
> > > > > > +	if (ep0) {
> > > > > > +		if (of_property_read_u32(ep0, "bus-type", &bus_type))
> > > > > > +			bus_type = 0;
> > > > > > +
> > > > > > +		mipi_lanes = of_property_count_u32_elems(ep0, "data-lanes");
> > > > > > +	}
> > > > > > +
> > > > > > +	if (bus_type == V4L2_FWNODE_BUS_TYPE_PARALLEL) /* bus type is Parallel(DSI) */
> > > > > 
> > > > > This is not correct *at all*. V4L2_FWNODE_BUS_TYPE_PARALLEL has nothing
> > > > > to do with DSI. DSI stands for Digital *Serial* Interface. If anything,
> > > > > the V4L2_FWNODE_BUS_TYPE_PARALLEL type would map better to DPI, even if
> > > > > it's not an exact match.
> > > > > 
> > > > > This patch has landed in v5.17-rc1, along with the corresponding
> > > > > bindings. As DT bindings are an ABI, we should really fix this before
> > > > > v5.17 is released. There is no DSI bus types defined in DT, and adding
> > > > > one as a fix so late in the v5.17-rc cycle seems a bit of a stretch to
> > > > > me (unless Rob disagrees).
> > > > > 
> > > > > It would seem best to revert this series and the corresponding bindings,
> > > > > and retry in v5.18.
> > > >
> > > > Hi, what about make a patch to change this line to:
> > > > if (bus_type != V4L2_FWNODE_BUS_TYPE_PARALLEL), and then change the DTS
> > > > file?
> > > 
> > > We could possibly use V4L2_FWNODE_BUS_TYPE_PARALLEL (5) for MIPI DPI
> > > (although it's not a very accurate match, so a different type may be
> > > better, this should be discussed), but V4L2_FWNODE_BUS_TYPE_CCP2 (1) is
> > > definitely not appropriate for DSI. For that we need a new type, and I
> > > don't think it should be rushed in v5.17.
> >
> > Hi Laurent Pinchart, what should I do now? Do you mean upload a bug fix
> > patch after kernel defined a new type(DPI and DSI) in new kernel?
> 
> I think fixing this properly requires defining at least a new bus type
> for DSI. As this can't be done in v5.17, the best option seems to revert
> this series now as a fix for v5?.17, and submit a new version for v5.18,
> with a patch to add a DSI bus type.
> 
> Any opinion from Rob (Herring and Foss) ?
Hi all, the problem is Chromium OS product depends on this
patch and other patches(which is depends on this patch). It may have
some risk if redefine the 'bus-type' property for sold out Chromium PC.

Thanks,
Xin

> 
> > > > > > +		pdata->is_dpi = 0;
> > > > > > +
> > > > > > +	pdata->mipi_lanes = mipi_lanes;
> > > > > > +	if (pdata->mipi_lanes > MAX_LANES_SUPPORT || pdata->mipi_lanes <= 0)
> > > > > > +		pdata->mipi_lanes = MAX_LANES_SUPPORT;
> > > > > > +
> > > > > > +	if (pdata->is_dpi)
> > > > > > +		DRM_DEV_DEBUG_DRIVER(dev, "found MIPI DPI host node.\n");
> > > > > > +	else
> > > > > > +		DRM_DEV_DEBUG_DRIVER(dev, "found MIPI DSI host node.\n");
> > > > > >  
> > > > > >  	ret = drm_of_find_panel_or_bridge(np, 1, 0, &panel, NULL);
> > > > > >  	if (ret < 0) {
> > > > > > @@ -1301,9 +1414,13 @@ static enum drm_connector_status anx7625_sink_detect(struct anx7625_data *ctx)
> > > > > >  {
> > > > > >  	struct device *dev = &ctx->client->dev;
> > > > > >  
> > > > > > -	DRM_DEV_DEBUG_DRIVER(dev, "sink detect, return connected\n");
> > > > > > +	DRM_DEV_DEBUG_DRIVER(dev, "sink detect\n");
> > > > > >  
> > > > > > -	return connector_status_connected;
> > > > > > +	if (ctx->pdata.panel_bridge)
> > > > > > +		return connector_status_connected;
> > > > > > +
> > > > > > +	return ctx->hpd_status ? connector_status_connected :
> > > > > > +				     connector_status_disconnected;
> > > > > >  }
> > > > > >  
> > > > > >  static int anx7625_attach_dsi(struct anx7625_data *ctx)
> > > > > > @@ -1332,7 +1449,7 @@ static int anx7625_attach_dsi(struct anx7625_data *ctx)
> > > > > >  		return -EINVAL;
> > > > > >  	}
> > > > > >  
> > > > > > -	dsi->lanes = 4;
> > > > > > +	dsi->lanes = ctx->pdata.mipi_lanes;
> > > > > >  	dsi->format = MIPI_DSI_FMT_RGB888;
> > > > > >  	dsi->mode_flags = MIPI_DSI_MODE_VIDEO	|
> > > > > >  		MIPI_DSI_MODE_VIDEO_SYNC_PULSE	|
> > > > > > @@ -1460,6 +1577,10 @@ static bool anx7625_bridge_mode_fixup(struct drm_bridge *bridge,
> > > > > >  
> > > > > >  	DRM_DEV_DEBUG_DRIVER(dev, "drm mode fixup set\n");
> > > > > >  
> > > > > > +	/* No need fixup for external monitor */
> > > > > > +	if (!ctx->pdata.panel_bridge)
> > > > > > +		return true;
> > > > > > +
> > > > > >  	hsync = mode->hsync_end - mode->hsync_start;
> > > > > >  	hfp = mode->hsync_start - mode->hdisplay;
> > > > > >  	hbp = mode->htotal - mode->hsync_end;
> > > > > > @@ -1835,14 +1956,22 @@ static int anx7625_i2c_probe(struct i2c_client *client,
> > > > > >  
> > > > > >  	platform->bridge.funcs = &anx7625_bridge_funcs;
> > > > > >  	platform->bridge.of_node = client->dev.of_node;
> > > > > > -	platform->bridge.ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_HPD;
> > > > > > -	platform->bridge.type = DRM_MODE_CONNECTOR_eDP;
> > > > > > +	platform->bridge.ops = DRM_BRIDGE_OP_EDID;
> > > > > > +	if (!platform->pdata.panel_bridge)
> > > > > > +		platform->bridge.ops |= DRM_BRIDGE_OP_HPD |
> > > > > > +					DRM_BRIDGE_OP_DETECT;
> > > > > > +	platform->bridge.type = platform->pdata.panel_bridge ?
> > > > > > +				    DRM_MODE_CONNECTOR_eDP :
> > > > > > +				    DRM_MODE_CONNECTOR_DisplayPort;
> > > > > > +
> > > > > >  	drm_bridge_add(&platform->bridge);
> > > > > >  
> > > > > > -	ret = anx7625_attach_dsi(platform);
> > > > > > -	if (ret) {
> > > > > > -		DRM_DEV_ERROR(dev, "Fail to attach to dsi : %d\n", ret);
> > > > > > -		goto unregister_bridge;
> > > > > > +	if (!platform->pdata.is_dpi) {
> > > > > > +		ret = anx7625_attach_dsi(platform);
> > > > > > +		if (ret) {
> > > > > > +			DRM_DEV_ERROR(dev, "Fail to attach to dsi : %d\n", ret);
> > > > > > +			goto unregister_bridge;
> > > > > > +		}
> > > > > >  	}
> > > > > >  
> > > > > >  	DRM_DEV_DEBUG_DRIVER(dev, "probe done\n");
> > > > > > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
> > > > > > index 6dcf64c703f9..3ef1d8f4e575 100644
> > > > > > --- a/drivers/gpu/drm/bridge/analogix/anx7625.h
> > > > > > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
> > > > > > @@ -141,12 +141,20 @@
> > > > > >  #define  HORIZONTAL_BACK_PORCH_H      0x22  /* Bit[7:4] are reserved */
> > > > > >  
> > > > > >  /******** END of I2C Address 0x72 *********/
> > > > > > +
> > > > > > +/***************************************************************/
> > > > > > +/* Register definition of device address 0x7a */
> > > > > > +#define DP_TX_SWING_REG_CNT		0x14
> > > > > > +#define DP_TX_LANE0_SWING_REG0		0x00
> > > > > > +#define DP_TX_LANE1_SWING_REG0		0x14
> > > > > > +/******** END of I2C Address 0x7a *********/
> > > > > > +
> > > > > >  /***************************************************************/
> > > > > >  /* Register definition of device address 0x7e */
> > > > > >  
> > > > > >  #define  I2C_ADDR_7E_FLASH_CONTROLLER  0x7E
> > > > > >  
> > > > > > -#define FLASH_LOAD_STA 0x05
> > > > > > +#define FLASH_LOAD_STA          0x05
> > > > > >  #define FLASH_LOAD_STA_CHK	BIT(7)
> > > > > >  
> > > > > >  #define  XTAL_FRQ_SEL    0x3F
> > > > > > @@ -349,12 +357,20 @@ struct s_edid_data {
> > > > > >  
> > > > > >  /***************** Display End *****************/
> > > > > >  
> > > > > > +#define MAX_LANES_SUPPORT	4
> > > > > > +
> > > > > >  struct anx7625_platform_data {
> > > > > >  	struct gpio_desc *gpio_p_on;
> > > > > >  	struct gpio_desc *gpio_reset;
> > > > > >  	struct regulator_bulk_data supplies[3];
> > > > > >  	struct drm_bridge *panel_bridge;
> > > > > >  	int intp_irq;
> > > > > > +	int is_dpi;
> > > > > > +	int mipi_lanes;
> > > > > > +	int dp_lane0_swing_reg_cnt;
> > > > > > +	int lane0_reg_data[DP_TX_SWING_REG_CNT];
> > > > > > +	int dp_lane1_swing_reg_cnt;
> > > > > > +	int lane1_reg_data[DP_TX_SWING_REG_CNT];
> > > > > >  	u32 low_power_mode;
> > > > > >  	struct device_node *mipi_host_node;
> > > > > >  };
> 
> -- 
> Regards,
> 
> Laurent Pinchart
