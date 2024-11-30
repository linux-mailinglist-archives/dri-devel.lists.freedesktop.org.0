Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B69649DF2ED
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2024 21:14:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A26C110E00C;
	Sat, 30 Nov 2024 20:14:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nF/I/iBW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A2F510E00C
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 20:14:14 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-53dd59a2bc1so3201854e87.2
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 12:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732997652; x=1733602452; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YQnwH/LUU+Smj6DytGhxhh3Q/k+FhhcvJy+0gsHfMM0=;
 b=nF/I/iBWjLlbSaaiInnUl3rlazA6fwLvBJE8+gPud4Y/jhahAD0+Msc3qvElGE/Xxz
 q7UhExurhnIqqwz8drHMdzo1A2BWUWTRg7JlHGGyoiqfWfL3iNOoGnCb1uKpxdaFm9BL
 EONcP2nSgjlMZ3Wrgh5/aUM8sfMJF3zptdgk7zRZlGu1QtJHf+vXo0nSWr6XRyFKCPMf
 Bvn6Pm7MGmab1RSfR0mZlFZ8FCVs1+NRSMYH7fcaevAJHP2+mnxe2wwXX7lZaV8W1/Yv
 9dzAEl559N+VGFvd+s9XadtaVbugEZ8iFTK/Amui79OrQIknfgWnR5osAQEQYcwcht15
 +urg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732997652; x=1733602452;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YQnwH/LUU+Smj6DytGhxhh3Q/k+FhhcvJy+0gsHfMM0=;
 b=Nhp/ojw92Qz6VqNS44n4yDKyJaJKZLDMBrMFzZZW/6TilE/E7TYGGaDJdHR4r5vXoS
 H7TP37Cv9PlKBqRWck2wJSUouneQSgxUXox9XnmYo8lfWpGA2N/tR2YFp4MwLyLhkN+d
 7IHQWAXspfAv/DCa421ID0MOHTncmzdK9O4kVO5DhzljLz9jq/zASl0UwlxySoEfE1Rx
 iAUADeJ3pOKLUrjiPez4USP9l69xsIhpLiGgGpTl+HM4ZJQxXkyrOz5f/7aovuBGvxJw
 GS71pFVo4QIarnFNR+u7MUBN3O95PFaZPDLV2IeILvTeEFwsNAQ2feUhg9brjeiiRDku
 gsEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDzrF7uelfMBu73ON9a2CT5y9OzVkPDcAp6CE3uyMsFg0p2qXlCg4OuvBcxeL5GnpH4rm5mj1OHSg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+bhicP4CY3sjAFiewb9Yf7plu6tDkh74Wew/klj5QMTclgNAc
 cJoLUU0qS+YXPcqeBtspO4tcmWJYZzV5DRZ5oOox+4z2p2RaUgT1CLpJksbUO60=
X-Gm-Gg: ASbGnctTo+e/Mio4rSTvnifJllqLa5ERSPlRFaJvEfv5z79PniJ7HPLNNgG1MFCe3/L
 78MgJX4+bUMnZsfT/LrCY2JrNcOq4YDMa8r1Wf2Po0/CxgjSF+PhDGOzFRaWA3uA/XWzNALtyaz
 K6OX6fR6dhV1FXMDNEG4Q0NgHUOxpcqfDvHvHF29fUvXv/LiDroL+hn1P509yJnQt+n/J5aLtym
 mCRNe4+CrwYUPkIQ69a0mdGV6oGdpuDhFiA7P3q3W8ov0y/w4nMHlqKU+9Z7910u2P4PWsyI2rW
 Nle2I4uRarAERi01CxdrOd2tXhExHg==
X-Google-Smtp-Source: AGHT+IGfLTfcEm+aaMxybBxbVKL1US/VY5OZiq/tUksfQrDmttijCUwRwCJjRKEGbqDV/mDp0pZhPw==
X-Received: by 2002:a05:6512:b14:b0:53d:dda4:8b0c with SMTP id
 2adb3069b0e04-53df00d0332mr10008210e87.18.1732997650904; 
 Sat, 30 Nov 2024 12:14:10 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df6496467sm858800e87.187.2024.11.30.12.14.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Nov 2024 12:14:09 -0800 (PST)
Date: Sat, 30 Nov 2024 22:14:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Nikolaus Voss <nv@vosn.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Liu Ying <victor.liu@nxp.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Fabio Estevam <festevam@denx.de>, Marek Vasut <marex@denx.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, 
 nikolaus.voss@haag-streit.com
Subject: Re: [PATCH] drm: bridge: fsl-ldb: fixup mode on freq mismatch
Message-ID: <ljxbp7e6ywj2btbo22gvh3ijuwq6hzaahcph2vcsh6xiyzdyla@vuz437cyxe3e>
References: <20241126172610.AD8B51622C@mail.steuer-voss.de>
 <lio6natmz5d5hdmdxwuj5ghfbpl4medb2orhw2m27m6g3rvaga@tanmydgbufg2>
 <c05e762f-a9c3-4655-7b21-8490d91fd858@vosn.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c05e762f-a9c3-4655-7b21-8490d91fd858@vosn.de>
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

On Sat, Nov 30, 2024 at 07:57:17PM +0100, Nikolaus Voss wrote:
> Hi Dmitry,
> 
> On Sat, 30 Nov 2024, Dmitry Baryshkov wrote:
> > On Tue, Nov 26, 2024 at 04:45:54PM +0100, Nikolaus Voss wrote:
> > > LDB clock has to be a fixed multiple of the pixel clock.
> > > As LDB and pixel clock are derived from different clock sources
> > > (at least on imx8mp), this constraint cannot be satisfied for
> > > any pixel clock, which leads to flickering and incomplete
> > > lines on the attached display.
> > > 
> > > To overcome this, check this condition in mode_fixup() and
> > > adapt the pixel clock accordingly.
> > > 
> > > Cc: <stable@vger.kernel.org>
> > > 
> > > Signed-off-by: Nikolaus Voss <nv@vosn.de>
> > > ---
> > >  drivers/gpu/drm/bridge/fsl-ldb.c | 40 ++++++++++++++++++++++++++++----
> > >  1 file changed, 36 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
> > > index 0e4bac7dd04ff..e341341b8c600 100644
> > > --- a/drivers/gpu/drm/bridge/fsl-ldb.c
> > > +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
> > > @@ -104,12 +104,14 @@ static inline struct fsl_ldb *to_fsl_ldb(struct drm_bridge *bridge)
> > >  	return container_of(bridge, struct fsl_ldb, bridge);
> > >  }
> > > 
> > > +static unsigned int fsl_ldb_link_freq_factor(const struct fsl_ldb *fsl_ldb)
> > > +{
> > > +	return fsl_ldb_is_dual(fsl_ldb) ? 3500 : 7000;
> > > +}
> > > +
> > >  static unsigned long fsl_ldb_link_frequency(struct fsl_ldb *fsl_ldb, int clock)
> > >  {
> > > -	if (fsl_ldb_is_dual(fsl_ldb))
> > > -		return clock * 3500;
> > > -	else
> > > -		return clock * 7000;
> > > +	return clock * fsl_ldb_link_freq_factor(fsl_ldb);
> > >  }
> > > 
> > >  static int fsl_ldb_attach(struct drm_bridge *bridge,
> > > @@ -121,6 +123,35 @@ static int fsl_ldb_attach(struct drm_bridge *bridge,
> > >  				 bridge, flags);
> > >  }
> > > 
> > > +static bool fsl_ldb_mode_fixup(struct drm_bridge *bridge,
> > > +				const struct drm_display_mode *mode,
> > > +				struct drm_display_mode *adjusted_mode)
> > 
> > The driver uses atomic callbacks. Please use .atomic_check() instead.
> 
> So it is okay to modify drm_crtc_state->adjusted_mode in .atomic_check()? I

Yes. samsung-dsim, anx7625 do that (I stopped checking after the second
one).

> chose .mode_fixup() because the function name and args make it more obvious
> what is done there. Btw, the API reference doesn't say this call is
> deprecated.

It's not deprecated. But as the driver is using atomic calls (vs legacy
calls) it makes more sense to use atomic_check() too.

> A second thought:
> Maybe it would be a good idea to reject modes which result in an adjusted
> mode pclk that is not within certain boundaries, even if this patch doesn't
> do it yet. As I see it, that would be only possible in mode_fixup().

atomic_check() can definitely reject whatever is being stuffed to it.

> 
> > 
> > > +{
> > > +	const struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
> > > +	unsigned long requested_link_freq =
> > > +		mode->clock * fsl_ldb_link_freq_factor(fsl_ldb);
> > > +	unsigned long freq = clk_round_rate(fsl_ldb->clk, requested_link_freq);
> > > +
> > > +	if (freq != requested_link_freq) {
> > > +		/*
> > > +		 * this will lead to flicker and incomplete lines on
> > > +		 * the attached display, adjust the CRTC clock
> > > +		 * accordingly.
> > > +		 */
> > > +		int pclk = freq / fsl_ldb_link_freq_factor(fsl_ldb);
> > > +
> > > +		if (adjusted_mode->clock != pclk) {
> > > +			dev_warn(fsl_ldb->dev, "Adjusted pixel clk to match LDB clk (%d kHz -> %d kHz)!\n",
> > > +				 adjusted_mode->clock, pclk);
> > > +
> > > +			adjusted_mode->clock = pclk;
> > > +			adjusted_mode->crtc_clock = pclk;
> > > +		}
> > > +	}
> > > +
> > > +	return true;
> > > +}
> > > +
> > >  static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
> > >  				  struct drm_bridge_state *old_bridge_state)
> > >  {
> > > @@ -280,6 +311,7 @@ fsl_ldb_mode_valid(struct drm_bridge *bridge,
> > > 
> > >  static const struct drm_bridge_funcs funcs = {
> > >  	.attach = fsl_ldb_attach,
> > > +	.mode_fixup = fsl_ldb_mode_fixup,
> > >  	.atomic_enable = fsl_ldb_atomic_enable,
> > >  	.atomic_disable = fsl_ldb_atomic_disable,
> > >  	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> > > --
> > > 2.43.0
> > > 
> > 
> > 
> 
> -- 
> Nikolaus Voss
> 

-- 
With best wishes
Dmitry
