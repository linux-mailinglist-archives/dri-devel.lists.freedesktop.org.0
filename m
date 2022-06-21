Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CE155307B
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 13:12:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 034C210F269;
	Tue, 21 Jun 2022 11:12:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1718110F3FD
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 11:12:49 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id n197so9747671qke.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 04:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9qa1MQsdjtp0OEX63gPYIUdKxF/75S2mxsehPpdr6gY=;
 b=l6NGbdp4FKgTJV9bvxCF+EY/e18GEajW6uYOe172nIpRGpI9MAJlvER6aKZcAPH1vx
 tqYuoMRyhxog/HbuYMoRJkVNHrpmDj/flJseuG7qmds/cwGcZdnYTgiejUbpLBb+2bfk
 9qGIZfD0/x74wCAluBB1HQz6FT/yP4xsV/qzUex1Vn4Gz2HbEYt+ML44shsG+rWdQioW
 jI5UlxcEkTA6LJqclPrkxDpljoFxKJbpk7dJ/k1DKhbfvnrn04Tb20cJuxhUH56g/CF1
 cVM4WmoIMf9b9dd8UXBry8HuoVsSj0nMEI8nt6qy+P6DE7mrj0hu1Y93s40qZ6S0eb4X
 LQ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9qa1MQsdjtp0OEX63gPYIUdKxF/75S2mxsehPpdr6gY=;
 b=Dr9YWebi85dVvyM64UrL/gyUadDgM++dmLKKgfVyOtccu88iY4nWsQlgVMug7fpUpm
 F1wk95l/rhQYr4uEaBuL8h1bjIQBnkrRbonBjyuCjexxy9SKkCvoh8e7QhoxebYdSUx/
 8WZ7oEd0zpKarTG5KJ7jebajseMNinrLceFjiOFMxHLBYh3JWiqzRhct/GjnMWCh05Cd
 G/1uRb1ZkQr+Wh6Eh2ljlRRxrlBgXGjEsO/WRoKdJvQM6hjXeN5y6nIS3QuJgDfljNTp
 7RgN2VhqcDD2bCs4xdL7Bdtlm/BXhBTtvMjXgoEgFNwXBanOoNLFLGZzboQq5K9zFT/u
 xNZg==
X-Gm-Message-State: AJIora8AzEd8FziHm++N2N/QV+Pmf6aWJeoo9+0UvSZHexPiQPXViw0n
 gd/vO3r4bnJGafvof61/bJL/B5LUJrPNrAx1h/VTWQ==
X-Google-Smtp-Source: AGRyM1uafhTUa4eavyRah2JJoXvD8uHWLL2uFvFdCTn2zghYYgQYSuB04Dr+yY9pjQbiW54ZNO0GarGgEj06mOHKfo4=
X-Received: by 2002:a05:620a:4305:b0:6a9:3829:c03 with SMTP id
 u5-20020a05620a430500b006a938290c03mr19272968qko.363.1655809968124; Tue, 21
 Jun 2022 04:12:48 -0700 (PDT)
MIME-Version: 1.0
References: <1655802387-15275-1-git-send-email-quic_kalyant@quicinc.com>
 <1655802387-15275-2-git-send-email-quic_kalyant@quicinc.com>
In-Reply-To: <1655802387-15275-2-git-send-email-quic_kalyant@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 21 Jun 2022 14:12:36 +0300
Message-ID: <CAA8EJponMDAXDAZ9zpkYEZvONDAztuXhjwZ6y7rgo1HtQOMtfQ@mail.gmail.com>
Subject: Re: [v1 2/2] drm/msm/disp/dpu1: enable crtc color management based on
 encoder topology
To: Kalyan Thota <quic_kalyant@quicinc.com>
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
Cc: devicetree@vger.kernel.org, quic_abhinavk@quicinc.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org,
 quic_vpolimer@quicinc.com, swboyd@chromium.org,
 freedreno@lists.freedesktop.org, y@qualcomm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Generic comment: y@qualcomm.com address bounces. Please remove it from
the cc list. If you need to send a patch for the internal reasons,
please use Bcc.

On Tue, 21 Jun 2022 at 12:06, Kalyan Thota <quic_kalyant@quicinc.com> wrote:
>
> Crtc color management needs to be registered only for the crtc which has the
> capability to handle it. Since topology decides which encoder will get the
> dspp hw block, tie up the crtc and the encoder together (encoder->possible_crtcs)
>
> Change-Id: If5a0f33547b6f527ca4b8fbb78424b141dbbd711

No change-id's please. This is not the gerrit.

> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  8 ++++++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 20 ++++++++++++++++----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  5 +++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 22 ++++++++++++++++++----
>  5 files changed, 46 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 7763558..2913acb 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1511,7 +1511,7 @@ static const struct drm_crtc_helper_funcs dpu_crtc_helper_funcs = {
>
>  /* initialize crtc */
>  struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
> -                               struct drm_plane *cursor)
> +                               struct drm_plane *cursor, unsigned int enc_mask)
>  {
>         struct drm_crtc *crtc = NULL;
>         struct dpu_crtc *dpu_crtc = NULL;
> @@ -1544,7 +1544,11 @@ struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
>
>         drm_crtc_helper_add(crtc, &dpu_crtc_helper_funcs);
>
> -       drm_crtc_enable_color_mgmt(crtc, 0, true, 0);
> +       /* Register crtc color management if the encoder has dspp, use the
> +        * crtc to mark it as possible_crtcs for that encoder.
> +        */
> +       if(BIT(crtc->index) & enc_mask)

So, we are checking CRTC's index against the encoder's mask? This is
counterintuitive.

> +               drm_crtc_enable_color_mgmt(crtc, 0, true, 0);
>
>         /* save user friendly CRTC name for later */
>         snprintf(dpu_crtc->name, DPU_CRTC_NAME_SIZE, "crtc%u", crtc->base.id);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> index b8785c3..0a6458e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> @@ -269,7 +269,7 @@ void dpu_crtc_complete_commit(struct drm_crtc *crtc);
>   * @Return: new crtc object or error
>   */
>  struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
> -                              struct drm_plane *cursor);
> +                              struct drm_plane *cursor, unsigned int enc_mask);
>
>  /**
>   * dpu_crtc_register_custom_event - api for enabling/disabling crtc event
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index f2cb497..893ce68 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -13,6 +13,8 @@
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_file.h>
>  #include <drm/drm_probe_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_bridge_connector.h>
>
>  #include "msm_drv.h"
>  #include "dpu_kms.h"
> @@ -511,13 +513,18 @@ void dpu_encoder_helper_split_config(
>         }
>  }
>
> -static struct msm_display_topology dpu_encoder_get_topology(
> -                       struct dpu_encoder_virt *dpu_enc,
> +struct msm_display_topology dpu_encoder_get_topology(
> +                       struct drm_encoder *drm_enc,
>                         struct dpu_kms *dpu_kms,
>                         struct drm_display_mode *mode)
>  {
>         struct msm_display_topology topology = {0};
> +       struct dpu_encoder_virt *dpu_enc;
> +       struct drm_bridge *bridge;
>         int i, intf_count = 0;
> +       bool primary_display = false;
> +
> +       dpu_enc = to_dpu_encoder_virt(drm_enc);
>
>         for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
>                 if (dpu_enc->phys_encs[i])
> @@ -542,7 +549,12 @@ static struct msm_display_topology dpu_encoder_get_topology(
>         else
>                 topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
>
> -       if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI) {
> +       drm_for_each_bridge_in_chain(drm_enc, bridge) {
> +               if (bridge->type != DRM_MODE_CONNECTOR_DisplayPort)
> +                       primary_display = true;
> +       }

I must admit, I never actually liked the original (intf_type == DSI)
check. However the new one is even worse. We are checking the whole
bridge chain in an attempt to rule out the DP ports for whatever
reason. What about the HDMI ports? Should they be also frowned upon?
The ugly part is that we are making the decision for the user, which
displays are "primary" for him. Can we let the user make this setting?

> +
> +       if (primary_display) {
>                 if (dpu_kms->catalog->dspp &&
>                         (dpu_kms->catalog->dspp_count >= topology.num_lm))
>                         topology.num_dspp = topology.num_lm;
> @@ -601,7 +613,7 @@ static int dpu_encoder_virt_atomic_check(
>                 }
>         }
>
> -       topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode);
> +       topology = dpu_encoder_get_topology(drm_enc, dpu_kms, adj_mode);

extra whitespace change. Please drop.

>
>         /* Reserve dynamic resources now. */
>         if (!ret) {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index 1f39327..c4daf7c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -172,4 +172,9 @@ int dpu_encoder_get_vsync_count(struct drm_encoder *drm_enc);
>
>  bool dpu_encoder_is_widebus_enabled(const struct drm_encoder *drm_enc);
>
> +struct msm_display_topology dpu_encoder_get_topology(
> +                       struct drm_encoder *drm_enc,
> +                       struct dpu_kms *dpu_kms,
> +                       struct drm_display_mode *mode);
> +
>  #endif /* __DPU_ENCODER_H__ */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 3a4da0d..486ff9d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -687,9 +687,12 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
>         unsigned cursor_idx = 0;
>         unsigned primary_idx = 0;
>         bool pin_overlays;
> +       unsigned int max_dspp_count = 0;
> +       unsigned int enc_mask = 0;
>
>         struct msm_drm_private *priv;
>         struct dpu_mdss_cfg *catalog;
> +       struct msm_display_topology topology = {0};
>
>         int primary_planes_idx = 0, cursor_planes_idx = 0, i, ret;
>         int max_crtc_count;
> @@ -754,10 +757,19 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
>         }
>
>         max_crtc_count = min(max_crtc_count, primary_planes_idx);
> +       max_dspp_count = catalog->dspp_count;
> +
> +       drm_for_each_encoder(encoder, dev) {
> +               topology = dpu_encoder_get_topology(encoder, dpu_kms, NULL);

This can crash dpu_encoder_get_topology() because it checks mode->hdisplay.
And the check anyway is futile here. We do not know if the encoder is
going to use 1 or 2 LMs (since we do not know the resolution), so we
do not know whether it will use 1 or 2 DSPP blocks.

> +               if (topology.num_dspp > 0 && (topology.num_dspp <= max_dspp_count)) {
> +                       enc_mask |= BIT(encoder->index);
> +                       max_dspp_count -= topology.num_dspp;
> +               }
> +       }
>
>         /* Create one CRTC per encoder */
>         for (i = 0; i < max_crtc_count; i++) {
> -               crtc = dpu_crtc_init(dev, primary_planes[i], cursor_planes[i]);
> +               crtc = dpu_crtc_init(dev, primary_planes[i], cursor_planes[i], enc_mask);
>                 if (IS_ERR(crtc)) {
>                         ret = PTR_ERR(crtc);
>                         return ret;
> @@ -765,9 +777,11 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
>                 priv->crtcs[priv->num_crtcs++] = crtc;
>         }
>
> -       /* All CRTCs are compatible with all encoders */
> -       drm_for_each_encoder(encoder, dev)
> -               encoder->possible_crtcs = (1 << priv->num_crtcs) - 1;
> +       /* Attach CRTC's to compatiable encoders */

compatible


> +       drm_for_each_encoder(encoder, dev) {
> +               encoder->possible_crtcs = (enc_mask & BIT(encoder->index)) ?
> +                               BIT(encoder->index) : (((1 << priv->num_crtcs) - 1) & ~enc_mask);
> +       }
>
>         return 0;
>  }
> --
> 2.7.4
>


--
With best wishes
Dmitry
