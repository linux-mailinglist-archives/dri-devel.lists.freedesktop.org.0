Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5989E230CD3
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 16:57:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96B826E312;
	Tue, 28 Jul 2020 14:57:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E87B6E312
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 14:57:38 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id b6so18597920wrs.11
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 07:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BwhNWR8x4sReBUnXjkKAZ+VUi9i5Kb9McNJ2lAFUYVE=;
 b=I6r7eI3O9VehcrKADawlnXf0PAyUWwxAU3XCL5cRdAeuursNuOJMO+HtHbxlxYS1Xv
 AzghH5B+Pp1ChD3vptP4ouSznOVU5WsOSWiY3TRQYDooWtp7UT99tXpv23Gg1Bqa2WX2
 z1pUy07I5jdbs76FEVP0aD/lpF/GMVebXdg4fTZTUO+hCMH+7OuECwRUGyAqGNP4gaJO
 zpWnVoWVrt6knZRcHhO4EW6P7uM7luOEO1Sg660qoKgSbVpSJ4l2iVXZkMP5dsQH5pGn
 99ojDgiGyDTuVsbhLGwQLTFT7o/ZxBfaBw56hnChQALvfqWdAptkdI+H86IJaeo63E+1
 BgOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BwhNWR8x4sReBUnXjkKAZ+VUi9i5Kb9McNJ2lAFUYVE=;
 b=gtO0M11c4r870SxzNzP/wRgbjWP91n61gpuVNvAVMEmiHzlVFkX2+hSRGIWjJR0wsM
 wCVlWe88tc8XN49awubdS4FO8xhImbYelwMv+VE5ztIX9IKFvzcC6fk07lCUgVvoJ5zQ
 iHYz3u1B8s/61N03rPSNRxbqYuzp4ZGnTbwIIzkRBnfH+GSM57H0sLkLq7Y1zFcgHwJq
 tQ+rts3iud2C7pfJOCBpMBpRhBis8+yDtQYF55O67UHvmOjIEt37GBUxtj8b0oDesAun
 uTOuAK7qMBq0E6rS3Ci1JDUNgl32YrCMYUQE/yyYz6pPZqY/+kVeoVhD2ObPaCjH+vO1
 ieJw==
X-Gm-Message-State: AOAM530jE3VZDW+ZyTL9P4huBPWG1mG1tkGklnOCRPGt+rukF+MdnkX6
 NAo3mOBRipH6NwSaTyx6xywG2BF5fFmALo64dQKAHg==
X-Google-Smtp-Source: ABdhPJwdvN11Z/Q0YJ6kgQpbGgsMXnn1xBOigXdlYRNApIMYuC35kGIxzsnpR7nvqAx4GRIiJdQxadfOp+Nob0+zceo=
X-Received: by 2002:adf:fdce:: with SMTP id i14mr20006305wrs.273.1595948257404; 
 Tue, 28 Jul 2020 07:57:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
 <a47487bc8873abe33499e79d3c10d085e341614e.1594230107.git-series.maxime@cerno.tech>
In-Reply-To: <a47487bc8873abe33499e79d3c10d085e341614e.1594230107.git-series.maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 28 Jul 2020 15:57:22 +0100
Message-ID: <CAPY8ntCkuN-cahLd7Ex4awkcUhFVM43nGX4rZCtjRmy-wCyHGQ@mail.gmail.com>
Subject: Re: [PATCH v4 63/78] drm/vc4: hdmi: Use clk_set_min_rate instead
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

On Wed, 8 Jul 2020 at 18:44, Maxime Ripard <maxime@cerno.tech> wrote:
>
> The HSM clock needs to be running at 101% the pixel clock of the HDMI
> controller, however it's shared between the two HDMI controllers, which
> means that if the resolutions are different between the two HDMI
> controllers, and the lowest resolution is on the second (in enable order)
> controller, the first HDMI controller will end up with a smaller than
> expected clock rate.
>
> Since we don't really need an exact frequency there, we can simply change
> the minimum rate we expect instead.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 9f30fab744f2..d99188c90ff9 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -462,7 +462,7 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
>          * pixel clock, but HSM ends up being the limiting factor.
>          */
>         hsm_rate = max_t(unsigned long, 120000000, (pixel_rate / 100) * 101);
> -       ret = clk_set_rate(vc4_hdmi->hsm_clock, hsm_rate);
> +       ret = clk_set_min_rate(vc4_hdmi->hsm_clock, hsm_rate);
>         if (ret) {
>                 DRM_ERROR("Failed to set HSM clock rate: %d\n", ret);
>                 return;
> --
> git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
