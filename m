Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E828230AD5
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 15:01:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A8E96E1F2;
	Tue, 28 Jul 2020 13:01:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6497E6E1F2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 13:01:02 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id g8so6072835wmk.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 06:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8jmZcLNhJMqYMjcTqjPQmtQ8P0Msg4xOuIQgfa8zC1w=;
 b=Hx12KSYmyNspQ20MnI262XHd/ggVHzu3cALqhn4ACAVTDUceBouCvxfbBeDW9WyLHB
 HJhl2sQ2aEpl1gXV5mh4s4iM8Tlck07exfeOsFa1bYBjLRGPJEmDme8aC1S+H3jmMTqn
 KAF4/T+Rhoa23qTWOgY6Vrx0O78QbgbXqsG0/cUbN4tzO6FoLWE/G63gDdfjUU+whmR3
 C02+0s1IUMuMrDgM8pzbOYYCemwrfdnoTTlf3fJG+nxMpMvdNr/gvgcQqXaLwrQDGM5g
 dV8Z9eP6LUJWO/08CXBVh2goLZ7fjkwO2HRrNwSKxAgG0FOR50Rz95mjiSsDFJUBQqln
 kr1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8jmZcLNhJMqYMjcTqjPQmtQ8P0Msg4xOuIQgfa8zC1w=;
 b=ES5EYUIZf5XnFKvkXStSkey4MzMGTUWEp9vBqKE7Ink1ewYPf76iMfAiMExsuePoCc
 +TzzyjfKm+LoUjySHvnJl28GWE8FyU463FTvSlX4+KHHV9tDUdRsaFdc5b2HTn/vwGbN
 Oq1Qe1a1YzbMIgjYyzP3uHoU36PCEA//FCiSCmFDz7IrzNeBb1DdGibeo8aigEHWNM3y
 6bZGO+ucP6qg/2MdgPBm5yWpO8Fujs886aLzOP+5b/m7/6/Cq1EfvcgIpl+S4LOQqalk
 cffleNYbv+GyqRHle2C6KBYX+4Ybarva6NkyYyd83L33EhX9jxHteBOhA//0shei46vn
 +49Q==
X-Gm-Message-State: AOAM530QqSGwDpWegj3OMvZCc8NMPv2OnotzhZpOaNyFrFSF2LCkOo0i
 Qj8F5z2sxWdkFopCgID3gGIwJsJdC0Zmnp/oPgaKeg==
X-Google-Smtp-Source: ABdhPJzNJGXoMkeyB78SIo1q7nH5otCVlzH/fPUf3ev2WPGKtmu6lqowrHi4IrqPinZ5+zG7noCHHP+YZrqMMkPK5N0=
X-Received: by 2002:a05:600c:d7:: with SMTP id
 u23mr3688799wmm.183.1595941261046; 
 Tue, 28 Jul 2020 06:01:01 -0700 (PDT)
MIME-Version: 1.0
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
 <ab00cc4655224f26d74c307a410bbca8d67dbbbb.1594230107.git-series.maxime@cerno.tech>
In-Reply-To: <ab00cc4655224f26d74c307a410bbca8d67dbbbb.1594230107.git-series.maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 28 Jul 2020 14:00:42 +0100
Message-ID: <CAPY8ntAduOMFgDSkekX5mXDYbQpG_eu-CGtUBRjxAofbWJi--Q@mail.gmail.com>
Subject: Re: [PATCH v4 52/78] drm/vc4: hdmi: Add reset callback
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
Cc: Tim Gover <tim.gover@raspberrypi.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

On Wed, 8 Jul 2020 at 18:43, Maxime Ripard <maxime@cerno.tech> wrote:
>
> The BCM2711 and BCM283x HDMI controllers use a slightly different reset
> sequence, so let's add a callback to reset the controller.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 31 ++++++++++++++++++-------------
>  drivers/gpu/drm/vc4/vc4_hdmi.h |  3 +++
>  2 files changed, 21 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index a4fed1439bf3..80bc3dd9d4a8 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -69,6 +69,21 @@ static int vc4_hdmi_debugfs_regs(struct seq_file *m, void *unused)
>         return 0;
>  }
>
> +static void vc4_hdmi_reset(struct vc4_hdmi *vc4_hdmi)
> +{
> +       HDMI_WRITE(HDMI_M_CTL, VC4_HD_M_SW_RST);
> +       udelay(1);
> +       HDMI_WRITE(HDMI_M_CTL, 0);
> +
> +       HDMI_WRITE(HDMI_M_CTL, VC4_HD_M_ENABLE);
> +
> +       HDMI_WRITE(HDMI_SW_RESET_CONTROL,
> +                  VC4_HDMI_SW_RESET_HDMI |
> +                  VC4_HDMI_SW_RESET_FORMAT_DETECT);
> +
> +       HDMI_WRITE(HDMI_SW_RESET_CONTROL, 0);
> +}
> +
>  static enum drm_connector_status
>  vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
>  {
> @@ -363,11 +378,8 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
>                 return;
>         }
>
> -       HDMI_WRITE(HDMI_SW_RESET_CONTROL,
> -                  VC4_HDMI_SW_RESET_HDMI |
> -                  VC4_HDMI_SW_RESET_FORMAT_DETECT);
> -
> -       HDMI_WRITE(HDMI_SW_RESET_CONTROL, 0);
> +       if (vc4_hdmi->variant->reset)
> +               vc4_hdmi->variant->reset(vc4_hdmi);
>
>         /* PHY should be in reset, like
>          * vc4_hdmi_encoder_disable() does.
> @@ -1292,14 +1304,6 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
>                 vc4_hdmi->hpd_active_low = hpd_gpio_flags & OF_GPIO_ACTIVE_LOW;
>         }
>
> -       /* HDMI core must be enabled. */
> -       if (!(HDMI_READ(HDMI_M_CTL) & VC4_HD_M_ENABLE)) {
> -               HDMI_WRITE(HDMI_M_CTL, VC4_HD_M_SW_RST);
> -               udelay(1);
> -               HDMI_WRITE(HDMI_M_CTL, 0);
> -
> -               HDMI_WRITE(HDMI_M_CTL, VC4_HD_M_ENABLE);
> -       }
>         pm_runtime_enable(dev);
>
>         drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
> @@ -1428,6 +1432,7 @@ static const struct vc4_hdmi_variant bcm2835_variant = {
>         .num_registers          = ARRAY_SIZE(vc4_hdmi_fields),
>
>         .init_resources         = vc4_hdmi_init_resources,
> +       .reset                  = vc4_hdmi_reset,
>  };
>
>  static const struct of_device_id vc4_hdmi_dt_match[] = {
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
> index b36e0210671f..17a30589f39c 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> @@ -35,6 +35,9 @@ struct vc4_hdmi_variant {
>          * clocks, etc) for that variant.
>          */
>         int (*init_resources)(struct vc4_hdmi *vc4_hdmi);
> +
> +       /* Callback to reset the HDMI block */
> +       void (*reset)(struct vc4_hdmi *vc4_hdmi);
>  };
>
>  /* HDMI audio information */
> --
> git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
