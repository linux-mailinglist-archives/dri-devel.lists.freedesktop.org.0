Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0298D5645
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 01:28:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD30510F3C0;
	Thu, 30 May 2024 23:28:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XzadiSI1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 627A910EEA4
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 23:28:47 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2e719bab882so15532041fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 16:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717111725; x=1717716525; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7LUpNqpykyyYuvmP0uLho5gdKJeFweCzQq7EBpg3+34=;
 b=XzadiSI1h5rbZIkW5grnnwii65Z7qgCvV89JQxBAZDQ36gU2tbQCJArl/uP+4PJVHD
 BpTqD7SsRukDpfoZWx2xoniYt2464YE4lXGC7jcRW0PfiFr70hP7sGukGPHLYbSnwE11
 tuwO8B3Ir5poq9I0/Z7OgNjB2HSAPz9Qv1LIp/ifqsa6YwMd1Yq6Ddepd/MCgSkJ3DOM
 Gy3gcF3CMMD8fCLjSSLtmQG9UmPG49EVqmxxOErlm0b7UrY4Lj9p7FK2mlEMe/6P3oLv
 xSkpGJe+ATccuFZ8yPtdU/xFECxXT35JRVS6baqYCkhokQHui5XKKV3MlDmLv4bURSIY
 7fGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717111725; x=1717716525;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7LUpNqpykyyYuvmP0uLho5gdKJeFweCzQq7EBpg3+34=;
 b=lqxMNpIGfN3kMa4ZkVvlErjtD7QW//BxAzDFk3sF8Wa21fLJ9PAOVtIpGteIH+hwE2
 Djq6ZemPxgsmBSYPkbppiAYuKEyROor9deRbo/Khbxi8kNvPP+7j6utJzV3ty+64WvvE
 cuJaFq+roWLdhlikcFUsbYnd03VVo3xYNLBHRf3nRlMDAZJloFkdMhqQzwg1uWObdin2
 zb3iC/0JqSvkOuj4ff5Yp0/71j05jmEkUyt65ld+XPy0tI99oyoOuD9ENk4o58WlDuLM
 UsGkHu+rdYQeFQSjBCCNGJB14+3Pmtj23S3LZcYmkXTu0acg/ehAOaxUzTfLEPZ8HbWO
 6SYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVOzhkl1+DuSM2mspGOvJ1nssENkZZm9mEgI8FhyGe+LKWlrUYznljurs6RPdCciPN/qrspY9QYIIHrRrYVAG0zY8ZgSSFTigU1CsP2j7o
X-Gm-Message-State: AOJu0YwMF3+dS3zz/LtX0OoI4mI037SMk8pja0N0svYBeJR3NKkZawU5
 79i9XIV5v3wQKWAcZ4AwBjmT/hbOSnQGRJmNfAaEn6O8jCO4/tag6MKgE8MxfO8=
X-Google-Smtp-Source: AGHT+IGa/ojKXc66wpAfWuxk4HgYGFgTZnQfXpj5AA1rgr0wmFDvVEGQhLhftSzOtCB14seoOdZnGQ==
X-Received: by 2002:a05:6512:3694:b0:51d:aae8:646 with SMTP id
 2adb3069b0e04-52b89569467mr64620e87.11.1717111724861; 
 Thu, 30 May 2024 16:28:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b84d828a1sm120108e87.221.2024.05.30.16.28.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 May 2024 16:28:44 -0700 (PDT)
Date: Fri, 31 May 2024 02:28:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Aradhya Bhatia <a-bhatia1@ti.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Jyri Sarha <jyri.sarha@iki.fi>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>, 
 Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <treding@nvidia.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
 Udit Kumar <u-kumar1@ti.com>, 
 Devarsh Thakkar <devarsht@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>, 
 Jai Luthra <j-luthra@ti.com>
Subject: Re: [PATCH v2 8/9] drm/atomic-helper: Re-order bridge chain
 pre-enable and post-disable
Message-ID: <b4khibg3mcj3c4lssh2qrhaz76eb4j6nu6in6vq3chyacnfkcj@2jnfyr2g5n2k>
References: <20240530093621.1925863-1-a-bhatia1@ti.com>
 <20240530093621.1925863-9-a-bhatia1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530093621.1925863-9-a-bhatia1@ti.com>
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

On Thu, May 30, 2024 at 03:06:20PM +0530, Aradhya Bhatia wrote:
> Move the bridge pre_enable call before crtc enable, and the bridge
> post_disable call after the crtc disable.
> 
> The sequence of enable after this patch will look like:
> 
> 	bridge[n]_pre_enable
> 	...
> 	bridge[1]_pre_enable
> 
> 	crtc_enable
> 	encoder_enable
> 
> 	bridge[1]_enable
> 	...
> 	bridge[n]__enable
> 
> and vice-versa for the bridge chain disable sequence.
> 
> The definition of bridge pre_enable hook says that,
> "The display pipe (i.e. clocks and timing signals) feeding this bridge
> will not yet be running when this callback is called".
> 
> Since CRTC is also a source feeding the bridge, it should not be enabled
> before the bridges in the pipeline are pre_enabled. Fix that by
> re-ordering the sequence of bridge pre_enable and bridge post_disable.
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 70 +++++++++++++++++++++++++++--
>  1 file changed, 67 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index fb97b51b38f1..02e093950218 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -1186,8 +1186,6 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
>  			else if (funcs->dpms)
>  				funcs->dpms(encoder, DRM_MODE_DPMS_OFF);
>  		}
> -
> -		drm_atomic_bridge_chain_post_disable(bridge, old_state);
>  	}
>  
>  	for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_state, new_crtc_state, i) {
> @@ -1234,6 +1232,49 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
>  		if (ret == 0)
>  			drm_crtc_vblank_put(crtc);
>  	}
> +
> +	for_each_oldnew_connector_in_state(old_state, connector, old_conn_state,
> +					   new_conn_state, i) {
> +		struct drm_encoder *encoder;
> +		struct drm_bridge *bridge;
> +
> +		/*
> +		 * Shut down everything that's in the changeset and currently
> +		 * still on. So need to check the old, saved state.
> +		 */
> +		if (!old_conn_state->crtc)
> +			continue;
> +
> +		old_crtc_state = drm_atomic_get_old_crtc_state(old_state, old_conn_state->crtc);
> +
> +		if (new_conn_state->crtc)
> +			new_crtc_state = drm_atomic_get_new_crtc_state(old_state,
> +								       new_conn_state->crtc);
> +		else
> +			new_crtc_state = NULL;
> +
> +		if (!crtc_needs_disable(old_crtc_state, new_crtc_state) ||
> +		    !drm_atomic_crtc_needs_modeset(old_conn_state->crtc->state))
> +			continue;
> +
> +		encoder = old_conn_state->best_encoder;
> +
> +		/* We shouldn't get this far if we didn't previously have
> +		 * an encoder.. but WARN_ON() rather than explode.
> +		 */
> +		if (WARN_ON(!encoder))
> +			continue;
> +
> +		drm_dbg_atomic(dev, "disabling [ENCODER:%d:%s]\n",
> +			       encoder->base.id, encoder->name);

This duplicates the code in the loop around
drm_atomic_bridge_chain_disable(). Can it be extracted to a separate
function? Code duplication is nearly always a bad idea.

The same comment applies to the next chunk too.

> +
> +		/*
> +		 * Each encoder has at most one connector (since we always steal
> +		 * it away), so we won't call disable hooks twice.
> +		 */
> +		bridge = drm_bridge_chain_get_first_bridge(encoder);
> +		drm_atomic_bridge_chain_post_disable(bridge, old_state);
> +	}
>  }
>  
>  /**

-- 
With best wishes
Dmitry
