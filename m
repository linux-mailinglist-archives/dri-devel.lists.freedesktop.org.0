Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA58F2AD194
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 09:46:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74024897E9;
	Tue, 10 Nov 2020 08:46:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA11F897E9
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 08:46:04 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mtr@pengutronix.de>)
 id 1kcPHv-000491-8s; Tue, 10 Nov 2020 09:46:03 +0100
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <mtr@pengutronix.de>)
 id 1kcPHt-0002WC-Lt; Tue, 10 Nov 2020 09:46:01 +0100
Date: Tue, 10 Nov 2020 09:46:01 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
To: Adam Ford <aford173@gmail.com>
Subject: Re: [PATCH v2 01/16] drm/encoder: remove obsolete documentation of
 bridge
Message-ID: <20201110084601.GD13669@pengutronix.de>
References: <20200911135413.3654800-1-m.tretter@pengutronix.de>
 <20200911135413.3654800-2-m.tretter@pengutronix.de>
 <CAHCN7xKAHm0cvh+7rb1wxF+UqE2Fs48nYF7=rWm7E9ipy2Jtmw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHCN7xKAHm0cvh+7rb1wxF+UqE2Fs48nYF7=rWm7E9ipy2Jtmw@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:28:50 up 264 days, 15:59, 89 users,  load average: 0.12, 0.17,
 0.18
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
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
Cc: linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com,
 Neil Armstrong <narmstrong@baylibre.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, sw0312.kim@samsung.com,
 dri-devel <dri-devel@lists.freedesktop.org>, a.hajda@samsung.com,
 Krzysztof Kozlowski <krzk@kernel.org>, Sascha Hauer <kernel@pengutronix.de>,
 sylvester.nawrocki@gmail.com,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 07 Nov 2020 09:07:19 -0600, Adam Ford wrote:
> On Fri, Sep 11, 2020 at 8:54 AM Michael Tretter
> <m.tretter@pengutronix.de> wrote:
> >
> > In commit 05193dc38197 ("drm/bridge: Make the bridge chain a
> > double-linked list") the bridge has been removed and replaced by a
> > private field. Remove the leftover documentation of the removed field.
> >
> > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> What is the status of this series?  I know of at least one other patch
> series depending on this.

Sorry for that. I lately didn't have time to work on the series.

There are two big open TODOs:

- How should this bridge react if there is no out bridge available, yet? This
  series implements a static approach by returning EPROBE_DEFER from
  bridge_attach if there isn't a next bridge, connector or display. Andrezej
  suggested a dynamic approach which allows to attach this bridge without a
  next bridge and dynamically add further bridges/panels. The latter approach
  didn't work with the mxsfb driver, but I didn't have time to look into this.

- The component framework stuff that allows to use the bridge with the Exynos
  driver should not go into the bridge driver, but stay in the platform part.

Michael

> 
> adam
> 
> > ---
> > v2: none
> > ---
> >  include/drm/drm_encoder.h | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
> > index a60f5f1555ac..5dfa5f7a80a7 100644
> > --- a/include/drm/drm_encoder.h
> > +++ b/include/drm/drm_encoder.h
> > @@ -89,7 +89,6 @@ struct drm_encoder_funcs {
> >   * @head: list management
> >   * @base: base KMS object
> >   * @name: human readable name, can be overwritten by the driver
> > - * @bridge: bridge associated to the encoder
> >   * @funcs: control functions
> >   * @helper_private: mid-layer private data
> >   *
> > --
> > 2.20.1
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
