Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EDE3003D9
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 14:11:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBF836E0B9;
	Fri, 22 Jan 2021 13:11:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E20C6E0B9
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 13:11:05 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id q7so5012257wre.13
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 05:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DlbQDTL9lgcBTkGtGPLxxHcpZqtYZlnjZgESPzNd3dk=;
 b=cvMBoOPbyHYvHuRZJUbkoYI6wQr+uFNzsP8Byd3bREwnZWQckWn9O3O9z4rbqAAxCG
 DG3FeAiintfRZo3klDvSndwOAEafZQxbQ6F7WTtmJLwIjp23HpS2osdES8yLkzS7vjV6
 UFHfZEM1Tl/ujKCCd90L4Fvd8mcPz+6eD9YuVeQeeyy5kKVDD5s9ci+fdJWlKEnj3xZT
 +DIpvikohimdbEO+qam8p2fIhaYzFI74vUqDLd6LPr+MTmSUopRwDXWhCG9LGLIXMe0h
 c87V5IsAQiLZ3HVsOMhJD/IRXutd5+uq5eEb87yD52RiAU+XGsa7yCtbSSCADFUNHOg2
 7HuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DlbQDTL9lgcBTkGtGPLxxHcpZqtYZlnjZgESPzNd3dk=;
 b=MaC80YaV2CL8JcggFflwYj7zlQCrkYx/ZccVDVn0d49gQt6bny5/wnZAWLrVeJu6jm
 w3aYJzBzsnfZx0qgpfNyr+11BV1j5L2mIDvddOgB0dG2LcE7JW13wzd0Jtb3SigqNS8H
 0N82oRoF7qtAyDSS8Jt2RTKul4VzQIe3cyMCFZDMwkwK+O9u1pz8WDiJShp6VZSDadse
 AI54D7CuScPJRCJmQYLZ7+e75QVs8VeFNic+CLE1f76yI/7K/WO/hNe8egJZGnzMQCCH
 50cO52ufJXb+DtOWRHsOUN1/fMdpHfnVQpHEzjhLVSxKbf7YyHH6sRq0lc3g00/+abZE
 RPlA==
X-Gm-Message-State: AOAM532Z2v4sUXz2eEUFtUX08nL/KZcMeYXy6TZYTtdwZTFlgz/0xGzj
 00SR9PoiVoFwEn/RQyqYn3CUS+A7fs5x90hpFhifHw==
X-Google-Smtp-Source: ABdhPJzM9x7gbuptc/+Kd7a/slbXsAMEIvUb+yNdZCSX3L+dSiV9l/Kk/Q81u61D3jOMDh403qjkCGqTrzJC12ovbLY=
X-Received: by 2002:a05:6000:1082:: with SMTP id
 y2mr4331942wrw.27.1611321064346; 
 Fri, 22 Jan 2021 05:11:04 -0800 (PST)
MIME-Version: 1.0
References: <20210111142309.193441-1-maxime@cerno.tech>
 <20210111142309.193441-11-maxime@cerno.tech>
In-Reply-To: <20210111142309.193441-11-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 22 Jan 2021 13:10:49 +0000
Message-ID: <CAPY8ntCdxn3=A19VVsxnrPppk0O7eyzxa3bwFWQj1QEXnQ_GWA@mail.gmail.com>
Subject: Re: [PATCH v2 10/15] drm/vc4: hdmi: Support BCM2711 CEC interrupt
 setup
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

On Mon, 11 Jan 2021 at 14:23, Maxime Ripard <maxime@cerno.tech> wrote:
>
> The HDMI controller found in the BCM2711 has an external interrupt
> controller for the CEC and hotplug interrupt shared between the two
> instances.
>
> Let's add a variant flag to register a single interrupt handler and
> deals with the interrupt handler setup, or two interrupt handlers
> relying on an external irqchip.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Looks good

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 42 ++++++++++++++++++++++++++--------
>  drivers/gpu/drm/vc4/vc4_hdmi.h |  7 ++++++
>  2 files changed, 39 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 12ca5f3084af..d116ecfd8cf7 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -1605,9 +1605,11 @@ static int vc4_hdmi_cec_adap_enable(struct cec_adapter *adap, bool enable)
>                            ((3600 / usecs) << VC4_HDMI_CEC_CNT_TO_3600_US_SHIFT) |
>                            ((3500 / usecs) << VC4_HDMI_CEC_CNT_TO_3500_US_SHIFT));
>
> -               HDMI_WRITE(HDMI_CEC_CPU_MASK_CLEAR, VC4_HDMI_CPU_CEC);
> +               if (!vc4_hdmi->variant->external_irq_controller)
> +                       HDMI_WRITE(HDMI_CEC_CPU_MASK_CLEAR, VC4_HDMI_CPU_CEC);
>         } else {
> -               HDMI_WRITE(HDMI_CEC_CPU_MASK_SET, VC4_HDMI_CPU_CEC);
> +               if (!vc4_hdmi->variant->external_irq_controller)
> +                       HDMI_WRITE(HDMI_CEC_CPU_MASK_SET, VC4_HDMI_CPU_CEC);
>                 HDMI_WRITE(HDMI_CEC_CNTRL_5, val |
>                            VC4_HDMI_CEC_TX_SW_RESET | VC4_HDMI_CEC_RX_SW_RESET);
>         }
> @@ -1682,8 +1684,6 @@ static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
>         cec_fill_conn_info_from_drm(&conn_info, &vc4_hdmi->connector);
>         cec_s_conn_info(vc4_hdmi->cec_adap, &conn_info);
>
> -       HDMI_WRITE(HDMI_CEC_CPU_MASK_SET, 0xffffffff);
> -
>         value = HDMI_READ(HDMI_CEC_CNTRL_1);
>         /* Set the logical address to Unregistered */
>         value |= VC4_HDMI_CEC_ADDR_MASK;
> @@ -1691,12 +1691,32 @@ static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
>
>         vc4_hdmi_cec_update_clk_div(vc4_hdmi);
>
> -       ret = devm_request_threaded_irq(&pdev->dev, platform_get_irq(pdev, 0),
> -                                       vc4_cec_irq_handler,
> -                                       vc4_cec_irq_handler_thread, 0,
> -                                       "vc4 hdmi cec", vc4_hdmi);
> -       if (ret)
> -               goto err_delete_cec_adap;
> +       if (vc4_hdmi->variant->external_irq_controller) {
> +               ret = devm_request_threaded_irq(&pdev->dev,
> +                                               platform_get_irq_byname(pdev, "cec-rx"),
> +                                               vc4_cec_irq_handler_rx_bare,
> +                                               vc4_cec_irq_handler_rx_thread, 0,
> +                                               "vc4 hdmi cec rx", vc4_hdmi);
> +               if (ret)
> +                       goto err_delete_cec_adap;
> +
> +               ret = devm_request_threaded_irq(&pdev->dev,
> +                                               platform_get_irq_byname(pdev, "cec-tx"),
> +                                               vc4_cec_irq_handler_tx_bare,
> +                                               vc4_cec_irq_handler_tx_thread, 0,
> +                                               "vc4 hdmi cec tx", vc4_hdmi);
> +               if (ret)
> +                       goto err_delete_cec_adap;
> +       } else {
> +               HDMI_WRITE(HDMI_CEC_CPU_MASK_SET, 0xffffffff);
> +
> +               ret = devm_request_threaded_irq(&pdev->dev, platform_get_irq(pdev, 0),
> +                                               vc4_cec_irq_handler,
> +                                               vc4_cec_irq_handler_thread, 0,
> +                                               "vc4 hdmi cec", vc4_hdmi);
> +               if (ret)
> +                       goto err_delete_cec_adap;
> +       }
>
>         ret = cec_register_adapter(vc4_hdmi->cec_adap, &pdev->dev);
>         if (ret < 0)
> @@ -2095,6 +2115,7 @@ static const struct vc4_hdmi_variant bcm2711_hdmi0_variant = {
>                 PHY_LANE_CK,
>         },
>         .unsupported_odd_h_timings      = true,
> +       .external_irq_controller        = true,
>
>         .init_resources         = vc5_hdmi_init_resources,
>         .csc_setup              = vc5_hdmi_csc_setup,
> @@ -2121,6 +2142,7 @@ static const struct vc4_hdmi_variant bcm2711_hdmi1_variant = {
>                 PHY_LANE_2,
>         },
>         .unsupported_odd_h_timings      = true,
> +       .external_irq_controller        = true,
>
>         .init_resources         = vc5_hdmi_init_resources,
>         .csc_setup              = vc5_hdmi_csc_setup,
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
> index 6966db1a0957..d71f6ed321bf 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> @@ -64,6 +64,13 @@ struct vc4_hdmi_variant {
>         /* The BCM2711 cannot deal with odd horizontal pixel timings */
>         bool unsupported_odd_h_timings;
>
> +       /*
> +        * The BCM2711 CEC/hotplug IRQ controller is shared between the
> +        * two HDMI controllers, and we have a proper irqchip driver for
> +        * it.
> +        */
> +       bool external_irq_controller;
> +
>         /* Callback to get the resources (memory region, interrupts,
>          * clocks, etc) for that variant.
>          */
> --
> 2.29.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
