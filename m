Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC00D376B90
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 23:18:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E6C46E575;
	Fri,  7 May 2021 21:18:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2F9F6E575
 for <dri-devel@lists.freedesktop.org>; Fri,  7 May 2021 21:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620422319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h69xFeijQcIIQwN+KpkbH+8q4ZpDpGmwjDACTpEty9k=;
 b=TmpsLUzLeoKhnJjkxkxCMmSvXe2xhpyapebbPuZzOZVio5L8HxQ6DISy3E5z8H28+wunS4
 vuV3UkK8eU02iTaBuD2tYtZ64G9WoqwZT18uUFGNWour9TxQ2tQw7K5D98u4srpALIUdkq
 ucoY3MzjPaktrVrtCc2tZQ/+EQxtIy4=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-0tWGc7YcOqiumRj6emsc4g-1; Fri, 07 May 2021 17:18:35 -0400
X-MC-Unique: 0tWGc7YcOqiumRj6emsc4g-1
Received: by mail-qv1-f72.google.com with SMTP id
 l19-20020a0ce5130000b02901b6795e3304so7594595qvm.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 May 2021 14:18:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=h69xFeijQcIIQwN+KpkbH+8q4ZpDpGmwjDACTpEty9k=;
 b=Sd5XkZhV3Q7nOcvbe+G/AAP8ZGWYWYMOuahKfQSJpT2D4hpjCD94PjGlh4hoSJEhxq
 E4EJfCD76uaU2Ey9ss7jUdGKjsdfM3eWO1CBiP/NF5GdSAmuglD8lA+48LgvmxarYHwd
 s3mVqdjRXebVcEuMi137iWysu51kYSq6G+qUESlDEa5akX6u1rHYSUzrZnDE8uxFolIz
 setw5HLKZVZh5+rfC8BWHYXnDEhmMMFarIA1Gk/M8iuYhVglCKinG4MlgM/IDiKe9n0h
 QBA6bNZjI6qOY3zc6sgv3ZsKM9Zre48KiTE0L5Ws1XlZSW5oRVYl/lv3ZyE5EMrCE+vE
 NL1w==
X-Gm-Message-State: AOAM5323rdwCi2VD7mI/Iw+5PtOpdVWHcYoV5XO9U0aT6UZlIoeQ5+Aw
 oo50pxxXW3p9TIrUWCkO1bYCIxO83sGNXhHM2Mmd1rL76uKWsNXd4qsp9smp1N/9FS1ulfXRbsO
 NZqD5geSExCwTRu5FXvwMQxHEQ9jL
X-Received: by 2002:a37:a8cb:: with SMTP id
 r194mr12177985qke.349.1620422315174; 
 Fri, 07 May 2021 14:18:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBWLZBXRB/xfQD+GxRV/Eh4eGw4fJ1tp1D9K7eJc5hSczf3mZHlXsF4pzBv0Ropy/az8Nxzg==
X-Received: by 2002:a37:a8cb:: with SMTP id
 r194mr12177967qke.349.1620422314904; 
 Fri, 07 May 2021 14:18:34 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id r81sm5950514qka.82.2021.05.07.14.18.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 14:18:34 -0700 (PDT)
Message-ID: <8eedeb02dc56ecaed5d2f3cb8d929a3675b2c3da.camel@redhat.com>
Subject: Re: [PATCH v6 2/5] drm/dp: Allow an early call to register DDC i2c bus
From: Lyude Paul <lyude@redhat.com>
To: Douglas Anderson <dianders@chromium.org>, Andrzej Hajda
 <a.hajda@samsung.com>, Neil Armstrong <narmstrong@baylibre.com>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>, Sam Ravnborg
 <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>, Ville Syrjala
 <ville.syrjala@intel.com>
Date: Fri, 07 May 2021 17:18:32 -0400
In-Reply-To: <20210503145750.v6.2.Iff8f2957d86af40f2bfcfb5a7163928481fccea4@changeid>
References: <20210503215844.2996320-1-dianders@chromium.org>
 <20210503145750.v6.2.Iff8f2957d86af40f2bfcfb5a7163928481fccea4@changeid>
Organization: Red Hat
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: robdclark@chromium.org, Thierry Reding <treding@nvidia.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>, linux-i2c@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adding ville from Intel to also get their take on this.

In general we've been trying to move DRM to a design where we don't expose any
devices until everything is ready. That's pretty much the main reason that we
register things during bridge attach time. Note though that even before the
DDC bus is registered it should still be usable, just things like get_device()
won't work.

This isn't the first time we've run into a problem like the one you're trying
to solve though, Tegra currently has a similar issue. Something we discussed
as a possible long-term solution for this was splitting i2c_add_adapter() into
a minimal initialization function and a registration function. Linux's device
core already allows for this (device_initialize() and device_add(), which are
called together when device_register() is called). Would this be a solution
that might work for you (and even better, would you possibly be willing to
write the patches? :)

On Mon, 2021-05-03 at 14:58 -0700, Douglas Anderson wrote:
> It can be helpful to fully register the AUX channel as an i2c bus even
> before the bridge is created. Let's optionally allow bridges to do
> that.
> 
> Specifically the case we're running into:
> - The panel driver wants to get its DDC bus at probe time.
> - The ti-sn65dsi86 MIPI-to-eDP bridge code, which provides the DDC
>   bus, wants to get the panel at probe time.
> 
> The next patches ("drm/bridge: ti-sn65dsi86: Promote the AUX channel
> to its own sub-dev") solves the chicken-and-egg problem by breaking
> the ti-sn65dsi86 driver into sub-devices, but in order for it to
> actually work we need the i2c bus to get registered at probe time and
> not in bridge attach time.
> 
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> Changes in v6:
> - ("drm/dp: Allow an early call to register DDC i2c bus") new for v6.
> 
>  drivers/gpu/drm/drm_dp_helper.c | 67 +++++++++++++++++++++++++++------
>  include/drm/drm_dp_helper.h     |  2 +
>  2 files changed, 57 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_dp_helper.c
> b/drivers/gpu/drm/drm_dp_helper.c
> index cb56d74e9d38..830294f0b341 100644
> --- a/drivers/gpu/drm/drm_dp_helper.c
> +++ b/drivers/gpu/drm/drm_dp_helper.c
> @@ -1757,6 +1757,49 @@ void drm_dp_aux_init(struct drm_dp_aux *aux)
>  }
>  EXPORT_SYMBOL(drm_dp_aux_init);
>  
> +/**
> + * drm_dp_aux_register_ddc() - register the DDC parts of the aux channel
> + * @aux: DisplayPort AUX channel
> + *
> + * This can be called after drm_dp_aux_init() to fully register the ddc bus
> + * as an i2c adapter with the rest of Linux.
> + *
> + * If you don't explicitly call this function it will be done implicitly as
> + * part of drm_dp_aux_register().
> + *
> + * Returns 0 on success or a negative error code on failure.
> + */
> +int drm_dp_aux_register_ddc(struct drm_dp_aux *aux)
> +{
> +       WARN_ON_ONCE(!aux->dev);
> +
> +       aux->ddc.class = I2C_CLASS_DDC;
> +       aux->ddc.owner = THIS_MODULE;
> +       aux->ddc.dev.parent = aux->dev;
> +
> +       strlcpy(aux->ddc.name, aux->name ? aux->name : dev_name(aux->dev),
> +               sizeof(aux->ddc.name));
> +
> +       return i2c_add_adapter(&aux->ddc);
> +}
> +EXPORT_SYMBOL(drm_dp_aux_register_ddc);
> +
> +/**
> + * drm_dp_aux_unregister_ddc() - unregister the DDC parts of the aux
> channel
> + *
> + * This is useful if you called drm_dp_aux_register_ddc(). If you let
> + * drm_dp_aux_register() implicitly register the DDC for you then you don't
> + * need to worry about calling this yourself.
> + *
> + * @aux: DisplayPort AUX channel
> + */
> +void drm_dp_aux_unregister_ddc(struct drm_dp_aux *aux)
> +{
> +       i2c_del_adapter(&aux->ddc);
> +       aux->ddc.dev.parent = NULL;
> +}
> +EXPORT_SYMBOL(drm_dp_aux_unregister_ddc);
> +
>  /**
>   * drm_dp_aux_register() - initialise and register aux channel
>   * @aux: DisplayPort AUX channel
> @@ -1793,20 +1836,19 @@ int drm_dp_aux_register(struct drm_dp_aux *aux)
>         if (!aux->ddc.algo)
>                 drm_dp_aux_init(aux);
>  
> -       aux->ddc.class = I2C_CLASS_DDC;
> -       aux->ddc.owner = THIS_MODULE;
> -       aux->ddc.dev.parent = aux->dev;
> -
> -       strlcpy(aux->ddc.name, aux->name ? aux->name : dev_name(aux->dev),
> -               sizeof(aux->ddc.name));
> +       /*
> +        * Implicitly register if drm_dp_aux_register_ddc() wasn't already
> +        * called (as evidenced by a NULL parent pointer).
> +        */
> +       if (!aux->ddc.dev.parent) {
> +               ret = drm_dp_aux_register_ddc(aux);
> +               if (ret)
> +                       return ret;
> +       }
>  
>         ret = drm_dp_aux_register_devnode(aux);
> -       if (ret)
> -               return ret;
> -
> -       ret = i2c_add_adapter(&aux->ddc);
>         if (ret) {
> -               drm_dp_aux_unregister_devnode(aux);
> +               drm_dp_aux_unregister_ddc(aux);
>                 return ret;
>         }
>  
> @@ -1821,7 +1863,8 @@ EXPORT_SYMBOL(drm_dp_aux_register);
>  void drm_dp_aux_unregister(struct drm_dp_aux *aux)
>  {
>         drm_dp_aux_unregister_devnode(aux);
> -       i2c_del_adapter(&aux->ddc);
> +       if (aux->ddc.dev.parent)
> +               drm_dp_aux_unregister_ddc(aux);
>  }
>  EXPORT_SYMBOL(drm_dp_aux_unregister);
>  
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> index e932b2c40095..d4d2d5e25bb7 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -2021,6 +2021,8 @@ bool drm_dp_lttpr_pre_emphasis_level_3_supported(const
> u8 caps[DP_LTTPR_PHY_CAP_
>  
>  void drm_dp_remote_aux_init(struct drm_dp_aux *aux);
>  void drm_dp_aux_init(struct drm_dp_aux *aux);
> +int drm_dp_aux_register_ddc(struct drm_dp_aux *aux);
> +void drm_dp_aux_unregister_ddc(struct drm_dp_aux *aux);
>  int drm_dp_aux_register(struct drm_dp_aux *aux);
>  void drm_dp_aux_unregister(struct drm_dp_aux *aux);
>  

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

