Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3052D4540
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 16:24:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC6FE6EA87;
	Wed,  9 Dec 2020 15:24:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E21116EA87
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 15:24:07 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id g25so1092225wmh.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Dec 2020 07:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DvofncbCriv4pw6uZVW8Dth4EDwSgdY2RJVU/jfUdMs=;
 b=Pn8xUbPIqvgtn+JpFg60/KgQ6GBUiC0vJ9JA1GVcmCcaP8YDIJ9cAGfH7znNdRitNy
 YkPPVPdibNY6bTwKldFPZmGZQuSAHpF9LM6YPs8xe/ahNFImcxJ3thmi5MTV4pu4vmPD
 m/+Oqu5vMP5/Vz6OuhjzDZm3S0cQoDznDW7snHkFb0OKgaXZMvAvibBxaL9vvsGtCFeK
 afG1unk7/rWNKAkej/O5UK2tPJ/diq5lEbNPzAcdwLaZjCph7PBeCgwdxHawKARlBMZt
 Dyw+VJ/vPkq4Tx+Hur3Z0hA9a0dmnnXGUAT288zzpdqoUWlNe2tKPt1zld7Wc5wtk9fn
 jGTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DvofncbCriv4pw6uZVW8Dth4EDwSgdY2RJVU/jfUdMs=;
 b=M6Bbf6DmY8GC2kMQJVMA238KqjFMGWi/VdySJrzlCO/rjDpqTzYFUNNnTtngFrAl7h
 /xdiZ3wR9Sf/8W/CbqhzQ409PzM44dFugPOqaoE9LiENLMAf/0lm1K+QVGoGfk9M++Et
 4EsGQ5j9dLUx8yvddG1QOd0dIJm8rkQ7oEEAG/BiTULPHV67JKPZppnN7ulTP6ip4NgM
 P/9sfKjnnV16fd0ZtoxkeIoaGKWwz1IonZpURu6elf1m340UKRDeF3sy3XkYqkuWlcfk
 IgeG1bN4WFyCp5vVcHHfsdSI7LlkWU83ocf3Jh+S/8ixxfBsGW/mXYXn96JdxrKLxtSI
 QJSQ==
X-Gm-Message-State: AOAM530AgK9nBU2cIiMsIEnc5cV+grVpxd4XCyqY5kdrmC6duvlHYX5M
 uOrx5CtWGTesSMLnOv9wv5l7GTfrMnUXVNCoc6QSvg==
X-Google-Smtp-Source: ABdhPJzl3MHu/WIIbF4k9ajdSiVqnLSL5rFeoOUZDMH6tuoFTTM75NHyMVj6+In3aZ45ogCW6RQlnGW45BOaRWrgDWA=
X-Received: by 2002:a1c:7d88:: with SMTP id y130mr3278480wmc.158.1607527446683; 
 Wed, 09 Dec 2020 07:24:06 -0800 (PST)
MIME-Version: 1.0
References: <20201207155719.17149-1-maxime@cerno.tech>
 <20201207155719.17149-9-maxime@cerno.tech>
In-Reply-To: <20201207155719.17149-9-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 9 Dec 2020 15:23:51 +0000
Message-ID: <CAPY8ntDc44ctOwVAcSaQ_C-0jDeX=CCtzbiGGxFKiDng0CgRGw@mail.gmail.com>
Subject: Re: [PATCH v5 8/9] drm/vc4: hdmi: Limit the BCM2711 to the max
 without scrambling
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
> Unlike the previous generations, the HSM clock limitation is way above
> what we can reach without scrambling, so let's move the maximum
> frequency we support to the maximum clock frequency without scrambling.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 5310e06efc82..f4ff6b5db484 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -82,6 +82,8 @@
>  #define CEC_CLOCK_FREQ 40000
>  #define VC4_HSM_MID_CLOCK 149985000
>
> +#define HDMI_14_MAX_TMDS_CLK   (340 * 1000 * 1000)
> +
>  static int vc4_hdmi_debugfs_regs(struct seq_file *m, void *unused)
>  {
>         struct drm_info_node *node = (struct drm_info_node *)m->private;
> @@ -1911,7 +1913,7 @@ static const struct vc4_hdmi_variant bcm2711_hdmi0_variant = {
>         .encoder_type           = VC4_ENCODER_TYPE_HDMI0,
>         .debugfs_name           = "hdmi0_regs",
>         .card_name              = "vc4-hdmi-0",
> -       .max_pixel_clock        = 297000000,
> +       .max_pixel_clock        = HDMI_14_MAX_TMDS_CLK,
>         .registers              = vc5_hdmi_hdmi0_fields,
>         .num_registers          = ARRAY_SIZE(vc5_hdmi_hdmi0_fields),
>         .phy_lane_mapping       = {
> @@ -1937,7 +1939,7 @@ static const struct vc4_hdmi_variant bcm2711_hdmi1_variant = {
>         .encoder_type           = VC4_ENCODER_TYPE_HDMI1,
>         .debugfs_name           = "hdmi1_regs",
>         .card_name              = "vc4-hdmi-1",
> -       .max_pixel_clock        = 297000000,
> +       .max_pixel_clock        = HDMI_14_MAX_TMDS_CLK,
>         .registers              = vc5_hdmi_hdmi1_fields,
>         .num_registers          = ARRAY_SIZE(vc5_hdmi_hdmi1_fields),
>         .phy_lane_mapping       = {
> --
> 2.28.0
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
