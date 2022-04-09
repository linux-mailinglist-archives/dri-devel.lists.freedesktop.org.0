Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 345274FA0E6
	for <lists+dri-devel@lfdr.de>; Sat,  9 Apr 2022 03:05:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C7D10E034;
	Sat,  9 Apr 2022 01:05:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80FC610E034
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Apr 2022 01:05:29 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id a5so8805064qvx.1
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Apr 2022 18:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rmA8PcsmUtgioFLRk5aX2eO1o1HZ2Lvld0hl0tnCmBU=;
 b=CDE3EoWWmeLvRRzMEFbBRckAFEkcKW/qfGa0QoTGglnrq+W8Mu+L4YfPJ2rZ4fPdU0
 HY+MPEhQLJXk3jvpvD7gGzcpXUFym6CQoRv0AlK0vZAnWcfim2RRxiQUyLA415L5W8QS
 NTbvf5eLBVGHs3Yy6Sf5SUz7i/j25X4qKrkg+oa17IveRLyjNtBtv9594k3ohGr1yRH2
 E5AvaZ/vkdeqI9iLjtRaQjQYUH1/9Pv0PF/zCbbmbVrNWIFRoCrT+0oRnDCmd1AEjany
 9S09RsAXx2UyQ+GnJVMtMKIOWdr73irBjESo2Z5k6ukM8yYV0trL4lDB9C6c7SZRBitZ
 eQVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rmA8PcsmUtgioFLRk5aX2eO1o1HZ2Lvld0hl0tnCmBU=;
 b=8IFejRJBu6tCf9J0GoxiYDJaQIKhEJhnoY4kantkXE47mD3Pq03oJGPdN/U5oiZzZb
 S+TbrrthSlOYKeDmrRhJ7b8CeXzLgklXET2UCCIrAhWtEvaL9COxqFCM5yAX30smroAu
 lrSlZs7ir8y2S0W4pXAvdy6WvrcUWbwIMFMj5pJYK8+vYP6VoOSdAL1n3/jd/e+GlDok
 kRkBP01FGWJZ8aAe+VZvKFiPicUfmvgRAGIF5Ljlobeqbor5u0+xFQhhIh4hfgPaODLX
 9S1v+4ZMGPN9LEZbl8HUxn1TEXbIMdzPyFFmeF5AqIJaYBc7tX22BLymOkoZJ6FVHsPP
 cXuw==
X-Gm-Message-State: AOAM530btyY4e+/nXt+IuqK72EvfTNm6rBccBFDDadCho+wA8fo58Jkc
 OxSvpG7d+4PKlWCn4F0h11ToOKfBFd8+JIlriCWUUw==
X-Google-Smtp-Source: ABdhPJwUY7e4WQrRxSZoDV1UNN9xe+VixnO+EGaZx8wNbXVdt5zVfBS6m584R5rVkPg2Rt7Yw4mbFQCJJUOgU/+BJY4=
X-Received: by 2002:a05:6214:2aae:b0:440:f701:e8df with SMTP id
 js14-20020a0562142aae00b00440f701e8dfmr18808032qvb.55.1649466328644; Fri, 08
 Apr 2022 18:05:28 -0700 (PDT)
MIME-Version: 1.0
References: <1649465635-20542-1-git-send-email-quic_abhinavk@quicinc.com>
 <1649465635-20542-4-git-send-email-quic_abhinavk@quicinc.com>
In-Reply-To: <1649465635-20542-4-git-send-email-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 9 Apr 2022 04:05:17 +0300
Message-ID: <CAA8EJprbA+Qdg7HOO_YSc2O0JM7f+nJ7R7Tm-R0uVBpzk_A2og@mail.gmail.com>
Subject: Re: [PATCH v7 3/4] drm: allow real encoder to be passed for
 drm_writeback_connector
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
> For some vendor driver implementations, display hardware can
> be shared between the encoder used for writeback and the physical
> display.
>
> In addition resources such as clocks and interrupts can
> also be shared between writeback and the real encoder.
>
> To accommodate such vendor drivers and hardware, allow
> real encoder to be passed for drm_writeback_connector.
>
> For existing clients, drm_writeback_connector_init() will use
> an internal_encoder under the hood and hence no changes will
> be needed.
>
> changes in v7:
>         - move this change before the vc4 change in the series
>           to minimize the changes to vendor drivers in drm core
>           changes
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/drm_writeback.c | 18 ++++++++++++------
>  drivers/gpu/drm/vc4/vc4_txp.c   |  4 ++--
>  include/drm/drm_writeback.h     | 22 ++++++++++++++++++++--
>  3 files changed, 34 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
> index 92658ad..0538674 100644
> --- a/drivers/gpu/drm/drm_writeback.c
> +++ b/drivers/gpu/drm/drm_writeback.c
> @@ -180,21 +180,21 @@ int drm_writeback_connector_init(struct drm_device *dev,
>  {
>         int ret = 0;
>
> -       drm_encoder_helper_add(&wb_connector->encoder, enc_helper_funcs);
> +       drm_encoder_helper_add(&wb_connector->internal_encoder, enc_helper_funcs);
>
> -       wb_connector->encoder.possible_crtcs = possible_crtcs;
> +       wb_connector->internal_encoder.possible_crtcs = possible_crtcs;
>
> -       ret = drm_encoder_init(dev, &wb_connector->encoder,
> +       ret = drm_encoder_init(dev, &wb_connector->internal_encoder,
>                                &drm_writeback_encoder_funcs,
>                                DRM_MODE_ENCODER_VIRTUAL, NULL);
>         if (ret)
>                 return ret;
>
> -       ret = drm_writeback_connector_init_with_encoder(dev, wb_connector, &wb_connector->encoder,
> -                       con_funcs, formats, n_formats);
> +       ret = drm_writeback_connector_init_with_encoder(dev, wb_connector,
> +                       &wb_connector->internal_encoder, con_funcs, formats, n_formats);
>
>         if (ret)
> -               drm_encoder_cleanup(&wb_connector->encoder);
> +               drm_encoder_cleanup(&wb_connector->internal_encoder);
>
>         return ret;
>  }
> @@ -239,6 +239,12 @@ int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
>         struct drm_mode_config *config = &dev->mode_config;
>         int ret = create_writeback_properties(dev);
>
> +       /*
> +        * Assign the encoder passed to this API to the wb_connector's encoder.
> +        * For drm_writeback_connector_init(), this shall be the internal_encoder
> +        */
> +       wb_connector->encoder = enc;
> +
>         if (ret != 0)
>                 return ret;
>
> diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
> index 3447eb6..7e063a9 100644
> --- a/drivers/gpu/drm/vc4/vc4_txp.c
> +++ b/drivers/gpu/drm/vc4/vc4_txp.c
> @@ -159,7 +159,7 @@ struct vc4_txp {
>
>  static inline struct vc4_txp *encoder_to_vc4_txp(struct drm_encoder *encoder)
>  {
> -       return container_of(encoder, struct vc4_txp, connector.encoder);
> +       return container_of(encoder, struct vc4_txp, connector.internal_encoder);
>  }
>
>  static inline struct vc4_txp *connector_to_vc4_txp(struct drm_connector *conn)
> @@ -507,7 +507,7 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
>         if (ret)
>                 return ret;
>
> -       encoder = &txp->connector.encoder;
> +       encoder = txp->connector.encoder;
>         encoder->possible_crtcs = drm_crtc_mask(crtc);
>
>         ret = devm_request_irq(dev, irq, vc4_txp_interrupt, 0,
> diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
> index bb306fa..3fbae9d 100644
> --- a/include/drm/drm_writeback.h
> +++ b/include/drm/drm_writeback.h
> @@ -25,13 +25,31 @@ struct drm_writeback_connector {
>         struct drm_connector base;
>
>         /**
> -        * @encoder: Internal encoder used by the connector to fulfill
> +        * @encoder: handle to drm_encoder used by the connector to fulfill
>          * the DRM framework requirements. The users of the
>          * @drm_writeback_connector control the behaviour of the @encoder
>          * by passing the @enc_funcs parameter to drm_writeback_connector_init()
>          * function.
> +        *
> +        * For some vendor drivers, the hardware resources are shared between
> +        * writeback encoder and rest of the display pipeline.
> +        * To accommodate such cases, encoder is a handle to the real encoder
> +        * hardware.
> +        *
> +        * For current existing writeback users, this shall continue to be the
> +        * embedded encoder for the writeback connector.
> +        */
> +       struct drm_encoder *encoder;
> +
> +       /**
> +        * @internal_encoder: internal encoder used by writeback when
> +        * drm_writeback_connector_init() is used.
> +        * @encoder will be assigned to this for those cases
> +        *
> +        * This will be unused when drm_writeback_connector_init_with_encoder()
> +        * is used.
>          */
> -       struct drm_encoder encoder;
> +       struct drm_encoder internal_encoder;
>
>         /**
>          * @pixel_formats_blob_ptr:
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
