Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9453D3AEB3D
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 16:27:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FEBE6E17F;
	Mon, 21 Jun 2021 14:27:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 397BE6E17F
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 14:27:49 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7B6B75D6B;
 Mon, 21 Jun 2021 16:27:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1624285667;
 bh=7L3oTmVXoz7x5fNyzOZRs2Vf9NqEwqMSuOKnDXVsMC8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Tyjk+gjuggWCdEMcb3SdTePBeyfnl9wB2zuMp1n6UwdfzD7Q0aPq+9XyTstU3ggkJ
 15Zl1dq9LzahQwviLSPMXAnCWiYRRSUe7ddcUqJsqJ99YbdY7U5Z+JY+KK4R9JVvv6
 6mX79t4+O1EN1slk1Xg1UeOy5nTkfHkQ9sxLLI/o=
Date: Mon, 21 Jun 2021 17:27:21 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Stefan =?utf-8?Q?Riedm=C3=BCller?= <S.Riedmueller@phytec.de>
Subject: Re: [PATCH 1/3] drm/panel: Add connector_type and bus_format for AUO
 G104SN02 V2 panel
Message-ID: <YNChySKddg/JsMZv@pendragon.ideasonboard.com>
References: <20210415091616.53415-1-s.riedmueller@phytec.de>
 <57bf547d95ba84f72d0f9da0e687fbe71311e5b8.camel@phytec.de>
 <5942e9c67f7d50737536613b80a2cb42a3615b3d.camel@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5942e9c67f7d50737536613b80a2cb42a3615b3d.camel@phytec.de>
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "sam@ravnborg.org" <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stefan,

Thank you for the patch.

On Mon, Jun 21, 2021 at 08:22:10AM +0000, Stefan Riedmüller wrote:
> Hi,
> 
> another gentle ping.

Sorry for the delay, I have way too little bandwidth these days :-S

> Also adding Laurent Pinchart to CC.
>
> On Wed, 2021-05-26 at 07:34 +0000, Stefan Riedmüller wrote:
> > On Thu, 2021-04-15 at 11:16 +0200, Stefan Riedmueller wrote:
> > > The AUO G104SN02 V2 is an LVDS display which supports 6 and 8 bpc PSWG.
> > > Add the corresponding connector type and 8 bpc as default bus_format.
> > > 
> > > Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

It will be interesting to add support for the 6bpp mode at some point (I
assume through a custom DT property that reports the state of the
panel's SEL68 pin, as it should be strapped in most cases).

> > > ---
> > >  drivers/gpu/drm/panel/panel-simple.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/panel/panel-simple.c
> > > b/drivers/gpu/drm/panel/panel-simple.c
> > > index 4e2dad314c79..44583d0ed902 100644
> > > --- a/drivers/gpu/drm/panel/panel-simple.c
> > > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > > @@ -1098,6 +1098,8 @@ static const struct panel_desc auo_g104sn02 = {
> > >  		.width = 211,
> > >  		.height = 158,
> > >  	},
> > > +	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> > > +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> > >  };
> > >  
> > >  static const struct drm_display_mode auo_g121ean01_mode = {

-- 
Regards,

Laurent Pinchart
