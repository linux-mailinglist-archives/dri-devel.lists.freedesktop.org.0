Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A69D38B52F3
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 10:18:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC4A1121CC;
	Mon, 29 Apr 2024 08:18:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=geanix.com header.i=@geanix.com header.b="i1bTl/hz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C69710FDD3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2024 08:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID; bh=qOH6rUKw03bYbHURcR2tw2iTp/UFU+PE0TGB9GL0+A0=; b=i1bTl/
 hzU7YEUpk67a0CO1xq8fRzf4238DJyWZcUo4jK1lQ2wV98xBhXJHp6Za4xEURIjFsv/IbVJGbls2k
 zqIURChqL6L79qHK9plksvHc9Wh0PTJdDfJSTNcg4mnn2QojKaYTo7f/dDN1WBzysqFERHiHKTByl
 4sCPOqEicXAgG7to1LdRgyUyo1r7ufGi21dpMMCAsRurzyseVh5CrAqOH1HVg20Q7OfogcqzVWIW4
 e4ArVoSwEz01+piN9Lu3mniUY7S9lGDxpEaRolSWSyY85Y7D5tI2amunWqoJ6bqK36c/j6ZWVUtgR
 YY7+85mMbiGvGU3Q/B24yCVeGxtg==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <sean@geanix.com>)
 id 1s1MCp-000MfJ-51; Mon, 29 Apr 2024 10:17:47 +0200
Received: from [185.17.218.86] (helo=Seans-MacBook-Pro.local)
 by sslproxy04.your-server.de with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.96) (envelope-from <sean@geanix.com>) id 1s1MCo-000MjY-0K;
 Mon, 29 Apr 2024 10:17:46 +0200
Date: Mon, 29 Apr 2024 10:17:45 +0200
From: Sean Nyekjaer <sean@geanix.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Robert Foss <rfoss@kernel.org>, Antonio Borneo <antonio.borneo@foss.st.com>, 
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/stm: dsi: relax mode_valid clock tolerance
Message-ID: <cvzecixldubeq7pwn77cggs7tcwc5on3arlnboj4fbpqgdygtu@hat3r6afzu7y>
References: <20240322104732.2327060-1-sean@geanix.com>
 <20240424-famous-fascinating-hyena-8fb3a7@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240424-famous-fascinating-hyena-8fb3a7@houat>
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27259/Sun Apr 28 10:22:36 2024)
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

On Wed, Apr 24, 2024 at 09:21:17AM UTC, Maxime Ripard wrote:
> Hi,
> 
> Sorry, my previous review didn't go through.
> 
> On Fri, Mar 22, 2024 at 11:47:31AM +0100, Sean Nyekjaer wrote:
> > When using the DSI interface via DSI2LVDS bridge, it seems a bit harsh
> > to reguire the requested and the actual px clock to be within
> > 50Hz. A typical LVDS display requires the px clock to be within +-10%.
> > 
> > In case for HDMI .5% tolerance is required.
> > 
> > Fixes: e01356d18273 ("drm/stm: dsi: provide the implementation of mode_valid()")
> > Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> > ---
> >  drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 7 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
> > index d5f8c923d7bc..97936b0ef702 100644
> > --- a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
> > +++ b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
> > @@ -322,8 +322,6 @@ dw_mipi_dsi_phy_get_timing(void *priv_data, unsigned int lane_mbps,
> >  	return 0;
> >  }
> >  
> > -#define CLK_TOLERANCE_HZ 50
> > -
> >  static enum drm_mode_status
> >  dw_mipi_dsi_stm_mode_valid(void *priv_data,
> >  			   const struct drm_display_mode *mode,
> > @@ -375,9 +373,10 @@ dw_mipi_dsi_stm_mode_valid(void *priv_data,
> >  		/*
> >  		 * Filter modes according to the clock value, particularly useful for
> >  		 * hdmi modes that require precise pixel clocks.
> > +		 * Check that px_clock is within .5% tolerance.
> >  		 */
> > -		if (px_clock_hz < target_px_clock_hz - CLK_TOLERANCE_HZ ||
> > -		    px_clock_hz > target_px_clock_hz + CLK_TOLERANCE_HZ)
> > +		if (px_clock_hz < mult_frac(target_px_clock_hz, 995, 1000) ||
> > +		    px_clock_hz > mult_frac(target_px_clock_hz, 1005, 1000))
> >  			return MODE_CLOCK_RANGE;
> 
> I wonder if it's not something that should be made into a helper. We
> have a couple of drivers doing it already, so it might be worth creating
> a function that checks for a given struct clk pointer and pixel clock if
> it's within parameters.
> 
> Maxime

Yes agree, if the same calculation is happening other places.
I can't identify where it happens though.

Would that helper function exist in drivers/gpu/drm/drm_hdmi_helper.c ?

I will give the implementation a shot.

/Sean
