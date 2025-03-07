Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0BDA568CF
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 14:25:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E769710E08C;
	Fri,  7 Mar 2025 13:25:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="erhMPltC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 782D210E06D
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 13:25:08 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-39129fc51f8so1597827f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Mar 2025 05:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1741353905; x=1741958705; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=SsrmFr+ysHaOwSLk2bxw1/bwR9SJ301ZLQRrRBut7wY=;
 b=erhMPltCJXQc6Ql/hBPUoco5cbGgdz+bvQwY54fUBRIFzzMZsq2cSmG+9lQ+Um2wWd
 FVkvEHfUbcFlFiCoSstM266iL2EWnnHxum6rHtFOu9eFewg5kmWvkbgYLySBnO7N0nUc
 R0dcrDJHolQ2HK7nKAZKMGqJKaar9cyqWEyno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741353905; x=1741958705;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SsrmFr+ysHaOwSLk2bxw1/bwR9SJ301ZLQRrRBut7wY=;
 b=SxDjWvVNDo3UJ0SoX++C79rmtcy3BENX2ll6+wckmfw4XcQvfeiHT4sSX6hIm4EwxA
 KVSxH/S+j1KoX4uQOjWOWUnos7LCsmXfYCSJdohMJyRbjttFiplAvZU2ni8ZWt8TTtxo
 noYqb3SplnQxMNW7/x0bovddJFmcyOsc3KlObquVZWECk1MheQ1ssJb7Ch5xIE0YEeUK
 6wW45jenZwralSHFY98A3AQfL+fWbMqY/pmrAkKuKdzJ8QdldlpwRbFMs9iygcs9cdoj
 Qm5NZ0abagw9EDK5FZJ1+YyHl7qjO3Ybi/soTJxC7U9gCRKdBrwgbIJ34hUFxO3/ELY7
 7M1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeNt5hIgXiaVaCCnviXnR+4/PPRg4tOJkyGfurWA6qeOW8SY1tN3baCo1QUusYyREyVFO/wJJ2+gE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwRIAQ3Y3MjfRc8DXBttrK5GP61mzK8FH9eOQnkO5qTLMVXysi
 CvSYa7TIzp2NIhlixSRkevvCtw2t2wzAehc4prmBxT+5fpdLvFKVvg9DeRjstno=
X-Gm-Gg: ASbGncvua1+E4OjzMw8VDrc9KHaG4C8q/LhjhhwOvu0rRm28C5hFdytB+ofCEyXz+jD
 RNqxaKG2EQx55v8sfjh+qLGfs/YbcF3Ehi0QJ2UJh/fEV8+BwAQ5jjSOh1Q/mplnitEmDdXJJ1R
 kMEb95WOnFjwFfVcaDUlXRHhXqAhYqJItbmA44qKqgeLua6ajOnox+YAuFs3cvpJDYDvDk6Mqw9
 4J9QOgrdukEcTnUGqjp1s/dXq1tJlaeOTJXfeT7MRU3ymmObaY79XDWecH8ZQfKI7cDypm9st67
 D0ym4BElU6+55YCefPLZAijVYXt2qeY4s1uN8RafbNoGquLyOK9QGLxq
X-Google-Smtp-Source: AGHT+IGjoQ6tp1kTNPxz1zDGpPlUIqDaxAvs1QFKP1Qsh0GttN5LWN+Elebsbzx7FiwgWbNO1teMsg==
X-Received: by 2002:a05:6000:144d:b0:391:139f:61af with SMTP id
 ffacd0b85a97d-39132d8c768mr1810431f8f.32.1741353905133; 
 Fri, 07 Mar 2025 05:25:05 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c11e9desm5245150f8f.101.2025.03.07.05.25.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 05:25:04 -0800 (PST)
Date: Fri, 7 Mar 2025 14:25:02 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Andy Yan <andyshrk@163.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Herve Codina <herve.codina@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: Re:Re: [PATCH v5 04/16] drm/atomic: Introduce helper to lookup
 connector by encoder
Message-ID: <Z8rzroJJVGWFDkk1@phenom.ffwll.local>
Mail-Followup-To: Andy Yan <andyshrk@163.com>,
 Maxime Ripard <mripard@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
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
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250304-bridge-connector-v5-0-aacf461d2157@kernel.org>
 <20250304-bridge-connector-v5-4-aacf461d2157@kernel.org>
 <5180089f.a640.19566290538.Coremail.andyshrk@163.com>
 <20250305-ruddy-nightingale-of-wealth-db100a@houat>
 <mqh4wedfokuta2tmyctoi6jrzol7mqzm27nj3ylu6yj2vjy22j@mexke5x2o7a2>
 <7c1c61e7.10e1.19569067029.Coremail.andyshrk@163.com>
 <20250306-able-wonderful-saluki-aacd1d@houat>
 <Z8nCJACBmcUNvQB8@phenom.ffwll.local>
 <35189f31.c6a.1956e25d8c9.Coremail.andyshrk@163.com>
 <2e1a98a6.69b3.1956f837872.Coremail.andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2e1a98a6.69b3.1956f837872.Coremail.andyshrk@163.com>
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

On Fri, Mar 07, 2025 at 03:30:41PM +0800, Andy Yan wrote:
> 
> Hi All,
> At 2025-03-07 09:08:48, "Andy Yan" <andyshrk@163.com> wrote:
> >Hi All,
> >
> >At 2025-03-06 23:41:24, "Simona Vetter" <simona.vetter@ffwll.ch> wrote:
> >>On Thu, Mar 06, 2025 at 08:10:16AM +0100, Maxime Ripard wrote:
> >>> On Thu, Mar 06, 2025 at 09:16:24AM +0800, Andy Yan wrote:
> >>> > 
> >>> > Hi Maxime and Dmitry:
> >>> > 
> >>> > At 2025-03-06 04:13:53, "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org> wrote:
> >>> > >On Wed, Mar 05, 2025 at 02:19:36PM +0100, Maxime Ripard wrote:
> >>> > >> Hi Andy,
> >>> > >> 
> >>> > >> On Wed, Mar 05, 2025 at 07:55:19PM +0800, Andy Yan wrote:
> >>> > >> > At 2025-03-04 19:10:47, "Maxime Ripard" <mripard@kernel.org> wrote:
> >>> > >> > >With the bridges switching over to drm_bridge_connector, the direct
> >>> > >> > >association between a bridge driver and its connector was lost.
> >>> > >> > >
> >>> > >> > >This is mitigated for atomic bridge drivers by the fact you can access
> >>> > >> > >the encoder, and then call drm_atomic_get_old_connector_for_encoder() or
> >>> > >> > >drm_atomic_get_new_connector_for_encoder() with drm_atomic_state.
> >>> > >> > >
> >>> > >> > >This was also made easier by providing drm_atomic_state directly to all
> >>> > >> > >atomic hooks bridges can implement.
> >>> > >> > >
> >>> > >> > >However, bridge drivers don't have a way to access drm_atomic_state
> >>> > >> > >outside of the modeset path, like from the hotplug interrupt path or any
> >>> > >> > >interrupt handler.
> >>> > >> > >
> >>> > >> > >Let's introduce a function to retrieve the connector currently assigned
> >>> > >> > >to an encoder, without using drm_atomic_state, to make these drivers'
> >>> > >> > >life easier.
> >>> > >> > >
> >>> > >> > >Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> > >> > >Co-developed-by: Simona Vetter <simona.vetter@ffwll.ch>
> >>> > >> > >Signed-off-by: Maxime Ripard <mripard@kernel.org>
> >>> > >> > >---
> >>> > >> > > drivers/gpu/drm/drm_atomic.c | 45 ++++++++++++++++++++++++++++++++++++++++++++
> >>> > >> > > include/drm/drm_atomic.h     |  3 +++
> >>> > >> > > 2 files changed, 48 insertions(+)
> >>> > >> > >
> >>> > >> > >diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> >>> > >> > >index 9ea2611770f43ce7ccba410406d5f2c528aab022..b926b132590e78f8d41d48eb4da4bccf170ee236 100644
> >>> > >> > >--- a/drivers/gpu/drm/drm_atomic.c
> >>> > >> > >+++ b/drivers/gpu/drm/drm_atomic.c
> >>> > >> > >@@ -985,10 +985,55 @@ drm_atomic_get_new_connector_for_encoder(const struct drm_atomic_state *state,
> >>> > >> > > 
> >>> > >> > > 	return NULL;
> >>> > >> > > }
> >>> > >> > > EXPORT_SYMBOL(drm_atomic_get_new_connector_for_encoder);
> >>> > >> > > 
> >>> > >> > >+/**
> >>> > >> > >+ * drm_atomic_get_connector_for_encoder - Get connector currently assigned to an encoder
> >>> > >> > >+ * @encoder: The encoder to find the connector of
> >>> > >> > >+ * @ctx: Modeset locking context
> >>> > >> > >+ *
> >>> > >> > >+ * This function finds and returns the connector currently assigned to
> >>> > >> > >+ * an @encoder.
> >>> > >> > >+ *
> >>> > >> > >+ * Returns:
> >>> > >> > >+ * The connector connected to @encoder, or an error pointer otherwise.
> >>> > >> > >+ * When the error is EDEADLK, a deadlock has been detected and the
> >>> > >> > >+ * sequence must be restarted.
> >>> > >> > >+ */
> >>> > >> > >+struct drm_connector *
> >>> > >> > >+drm_atomic_get_connector_for_encoder(const struct drm_encoder *encoder,
> >>> > >> > >+				     struct drm_modeset_acquire_ctx *ctx)
> >>> > >> > >+{
> >>> > >> > >+	struct drm_connector_list_iter conn_iter;
> >>> > >> > >+	struct drm_connector *out_connector = ERR_PTR(-EINVAL);
> >>> > >> > >+	struct drm_connector *connector;
> >>> > >> > >+	struct drm_device *dev = encoder->dev;
> >>> > >> > >+	int ret;
> >>> > >> > >+
> >>> > >> > >+	ret = drm_modeset_lock(&dev->mode_config.connection_mutex, ctx);
> >>> > >> > >+	if (ret)
> >>> > >> > >+		return ERR_PTR(ret);
> >>> > >> > 
> >>> > >> > It seems that this will cause a deadlock when called from a hotplug
> >>> > >> > handling path, I have a WIP DP diver[0], which suggested by Dmitry to
> >>> > >> > use this API from a &drm_bridge_funcs.detect callback to get the
> >>> > >> > connector, as detect is called by drm_helper_probe_detect, which will
> >>> > >> > hold connection_mutex first, so the deaklock happens:
> >>> > >> >
> >>> > >> > drm_helper_probe_detect(struct drm_connector *connector,
> >>> > >> >                         struct drm_modeset_acquire_ctx *ctx,
> >>> > >> >                         bool force)
> >>> > >> > {
> >>> > >> >         const struct drm_connector_helper_funcs *funcs = connector->helper_private;
> >>> > >> >         struct drm_device *dev = connector->dev;
> >>> > >> >         int ret;
> >>> > >> > 
> >>> > >> >         if (!ctx)
> >>> > >> >                 return drm_helper_probe_detect_ctx(connector, force);
> >>> > >> > 
> >>> > >> >         ret = drm_modeset_lock(&dev->mode_config.connection_mutex, ctx);
> >>> > >> >         if (ret)
> >>> > >> >                 return ret;
> >>> > >> > 
> >>> > >> >         if (funcs->detect_ctx)
> >>> > >> >                 ret = funcs->detect_ctx(connector, ctx, force);
> >>> > >> >         else if (connector->funcs->detect)
> >>> > >> >                 ret = connector->funcs->detect(connector, force);
> >>> > >> >         else
> >>> > >> >                 ret = connector_status_connected;
> >>> > >> > 
> >>> > >> >         if (ret != connector->status)
> >>> > >> >                 connector->epoch_counter += 1;
> >>> > >> > 
> >>> > >> > So I wonder can we let drm_bridge_funcs.detect pass a connector for
> >>> > >> > this case ?
> >>> > >> 
> >>> > >> Do you actually see a deadlock occurring? AFAIK, drm_modeset_lock is
> >>> > >> fine with reentrancy from the same context, so it should work just fine.
> >>> > >
> >>> > >Andy, that probably means that you should use .detect_ctx() and pass the
> >>> > >context to drm_atomic_get_connector_for_encoder().
> >>> > 
> >>> > Unfortunately, the drm_bridge_funcs does not have a .detect_ctx()  version .
> >>> > The call chain is:
> >>> >  drm_helper_probe_detect 
> >>> >  --> drm_bridge_connector_detect(struct drm_connector *connector, bool force)
> >>> > --> drm_bridge_funcs.detect(bridge)
> >>> > The ctx got dropped when drm_helper_probe_detect call  drm_bridge_connector_detect
> >>> > The connector got dropped  when connector call it's bridege.detect
> >>> > 
> >>> > So I think the simplest solution is to have drm_bridge_funcs.detect
> >>> > directly pass the connector
> >>> 
> >>> I don't disagree on principle, but I think a better first step would be
> >>> to provide a detect_ctx hook to bridges.
> >>
> >>Yup. There's other reasons you really want to get at the locking context
> >>in detect callbacks, doing this special case by passing something for
> >>everyone doesn't sound like the right approach to me.
> >
> >Ok, I will add a detect_ctx  hook for bridge. Thanks for your advice.
> >
> >Just confirm that can I send this add detect_ctx hook patch alone first? 
> >I think this patch will be easy to merge,  so it can help my WIP DP driver stay light on dependencies。

Yeah I think sending this prep work as a standalone thing is ok,
especially since it looks like there's going to be more work involved.

> When I try to add the detect_ctx hook to bridge, I found that there is still a case that there is no ctx to
> pass to detect_ctx:
> 
> int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
>                                             uint32_t maxX, uint32_t maxY)
> {
>         ...............
>         struct drm_modeset_acquire_ctx ctx;
> 
>         WARN_ON(!mutex_is_locked(&dev->mode_config.mutex));
> 
>         drm_modeset_acquire_init(&ctx, 0);
> 
>         drm_dbg_kms(dev, "[CONNECTOR:%d:%s]\n", connector->base.id,
>                     connector->name);
> 
> retry:
>         ret = drm_modeset_lock(&dev->mode_config.connection_mutex, &ctx);
>         ...................
>        ret = drm_helper_probe_detect(connector, &ctx, true);
>        ......................................
> 
>      count = drm_helper_probe_get_modes(connector);
> 
> Then in drm_bridge_connector_get_modes:
> 
> static int drm_bridge_connector_get_modes(struct drm_connector *connector)
> {
>         struct drm_bridge_connector *bridge_connector =
>                 to_drm_bridge_connector(connector);
>         struct drm_bridge *bridge;
> 
>    ...........................................
>         /*
>          * If display exposes EDID, then we parse that in the normal way to
>          * build table of supported modes.
>          */
>         bridge = bridge_connector->bridge_edid;
>         if (bridge)
>                 return drm_bridge_connector_get_modes_edid(connector, bridge);
> 
> static int drm_bridge_connector_get_modes_edid(struct drm_connector *connector,
>                                                struct drm_bridge *bridge)
> {
>         enum drm_connector_status status;
>         const struct drm_edid *drm_edid;
>         int n;
> 
>         status = drm_bridge_connector_detect(connector, false);
> 
> ......................
> 
> -drm_bridge_connector_detect(struct drm_connector *connector, bool force)
> +drm_bridge_connector_detect(struct drm_connector *connector,
> +                           struct drm_modeset_acquire_ctx *ctx,
> +                           bool force)
>  {
>         struct drm_bridge_connector *bridge_connector =
>                 to_drm_bridge_connector(connector);
> @@ -186,7 +188,7 @@ drm_bridge_connector_detect(struct drm_connector *connector, bool force)
>         enum drm_connector_status status;
>  
>         if (detect) {
>                status = detect->funcs->detect(detect, ctx);
> 
> There is still no ctx in this call chain.
> 
> So there will be deadlock if I use drm_atomic_get_new_connector_for_encoder to find connector in
> my bridge detect_ctx hook.

Hm yeah looks like bridge callchain isn't split up into ->detec and
->get_modes in exactly the same way as connectors. I think the clean
solution would be to pull drm_bridge_connector_detect() out from
drm_bridge_connector_get_modes(), but that might unravel a huge amount of
work. But wiring the ctx through all the get_mode functions might also not
work out great, hence why I'd try moving _detect() first.

Once you have bridge_connector_detect at the same split-up like any other
connectors, it should be possible to add the contect to
drm_bridge_connector_detect and have it everywhere. In general I think
calling drm_bridge_connector_detect with a NULL ctx should be a bug, and
we should catch that with a WARN_ON and bail out. Otherwise the locking is
going to be a complete mess.

And yeah definitely do this prep work as a separate series, I think the
need is clearly established, so we don't need a user right away to justify
this rework.

Cheers, Sima
> 
> 
> 
> >
> >
> >>-Sima
> >>-- 
> >>Simona Vetter
> >>Software Engineer, Intel Corporation
> >>http://blog.ffwll.ch

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
