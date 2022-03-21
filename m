Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC27C4E25A8
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 12:52:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE88110E2AE;
	Mon, 21 Mar 2022 11:52:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2095.outbound.protection.outlook.com [40.107.100.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00EE310E2AE
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 11:52:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SLH3q9jPd6Lf0d1bYmF9AcgzzU1rawR5kU0B3fGWUiBgigpeoTFo2h44clJBg3ZBhCoZujIXunLly5Au8ui0Oxj5430zyTenOmhEmYTEUUtI+iXJaVseNQmS1dvangDV2z+0Y8WRBfsO+72j5Tn7gzgbnjweLurUe206n36pgKHV8Drb35SD9DlYU5e0UUxHBuSxuSGBXqWuDoIdAqjY1lxaT3OULgrG1HEhnmFMJAoq9b7muQXKHXnl/0w9Fw2hR8u+QLct76SyKkEb0/e70G385DXVx6ytb5UJsl48EuxN+EXF+/bFrkV7UGpsbl9oJ1HazKRDgAeUZq6LlokjJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YMRdPAHbmpQvKsY1OGijUl/wbrOuubHm3Cg7Sm0Y7uU=;
 b=kJB61WfBc0TI8XgP9fU9pm0mKFSGqp6UxKxqGiyAk7UOON5cgE/fc5aj2IO/NBLL/mnRcCCximlwL9jq03Pb21/JvE5p8ryv32jmUtLUcQ7jmJvHTFKWPZdPT2GKoyUihdD5Rq7XWl94EvSRaWXfeYqhAaK2cnWAqGczGFPvX2fSHDvQ5NgGMZQNakRN0AibECKo3j8Z/9a/6LjI6i/eknLCXGvQ7oV/5vL7FNcpc40AmREv9cSIAdvHgAKUXZ/tYTpc6RCllVFkDA6fmcm4y/cG8hxAKfgeVlADG0SEDgRcyUX+H3yT4ORcoS27SgwZLTVltAVvLCOdgt6oUunH/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YMRdPAHbmpQvKsY1OGijUl/wbrOuubHm3Cg7Sm0Y7uU=;
 b=tK6SnZzP/3VG/4gmLCoALjT5wpfmpXTXHjrC+j5Qljlo4CWJsrlA3mXBuEplaDsb3Jw+R98G+mHIjMGUKkeGYTX8N7948ID9ftSIjBtSUP3FMax0E9oDl4WXVGYAs56738+44mYNmw4Xi+K0F0Zc654v823pou+vY/iKcMnJ1xc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB4888.namprd04.prod.outlook.com (2603:10b6:a03:4f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.18; Mon, 21 Mar
 2022 11:52:34 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::a865:6d10:c4a9:1142]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::a865:6d10:c4a9:1142%9]) with mapi id 15.20.5081.023; Mon, 21 Mar 2022
 11:52:34 +0000
Date: Mon, 21 Mar 2022 19:52:26 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Robert Foss <robert.foss@linaro.org>
Subject: Re: [PATCH v12 3/4] drm/bridge: anx7625: add MIPI DPI input feature
Message-ID: <20220321115226.GA1484106@anxtwsw-Precision-3640-Tower>
References: <20211105031904.2641088-1-xji@analogixsemi.com>
 <20211105031904.2641088-3-xji@analogixsemi.com>
 <YiTruiCIkyxs3jTC@pendragon.ideasonboard.com>
 <YiWiYpEfTOOqgyAN@google.com>
 <CAG3jFys-BYsBp07AAFQ2O_TFsXOwhcVDnsOh8WVNNSag3HZw+Q@mail.gmail.com>
 <CAG3jFyu47cv8oSecONM95KVoP=NOvgwafAp4TQ33CZ0Y4zWmnQ@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG3jFyu47cv8oSecONM95KVoP=NOvgwafAp4TQ33CZ0Y4zWmnQ@mail.gmail.com>
X-ClientProxiedBy: HKAPR04CA0009.apcprd04.prod.outlook.com
 (2603:1096:203:d0::19) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1fd5ba9c-1af6-4616-45e6-08da0b314930
X-MS-TrafficTypeDiagnostic: BYAPR04MB4888:EE_
X-Microsoft-Antispam-PRVS: <BYAPR04MB48885EE0993DBAC49D9D6369C7169@BYAPR04MB4888.namprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3hYaZNBkDls4kwO2uqlSjySuaefLkM9M+77aGSZAxifpukNUkDEPppHy/2z8IeOzlxZ+0jZugHGTKtAkHimoP2CjobknbrWsVro6vjtCOwGQhJiMVOH7tMSAWdO7NJmMJZn8gKZzl4zKjXIQl46c9041/DpBviDhW09HX0NMlGcQgw9uw4yHP0IVxarkZyCbn7eerg15AGF9fKDbAqi8VcoIDpj4JjPJ9MNHodgLtR3dSN5zE9SL5KPOce/Wbie5qBOaxeoSy96kOaZYe3aJjw8aJhGGeDv5g381sCcAlcu306N4qhDk4KKQjBM0flzJv5O6gCcxY5jWpL0PFJA1N8iqAnOBiEdF0c/iZYY+VgyTlFUxXC5iGddF/K1XvKNFAAWNEvk9VcdTWs8FQiRwOMIwkZKwfRvTRWh0dmtNSAog2jUHv5DygeeVDvqtT3L5ryPaIFh8ydTjCyXfAEV75MhWcPfh1yppvMmZv8O5j7UwDlkxEvWW1qJKc39jPmXpt/Ln/8/L6v32nOuruX3K5apF92rHUAUQjWFNaz0t7SJ4lufgszaI8pj26PS0wNlF0FtJx8T8Z993zxlcPvbaFoZSCgJip4O7q0rw+GKrSw4tSKWszqnQ3uFC+op00ZEIenwQ/YuAFSGk0JBO4JoiUjp/1Ut9oyvpNseGrGQXjpMfVrU71fHwdruh2ndyaHKogs7svhUJvkAd772uXfc/F5g2niKzGa3I+KrrrJk7OcArvaspowEEdGB3ImbZ7zfp9IuJbJPpsCfOQQZstjPgGWKWInH4feINb/2Z4m+7ZvY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(83380400001)(45080400002)(4326008)(66556008)(66946007)(8676002)(6666004)(508600001)(66476007)(966005)(6486002)(38350700002)(8936002)(38100700002)(9686003)(33716001)(2906002)(55236004)(316002)(33656002)(26005)(186003)(52116002)(5660300002)(6506007)(6916009)(54906003)(86362001)(7416002)(1076003)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SLDqSfar7K0YBk6LWDM1ZXV3MpWy+IPIp/uhQmjiYrFibm8oIYetsalu1naV?=
 =?us-ascii?Q?Bw7crVgSjbTgTaptOzQR4qVZlxgG3KkqA6haXJdpKUMjljBZLaZF4IqXJBM1?=
 =?us-ascii?Q?/vz9U4D6HTT5RBlfo5Vw0Oev/PT3yC4onVyZi8WjrXa3a51qG/EB4LRI53nQ?=
 =?us-ascii?Q?C6+L4x+HVbGb6Y+7TM73lkvr8FBU+14w2UwE3KwYQ7h32pcoDi2iLO3f/a+C?=
 =?us-ascii?Q?8thoOFc/Al4L+F/fIwCJ7Q9/6TyplkHR54FbueYQmHYzb3l8S3F2ijyGB3/E?=
 =?us-ascii?Q?AIhIXQwo6+siAwJj6XmtGbQdHIQtocuUgAnNpQIX7W2T50OfyBuhUmKIgr13?=
 =?us-ascii?Q?LPmdW5P3ughCjTv+90W63jhz5R/50TsWHphN8qRaVuUREnTB9w7c3qSPHIap?=
 =?us-ascii?Q?Q+XihJuaRCB35f3nZO+S+70FIuwXpo6mD7siYXBk1H8uIf3Cx9zsvZd3rwHm?=
 =?us-ascii?Q?gguCTvTyuXH/ZyzNVeKUoSQ51u97U1SxYGiph1qXjPoomZehaspGuHvYp/2l?=
 =?us-ascii?Q?Mbnq2DfdfDCuUCSsK3U0SKjyVG/yvbAke++wcARcFm88WBt7FmP7LIHBsgPk?=
 =?us-ascii?Q?AL9wdqXuXnHDO9mCIvaJ8F6Cru4CwabCFOKxwZnef6/Zgzr9D5TueMFUtrIX?=
 =?us-ascii?Q?CqloalWgM6AuBEijrUhnUeWE2rUERkSVJd2OzEF3xrefukzCu6sktHX+eOIy?=
 =?us-ascii?Q?LZkKZ1MSfTvrjZTAkjN+Ajkprg9f2zyv/80gwRlbF7jy2dSU2Jdx6X/rKaqG?=
 =?us-ascii?Q?v3yqn0NnXgHrW/Cuzv/ciuRJoVcvgxP+M4DUykp+6FXUoqMOmrS8FCQ+xMgx?=
 =?us-ascii?Q?/93oz56gDoLNYObewwQ5MrkCehPwYwmbPpr3WmvppwuSD4x8gvXPZ7NLBjhM?=
 =?us-ascii?Q?/N/DEwn7WbDmpwWQijHbyBPFcnJo3ma7IH2ewSD2V6pNTwr/AhwZUgzaYscX?=
 =?us-ascii?Q?zczQGDJlJ4nOEz6H4CdvqWBD8kMzub4NXn3uz5MVChsClqOwlFc/X0bP6rl9?=
 =?us-ascii?Q?F10CKErLrQf5gHjAkXBTYqawzV/yAw36ywLOWJdZLEor4L1hUwERH39qzOn3?=
 =?us-ascii?Q?IEN98RICGsEbOxu2ju+mMiNirkZUm4rIyDq0hmjm++F2BsGHSGR0GFq1l3cG?=
 =?us-ascii?Q?fZ/e5hP/Hq3MQ7Txh3Q2ZvkrmK0fV84yvYs65S3syZV+8IAGfaab9y2jY0in?=
 =?us-ascii?Q?YaQ7dpZu/lB92aSX9M9t7Ax62RE4B9NT1whNfppWal57fXNWupJiwLXLyELG?=
 =?us-ascii?Q?kXmuvL+T6uIH//V/GbDkNT4k7fAU4+MZNmyp0rCae0dMi+HkMgr2R/ual5Mh?=
 =?us-ascii?Q?7b5elEf1pxk3SmhqgeSpcYpheYGAwY5hTlm3D0gwMJwdGrBppLJVPipY9SSS?=
 =?us-ascii?Q?Yco3YZdPUqWtM7GCG9HX2LGSw6YojjxiPFk2Did5kUZBj7uA2uTd7Cpcizd+?=
 =?us-ascii?Q?sH6gjErfRqVhkIxZtpCtaLFSiNFxHxuT?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fd5ba9c-1af6-4616-45e6-08da0b314930
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 11:52:33.9924 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CvLLG4Z+CsuS/pFpqFXPA144aOfwA50wDc/zc0eH1+9UocNJIwFLvOpA7k/n6SWOnmydrHB9FcNeWZwMKI6jlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4888
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
Cc: narmstrong@baylibre.com, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 a.hajda@samsung.com, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 bliang@analogixsemi.com, drinkcat@google.com, sam@ravnborg.org,
 jernej.skrabec@gmail.com, tzungbi@google.com,
 Chen-Yu Tsai <wenst@chromium.org>, dan.carpenter@oracle.com,
 devicetree@vger.kernel.org,
 =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
 jonas@kwiboo.se, qwen@analogixsemi.com, robh+dt@kernel.org, maxime@cerno.tech,
 pihsun@chromium.org, hsinyi@chromium.org, Xin Ji <xji@analogixsemi.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 08, 2022 at 11:00:20AM +0100, Robert Foss wrote:
> On Mon, 7 Mar 2022 at 16:49, Robert Foss <robert.foss@linaro.org> wrote:
> >
> > On Mon, 7 Mar 2022 at 07:12, Chen-Yu Tsai <wenst@chromium.org> wrote:
> > >
> > > On Sun, Mar 06, 2022 at 07:13:30PM +0200, Laurent Pinchart wrote:
> > > > Hello Xin,
> > > >
> > > > (Question for Rob below, and I'm afraid this is urgent as we need to
> > > > merge a fix in v5.17).
> > > >
> > > > On Fri, Nov 05, 2021 at 11:19:03AM +0800, Xin Ji wrote:
> > > > > The basic anx7625 driver only support MIPI DSI rx signal input.
> > > > > This patch add MIPI DPI rx input configuration support, after apply
> > > > > this patch, the driver can support DSI rx or DPI rx by adding
> > > > > 'bus-type' in DT.
> > > > >
> > > > > Reviewed-by: Robert Foss <robert.foss@linaro.org>
> > > > > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > > > > ---
> > > > >  drivers/gpu/drm/bridge/analogix/anx7625.c | 247 ++++++++++++++++------
> > > > >  drivers/gpu/drm/bridge/analogix/anx7625.h |  18 +-
> > > > >  2 files changed, 205 insertions(+), 60 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > > index f48e91134c20..f7c3386c8929 100644
> > > > > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > >
> > > [...]
> > >
> > > > >  static int anx7625_parse_dt(struct device *dev,
> > > > >                         struct anx7625_platform_data *pdata)
> > > > >  {
> > > > > -   struct device_node *np = dev->of_node;
> > > > > +   struct device_node *np = dev->of_node, *ep0;
> > > > >     struct drm_panel *panel;
> > > > >     int ret;
> > > > > +   int bus_type, mipi_lanes;
> > > > > +
> > > > > +   anx7625_get_swing_setting(dev, pdata);
> > > > >
> > > > > +   pdata->is_dpi = 1; /* default dpi mode */
> > > > >     pdata->mipi_host_node = of_graph_get_remote_node(np, 0, 0);
> > > > >     if (!pdata->mipi_host_node) {
> > > > >             DRM_DEV_ERROR(dev, "fail to get internal panel.\n");
> > > > >             return -ENODEV;
> > > > >     }
> > > > >
> > > > > -   DRM_DEV_DEBUG_DRIVER(dev, "found dsi host node.\n");
> > > > > +   bus_type = V4L2_FWNODE_BUS_TYPE_PARALLEL;
> > > > > +   mipi_lanes = MAX_LANES_SUPPORT;
> > > > > +   ep0 = of_graph_get_endpoint_by_regs(np, 0, 0);
> > > > > +   if (ep0) {
> > > > > +           if (of_property_read_u32(ep0, "bus-type", &bus_type))
> > > > > +                   bus_type = 0;
> > > > > +
> > > > > +           mipi_lanes = of_property_count_u32_elems(ep0, "data-lanes");
> > > > > +   }
> > > > > +
> > > > > +   if (bus_type == V4L2_FWNODE_BUS_TYPE_PARALLEL) /* bus type is Parallel(DSI) */
> > > >
> > > > This is not correct *at all*. V4L2_FWNODE_BUS_TYPE_PARALLEL has nothing
> > > > to do with DSI. DSI stands for Digital *Serial* Interface. If anything,
> > > > the V4L2_FWNODE_BUS_TYPE_PARALLEL type would map better to DPI, even if
> > > > it's not an exact match.
> > > >
> > > > This patch has landed in v5.17-rc1, along with the corresponding
> > > > bindings. As DT bindings are an ABI, we should really fix this before
> > > > v5.17 is released. There is no DSI bus types defined in DT, and adding
> > > > one as a fix so late in the v5.17-rc cycle seems a bit of a stretch to
> > > > me (unless Rob disagrees).
> > > >
> > > > It would seem best to revert this series and the corresponding bindings,
> > > > and retry in v5.18.
> > >
> > > There is a DT patch using this property that is already queued up for 5.17
> > > in the soc tree:
> > >
> > > https://nam10.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2F20220214200507.2500693-1-nfraprado%40collabora.com%2F&amp;data=04%7C01%7Cxji%40analogixsemi.com%7C69542695a9cd42cff5a508da00ea7baa%7Cb099b0b4f26c4cf59a0fd5be9acab205%7C0%7C0%7C637823304343387964%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=KbitBhnvGWfpHu6PNLUmrgdqcoZbXaA3hGwq9iAjQfI%3D&amp;reserved=0
> > >
> > > merged here:
> > >
> > > https://nam10.safelinks.protection.outlook.com/?url=http%3A%2F%2Fgit.kernel.org%2Fsoc%2Fsoc%2Fc%2F32568ae37596b529628ac09b875f4874e614f63f&amp;data=04%7C01%7Cxji%40analogixsemi.com%7C69542695a9cd42cff5a508da00ea7baa%7Cb099b0b4f26c4cf59a0fd5be9acab205%7C0%7C0%7C637823304343387964%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=YJAs0IPxR0hrHpGR7K00itcTIF9cnz4L4ta%2B9ACQdSk%3D&amp;reserved=0
> > >
> > > We will need to revert that one as well.
> >
> > I just submitted a series reverting the dt-binding change + the
> > related commit to "mt8183: jacuzzi".
> > Can I get a quick r-b/a-b in order to get this into v5.17.
> >
> > https://nam10.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2F20220307154558.2505734-3-robert.foss%40linaro.org%2F&amp;data=04%7C01%7Cxji%40analogixsemi.com%7C69542695a9cd42cff5a508da00ea7baa%7Cb099b0b4f26c4cf59a0fd5be9acab205%7C0%7C0%7C637823304343387964%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=S5ScH2jid3ZRobvO%2Fl2nVgdOvFHNj1nWafTQYG3L9d0%3D&amp;reserved=0
> >
> 
> v2 of revert submitted.
> 
> https://nam10.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2F20220308094911.2680291-1-robert.foss%40linaro.org%2F&amp;data=04%7C01%7Cxji%40analogixsemi.com%7C69542695a9cd42cff5a508da00ea7baa%7Cb099b0b4f26c4cf59a0fd5be9acab205%7C0%7C0%7C637823304343387964%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=D6ulS16g4v4x0u23OtYRrSeitTqllWwDzPiT%2BxMcQQg%3D&amp;reserved=0
> 
> Xin: Will you spin a series that adds DPI support and re-enables DPI
> for anx7625? Additionally, "mt8183: jacuzzi" will have to have DPI
> re-enabled.
Hi Robert Foss, I'm little confused, do I need resend this serial or
send a patch based on currently define(V4L2_FWNODE_BUS_TYPE_PARALLEL)?

And use V4L2_FWNODE_BUS_TYPE_PARALLEL for DPI, other value for DSI
setup?

Thanks,
Xin
