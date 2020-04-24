Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B1C1B6EBB
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 09:15:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFE906EA82;
	Fri, 24 Apr 2020 07:15:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2099.outbound.protection.outlook.com [40.107.92.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46DE86EA71
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 06:51:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kyj0OEqJld9fxHTYwAxeN/i6O17nUPWE58XPXl6Ms8/1AfdgBCYnyYGW6e1ZMkZ8mzu4U+aXhV7IvYEgX0e9Bwv0yTd8ow/m2Wy7QFaKXUwSkkq+KHQSZjemBx6/TUeXqA3L4TOlYVtinsqWmegINW5Pkk/7cYye6EtC/CjjolJm5ByyR4Fj+pqkHFUE5c/7SLsQpfpRE5iGgdhYmtUvQTjpKr7EMXoDOtiobvdL3MuMlIU+a+EG1Kgcp7jDG26aHwv+0LAdz0qJ5DtNedbRUhtZpYL4P3ZQxTQ4nqKGDIQt+2VxR65lXhx8VJRcwhGeh9Kkh6DTGd62Qen0OUzPRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5+K/zYEtWLLkYt899xdr3onmc+0JXgF4WWsPpVU9VTg=;
 b=hSXCyzO02VuyIy1N+/kDoPzwjsdVz05ESQJJNce/rv7psIl1MoleP51Hg9rhCFEfFwBMh0NoW+A/uv6sdMzJS558bGgYDimZi8Fzsf7bvtNGEQr8DT4z6Ku1+gRa9r3rTkDx374LYY9vQXSwESHzl55yFEHDiB11RWJBstI8bN/r+Fty+tM+vRIRGTY8PEbBw60REdaTvH4yCvaKOjfyeIk3tBEi6PRBjTaQua0FdIuf1f7/08Vatyul/++8mD44mpyOPFwCfMQgl5ZyHQuQePkIfMArZpo0m4VP3mmcVNCD2ktmoonRTiGc7lwpiPfzx/wYk65erdqXYapXbn1xJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5+K/zYEtWLLkYt899xdr3onmc+0JXgF4WWsPpVU9VTg=;
 b=ARLOFE8mpaLHhN1C6r48TU3yZc8DNeX/1uId0zrO+dPFItuJxk30Ma86t8eDAaG33EdJJ0letuA88cBEj+L9tVic8zxdPKBa+YC3+UXvqSEjhH6iqFAtVfm9EWYZmi+txw3MAF/UcOFQ1pDSAPEQMVF71BQneKPxO4zNIxOTWPg=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=xji@analogixsemi.com; 
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BY5PR04MB7107.namprd04.prod.outlook.com (2603:10b6:a03:22f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.27; Fri, 24 Apr
 2020 06:51:33 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::4517:bcc8:a3bd:407f]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::4517:bcc8:a3bd:407f%6]) with mapi id 15.20.2921.030; Fri, 24 Apr 2020
 06:51:33 +0000
Date: Fri, 24 Apr 2020 14:51:25 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Nicolas Boichat <drinkcat@chromium.org>
Subject: Re: [PATCH v7 2/2] drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to
 DP bridge driver
Message-ID: <20200424065124.GA31922@xin-VirtualBox>
References: <cover.1582529411.git.xji@analogixsemi.com>
 <a81adcf2e79d440edcb7b3989f31efcb80a6e9ff.1582529411.git.xji@analogixsemi.com>
 <CANMq1KBfB6tXFqYGvr=8fV_bpCV5GbVHeEbRs+fuaZba65-OPw@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CANMq1KBfB6tXFqYGvr=8fV_bpCV5GbVHeEbRs+fuaZba65-OPw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-ClientProxiedBy: HK2PR02CA0194.apcprd02.prod.outlook.com
 (2603:1096:201:21::30) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xin-VirtualBox (114.247.245.254) by
 HK2PR02CA0194.apcprd02.prod.outlook.com (2603:1096:201:21::30) with Microsoft
 SMTP Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id
 15.20.2937.13 via Frontend Transport; Fri, 24 Apr 2020 06:51:32 +0000
X-Originating-IP: [114.247.245.254]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed264fab-2b30-4a02-6b2b-08d7e81beced
X-MS-TrafficTypeDiagnostic: BY5PR04MB7107:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR04MB710786FED4BB327686FFCAF5C7D00@BY5PR04MB7107.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 03838E948C
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(39840400004)(366004)(396003)(136003)(346002)(376002)(2906002)(478600001)(6496006)(16526019)(186003)(66556008)(33716001)(54906003)(107886003)(26005)(316002)(66946007)(66476007)(86362001)(52116002)(4326008)(53546011)(9686003)(8676002)(1076003)(8936002)(55016002)(33656002)(5660300002)(6666004)(81156014)(956004)(7416002)(6916009);
 DIR:OUT; SFP:1102; 
Received-SPF: None (protection.outlook.com: analogixsemi.com does not
 designate permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dbY7EGESs+tn09HUp2sN8PPgwYlku1KP7aFBdwU+tApM16rrFwQemUhUC9Ir+elbzAU2x0MAAkIYKI6aG3Tk4IwH9VTyIhUPCkC+ocWzfq2y9Ol1+H4UjROfVdZ7ZzrUHk79rk0xLa8bV2WmncWI68z63IgHKckY461grJY9nQ2z6yLJFYzM6UiyLAS7Yh4WXCIadCZ2kK5RcnL0h0CWKYhP7LbWEJR1cUTBJpQGkjsl0eeA3lKxfDkx+Y037ODZ/UMiEbedKu4vgUuro0W/me70/7OCWBo1nXo3bGKASZBqzqZ5ZXIpflmRScDaHoGqzu8yOA86rqhmE3jsliB/hDdTW5KBdE4DJQdePfL7WyJrv6/mefP9MPU3vvs2s98K1Jvt5WrGHY8DL97YLM3Fkz2XEiUan2Ahsjeewh/U/w/gu+2OpxcGw2qa3vjp+Y6n
X-MS-Exchange-AntiSpam-MessageData: 41Esy56dCLI+1vaQ5wrReK5u2kT7ZJgNlTuarADgQIOfQ4Vj/osKy/yySe5pz8SSZSFF1bvlK3EzbwLnTADPbiND2Lguk5BKI4c5zF5oav0V1cMGjLo5KzZcsWLSe+bCYcOz6703Hxu1CCa+iRwMiQ==
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed264fab-2b30-4a02-6b2b-08d7e81beced
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2020 06:51:33.5745 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jPOzm+3x85Jm8M+E65WQnCj7ZCkIpB856jJxpBp18e28XjkBALQdOe4cO9+e+DOZn7avOkh3CED+vae5QcwLIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB7107
X-Mailman-Approved-At: Fri, 24 Apr 2020 07:15:40 +0000
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
Cc: devel@driverdev.osuosl.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Pi-Hsun Shih <pihsun@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, Sheng Pan <span@analogixsemi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 23, 2020 at 07:55:15PM +0800, Nicolas Boichat wrote:
> Hi,
> 
> Just commenting on the mode_fixup function that was added in v7.
> 
> On Tue, Feb 25, 2020 at 2:15 PM Xin Ji <xji@analogixsemi.com> wrote:
> >
> > The ANX7625 is an ultra-low power 4K Mobile HD Transmitter designed
> > for portable device. It converts MIPI DSI/DPI to DisplayPort 1.3 4K.
> >
> > The ANX7625 can support both USB Type-C PD feature and MIPI DSI/DPI
> > to DP feature. This driver only enabled MIPI DSI/DPI to DP feature.
> >
> > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > ---
> >  drivers/gpu/drm/bridge/Makefile           |    2 +-
> >  drivers/gpu/drm/bridge/analogix/Kconfig   |    6 +
> >  drivers/gpu/drm/bridge/analogix/Makefile  |    1 +
> >  drivers/gpu/drm/bridge/analogix/anx7625.c | 2172 +++++++++++++++++++++++++++++
> >  drivers/gpu/drm/bridge/analogix/anx7625.h |  410 ++++++
> >  5 files changed, 2590 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/gpu/drm/bridge/analogix/anx7625.c
> >  create mode 100644 drivers/gpu/drm/bridge/analogix/anx7625.h
> >
> > diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> > index 4934fcf..bcd388a 100644
> > --- a/drivers/gpu/drm/bridge/Makefile
> > +++ b/drivers/gpu/drm/bridge/Makefile
> [snip]
> > +static bool anx7625_bridge_mode_fixup(struct drm_bridge *bridge,
> > +                                     const struct drm_display_mode *mode,
> > +                                     struct drm_display_mode *adj)
> > +{
> > +       struct anx7625_data *ctx = bridge_to_anx7625(bridge);
> > +       struct device *dev = &ctx->client->dev;
> > +       u32 hsync, hfp, hbp, hactive, hblanking;
> > +       u32 adj_hsync, adj_hfp, adj_hbp, adj_hblanking, delta_adj;
> > +       u32 vref, adj_clock;
> > +
> > +       DRM_DEV_DEBUG_DRIVER(dev, "drm mode fixup set\n");
> > +
> > +       mutex_lock(&ctx->lock);
> 
> Why do you need this lock?
Seems no need this lock, I'll remove it.
> 
> > +
> > +       hactive = mode->hdisplay;
> 
> This is never used, drop it?
OK, I'll drop it.
> 
> > +       hsync = mode->hsync_end - mode->hsync_start;
> > +       hfp = mode->hsync_start - mode->hdisplay;
> > +       hbp = mode->htotal - mode->hsync_end;
> > +       hblanking = mode->htotal - mode->hdisplay;
> > +
> > +       DRM_DEV_DEBUG_DRIVER(dev, "before mode fixup\n");
> > +       DRM_DEV_DEBUG_DRIVER(dev, "hsync(%d),hfp(%d),hbp(%d),clock(%d)\n",
> > +                            hsync,
> > +                            hfp,
> > +                            hbp,
> > +                            adj->clock);
> > +       DRM_DEV_DEBUG_DRIVER(dev, "hsync_start(%d),hsync_end(%d),htotal(%d)\n",
> > +                            adj->hsync_start,
> > +                            adj->hsync_end,
> > +                            adj->htotal);
> > +
> > +       adj_hfp = hfp;
> > +       adj_hsync = hsync;
> > +       adj_hbp = hbp;
> > +       adj_hblanking = hblanking;
> > +
> > +       /* plus 1 if hfp is odd */
> 
> A better way to word these comments is to say "hfp needs to be even",
> otherwise, you're just repeating what we can already see in the code.
OK
> 
> > +       if (hfp & 0x1) {
> > +               adj_hfp = hfp + 1;
> 
> adj_hfp -= 1 for consistency?
OK
> 
> > +               adj_hblanking += 1;
> > +       }
> > +
> > +       /* minus 1 if hbp is odd */
> > +       if (hbp & 0x1) {
> > +               adj_hbp = hbp - 1;
> 
> ditto, adj_hbp -= 1;
OK
> 
> > +               adj_hblanking -= 1;
> > +       }
> > +
> > +       /* plus 1 if hsync is odd */
> > +       if (hsync & 0x1) {
> > +               if (adj_hblanking < hblanking)
> > +                       adj_hsync = hsync + 1;
> 
> ditto
OK
> 
> > +               else
> > +                       adj_hsync = hsync - 1;
> 
> ditto
OK
> 
> > +       }
> > +
> > +       /*
> > +        * once illegal timing detected, use default HFP, HSYNC, HBP
> > +        */
> > +       if (hblanking < HBLANKING_MIN || (hfp < HP_MIN && hbp < HP_MIN)) {
> 
> should this be adj_hblanking/adj_hfp/adj_hbp?
NO, need check original HFP and HBP, if they are not legal, driver need
set default value to adj_hsync, adj_hfp, adj_hbp.
> 
> > +               adj_hsync = SYNC_LEN_DEF;
> > +               adj_hfp = HFP_HBP_DEF;
> > +               adj_hbp = HFP_HBP_DEF;
> > +               vref = adj->clock * 1000 / (adj->htotal * adj->vtotal);
> > +               if (hblanking < HBLANKING_MIN) {
> > +                       delta_adj = HBLANKING_MIN - hblanking;
> > +                       adj_clock = vref * delta_adj * adj->vtotal;
> > +                       adj->clock += DIV_ROUND_UP(adj_clock, 1000);
> > +               } else {
> > +                       delta_adj = hblanking - HBLANKING_MIN;
> > +                       adj_clock = vref * delta_adj * adj->vtotal;
> > +                       adj->clock -= DIV_ROUND_UP(adj_clock, 1000);
> > +               }
> > +
> > +               DRM_WARN("illegal hblanking timing, use default.\n");
> > +               DRM_WARN("hfp(%d),hbp(%d),hsync(%d).\n", hfp, hbp, hsync);
> 
> How likely is it that this mode is going to work? Can you just return
> false here to reject the mode?
We want to set the default minimal Hblancking value, then it may display,
otherwise. If we just return false, there is no display for sure.
> 
> > +       } else if (adj_hfp < HP_MIN) {
> > +               /* adjust hfp if hfp less than HP_MIN */
> > +               delta_adj = HP_MIN - adj_hfp;
> > +               adj_hfp = HP_MIN;
> > +
> > +               /*
> > +                * balance total HBlanking pixel, if HBP hasn't enough space,
> 
> "does not have enough space"
OK
> 
> > +                * adjust HSYNC length, otherwize adjust HBP
> 
> otherwise
OK
> 
> > +                */
> > +               if ((adj_hbp - delta_adj) < HP_MIN)
> > +                       /* hbp not enough space */
> > +                       adj_hsync -= delta_adj;
> > +               else
> > +                       adj_hbp -= delta_adj;
> > +       } else if (adj_hbp < HP_MIN) {
> > +               delta_adj = HP_MIN - adj_hbp;
> > +               adj_hbp = HP_MIN;
> > +
> > +               /*
> > +                * balance total HBlanking pixel, if HBP hasn't enough space,
> > +                * adjust HSYNC length, otherwize adjust HBP
> > +                */
> > +               if ((adj_hfp - delta_adj) < HP_MIN)
> > +                       /* hbp not enough space */
> > +                       adj_hsync -= delta_adj;
> > +               else
> > +                       adj_hfp -= delta_adj;
> > +       }
> > +
> > +       DRM_DEV_DEBUG_DRIVER(dev, "after mode fixup\n");
> > +       DRM_DEV_DEBUG_DRIVER(dev, "hsync(%d),hfp(%d),hbp(%d),clock(%d)\n",
> 
> Add spaces after commas in your debug strings (same above and below).
OK
> 
> > +                            adj_hsync,
> > +                            adj_hfp,
> > +                            adj_hbp,
> > +                            adj->clock);
> 
> Put these 4 on a single line.
OK
> 
> > +
> > +       /* reconstruct timing */
> > +       adj->hsync_start = adj->hdisplay + adj_hfp;
> > +       adj->hsync_end = adj->hsync_start + adj_hsync;
> > +       adj->htotal = adj->hsync_end + adj_hbp;
> > +       DRM_DEV_DEBUG_DRIVER(dev, "hsync_start(%d),hsync_end(%d),htotal(%d)\n",
> > +                            adj->hsync_start,
> > +                            adj->hsync_end,
> > +                            adj->htotal);
> > +
> > +       mutex_unlock(&ctx->lock);
> > +
> > +       return true;
> > +}
> > +
> > [snip]
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
