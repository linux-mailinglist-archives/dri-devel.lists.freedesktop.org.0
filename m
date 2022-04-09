Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C54DC4FA0E0
	for <lists+dri-devel@lfdr.de>; Sat,  9 Apr 2022 03:01:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C920E10E281;
	Sat,  9 Apr 2022 01:01:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3F0010E034
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Apr 2022 01:01:25 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id o18so4833283qtk.7
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Apr 2022 18:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eoBcIiDemkmp54s4RmdGWrfyYywncis1aaNHFUbSyqM=;
 b=xK5x3KkABdwXmD6m+nrRoFCvPK0S4Wq/DTjBirOdX7RRxflrMk/YsYvu2DvM4sMaNA
 62TuNzXmJ0lMmp5MX9BzQiQ+xls6l0ZSR0qUjI4BF1PpNRjFzHAxbKhjPxVGj6Uvl7rw
 opzxZg9Y6ipIq+A9d0z9dSCBfCMxwBnGfuLJh+PqX5LhUcIvKmbUojjJujcasWmfS31f
 AZ7Axsoxf777F9y0uw8APz2WgWXYwoTg6Lz7mDyDzXcLfgF/Smzoxge5i1rNN1hJCtk8
 +bEhl8NvgMqusKtIHrNSfGTpcePi4uNjRV4R+Nh3hBSdBBg08hju5LC4B19p48O30t2g
 VS6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eoBcIiDemkmp54s4RmdGWrfyYywncis1aaNHFUbSyqM=;
 b=NWYBWg1vbVK3PjWOlJw50N9acl5UTEJBOafeVm1YiMAfDOLPTba7mdhxN0Mv6eR/Mz
 8YdKXwuwuI4XLdQ0xPfKiZHtWPBY8+2CGWyFrjJtFGQCUpzwWH0y+82zYNQnKsRDtr8p
 0MfJ3XnoxiHK9jreCRytW3PhKZWIoq1z/ZsWD/KqMGnc5nJzd3QBG8FRNoawl+Lj8K0S
 Is1PB5picKLIOGPp2JQJPZ5IKp5tzng6x95FX1ER3Y9EjDXm9zaunCbjj2Vno7qainCW
 xf0BhXXARORNFHmY2uDlRJdU62MBYPB/WDmW8CVQHbTnECLkIBuRecXZljftk2aYg70J
 FHzw==
X-Gm-Message-State: AOAM530Smq0iKkEbbw83RRdgTAv7fe3R1QAh+cGUePmgesAalIM3Sc5i
 CFEyjcuIptMoswhtMg6WXIiKGLyZuaRboMKhTS6eFA==
X-Google-Smtp-Source: ABdhPJzQ4bp/fO5Qt0ivpxmODDzjyw6or+QQdCgNsMc289m5p6+XElJw2zyzpTzZF62xL3j4W7mTM1Xq2pkYiGW393M=
X-Received: by 2002:ac8:4e52:0:b0:2e1:dad8:5141 with SMTP id
 e18-20020ac84e52000000b002e1dad85141mr18036338qtw.62.1649466085054; Fri, 08
 Apr 2022 18:01:25 -0700 (PDT)
MIME-Version: 1.0
References: <1649465635-20542-1-git-send-email-quic_abhinavk@quicinc.com>
 <1649465635-20542-3-git-send-email-quic_abhinavk@quicinc.com>
In-Reply-To: <1649465635-20542-3-git-send-email-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 9 Apr 2022 04:01:14 +0300
Message-ID: <CAA8EJpo2Lgf08o-uFVkqF+qpTmtww-nmeNcV+shJ4h1ouQAdcg@mail.gmail.com>
Subject: Re: [PATCH v7 2/4] drm: introduce
 drm_writeback_connector_init_with_encoder() API
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
Cc: hamohammed.sa@gmail.com, suraj.kandpal@intel.com, emma@anholt.net,
 rodrigosiqueiramelo@gmail.com, jani.nikula@intel.com, liviu.dudau@arm.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, melissa.srw@gmail.com,
 nganji@codeaurora.org, seanpaul@chromium.org,
 Laurent.pinchart@ideasonboard.com, james.qian.wang@arm.com,
 quic_aravindh@quicinc.com, mihail.atanassov@arm.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 9 Apr 2022 at 03:54, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> For vendors drivers which pass an already allocated and
> initialized encoder especially for cases where the encoder
> hardware is shared OR the writeback encoder shares the resources
> with the rest of the display pipeline introduce a new API,
> drm_writeback_connector_init_with_encoder() which expects
> an initialized encoder as a parameter and only sets up the
> writeback connector.
>
> changes in v4:
>         - removed the possible_crtcs part
>
> changes in v5:
>         - reorder this change to come before in the series
>           to avoid incorrect functionality in subsequent changes
>         - continue using struct drm_encoder instead of
>           struct drm_encoder * and switch it in next change
>
> changes in v6:
>         - remove drm_writeback_connector_setup() and instead
>           directly call drm_writeback_connector_init_with_encoder()
>         - fix a drm_writeback_connector typo and function doc which
>           incorrectly shows that the function accepts enc_helper_funcs
>         - pass encoder as a parameter explicitly to the new API
>           for better readability
>
> changes in v7:
>         - fix the function doc slightly as suggested by Liviu
>
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> ---
>  drivers/gpu/drm/drm_writeback.c | 72 +++++++++++++++++++++++++++++++++--------
>  include/drm/drm_writeback.h     |  6 ++++
>  2 files changed, 64 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
> index 9e0b845..92658ad 100644
> --- a/drivers/gpu/drm/drm_writeback.c
> +++ b/drivers/gpu/drm/drm_writeback.c
> @@ -178,6 +178,62 @@ int drm_writeback_connector_init(struct drm_device *dev,
>                                  const u32 *formats, int n_formats,
>                                  u32 possible_crtcs)
>  {
> +       int ret = 0;
> +
> +       drm_encoder_helper_add(&wb_connector->encoder, enc_helper_funcs);
> +
> +       wb_connector->encoder.possible_crtcs = possible_crtcs;
> +
> +       ret = drm_encoder_init(dev, &wb_connector->encoder,
> +                              &drm_writeback_encoder_funcs,
> +                              DRM_MODE_ENCODER_VIRTUAL, NULL);
> +       if (ret)
> +               return ret;
> +
> +       ret = drm_writeback_connector_init_with_encoder(dev, wb_connector, &wb_connector->encoder,
> +                       con_funcs, formats, n_formats);
> +
> +       if (ret)
> +               drm_encoder_cleanup(&wb_connector->encoder);
> +
> +       return ret;
> +}
> +EXPORT_SYMBOL(drm_writeback_connector_init);
> +
> +/**
> + * drm_writeback_connector_init_with_encoder - Initialize a writeback connector and its properties
> + * using the encoder which already assigned and initialized
> + *
> + * @dev: DRM device
> + * @wb_connector: Writeback connector to initialize
> + * @enc: handle to the already initialized drm encoder
> + * @con_funcs: Connector funcs vtable
> + * @formats: Array of supported pixel formats for the writeback engine
> + * @n_formats: Length of the formats array
> + *
> + * This function creates the writeback-connector-specific properties if they
> + * have not been already created, initializes the connector as
> + * type DRM_MODE_CONNECTOR_WRITEBACK, and correctly initializes the property
> + * values.
> + *
> + * This function assumes that the drm_writeback_connector's encoder has already been
> + * created and initialized before invoking this function.
> + *
> + * In addition, this function also assumes that callers of this API will manage
> + * assigning the encoder helper functions, possible_crtcs and any other encoder
> + * specific operation.
> + *
> + * Drivers should always use this function instead of drm_connector_init() to
> + * set up writeback connectors if they want to manage themselves the lifetime of the
> + * associated encoder.
> + *
> + * Returns: 0 on success, or a negative error code
> + */
> +int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
> +               struct drm_writeback_connector *wb_connector, struct drm_encoder *enc,
> +               const struct drm_connector_funcs *con_funcs, const u32 *formats,
> +               int n_formats)
> +{
>         struct drm_property_blob *blob;
>         struct drm_connector *connector = &wb_connector->base;
>         struct drm_mode_config *config = &dev->mode_config;
> @@ -191,15 +247,6 @@ int drm_writeback_connector_init(struct drm_device *dev,
>         if (IS_ERR(blob))
>                 return PTR_ERR(blob);
>
> -       drm_encoder_helper_add(&wb_connector->encoder, enc_helper_funcs);
> -
> -       wb_connector->encoder.possible_crtcs = possible_crtcs;
> -
> -       ret = drm_encoder_init(dev, &wb_connector->encoder,
> -                              &drm_writeback_encoder_funcs,
> -                              DRM_MODE_ENCODER_VIRTUAL, NULL);
> -       if (ret)
> -               goto fail;
>
>         connector->interlace_allowed = 0;
>
> @@ -208,8 +255,7 @@ int drm_writeback_connector_init(struct drm_device *dev,
>         if (ret)
>                 goto connector_fail;
>
> -       ret = drm_connector_attach_encoder(connector,
> -                                               &wb_connector->encoder);
> +       ret = drm_connector_attach_encoder(connector, enc);
>         if (ret)
>                 goto attach_fail;
>
> @@ -238,12 +284,10 @@ int drm_writeback_connector_init(struct drm_device *dev,
>  attach_fail:
>         drm_connector_cleanup(connector);
>  connector_fail:
> -       drm_encoder_cleanup(&wb_connector->encoder);
> -fail:
>         drm_property_blob_put(blob);
>         return ret;
>  }
> -EXPORT_SYMBOL(drm_writeback_connector_init);
> +EXPORT_SYMBOL(drm_writeback_connector_init_with_encoder);
>
>  int drm_writeback_set_fb(struct drm_connector_state *conn_state,
>                          struct drm_framebuffer *fb)
> diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
> index 5d9263f..bb306fa 100644
> --- a/include/drm/drm_writeback.h
> +++ b/include/drm/drm_writeback.h
> @@ -153,6 +153,12 @@ int drm_writeback_connector_init(struct drm_device *dev,
>                                  const u32 *formats, int n_formats,
>                                  u32 possible_crtcs);
>
> +int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
> +                               struct drm_writeback_connector *wb_connector,
> +                               struct drm_encoder *enc,
> +                               const struct drm_connector_funcs *con_funcs, const u32 *formats,
> +                               int n_formats);
> +
>  int drm_writeback_set_fb(struct drm_connector_state *conn_state,
>                          struct drm_framebuffer *fb);
>
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
