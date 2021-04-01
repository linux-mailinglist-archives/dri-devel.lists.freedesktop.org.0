Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD7635147C
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 13:31:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 840B56EC8C;
	Thu,  1 Apr 2021 11:31:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 156ED6EC8C
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Apr 2021 11:31:02 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id j9so1451113wrx.12
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Apr 2021 04:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RmCUCVmHXhAEWZpHKHZIBm85gA/CG8GyRdXnCPUjzCo=;
 b=jGyazi7HIUtCn2W+DJ7503kmaq4h7HBjWPn35RYKVX6ggzCh7J0kvnB7DUPCFKp+Q/
 yqgDoacsnkFMCLj66dgRPkBrNaryzBuQnEHMFe+F0fXiolCmzyZKsjb4WKCuC9ceyun7
 zUTSCD6t6oMzJcQ+LWKRmj/T50/zLu5nKr8Fb8mOIZy31ZHGwID+Dz005B0tNFFkMlhu
 AWvutWwxgXsjHoXdRYlbq1AniGwTLEPTyjF7Cn1jmSvqbM0Q8acsRgUqHpTekL3Yc2Bf
 ex/h4WYLXrzk2QZQ+jA2MHSiFIkJYiO5BROLQCJCCtGZcEf/OmbWA1fIg1AprKvMR6Uv
 216w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RmCUCVmHXhAEWZpHKHZIBm85gA/CG8GyRdXnCPUjzCo=;
 b=FYCuo+R5oKQcNi/CCZuM3SMH++rX/+HbF4Vn1CIuq3l96AbiM+gIhqEMTW2uGYyREu
 vbTGUdEeZDActEg0/of27YGk8i7ezbkMz2t/yrsfV2obHi2yqB6yafeagEA8pyU/V3Du
 +KIa+HC9+EbVr7tbxuTdg6WNgC/J12H4Xkd1w4O7i/JaU4IamhOMs0yZF0ZCgL6e8gpJ
 WyPGcd92cH+aL4SMJanZu3WPzXIQ0OuS3wbg4mpYgLh273ldGW6JWF8PBUjSjg/6xXVw
 aaxnHr9M3O2kpM7XVF8d14HvAUxmVn/qrzPocm5Q0VtmyTk36fufyjReIp3BUP1Hs9/6
 bkvw==
X-Gm-Message-State: AOAM533E097JBqaT+bE83wK+IT7C7inoB0/56jnVZrds9Ba533ODwFvv
 qewYTcNOsHCLkT/zAFj/ZQFOoVlju6HTlMr2wc8OkQ==
X-Google-Smtp-Source: ABdhPJw5/vEcXCvt9DbgUyCBrwSD/gxNm+TrQO77R8+8xMUB5KFNm0+SR1gtYxNU6chJsxEu/w978jegdfu12vDR/nE=
X-Received: by 2002:adf:d1cd:: with SMTP id b13mr9059823wrd.47.1617276660673; 
 Thu, 01 Apr 2021 04:31:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210318092917.831995-1-maxime@cerno.tech>
 <20210318092917.831995-5-maxime@cerno.tech>
In-Reply-To: <20210318092917.831995-5-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 1 Apr 2021 12:30:45 +0100
Message-ID: <CAPY8ntBNr6kTRJkaMNmZ+Z9St9oZ=M9qEAKovtKrCCB=wzBZLw@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] drm/vc4: hdmi: Enable the scrambler
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
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

On Thu, 18 Mar 2021 at 09:29, Maxime Ripard <maxime@cerno.tech> wrote:
>
> The HDMI controller on the BCM2711 includes a scrambler in order to
> reach the modes that require it. Let's add the support for it.

Nit pick - it's as part of the HDMI2.0 spec.

> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c      | 56 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/vc4/vc4_hdmi_regs.h |  3 ++
>  2 files changed, 59 insertions(+)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 0924a1b9e186..530c83097b1a 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -35,6 +35,7 @@
>  #include <drm/drm_edid.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_simple_kms_helper.h>
> +#include <drm/drm_scdc_helper.h>
>  #include <linux/clk.h>
>  #include <linux/component.h>
>  #include <linux/i2c.h>
> @@ -76,6 +77,8 @@
>  #define VC5_HDMI_VERTB_VSPO_SHIFT              16
>  #define VC5_HDMI_VERTB_VSPO_MASK               VC4_MASK(29, 16)
>
> +#define VC5_HDMI_SCRAMBLER_CTL_ENABLE          BIT(0)
> +
>  #define VC5_HDMI_DEEP_COLOR_CONFIG_1_INIT_PACK_PHASE_SHIFT     8
>  #define VC5_HDMI_DEEP_COLOR_CONFIG_1_INIT_PACK_PHASE_MASK      VC4_MASK(10, 8)
>
> @@ -457,6 +460,56 @@ static void vc4_hdmi_set_infoframes(struct drm_encoder *encoder)
>                 vc4_hdmi_set_audio_infoframe(encoder);
>  }
>
> +static bool vc4_hdmi_supports_scrambling(struct drm_encoder *encoder,
> +                                        struct drm_display_mode *mode)
> +{
> +       struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
> +       struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
> +       struct drm_display_info *display = &vc4_hdmi->connector.display_info;
> +
> +       if (!vc4_encoder->hdmi_monitor)
> +               return false;
> +
> +       if (!display->hdmi.scdc.supported ||
> +           !display->hdmi.scdc.scrambling.supported)
> +               return false;
> +

I think I made this comment last time, but possibly not very clearly.

Up to this point in the function is whether the display/hdmi interface
*supports* scrambling. The bit after is whether it is *required* to be
enabled by the mode.

At the moment, if the display/interface supports scrambling but the
mode doesn't need it, then the scrambling setup is never touched. That
makes a few assumptions about the default settings.
Boot with the firmware selecting 4k60 (ie scrambling on), but
video=HDMI-1:1920x1080 in the kernel command line and you'll have a
mess with scrambling enabled but not signalled.

I'd be happier if the display/interface says scrambling is supported
then we always call drm_scdc_set_high_tmds_clock_ratio,
drm_scdc_set_scrambling and set the VC5_HDMI_SCRAMBLER_CTL_ENABLE
register bit appropriately for the mode. Feel free to disagree with me
though.

  Dave

> +       if ((mode->clock * 1000) < HDMI_14_MAX_TMDS_CLK)
> +               return false;
> +
> +       return true;
> +}
> +
> +static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
> +{
> +       struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
> +       struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
> +
> +       if (!vc4_hdmi_supports_scrambling(encoder, mode))
> +               return;
> +
> +       drm_scdc_set_high_tmds_clock_ratio(vc4_hdmi->ddc, true);
> +       drm_scdc_set_scrambling(vc4_hdmi->ddc, true);
> +
> +       HDMI_WRITE(HDMI_SCRAMBLER_CTL, HDMI_READ(HDMI_SCRAMBLER_CTL) |
> +                  VC5_HDMI_SCRAMBLER_CTL_ENABLE);
> +}
> +
> +static void vc4_hdmi_disable_scrambling(struct drm_encoder *encoder)
> +{
> +       struct drm_display_mode *mode = &encoder->crtc->mode;
> +       struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
> +
> +       if (!vc4_hdmi_supports_scrambling(encoder, mode))
> +               return;
> +
> +       HDMI_WRITE(HDMI_SCRAMBLER_CTL, HDMI_READ(HDMI_SCRAMBLER_CTL) &
> +                  ~VC5_HDMI_SCRAMBLER_CTL_ENABLE);
> +
> +       drm_scdc_set_scrambling(vc4_hdmi->ddc, false);
> +       drm_scdc_set_high_tmds_clock_ratio(vc4_hdmi->ddc, false);
> +}
> +
>  static void vc4_hdmi_encoder_post_crtc_disable(struct drm_encoder *encoder,
>                                                struct drm_atomic_state *state)
>  {
> @@ -469,6 +522,8 @@ static void vc4_hdmi_encoder_post_crtc_disable(struct drm_encoder *encoder,
>
>         HDMI_WRITE(HDMI_VID_CTL,
>                    HDMI_READ(HDMI_VID_CTL) | VC4_HD_VID_CTL_BLANKPIX);
> +
> +       vc4_hdmi_disable_scrambling(encoder);
>  }
>
>  static void vc4_hdmi_encoder_post_crtc_powerdown(struct drm_encoder *encoder,
> @@ -919,6 +974,7 @@ static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
>         }
>
>         vc4_hdmi_recenter_fifo(vc4_hdmi);
> +       vc4_hdmi_enable_scrambling(encoder);
>  }
>
>  static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi_regs.h b/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
> index e1b58eac766f..19d2fdc446bc 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
> @@ -100,6 +100,7 @@ enum vc4_hdmi_field {
>         HDMI_RM_FORMAT,
>         HDMI_RM_OFFSET,
>         HDMI_SCHEDULER_CONTROL,
> +       HDMI_SCRAMBLER_CTL,
>         HDMI_SW_RESET_CONTROL,
>         HDMI_TX_PHY_CHANNEL_SWAP,
>         HDMI_TX_PHY_CLK_DIV,
> @@ -238,6 +239,7 @@ static const struct vc4_hdmi_register __maybe_unused vc5_hdmi_hdmi0_fields[] = {
>         VC4_HDMI_REG(HDMI_GCP_CONFIG, 0x178),
>         VC4_HDMI_REG(HDMI_GCP_WORD_1, 0x17c),
>         VC4_HDMI_REG(HDMI_HOTPLUG, 0x1a8),
> +       VC4_HDMI_REG(HDMI_SCRAMBLER_CTL, 0x1c4),
>
>         VC5_DVP_REG(HDMI_CLOCK_STOP, 0x0bc),
>         VC5_DVP_REG(HDMI_VEC_INTERFACE_XBAR, 0x0f0),
> @@ -317,6 +319,7 @@ static const struct vc4_hdmi_register __maybe_unused vc5_hdmi_hdmi1_fields[] = {
>         VC4_HDMI_REG(HDMI_GCP_CONFIG, 0x178),
>         VC4_HDMI_REG(HDMI_GCP_WORD_1, 0x17c),
>         VC4_HDMI_REG(HDMI_HOTPLUG, 0x1a8),
> +       VC4_HDMI_REG(HDMI_SCRAMBLER_CTL, 0x1c4),
>
>         VC5_DVP_REG(HDMI_CLOCK_STOP, 0x0bc),
>         VC5_DVP_REG(HDMI_VEC_INTERFACE_XBAR, 0x0f0),
> --
> 2.30.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
