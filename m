Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6336FE83B
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 01:55:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CDEE10E4D4;
	Wed, 10 May 2023 23:55:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 541E510E576
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 23:55:07 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2ac770a99e2so86150291fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 16:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1683762905; x=1686354905;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=JRRc5cm+lCLNt6NOuK+2g/udHPs4KH+MR08zITk0G8k=;
 b=GcZWgxYpW7D7TQ25NGRi8UVNcYFhDxTezpuQz2+jDUN3kgPcpuhHcQ86bH015UyjH8
 WE3BIIrs63T84n9kHPnLnt//L/bH0qHE77RFh40FBoahN3MaCWcVl5lmm5EU44sA6Omb
 yznQlBDdLXTLW6T/DkCjG+gQ5ibfPTlyGRh5Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683762905; x=1686354905;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JRRc5cm+lCLNt6NOuK+2g/udHPs4KH+MR08zITk0G8k=;
 b=hOn5fChr29zdT9wRgBvlOD8TmJsdJ7q8574oHCkCmN3LSevhGmakA5kz9WdKDJIS9b
 mlE0ORN39jePIB2OuQ/xlyv5NbTKpltznXknP3ajqed0hAMy5Qy0dZ1hIsY/yX7BfYCw
 cZuGFmFcjYYFk6lxqMR+eCUBQrzDrcMOPzCl9J/ulpvAn2EOJmC4G/GkQ6qll3oelAny
 1B1EAxEtkbcbCFj+1wbHFDjbHVvyX17LKQ3WInU2iZkgbs7pcjW/kk37G/ysZu3C6qpC
 jQ48Gug2QeE724QtgheXUBFFYNxAema+ZmosvLVMgaYncoUofYPG9O1wYGYSemxyJfCw
 rJ4w==
X-Gm-Message-State: AC+VfDzfXBZKgOjxunpaXPjA2syksl6etU3R88rAt3PfDfU5eJVrm8Eu
 fvOuKu/3wRvNaCtp+aHxRdFrWmgOjr0W++55YGfqzQ==
X-Google-Smtp-Source: ACHHUZ5iG+hjc6hPNOrzZ6MpilUrmK/xoSTR9Gpwz3JcxwOsCgl2+ZGXH4pujnW/iMjOt8Ju9di/kAYkG/rM61cEpnE=
X-Received: by 2002:a2e:80d1:0:b0:2ad:bedc:9961 with SMTP id
 r17-20020a2e80d1000000b002adbedc9961mr343846ljg.24.1683762904897; Wed, 10 May
 2023 16:55:04 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 10 May 2023 16:55:04 -0700
MIME-Version: 1.0
In-Reply-To: <1683750665-8764-2-git-send-email-quic_khsieh@quicinc.com>
References: <1683750665-8764-1-git-send-email-quic_khsieh@quicinc.com>
 <1683750665-8764-2-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 10 May 2023 16:55:04 -0700
Message-ID: <CAE-0n53ywhgFhJXA9krBo-Ds6ezM0K8n6w0xnVZj+sTJ4qt9cA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] drm/msm/dp: enable HDP plugin/unplugged interrupts
 to hpd_enable/disable
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
 airlied@gmail.com, 
 andersson@kernel.org, daniel@ffwll.ch, dianders@chromium.org, 
 dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
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
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2023-05-10 13:31:04)
> The internal_hpd flag was introduced to handle external DP HPD derived from GPIO
> pinmuxed into DP controller.

Was it? It looks more like it was done to differentiate between eDP and
DP, because internal_hpd is set only if DRM_BRIDGE_OP_HPD is set on the
bridge and we only set the bridge op if the connector type is DP. The
assumption looks like if you have DP connector_type, you have the gpio
pinmuxed for "dp_hot" mode, which isn't exactly true. We don't treat
that gpio as an irq either, because it isn't. Instead the gpio is muxed
to the mdss inside the SoC and then that generates an mdss interrupt
that's combined with non-HPD things like "video ready".

If that all follows, then I don't quite understand why we're setting
internal_hpd to false at all at runtime. It should be set to true at
some point, but ideally that point is during probe.

> HPD plug/unplug interrupts cannot be enabled until
> internal_hpd flag is set to true.
> At both bootup and resume time, the DP driver will enable external DP
> plugin interrupts and handle plugin interrupt accordingly. Unfortunately
> dp_bridge_hpd_enable() bridge ops function was called to set internal_hpd
> flag to true later than where DP driver expected during bootup time.
>
> This causes external DP plugin event to not get detected and display stays blank.
> Move enabling HDP plugin/unplugged interrupts to dp_bridge_hpd_enable()/disable() to
> set internal_hpd to true along with enabling HPD plugin/unplugged interrupts
> simultaneously to avoid timing issue during bootup and resume.
>
> Fixes: cd198caddea7 ("drm/msm/dp: Rely on hpd_enable/disable callbacks")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 27 ++++++++++++++-------------
>  1 file changed, 14 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 3e13acdf..71aa944 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1801,15 +1788,29 @@ void dp_bridge_hpd_enable(struct drm_bridge *bridge)
>  {
>         struct msm_dp_bridge *dp_bridge = to_dp_bridge(bridge);
>         struct msm_dp *dp_display = dp_bridge->dp_display;
> +       struct dp_display_private *dp;
> +
> +       dp = container_of(dp_display, struct dp_display_private, dp_display);
>
>         dp_display->internal_hpd = true;

Can we set internal_hpd to true during probe when we see that the hpd
pinmux exists? Or do any of these bits toggle in the irq status register
when the gpio isn't muxed to "dp_hot" or the controller is for eDP and
it doesn't have any gpio connection internally? I'm wondering if we can
get by with simply enabling the "dp_hot" pin interrupts
(plug/unplug/replug/irq_hpd) unconditionally and not worrying about them
if eDP is there (because the pin doesn't exist inside the SoC), or if DP
HPD is being signalled out of band through type-c framework.
