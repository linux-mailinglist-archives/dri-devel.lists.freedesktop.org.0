Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EABEAA54F69
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 16:44:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E95810E25A;
	Thu,  6 Mar 2025 15:44:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Tr+9ZhIH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6236410E25A
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 15:44:49 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-390fb1b987fso949654f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 07:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1741275888; x=1741880688; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wK1gxOOdk1W8a/AML1mTmpzyOYKpVlqd16ntLPX8srY=;
 b=Tr+9ZhIHbDoPBCRNi0gT7atLtpxXAokPZe+NtodXYszVTSwp2o9/WCt1cWZrlT59X1
 YmIWcpg7Q6P7wX5+KkemNA1uRKwkwFgyqdMxbMalhFqQbYIK6ZsS/4tgcwDDCNm6SNv7
 3XVF84IfpuEUbFVYz/A6f7E5eAQxr79zNyYzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741275888; x=1741880688;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wK1gxOOdk1W8a/AML1mTmpzyOYKpVlqd16ntLPX8srY=;
 b=vVNCGHip/NF7kPU6+X0JaG5rfwnVOzpXDSodi6ENWdjPCIvzF5NSEqITc3rBp3GdIx
 VlbztWiDUEj3BgKiL1j4RRj1gkcXY7EJ+DWCUH17p3QncsXoIC1NBFzHNKRlJo/gpPTq
 rCRFRkPtcuN0J+dj2kRD/41AgbZg+HauMZnp7xsG95WoP5lA8K4azah0NQZeyhoLRdCD
 WtZpfkvcf99eLzodCZQzLOH81BHE2qhzomS+Lnu1S/IdgP61nzSvfEZhgcdaKw8Pt91P
 5wQKR0kMQ7/FmPr94MOXUV75g21JWT2clLgSZiG/E4Fv+uaCVPJBzAhpi4W93brI9QfQ
 mO3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIK6nRv4dnhE4Kf2RdzSVRta1tjbBto38SkO7MhQtCzxoaRsngVOoXu+vuuw165TdIdeO0WqNWF3I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOqigNav6BAGuzWghuahjSHjKhXyKFXUvqz53wl0Nhh9foGr80
 aLE50R9XRQixJcbL6YuqtNyqjQDs7MbwRi9hpayQX1N6vBPTfhU0CoU9vKbYMXg=
X-Gm-Gg: ASbGncuG5gc0dbe3/Fk+xUTpfOBLjWBoad6a6U0bPS50RQimrhMSp5Nj7Im1BTz2kb+
 5gsj4O48MqnojekdBSBDRd6vv45F6cfy0zHf+GOHiNAC/sCnDHAiw/ClJaaKLbn4uNNP1IhaGxB
 T4EDL+QBX6cVfwBG9imzYeU3dtM67AEFZeIdTIXAyNW5lR8mHD3teaBpJ9UQ61SEY/ArpD1an1/
 J1rLFoJfqct3JRop8/EJ/31vZxvlmktJFcxz2DwdszFGMuaL8iP+ZTiEa9+NJRgtPM0iXCKnz5R
 dmYj+8UXzQFmj3A3I765IgX82uoy3YZZINZh2fK8wD8vZyqp7jw2DM4O
X-Google-Smtp-Source: AGHT+IHfwko9Ji9irJrgL1EBwlqRzGHasGafHablHdNgq8tmEYde/T8Ypz9EwGHvzSxuCg4wRc+qhQ==
X-Received: by 2002:a05:6000:2a3:b0:390:f641:53f2 with SMTP id
 ffacd0b85a97d-3911f727717mr7201316f8f.10.1741275887887; 
 Thu, 06 Mar 2025 07:44:47 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfdfca1sm2337382f8f.22.2025.03.06.07.44.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 07:44:46 -0800 (PST)
Date: Thu, 6 Mar 2025 16:44:44 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Herve Codina <herve.codina@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v5 04/16] drm/atomic: Introduce helper to lookup
 connector by encoder
Message-ID: <Z8nC7JcaK2Vqs_LP@phenom.ffwll.local>
Mail-Followup-To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Herve Codina <herve.codina@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250304-bridge-connector-v5-0-aacf461d2157@kernel.org>
 <20250304-bridge-connector-v5-4-aacf461d2157@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304-bridge-connector-v5-4-aacf461d2157@kernel.org>
X-Operating-System: Linux phenom 6.12.11-amd64 
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

On Tue, Mar 04, 2025 at 12:10:47PM +0100, Maxime Ripard wrote:
> With the bridges switching over to drm_bridge_connector, the direct
> association between a bridge driver and its connector was lost.
> 
> This is mitigated for atomic bridge drivers by the fact you can access
> the encoder, and then call drm_atomic_get_old_connector_for_encoder() or
> drm_atomic_get_new_connector_for_encoder() with drm_atomic_state.
> 
> This was also made easier by providing drm_atomic_state directly to all
> atomic hooks bridges can implement.
> 
> However, bridge drivers don't have a way to access drm_atomic_state
> outside of the modeset path, like from the hotplug interrupt path or any
> interrupt handler.
> 
> Let's introduce a function to retrieve the connector currently assigned
> to an encoder, without using drm_atomic_state, to make these drivers'
> life easier.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Co-developed-by: Simona Vetter <simona.vetter@ffwll.ch>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic.c | 45 ++++++++++++++++++++++++++++++++++++++++++++
>  include/drm/drm_atomic.h     |  3 +++
>  2 files changed, 48 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 9ea2611770f43ce7ccba410406d5f2c528aab022..b926b132590e78f8d41d48eb4da4bccf170ee236 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -985,10 +985,55 @@ drm_atomic_get_new_connector_for_encoder(const struct drm_atomic_state *state,
>  
>  	return NULL;
>  }
>  EXPORT_SYMBOL(drm_atomic_get_new_connector_for_encoder);
>  
> +/**
> + * drm_atomic_get_connector_for_encoder - Get connector currently assigned to an encoder
> + * @encoder: The encoder to find the connector of
> + * @ctx: Modeset locking context
> + *
> + * This function finds and returns the connector currently assigned to
> + * an @encoder.

I think it'd be good to link to the other atomic connector functions like
drm_atomic_get_old/new_connector_for_encoder and explain when to use them.
So also add links to the kerneldoc of these other functions pointing to
here.

- This function is for detect, link repair or anything else that comes
  from the hardware. Or in general, anything that's not in atomic
  commit/check code paths.

- In atomic check/commit code you want to use the other functions.

Otherwise people will have an even harder time finding the right variant
in this maze of look-alikes :-)

With the kerneldoc suitably polished:

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>
Signed-off-by: Simona Vetter <simona.vetter@intel.com>

> + *
> + * Returns:
> + * The connector connected to @encoder, or an error pointer otherwise.
> + * When the error is EDEADLK, a deadlock has been detected and the
> + * sequence must be restarted.
> + */
> +struct drm_connector *
> +drm_atomic_get_connector_for_encoder(const struct drm_encoder *encoder,
> +				     struct drm_modeset_acquire_ctx *ctx)
> +{
> +	struct drm_connector_list_iter conn_iter;
> +	struct drm_connector *out_connector = ERR_PTR(-EINVAL);
> +	struct drm_connector *connector;
> +	struct drm_device *dev = encoder->dev;
> +	int ret;
> +
> +	ret = drm_modeset_lock(&dev->mode_config.connection_mutex, ctx);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	drm_connector_list_iter_begin(dev, &conn_iter);
> +	drm_for_each_connector_iter(connector, &conn_iter) {
> +		if (!connector->state)
> +			continue;
> +
> +		if (encoder == connector->state->best_encoder) {
> +			out_connector = connector;
> +			break;
> +		}
> +	}
> +	drm_connector_list_iter_end(&conn_iter);
> +	drm_modeset_unlock(&dev->mode_config.connection_mutex);
> +
> +	return out_connector;
> +}
> +EXPORT_SYMBOL(drm_atomic_get_connector_for_encoder);
> +
> +
>  /**
>   * drm_atomic_get_old_crtc_for_encoder - Get old crtc for an encoder
>   * @state: Atomic state
>   * @encoder: The encoder to fetch the crtc state for
>   *
> diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> index 4c673f0698fef6b60f77db980378d5e88e0e250e..38636a593c9d98cadda85ccd67326cb152f0dd27 100644
> --- a/include/drm/drm_atomic.h
> +++ b/include/drm/drm_atomic.h
> @@ -623,10 +623,13 @@ struct drm_connector *
>  drm_atomic_get_old_connector_for_encoder(const struct drm_atomic_state *state,
>  					 struct drm_encoder *encoder);
>  struct drm_connector *
>  drm_atomic_get_new_connector_for_encoder(const struct drm_atomic_state *state,
>  					 struct drm_encoder *encoder);
> +struct drm_connector *
> +drm_atomic_get_connector_for_encoder(const struct drm_encoder *encoder,
> +				     struct drm_modeset_acquire_ctx *ctx);
>  
>  struct drm_crtc *
>  drm_atomic_get_old_crtc_for_encoder(struct drm_atomic_state *state,
>  					 struct drm_encoder *encoder);
>  struct drm_crtc *
> 
> -- 
> 2.48.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
