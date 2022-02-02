Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E1E4A6EB2
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 11:28:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 081B410E648;
	Wed,  2 Feb 2022 10:28:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE07910E649
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 10:28:37 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id i19so18487689qvx.12
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Feb 2022 02:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MtKEV+jU8UJlJY6L2eJ34IuiGgV/AbhYH8R0GtYApWo=;
 b=tc4MWS6L05txv9/v8sY7Nq2fX4CLLBrLUb/c6kYKjiMc2htSKZP36mSEOmi6ocTaRC
 HrOwXexKtMnINXUnCsB3n5agOamtYx+KnK/CN+WTV4IbjUjtIBsiixaqkJjLMLQ7hEF1
 CifRUv6K4XmAlYlIhDAPOvg3mPvdFO94W+ClxHqzOW8EfyYiQR/k4hfQNl1j0jyRYqrE
 N3D13vZSv2Bi2WgB4ShcXHVeid2fcj1xkQWGxGywRslIrjjbOIWiOHnumdLO8QUDklKe
 0qePGdd79ZRRjUmM4sSic4j00xyLgw32rVyttKHOv8c9YzxYYCMPepqMPFyF6q0EPP+U
 azEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MtKEV+jU8UJlJY6L2eJ34IuiGgV/AbhYH8R0GtYApWo=;
 b=ZOWlADWD8i5HhSX3Y/uQPA+5gRKhXCGrxGHWjWLZBU8IjsRVGIqk4IEW+Uv21JCVYK
 rmTNhVKGWlSlpj4QVzfO1MwL6QBSpXq51gZ8QCFcInaTB2lJLAEuGKC5tQdDdlp5ZPj9
 Hmxy38+Lvpu2FwFpMmOa/RbHocexWEhdgLC9JzwxpEZDxo8Gi/g7rda61mJdLPbJajFw
 PMjlI+d6SX2psXpT6Rqfd3W2v/r51engF/kAawiniGD317zznCVC7M5XIIDMH+BbGJpa
 65wKU7319pvdaI6coB3FofJtoekG/CnP/CDRDjWgbLC1XFM8RHmAD2y6XIGkdsYUZn4U
 U1Bg==
X-Gm-Message-State: AOAM53108AOPaQvEyHv/X3SbY3Rl1p/T9AaItArTMMWN3jGnw8FX9IWy
 gZhcsIF0/F5Mr7Ymj9f6Cjpz7rpV9QCN9AzeI+qwYQ==
X-Google-Smtp-Source: ABdhPJwwCXUC90u1TfvbkrW/+mxg6UEoUpZCR2eWuHS8/mnMyDOQddLlYvTn6C0xowMERTI2uEmFyw193+RNR9fcFtA=
X-Received: by 2002:a05:6214:19ca:: with SMTP id
 j10mr26936391qvc.119.1643797716643; 
 Wed, 02 Feb 2022 02:28:36 -0800 (PST)
MIME-Version: 1.0
References: <20220202085429.22261-1-suraj.kandpal@intel.com>
 <20220202085429.22261-2-suraj.kandpal@intel.com>
In-Reply-To: <20220202085429.22261-2-suraj.kandpal@intel.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 2 Feb 2022 13:28:25 +0300
Message-ID: <CAA8EJppf5XL5+NSD+oksW9Zo1DKboPT5KBZwLmyF44q61wkxQA@mail.gmail.com>
Subject: Re: [PATCH 1/6] drm: add writeback pointers to drm_connector
To: Kandpal Suraj <suraj.kandpal@intel.com>
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
Cc: carsten.haitzler@arm.com, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, Laurent.pinchart@ideasonboard.com,
 arun.r.murthy@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2 Feb 2022 at 11:46, Kandpal Suraj <suraj.kandpal@intel.com> wrote:
>
> Changing drm_connector and drm_encoder feilds to pointers in
> drm_writeback_connector as the elements of struct
> drm_writeback_connector are:
> struct drm_writeback_connector {
>         struct drm_connector base;
>         struct drm_encoder encoder;
> Similarly the elements of intel_encoder and intel_connector
> are:
> struct intel_encoder {
>         struct drm_encoder base;
>
> struct intel_connector {
>         struct drm_connector base;
>
> The function drm_writeback_connector_init() will initialize the
> drm_connector and drm_encoder and attach them as well.
> Since the drm_connector/encoder are both struct in
> drm_writeback_connector and intel_connector/encoder, we need
> one of them to be a pointer so we can reference them or else we
> will be pointing to 2 seprate instances.

Could you please clarify, why do you want to use intel_connector for
the writeback connector?
I can see a usecase for sharing an encoder between the display and
writback pipelines (and if I'm not mistaken, this is the case for
Abhinav's case).
However, sharing the hardware-backed connector and writeback connector
sounds like a sign of a loose abstraction for me.

Please correct me if I'm wrong and Intel driver would really benefit
from reusing intel_connector as a base for drm_writeback_connector.

> Usually the struct defined in drm framework pointing to any
> struct will be pointer and allocating them and initialization
> will be done with the users.
> Like struct drm_connector and drm_encoder are part of drm
> framework and the users of these such as i915 have included them
> in their struct intel_connector and intel_encoder. Likewise
> struct drm_writeback_connector is a special connector and hence
> is not a user of drm_connector and hence this should be pointers.
>
> Adding drm_writeback_connector to drm_connector so that
> writeback_connector can be fetched from drm_connector as the previous
> container_of method won't work due to change in the feilds of
> drm_connector and drm_encoder in drm_writeback_connector.
>
> Note:The corresponding ripple effect due to the above changes namely in
> two drivers as I can see it komeda and vkms have been dealt with in the
> upcoming patches of this series.
>
> Signed-off-by: Kandpal Suraj <suraj.kandpal@intel.com>
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/drm_writeback.c | 19 ++++++++++---------
>  include/drm/drm_connector.h     |  3 +++
>  include/drm/drm_writeback.h     |  6 +++---
>  3 files changed, 16 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
> index dccf4504f1bb..47238db42363 100644
> --- a/drivers/gpu/drm/drm_writeback.c
> +++ b/drivers/gpu/drm/drm_writeback.c
> @@ -87,7 +87,7 @@ static const char *drm_writeback_fence_get_driver_name(struct dma_fence *fence)
>         struct drm_writeback_connector *wb_connector =
>                 fence_to_wb_connector(fence);
>
> -       return wb_connector->base.dev->driver->name;
> +       return wb_connector->base->dev->driver->name;
>  }
>
>  static const char *
> @@ -177,7 +177,7 @@ int drm_writeback_connector_init(struct drm_device *dev,
>                                  const u32 *formats, int n_formats)
>  {
>         struct drm_property_blob *blob;
> -       struct drm_connector *connector = &wb_connector->base;
> +       struct drm_connector *connector = wb_connector->base;
>         struct drm_mode_config *config = &dev->mode_config;
>         int ret = create_writeback_properties(dev);
>
> @@ -189,14 +189,15 @@ int drm_writeback_connector_init(struct drm_device *dev,
>         if (IS_ERR(blob))
>                 return PTR_ERR(blob);
>
> -       drm_encoder_helper_add(&wb_connector->encoder, enc_helper_funcs);
> -       ret = drm_encoder_init(dev, &wb_connector->encoder,
> +       drm_encoder_helper_add(wb_connector->encoder, enc_helper_funcs);
> +       ret = drm_encoder_init(dev, wb_connector->encoder,
>                                &drm_writeback_encoder_funcs,
>                                DRM_MODE_ENCODER_VIRTUAL, NULL);
>         if (ret)
>                 goto fail;
>
>         connector->interlace_allowed = 0;
> +       connector->wb_connector = wb_connector;
>
>         ret = drm_connector_init(dev, connector, con_funcs,
>                                  DRM_MODE_CONNECTOR_WRITEBACK);
> @@ -204,7 +205,7 @@ int drm_writeback_connector_init(struct drm_device *dev,
>                 goto connector_fail;
>
>         ret = drm_connector_attach_encoder(connector,
> -                                               &wb_connector->encoder);
> +                                               wb_connector->encoder);
>         if (ret)
>                 goto attach_fail;
>
> @@ -233,7 +234,7 @@ int drm_writeback_connector_init(struct drm_device *dev,
>  attach_fail:
>         drm_connector_cleanup(connector);
>  connector_fail:
> -       drm_encoder_cleanup(&wb_connector->encoder);
> +       drm_encoder_cleanup(wb_connector->encoder);
>  fail:
>         drm_property_blob_put(blob);
>         return ret;
> @@ -263,7 +264,7 @@ int drm_writeback_prepare_job(struct drm_writeback_job *job)
>  {
>         struct drm_writeback_connector *connector = job->connector;
>         const struct drm_connector_helper_funcs *funcs =
> -               connector->base.helper_private;
> +               connector->base->helper_private;
>         int ret;
>
>         if (funcs->prepare_writeback_job) {
> @@ -315,7 +316,7 @@ void drm_writeback_cleanup_job(struct drm_writeback_job *job)
>  {
>         struct drm_writeback_connector *connector = job->connector;
>         const struct drm_connector_helper_funcs *funcs =
> -               connector->base.helper_private;
> +               connector->base->helper_private;
>
>         if (job->prepared && funcs->cleanup_writeback_job)
>                 funcs->cleanup_writeback_job(connector, job);
> @@ -401,7 +402,7 @@ drm_writeback_get_out_fence(struct drm_writeback_connector *wb_connector)
>  {
>         struct dma_fence *fence;
>
> -       if (WARN_ON(wb_connector->base.connector_type !=
> +       if (WARN_ON(wb_connector->base->connector_type !=
>                     DRM_MODE_CONNECTOR_WRITEBACK))
>                 return NULL;
>
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 64cf5f88c05b..fa06faeb7844 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -44,6 +44,7 @@ struct drm_printer;
>  struct drm_privacy_screen;
>  struct edid;
>  struct i2c_adapter;
> +struct drm_writeback_connector;
>
>  enum drm_connector_force {
>         DRM_FORCE_UNSPECIFIED,
> @@ -1539,6 +1540,8 @@ struct drm_connector {
>          */
>         struct drm_encoder *encoder;
>
> +       struct drm_writeback_connector *wb_connector;
> +
>  #define MAX_ELD_BYTES  128
>         /** @eld: EDID-like data, if present */
>         uint8_t eld[MAX_ELD_BYTES];
> diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
> index 9697d2714d2a..078c9907219c 100644
> --- a/include/drm/drm_writeback.h
> +++ b/include/drm/drm_writeback.h
> @@ -22,7 +22,7 @@ struct drm_writeback_connector {
>         /**
>          * @base: base drm_connector object
>          */
> -       struct drm_connector base;
> +       struct drm_connector *base;
>
>         /**
>          * @encoder: Internal encoder used by the connector to fulfill
> @@ -31,7 +31,7 @@ struct drm_writeback_connector {
>          * by passing the @enc_funcs parameter to drm_writeback_connector_init()
>          * function.
>          */
> -       struct drm_encoder encoder;
> +       struct drm_encoder *encoder;
>
>         /**
>          * @pixel_formats_blob_ptr:
> @@ -143,7 +143,7 @@ struct drm_writeback_job {
>  static inline struct drm_writeback_connector *
>  drm_connector_to_writeback(struct drm_connector *connector)
>  {
> -       return container_of(connector, struct drm_writeback_connector, base);
> +       return connector->wb_connector;
>  }
>
>  int drm_writeback_connector_init(struct drm_device *dev,
> --
> 2.17.1
>


-- 
With best wishes
Dmitry
