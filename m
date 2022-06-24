Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E0E558C1E
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 02:09:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D793D10F17C;
	Fri, 24 Jun 2022 00:09:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0E7710E862
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 00:09:48 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 l9-20020a056830268900b006054381dd35so714488otu.4
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 17:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=tNICjC0mqZ74g4NWx01ZNVZ2tkGnF23qOG9pMURoZhI=;
 b=keigWUEC4et/ph4vYev3R+C43rBbm6avYfx1ICG8YUlMjI17zFbQ2NqdKaLjP20MgD
 03TUpRIu3LgOXZ1LnijQy9VU1OpjjuxDho5zFrbATU/RB9F/5S2AJ9Z0bf26Xo+1ooT0
 XGnZvujpKw3kMWwkNxBRfcYiO47Af/Ydzdzyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=tNICjC0mqZ74g4NWx01ZNVZ2tkGnF23qOG9pMURoZhI=;
 b=RC3MCxchKMmJwxGtpCKpeVEVzVuGfusaDLeStg5PdvgeyX4GqDziC6OK8tvj1bXj0z
 F/YkWP4XQbHIxNVGNb8RAMLCZNZz7CzsdRTV3P9FLpGv8Bb6jtawm+az8Qqavq1H/XjL
 FSSjVvmYNRPGsGR3WIvC6KmZGyQH7lBh83Rc8UOH6fh+7CigAvCiQ/9D24WZTVPTQ2Le
 K3Wfd2A9zabjkDO1vgoxUNLnk6EB/yyaEs5CgGmopKu5Fjj3U3WoMWHzY6GOzg154yms
 ka3GRu+5dUfNXuF2DH32bGzCTqkGLxku+Jy/3V9M3LPFhxCdOgSdw2oT52uhZgSUb8L1
 pTig==
X-Gm-Message-State: AJIora+cieQl+3yqAyh/92StAa6bOKSD1WPOwRTTu/xQIDm6MCFe+Lmq
 yFm800Rsy/X9/trvXPZ39ZSFFMCYKepBIhxAxj5a0Q==
X-Google-Smtp-Source: AGRyM1toYtnlSvt/KriWql1qkmbYZ0fd3ZbL7W+3GyjF+TFTpfJIy6lNOXNS1wd+UjrciaaVGHz2lZIw6TxPwoIv6+Y=
X-Received: by 2002:a9d:729b:0:b0:60c:21bd:97c0 with SMTP id
 t27-20020a9d729b000000b0060c21bd97c0mr4954986otj.77.1656029388070; Thu, 23
 Jun 2022 17:09:48 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 23 Jun 2022 17:09:47 -0700
MIME-Version: 1.0
In-Reply-To: <1656027256-6552-1-git-send-email-quic_khsieh@quicinc.com>
References: <1656027256-6552-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 23 Jun 2022 17:09:47 -0700
Message-ID: <CAE-0n534jvnjX5TShZw7CB9Cu9F7yowhwUosNkJE8t_R4xHYOw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: no dp_hpd_unplug_handle() required for eDP
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dianders@chromium.org, 
 dmitry.baryshkov@linaro.org, robdclark@gmail.com, sean@poorly.run, 
 vkoul@kernel.org
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-06-23 16:34:16)
> eDP implementation does not reuried to support hpd signal. Therefore

s/reuried/require/

> it only has either ST_DISPLAY_OFF or ST_CONNECTED state during normal
> operation. This patch remove unnecessary dp_hpd_unplug_handle() for
> eDP but still keep dp_hpd_plug_handle() to support eDP to either
> booting up or resume from ST_DISCONNECTED state.

I take it that making this change also fixes a glitch seen on the eDP
panel when a second modeset happens? Can you add that detail to the
commit text? The way it reads makes it sound like this is purely a
cleanup patch, but then there's a Fixes tag so it must be a bug fix or
worthy optimization, neither of which is described.

>
> Fixes: 391c96ff0555 ("drm/msm/dp: Support only IRQ_HPD and REPLUG interrupts for eDP")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index da5c03a..ef9794e 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1666,7 +1666,7 @@ void dp_bridge_enable(struct drm_bridge *drm_bridge)
>                 return;
>         }
>
> -       if (dp->is_edp)
> +       if (dp->is_edp && dp_display->hpd_state == ST_DISCONNECTED)
>                 dp_hpd_plug_handle(dp_display, 0);
>
>         mutex_lock(&dp_display->event_mutex);
> @@ -1737,9 +1737,6 @@ void dp_bridge_post_disable(struct drm_bridge *drm_bridge)
>
>         dp_display = container_of(dp, struct dp_display_private, dp_display);
>
> -       if (dp->is_edp)
> -               dp_hpd_unplug_handle(dp_display, 0);

dp_hpd_unplug_handle() has a !edp check, and from what I can tell after
this patch that condition will always trigger? But then I wonder why we
aren't masking the irqs for hpd when the eDP display is disabled.
Shouldn't we at least be doing that so that we don't get spurious hpd
irqs when the eDP display is off or on the path to suspend where I
suspect the power may be removed from the panel?
