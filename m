Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 240912307C8
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 12:38:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E1B489FA9;
	Tue, 28 Jul 2020 10:38:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BA4189FA9
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 10:38:44 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id g10so15257509wmc.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 03:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DRhCSmIwi420CrkXUO97I66VCQgr7S8ldVnLi+5FGbg=;
 b=ch9uv/BUJSu3oSt8k3ciCSYlMfuMBNGz6xnHGp7pe0JFdEOFJ4ONqGzURQRAVpZQ1j
 FpQuHTgSEqbQq93FZtOKunxuGNo5G93RAsJhiHdV53vHprAEkGR5j7f7MOkYEj3AE6/L
 F/Xmr7t+LMIJH+1FxKTk3VVDE1kZsnSHmLc/iwzXGpb3jFjkXVD83X43M3+SS1oXMZwe
 d95QywpZiGc1PhTdgVi1tXmGewQLRDgVNtCxvXTL4iW2P7US1j5HQWyuFUSO0yud6p5o
 sOa01w7Ly9jiTvl/9YTMcWdEM9F5NImbBJmv/sqK0/gHMfWTTX5K3lttaLayQLF9zVL5
 J/+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DRhCSmIwi420CrkXUO97I66VCQgr7S8ldVnLi+5FGbg=;
 b=Po9ByKE2EHRAQqSu9S+DBsM/oxhvUN3DAui2j4NiptnbSr1YHBKZf2xjzKTooQ7Kgc
 ijYuPe21x681szuc1fgCWCo2sj5xzYTuaLBWdst02vAkEFAkPCWVp9c0iQohU3RYxxjl
 t9SQrw3ujB2FUFqfQfYqGs4LR3BllLko6PO9D/Gyl5v8zivlAgJO4dVg6umi61bvDdRM
 hBFOQEuBL+mmWlRZU11jb74uaRjazChWBJKO6wFfeZSaNlDNie8uBnQTSmIFmvYCDwJ7
 s6eDx4bBaz75uWcBTaTpLEAeAVUuukfGeZ8vD64i1FIZAD8LcS88HJmPuk3dN8JaHYNq
 VgAA==
X-Gm-Message-State: AOAM530BVC50Cee3i8ky4VtF1ljo5iPG1Jzq3FeXfLDLLnwNwOWESPgf
 DW4oZJfpb0qe+7triKCj5ywTc7Sl3YGzHe+fCMNCXw==
X-Google-Smtp-Source: ABdhPJzMVUhIJzulRUVqA+fy1eEAHCtDW22IaZs5ZYJ9cfXiVcLmQKRVShFpKgdv8QsgsKC0gB+rAu5IHXaapNAg1r8=
X-Received: by 2002:a7b:cf18:: with SMTP id l24mr3417030wmg.116.1595932723328; 
 Tue, 28 Jul 2020 03:38:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
 <8bfc2e06f1c2a1f01151880e62e816b3ee629a75.1594230107.git-series.maxime@cerno.tech>
In-Reply-To: <8bfc2e06f1c2a1f01151880e62e816b3ee629a75.1594230107.git-series.maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 28 Jul 2020 11:38:26 +0100
Message-ID: <CAPY8ntBhc1VGj8tJhX6c1JjB8mcu8YfL3=T_8HyFgyznyi+bPA@mail.gmail.com>
Subject: Re: [PATCH v4 25/78] drm/vc4: crtc: Remove mode_set_nofb
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

On Wed, 8 Jul 2020 at 18:43, Maxime Ripard <maxime@cerno.tech> wrote:
>
> On BCM2711 to avoid stale pixels getting stuck in intermediate FIFOs, the
> pixelvalve needs to be setup each time there's a mode change or enable /
> disable sequence.
>
> Therefore, we can't really use mode_set_nofb anymore to configure it, but
> we need to move it to atomic_enable.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_crtc.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
> index 284a85b9d7d4..2eda2e6429ec 100644
> --- a/drivers/gpu/drm/vc4/vc4_crtc.c
> +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
> @@ -376,11 +376,6 @@ static void vc4_crtc_config_pv(struct drm_crtc *crtc)
>         }
>  }
>
> -static void vc4_crtc_mode_set_nofb(struct drm_crtc *crtc)
> -{
> -       vc4_crtc_config_pv(crtc);
> -}
> -
>  static void require_hvs_enabled(struct drm_device *dev)
>  {
>         struct vc4_dev *vc4 = to_vc4_dev(dev);
> @@ -433,6 +428,7 @@ static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
>         require_hvs_enabled(dev);
>
>         vc4_crtc_pixelvalve_reset(crtc);
> +       vc4_crtc_config_pv(crtc);
>
>         CRTC_WRITE(PV_CONTROL, CRTC_READ(PV_CONTROL) | PV_CONTROL_EN);
>
> @@ -791,7 +787,6 @@ static const struct drm_crtc_funcs vc4_crtc_funcs = {
>  };
>
>  static const struct drm_crtc_helper_funcs vc4_crtc_helper_funcs = {
> -       .mode_set_nofb = vc4_crtc_mode_set_nofb,
>         .mode_valid = vc4_crtc_mode_valid,
>         .atomic_check = vc4_crtc_atomic_check,
>         .atomic_flush = vc4_hvs_atomic_flush,
> --
> git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
