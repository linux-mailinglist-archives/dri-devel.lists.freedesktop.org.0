Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 012D27B8375
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 17:23:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7F9510E14E;
	Wed,  4 Oct 2023 15:22:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0305710E14E
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Oct 2023 15:22:55 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mtr@pengutronix.de>)
 id 1qo3i3-0002p0-Lg; Wed, 04 Oct 2023 17:22:47 +0200
Received: from [2a0a:edc0:2:b01:1d::c0] (helo=ptx.whiteo.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mtr@pengutronix.de>)
 id 1qo3i1-00B3vw-5O; Wed, 04 Oct 2023 17:22:45 +0200
Received: from mtr by ptx.whiteo.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <mtr@pengutronix.de>)
 id 1qo3i1-00Cmdh-0E; Wed, 04 Oct 2023 17:22:45 +0200
Date: Wed, 4 Oct 2023 17:22:44 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
To: Adam Ford <aford173@gmail.com>
Subject: Re: [PATCH 1/5] drm/bridge: samsung-dsim: add more mipi-dsi device
 debug information
Message-ID: <20231004152244.GD3042281@pengutronix.de>
References: <20230818-samsung-dsim-v1-0-b39716db6b7a@pengutronix.de>
 <20230818-samsung-dsim-v1-1-b39716db6b7a@pengutronix.de>
 <CAHCN7x+J_umWCBvivuZsrHTvjw=4CvBqOSeO-j_+fTMm=DdAOg@mail.gmail.com>
 <CAAQKjZM9UGgzAgfg-Rt92BNdvLuUJ90=QRUrd=FnDFwGvoC-zA@mail.gmail.com>
 <CAHCN7xJLH2oBzvn6V0VRpisr1Pmh3knx0t0Vesck5q_-RGnN6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHCN7xJLH2oBzvn6V0VRpisr1Pmh3knx0t0Vesck5q_-RGnN6A@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 kernel@pengutronix.de, Jonas Karlman <jonas@kwiboo.se>,
 Marco Felsch <m.felsch@pengutronix.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 27 Sep 2023 07:47:53 -0500, Adam Ford wrote:
> On Sun, Sep 3, 2023 at 8:05 PM Inki Dae <daeinki@gmail.com> wrote:
> >
> > 2023년 8월 29일 (화) 오전 7:38, Adam Ford <aford173@gmail.com>님이 작성:
> > >
> > > On Mon, Aug 28, 2023 at 10:59 AM Michael Tretter
> > > <m.tretter@pengutronix.de> wrote:
> > > >
> > > > From: Marco Felsch <m.felsch@pengutronix.de>
> > > >
> > > > Since the MIPI configuration can be changed on demand it is very useful
> > > > to print more MIPI settings during the MIPI device attach step.
> > > >
> > > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> > >
> > > Reviewed-by: Adam Ford <aford173@gmail.com>  #imx8mm-beacon
> > > Tested-by: Adam Ford <aford173@gmail.com>  #imx8mm-beacon
> >
> > Reviewed-by: Inki Dae <inki.dae@samsung.com>
> > Acked-by: Inki Dae <inki.dae@samsung.com>
> 
> What needs to be done in order to get this accepted?  This series is a
> very nice improvement in i.MX8M Mini / Nano.

I think it is my turn to send a v2 that addresses the review comments. I'll
try to find time this week.

Michael

> 
> adam
> >
> > >
> > > > ---
> > > >  drivers/gpu/drm/bridge/samsung-dsim.c | 5 ++++-
> > > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> > > > index 73ec60757dbc..6778f1751faa 100644
> > > > --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> > > > +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> > > > @@ -1711,7 +1711,10 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
> > > >                 return ret;
> > > >         }
> > > >
> > > > -       DRM_DEV_INFO(dev, "Attached %s device\n", device->name);
> > > > +       DRM_DEV_INFO(dev, "Attached %s device (lanes:%d bpp:%d mode-flags:0x%lx)\n",
> > > > +                    device->name, device->lanes,
> > > > +                    mipi_dsi_pixel_format_to_bpp(device->format),
> > > > +                    device->mode_flags);
> > > >
> > > >         drm_bridge_add(&dsi->bridge);
> > > >
> > > >
> > > > --
> > > > 2.39.2
> > > >
> 
