Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB8F28EF72
	for <lists+dri-devel@lfdr.de>; Thu, 15 Oct 2020 11:37:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9303E6E14B;
	Thu, 15 Oct 2020 09:37:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40F356E14B
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 09:37:40 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id n6so2538232wrm.13
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 02:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MfUDcha60eIFDJDSHjI0zpIOWj0FJFEHJQok+Qji5Dg=;
 b=DZ4PXeYSd3InCx4aHAIIpxvkoVV/TJEIv0RUQDwsCjGg9rSS27/X9yeJtgoRd37Wyt
 5ehSMtH5L6YcoXrck0TdBdQrl4UBuNA6rDq1R9FxVcLtPu1VIs2S8wKjS8trP8/WMUL9
 n3l2CQlJljnLrqfKz/rIU2zn3czaohLhXkrJluWyyfV5+18t+R0iONpKsuNUPT4z9iwT
 MTe6fbRNhC3KVRE6IgST2dZyzhzwq1RiiRwo9JkRHO2KQvF4gFz9amjALWpOMw75KDBe
 dXF1YSr8m6hdKLbdoJI3NWPLIYVrEHxrVvojypDAXRgWJYtMzs+kO63LQXeaWmEtAxTj
 Alaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MfUDcha60eIFDJDSHjI0zpIOWj0FJFEHJQok+Qji5Dg=;
 b=nbbC1Nn6GamsrQGarX8sv/tNVy/VFraCGyvVwCliCPerbQhgrJbrex6ys86eN3E+k/
 crvTgghn3Wt2O+jqHpK5effiP/8LoLMIVM8zUiPSseY459tuNbvd/EN8aE01KJtitYaD
 vw6uCAOW3o3kM5l+rsxSfhyensk3LE8IRfh/xc0cZCrYkI4i0/XqLnq4Hpq4BvaL+Q3M
 x5/47ibFBZPho1zkoGJMOPJ43hyuvtvn0NkLipG9odFDbLtoijP3jurJ0ocOmcDTtY7s
 J8ARbZrrOhpoh3bF+a1WitFjCeDhiNkPbIskHx1oeFaxJXi/LgCQU1bCWU1l9ZGciFDW
 H2Fw==
X-Gm-Message-State: AOAM532yNp2Urh5iGGAGFATUArf3WSaBSx+7h15UVf215alJ1SyfLC8w
 AYt5oHtXHYP0m22wb/yBnfQoamDcU0c7YhezJeULAQ==
X-Google-Smtp-Source: ABdhPJxINXoMrGb1pvEywokJi7f2T7i8IxvutrG0K0Je79x/XhIG1ia7UpNz7PTzrArFq+WktL5/NKFfTgHQRMvS5jk=
X-Received: by 2002:adf:9504:: with SMTP id 4mr3393592wrs.27.1602754658791;
 Thu, 15 Oct 2020 02:37:38 -0700 (PDT)
MIME-Version: 1.0
References: <cover.647a5105d069cdcf8545555d1c381c233675a289.1602161031.git-series.maxime@cerno.tech>
 <43857fd388caa9e48aa85061344bbef27cb238fd.1602161031.git-series.maxime@cerno.tech>
In-Reply-To: <43857fd388caa9e48aa85061344bbef27cb238fd.1602161031.git-series.maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 15 Oct 2020 10:37:22 +0100
Message-ID: <CAPY8ntAtPsApKg78r561paueravUc+c3no7WiwmM4jz9xRJKPQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] drm/vc4: hdmi: Enable 10/12 bpc output
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
Cc: Tim Gover <tim.gover@raspberrypi.com>, David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

On Thu, 8 Oct 2020 at 13:44, Maxime Ripard <maxime@cerno.tech> wrote:
>
> The BCM2711 supports higher bpc count than just 8, so let's support it in
> our driver.

Something appears to be slightly off with this one. Running the
monitor (Dell U2718Q 4k monitor) at 1080p60.

Use modetest to switch "max bpc" to 10bpc, and the monitor reports 1080p48.
Use modetest to switch "max bpc" to 12bpc, and the monitor reports 1080p40.
I haven't got an HDMI analyser to hand to confirm whether we're
actually putting out 10 or 12bpc.

So at a guess a clock is unaltered, but the number of bits being sent
over the link is increased, thereby dropping the overall frame rate.
Having tested with the firmware it only points to my monitor not
supporting alternate bpc values - not so helpful.

I'm not sure the handling of the GCP is correct either. It is
enabled/disabled via bit 0 of HDMI_RAM_PACKET_CONFIG in the same way
all the infoframes are.
The firmware enables/disables sending the GCP when handling avmute,
but this driver isn't handling avmute so it never gets enabled

I'll have a further experiment to see if I can make things play ball.
I'll need to collect the analyser and deep colour display to really
try it out.

  Dave

> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c      | 68 +++++++++++++++++++++++++++++-
>  drivers/gpu/drm/vc4/vc4_hdmi.h      |  1 +-
>  drivers/gpu/drm/vc4/vc4_hdmi_regs.h |  9 ++++-
>  3 files changed, 77 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 21d20c8494e8..3ff72fab4c40 100644
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
> @@ -177,6 +188,9 @@ static void vc4_hdmi_connector_reset(struct drm_connector *connector)
>
>         kfree(connector->state);
>
> +       conn_state->base.max_bpc = 8;
> +       conn_state->base.max_requested_bpc = 8;
> +
>         __drm_atomic_helper_connector_reset(connector, &conn_state->base);
>         drm_atomic_helper_connector_tv_reset(connector);
>  }
> @@ -224,12 +238,20 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
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
> +       drm_connector_attach_max_bpc_property(connector, 8, 16);
>
>         connector->polled = (DRM_CONNECTOR_POLL_CONNECT |
>                              DRM_CONNECTOR_POLL_DISCONNECT);
> @@ -495,6 +517,7 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi, bool enable)
>  }
>
>  static void vc4_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
> +                                struct drm_connector_state *state,
>                                  struct drm_display_mode *mode)
>  {
>         bool hsync_pos = mode->flags & DRM_MODE_FLAG_PHSYNC;
> @@ -538,7 +561,9 @@ static void vc4_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
>         HDMI_WRITE(HDMI_VERTB0, vertb_even);
>         HDMI_WRITE(HDMI_VERTB1, vertb);
>  }
> +
>  static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
> +                                struct drm_connector_state *state,
>                                  struct drm_display_mode *mode)
>  {
>         bool hsync_pos = mode->flags & DRM_MODE_FLAG_PHSYNC;
> @@ -558,6 +583,9 @@ static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
>                                         mode->crtc_vsync_end -
>                                         interlaced,
>                                         VC4_HDMI_VERTB_VBP));
> +       unsigned char gcp;
> +       bool gcp_en;
> +       u32 reg;
>
>         HDMI_WRITE(HDMI_VEC_INTERFACE_XBAR, 0x354021);
>         HDMI_WRITE(HDMI_HORZA,
> @@ -583,6 +611,39 @@ static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
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
> @@ -720,7 +781,7 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
>                    VC4_HDMI_SCHEDULER_CONTROL_IGNORE_VSYNC_PREDICTS);
>
>         if (vc4_hdmi->variant->set_timings)
> -               vc4_hdmi->variant->set_timings(vc4_hdmi, mode);
> +               vc4_hdmi->variant->set_timings(vc4_hdmi, conn_state, mode);
>  }
>
>  static void vc4_hdmi_encoder_pre_crtc_enable(struct drm_encoder *encoder,
> @@ -821,6 +882,11 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
>         if (mode->flags & DRM_MODE_FLAG_DBLCLK)
>                 pixel_rate *= 2;
>
> +       if (conn_state->max_bpc == 12)
> +               pixel_rate = pixel_rate * 150 / 100;
> +       else if (conn_state->max_bpc == 10)
> +               pixel_rate = pixel_rate * 125 / 100;
> +
>         if (pixel_rate > vc4_hdmi->variant->max_pixel_clock)
>                 return -EINVAL;
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
> index dbe2393ae043..af45b0d81dec 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> @@ -75,6 +75,7 @@ struct vc4_hdmi_variant {
>
>         /* Callback to configure the video timings in the HDMI block */
>         void (*set_timings)(struct vc4_hdmi *vc4_hdmi,
> +                           struct drm_connector_state *state,
>                             struct drm_display_mode *mode);
>
>         /* Callback to initialize the PHY according to the mode */
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
> git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
