Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 666C34E6792
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 18:15:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A203310E5BD;
	Thu, 24 Mar 2022 17:14:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C02D10E5BD
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 17:14:59 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id u16so7587019wru.4
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 10:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=pRecBuYeU/z7kAK3rf8Lol8ekHF1J+MIT9ShVOoyf84=;
 b=InsaCFcVMprN9wIQzzsimbr+tf6ootL19ogho/5I8aqd+FJn7iqDhpiGHMmT3nHxkm
 fngq32FZ4L3klYLt4TmC+trS7h1Mo/qnBiDUa8lp13G8K40PTiWJ8f6JJtjLX60LuT+9
 O1+4GdX7nujZV9pqwvDtSPoI34ORvJLDHApfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pRecBuYeU/z7kAK3rf8Lol8ekHF1J+MIT9ShVOoyf84=;
 b=PTYyZCmXtBzTSWAymW4iii1Wo5ZVZf60vBkz+PNYNp2dYUPlvFyKN20CqFD5ZEe6xr
 gIIUJBMLivrdiBM5jUyU42Fc5m0Dys/cIjbVjpquDNHa67Y8NZgKHXytPCBP38eIP0yb
 1bgJkEjmoheJTFoWOqerlZNBOGYVbug4LVRkNuIRhjgUOZC1ncNf6Rbw57OAahRGkqpE
 YCeGtLJ8CVUvYVTkjI7yvz+ncQtNBPhBiwitab6UsCEX8pe5nQxvxtsZTiMZ/OaIPRBb
 HbmT3WPdi/m+VQlg2lU4xlQsHWctI8ej3j19NceepmSumRb17L/tZ6EuhbbNMcug9kfz
 p3fw==
X-Gm-Message-State: AOAM532AiWNNtJ28JFdg3akKgDJRc7BvNWgt4Ech16WJtU2ryUpkz2TC
 lj0AVMlxVrJRTZyqIReMdsMpHA==
X-Google-Smtp-Source: ABdhPJzSd/BLLNpk9n0OUpBpiwBMRHeIt0QG74Yz6JNA8+sK+QolLcLcYSqLiPYsQvE61Xp99GMXsg==
X-Received: by 2002:a05:6000:1561:b0:204:1ba3:3b8b with SMTP id
 1-20020a056000156100b002041ba33b8bmr5130000wrz.325.1648142097648; 
 Thu, 24 Mar 2022 10:14:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 a12-20020a5d53cc000000b00205a0ee9c74sm209793wrw.89.2022.03.24.10.14.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 10:14:57 -0700 (PDT)
Date: Thu, 24 Mar 2022 18:14:55 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 4/4] drm/vc4: Implement atomic_print_state for HVS
 channel state
Message-ID: <YjynDwlOslHH/jm6@phenom.ffwll.local>
References: <20220324144724.1306133-1-maxime@cerno.tech>
 <20220324144724.1306133-5-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220324144724.1306133-5-maxime@cerno.tech>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 24, 2022 at 03:47:24PM +0100, Maxime Ripard wrote:
> The HVS state configuration is useful when debugging what's going on in
> the vc4 hardware pipeline. Add an implementation of .atomic_print_state.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

On the two vc4 patches:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/vc4/vc4_kms.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
> index 26b771c919b1..bffd81d4bfcf 100644
> --- a/drivers/gpu/drm/vc4/vc4_kms.c
> +++ b/drivers/gpu/drm/vc4/vc4_kms.c
> @@ -701,9 +701,26 @@ static void vc4_hvs_channels_destroy_state(struct drm_private_obj *obj,
>  	kfree(hvs_state);
>  }
>  
> +static void vc4_hvs_channels_print_state(struct drm_printer *p,
> +					 const struct drm_private_state *state)
> +{
> +	struct vc4_hvs_state *hvs_state = to_vc4_hvs_state(state);
> +	unsigned int i;
> +
> +	drm_printf(p, "HVS State\n");
> +	drm_printf(p, "\tCore Clock Rate: %lu\n", hvs_state->core_clock_rate);
> +
> +	for (i = 0; i < HVS_NUM_CHANNELS; i++) {
> +		drm_printf(p, "\tChannel %d\n", i);
> +		drm_printf(p, "\t\tin use=%d\n", hvs_state->fifo_state[i].in_use);
> +		drm_printf(p, "\t\tload=%lu\n", hvs_state->fifo_state[i].fifo_load);
> +	}
> +}
> +
>  static const struct drm_private_state_funcs vc4_hvs_state_funcs = {
>  	.atomic_duplicate_state = vc4_hvs_channels_duplicate_state,
>  	.atomic_destroy_state = vc4_hvs_channels_destroy_state,
> +	.atomic_print_state = vc4_hvs_channels_print_state,
>  };
>  
>  static void vc4_hvs_channels_obj_fini(struct drm_device *dev, void *unused)
> -- 
> 2.35.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
