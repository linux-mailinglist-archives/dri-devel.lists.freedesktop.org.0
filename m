Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C74C6FEA98
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 06:25:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 193D010E132;
	Thu, 11 May 2023 04:25:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C3FA10E132
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 04:24:59 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-55dc3431c64so55124817b3.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 21:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683779098; x=1686371098;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/v2o7ls49FnTnTNSJ27Au9c+VtD4sCvSY3ybyCd3Lu4=;
 b=eeoHYknxcbkwnZ8hCDz5gx3bxiNnFWDoqIrWCnVvlkhs1ChmzC/QFUaADCNbaB33r5
 YYay2YbuUdE/rOpgls5gdSuILzj7Z5xrZVLAn4Ddv5p0c7RNOrcPaTEouqTA9Ji0zm2d
 bO8NpVGGpynQZoQ+RhkmECgBcULnw56nAe/GpC90ihzWCrNDSC7HGnJlV4rgU7qVNyl0
 PE9RSA32tMxSUuex+2pJW7+th10Ic+alw0EbNsVk3T3dNiSE5OaSyCS48qAm9jcathJs
 urhmLkOyzJKWkGBlduFQa2vJkJbe9GSrw5NOsXm59XFh63TFMahlbiZvtrRd5NyL0reH
 HKrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683779098; x=1686371098;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/v2o7ls49FnTnTNSJ27Au9c+VtD4sCvSY3ybyCd3Lu4=;
 b=gBBS87n55QNDuRWYcB+KKZAez3jjvhbxgeuXgNgbefRx/ttVX+wPHXU7k0YlhiCzDc
 J30tI7/Pyalx5Yp8If0Bct6UsLy8ML4CV80tRbLIsf48iY+oLxL0E2zPHYtVEI6ngK77
 RdexahtykgMVDHdZDMzJZB5osptDgWMjxfBhrqrqt3tcoGwftr1yQwDw1F04N4modRfp
 rYS693HGg6e/rP5Bmud7qbu8nmM4m8XOH0w5PiDso1CBQuTN5n1VYzVr0FPWEuCpfeJ+
 DqZwjG4RSobB311u3F/pRrEsid0fLoRFV/knCdwfkVZ4rHQo22/byG8uH2v7iHujzz44
 xL9Q==
X-Gm-Message-State: AC+VfDySS0fs/yjzlyFqk4XgyhICaoNKZNfJxM4s8pPtgytE2EgLaLlo
 nZXIeuku4rOqMhUlCYgSZ7/Cc+7RQpouaFynk/mFrA==
X-Google-Smtp-Source: ACHHUZ5YPRsRTB4EFvjVvnrsLjLx81YxmyrhC4nDgSg6xkcXRaIxM7G1YQLDOL1yvSDdHH63eEjtmu6kAdtiFZtGv/Q=
X-Received: by 2002:a0d:d401:0:b0:55a:a9b6:6da with SMTP id
 w1-20020a0dd401000000b0055aa9b606damr21168227ywd.11.1683779097885; Wed, 10
 May 2023 21:24:57 -0700 (PDT)
MIME-Version: 1.0
References: <1683750665-8764-1-git-send-email-quic_khsieh@quicinc.com>
 <1683750665-8764-2-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1683750665-8764-2-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 11 May 2023 07:24:46 +0300
Message-ID: <CAA8EJprtQF0x_LCOTrt5bvRnJ+xRz6QxLF6QAP-4Pff6V5TJ2g@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] drm/msm/dp: enable HDP plugin/unplugged interrupts
 to hpd_enable/disable
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com, andersson@kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 swboyd@chromium.org, sean@poorly.run, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 10 May 2023 at 23:31, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> The internal_hpd flag was introduced to handle external DP HPD derived from GPIO
> pinmuxed into DP controller. HPD plug/unplug interrupts cannot be enabled until
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

Thanks for debugging this!

However after looking at the driver I think there is more than this.

We have several other places gated on internal_hpd flag, where we do
not have a strict ordering of events.
I see that dp_hpd_plug_handle() and dp_hpd_unplug_handle() also toggle
DP_DP_IRQ_HPD_INT_MASK and DP_DP_HPD_REPLUG_INT_MASK depending on
internal_hpd. Can we toggle all 4 interrupts from the
hpd_enable/hpd_disable functions? If we can do it, then I think we can
drop the internal_hpd flag completely.

I went on and checked other places where it is used:
- dp_hpd_unplug_handle(), guarding DP_DP_HPD_PLUG_INT_MASK toggling. I
think we can drop these two calls completely. The function is under
the event_mutex protection, so other events can not interfere.
- dp_bridge_hpd_notify(). What is the point of this check? If some
other party informs us of the HPD event, we'd better handle it instead
of dropping it. Correct?  In other words, I'd prefer seeing the
hpd_event_thread removal. Instead of that I think that on
HPD/plug/unplug/etc. IRQ the driver should call into the drm stack,
then the hpd_notify call should process those events.


> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 27 ++++++++++++++-------------
>  1 file changed, 14 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 3e13acdf..71aa944 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1088,13 +1088,6 @@ static void dp_display_config_hpd(struct dp_display_private *dp)
>         dp_display_host_init(dp);
>         dp_catalog_ctrl_hpd_config(dp->catalog);
>
> -       /* Enable plug and unplug interrupts only if requested */
> -       if (dp->dp_display.internal_hpd)
> -               dp_catalog_hpd_config_intr(dp->catalog,
> -                               DP_DP_HPD_PLUG_INT_MASK |
> -                               DP_DP_HPD_UNPLUG_INT_MASK,
> -                               true);
> -
>         /* Enable interrupt first time
>          * we are leaving dp clocks on during disconnect
>          * and never disable interrupt
> @@ -1396,12 +1389,6 @@ static int dp_pm_resume(struct device *dev)
>
>         dp_catalog_ctrl_hpd_config(dp->catalog);
>
> -       if (dp->dp_display.internal_hpd)
> -               dp_catalog_hpd_config_intr(dp->catalog,
> -                               DP_DP_HPD_PLUG_INT_MASK |
> -                               DP_DP_HPD_UNPLUG_INT_MASK,
> -                               true);
> -
>         if (dp_catalog_link_is_connected(dp->catalog)) {
>                 /*
>                  * set sink to normal operation mode -- D0
> @@ -1801,15 +1788,29 @@ void dp_bridge_hpd_enable(struct drm_bridge *bridge)
>  {
>         struct msm_dp_bridge *dp_bridge = to_dp_bridge(bridge);
>         struct msm_dp *dp_display = dp_bridge->dp_display;
> +       struct dp_display_private *dp;
> +
> +       dp = container_of(dp_display, struct dp_display_private, dp_display);
>
>         dp_display->internal_hpd = true;
> +       dp_catalog_hpd_config_intr(dp->catalog,
> +                               DP_DP_HPD_PLUG_INT_MASK |
> +                               DP_DP_HPD_UNPLUG_INT_MASK,
> +                               true);
>  }
>
>  void dp_bridge_hpd_disable(struct drm_bridge *bridge)
>  {
>         struct msm_dp_bridge *dp_bridge = to_dp_bridge(bridge);
>         struct msm_dp *dp_display = dp_bridge->dp_display;
> +       struct dp_display_private *dp;
> +
> +       dp = container_of(dp_display, struct dp_display_private, dp_display);
>
> +       dp_catalog_hpd_config_intr(dp->catalog,
> +                               DP_DP_HPD_PLUG_INT_MASK |
> +                               DP_DP_HPD_UNPLUG_INT_MASK,
> +                               false);
>         dp_display->internal_hpd = false;
>  }

--
With best wishes
Dmitry
