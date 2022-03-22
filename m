Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F624E3C41
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 11:14:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65F0B10E5DC;
	Tue, 22 Mar 2022 10:14:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2114.outbound.protection.outlook.com [40.107.236.114])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EEE610E5DC
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 10:13:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nP2LzsVR5brlH4y3joRhhjcnHHBEvrMr0bpN9yHGd/FidVlml9XHqGrpzjIOGpuwbkdMxwwilRLpSD1D282jISj44TNwCQ2TZ2A+6MCkU1ULcB640O4ps3URAjYn6Dv3h+pHBStPrhiexqXofMF+yCN+zZnc+lmzgI9kntlQWY7JsprCexZUs2IdS6b9ifWcYILoMBbMJWT4FICsV29IpeyehenMWMMN1ZxpEHAD6B0ad8kxWwyMaaSFijiKJXB44qnEmac5lHwjvVaNSh5T21h9iBFoqtvkNAWE/GO104sXYoNWTtch0GAx63Yv0ahU+Wl0eaNsGg/FR8xjyKrGQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oy1hPCargx2mlIzbtYvwXb9j1NXJqsoXBOmKoan6aIM=;
 b=BF2OdS3mlKvBGRYrtCpyhkO4q99SnPu1JdcGPUNlYxeM7h+sSv/ISaFB5rEDn2CS0ojPmtrtwEAlVBsTwYiAQovMhtn/6DynvQB1qNoqdJaKZAJnYNBl5uMPUxGn5o0bYP3131N8I4spGz7TvfX7WWLGKYK68abTtTc9QaxpsS/kSaYjRt0iXXX6gtQf/HVW/eQNuBXx3lcXFUlc8Gpxnsyco/IJq64AzGiJ5DageFwbw5YRQ7Z/gEvy5enT0ollISBuP+oCbm3nFCWqbrr70reuqEW6JUeHrxxiO5ou0giKrBNSjwHztcKSIhTVFCarNTax84K9oHGfQV279sRQRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oy1hPCargx2mlIzbtYvwXb9j1NXJqsoXBOmKoan6aIM=;
 b=wOcLwCdXp8ANx5/edYU7Svo7dphHmSfCEiF2uN+JfjJ5N40bx/R0oYGeSrcKG8+d+zz5BCG7xtL6GTbR1+I5ahL0nUPBIBn2Pur9qpdCUuhO5jTHQ21lGkLskJZSGNj5nZ68kV+HHwaiK8Zp8br/k+xvW1s6PJVOu49xYuVKHyk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BN7PR04MB4228.namprd04.prod.outlook.com (2603:10b6:406:fc::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Tue, 22 Mar
 2022 10:13:56 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::a865:6d10:c4a9:1142]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::a865:6d10:c4a9:1142%9]) with mapi id 15.20.5102.016; Tue, 22 Mar 2022
 10:13:48 +0000
Date: Tue, 22 Mar 2022 18:13:42 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH v2] drm/bridge: anx7625: Set downstream sink into normal
 status
Message-ID: <20220322101342.GA1493353@anxtwsw-Precision-3640-Tower>
References: <20220322080213.1487134-1-xji@analogixsemi.com>
 <CAJMQK-j+PhB6dZBuKG3NtW94oT0bVkp9G1bXhmyZLgYOmTCgog@mail.gmail.com>
 <20220322085208.GA1487511@anxtwsw-Precision-3640-Tower>
 <CAGXv+5Gddu8VU7xjX-r2=u85i7Ut=_6JpQV6py52OyzEkpezTg@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGXv+5Gddu8VU7xjX-r2=u85i7Ut=_6JpQV6py52OyzEkpezTg@mail.gmail.com>
X-ClientProxiedBy: HK2PR0401CA0022.apcprd04.prod.outlook.com
 (2603:1096:202:2::32) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84138553-5f88-4ab1-572b-08da0beca7b5
X-MS-TrafficTypeDiagnostic: BN7PR04MB4228:EE_
X-Microsoft-Antispam-PRVS: <BN7PR04MB4228473BD2357609BA870A83C7179@BN7PR04MB4228.namprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CYRACjTHNXeoatFIV4VX3K+RqoafSNlUfB4eNu7EjsjeddUQKXah/YG/RFRvhi7D9BOubK3G6va17h8QKsoymX4rE+iuxDsI4+ggCSO4h6wIfYEoO9V4f+LiefoU5JmK/CKwTjwHZ1NANtncRdS0p5cYlxQQhjRHh7Wgr1hEMYvF2dtGRqMU0j5i+9J+rGdIZeh/DAwgB1WXpH1s9QXXqiQrKfpZLDvneMIgPAtGQA+ciiVPhDo6TNdbePCoVbFk7LbWOVpbQ/z7ZvG4RJcI76LJOY057MDy2/jpJSkcr29gXM6XMwyZDWUiA8mi2Nvgn6kUF8mhFXC+AtTraTpLKU2E0RY8pgUP/UeSHvKzjz05oisX6YWCCaR89ACdek1y8/O58eqG+fuzj1n5TQzQS19U503hNHMBCQ2iqCA9yHHZ2migwv4hz1ZRGoKxOW+Fy0zQErM05RsZHLlDHA+YXQUZ1LUUqgJfVMHxho23OKeS5LmmTM9sILhQmNmWMD6TxUa1suHDwpN1YaNoUb8hZPLiBah594zUiwghzLBfkt9DhR8v4bWV0HgPbGjF46x55ZCy2ckdU5zRPdfcDNXMZJ96p9hEMm6acu0and99/ZN9/LfNmAp5AKr/bPaQi7fEZU7B6q/TJYIZWT4ctd6IlqoppRiBe+cxhrUer1Gus1V506ycTN2rDG5PP1buoz69u2kaNYsTlB5nCh2llMsafw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(8936002)(186003)(1076003)(33656002)(55236004)(6506007)(2906002)(8676002)(6916009)(9686003)(26005)(86362001)(6512007)(5660300002)(107886003)(6666004)(53546011)(52116002)(7416002)(54906003)(6486002)(38100700002)(33716001)(4326008)(38350700002)(66946007)(66556008)(66476007)(316002)(83380400001)(508600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1G05xl5miLlkoctskU/vaehHztNOUcdzx/q0F7yqRhaAa5sC7SV8zyO9x9zL?=
 =?us-ascii?Q?XbuhJFJ0G91Y+7ryGIJ0+LF85z+2Q9Xlb29EFyI3o/+wdDjmIRoUhcD3HT4M?=
 =?us-ascii?Q?ECGCQyOj2PPaYcVToLOFaYxJT6JtcF5+ljpE1F+KTOeNzlE0bjmv2Llkg2nF?=
 =?us-ascii?Q?PqToBAI4oE7tc+ZkWWNjdJGn5uZzejFsp6Y3xcttkhc0U/ppJX1CYGjoBu1q?=
 =?us-ascii?Q?KL/gX59lhzzqlqSpDtqKW2AJ0SIa7CBdSyahOyMOmMA82sIfMzoIPIGdC0Xk?=
 =?us-ascii?Q?UnwcrqxjfcMGvUZJrgNE4TG04gHh9tUD/zu4XLaOLMzDUpX4G902Ji4f/WTK?=
 =?us-ascii?Q?PG/XRPdGc8zDBMFksj+SuAHctPHuRvG8mTJ2XIGuPisng15kGJc2rGBsbkJg?=
 =?us-ascii?Q?EFnBjrtFDBfRtL3bnGRK6uTzixwExuyag1EttJttElZ+UKQz2hEF5+RBWP9s?=
 =?us-ascii?Q?Fm/9SofKrSSbdsq+WMOFGCUMvSgncAfYX6uflZr7tqt+QD9m53zPqsnUYAfO?=
 =?us-ascii?Q?JNXQ2Z4xfud9eORytZ9GMgUSp0ambKZYo0XSDBypkxu0k/IMIx0e2hQ0a/NA?=
 =?us-ascii?Q?DpWwPxym+3olfzPNNTRRO5gk3XIyEi3i61L+DzTLe5dKeX431L+h3uo6dMc9?=
 =?us-ascii?Q?cj3XzBR3U0tbTIf6nIx7T1QWRqTk9rvLj5rxg6qgI5gq3e9/XbsIow6PTDdv?=
 =?us-ascii?Q?bjWTGZG1bUPnEkcYD3C3ilvKbF87mPvYTG73DO/bn8UUnLAhomgY64DQjJJN?=
 =?us-ascii?Q?97amo7bpQMC4k03W9usHSpaOD4yEdF4qF7ZANvWCPnVTw6G1QA0c9LUFzRSL?=
 =?us-ascii?Q?PTQqQU8zBMb6JnUfvfs9q/9/x3ZobqfyFViUIkEgzt69qvqUCYKdJBStl40v?=
 =?us-ascii?Q?G/I0PR3qYZwnb2yhSCgS+m/Y5r0q/yWFzTkiUAs5zSA2JXlwm2TxODTYvmPn?=
 =?us-ascii?Q?1472eSGG4oAhG63CYZ8NPjK1n4NVUegLuWo+9riwi9KYtfAttYe5CJirmVxL?=
 =?us-ascii?Q?TB8ZArw3+8ztOBeXxaY+vIIXP5hA9QqmX59ZexKxCaJaf4/uTEZmpc9NKte8?=
 =?us-ascii?Q?hkI6UsEbZohYPCL5UWUUYXDfAVNFy1Cax7qWCcEhWl0WSSoHvZ99tNLzUe43?=
 =?us-ascii?Q?TY9NMVI1hPltE4GWgTQsd3WggYHFce0QRDvEe+U7GG/LcYTCsG+eDC1PHtyv?=
 =?us-ascii?Q?6hC6STKLMiogZqiEIkcurHpIQr0UY9W+N1NDLhPF1LH64jjEM59n2iQNpnVl?=
 =?us-ascii?Q?cZtCi7CxHojj6Odmt4MVEvdrN9lZx2a3QYik9Bj1XXhXbcPkjp/1tEy/B1bc?=
 =?us-ascii?Q?6FfGXy2XgQZILtIefOeWjTLSdfwkyER3IcjDEHI2y6oCB8dAUy2T+28BHfSk?=
 =?us-ascii?Q?6Fq9t5CbQgnI8gaQYCT2PoOg21b+cbZmEaRVSZWdUGjR+3Gu8Dvpi1ruL9r4?=
 =?us-ascii?Q?QqJY+h3nwu8kMff9P9FFAP3X9RXlsvLz?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84138553-5f88-4ab1-572b-08da0beca7b5
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2022 10:13:48.2725 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wgQ5W44xYoHZlPC1AC7f6YMtjHUp0IQgykqzuBm8WyTvBN19TyP4wOG0QAtvCmNr7pXEaflVLo1NwDzZx3DUTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR04MB4228
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, qwen@analogixsemi.com,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, treapking@chromium.org,
 dri-devel@lists.freedesktop.org, pihsun@chromium.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, tzungbi@google.com,
 bliang@analogixsemi.com, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 22, 2022 at 05:16:43PM +0800, Chen-Yu Tsai wrote:
> On Tue, Mar 22, 2022 at 4:52 PM Xin Ji <xji@analogixsemi.com> wrote:
> >
> > On Tue, Mar 22, 2022 at 04:43:20PM +0800, Hsin-Yi Wang wrote:
> > > On Tue, Mar 22, 2022 at 4:02 PM Xin Ji <xji@analogixsemi.com> wrote:
> > > >
> > > > As downstream sink was set into standby mode while bridge disabled,
> > > > this patch used for setting downstream sink into normal status
> > > > while enable bridge.
> > > >
> > > > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > > > Reviewed-by: Pin-Yen Lin <treapking@chromium.org>
> > > >
> > > > ---
> > > > V1 -> V2: use dev_dbg replace of dev_info
> > > > ---
> > > >  drivers/gpu/drm/bridge/analogix/anx7625.c | 8 ++++++++
> > > >  1 file changed, 8 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > index 9a2a19ad4202..dcf3275a00fe 100644
> > > > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > @@ -924,12 +924,20 @@ static void anx7625_dp_start(struct anx7625_data *ctx)
> > > >  {
> > > >         int ret;
> > > >         struct device *dev = &ctx->client->dev;
> > > > +       u8 data;
> > > >
> > > >         if (!ctx->display_timing_valid) {
> > > >                 DRM_DEV_ERROR(dev, "mipi not set display timing yet.\n");
> > > >                 return;
> > > >         }
> > > >
> > > > +       dev_dbg(dev, "set downstream sink into normal\n");
> > > > +       /* Downstream sink enter into normal mode */
> > > > +       data = 1;
> > > > +       ret = anx7625_aux_trans(ctx, DP_AUX_NATIVE_WRITE, 0x000600, 1, &data);
> > > > +       if (ret < 0)
> > > > +               dev_err(dev, "IO error : set sink into normal mode fail\n");
> > > > +
> > >
> > > The driver uses DRM_DEV_* for logs. Can we use this?
> > Hi Hsin-Yi, as comment in drm/drm_print.h:
> > "NOTE: this is deprecated in favor of drm_dbg". DRM bridge driver not
> > use DRM_DEV_* any more. I'll send a patch to replace all of DRM_DEV_*
> > later.
> 
> drm_dbg is better than dev_dbg though. With the former, you still get the
> option to control it with the drm.debug module parameter, unlike the latter
> which normally gets compiled out.
> 
> Please use drm_dbg*.
> 
> ChenYu

Hi ChenYu, the parameter of drm_dbg is "drm", if use drm_dbg, it will
change more code, I'll consider to upstream new patch to replace all of
them later.

Thanks,
Xin
> 
> > Thanks,
> > Xin
> > >
> > > >         /* Disable HDCP */
> > > >         anx7625_write_and(ctx, ctx->i2c.rx_p1_client, 0xee, 0x9f);
> > > >
> > > > --
> > > > 2.25.1
> > > >
