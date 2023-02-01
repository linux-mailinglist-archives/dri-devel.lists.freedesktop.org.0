Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4942686850
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 15:33:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3555F89916;
	Wed,  1 Feb 2023 14:33:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F038389916
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Feb 2023 14:33:29 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id ud5so52000833ejc.4
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Feb 2023 06:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Bltqkr1sg0pNhxWiFSaqOu4KLSvgA4P8R645R0umaT4=;
 b=MUyYmiIgYK0KvPfJGx+PT/BoYMovWZN84nzOepalN21d2CzKtHVvbAcQkFQWZTL/Qx
 Z9GTXgkmOKOwde1Mjl/JKnGdMXPVqtrnrg7UDlf/NZcjbeQXjHviOJyyogmg4p9AsyV4
 osP4p6xx6eKRARDizd1unrTY4ZmwhU0C9ykj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Bltqkr1sg0pNhxWiFSaqOu4KLSvgA4P8R645R0umaT4=;
 b=bpzMqWzOQd1IQWTlj9PsjbcnxB/TqNvzcE+y/LLEidbKGinfsLCnEfnaOHwM7nNI68
 hps2zZokr1Bm8VtUHkW0whnLahJ1xGOlejfqJp8eMnzmRH4+JmZIlFiFTuaMmDcX+ftH
 lZnvC9lr6rJLrs5hz61WmSEiD6LmSxy3gNwdUPpzkOYwseln45Ln6IFDRI6mQRtIapRU
 ntZRTntSIemgCJN6mCM+PH+rcid8HYkCFQ58vRbj0ViU4qpzXiSDVItNNLnrXVDa7Gqw
 xzSq4dxZ2pjuO1h13HOxRPTCbQmnQ/K+61Rn8O59z+8G0MYXZD3L59tH8/kZS45TP7yv
 boAQ==
X-Gm-Message-State: AO0yUKV3wO7tF0KToWy0Z0dy8eHLLiWbFcRr5JZziktuzoJAguqS153q
 /zPPSN1bkyLM4DL246m5LlPcGJcV1OEn7Xw/+BA=
X-Google-Smtp-Source: AK7set/WrUr1QvMAgkT9qS0qe4htD6m5qZ6b0m5ZBexXKIu1ileuNr59WeYJWnX/z883kufcldLGlg==
X-Received: by 2002:a17:906:fa89:b0:869:236c:ac40 with SMTP id
 lt9-20020a170906fa8900b00869236cac40mr2420727ejb.31.1675262008400; 
 Wed, 01 Feb 2023 06:33:28 -0800 (PST)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com.
 [209.85.128.44]) by smtp.gmail.com with ESMTPSA id
 t4-20020a170906948400b0084c4b87aa18sm9990210ejx.37.2023.02.01.06.33.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Feb 2023 06:33:26 -0800 (PST)
Received: by mail-wm1-f44.google.com with SMTP id
 n28-20020a05600c3b9c00b003ddca7a2bcbso1603627wms.3
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Feb 2023 06:33:26 -0800 (PST)
X-Received: by 2002:a05:600c:a03:b0:3dc:42e7:8d38 with SMTP id
 z3-20020a05600c0a0300b003dc42e78d38mr115107wmp.93.1675262005713; Wed, 01 Feb
 2023 06:33:25 -0800 (PST)
MIME-Version: 1.0
References: <20230131141756.RFT.v2.1.I723a3761d57ea60c5dd754c144aed6c3b2ea6f5a@changeid>
 <20230131141756.RFT.v2.2.I4cfeab9d0e07e98ead23dd0736ab4461e6c69002@changeid>
 <43095d93-29c8-b30a-08c0-0a452770c1ce@quicinc.com>
In-Reply-To: <43095d93-29c8-b30a-08c0-0a452770c1ce@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 1 Feb 2023 06:33:01 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X6A4aZVCaqhT9yP0tD82R3fnaDak67w+p8+Z=WkaRxfw@mail.gmail.com>
Message-ID: <CAD=FV=X6A4aZVCaqhT9yP0tD82R3fnaDak67w+p8+Z=WkaRxfw@mail.gmail.com>
Subject: Re: [RFT PATCH v2 2/3] drm/msm/dsi: Stop unconditionally powering up
 DSI hosts at modeset
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: freedreno@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>, Robert Foss <robert.foss@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Jan 31, 2023 at 3:32 PM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> On 1/31/2023 2:18 PM, Douglas Anderson wrote:
> > In commit 7d8e9a90509f ("drm/msm/dsi: move DSI host powerup to modeset
> > time"), we moved powering up DSI hosts to modeset time. This wasn't
> > because it was an elegant design, but there were no better options.
> >
> > That commit actually ended up breaking ps8640, and thus was born
> > commit ec7981e6c614 ("drm/msm/dsi: don't powerup at modeset time for
> > parade-ps8640") as a temporary hack to un-break ps8640 by moving it to
> > the old way of doing things. It turns out that ps8640 _really_ doesn't
> > like its pre_enable() function to be called after
> > dsi_mgr_bridge_power_on(). Specifically (from experimentation, not
> > because I have any inside knowledge), it looks like the assertion of
> > "RST#" in the ps8640 runtime resume handler seems like it's not
> > allowed to happen after dsi_mgr_bridge_power_on()
> >
> > Recently, Dave Stevenson's series landed allowing bridges some control
> > over pre_enable ordering. The meaty commit for our purposes is commit
> > 4fb912e5e190 ("drm/bridge: Introduce pre_enable_prev_first to alter
> > bridge init order"). As documented by that series, if a bridge doesn't
> > set "pre_enable_prev_first" then we should use the old ordering.
> >
> > Now that we have the commit ("drm/bridge: tc358762: Set
> > pre_enable_prev_first") we can go back to the old ordering, which also
> > allows us to remove the ps8640 special case.
> >
> > One last note is that even without reverting commit 7d8e9a90509f
> > ("drm/msm/dsi: move DSI host powerup to modeset time"), if you _just_
> > revert the ps8640 special case and try it out then it doesn't seem to
> > fail anymore. I spent time bisecting / debugging this and it turns out
> > to be mostly luck, so we still want this patch to make sure it's
> > solid. Specifically the reason it sorta works these days is because
> > we implemented wait_hpd_asserted() in ps8640 now, plus the magic of
> > "pm_runtime" autosuspend. The fact that we have wait_hpd_asserted()
> > implemented means that we actually power the bridge chip up just a wee
> > bit earlier and then the bridge happens to stay on because of
> > autosuspend and thus ends up powered before dsi_mgr_bridge_power_on().
> >
> > Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> > Changes in v2:
> > - Don't fold dsi_mgr_bridge_power_on() back into dsi_mgr_bridge_pre_enable()
> >
> >   drivers/gpu/drm/msm/dsi/dsi_manager.c | 38 +--------------------------
> >   1 file changed, 1 insertion(+), 37 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > index 1bbac72dad35..2197a54b9b96 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > @@ -34,32 +34,6 @@ static struct msm_dsi_manager msm_dsim_glb;
> >   #define IS_SYNC_NEEDED()    (msm_dsim_glb.is_sync_needed)
> >   #define IS_MASTER_DSI_LINK(id)      (msm_dsim_glb.master_dsi_link_id == id)
> >
> > -#ifdef CONFIG_OF
> > -static bool dsi_mgr_power_on_early(struct drm_bridge *bridge)
> > -{
> > -     struct drm_bridge *next_bridge = drm_bridge_get_next_bridge(bridge);
> > -
> > -     /*
> > -      * If the next bridge in the chain is the Parade ps8640 bridge chip
> > -      * then don't power on early since it seems to violate the expectations
> > -      * of the firmware that the bridge chip is running.
> > -      *
> > -      * NOTE: this is expected to be a temporary special case. It's expected
> > -      * that we'll eventually have a framework that allows the next level
> > -      * bridge to indicate whether it needs us to power on before it or
> > -      * after it. When that framework is in place then we'll use it and
> > -      * remove this special case.
> > -      */
> > -     return !(next_bridge && next_bridge->of_node &&
> > -              of_device_is_compatible(next_bridge->of_node, "parade,ps8640"));
> > -}
> > -#else
> > -static inline bool dsi_mgr_power_on_early(struct drm_bridge *bridge)
> > -{
> > -     return true;
> > -}
> > -#endif
> > -
> >   static inline struct msm_dsi *dsi_mgr_get_dsi(int id)
> >   {
> >       return msm_dsim_glb.dsi[id];
> > @@ -265,12 +239,6 @@ static void dsi_mgr_bridge_power_on(struct drm_bridge *bridge)
> >       int ret;
> >
> >       DBG("id=%d", id);
> > -     if (!msm_dsi_device_connected(msm_dsi))
> > -             return;
> > -
> > -     /* Do nothing with the host if it is slave-DSI in case of bonded DSI */
> > -     if (is_bonded_dsi && !IS_MASTER_DSI_LINK(id))
> > -             return;
> >
>
> Why are these two checks removed?

After this patch there is now one caller to this function and the one
caller does those exact same two checks immediately before calling
this function. Thus, they no longer do anything useful.

-Doug
