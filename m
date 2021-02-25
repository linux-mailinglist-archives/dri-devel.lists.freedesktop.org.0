Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F00803253D7
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 17:45:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA0AD6ECDB;
	Thu, 25 Feb 2021 16:45:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD64F6ECDB
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 16:45:43 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id h98so5891689wrh.11
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 08:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NmfdoFo/I40sE8Qkui7EMAEzIBiXEXSbxp8eB2SP+0o=;
 b=CyvMjwQCKIE4FwP+oGnuDUNRdWrlgQScBR04hkOk9PiVy6A8GZtH+0UMGAKN9P6WFq
 jprR6l6l4jotSjXlak+UnylsDzPratmo9PlELn9va5NnXgbB6zFMADb9z92JvBmLqt+q
 wRgeVqBCm4HDwi/u/F7ApMyvrycm0pGlRV6QShWWawLewbTdC3Tts6VsQBk5pcqm5hnP
 9MILLaj57TZ2eKBM0lGuOKRVNfXbCzCEC9/Q7KyChSbNTtKusWuwcI5NkRhYvmFNknwP
 o261fT1DdagrjZRChZrfOnt8RvVqTNK1YBQHQJdZQ7cf6a714ti8juiVDeImSdgKAhIW
 yHEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NmfdoFo/I40sE8Qkui7EMAEzIBiXEXSbxp8eB2SP+0o=;
 b=mVLv3sxYx/8DgLyel08+VO8rkIsFSlzHFRRMYl8YSgB4Gjym1ISJQvFRCuF7OLBk16
 EP2JjykQYQlZwYl8k8O6YrGaweRF+foNd+QOMAMW91qrH61kX+Wb0FZ3AlZ+2vS9eVNQ
 7TxKo8zEnn0TOsTe4yLYGryQTN9yN40PE8sjfKisWc7DBRf3sMV4JqBac72gICyqBMh0
 Z3CZeiD5/Bek39tj01wCl9YOnxrOXHqLpuJk3LrSNrzs6nEENMkaOXZMANqaRoSUR1Tl
 +fDqFLrjybX+gx0ngCJPi3/H7jNA/RY04AYr4wCq7RdBBTOpA/inqg6RoNuIoHXrsokg
 TDmw==
X-Gm-Message-State: AOAM530oLoTuYkA9q0t2+bKgoBGP227HN5gNQIOm6Vocukzq94xhhjQn
 pGuP3KJU3HdNrDl5HDXo03QVJCFg1PnHAh1VXUNp4g==
X-Google-Smtp-Source: ABdhPJw6VNhGfLB+x+jtrwvxYrcNNxSAxOcW7GDDkzr1pqBrOXtyS043FXS2OonOo7r8BFLfSOCxjTi4WGBs2AY/IfQ=
X-Received: by 2002:adf:f681:: with SMTP id v1mr4460008wrp.150.1614271542472; 
 Thu, 25 Feb 2021 08:45:42 -0800 (PST)
MIME-Version: 1.0
References: <20210225155909.1853812-1-maxime@cerno.tech>
 <20210225155909.1853812-7-maxime@cerno.tech>
In-Reply-To: <20210225155909.1853812-7-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 25 Feb 2021 16:45:26 +0000
Message-ID: <CAPY8ntAcVoHGcDCXuFD3677VwJCr6EVzWoxL5stmModa7hQrGw@mail.gmail.com>
Subject: Re: [PATCH 6/8] drm/vc4: hdmi: Raise the maximum clock rate
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
Cc: Tim Gover <tim.gover@raspberrypi.com>, Stephen Boyd <sboyd@kernel.org>,
 Mike Turquette <mturquette@baylibre.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Phil Elwell <phil@raspberrypi.com>, David Airlie <airlied@linux.ie>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-clk@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 25 Feb 2021 at 15:59, Maxime Ripard <maxime@cerno.tech> wrote:
>
> Now that we have the infrastructure in place, we can raise the maximum
> pixel rate we can reach for HDMI0 on the BCM2711.
>
> HDMI1 is left untouched since its pixelvalve has a smaller FIFO and
> would need a clock faster than what we can provide to support the same
> modes.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 1a6babb53cf4..27464add6468 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -2177,7 +2177,7 @@ static const struct vc4_hdmi_variant bcm2711_hdmi0_variant = {
>         .encoder_type           = VC4_ENCODER_TYPE_HDMI0,
>         .debugfs_name           = "hdmi0_regs",
>         .card_name              = "vc4-hdmi-0",
> -       .max_pixel_clock        = HDMI_14_MAX_TMDS_CLK,
> +       .max_pixel_clock        = 600000000,
>         .registers              = vc5_hdmi_hdmi0_fields,
>         .num_registers          = ARRAY_SIZE(vc5_hdmi_hdmi0_fields),
>         .phy_lane_mapping       = {
> --
> 2.29.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
