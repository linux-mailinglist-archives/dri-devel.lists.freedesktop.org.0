Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B087420750
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 10:27:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67B6B6E959;
	Mon,  4 Oct 2021 08:27:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 066A86E959
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Oct 2021 08:27:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 6A4E6FB03;
 Mon,  4 Oct 2021 10:27:39 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yGsjUS830b5p; Mon,  4 Oct 2021 10:27:38 +0200 (CEST)
Date: Mon, 4 Oct 2021 10:27:27 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Ondrej Jirman <megous@megous.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 5/5] drm: mxsfb: Set proper default bus format when
 using a bridge
Message-ID: <YVq67wkOXUcqHJFz@qwark.sigxcpu.org>
References: <cover.1633332399.git.agx@sigxcpu.org>
 <15afbcb04dea432867bb9f8b0e47205decd4bd6e.1633332399.git.agx@sigxcpu.org>
 <3b557e62ad8f313d8fdfb352730cb9a0c5c2eb57.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3b557e62ad8f313d8fdfb352730cb9a0c5c2eb57.camel@pengutronix.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
On Mon, Oct 04, 2021 at 09:58:37AM +0200, Lucas Stach wrote:
> Am Montag, dem 04.10.2021 um 09:27 +0200 schrieb Guido Günther:
> > If a bridge doesn't do any bus format handling MEDIA_BUS_FMT_FIXED is
> > returned. Fallback to a reasonable default (MEDIA_BUS_FMT_RGB888_1X24) in
> > that case.
> > 
> > This unbreaks e.g. using mxsfb with the nwl bridge and mipi panels.
> > 
> > Fixes: b776b0f00f24 ("drm: mxsfb: Use bus_format from the nearest bridge if present")
> > 
> I don't think this qualifies for stable, so I would drop this tag, as
> the stable maintainers are quite trigger happy to pull in patches with
> a fixes tag. Also the subject isn't quite correct, this isn't setting a
> "proper" bus format, but rather adds a fallback. Other than that:

Adjusted for v3 (which I'll hold off a bit in case there are more
comments) and dropped the Fixes: tag which is on the nwl driver
only now. thanks!
 -- Guido

> 
> Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
> 
> Regards,
> Lucas
> 
> > Reported-by: Martin Kepplinger <martink@posteo.de>
> > Signed-off-by: Guido Günther <agx@sigxcpu.org>
> 
> > ---
> >  drivers/gpu/drm/mxsfb/mxsfb_kms.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> > index d6abd2077114..e3fbb8b58d5d 100644
> > --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> > +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> > @@ -369,6 +369,12 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
> >  			drm_atomic_get_new_bridge_state(state,
> >  							mxsfb->bridge);
> >  		bus_format = bridge_state->input_bus_cfg.format;
> > +		if (bus_format == MEDIA_BUS_FMT_FIXED) {
> > +			dev_warn_once(drm->dev,
> > +				      "Bridge does not provide bus format, assuming MEDIA_BUS_FMT_RGB888_1X24.\n"
> > +				      "Please fix bridge driver by handling atomic_get_input_bus_fmts.\n");
> > +			bus_format = MEDIA_BUS_FMT_RGB888_1X24;
> > +		}
> >  	}
> >  
> >  	/* If there is no bridge, use bus format from connector */
> 
> 
