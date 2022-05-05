Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC26751CA5F
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 22:13:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE6EB10F262;
	Thu,  5 May 2022 20:13:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9114610F238
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 20:13:13 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-2f7bb893309so60864167b3.12
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 13:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hVqW2r817uPdyNOCQzeSiykNQjBLZlqnmk0ukNpPY5o=;
 b=E5wY6c/SFZLim2rQeH/a8VUk6EdKPIBUURuTtKw7BHXP1jFDY5UIAzlTQtI1qVbWwp
 1TtneR4ofbLPzOV23mcuTHYzkt2UxGZFrIyEfzQP41pBl25bvny2a3m38v2RaLFUwwkR
 P/Xj3JtZfXn0w8YIHqoTVF6tspAscE7PylOsrrZhOT6KM6FnjR0g9RXsWFndASM8mwJh
 pJ1nT0qM9ym9SnCWi0+OHpK1O8zAFr5o4Yslyy9xKLWVTK0Iv31JWSH7fcEkUYBIWfAK
 6YI2jKFEh0PFBl1iJ0MfeRz8pv3oCxULbpVVIhDiQZ8KLIvrBwmcUmzQoQzy+EjjVzxZ
 chCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hVqW2r817uPdyNOCQzeSiykNQjBLZlqnmk0ukNpPY5o=;
 b=UAkhnkAveChd2yWDxXaQFPdPGM5GMx/h8kmHz3eJedekdtndkOVtnqXyyTu8DVqv++
 +ZsRg/yy/SniuLWdma9ZC2VHS7tcNFc4rq+nbytnMqJjDSjRXnX+9cTpwy7wI/W3Gigj
 SIn2djsYZJW0OA7MFNe7fRkhYiqLf/ddMDE8leaYtvfGlhuLwz6FEbNMuhXaT74Cqmch
 PA6VSGyVVEb5yb437HQsmPKgdCgqjpAVqUrmeGLXz201QrVDGRuqlRf7zLECtTXuRj7r
 ft5ItVi+vjcZUhS9IzghgX7NeakU1RP1nMBmiz/nF8Ujkyf5rHJIRA7A+9P6q4Q4xlIy
 ZDtQ==
X-Gm-Message-State: AOAM530aBaLRj0q1vmNmCyKDi2T8RKFqFJr80OKUFcZ66yGVxgberTLt
 mkKEmkCGdRR/O0C//dOPACcLJiwsdbBhDixMXS8gkkcVnco=
X-Google-Smtp-Source: ABdhPJxf6nt+/EPv5i5GoqZUPOyGE8JNHP3FJpP1Kj8fRbhVGGUVCIy2/Y2XWpd0NXo6ce1nLL2xuCYGi5cYN+Yb1zc=
X-Received: by 2002:a81:3252:0:b0:2f6:b826:2286 with SMTP id
 y79-20020a813252000000b002f6b8262286mr25248076ywy.289.1651781592767; Thu, 05
 May 2022 13:13:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220426114627.1.I2dd93486c6952bd52f2020904de0133970d11b29@changeid>
 <20220426114627.2.I4ac7f55aa446699f8c200a23c10463256f6f439f@changeid>
In-Reply-To: <20220426114627.2.I4ac7f55aa446699f8c200a23c10463256f6f439f@changeid>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 5 May 2022 23:13:01 +0300
Message-ID: <CAA8EJprWzJmVshrYCJXPnm9dFFCkyefOEo2z_cJdeiSj3zFaGA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/probe-helper: For DP, add 640x480 if all other
 modes are bad
To: Douglas Anderson <dianders@chromium.org>
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
Cc: quic_sbillaka@quicinc.com, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 quic_khsieh@quicinc.com, quic_aravindh@quicinc.com, swboyd@chromium.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 26 Apr 2022 at 21:47, Douglas Anderson <dianders@chromium.org> wrote:
>
> As per Displayport spec section 5.2.1.2 ("Video Timing Format") says
> that all detachable sinks shall support 640x480 @60Hz as a fail safe
> mode.
>
> A DP compliance test expected us to utilize the above fact when all
> modes it presented to the DP source were not achievable. It presented
> only modes that would be achievable with more lanes and/or higher
> speeds than we had available and expected that when we couldn't do
> that then we'd fall back to 640x480 even though it didn't advertise
> this size.
>
> In order to pass the compliance test (and also support any users who
> might fall into a similar situation with their display), we need to
> add 640x480 into the list of modes. However, we don't want to add
> 640x480 all the time. Despite the fact that the DP spec says all sinks
> _shall support_ 640x480, they're not guaranteed to support it
> _well_. Continuing to read the spec you can see that the display is
> not required to really treat 640x480 equal to all the other modes. It
> doesn't need to scale or anything--just display the pixels somehow for
> failsafe purposes. It should also be noted that it's not hard to find
> a display hooked up via DisplayPort that _doesn't_ support 640x480 at
> all. The HP ZR30w screen I'm sitting in front of has a native DP port
> and doesn't work at 640x480. I also plugged in a tiny 800x480 HDMI
> display via a DP to HDMI adapter and that screen definitely doesn't
> support 640x480.
>
> As a compromise solution, let's only add the 640x480 mode if:
> * We're on DP.
> * All other modes have been pruned.
>
> This acknowledges that 640x480 might not be the best mode to use but,
> since sinks are _supposed_ to support it, we will at least fall back
> to it if there's nothing else.
>
> Note that we _don't_ add higher resolution modes like 1024x768 in this
> case. We only add those modes for a failed EDID read where we have no
> idea what's going on. In the case where we've pruned all modes then
> instead we only want 640x480 which is the only defined "Fail Safe"
> resolution.
>
> This patch originated in response to Kuogee Hsieh's patch [1].
>
> [1] https://lore.kernel.org/r/1650671124-14030-1-git-send-email-quic_khsieh@quicinc.com
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>
>  drivers/gpu/drm/drm_probe_helper.c | 26 +++++++++++++++++++++-----
>  1 file changed, 21 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> index 819225629010..90cd46cbfec1 100644
> --- a/drivers/gpu/drm/drm_probe_helper.c
> +++ b/drivers/gpu/drm/drm_probe_helper.c
> @@ -476,7 +476,6 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
>         const struct drm_connector_helper_funcs *connector_funcs =
>                 connector->helper_private;
>         int count = 0, ret;
> -       bool verbose_prune = true;
>         enum drm_connector_status old_status;
>         struct drm_modeset_acquire_ctx ctx;
>
> @@ -556,8 +555,8 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
>                 DRM_DEBUG_KMS("[CONNECTOR:%d:%s] disconnected\n",
>                         connector->base.id, connector->name);
>                 drm_connector_update_edid_property(connector, NULL);
> -               verbose_prune = false;
> -               goto prune;
> +               drm_mode_prune_invalid(dev, &connector->modes, false);
> +               goto exit;
>         }
>
>         count = (*connector_funcs->get_modes)(connector);
> @@ -580,9 +579,26 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
>                 }
>         }
>
> -prune:
> -       drm_mode_prune_invalid(dev, &connector->modes, verbose_prune);
> +       drm_mode_prune_invalid(dev, &connector->modes, true);
>
> +       /*
> +        * Displayport spec section 5.2.1.2 ("Video Timing Format") says that
> +        * all detachable sinks shall support 640x480 @60Hz as a fail safe
> +        * mode. If all modes were pruned, perhaps because they need more
> +        * lanes or a higher pixel clock than available, at least try to add
> +        * in 640x480.
> +        */
> +       if (list_empty(&connector->modes) &&
> +           connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort) {
> +               count = drm_add_modes_noedid(connector, 640, 480);
> +               if (_drm_helper_update_and_validate(connector, maxX, maxY, &ctx)) {
> +                       drm_modeset_backoff(&ctx);
> +                       goto retry;
> +               }
> +               drm_mode_prune_invalid(dev, &connector->modes, true);
> +       }
> +
> +exit:
>         drm_modeset_drop_locks(&ctx);
>         drm_modeset_acquire_fini(&ctx);
>
> --
> 2.36.0.rc2.479.g8af0fa9b8e-goog
>


-- 
With best wishes
Dmitry
