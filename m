Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 729F6230AE5
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 15:04:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6548D6E1F5;
	Tue, 28 Jul 2020 13:04:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7B6F6E1F5
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 13:04:36 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id b6so18212898wrs.11
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 06:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gcofQuTne2V4gIOdfNwCH+OZQw5KXbzKYJj8xweScI4=;
 b=Wk8DgYFCnFIRsz2cW/r3mBspcHpJv3myWr993HibCeQqllBImb1GEcO+fyimpiIr5w
 7PTKyEnW8WoREJvkcnCvBLhEe/b2AYgmGBg+hDG7uRv3RiPKed/1m+fZvGMrg1gayGWK
 AFyVkhHrIr6plLwk6Ra9T2C/i6e+GwgslmPo6LkAuUUaSjQQxUlzNFGD4K5Fs8XLyBm/
 WYKHxqOG+IimIaQW/a8+cdOdxV5cwEiSLqh64frjVKJSZNdsQJBvNAjdKtN2KPJEyT1u
 LzTqFcQ8B58tNeZOZwtP2g6/Gu1R/CWcoBt/XKUu4dmLtkrQaKc4RegQ3+jHyVhi/dcO
 S+AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gcofQuTne2V4gIOdfNwCH+OZQw5KXbzKYJj8xweScI4=;
 b=Adz4927RGhViWYzwr7U+CRPzfkewj1AjKUy4UfNB1NVHNTUpRluAq1R5YllxEHqgv4
 pngOORjfKl+Xceir8MM2d/G88t7Ku4jSHiH/nIy1I/wJGyN/sR42CAd4pi3SmTJ7qzsj
 DSFSY7nWOF7NZJ1LvgmVpPGI4zvvTI3k/ayDgwnnzfheTHpXU/xsndf1Nv2dRDoKILvC
 gz1d6qgvpnUkpyK26VhRx9rB0cC67r7sDvzjE+Ta4C+4tmIxxk/2ekXOy0XH0W9jfunt
 IvNIAuhNNScy6eoBiTOiAQlLyty348XlXuiyzjPrGolIDHz3gH09PGGppIjvJ0vZMUJK
 GfgQ==
X-Gm-Message-State: AOAM530f17QgJK67uTWU5DhszEYse05WcZxYP3vhfUF7J/n7tKEj7V5G
 v4DpTxdYRHhwK2GVB67MQK99jJ/0a3bTINQJEnNtWQ==
X-Google-Smtp-Source: ABdhPJxelRtYnChCl0Sl6JYGoztCBTIhgUBVvvtriFYE5kfH2FMO/T+MYgEogjjrP1PYAHMHTnlP2yZzYC42aSEnflo=
X-Received: by 2002:adf:fdce:: with SMTP id i14mr19598316wrs.273.1595941475627; 
 Tue, 28 Jul 2020 06:04:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
 <6289e210ab50767f32951c1e9b80d420dc879447.1594230107.git-series.maxime@cerno.tech>
In-Reply-To: <6289e210ab50767f32951c1e9b80d420dc879447.1594230107.git-series.maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 28 Jul 2020 14:04:18 +0100
Message-ID: <CAPY8ntAB41UNyNCAACRzS_mo4R5EbSiV_z_vMfJmoEw1Mbj7xw@mail.gmail.com>
Subject: Re: [PATCH v4 54/78] drm/vc4: hdmi: Add PHY RNG enable / disable
 function
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
> Let's continue the implementation of hooks for the parts that change in the
> BCM2711 SoC with the PHY RNG setup.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c     | 15 +++++++++------
>  drivers/gpu/drm/vc4/vc4_hdmi.h     |  8 ++++++++
>  drivers/gpu/drm/vc4/vc4_hdmi_phy.c | 15 +++++++++++++++
>  3 files changed, 32 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 068041145d1c..19897d6525ac 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -762,9 +762,9 @@ static int vc4_hdmi_audio_trigger(struct snd_pcm_substream *substream, int cmd,
>         switch (cmd) {
>         case SNDRV_PCM_TRIGGER_START:
>                 vc4_hdmi_set_audio_infoframe(encoder);
> -               HDMI_WRITE(HDMI_TX_PHY_CTL_0,
> -                          HDMI_READ(HDMI_TX_PHY_CTL_0) &
> -                          ~VC4_HDMI_TX_PHY_RNG_PWRDN);
> +
> +               if (vc4_hdmi->variant->phy_rng_enable)
> +                       vc4_hdmi->variant->phy_rng_enable(vc4_hdmi);
>
>                 HDMI_WRITE(HDMI_MAI_CTL,
>                            VC4_SET_FIELD(vc4_hdmi->audio.channels,
> @@ -776,9 +776,10 @@ static int vc4_hdmi_audio_trigger(struct snd_pcm_substream *substream, int cmd,
>                            VC4_HD_MAI_CTL_DLATE |
>                            VC4_HD_MAI_CTL_ERRORE |
>                            VC4_HD_MAI_CTL_ERRORF);
> -               HDMI_WRITE(HDMI_TX_PHY_CTL_0,
> -                          HDMI_READ(HDMI_TX_PHY_CTL_0) |
> -                          VC4_HDMI_TX_PHY_RNG_PWRDN);
> +
> +               if (vc4_hdmi->variant->phy_rng_disable)
> +                       vc4_hdmi->variant->phy_rng_disable(vc4_hdmi);
> +
>                 break;
>         default:
>                 break;
> @@ -1433,6 +1434,8 @@ static const struct vc4_hdmi_variant bcm2835_variant = {
>         .reset                  = vc4_hdmi_reset,
>         .phy_init               = vc4_hdmi_phy_init,
>         .phy_disable            = vc4_hdmi_phy_disable,
> +       .phy_rng_enable         = vc4_hdmi_phy_rng_enable,
> +       .phy_rng_disable        = vc4_hdmi_phy_rng_disable,
>  };
>
>  static const struct of_device_id vc4_hdmi_dt_match[] = {
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
> index 32c80161c786..950accbc44e4 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> @@ -47,6 +47,12 @@ struct vc4_hdmi_variant {
>
>         /* Callback to disable the PHY */
>         void (*phy_disable)(struct vc4_hdmi *vc4_hdmi);
> +
> +       /* Callback to enable the RNG in the PHY */
> +       void (*phy_rng_enable)(struct vc4_hdmi *vc4_hdmi);
> +
> +       /* Callback to disable the RNG in the PHY */
> +       void (*phy_rng_disable)(struct vc4_hdmi *vc4_hdmi);
>  };
>
>  /* HDMI audio information */
> @@ -107,5 +113,7 @@ encoder_to_vc4_hdmi(struct drm_encoder *encoder)
>  void vc4_hdmi_phy_init(struct vc4_hdmi *vc4_hdmi,
>                        struct drm_display_mode *mode);
>  void vc4_hdmi_phy_disable(struct vc4_hdmi *vc4_hdmi);
> +void vc4_hdmi_phy_rng_enable(struct vc4_hdmi *vc4_hdmi);
> +void vc4_hdmi_phy_rng_disable(struct vc4_hdmi *vc4_hdmi);
>
>  #endif /* _VC4_HDMI_H_ */
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi_phy.c b/drivers/gpu/drm/vc4/vc4_hdmi_phy.c
> index 5a1746877bb5..93287e24d7d1 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi_phy.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi_phy.c
> @@ -7,6 +7,7 @@
>   */
>
>  #include "vc4_hdmi.h"
> +#include "vc4_regs.h"
>  #include "vc4_hdmi_regs.h"
>
>  void vc4_hdmi_phy_init(struct vc4_hdmi *vc4_hdmi, struct drm_display_mode *mode)
> @@ -23,3 +24,17 @@ void vc4_hdmi_phy_disable(struct vc4_hdmi *vc4_hdmi)
>  {
>         HDMI_WRITE(HDMI_TX_PHY_RESET_CTL, 0xf << 16);
>  }
> +
> +void vc4_hdmi_phy_rng_enable(struct vc4_hdmi *vc4_hdmi)
> +{
> +       HDMI_WRITE(HDMI_TX_PHY_CTL_0,
> +                  HDMI_READ(HDMI_TX_PHY_CTL_0) &
> +                  ~VC4_HDMI_TX_PHY_RNG_PWRDN);
> +}
> +
> +void vc4_hdmi_phy_rng_disable(struct vc4_hdmi *vc4_hdmi)
> +{
> +       HDMI_WRITE(HDMI_TX_PHY_CTL_0,
> +                  HDMI_READ(HDMI_TX_PHY_CTL_0) |
> +                  VC4_HDMI_TX_PHY_RNG_PWRDN);
> +}
> --
> git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
