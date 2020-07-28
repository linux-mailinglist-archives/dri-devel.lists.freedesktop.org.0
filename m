Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C47D23071D
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 11:57:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B33898C6;
	Tue, 28 Jul 2020 09:57:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E6FF898C6
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 09:57:53 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id k20so9899147wmi.5
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 02:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ks8UK+swNcNUZbdDaIUKC9qqYkJwhk2Hx4F+3k63Chc=;
 b=Y+eu+sJpGrYgH0mNN9toTGBx4G+NLxhEKfQIa4YPWE9Fd/atwdD+iJJikuHVaIHjL4
 3vk2oxVwl5RQUpNKIRuE/87Or4aYXeoQr8IyGX80HVFFd61KmjtdknAn43o5pWlwZHp1
 4e/00mRCtYK2D8ZLZENbnUNNVXC408M+T5qZ0ShDKqRiV6Z4vwMKE6GaRLWHVj1T2aue
 /7jar28q9F8VESrnHUMk/cuuwb9K4PLomAM485ObbD3TawJfauU/SYofr9qP13cfQa3d
 pyTWRIEE8iAeg4NkK1/JVH9L0GtaQhmjU9fz53HaO4u9q53Rl+zmbEE2MfxKUvxQN7zN
 RGvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ks8UK+swNcNUZbdDaIUKC9qqYkJwhk2Hx4F+3k63Chc=;
 b=oFXDF5cvbGcDGaWQL3ImhJBaOndpPQ+63hmlJ0CTyEF2xzcHRz873y7Jv79f7MBkOQ
 b6Md1KaHO2i+SsICtXOz5Ri9eJgaKpc0I09dJZG17YfegMMKnZoCdVryMi+eSIbzoJ8G
 S6zfnJuMF1+Gc40u+vyRROYMQSCivrdgfEb3WkvfebP1K0Cfvox0TAChRaeKEj9Fg8yL
 pdjxW5d2rF3VxSeu99WWtQ/SObWvI/PCmlQO1wL9aeGQqWrmo3XdhVAQYUyhUlyGVel1
 cE3RLnGckSIxXMBKcOBBV4m+YCFWanrWLjR+aXfvONMIcdT81XuJVWGAaVnRaZ7AXss2
 qiSA==
X-Gm-Message-State: AOAM532C6FaroHigBA8bsUcUgcsOOvg8+5jzMFyXzTneWvR5tkp7NnDZ
 J1dehXkCzK67CGhDY+3Go+7p3gtwg5l0yUEUzQadZw==
X-Google-Smtp-Source: ABdhPJxwfcIK2fQs0g2jKCS8hE3C6ccmau1/i/vXjqKRFYo645xAz7b+rg+SQXC96rwUdrq9N1R3enHanZ7N1/hbo00=
X-Received: by 2002:a1c:1d52:: with SMTP id d79mr754429wmd.82.1595930272348;
 Tue, 28 Jul 2020 02:57:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
 <3d00592745e9559b754e84ffc74b4a727b82e8ab.1594230107.git-series.maxime@cerno.tech>
In-Reply-To: <3d00592745e9559b754e84ffc74b4a727b82e8ab.1594230107.git-series.maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 28 Jul 2020 10:57:36 +0100
Message-ID: <CAPY8ntDbEYD8swL7Tg=YnZWgHOxxdRFUMth-Ha-sGB-gNnc=+A@mail.gmail.com>
Subject: Re: [PATCH v4 12/78] drm/vc4: crtc: Enable and disable the PV in
 atomic_enable / disable
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

On Wed, 8 Jul 2020 at 18:42, Maxime Ripard <maxime@cerno.tech> wrote:
>
> The VIDEN bit in the pixelvalve currently being used to enable or disable
> the pixelvalve seems to not be enough in some situations, which whill end
> up with the pixelvalve stalling.
>
> In such a case, even re-enabling VIDEN doesn't bring it back and we need to
> clear the FIFO. This can only be done if the pixelvalve is disabled though.
>
> In order to overcome this, we can configure the pixelvalve during
> mode_set_no_fb, but only enable it in atomic_enable and flush the FIFO
> there, and in atomic_disable disable the pixelvalve again.

Very minor nitpick: the configure is in vc4_crtc_config_pv, but that
is called from mode_set_no_fb. The comment is correct from a DRM
overview perspective, but not from the actual code. Describing the DRM
call is probably the better approach, but it looks odd when compared
to the code.

> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_crtc.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
> index cdeaa0cd981f..fe2e5675aed4 100644
> --- a/drivers/gpu/drm/vc4/vc4_crtc.c
> +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
> @@ -332,9 +332,7 @@ static void vc4_crtc_config_pv(struct drm_crtc *crtc)
>                    PV_CONTROL_TRIGGER_UNDERFLOW |
>                    PV_CONTROL_WAIT_HSTART |
>                    VC4_SET_FIELD(vc4_encoder->clock_select,
> -                                PV_CONTROL_CLK_SELECT) |
> -                  PV_CONTROL_FIFO_CLR |
> -                  PV_CONTROL_EN);
> +                                PV_CONTROL_CLK_SELECT));
>  }
>
>  static void vc4_crtc_mode_set_nofb(struct drm_crtc *crtc)
> @@ -386,6 +384,8 @@ static void vc4_crtc_atomic_disable(struct drm_crtc *crtc,
>         ret = wait_for(!(CRTC_READ(PV_V_CONTROL) & PV_VCONTROL_VIDEN), 1);
>         WARN_ONCE(ret, "Timeout waiting for !PV_VCONTROL_VIDEN\n");
>
> +       CRTC_WRITE(PV_CONTROL, CRTC_READ(PV_CONTROL) & ~PV_CONTROL_EN);
> +
>         vc4_hvs_atomic_disable(crtc, old_state);
>
>         /*
> @@ -410,6 +410,10 @@ static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
>
>         require_hvs_enabled(dev);
>
> +       /* Reset the PV fifo. */
> +       CRTC_WRITE(PV_CONTROL, CRTC_READ(PV_CONTROL) |
> +                  PV_CONTROL_FIFO_CLR | PV_CONTROL_EN);
> +
>         /* Enable vblank irq handling before crtc is started otherwise
>          * drm_crtc_get_vblank() fails in vc4_crtc_update_dlist().
>          */
> --
> git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
