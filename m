Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB382D455A
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 16:27:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF0576EA88;
	Wed,  9 Dec 2020 15:27:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C8AC6EA88
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 15:27:22 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id v14so1841200wml.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Dec 2020 07:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8YKGRMKK2McKFcXrIeBXH3472GkQhKi8F4t+WmHUBII=;
 b=h13WGmAjOaUAj+xFaoOTT3ojhiBDz+UYFGrIkTrdltIeKDJT0qMaASR8LbdQbKk5PF
 VCibmzqELx7rvgTxIntJnUEQopyZZSXRHXND1NnQutWUfRcM1h1rU+rh+AUYn2FqCjMS
 a+bpdSrNidxIyIC7+Fbed5OF0pJTObqatniogUwIqqjC9cyuvGAYulOBLdfXcKajxikh
 v61hRA/rtP7xQ7gSiOFEUGii7C7LGdkK8QJBRLM7JACCHGPYODNBC0qql7g/Dn1nfabm
 tKF3jnlmxuu53G/vPt1k4aFP5FeMVeshAiZSSy5ezW3qoEpQJqxoDlgFRv735NJprVQw
 jVfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8YKGRMKK2McKFcXrIeBXH3472GkQhKi8F4t+WmHUBII=;
 b=Zh5URkdjG/EhPmklu7lHu+FXmoE78yJqCya2yuhUO6/MgJmAucW3wNMwtrgBF/Y1QT
 Xa3U3EIsfU906etHu14buVpkcZPch9+l61QyWVwAuxRWKLDtdiSj57gj1NmPLMTHsCpG
 DfYSTI4A8hSGnZankzlUU5Bo6G4jb4bZnaabigaL41lqbaiu1gW2WCm4ppyWUGE3UXD4
 f8f6zdRO7maod3vsyTXCLwyTxw5xbHjcJdLdivvjJNeAA3NJ0cFwC4/N8wuNTOazttNl
 DhAOE2AWx/YXnYKqcxigP8am2rAQEdRhMj5jjSzvokzKh/VC9YwWlTvq0JYzDp0gLT2L
 1k2w==
X-Gm-Message-State: AOAM531CzDrP00uQMlRAsXFgzu/y5T70B9Ql90r9MBA3Jb9zogRJQNh0
 5LMybFdr97buT6CQAO950n5+4GX/wziOGKIgGGRicT6Wzsc=
X-Google-Smtp-Source: ABdhPJzdB/r9P2RMsLXNA/4Pi8Bm9M5R263ftr2hRmBokz4b9n8KE9y6phypugI/aVlSVKiliYPSk/Dv3YJG5iVx5u4=
X-Received: by 2002:a1c:5447:: with SMTP id p7mr3355942wmi.116.1607527640717; 
 Wed, 09 Dec 2020 07:27:20 -0800 (PST)
MIME-Version: 1.0
References: <20201207155719.17149-1-maxime@cerno.tech>
 <20201207155719.17149-10-maxime@cerno.tech>
In-Reply-To: <20201207155719.17149-10-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 9 Dec 2020 15:27:05 +0000
Message-ID: <CAPY8ntC=7WC7kfJw2KOEBv+SwTrZxgvKbpXM5RsK4FMS03K2jQ@mail.gmail.com>
Subject: Re: [PATCH v5 9/9] drm/vc4: hdmi: Enable 10/12 bpc output
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

On Mon, 7 Dec 2020 at 15:57, Maxime Ripard <maxime@cerno.tech> wrote:
>
> The BCM2711 supports higher bpc count than just 8, so let's support it in
> our driver.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c      | 71 ++++++++++++++++++++++++++++-
>  drivers/gpu/drm/vc4/vc4_hdmi.h      |  1 +
>  drivers/gpu/drm/vc4/vc4_hdmi_regs.h |  9 ++++
>  3 files changed, 80 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index f4ff6b5db484..fb30ddd842b1 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -76,6 +76,17 @@
>  #define VC5_HDMI_VERTB_VSPO_SHIFT              16
>  #define VC5_HDMI_VERTB_VSPO_MASK               VC4_MASK(29, 16)
>
> +#define VC5_HDMI_DEEP_COLOR_CONFIG_1_INIT_PACK_PHASE_SHIFT     8
> +#define VC5_HDMI_DEEP_COLOR_CONFIG_1_INIT_PACK_PHASE_MASK      VC4_MASK(10, 8)
> +
> +#define VC5_HDMI_DEEP_COLOR_CONFIG_1_COLOR_DEPTH_SHIFT         0
> +#define VC5_HDMI_DEEP_COLOR_CONFIG_1_COLOR_DEPTH_MASK          VC4_MASK(3, 0)
> +
> +#define VC5_HDMI_GCP_CONFIG_GCP_ENABLE         BIT(31)
> +
> +#define VC5_HDMI_GCP_WORD_1_GCP_SUBPACKET_BYTE_1_SHIFT 8
> +#define VC5_HDMI_GCP_WORD_1_GCP_SUBPACKET_BYTE_1_MASK  VC4_MASK(15, 8)
> +
>  # define VC4_HD_M_SW_RST                       BIT(2)
>  # define VC4_HD_M_ENABLE                       BIT(0)
>
> @@ -179,6 +190,9 @@ static void vc4_hdmi_connector_reset(struct drm_connector *connector)
>
>         kfree(connector->state);
>
> +       conn_state->base.max_bpc = 8;
> +       conn_state->base.max_requested_bpc = 8;
> +

Having added protection from the kzalloc failing in 4/9, this adds
back in dereferencing conn_state without having checked it succeeded
first :(

Otherwise this looks fine.

  Dave

>         __drm_atomic_helper_connector_reset(connector, &conn_state->base);
>
>         if (connector->state)
> @@ -228,12 +242,20 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
>                                     vc4_hdmi->ddc);
>         drm_connector_helper_add(connector, &vc4_hdmi_connector_helper_funcs);
>
> +       /*
> +        * Some of the properties below require access to state, like bpc.
> +        * Allocate some default initial connector state with our reset helper.
> +        */
> +       if (connector->funcs->reset)
> +               connector->funcs->reset(connector);
> +
>         /* Create and attach TV margin props to this connector. */
>         ret = drm_mode_create_tv_margin_properties(dev);
>         if (ret)
>                 return ret;
>
>         drm_connector_attach_tv_margin_properties(connector);
> +       drm_connector_attach_max_bpc_property(connector, 8, 12);
>
>         connector->polled = (DRM_CONNECTOR_POLL_CONNECT |
>                              DRM_CONNECTOR_POLL_DISCONNECT);
> @@ -499,6 +521,7 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi, bool enable)
>  }
>
>  static void vc4_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
> +                                struct drm_connector_state *state,
>                                  struct drm_display_mode *mode)
>  {
>         bool hsync_pos = mode->flags & DRM_MODE_FLAG_PHSYNC;
> @@ -542,7 +565,9 @@ static void vc4_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
>         HDMI_WRITE(HDMI_VERTB0, vertb_even);
>         HDMI_WRITE(HDMI_VERTB1, vertb);
>  }
> +
>  static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
> +                                struct drm_connector_state *state,
>                                  struct drm_display_mode *mode)
>  {
>         bool hsync_pos = mode->flags & DRM_MODE_FLAG_PHSYNC;
> @@ -562,6 +587,9 @@ static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
>                                         mode->crtc_vsync_end -
>                                         interlaced,
>                                         VC4_HDMI_VERTB_VBP));
> +       unsigned char gcp;
> +       bool gcp_en;
> +       u32 reg;
>
>         HDMI_WRITE(HDMI_VEC_INTERFACE_XBAR, 0x354021);
>         HDMI_WRITE(HDMI_HORZA,
> @@ -587,6 +615,39 @@ static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
>         HDMI_WRITE(HDMI_VERTB0, vertb_even);
>         HDMI_WRITE(HDMI_VERTB1, vertb);
>
> +       switch (state->max_bpc) {
> +       case 12:
> +               gcp = 6;
> +               gcp_en = true;
> +               break;
> +       case 10:
> +               gcp = 5;
> +               gcp_en = true;
> +               break;
> +       case 8:
> +       default:
> +               gcp = 4;
> +               gcp_en = false;
> +               break;
> +       }
> +
> +       reg = HDMI_READ(HDMI_DEEP_COLOR_CONFIG_1);
> +       reg &= ~(VC5_HDMI_DEEP_COLOR_CONFIG_1_INIT_PACK_PHASE_MASK |
> +                VC5_HDMI_DEEP_COLOR_CONFIG_1_COLOR_DEPTH_MASK);
> +       reg |= VC4_SET_FIELD(2, VC5_HDMI_DEEP_COLOR_CONFIG_1_INIT_PACK_PHASE) |
> +              VC4_SET_FIELD(gcp, VC5_HDMI_DEEP_COLOR_CONFIG_1_COLOR_DEPTH);
> +       HDMI_WRITE(HDMI_DEEP_COLOR_CONFIG_1, reg);
> +
> +       reg = HDMI_READ(HDMI_GCP_WORD_1);
> +       reg &= ~VC5_HDMI_GCP_WORD_1_GCP_SUBPACKET_BYTE_1_MASK;
> +       reg |= VC4_SET_FIELD(gcp, VC5_HDMI_GCP_WORD_1_GCP_SUBPACKET_BYTE_1);
> +       HDMI_WRITE(HDMI_GCP_WORD_1, reg);
> +
> +       reg = HDMI_READ(HDMI_GCP_CONFIG);
> +       reg &= ~VC5_HDMI_GCP_CONFIG_GCP_ENABLE;
> +       reg |= gcp_en ? VC5_HDMI_GCP_CONFIG_GCP_ENABLE : 0;
> +       HDMI_WRITE(HDMI_GCP_CONFIG, reg);
> +
>         HDMI_WRITE(HDMI_CLOCK_STOP, 0);
>  }
>
> @@ -724,7 +785,7 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
>                    VC4_HDMI_SCHEDULER_CONTROL_IGNORE_VSYNC_PREDICTS);
>
>         if (vc4_hdmi->variant->set_timings)
> -               vc4_hdmi->variant->set_timings(vc4_hdmi, mode);
> +               vc4_hdmi->variant->set_timings(vc4_hdmi, conn_state, mode);
>  }
>
>  static void vc4_hdmi_encoder_pre_crtc_enable(struct drm_encoder *encoder,
> @@ -845,6 +906,14 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
>                 pixel_rate = mode->clock * 1000;
>         }
>
> +       if (conn_state->max_bpc == 12) {
> +               pixel_rate = pixel_rate * 150;
> +               do_div(pixel_rate, 100);
> +       } else if (conn_state->max_bpc == 10) {
> +               pixel_rate = pixel_rate * 125;
> +               do_div(pixel_rate, 100);
> +       }
> +
>         if (mode->flags & DRM_MODE_FLAG_DBLCLK)
>                 pixel_rate = pixel_rate * 2;
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
> index 60c53d7c9bad..4c8994cfd932 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> @@ -77,6 +77,7 @@ struct vc4_hdmi_variant {
>
>         /* Callback to configure the video timings in the HDMI block */
>         void (*set_timings)(struct vc4_hdmi *vc4_hdmi,
> +                           struct drm_connector_state *state,
>                             struct drm_display_mode *mode);
>
>         /* Callback to initialize the PHY according to the connector state */
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi_regs.h b/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
> index 7c6b4818f245..013fd57febd8 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
> @@ -59,9 +59,12 @@ enum vc4_hdmi_field {
>          */
>         HDMI_CTS_0,
>         HDMI_CTS_1,
> +       HDMI_DEEP_COLOR_CONFIG_1,
>         HDMI_DVP_CTL,
>         HDMI_FIFO_CTL,
>         HDMI_FRAME_COUNT,
> +       HDMI_GCP_CONFIG,
> +       HDMI_GCP_WORD_1,
>         HDMI_HORZA,
>         HDMI_HORZB,
>         HDMI_HOTPLUG,
> @@ -229,6 +232,9 @@ static const struct vc4_hdmi_register vc5_hdmi_hdmi0_fields[] = {
>         VC4_HDMI_REG(HDMI_VERTB1, 0x0f8),
>         VC4_HDMI_REG(HDMI_MAI_CHANNEL_MAP, 0x09c),
>         VC4_HDMI_REG(HDMI_MAI_CONFIG, 0x0a0),
> +       VC4_HDMI_REG(HDMI_DEEP_COLOR_CONFIG_1, 0x170),
> +       VC4_HDMI_REG(HDMI_GCP_CONFIG, 0x178),
> +       VC4_HDMI_REG(HDMI_GCP_WORD_1, 0x17c),
>         VC4_HDMI_REG(HDMI_HOTPLUG, 0x1a8),
>
>         VC5_DVP_REG(HDMI_CLOCK_STOP, 0x0bc),
> @@ -305,6 +311,9 @@ static const struct vc4_hdmi_register vc5_hdmi_hdmi1_fields[] = {
>         VC4_HDMI_REG(HDMI_VERTB1, 0x0f8),
>         VC4_HDMI_REG(HDMI_MAI_CHANNEL_MAP, 0x09c),
>         VC4_HDMI_REG(HDMI_MAI_CONFIG, 0x0a0),
> +       VC4_HDMI_REG(HDMI_DEEP_COLOR_CONFIG_1, 0x170),
> +       VC4_HDMI_REG(HDMI_GCP_CONFIG, 0x178),
> +       VC4_HDMI_REG(HDMI_GCP_WORD_1, 0x17c),
>         VC4_HDMI_REG(HDMI_HOTPLUG, 0x1a8),
>
>         VC5_DVP_REG(HDMI_CLOCK_STOP, 0x0bc),
> --
> 2.28.0
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
