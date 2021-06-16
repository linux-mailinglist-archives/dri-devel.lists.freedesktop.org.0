Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D253AA439
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 21:22:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B58626E7DC;
	Wed, 16 Jun 2021 19:22:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADBC76E079
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 19:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623871349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cfPQRSykQydOulCcQ49aAeUEKKM3a3d6+BzEEPE5SV4=;
 b=SsXCmPSDHH+IE6d4v6/huWFI/fel+BRzkTvOXH3rMpKsOA8ft9nRpZdVx5/gu05dzGFKJm
 PViptE/SD8lN6aMyoQhm7wmXDXZLzARVIVk49PvJPqTmEVtQIxSqHzrp87yF8qtGQyXkAb
 MlfDI/oAVP/Kw5XLUO8U1qh/afFir7k=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-gbeLmem_OhamK3WuslZAGg-1; Wed, 16 Jun 2021 15:22:28 -0400
X-MC-Unique: gbeLmem_OhamK3WuslZAGg-1
Received: by mail-qk1-f199.google.com with SMTP id
 x4-20020a3763040000b02903ab95237c25so415249qkb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 12:22:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=cfPQRSykQydOulCcQ49aAeUEKKM3a3d6+BzEEPE5SV4=;
 b=AQgh4Xu/u0rApitrZMjp/ZGwPwxdZmKut1WDovXm+6eRIwuE1lSbeUTaJ/1Ck5WK2d
 E20lJ5YxtkYNlFnCs3jv4MTCZbWFPQ+RSAq759HIHH4QHlqwaBHOSdknd3hKcK4oe+b6
 d+gFXG3yJpIm2UVi6QMUsS4J32w+ZzfNxwSvsTc1JMym350lYZ30/R+nXGBuc3OS2GYs
 t8w+9VqzRyJvIO2Rc7FROtLmIYgcMJXjunnbjbPB0+M4zcsF///6bKkGjgWiR/gm3YIx
 QSOaP6+pPhEGJZ/LGKbaOsPYC/rdrNz8YzNxtP5d6hkh+AeA6CZSgE0Q00Pr8zvzcUQK
 w56g==
X-Gm-Message-State: AOAM532ntjOQKS1+p0f0TLgIdeN2s6SWZyWQv6SiGM8kiiGXoWxjdhK3
 zTJVSdTg8qtOT/TyvtFklIjA+aiBb/8p8BB3ljh9V/HPL9FaMNVkBlGWw/1H6bwqHtNHOAxyGPH
 cfEqXKqR9hUiYs3llOAJc9le3O7Rz
X-Received: by 2002:a05:620a:1129:: with SMTP id
 p9mr1743833qkk.163.1623871347719; 
 Wed, 16 Jun 2021 12:22:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8h8pJ527wXO5YR0w/WfuqqYYEriH77nlHFOVvL9eWL0AJ7EELuOrCm3wyxVLlnNbjvIgaNQ==
X-Received: by 2002:a05:620a:1129:: with SMTP id
 p9mr1743811qkk.163.1623871347486; 
 Wed, 16 Jun 2021 12:22:27 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id s22sm1708411qtx.32.2021.06.16.12.22.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 12:22:27 -0700 (PDT)
Message-ID: <31f31a0d37e05f71ade68b3452ef471c0c681302.camel@redhat.com>
Subject: Re: [v6 1/5] drm/panel: add basic DP AUX backlight support
From: Lyude Paul <lyude@redhat.com>
To: Rajeev Nandan <rajeevny@codeaurora.org>,
 dri-devel@lists.freedesktop.org,  linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,  devicetree@vger.kernel.org
Date: Wed, 16 Jun 2021 15:22:25 -0400
In-Reply-To: <1623499682-2140-2-git-send-email-rajeevny@codeaurora.org>
References: <1623499682-2140-1-git-send-email-rajeevny@codeaurora.org>
 <1623499682-2140-2-git-send-email-rajeevny@codeaurora.org>
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
Cc: daniel.thompson@linaro.org, mkrishn@codeaurora.org, jani.nikula@intel.com,
 lee.jones@linaro.org, linux-kernel@vger.kernel.org, abhinavk@codeaurora.org,
 dianders@chromium.org, a.hajda@samsung.com, robdclark@gmail.com,
 thierry.reding@gmail.com, seanpaul@chromium.org,
 laurent.pinchart@ideasonboard.com, linux-fbdev@vger.kernel.org,
 kalyan_t@codeaurora.org, jingoohan1@gmail.com, hoegsberg@chromium.org,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Sat, 2021-06-12 at 17:37 +0530, Rajeev Nandan wrote:
> Some panels support backlight control over DP AUX channel using
> VESA's standard backlight control interface.
> Using new DRM eDP backlight helpers, add support to create and
> register a backlight for those panels in drm_panel to simplify
> the panel drivers.
> 
> The panel driver with access to "struct drm_dp_aux" can create and
> register a backlight device using following code snippet in its
> probe() function:
> 
>         err = drm_panel_dp_aux_backlight(panel, aux);
>         if (err)
>                 return err;
> 
> Then drm_panel will handle backlight_(enable|disable) calls
> similar to the case when drm_panel_of_backlight() is used.
> 
> Currently, we are not supporting one feature where the source
> device can combine the backlight brightness levels set through
> DP AUX and the BL_PWM_DIM eDP connector pin. Since it's not
> required for the basic backlight controls, it can be added later.
> 
> Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> Changes in v5:
> - New
> 
> Changes in v6:
> - Fixed ordering of memory allocation (Douglas)
> - Updated word wrapping in a comment (Douglas)
> 
>  drivers/gpu/drm/drm_panel.c | 108
> ++++++++++++++++++++++++++++++++++++++++++++
>  include/drm/drm_panel.h     |  15 ++++--
>  2 files changed, 119 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> index f634371..9e65342 100644
> --- a/drivers/gpu/drm/drm_panel.c
> +++ b/drivers/gpu/drm/drm_panel.c
> @@ -26,12 +26,20 @@
>  #include <linux/module.h>
>  
>  #include <drm/drm_crtc.h>
> +#include <drm/drm_dp_helper.h>
>  #include <drm/drm_panel.h>
>  #include <drm/drm_print.h>
>  
>  static DEFINE_MUTEX(panel_lock);
>  static LIST_HEAD(panel_list);
>  
> +struct dp_aux_backlight {
> +       struct backlight_device *base;
> +       struct drm_dp_aux *aux;
> +       struct drm_edp_backlight_info info;
> +       bool enabled;
> +};
> +
>  /**
>   * DOC: drm panel
>   *
> @@ -342,6 +350,106 @@ int drm_panel_of_backlight(struct drm_panel *panel)
>         return 0;
>  }
>  EXPORT_SYMBOL(drm_panel_of_backlight);
> +
> +static int dp_aux_backlight_update_status(struct backlight_device *bd)
> +{
> +       struct dp_aux_backlight *bl = bl_get_data(bd);
> +       u16 brightness = backlight_get_brightness(bd);
> +       int ret = 0;
> +
> +       if (brightness > 0) {
> +               if (!bl->enabled) {
> +                       drm_edp_backlight_enable(bl->aux, &bl->info,
> brightness);
> +                       bl->enabled = true;
> +                       return 0;
> +               }
> +               ret = drm_edp_backlight_set_level(bl->aux, &bl->info,
> brightness);
> +       } else {
> +               if (bl->enabled) {
> +                       drm_edp_backlight_disable(bl->aux, &bl->info);
> +                       bl->enabled = false;
> +               }
> +       }
> +
> +       return ret;
> +}
> +
> +static const struct backlight_ops dp_aux_bl_ops = {
> +       .update_status = dp_aux_backlight_update_status,
> +};
> +
> +/**
> + * drm_panel_dp_aux_backlight - create and use DP AUX backlight
> + * @panel: DRM panel
> + * @aux: The DP AUX channel to use
> + *
> + * Use this function to create and handle backlight if your panel
> + * supports backlight control over DP AUX channel using DPCD
> + * registers as per VESA's standard backlight control interface.
> + *
> + * When the panel is enabled backlight will be enabled after a
> + * successful call to &drm_panel_funcs.enable()
> + *
> + * When the panel is disabled backlight will be disabled before the
> + * call to &drm_panel_funcs.disable().
> + *
> + * A typical implementation for a panel driver supporting backlight
> + * control over DP AUX will call this function at probe time.
> + * Backlight will then be handled transparently without requiring
> + * any intervention from the driver.
> + *
> + * drm_panel_dp_aux_backlight() must be called after the call to
> drm_panel_init().
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int drm_panel_dp_aux_backlight(struct drm_panel *panel, struct drm_dp_aux
> *aux)
> +{
> +       struct dp_aux_backlight *bl;
> +       struct backlight_properties props = { 0 };
> +       u16 current_level;
> +       u8 current_mode;
> +       u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE];
> +       int ret;
> +
> +       if (!panel || !panel->dev || !aux)
> +               return -EINVAL;
> +
> +       ret = drm_dp_dpcd_read(aux, DP_EDP_DPCD_REV, edp_dpcd,
> +                              EDP_DISPLAY_CTL_CAP_SIZE);
> +       if (ret < 0)
> +               return ret;
> +
> +       if (!drm_edp_backlight_supported(edp_dpcd)) {
> +               DRM_DEV_INFO(panel->dev, "DP AUX backlight is not
> supported\n");
> +               return 0;
> +       }
> +
> +       bl = devm_kzalloc(panel->dev, sizeof(*bl), GFP_KERNEL);
> +       if (!bl)
> +               return -ENOMEM;
> +
> +       bl->aux = aux;
> +
> +       ret = drm_edp_backlight_init(aux, &bl->info, 0, edp_dpcd,
> +                                    &current_level, &current_mode);
> +       if (ret < 0)
> +               return ret;
> +
> +       props.type = BACKLIGHT_RAW;
> +       props.brightness = current_level;
> +       props.max_brightness = bl->info.max;
> +
> +       bl->base = devm_backlight_device_register(panel->dev,
> "dp_aux_backlight",
> +                                                 panel->dev, bl,
> +                                                 &dp_aux_bl_ops, &props);
> +       if (IS_ERR(bl->base))
> +               return PTR_ERR(bl->base);
> +
> +       panel->backlight = bl->base;
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL(drm_panel_dp_aux_backlight);
>  #endif
>  
>  MODULE_AUTHOR("Thierry Reding <treding@nvidia.com>");
> diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
> index 33605c3..3ebfaa6 100644
> --- a/include/drm/drm_panel.h
> +++ b/include/drm/drm_panel.h
> @@ -32,6 +32,7 @@ struct backlight_device;
>  struct device_node;
>  struct drm_connector;
>  struct drm_device;
> +struct drm_dp_aux;
>  struct drm_panel;
>  struct display_timing;
>  
> @@ -64,8 +65,8 @@ enum drm_panel_orientation;
>   * the panel. This is the job of the .unprepare() function.
>   *
>   * Backlight can be handled automatically if configured using
> - * drm_panel_of_backlight(). Then the driver does not need to implement the
> - * functionality to enable/disable backlight.
> + * drm_panel_of_backlight() or drm_panel_dp_aux_backlight(). Then the
> driver
> + * does not need to implement the functionality to enable/disable
> backlight.
>   */
>  struct drm_panel_funcs {
>         /**
> @@ -144,8 +145,8 @@ struct drm_panel {
>          * Backlight device, used to turn on backlight after the call
>          * to enable(), and to turn off backlight before the call to
>          * disable().
> -        * backlight is set by drm_panel_of_backlight() and drivers
> -        * shall not assign it.
> +        * backlight is set by drm_panel_of_backlight() or
> +        * drm_panel_dp_aux_backlight() and drivers shall not assign it.
>          */
>         struct backlight_device *backlight;
>  
> @@ -208,11 +209,17 @@ static inline int of_drm_get_panel_orientation(const
> struct device_node *np,
>  #if IS_ENABLED(CONFIG_DRM_PANEL) &&
> (IS_BUILTIN(CONFIG_BACKLIGHT_CLASS_DEVICE) || \
>         (IS_MODULE(CONFIG_DRM) && IS_MODULE(CONFIG_BACKLIGHT_CLASS_DEVICE)))
>  int drm_panel_of_backlight(struct drm_panel *panel);
> +int drm_panel_dp_aux_backlight(struct drm_panel *panel, struct drm_dp_aux
> *aux);
>  #else
>  static inline int drm_panel_of_backlight(struct drm_panel *panel)
>  {
>         return 0;
>  }
> +static inline int drm_panel_dp_aux_backlight(struct drm_panel *panel,
> +                                            struct drm_dp_aux *aux)
> +{
> +       return 0;
> +}
>  #endif
>  
>  #endif

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

