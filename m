Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 399C1A50C4F
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 21:14:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 045EF10E326;
	Wed,  5 Mar 2025 20:14:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="oFTRB8ZX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1792E10E2CB
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 20:13:59 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5497590ffbbso3065126e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Mar 2025 12:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741205638; x=1741810438; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Ur8Gy0umiWGU/zRuogWAi9qm20TVsSYV1MmXLXIgc2U=;
 b=oFTRB8ZXgQNkYpQS96gi/XEAoHe3BcfOo8HoIPK6ywt5LLDjrcjyjvKyoXAlSnCIJv
 RXI4NnIq8Ut5FFJ8pAezsfI+FfkGjx7aXH/y9BTNc7MH3oFtAjrYux7eKE/xJUIA6aPG
 46B34EWScxpR2wOjhZoBa9kRgR6YNB+D1OzF7ohj3Dx6fDNgS/azaUVDq2YTVQmc7B2O
 2xlW0EuTHwwT1h1MuUVTsM+pCemXr5/F4Rf+N+yltI5hhMT6CT3AA1imLM3rHkD9JrNA
 U6d9MTOIfijENto5DDg18g5sMi0HQNBQTxN/jHJi1Ni34iscAdozHIimARt+BxPpGMH2
 PAdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741205638; x=1741810438;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ur8Gy0umiWGU/zRuogWAi9qm20TVsSYV1MmXLXIgc2U=;
 b=qo21NYLQTlAsEQyZKIivwWQ1jQ89eY9ioapQb7SnwmrbNXRhd7bl7iSU0+55WRRf86
 sTA6zCAHp+ZDq6C7ItVVS99UYRcVLtbj2xgl+Kw1lRRS/jIMFAibHbySCWHr/uTUp7RZ
 bZrHy4c6KLLo2DW9L1aDhLeVz7YrIbZFFK7zJtVxS2oWz0YdDOHnSAtqr5VupiexMeqz
 zp8TS60tzVvM5vniBN3bHrbsX557JX43jHfcc8f5hMERue2SjssIUpDur+KMewnZdNGH
 Z3WVTcPESlr2scy3qC7lTFKgSYaq2WIPmdZ7gufd3Iy7MOj20EDb5NeMciXi8CoYRGgf
 7iQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWO8BTzWWwFslwP6pSiisOI2yJaiAIHfxirRh0OemgYxo4sprqLyw5u/EoH0FiOLzKMCkQHSp+RQjQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YylNjmAZWZs3BjjfYREvuxXXAIzBxHV9KI+JRmFsLO5eIetF/Lh
 ENi+CHAERw2gBP1BABL/ecm4W6UdjTKAatkJzjbyTOWMbfWkjUkuW/8ll2ZwgGA=
X-Gm-Gg: ASbGncsp8wxJILtKZlaRX1X/Zb5Jj3rWvhcsbfE4xhoQ6or90ysT+X40Yo4mW6fRTV3
 8H8dTmMk0sKmlT68CRfxofvs/EhwFCbweRtZfGkesJGqJk0QPndNr9v6HS20R2YBRgTrf7Pyky0
 zUZhyiH32zhnYMHfM8AdNcJNdYYWgb6jl+4ds8v0aoHAqHqzOrYodlOsHs/y0lnif9AvN5p/92D
 EzGNY9YG+zM2007tMkXTHB2irOLg0Qd/0fveu8ltUt3yFCtDqHzMWQ1egUqOpzsY9x6q8w7hgfa
 4QMGrfpRu1C+Yk10xdYn7UYlFijkSzavywgO6j9b06g8b7rsA3r70dBpb2gxeecCXkdfOzGOwRn
 tHBH/kw5amL3mBNP3vnK2TNGb
X-Google-Smtp-Source: AGHT+IEAAQPMZhciffBUFfTbRedj5hNBNyknT+VL3Qo1wCR6z4FsNvWZEfzxe2rXJO+c+wB64CTqUw==
X-Received: by 2002:a05:6512:3994:b0:549:74a7:12de with SMTP id
 2adb3069b0e04-5497d3830dfmr1632742e87.48.1741205637709; 
 Wed, 05 Mar 2025 12:13:57 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5495c5a2f18sm1273328e87.14.2025.03.05.12.13.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 12:13:56 -0800 (PST)
Date: Wed, 5 Mar 2025 22:13:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andy Yan <andyshrk@163.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>,
 Herve Codina <herve.codina@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v5 04/16] drm/atomic: Introduce helper to lookup
 connector by encoder
Message-ID: <mqh4wedfokuta2tmyctoi6jrzol7mqzm27nj3ylu6yj2vjy22j@mexke5x2o7a2>
References: <20250304-bridge-connector-v5-0-aacf461d2157@kernel.org>
 <20250304-bridge-connector-v5-4-aacf461d2157@kernel.org>
 <5180089f.a640.19566290538.Coremail.andyshrk@163.com>
 <20250305-ruddy-nightingale-of-wealth-db100a@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305-ruddy-nightingale-of-wealth-db100a@houat>
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

On Wed, Mar 05, 2025 at 02:19:36PM +0100, Maxime Ripard wrote:
> Hi Andy,
> 
> On Wed, Mar 05, 2025 at 07:55:19PM +0800, Andy Yan wrote:
> > At 2025-03-04 19:10:47, "Maxime Ripard" <mripard@kernel.org> wrote:
> > >With the bridges switching over to drm_bridge_connector, the direct
> > >association between a bridge driver and its connector was lost.
> > >
> > >This is mitigated for atomic bridge drivers by the fact you can access
> > >the encoder, and then call drm_atomic_get_old_connector_for_encoder() or
> > >drm_atomic_get_new_connector_for_encoder() with drm_atomic_state.
> > >
> > >This was also made easier by providing drm_atomic_state directly to all
> > >atomic hooks bridges can implement.
> > >
> > >However, bridge drivers don't have a way to access drm_atomic_state
> > >outside of the modeset path, like from the hotplug interrupt path or any
> > >interrupt handler.
> > >
> > >Let's introduce a function to retrieve the connector currently assigned
> > >to an encoder, without using drm_atomic_state, to make these drivers'
> > >life easier.
> > >
> > >Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >Co-developed-by: Simona Vetter <simona.vetter@ffwll.ch>
> > >Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > >---
> > > drivers/gpu/drm/drm_atomic.c | 45 ++++++++++++++++++++++++++++++++++++++++++++
> > > include/drm/drm_atomic.h     |  3 +++
> > > 2 files changed, 48 insertions(+)
> > >
> > >diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> > >index 9ea2611770f43ce7ccba410406d5f2c528aab022..b926b132590e78f8d41d48eb4da4bccf170ee236 100644
> > >--- a/drivers/gpu/drm/drm_atomic.c
> > >+++ b/drivers/gpu/drm/drm_atomic.c
> > >@@ -985,10 +985,55 @@ drm_atomic_get_new_connector_for_encoder(const struct drm_atomic_state *state,
> > > 
> > > 	return NULL;
> > > }
> > > EXPORT_SYMBOL(drm_atomic_get_new_connector_for_encoder);
> > > 
> > >+/**
> > >+ * drm_atomic_get_connector_for_encoder - Get connector currently assigned to an encoder
> > >+ * @encoder: The encoder to find the connector of
> > >+ * @ctx: Modeset locking context
> > >+ *
> > >+ * This function finds and returns the connector currently assigned to
> > >+ * an @encoder.
> > >+ *
> > >+ * Returns:
> > >+ * The connector connected to @encoder, or an error pointer otherwise.
> > >+ * When the error is EDEADLK, a deadlock has been detected and the
> > >+ * sequence must be restarted.
> > >+ */
> > >+struct drm_connector *
> > >+drm_atomic_get_connector_for_encoder(const struct drm_encoder *encoder,
> > >+				     struct drm_modeset_acquire_ctx *ctx)
> > >+{
> > >+	struct drm_connector_list_iter conn_iter;
> > >+	struct drm_connector *out_connector = ERR_PTR(-EINVAL);
> > >+	struct drm_connector *connector;
> > >+	struct drm_device *dev = encoder->dev;
> > >+	int ret;
> > >+
> > >+	ret = drm_modeset_lock(&dev->mode_config.connection_mutex, ctx);
> > >+	if (ret)
> > >+		return ERR_PTR(ret);
> > 
> > It seems that this will cause a deadlock when called from a hotplug
> > handling path, I have a WIP DP diver[0], which suggested by Dmitry to
> > use this API from a &drm_bridge_funcs.detect callback to get the
> > connector, as detect is called by drm_helper_probe_detect, which will
> > hold connection_mutex first, so the deaklock happens:
> >
> > drm_helper_probe_detect(struct drm_connector *connector,
> >                         struct drm_modeset_acquire_ctx *ctx,
> >                         bool force)
> > {
> >         const struct drm_connector_helper_funcs *funcs = connector->helper_private;
> >         struct drm_device *dev = connector->dev;
> >         int ret;
> > 
> >         if (!ctx)
> >                 return drm_helper_probe_detect_ctx(connector, force);
> > 
> >         ret = drm_modeset_lock(&dev->mode_config.connection_mutex, ctx);
> >         if (ret)
> >                 return ret;
> > 
> >         if (funcs->detect_ctx)
> >                 ret = funcs->detect_ctx(connector, ctx, force);
> >         else if (connector->funcs->detect)
> >                 ret = connector->funcs->detect(connector, force);
> >         else
> >                 ret = connector_status_connected;
> > 
> >         if (ret != connector->status)
> >                 connector->epoch_counter += 1;
> > 
> > So I wonder can we let drm_bridge_funcs.detect pass a connector for
> > this case ?
> 
> Do you actually see a deadlock occurring? AFAIK, drm_modeset_lock is
> fine with reentrancy from the same context, so it should work just fine.

Andy, that probably means that you should use .detect_ctx() and pass the
context to drm_atomic_get_connector_for_encoder().

-- 
With best wishes
Dmitry
