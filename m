Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 473854FA0DD
	for <lists+dri-devel@lfdr.de>; Sat,  9 Apr 2022 02:59:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF01610E25E;
	Sat,  9 Apr 2022 00:59:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7325010E034
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Apr 2022 00:59:49 +0000 (UTC)
Received: by mail-qv1-xf2e.google.com with SMTP id x5so8784168qvk.4
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Apr 2022 17:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TU7iygfv910bLVYuOFFfKYw0ggN0VeEOLYhmgwxMB7I=;
 b=P3C9RfZ5ohhZugumNd3M4CugVpZk2RfHvVhXc6kHJjMRSepkUgxgakwNoxFQsCmRfY
 DynkLwWeCezB4u0e3FU0QS2xs//J81rFdwEtQ8+fyZ9wRWNKRTeUGrm0WKme208h5SMn
 1nbmg+6DaJk1vSDesPXyF8lIwdeF4IXR3k4eVqWhzsFssdVx+2WJPQp+AWvynfvpzxMz
 OzJaHxdQ2w1xfCzXyFDvAiheL7N+t0FV/dq23tx/3qh8WSf4W7JsiO+paQjVSuKBLQUw
 wE1treNQBSCSWgpC0QILs1laMANZIOrHb8/4btPtKuNBukdqBfRdHvmxGi1nbsV/Qh77
 rz9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TU7iygfv910bLVYuOFFfKYw0ggN0VeEOLYhmgwxMB7I=;
 b=YjhcYh1a6Ftr3yKizet0SifxViSDbCfOgTzUUzVpDgcBYU5KebHnffTHsXMZF5lxCi
 b3RhEPtk++bFyImFg09fa5gTRrdtdSRLWSGIqR748+AQw+9f0UkAPi+OOiBap8tqTkQ6
 YmugW81hOK3r1+RLJ5g+SvyN4VmgOJ6gyqdsomfkNAlaI61BYdG+O9Skir98lcF3G+4R
 Ps9h9znsuA+58EsZr3BZ3Cyi3ctR7VPCbv9E0uqqw1UV6RkFFimFuklBg+ltF7VN8vg3
 kWWqzm9Mu5lKpFSi9O8BXk3yvsB1XAd/XJFNtmDXEvGihS98Y2+e83hiUvswRgRaJ9s6
 zVkA==
X-Gm-Message-State: AOAM532gWkP9IPub5kf8KHrix2t8NysxUHI9NZEVwSuMaKbJPiKuYw2P
 P06Iq3j5H8acJO5MZ6/ojWLGrDHbMmMWkTWYBKi41+ZN6JAjng==
X-Google-Smtp-Source: ABdhPJyY52JQ0R/bv2VL2pw8IBetMCIYvPAJPEa4f0yeBuCW4X+X56uPgiKKeu9Ee3bNl+oR3IUdk4DyeOZukI6QHro=
X-Received: by 2002:a05:6214:20e4:b0:441:7bed:5ccd with SMTP id
 4-20020a05621420e400b004417bed5ccdmr18857950qvk.119.1649465988567; Fri, 08
 Apr 2022 17:59:48 -0700 (PDT)
MIME-Version: 1.0
References: <1649465635-20542-1-git-send-email-quic_abhinavk@quicinc.com>
 <1649465635-20542-2-git-send-email-quic_abhinavk@quicinc.com>
In-Reply-To: <1649465635-20542-2-git-send-email-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 9 Apr 2022 03:59:37 +0300
Message-ID: <CAA8EJprGokokQoEqNN2EEJZQUL9LrWcnOvPKaKDPLhddh7RszQ@mail.gmail.com>
Subject: Re: [PATCH v7 1/4] drm: allow passing possible_crtcs to
 drm_writeback_connector_init()
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
> Clients of drm_writeback_connector_init() initialize the
> possible_crtcs and then invoke the call to this API.
>
> To simplify things, allow passing possible_crtcs as a parameter
> to drm_writeback_connector_init() and make changes to the
> other drm drivers to make them compatible with this change.
>
> changes in v2:
>         - split the changes according to their functionality
>
> changes in v3:
>         - allow passing possible_crtcs for existing users of
>           drm_writeback_connector_init()
>         - squash the vendor changes into the same commit so
>           that each patch in the series can compile individually
>
> changes in v4:
>     - keep only changes related to possible_crtcs
>         - add line breaks after ARRAY_SIZE
>         - stop using temporary variables for possible_crtcs
>
> changes in v5:
>     - None
>
> changes in v6:
>     - None
>
> changes in v7:
>         - wrap long lines to match the coding style of existing drivers
>         - Fix indentation and remove parenthesis where not needed
>         - use u32 instead of uint32_t for possible_crtcs
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Acked-by: Liviu Dudau <liviu.dudau@arm.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> ---
>  drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c | 4 ++--
>  drivers/gpu/drm/arm/malidp_mw.c                          | 4 ++--
>  drivers/gpu/drm/drm_writeback.c                          | 7 ++++++-
>  drivers/gpu/drm/rcar-du/rcar_du_writeback.c              | 4 ++--
>  drivers/gpu/drm/vc4/vc4_txp.c                            | 3 ++-
>  drivers/gpu/drm/vkms/vkms_writeback.c                    | 4 ++--
>  include/drm/drm_writeback.h                              | 3 ++-
>  7 files changed, 18 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
> index e465cc4..ce4b760 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
> @@ -155,7 +155,6 @@ static int komeda_wb_connector_add(struct komeda_kms_dev *kms,
>         kwb_conn->wb_layer = kcrtc->master->wb_layer;
>
>         wb_conn = &kwb_conn->base;
> -       wb_conn->encoder.possible_crtcs = BIT(drm_crtc_index(&kcrtc->base));
>
>         formats = komeda_get_layer_fourcc_list(&mdev->fmt_tbl,
>                                                kwb_conn->wb_layer->layer_type,
> @@ -164,7 +163,8 @@ static int komeda_wb_connector_add(struct komeda_kms_dev *kms,
>         err = drm_writeback_connector_init(&kms->base, wb_conn,
>                                            &komeda_wb_connector_funcs,
>                                            &komeda_wb_encoder_helper_funcs,
> -                                          formats, n_formats);
> +                                          formats, n_formats,
> +                                          BIT(drm_crtc_index(&kcrtc->base)));
>         komeda_put_fourcc_list(formats);
>         if (err) {
>                 kfree(kwb_conn);
> diff --git a/drivers/gpu/drm/arm/malidp_mw.c b/drivers/gpu/drm/arm/malidp_mw.c
> index f5847a7..204c869 100644
> --- a/drivers/gpu/drm/arm/malidp_mw.c
> +++ b/drivers/gpu/drm/arm/malidp_mw.c
> @@ -212,7 +212,6 @@ int malidp_mw_connector_init(struct drm_device *drm)
>         if (!malidp->dev->hw->enable_memwrite)
>                 return 0;
>
> -       malidp->mw_connector.encoder.possible_crtcs = 1 << drm_crtc_index(&malidp->crtc);
>         drm_connector_helper_add(&malidp->mw_connector.base,
>                                  &malidp_mw_connector_helper_funcs);
>
> @@ -223,7 +222,8 @@ int malidp_mw_connector_init(struct drm_device *drm)
>         ret = drm_writeback_connector_init(drm, &malidp->mw_connector,
>                                            &malidp_mw_connector_funcs,
>                                            &malidp_mw_encoder_helper_funcs,
> -                                          formats, n_formats);
> +                                          formats, n_formats,
> +                                          1 << drm_crtc_index(&malidp->crtc));
>         kfree(formats);
>         if (ret)
>                 return ret;
> diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
> index dccf4504..9e0b845 100644
> --- a/drivers/gpu/drm/drm_writeback.c
> +++ b/drivers/gpu/drm/drm_writeback.c
> @@ -157,6 +157,7 @@ static const struct drm_encoder_funcs drm_writeback_encoder_funcs = {
>   * @enc_helper_funcs: Encoder helper funcs vtable to be used by the internal encoder
>   * @formats: Array of supported pixel formats for the writeback engine
>   * @n_formats: Length of the formats array
> + * @possible_crtcs: possible crtcs for the internal writeback encoder
>   *
>   * This function creates the writeback-connector-specific properties if they
>   * have not been already created, initializes the connector as
> @@ -174,7 +175,8 @@ int drm_writeback_connector_init(struct drm_device *dev,
>                                  struct drm_writeback_connector *wb_connector,
>                                  const struct drm_connector_funcs *con_funcs,
>                                  const struct drm_encoder_helper_funcs *enc_helper_funcs,
> -                                const u32 *formats, int n_formats)
> +                                const u32 *formats, int n_formats,
> +                                u32 possible_crtcs)
>  {
>         struct drm_property_blob *blob;
>         struct drm_connector *connector = &wb_connector->base;
> @@ -190,6 +192,9 @@ int drm_writeback_connector_init(struct drm_device *dev,
>                 return PTR_ERR(blob);
>
>         drm_encoder_helper_add(&wb_connector->encoder, enc_helper_funcs);
> +
> +       wb_connector->encoder.possible_crtcs = possible_crtcs;
> +
>         ret = drm_encoder_init(dev, &wb_connector->encoder,
>                                &drm_writeback_encoder_funcs,
>                                DRM_MODE_ENCODER_VIRTUAL, NULL);
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
> index c79d125..505a905 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
> @@ -200,7 +200,6 @@ int rcar_du_writeback_init(struct rcar_du_device *rcdu,
>  {
>         struct drm_writeback_connector *wb_conn = &rcrtc->writeback;
>
> -       wb_conn->encoder.possible_crtcs = 1 << drm_crtc_index(&rcrtc->crtc);
>         drm_connector_helper_add(&wb_conn->base,
>                                  &rcar_du_wb_conn_helper_funcs);
>
> @@ -208,7 +207,8 @@ int rcar_du_writeback_init(struct rcar_du_device *rcdu,
>                                             &rcar_du_wb_conn_funcs,
>                                             &rcar_du_wb_enc_helper_funcs,
>                                             writeback_formats,
> -                                           ARRAY_SIZE(writeback_formats));
> +                                           ARRAY_SIZE(writeback_formats),
> +                                           1 << drm_crtc_index(&rcrtc->crtc));
>  }
>
>  void rcar_du_writeback_setup(struct rcar_du_crtc *rcrtc,
> diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
> index 9809ca3..3447eb6 100644
> --- a/drivers/gpu/drm/vc4/vc4_txp.c
> +++ b/drivers/gpu/drm/vc4/vc4_txp.c
> @@ -497,7 +497,8 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
>         ret = drm_writeback_connector_init(drm, &txp->connector,
>                                            &vc4_txp_connector_funcs,
>                                            &vc4_txp_encoder_helper_funcs,
> -                                          drm_fmts, ARRAY_SIZE(drm_fmts));
> +                                          drm_fmts, ARRAY_SIZE(drm_fmts),
> +                                          0);
>         if (ret)
>                 return ret;
>
> diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
> index 8694227..6d01e55 100644
> --- a/drivers/gpu/drm/vkms/vkms_writeback.c
> +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
> @@ -140,12 +140,12 @@ int vkms_enable_writeback_connector(struct vkms_device *vkmsdev)
>  {
>         struct drm_writeback_connector *wb = &vkmsdev->output.wb_connector;
>
> -       vkmsdev->output.wb_connector.encoder.possible_crtcs = 1;
>         drm_connector_helper_add(&wb->base, &vkms_wb_conn_helper_funcs);
>
>         return drm_writeback_connector_init(&vkmsdev->drm, wb,
>                                             &vkms_wb_connector_funcs,
>                                             &vkms_wb_encoder_helper_funcs,
>                                             vkms_wb_formats,
> -                                           ARRAY_SIZE(vkms_wb_formats));
> +                                           ARRAY_SIZE(vkms_wb_formats),
> +                                           1);
>  }
> diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
> index 9697d27..5d9263f 100644
> --- a/include/drm/drm_writeback.h
> +++ b/include/drm/drm_writeback.h
> @@ -150,7 +150,8 @@ int drm_writeback_connector_init(struct drm_device *dev,
>                                  struct drm_writeback_connector *wb_connector,
>                                  const struct drm_connector_funcs *con_funcs,
>                                  const struct drm_encoder_helper_funcs *enc_helper_funcs,
> -                                const u32 *formats, int n_formats);
> +                                const u32 *formats, int n_formats,
> +                                u32 possible_crtcs);
>
>  int drm_writeback_set_fb(struct drm_connector_state *conn_state,
>                          struct drm_framebuffer *fb);
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
