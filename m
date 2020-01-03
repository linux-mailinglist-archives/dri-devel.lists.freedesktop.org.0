Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A86130216
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jan 2020 12:24:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ECE06E42C;
	Sat,  4 Jan 2020 11:23:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D08F6E17A
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2020 05:34:25 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id q10so23053149pfs.6
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jan 2020 21:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=bDjKFqnEc5rR/oxlZF7gmCvyShgs1hNiVY4NgOn+4HA=;
 b=leOOQHhjDy4DBo5vLTBMb3ON49SxV7dlM+nLIDV5jgg/A938TDw470FpBHkfMF5LMo
 2KLvwy8WWuGY6UxhG0FaK/M9gSATXQSpdrWmaG9RZ3ySYXnpSp5VB3Ff4d0ndMM1bfJv
 tVE5gBkPkeqIGAxZcgz0P/JASFIBgADMQGk6FJiPV3Ujyv9CgkgPr+KqXmfKxN5R5IGV
 yBQKC39aqMELQUMw9l4TnKjVFI5HWpfk6NxC1QgCRUR7LZ9KjqvIrzxvXNkz/DEsEwei
 Q+XUrkxyHMHc3rn55Mut+Dg7NIr3BfST0D06f/+6H99R5gZfKYrOeEMH5lOI/5wl76NY
 7eOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bDjKFqnEc5rR/oxlZF7gmCvyShgs1hNiVY4NgOn+4HA=;
 b=JLRQy1FOa8wKz3jFTt20LSdjXVW6FKZGYGhrlDPaA5gOqrhpAxdO+gD6rHMYaM82dY
 ZxzaK9e1uXvTU7Wbmtn4oedUV1/gslH7cPeoBWAjyasgzipcJC4jAf1QoPDCQoAB/wmU
 epLZI5YDcXBUu+J/d013YCzQdevitTE2Z1/tf61RgteIi56HvQS84QD4qfMmwenm1oZY
 LUZojpfIHhlzSnkpU3HrmzQuIl2IOS9JwjJNZgI5PMcPtuILoID5WVIRLFcBEsbbLU6E
 9ZpachtTIDMshc+8uNSpvGOm86EP8AQsqC/xQgaMEXNyiXVR8DmnBqb+dspPHZ15JbAz
 1Zlw==
X-Gm-Message-State: APjAAAX+jZ/mhv1ewE+Nh5u1baj+KiWEQkZeuPEGrhhU9sUoEZ/1qZYu
 YKLIhPAixiGobxXv0EJNW1ZL2g==
X-Google-Smtp-Source: APXvYqw01Mk2UnLpuuSD4hXiHUkrKtsnZuPZOtZokYUsL3OKvjbi5AoZEMma4j0uGAspkSfOSSo1hg==
X-Received: by 2002:a63:f5c:: with SMTP id 28mr95454017pgp.348.1578029664658; 
 Thu, 02 Jan 2020 21:34:24 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id s24sm12780879pjp.17.2020.01.02.21.34.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2020 21:34:23 -0800 (PST)
Date: Thu, 2 Jan 2020 21:34:20 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] panel: simple: Add Ivo M133NWF4 R0
Message-ID: <20200103053420.GT549437@yoga>
References: <20191229060658.746189-1-bjorn.andersson@linaro.org>
 <20200102085557.GA29446@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200102085557.GA29446@ravnborg.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Approved-At: Sat, 04 Jan 2020 11:23:45 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu 02 Jan 00:55 PST 2020, Sam Ravnborg wrote:

> Hi Bjorn.
> 
> On Sat, Dec 28, 2019 at 10:06:58PM -0800, Bjorn Andersson wrote:
> > The InfoVision Optoelectronics M133NWF4 R0 panel is a 13.3" 1920x1080
> > eDP panel, add support for it in panel-simple.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >  drivers/gpu/drm/panel/panel-simple.c | 31 ++++++++++++++++++++++++++++
> >  1 file changed, 31 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > index ba3f85f36c2f..d7ae0ede2b6e 100644
> > --- a/drivers/gpu/drm/panel/panel-simple.c
> > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > @@ -1806,6 +1806,34 @@ static const struct panel_desc innolux_zj070na_01p = {
> >  	},
> >  };
> >  
> > +static const struct drm_display_mode ivo_m133nwf4_r0_mode = {
> > +	.clock = 138778,
> > +	.hdisplay = 1920,
> > +	.hsync_start = 1920 + 24,
> > +	.hsync_end = 1920 + 24 + 48,
> > +	.htotal = 1920 + 24 + 48 + 88,
> > +	.vdisplay = 1080,
> > +	.vsync_start = 1080 + 3,
> > +	.vsync_end = 1080 + 3 + 12,
> > +	.vtotal = 1080 + 3 + 12 + 17,
> > +	.vrefresh = 60,
> > +	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
> > +};
> > +
> > +static const struct panel_desc ivo_m133nwf4_r0 = {
> > +	.modes = &ivo_m133nwf4_r0_mode,
> > +	.num_modes = 1,
> > +	.bpc = 8,
> > +	.size = {
> > +		.width = 294,
> > +		.height = 165,
> > +	},
> > +	.delay = {
> > +		.hpd_absent_delay = 200,
> > +		.unprepare = 500,
> > +	},
> > +};
> 
> For new bindings - at least add connector_type.
> And consider bus_format and bus_flags too.
> 

Sure thing, will update the two patches.

> 
> > +
> >  static const struct display_timing koe_tx14d24vm1bpa_timing = {
> >  	.pixelclock = { 5580000, 5850000, 6200000 },
> >  	.hactive = { 320, 320, 320 },
> > @@ -3266,6 +3294,9 @@ static const struct of_device_id platform_of_match[] = {
> >  	}, {
> >  		.compatible = "innolux,zj070na-01p",
> >  		.data = &innolux_zj070na_01p,
> > +	}, {
> > +		.compatible = "ivo,m133nwf4-r0",
> Compatible must be documented in a binding file.
> We are discussing a new binding format where it is simple to add
> a new panel. But no final conclusion yet.
> 

Okay, will spin some DT bindings for these as well.

Thanks,
Bjorn

> The comments above (in panel_desc and here) also apply for the
> other patch you sent.
> 
> 	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
