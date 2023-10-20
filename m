Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7307D1218
	for <lists+dri-devel@lfdr.de>; Fri, 20 Oct 2023 17:02:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5C1710E5BE;
	Fri, 20 Oct 2023 15:02:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12olkn20828.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::828])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E9F610E5BE
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 15:02:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=miDmwuOpdkh1Z49VBEnjlKe1OzkVolNK/xKlU1mpTttl0hLQBK+LXMw+oQqQOnTfT29oLkJBfJRBL+rFYx4aHl7cSwaGjTk7dHE4cXXHWzxUa+VRsbVtM0Px7azKR/sEYzottmgCzjH/lhxoUxZRR67s1RhHbVZ1xt14k4z18rvonkWHKf9evuhS4UlMLoem+fUmokNREm+XvFQfJbnxjoaAUAS3Rh42WGERh8kRUagVR5Q9uQPt55XtjORwyQiK7VoptabeYIULHqgOYUYwrq52pxXPzPgos/pMehSWIlGxfd/92uRx906OVFL3JrVHpmCGoaNyDU+ZBvTE2crhDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u22+lWt58j6XOonK7pX+yttwnFl5PevcfeYAcpOPZlg=;
 b=nRwXccobL/QiPu11AZCgioQmAzcWnRckKpPpN9xTcDlElzffnbmxYY/hEa55JqXt/5kZoNgMquAwfwbbKZguUMeTmur2xqvR+PcFG4EswVBZBDumdxcRsnq2JBg1iTT4ZC0UL/4pp5bJ9gSAvKf/RGqb4iZIrhxcno9Wenr4XN5cTEeU82NQeXueDy+mqlo6OJwPB1EeWL9YmUoBYSodbn1MDCsI4FSTie4i239YGHkbiP1WevQm+PxW6CTUdNygC5HtaZaDj/EKbs7f3DKLg+tMSnng6DU56uuRUr2fyv4KT98IPiXGSSIau1fzG0jg7eXtLTeEHapKDsdLGiR5hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u22+lWt58j6XOonK7pX+yttwnFl5PevcfeYAcpOPZlg=;
 b=gshecpcX/74ruuUckEdXTrG93/P2j7ASBhXHc6yS1f2WssqeHQ2m9VzDinkYTKR7nfP16YOaqtOTk0S7GrvDDJJR8nBhZFATpIGQ5zKaJx9VYRFGQ9XiU34wQizhHyPmaw/NIAOrgn+Pq6iizjLUAlYBXbyxRiDImpKEfZ8zFBDG9rlb0Sv+GGKE9hnz20e+Sy8sNHRKJ5S1hRsFI5ka2cFTwB9r4wvdRRBawRGTAMEcFThv+T9JnBp+qnjIyLvU1fyGrCUPteGaDUPeOlvCudP7PxoaI2xRTuAVHewk0/nHUZr6YmAhSgZyxRFet+Pm7EzTisyoruSDaNbjrPUOvg==
Received: from SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
 by SA1PR06MB8241.namprd06.prod.outlook.com (2603:10b6:806:1c4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24; Fri, 20 Oct
 2023 15:02:08 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::c40c:bbc8:b103:459c]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::c40c:bbc8:b103:459c%2]) with mapi id 15.20.6863.032; Fri, 20 Oct 2023
 15:02:08 +0000
Date: Fri, 20 Oct 2023 10:02:06 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH 2/5] drm/panel: nv3051d: Add Powkiddy RK2023 Panel Support
Message-ID: <SN6PR06MB53427936B51EABD4484DF0C3A5DBA@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20231018161848.346947-1-macroalpha82@gmail.com>
 <20231018161848.346947-3-macroalpha82@gmail.com>
 <c5e2929c-ef05-4e74-947e-579706f2b4aa@quicinc.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5e2929c-ef05-4e74-947e-579706f2b4aa@quicinc.com>
X-TMN: [c6hAfIfdj1KylH7ib0gHz387R2RVY3OD]
X-ClientProxiedBy: SA0PR11CA0094.namprd11.prod.outlook.com
 (2603:10b6:806:d1::9) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <ZTKWbrxWpX0MzEvy@wintermute.localhost.fail>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR06MB5342:EE_|SA1PR06MB8241:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ed23567-d269-405d-73b1-08dbd17d87c2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5Mim3eiWkOJTW1N77Gi1wp0N3sz3txoWY5mWejy2EjWQl/0QxC0Nn1mgX1iWd0iL/q08RF1dCk0xRp21K/MrKR7MwpF/IpPj8KOJtnL68DDNTR7GPKEUZ857ACZO0741EVgToBI5EhRhNST3EnH7zn0QT5bsHI4mwHT3m56QnT+uVCk8mCMRXlyoAF+KragI0nrkfxHK4/5HmRGjDqQ5TvUydb9evOdWo6+DkOBvkBj29DOUUuIPZpQ6bpI0bB23DCGxo/4FWeWGnj/Va018vY012Pm7ZavvpyBfnx9NXerXkwaRclvyQT6c7fKyLPgXP+bLtebwez2PcYS6ElMhYW3r7Zxh+pBBFuavkSlAuS/LVucuuvVtCyO12ToTdvAD3a6n3EwSSeRybBKX/uZviyJN0w2Tv9+zWiNjEmbNtJnLcY9m0S9SwOITT+pxTY//Qbu3wsea38vjKvmxwF8DvfD2S8yZVzC0OFGKUi042dLK/W41Uw1WFiK5+bgrEKpclPv6LFg53oydcWF1/CwaKzrBXpf/v+2lAq12CyhNOVvqSugO6+KdTVvyC0kPcZZW
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3g22Hda9ety0YLI8h26fJsx/KKGev92kmcFy4YYXC4i6APD5EOq5Y6feRKwi?=
 =?us-ascii?Q?bNV4iUhnpxE6lWn15+UswfVaRoafv6XWCVolXvFYZusv5ViFXjm+P1PaPqWs?=
 =?us-ascii?Q?isjEOL7urwm75NUILyvk3Z0MvDxqd2Aj7fQyUudFwzMkvPyAlQelYndEkyik?=
 =?us-ascii?Q?tcmAnC+1zLUeZPMR42+gZP8R85jHaWX3I934ghNPRhfzpTAl/TCp8TQ8JrSt?=
 =?us-ascii?Q?imWH2PxC+3g8jAqZZAmTmCHp01gjtRr+LSMg9IXWAo7a0Brb6xN8KYc1HZDL?=
 =?us-ascii?Q?vc23c0Q4Jpog9TNc/cHUU084LVlTma9meT7q7+zPuAzPZ9aDQYfjipoMkjke?=
 =?us-ascii?Q?9OvigxrBROMEApie1r5gcQNI42LScMVR1ImuSl6lz/LYSrEtTgN5R1ni4ASw?=
 =?us-ascii?Q?AJ3wnP7f53MycUtFwTrzLu/gnDi7tJpkzkGNO8W4zQOZqTJsAciPhmaIWlKN?=
 =?us-ascii?Q?IjfFlRzTyldIBbc6p93fM18/nJGQMX5R/Jf2DP7ixTmhtKGktblwR3AVZnXC?=
 =?us-ascii?Q?IfEN4nd19SnVSCplW1BgmhnwHQYe3RlFnBuQnjMx8ojZ+WCHmbBqsWFpzJAX?=
 =?us-ascii?Q?X/OUHIHUOqZa7uUi/T95HIaHVcZL2slXlG6q6HqPjHDxVxGip0L5L76QHS1W?=
 =?us-ascii?Q?PZ/G//y+0nj/PiKY2gbqJSA4m8DTdst0wCB3pR8KOOMOjALCSmIWch42RxUM?=
 =?us-ascii?Q?TnBnk7LRuYkPdgDVqDMVvxkB3V2wsMNW6fgA1D0hEq4lcMWE7/b93jQ7QnNY?=
 =?us-ascii?Q?VhhJEhQZ2OdO8RsatWBXt51UoEJGgsciHzRWKodrkVSnBSSN2B/JeXdeG8qI?=
 =?us-ascii?Q?dx8FyOPQlSDWTfMN2X2K/ByfPRynP6frTgLQ9hDWFwZl3u6kactItHJTz/xW?=
 =?us-ascii?Q?r/EmVa+hBMulDwtuNbvrafRAnE+R088DMqS060AVuC/gZ2x2e/LiQd3a41ag?=
 =?us-ascii?Q?jRkfSiWTAF4uUaUhBhwZqwR3gYZx+WaKz9uM6q4CRFFOzK3Kr7zysVVgFCuu?=
 =?us-ascii?Q?a2R47U4X9HA+o5RDg9sPgusLVMQiS3O7bcBW3XIyTvoFD9fQbDR7uYx6CUMg?=
 =?us-ascii?Q?GlpDqMxT4Xpk6rxpjQlDXiDdfYhc5ySkEa6Yp8wr0F8NVtl9TBIseWW93DjX?=
 =?us-ascii?Q?lwXmDsN7snKrRZwE/ch9l6WybRahTNCzv8tN1ktvFyeg0SnrjWytBnU9CGpK?=
 =?us-ascii?Q?TBqEnA8spC2goYIOgb5VpiShER2oYc0TCPENt5ohF33yg/IIX0p3l4zubqY?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ed23567-d269-405d-73b1-08dbd17d87c2
X-MS-Exchange-CrossTenant-AuthSource: SN6PR06MB5342.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 15:02:08.8179 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR06MB8241
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
 sboyd@kernel.org, mturquette@baylibre.com, sebastian.reichel@collabora.com,
 dri-devel@lists.freedesktop.org, Chris Morgan <macroalpha82@gmail.com>,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org, linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 19, 2023 at 10:22:24AM -0700, Jessica Zhang wrote:
> 
> 
> On 10/18/2023 9:18 AM, Chris Morgan wrote:
> > From: Chris Morgan <macromorgan@hotmail.com>
> > 
> > Refactor the driver to add support for the powkiddy,rk2023-panel
> > panel. This panel is extremely similar to the rg353p-panel but
> > requires a smaller vertical back porch and isn't as tolerant of
> > higher speeds.
> > 
> > Tested on my RG351V, RG353P, RG353V, and RK2023.
> > 
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> 
> Hi Chris,
> 
> Thanks for the patch. Just have a minor question below.
> 
> > ---
> >   .../gpu/drm/panel/panel-newvision-nv3051d.c   | 56 +++++++++++++++----
> >   1 file changed, 45 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3051d.c b/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
> > index 79de6c886292..d24c51503d68 100644
> > --- a/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
> > +++ b/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
> > @@ -28,6 +28,7 @@ struct nv3051d_panel_info {
> >   	unsigned int num_modes;
> >   	u16 width_mm, height_mm;
> >   	u32 bus_flags;
> > +	u32 mode_flags;
> >   };
> >   struct panel_nv3051d {
> > @@ -385,15 +386,7 @@ static int panel_nv3051d_probe(struct mipi_dsi_device *dsi)
> >   	dsi->lanes = 4;
> >   	dsi->format = MIPI_DSI_FMT_RGB888;
> > -	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> > -			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET;
> > -
> > -	/*
> > -	 * The panel in the RG351V is identical to the 353P, except it
> > -	 * requires MIPI_DSI_CLOCK_NON_CONTINUOUS to operate correctly.
> > -	 */
> > -	if (of_device_is_compatible(dev->of_node, "anbernic,rg351v-panel"))
> > -		dsi->mode_flags |= MIPI_DSI_CLOCK_NON_CONTINUOUS;
> > +	dsi->mode_flags = ctx->panel_info->mode_flags;
> >   	drm_panel_init(&ctx->panel, &dsi->dev, &panel_nv3051d_funcs,
> >   		       DRM_MODE_CONNECTOR_DSI);
> > @@ -481,18 +474,59 @@ static const struct drm_display_mode nv3051d_rgxx3_modes[] = {
> >   	},
> >   };
> > -static const struct nv3051d_panel_info nv3051d_rgxx3_info = {
> > +static const struct drm_display_mode nv3051d_rk2023_modes[] = {
> > +	{
> > +		.hdisplay       = 640,
> > +		.hsync_start    = 640 + 40,
> > +		.hsync_end      = 640 + 40 + 2,
> > +		.htotal         = 640 + 40 + 2 + 80,
> > +		.vdisplay       = 480,
> > +		.vsync_start    = 480 + 18,
> > +		.vsync_end      = 480 + 18 + 2,
> > +		.vtotal         = 480 + 18 + 2 + 4,
> > +		.clock          = 24150,
> > +		.flags          = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> > +	},
> > +};
> > +
> > +static const struct nv3051d_panel_info nv3051d_rg351v_info = {
> >   	.display_modes = nv3051d_rgxx3_modes,
> >   	.num_modes = ARRAY_SIZE(nv3051d_rgxx3_modes),
> >   	.width_mm = 70,
> >   	.height_mm = 57,
> >   	.bus_flags = DRM_BUS_FLAG_DE_LOW | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
> > +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> > +		      MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET |
> > +		      MIPI_DSI_CLOCK_NON_CONTINUOUS,
> > +};
> > +
> > +static const struct nv3051d_panel_info nv3051d_rg353p_info = {
> > +	.display_modes = nv3051d_rgxx3_modes,
> > +	.num_modes = ARRAY_SIZE(nv3051d_rgxx3_modes),
> > +	.width_mm = 70,
> > +	.height_mm = 57,
> 
> Will all the panels for this driver be 70x57? If so, would it be better to
> set display_info.[width_mm|height_mm] directly?

They are all so far the same size, but I can't guarantee that going forward.
To my knowledge this is the last of the nv3051d devices I'll be working on
in the foreseeable future though, and so far they're all identical in size.

> 
> > +	.bus_flags = DRM_BUS_FLAG_DE_LOW | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
> > +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> > +		      MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET,
> > +};
> > +
> > +static const struct nv3051d_panel_info nv3051d_rk2023_info = {
> > +	.display_modes = nv3051d_rk2023_modes,
> > +	.num_modes = ARRAY_SIZE(nv3051d_rk2023_modes),
> > +	.width_mm = 70,
> > +	.height_mm = 57,
> > +	.bus_flags = DRM_BUS_FLAG_DE_LOW | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
> > +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> > +		      MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET,
> >   };
> >   static const struct of_device_id newvision_nv3051d_of_match[] = {
> > -	{ .compatible = "newvision,nv3051d", .data = &nv3051d_rgxx3_info },
> > +	{ .compatible = "anbernic,rg351v-panel", .data = &nv3051d_rg351v_info },
> > +	{ .compatible = "anbernic,rg353p-panel", .data = &nv3051d_rg353p_info },
> > +	{ .compatible = "powkiddy,rk2023-panel", .data = &nv3051d_rk2023_info },
> >   	{ /* sentinel */ }
> >   };
> > +

Sorry, will fix that in a V2. Thank you.

> 
> I think you can drop this stray newline.
> 
> Thanks,
> 
> Jessica Zhang
> 
> >   MODULE_DEVICE_TABLE(of, newvision_nv3051d_of_match);
> >   static struct mipi_dsi_driver newvision_nv3051d_driver = {
> > -- 
> > 2.34.1
> > 
