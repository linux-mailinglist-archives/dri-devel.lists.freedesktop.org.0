Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B94B2DE3FA
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 15:27:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 404686E0CA;
	Fri, 18 Dec 2020 14:27:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFCC66E0CA
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 14:27:15 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id r4so2756253wmh.5
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 06:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3jAc8avduUQUrJ7esBOnKUiJwC4FE/zfHKx0EFzGBz4=;
 b=F2xfRsnxvhpv+uKXzfqbx5DcPoqGFopHvfaBoi1q+5mqVAQZxdhyICtkh2j5WfhqO3
 3IQecoe1Tv49RuxNLIKuyOjlDOpvEYpmBoOA22StprO4jAKztsbQ7+sOnnguCFjI1OIU
 zCp17THqkfo1ugcRGSYGkugWd5wKQnG/laLA1EQ2k4gUck1lacj5iwMyIRm41NvG3VVB
 GHdKvd2sH1ZWm1jABteiUuw+ekkw9Ndlqlmr1VLlCT5qzh+hOGKm7XF4bwxML3TkHtCU
 LUYLh1XuxOUFyU627821rC71lWA0Jbhr11uUpPI06v5NPJsfZUx6OLC95ABQc83me+oS
 AWQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3jAc8avduUQUrJ7esBOnKUiJwC4FE/zfHKx0EFzGBz4=;
 b=d8cP5YSgf3gigjyBI6ZZI++770P+VN6RDOcu2pL47cjh3tpHug7EONDRBxfTZvJKfm
 rP0dyKc0Lt7mhxj5SaqUnrrdV5TptJWeGXtdu1ZV4tFAtDFgxlsj6v//0NkElTqei/NR
 Enf5CUICVkZGyT7vaj8TEzPHQVj+xOuuQBv2tbytmI1tRwvjKiSzpJ7PzHLYj6TfBBJf
 y31SjJPn5tUR9+j90RO1yzmSAcAmcBsnxusTOQX5G9H4ceG6UqVr2HEb/6Cq2vEY3IUH
 buj/bTIZb5p6eM2sMkbBsKjdSsAP2JQrTGyW70tptDtsutcGyypabJ9gkBMZAEO8GS3W
 zYNg==
X-Gm-Message-State: AOAM532l25l2zGKyf0YqXUlxrZqES2e9GglafI/i9cGKAOIOGvBN0dxg
 gAE8iWqb4liIY2dm5u5pfcXCYQ5aep9LinKC6Ph+TQ==
X-Google-Smtp-Source: ABdhPJx/lsgjkUBwptE2FvxilKrOPsqLIk5qAqyXF5cU65mBAdSv8EykNmw+E0J5n3tiJW833Tb9661bqGbb3yW/kKA=
X-Received: by 2002:a1c:bc88:: with SMTP id m130mr4637467wmf.82.1608301634416; 
 Fri, 18 Dec 2020 06:27:14 -0800 (PST)
MIME-Version: 1.0
References: <20201210134648.272857-1-maxime@cerno.tech>
 <20201210134648.272857-8-maxime@cerno.tech>
In-Reply-To: <20201210134648.272857-8-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 18 Dec 2020 14:26:57 +0000
Message-ID: <CAPY8ntCVgX7qHUS5Ecyjb2_rn_1amc88pFkPTU2XNVmcmO_ZBQ@mail.gmail.com>
Subject: Re: [PATCH 07/15] drm/vc4: hdmi: Update the CEC clock divider on HSM
 rate change
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
Cc: Jason Cooper <jason@lakedaemon.net>, David Airlie <airlied@linux.ie>,
 Marc Zyngier <maz@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Daniel Vetter <daniel.vetter@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

On Thu, 10 Dec 2020 at 13:47, Maxime Ripard <maxime@cerno.tech> wrote:
>
> As part of the enable sequence we might change the HSM clock rate if the
> pixel rate is different than the one we were already dealing with.
>
> On the BCM2835 however, the CEC clock derives from the HSM clock so any
> rate change will need to be reflected in the CEC clock divider to output
> 40kHz.
>
> Fixes: cd4cb49dc5bb ("drm/vc4: hdmi: Adjust HSM clock rate depending on pixel rate")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

I thought we'd got a duplicate patch here, but it's moving code that
was changed in patch 6/15 so it can be called from
vc4_hdmi_encoder_pre_crtc_configure too. Good for confusing me!

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 39 +++++++++++++++++++++++++---------
>  1 file changed, 29 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 0c53d7427d15..b93ee3e26e2b 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -132,6 +132,27 @@ static void vc5_hdmi_reset(struct vc4_hdmi *vc4_hdmi)
>                    HDMI_READ(HDMI_CLOCK_STOP) | VC4_DVP_HT_CLOCK_STOP_PIXEL);
>  }
>
> +#ifdef CONFIG_DRM_VC4_HDMI_CEC
> +static void vc4_hdmi_cec_update_clk_div(struct vc4_hdmi *vc4_hdmi)
> +{
> +       u16 clk_cnt;
> +       u32 value;
> +
> +       value = HDMI_READ(HDMI_CEC_CNTRL_1);
> +       value &= ~VC4_HDMI_CEC_DIV_CLK_CNT_MASK;
> +
> +       /*
> +        * Set the clock divider: the hsm_clock rate and this divider
> +        * setting will give a 40 kHz CEC clock.
> +        */
> +       clk_cnt = clk_get_rate(vc4_hdmi->hsm_clock) / CEC_CLOCK_FREQ;
> +       value |= clk_cnt << VC4_HDMI_CEC_DIV_CLK_CNT_SHIFT;
> +       HDMI_WRITE(HDMI_CEC_CNTRL_1, value);
> +}
> +#else
> +static void vc4_hdmi_cec_update_clk_div(struct vc4_hdmi *vc4_hdmi) {}
> +#endif
> +
>  static enum drm_connector_status
>  vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
>  {
> @@ -761,6 +782,8 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
>                 return;
>         }
>
> +       vc4_hdmi_cec_update_clk_div(vc4_hdmi);
> +
>         /*
>          * FIXME: When the pixel freq is 594MHz (4k60), this needs to be setup
>          * at 300MHz.
> @@ -1586,7 +1609,6 @@ static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
>  {
>         struct cec_connector_info conn_info;
>         struct platform_device *pdev = vc4_hdmi->pdev;
> -       u16 clk_cnt;
>         u32 value;
>         int ret;
>
> @@ -1605,17 +1627,14 @@ static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
>         cec_s_conn_info(vc4_hdmi->cec_adap, &conn_info);
>
>         HDMI_WRITE(HDMI_CEC_CPU_MASK_SET, 0xffffffff);
> +
>         value = HDMI_READ(HDMI_CEC_CNTRL_1);
> -       value &= ~VC4_HDMI_CEC_DIV_CLK_CNT_MASK;
> -       /*
> -        * Set the logical address to Unregistered and set the clock
> -        * divider: the hsm_clock rate and this divider setting will
> -        * give a 40 kHz CEC clock.
> -        */
> -       clk_cnt = clk_get_rate(vc4_hdmi->hsm_clock) / CEC_CLOCK_FREQ;
> -       value |= VC4_HDMI_CEC_ADDR_MASK |
> -                (clk_cnt << VC4_HDMI_CEC_DIV_CLK_CNT_SHIFT);
> +       /* Set the logical address to Unregistered */
> +       value |= VC4_HDMI_CEC_ADDR_MASK;
>         HDMI_WRITE(HDMI_CEC_CNTRL_1, value);
> +
> +       vc4_hdmi_cec_update_clk_div(vc4_hdmi);
> +
>         ret = devm_request_threaded_irq(&pdev->dev, platform_get_irq(pdev, 0),
>                                         vc4_cec_irq_handler,
>                                         vc4_cec_irq_handler_thread, 0,
> --
> 2.28.0
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
