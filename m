Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA5A2B928A
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 13:28:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AEB989BA1;
	Thu, 19 Nov 2020 12:28:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FC4789BA1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 12:27:59 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id p19so6187842wmg.0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 04:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Iyk4Q0srfe64j+vmZDIe+kCMfIqD4kV5Ou7J+0oKXUs=;
 b=Ur3kKH5fpT/ARi++TUMSQ6jwtQ7vl4KST/oY/cjvuLHDdPe5+BkcMvinBITID+jSd8
 j29BtsrpxoN1wkwSTWmNcxsrqcGtERP/6pVS6ZXXBWk8MP6473ETK2WlJloKCTGzjwCX
 wCqWS2Y9wEm9HsXpp5Ndq3Gml5jerRG2o6txwnsHsUCXj1TNv0FVSazhhLMQg01Zknv6
 O/6uU3jOxgl8319TThLajZkuzej2cYWAxvPCUiJrs3zAtbaLvOgkhbtSlVnD0RFAonYa
 SiLBKrWU0JdP2LoLQmgxYpg8jVZxLgjeAmbpUbCvO/oogd7cw9KyIr1TD4XeHIBQpsCB
 l5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Iyk4Q0srfe64j+vmZDIe+kCMfIqD4kV5Ou7J+0oKXUs=;
 b=Go/boHY01gmPoX9ur+pG1qmd4+rs6A/wvEhaamKvDCtmkmqd1kkxj7nC1L48Q8/NAm
 2nvTBCR6kwhbs2Xkl8hZKvn7BAkliAyLIC4sW3+AQa6FpBKXZ7dc5NL5a4WaC4lxUvgz
 Tc7tT++xYnSqoYIObVzasjDA69UJq5Bxa4sbPo8PvmWdlGrK73TF6eNyVWlIxnUmIra3
 GrALDnYPCduqyfAYvuDdnIuiUEXQF4MT6X9I0y7m5XeduFPOUDt8RcCm0s7Oa7ahWMrI
 M3MZyoskA/eoAMeP//AUAjL5zkCw6w2aYB4P/jpa9dsYtjHpwkURKoSy76bRTXIKk4jy
 Elng==
X-Gm-Message-State: AOAM533jbLBn4s3bg7WOWuR8JwBFsWwc81P0ycpN/kx8cLZqc9bYTCik
 8O+VnOrDGXOyQCRkkAt5q8yUO5m3X8ueWqoKD8rNng==
X-Google-Smtp-Source: ABdhPJyeIxmZjXTMqvqkwI1zFNGzysnPV/5iyj+yCne0IHh3Wxpg9mn/q2OqR7d7i3I7zLX8laeF0lROMm6gNUpELGY=
X-Received: by 2002:a1c:c30a:: with SMTP id t10mr4084347wmf.183.1605788877724; 
 Thu, 19 Nov 2020 04:27:57 -0800 (PST)
MIME-Version: 1.0
References: <20201119092012.759575-1-maxime@cerno.tech>
In-Reply-To: <20201119092012.759575-1-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 19 Nov 2020 12:27:39 +0000
Message-ID: <CAPY8ntDar41CB8rA3oWZFV5Rpna=SQtx6c-O56uX9J4-u2j90A@mail.gmail.com>
Subject: Re: [PATCH] drm/vc4: hdmi: Don't poll for the infoframes status on
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

On Thu, 19 Nov 2020 at 09:20, Maxime Ripard <maxime@cerno.tech> wrote:
>
> The infoframes are sent at a regular interval as a data island packet,
> so we don't need to wait for them to be sent when we're setting them up.
>
> However, we do need to poll when we're disabling since the we can't
> update the packet RAM until it has been sent.
>
> Let's add a boolean flag to tell whether we want to poll or not to
> support both cases.
>
> Suggested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 285c871b02fb..e1bbdba646db 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -265,7 +265,8 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
>  }
>
>  static int vc4_hdmi_stop_packet(struct drm_encoder *encoder,
> -                               enum hdmi_infoframe_type type)
> +                               enum hdmi_infoframe_type type,
> +                               bool poll)
>  {
>         struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
>         u32 packet_id = type - 0x80;
> @@ -273,6 +274,9 @@ static int vc4_hdmi_stop_packet(struct drm_encoder *encoder,
>         HDMI_WRITE(HDMI_RAM_PACKET_CONFIG,
>                    HDMI_READ(HDMI_RAM_PACKET_CONFIG) & ~BIT(packet_id));
>
> +       if (!poll)
> +               return 0;
> +
>         return wait_for(!(HDMI_READ(HDMI_RAM_PACKET_STATUS) &
>                           BIT(packet_id)), 100);
>  }
> @@ -299,7 +303,7 @@ static void vc4_hdmi_write_infoframe(struct drm_encoder *encoder,
>         if (len < 0)
>                 return;
>
> -       ret = vc4_hdmi_stop_packet(encoder, frame->any.type);
> +       ret = vc4_hdmi_stop_packet(encoder, frame->any.type, false);

Have we got the poll flags the right way up here?
When updating we must wait before updating the ram packet registers,
which means we want to wait, so doesn't poll want to be true here?

In vc4_hdmi_audio_reset where we're just stopping the audio we don't
care about waiting, so poll can be false.

  Dave

>         if (ret) {
>                 DRM_ERROR("Failed to wait for infoframe to go idle: %d\n", ret);
>                 return;
> @@ -1055,7 +1059,7 @@ static void vc4_hdmi_audio_reset(struct vc4_hdmi *vc4_hdmi)
>         int ret;
>
>         vc4_hdmi->audio.streaming = false;
> -       ret = vc4_hdmi_stop_packet(encoder, HDMI_INFOFRAME_TYPE_AUDIO);
> +       ret = vc4_hdmi_stop_packet(encoder, HDMI_INFOFRAME_TYPE_AUDIO, true);
>         if (ret)
>                 dev_err(dev, "Failed to stop audio infoframe: %d\n", ret);
>
> --
> 2.28.0
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
