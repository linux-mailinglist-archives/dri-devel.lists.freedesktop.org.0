Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEF18BE455
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 15:39:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B37110ED6F;
	Tue,  7 May 2024 13:39:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="z7lUnoGu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDDF410ED6F
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 13:39:30 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-51f45104ef0so3419720e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 06:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715089169; x=1715693969; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=5p3RC2fOBcO/yszjFBGlQ+kLMIrLhRgtWIMaY5UGI4Q=;
 b=z7lUnoGu1IW1AFKNAI/2EkOYVvlZXxlEzz2LniBnDB2T0OpYs37vqL6TAAyke0qvtZ
 rznDj2yFlLPeG1Tm4Lq+zfZe27IO0LeAfyGvFTnXtFKsRVYNO30tYxMAxM8P3r+dow8c
 j9+XwNoByIIwz+cnQN8g2zftC0ftzOZE1YFt1Y2IffAEy8HnyoUvThM5xqz+BJ8EceJU
 gdQ4H64pKfDjTZEVO9eJwHOicbS8vIu8r09s6h9zHv0CFn2vWcySEDXfKd+jObmGCTdx
 u/l9ecu9F2Vvd6kaTUv2A/JoV4GYbyIB+vrvQKkGHolTgiuR0bHgazp/uyzrwM4a5tww
 k9vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715089169; x=1715693969;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5p3RC2fOBcO/yszjFBGlQ+kLMIrLhRgtWIMaY5UGI4Q=;
 b=Nz72NttMdcHDCeKtIRdk/5xDUJbedIcsJhW3JrewGpGlQZRSi//7AOB1JhO3PD+jSb
 mNg2ezTyIsF+6E/QAjzI6u6uSfcJwKTzTzq8Na1QyE2r2VS4JIXELbb0Ksued07RRurk
 PiK9ukAHZ1E8MK83l0FCBGVu1azlJJ5aWH2F04h+MfFLcMAKVJg4BzTmsnwqyPsu6uqk
 LhWO/mVh5v7Jm6cBd79a/xvzMmR6aFs7tWjEw4Oxcasd+u0rpbd0iSfYzSzWnaDlipDs
 3ViRpblj8pkt8LehRQn1EuYm1Dhabgbh+WW73EOqG4BRB/u6dEIwcjAazuEhhEUAigYj
 rA+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgp4Y3Wx39qzmZu2mNeHAhtHfxu/as43yEwJfBBQ/HxVQg7RsPI9aAncFURCdYUcuyAn8sCPlSqR+kMoAMQWdyeKhSZXSQ2R7RhQUpEu8S
X-Gm-Message-State: AOJu0YyRTkPxN1KGoEERlH0HMdzlCoIVl/a4PYoRNGhrZ9y7JgOA8B+Y
 qEyAu/pDjgKLWPAMb6/qlZ8UCqJtEZOXyuU/JOdzFKFPwXwnchVVqB7zZAJX+cM=
X-Google-Smtp-Source: AGHT+IESLrpsKBO3/nRqeo+k6p8A6E2bV8DthVHdN8GSSDT4aFa4P1rb+4V8Tlme+ePuRrgdQdEv7A==
X-Received: by 2002:a19:8c16:0:b0:51e:150e:2c45 with SMTP id
 o22-20020a198c16000000b0051e150e2c45mr8493801lfd.63.1715089168968; 
 Tue, 07 May 2024 06:39:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 x36-20020a056512132400b0051d4321ef58sm2127976lfu.61.2024.05.07.06.39.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 May 2024 06:39:28 -0700 (PDT)
Date: Tue, 7 May 2024 16:39:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sam Ravnborg <sam@ravnborg.org>, 
 Vinay Simha BN <simhavcs@gmail.com>, Tony Lindgren <tony@atomide.com>, 
 dri-devel@lists.freedesktop.org, Michael Walle <mwalle@kernel.org>, 
 Daniel Semkowicz <dse@thaumatec.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 01/20] drm/bridge: add dsi_lp11_notify mechanism
Message-ID: <577v55mspa672t2bqbwwvdtfdgtbj6mpejo3n56qk7bt2j6bt3@q54dfnupcvs4>
References: <20240506-tc358775-fix-powerup-v1-0-545dcf00b8dd@kernel.org>
 <20240506-tc358775-fix-powerup-v1-1-545dcf00b8dd@kernel.org>
 <2189493.irdbgypaU6@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2189493.irdbgypaU6@steina-w>
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

On Tue, May 07, 2024 at 10:37:54AM +0200, Alexander Stein wrote:
> Hi Michael,
> 
> Am Montag, 6. Mai 2024, 15:34:30 CEST schrieb Michael Walle:
> > Some bridges have very strict power-up reqirements. In this case, the
> > Toshiba TC358775. The reset has to be deasserted while *both* the DSI
> > clock and DSI data lanes are in LP-11 mode. After the reset is relased,
> > the bridge needs the DSI clock to actually be able to process I2C
> > access. This access will configure the DSI side of the bridge during
> > which the DSI data lanes have to be in LP-11 mode.
> 
> Apparently this is an issue for a lot of DSI bridges. But enabling LP-11 for
> a bridge is impossible with current documentation [1], which states "A DSI
> host should keep the PHY powered down until the pre_enable operation is
> called."
> Additionally tc358767/tc9595 (DSI-DP bridge) needs LP-11 for AUX channel
> access to even get EDID. This is a requirement before pre_enable would
> even be possible.
> 
> So some changes to the current flow are needed. But I am not so sure
> about LP-11 notification. IMHO a device request to the DSI host to
> enable LP-11 seems more sensible.

Granted that there can be several DSI devices sharing the DSI bus (aka
split-link), I was toying with the idea of making the DSI host call
attached DSI devices when the transition happens.

I don't have a fully working PoC and I probably won't have it ready til
the end of May because of the lack of time and different local
priorities.

> 
> Best regards,
> Alexander
> 
> [1] https://www.kernel.org/doc/html/latest/gpu/drm-kms-helpers.html#mipi-dsi-bridge-operation
> 
> > After everything is
> > configured the video stream can finally be enabled.
> > 
> > This means:
> >  (1) The bridge has to be configured completely in .pre_enable() op
> >      (with the clock turned on and data lanes in LP-11 mode, thus
> >      .pre_enable_prev_first has to be set).
> >  (2) The bridge will enable its output in the .enable() op
> >  (3) There must be some mechanism before (1) where the bridge can
> >      release its reset while the clock lane is still in LP-11 mode.
> > 
> > Unfortunately, (3) is crucial for a correct operation of the bridge.
> > To satisfy this requriment, introduce a new callback .dsi_lp11_notify()
> > which will be called by the DSI host driver.
> > 
> > Signed-off-by: Michael Walle <mwalle@kernel.org>
> > ---
> >  drivers/gpu/drm/drm_bridge.c | 16 ++++++++++++++++
> >  include/drm/drm_bridge.h     | 12 ++++++++++++
> >  2 files changed, 28 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> > index 28abe9aa99ca..98cd6558aecb 100644
> > --- a/drivers/gpu/drm/drm_bridge.c
> > +++ b/drivers/gpu/drm/drm_bridge.c
> > @@ -1339,6 +1339,22 @@ void drm_bridge_hpd_notify(struct drm_bridge *bridge,
> >  }
> >  EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify);
> >  
> > +/**
> > + * drm_bridge_dsi_lp11_notify - notify clock/data lanes LP-11 mode
> > + * @bridge: bridge control structure
> > + *
> > + * DSI host drivers shall call this function while the clock and data lanes
> > + * are still in LP-11 mode.
> > + *
> > + * This function shall be called in a context that can sleep.
> > + */
> > +void drm_bridge_dsi_lp11_notify(struct drm_bridge *bridge)
> > +{
> > +	if (bridge->funcs->dsi_lp11_notify)
> > +		bridge->funcs->dsi_lp11_notify(bridge);
> > +}
> > +EXPORT_SYMBOL_GPL(drm_bridge_dsi_lp11_notify);
> > +
> >  #ifdef CONFIG_OF
> >  /**
> >   * of_drm_find_bridge - find the bridge corresponding to the device node in
> > diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> > index 4baca0d9107b..4ef61274e0a8 100644
> > --- a/include/drm/drm_bridge.h
> > +++ b/include/drm/drm_bridge.h
> > @@ -630,6 +630,17 @@ struct drm_bridge_funcs {
> >  	 */
> >  	void (*hpd_disable)(struct drm_bridge *bridge);
> >  
> > +	/**
> > +	 * dsi_lp11_notify:
> > +	 *
> > +	 * Will be called by the DSI host driver while both the DSI clock
> > +	 * lane as well as the DSI data lanes are in LP-11 mode. Some bridges
> > +	 * need this state while releasing the reset, for example.
> > +	 * Not all DSI host drivers will support this. Therefore, the DSI
> > +	 * bridge driver must not rely on this op to be called.
> > +	 */
> > +	void (*dsi_lp11_notify)(struct drm_bridge *bridge);
> > +
> >  	/**
> >  	 * @debugfs_init:
> >  	 *
> > @@ -898,6 +909,7 @@ void drm_bridge_hpd_enable(struct drm_bridge *bridge,
> >  void drm_bridge_hpd_disable(struct drm_bridge *bridge);
> >  void drm_bridge_hpd_notify(struct drm_bridge *bridge,
> >  			   enum drm_connector_status status);
> > +void drm_bridge_dsi_lp11_notify(struct drm_bridge *bridge);
> >  
> >  #ifdef CONFIG_DRM_PANEL_BRIDGE
> >  bool drm_bridge_is_panel(const struct drm_bridge *bridge);
> > 
> > 
> 
> 
> -- 
> TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht München, HRB 105018
> Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> http://www.tq-group.com/
> 
> 

-- 
With best wishes
Dmitry
