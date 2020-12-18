Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 725272DE40A
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 15:30:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A88036E0EF;
	Fri, 18 Dec 2020 14:30:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BD366E0EF
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 14:30:27 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id g25so6047961wmh.1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 06:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cSf/A3KMFP7l6dKoCFldn4orJN3Li1SRGvRFJDZdZBk=;
 b=FAxD2Y0NbqFM3ObrBbKO1uzFTAkuZkfq4nO0/y02pStuULzcEQVJ++qE6xjAOWSiMJ
 Z+zJK/11O7gH7sBtClCoRC44Lu5RNjqID1MNzTa4s/odoqiMyCdQE7nRSDhOIstJf1nv
 GoaY7I4IJDvHuiglAV1NWAN18RRDFPmabOcytUignipoOKlOQkMbQ+WDk0oqEuda5C8P
 eqDwlymwP/5kXCAkXMbeuU6nLmgGm8gdBKksDocR0F6Her14FIhXm+vqz+vCxEWde6iH
 Ui7oJC4E7fWuKt027IzbeCK6dw/U1rS3uFhcgxG/51fn3oVXly8LPUrMCwOpXTcbwavv
 jreg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cSf/A3KMFP7l6dKoCFldn4orJN3Li1SRGvRFJDZdZBk=;
 b=EK2fuIod+ekEUlSjYphV8w0yfT+pmUqlHlhvo+kJj9OxWqd87WEZruC6KBxHfwYROU
 jtabFutryJOfQoBudShpOQ3DvwF/wxMWaWB5iLjTXAr+c40t0HHX8COJKk0ZoB2r/LRV
 zCgF17+5DOteUKY2NotSpUuGHv+K9wLPKAPncwo8ROMY7iQNztheN2vCR5CFoe4PSqkG
 /664lVkz0WPcSOkGSW3U12Xvcmn7lgt2OGqLWEnB1VKmdqyyStyUhgSfR86GPcebYGXL
 JToebWoZNpzrloy4VYu9792dZpJGTqR23IMmP2PDG74QXYBAihc/JqLetK6ejVtcAJzk
 gwhA==
X-Gm-Message-State: AOAM531LkSSn+wy36xGIB+IouALqVpd9hAFgiD6HVw3X61cCYmnQbcg8
 7cnmA9yyOLXgjzMkP8f+J805YHo9iEx/oFgBDPuLSw==
X-Google-Smtp-Source: ABdhPJwZPxE2hgQD4zqrk0QkQvmTF5EOdTM22UN833i/JzSn6RMW16hnmxGVt7Jtvfucob2k4gTUusWtU/lA6XrmCQw=
X-Received: by 2002:a1c:9a57:: with SMTP id c84mr4329681wme.183.1608301826242; 
 Fri, 18 Dec 2020 06:30:26 -0800 (PST)
MIME-Version: 1.0
References: <20201210134648.272857-1-maxime@cerno.tech>
 <20201210134648.272857-12-maxime@cerno.tech>
In-Reply-To: <20201210134648.272857-12-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 18 Dec 2020 14:30:09 +0000
Message-ID: <CAPY8ntDRkw0FaAojjoPZykrDWN4zboGnDSCefoegAkCZ4PrMXw@mail.gmail.com>
Subject: Re: [PATCH 11/15] drm/vc4: hdmi: Remove cec_available flag
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
 Dom Cobley <popcornmix@gmail.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Daniel Vetter <daniel.vetter@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dom & Maxime

On Thu, 10 Dec 2020 at 13:47, Maxime Ripard <maxime@cerno.tech> wrote:
>
> From: Dom Cobley <popcornmix@gmail.com>
>
> Now that our HDMI controller supports CEC for the BCM2711, let's remove
> that flag.
>
> Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 4 ----
>  drivers/gpu/drm/vc4/vc4_hdmi.h | 3 ---
>  2 files changed, 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index d208b7d1d937..327638d93032 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -1658,9 +1658,6 @@ static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
>         u32 value;
>         int ret;
>
> -       if (!vc4_hdmi->variant->cec_available)
> -               return 0;
> -
>         vc4_hdmi->cec_adap = cec_allocate_adapter(&vc4_hdmi_cec_adap_ops,
>                                                   vc4_hdmi, "vc4",
>                                                   CEC_CAP_DEFAULTS |
> @@ -2074,7 +2071,6 @@ static const struct vc4_hdmi_variant bcm2835_variant = {
>         .debugfs_name           = "hdmi_regs",
>         .card_name              = "vc4-hdmi",
>         .max_pixel_clock        = 162000000,
> -       .cec_available          = true,
>         .registers              = vc4_hdmi_fields,
>         .num_registers          = ARRAY_SIZE(vc4_hdmi_fields),
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
> index 27352827f70c..c93ada62f429 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> @@ -42,9 +42,6 @@ struct vc4_hdmi_variant {
>         /* Filename to expose the registers in debugfs */
>         const char *debugfs_name;
>
> -       /* Set to true when the CEC support is available */
> -       bool cec_available;
> -
>         /* Maximum pixel clock supported by the controller (in Hz) */
>         unsigned long long max_pixel_clock;
>
> --
> 2.28.0
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
