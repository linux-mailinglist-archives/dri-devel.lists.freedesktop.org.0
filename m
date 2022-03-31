Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1604EDDAE
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 17:45:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD5A910F14D;
	Thu, 31 Mar 2022 15:45:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7203810E29E
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 15:45:22 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 o3-20020a17090a3d4300b001c6bc749227so4020735pjf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 08:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X7BYAwtNz1ujzU9vAA1t7++BamUguBLgzMylVVOW+AE=;
 b=b3ox7VFMmr5ZlKjrzkBVQz+HJNkdbPy1zCFXDq+YGSM3SnlF+uAddjPYRNiAt8ta4l
 Hx0OJX0VDROTxOhuDNpESYoOTAtiEwjjjF+lXB2xAgMZwQSJ0BM2Ujj9Kdvi2tlQtGAW
 HQvA0nedMIMSM247Pzyx4LbR6XctXrLoSAm0KKLHFFJWr2asQ+KV4BJ4uRab6Eoa6VNH
 6pXr6mhfsG6jqZiqR79EYcg9iW4tclVPj/vJcC8kfgIxyi4CG8cXs0+yuFcH1G9JFfvo
 0EUwnnE2lHeGia1x8WbPJSeYC4jZYV6CqZdYTeaj1lHUnSOuV3QTUUTHQ0TClJnm7ueP
 WkjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X7BYAwtNz1ujzU9vAA1t7++BamUguBLgzMylVVOW+AE=;
 b=k2eIvypdl70TwkHuBIfJEkkSiwhavZyZrtsMIisMqd73j4FDxR9hZo0HN4pgQ3bp9M
 bzbEglDf3mTtgR2+vt296iOL3vpoWEFj1ARhTYkfZJ5LLj9f7gIogrx3NaOP+MKy4A2H
 buAV8QmAsEWq3BP/hspYfCJCDOUWvQLCtRkRKaHP6FLrEveph3tBAlfAE/SN9zo2GENr
 w5/uz6KD9Wnc+4/1i26S/7pv+FLeq6aA+5vVl7Zg3Xq1QbMmFHzf/tvCfRjYmVXj/UZN
 zl7cqjomS1dgH2Q1fk+/8jf6wTFJqdAXCbCJEwB6krAHUeI+ATN/druXgJbf2klx3k8o
 xC6g==
X-Gm-Message-State: AOAM532LlLuzG0zoU0Lg5yJ41BSShamnfLIcDqSJo9GdrtVfezeo8quU
 PtJDTcMPyKXqXyroKlY7im6lmMTeT0FYUC0VkF/KeA==
X-Google-Smtp-Source: ABdhPJx3M8/zdIa6TYawPX2CsQYLFLyhkU2ryirYbgJaH83c3AJOX8EYnwmFWi1k4/2FgTFP5KJhsdlCQ2hzkEdXoD0=
X-Received: by 2002:a17:903:30c4:b0:153:c102:8b9a with SMTP id
 s4-20020a17090330c400b00153c1028b9amr41811511plc.21.1648741521999; Thu, 31
 Mar 2022 08:45:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220331153923.14314-1-marex@denx.de>
 <20220331153923.14314-2-marex@denx.de>
In-Reply-To: <20220331153923.14314-2-marex@denx.de>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 31 Mar 2022 17:45:11 +0200
Message-ID: <CAG3jFyvbY+Z_KnG39HqR6YQm_FHXy0_tNuoxnfCQcWtpK9SGtw@mail.gmail.com>
Subject: Re: [RESEND][PATCH 2/2] drm/bridge: lt9611: Add
 atomic_get_input_bus_fmts
To: Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 31 Mar 2022 at 17:39, Marek Vasut <marex@denx.de> wrote:
>
> Implement .atomic_get_input_bus_fmts callback, which sets up
> the input (scanout-engine-end) formats, so that those formats
> can then be used in pipeline format negotiation between this
> bridge and the scanout engine.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: John Stultz <john.stultz@linaro.org>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611.c | 27 +++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
> index 9b3ac3794a2c..7ef8fe5abc12 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -922,6 +922,32 @@ static void lt9611_bridge_hpd_enable(struct drm_bridge *bridge)
>         lt9611_enable_hpd_interrupts(lt9611);
>  }
>
> +#define MAX_INPUT_SEL_FORMATS  1
> +
> +static u32 *
> +lt9611_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> +                                struct drm_bridge_state *bridge_state,
> +                                struct drm_crtc_state *crtc_state,
> +                                struct drm_connector_state *conn_state,
> +                                u32 output_fmt,
> +                                unsigned int *num_input_fmts)
> +{
> +       u32 *input_fmts;
> +
> +       *num_input_fmts = 0;
> +
> +       input_fmts = kcalloc(MAX_INPUT_SEL_FORMATS, sizeof(*input_fmts),
> +                            GFP_KERNEL);
> +       if (!input_fmts)
> +               return NULL;
> +
> +       /* This is the DSI-end bus format */
> +       input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
> +       *num_input_fmts = 1;
> +
> +       return input_fmts;
> +}
> +
>  static const struct drm_bridge_funcs lt9611_bridge_funcs = {
>         .attach = lt9611_bridge_attach,
>         .mode_valid = lt9611_bridge_mode_valid,
> @@ -936,6 +962,7 @@ static const struct drm_bridge_funcs lt9611_bridge_funcs = {
>         .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
>         .atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
>         .atomic_reset = drm_atomic_helper_bridge_reset,
> +       .atomic_get_input_bus_fmts = lt9611_atomic_get_input_bus_fmts,
>  };
>
>  static int lt9611_parse_dt(struct device *dev,
> --
> 2.35.1
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
