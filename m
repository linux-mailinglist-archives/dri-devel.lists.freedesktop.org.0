Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FFA4E3B2F
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 09:52:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E7EB10E52C;
	Tue, 22 Mar 2022 08:52:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2128.outbound.protection.outlook.com [40.107.101.128])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64E1710E52C
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 08:52:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GOTEYLeU68yKzp7/hQAgxxIMx1WsCvNQGyIcmeTBeW3RFDwwWAXy4Jy45Y54tnpYsp1ErdHr1qOhRNW5SNaYeuwhVa1b06wMv5OeI+Bi1dBqDgUS8OK874SOwy/+8ls8N5KVkR1s1yzmOWNnGAZQFYB+6TCKVXsf4bI35oWKBU9Q850jO3i1XuIA+5+JOPU9rOZCqOYGqrLT4iLP4k4qDxp+bbeu01xov2Y15+ppWgTE9SipeyXMRveUa1ACjFOoLkUGTqmXgcQEu0w+X6qQd9L8twn7jAYrui1S9l6j7OHpi2N1I2lXDPvM83EQ/RtjwEj6rbI1hkprPx6u8uwBfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=crLBeSQJBvzPeuG+/m0bDIA8bMNEexRmN6mdRRFC2dY=;
 b=lnorJkES+LMH9YOJGX7zV2IpPTrHOS9742aX4hVmL2Yq4FalqIxv4Rq9HGHF4QDtwRFe95NfwysN9VizdCfGdysQdJajhhYQcCQNN0pjsa/O21vAk1LkEcgRGeI5Pdbh0hG53RyOPMhXZ/eWXsYjSrO/AyYpG533Hlm5913+aIy7gPw63iCH+BasjvsQPwUAR7QI5Pq8AvetTmpdxqlLTWKfyZ2opLfkpsF99LEbOzoyL/zeYVbsZ2vpTN7d+bKTsXqoidSQ234Or2XJjwNUcfHId8acrOW6jpxsnmmLFaSkNDPp+53CszWRFoGdZGSpXVhcI+jjqiSXA5aico6/tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=crLBeSQJBvzPeuG+/m0bDIA8bMNEexRmN6mdRRFC2dY=;
 b=j7M922curM506NpDyNY/Zn1LWV+tjZQmkSP/HfxV0REvVYM5KQW/zsxbqlav0/7NxAcqWnVM6YCv4f6QHXwdsURSU8+PYc/gdRIfVTYJAZqDb9geuyFYbO9+XTOKFTk+r2f/eaAcD13jUYb6TpFTc1a267e5Db/WavtX+djnNXQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BY5PR04MB6834.namprd04.prod.outlook.com (2603:10b6:a03:22d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Tue, 22 Mar
 2022 08:52:14 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::a865:6d10:c4a9:1142]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::a865:6d10:c4a9:1142%9]) with mapi id 15.20.5102.016; Tue, 22 Mar 2022
 08:52:14 +0000
Date: Tue, 22 Mar 2022 16:52:08 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH v2] drm/bridge: anx7625: Set downstream sink into normal
 status
Message-ID: <20220322085208.GA1487511@anxtwsw-Precision-3640-Tower>
References: <20220322080213.1487134-1-xji@analogixsemi.com>
 <CAJMQK-j+PhB6dZBuKG3NtW94oT0bVkp9G1bXhmyZLgYOmTCgog@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJMQK-j+PhB6dZBuKG3NtW94oT0bVkp9G1bXhmyZLgYOmTCgog@mail.gmail.com>
X-ClientProxiedBy: HK2PR02CA0159.apcprd02.prod.outlook.com
 (2603:1096:201:1f::19) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eeadc973-b38f-417f-b37e-08da0be14258
X-MS-TrafficTypeDiagnostic: BY5PR04MB6834:EE_
X-Microsoft-Antispam-PRVS: <BY5PR04MB6834F966D79CA5B1395B7468C7179@BY5PR04MB6834.namprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 08JY6yghO53/a3QdqM6A0VL3xQuAWUewCmS9RAXha0Re5sm5WDu6+xK16NXWn0WJcWb55RYeRTMjb6ile1rnVmbpfH1h4uPk1kJKvCj24GWYei5cSNdf+ZD7IdHzZxeZ0yXtCWC2CpwiyRkHXLeitVmAvIHs/VS9Yt7AS5+PyYzw5Wy1FyZUOd37fWKRVWuUDardfFgKRHQt0dIPKGLnQnHGNAH9EdXPiUBPTu5DzlgozClctF2v+C6S6mASQSv0fJHYjHBXBMmDXBPbXa0jMIbMcr7HSfqRMHziqod3jGlg2quCgIVID9TPzTeFVEnOx5mmjDyu3btpJ3ee59UUxNEq8Zdlj2UvJWz04JqzjxBu2XVkVmbh8z5eWNDhvoMm7sR5JIxDbtqPS/NL5HWQIyL/GCqoXT202gdbyhokp2zxGYbkvblpGLH9agl9AEpPTyXdsyRu2xNmuBE/ce5JHuyvIl5crrtd9AG7+yqHlpp32Pbz9M87yeZ8MElweGQvY6xlJ/+qARYUjJg7tRfFIkYGpV+ETkMLEvfb+aa3Wqx/sRybLE4AZWe1+/l1HlZix04/PKfXOzlRFyfWLeacax7tfBoZOwSqgCqYjzGZa+HedaufF46HgCU4wYw3vr86H7N1wcVkdqxdM30Pf+2TQv1FdPN5HCwf9BTXnzYgKSiurGL8S3+peZidQ01NTNfd/+gUZC3X/fM0LFcpvKGRgg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(6506007)(316002)(86362001)(6666004)(26005)(33716001)(1076003)(2906002)(186003)(9686003)(6486002)(508600001)(6512007)(83380400001)(7416002)(8676002)(66476007)(66556008)(66946007)(54906003)(6916009)(33656002)(4326008)(5660300002)(8936002)(38350700002)(38100700002)(55236004)(52116002)(53546011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y+GkO3RFrT7Snm7OsLMe0j0nJo5RgrVfPxTSb8M42E0dgT8l/HOmhXHP5rvH?=
 =?us-ascii?Q?0zSd3GXL8xcDaA5pwf26TB6p7lJT+zaQXFZ6qRAZoE06Ft2PlvQxS+I21C3k?=
 =?us-ascii?Q?e9FD0qaDxlTFT0rw0o0E+B9kpyjRQii34/eFN6J0CECba8/qVVeSAbNW+HJO?=
 =?us-ascii?Q?1iaDV7+CIJoeWLlIGhNKkWKO0wQGXoKvJfxF/ybJsdcwa9KHU2z/1cW+wot/?=
 =?us-ascii?Q?dkyZdt0V17UIV75zj7zxUlR51FGyGygEQUDlHT1FuXUCP71k2nKMlRY/C4qP?=
 =?us-ascii?Q?xS8X+WZYfuTHjY9uz/WRiGmz48HzNJqcW5B77zpQh0CEO9WnFVOhG1pfbCUo?=
 =?us-ascii?Q?mxV0e5V3IFT+tdspxAF0nAc9ErtQca8qQ2TjDTObI+cQJqbHrWmyhgW4GGRQ?=
 =?us-ascii?Q?PFjL8LClc98YSBPSDV9C0Xgek6e/NWurnuq6F3FJV3weZlhXayJVSUcB1b77?=
 =?us-ascii?Q?MQvYMomwJRiEmkG42YmzFObqMfP9UIaz4UY65mUIGEhsHtgR8diRO3kjriPR?=
 =?us-ascii?Q?01mSp/hjguEqyxsPY/R+YHhxX28QALQuAiUfOefi/YAiKk/MwlpgBpSj7R0T?=
 =?us-ascii?Q?IPBOdzqPTRmOs/Pnzgskrj/xTvzGs/ilk0373fM7Pgxt0TVq++xRbMoVClRK?=
 =?us-ascii?Q?HDXCLPsCPXmLn3YRfiQxRNdBQ3Bf+rbDAYhf/dA9IVTjAtjJeZwRJRDDE1wC?=
 =?us-ascii?Q?IcMl2PjkzXg4FzcDfsnacOjGvCSrfAmYwKlO38K7ErZOsn2+Nw87CQopzb0d?=
 =?us-ascii?Q?zqJxCIiJ5cPfIGn/Z9hrlKWzU5bHPEPhqyeCE0kMtcy+hePBM0rvg7SiBFj1?=
 =?us-ascii?Q?hbQ1aEncVt/MIpF22olHmpbgo9NOD7yI/VB3GOyWy4sN0Ur4jPx550gaWpZY?=
 =?us-ascii?Q?5io9v6W05hsW9KGgjyoWCGNFbq1A2Pr58dd4rVgBhqM39zwrjUqMP8PO9Ttl?=
 =?us-ascii?Q?HjzmiT/DBlRTnGcp98REM20Tt9G723EgckRngbL0Cfm1lyuVy0LnDwcQ7g3h?=
 =?us-ascii?Q?Yueu1kgxAWYuQlHQU6ubGEtrZmu/CIRVYO0KiqBLC6E+zC/J+16h7mArHUyv?=
 =?us-ascii?Q?YMikH0HYI5Be8vh9D32mjsDyfgSYofC+hb1uvDnCr5lnXQcfjr+vL3FS9wiY?=
 =?us-ascii?Q?ZW7DAaNEhqlX8/8EG8dX27HoJatEI/9ob9Em21SpmhoNgp2ZT1swx2igK37u?=
 =?us-ascii?Q?yAE9UKLbj9nuBjCg2dz1IEmqi9kWfRTrFRUNu1S5JnmbFLiaJ1SmqDcLICam?=
 =?us-ascii?Q?eyNhhMUZYbIEuESBZaCc59F34K/k6LBEmFFUHY1Fcs9zLB+2VE3M9VCqgzez?=
 =?us-ascii?Q?vwiZn+Ob5msgSoNE7LXO3doSKf9j134h8h6m8GER+Np4j1dsSHJM7+FME4Zd?=
 =?us-ascii?Q?mjbC7FPfXgsNyILF7iD/dYN9GcdBeNnEtvi4SqrGFywH2s+SFkSDrmfbR41K?=
 =?us-ascii?Q?KI8OAk5mcqopKVOHFIGv1hIxBj/6vaFy?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eeadc973-b38f-417f-b37e-08da0be14258
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2022 08:52:13.7033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KFUqaUuEboQDdvUwW+REFkX9Zfk3jAU0MoQt0A0y7/uSUX70pZoblQ6dY38G8uLDSNfKruFIcZS6QfvPvMDOwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6834
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
Cc: dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 qwen@analogixsemi.com, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 treapking@chromium.org, pihsun@chromium.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, tzungbi@google.com,
 bliang@analogixsemi.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 22, 2022 at 04:43:20PM +0800, Hsin-Yi Wang wrote:
> On Tue, Mar 22, 2022 at 4:02 PM Xin Ji <xji@analogixsemi.com> wrote:
> >
> > As downstream sink was set into standby mode while bridge disabled,
> > this patch used for setting downstream sink into normal status
> > while enable bridge.
> >
> > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > Reviewed-by: Pin-Yen Lin <treapking@chromium.org>
> >
> > ---
> > V1 -> V2: use dev_dbg replace of dev_info
> > ---
> >  drivers/gpu/drm/bridge/analogix/anx7625.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > index 9a2a19ad4202..dcf3275a00fe 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > @@ -924,12 +924,20 @@ static void anx7625_dp_start(struct anx7625_data *ctx)
> >  {
> >         int ret;
> >         struct device *dev = &ctx->client->dev;
> > +       u8 data;
> >
> >         if (!ctx->display_timing_valid) {
> >                 DRM_DEV_ERROR(dev, "mipi not set display timing yet.\n");
> >                 return;
> >         }
> >
> > +       dev_dbg(dev, "set downstream sink into normal\n");
> > +       /* Downstream sink enter into normal mode */
> > +       data = 1;
> > +       ret = anx7625_aux_trans(ctx, DP_AUX_NATIVE_WRITE, 0x000600, 1, &data);
> > +       if (ret < 0)
> > +               dev_err(dev, "IO error : set sink into normal mode fail\n");
> > +
> 
> The driver uses DRM_DEV_* for logs. Can we use this?
Hi Hsin-Yi, as comment in drm/drm_print.h:
"NOTE: this is deprecated in favor of drm_dbg". DRM bridge driver not
use DRM_DEV_* any more. I'll send a patch to replace all of DRM_DEV_*
later.

Thanks,
Xin
> 
> >         /* Disable HDCP */
> >         anx7625_write_and(ctx, ctx->i2c.rx_p1_client, 0xee, 0x9f);
> >
> > --
> > 2.25.1
> >
