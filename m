Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 768A72D4575
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 16:32:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4253A6EA93;
	Wed,  9 Dec 2020 15:32:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE6D06EA93
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 15:32:44 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id c198so1862711wmd.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Dec 2020 07:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A3ApD1r89IKCKBUQAIuYnlyNLwsHsGuGWTT6AA4L6A4=;
 b=KVMgKDv+lQoZ3+WHhJKMx5J8R08fixX8j/6XV0n7q0w/b9T9fG64W/Tqj0t5fPWgZD
 CME3tzqvIy2g0a6shrOsbSmQOi0yP6pbHtZyoZ7s35laiIDNQX8LeiKTcM0gHFMpcQCl
 Fs4zT66U52yEdkOxCEUFFaoIe4TGNDmE0Z9+5SuYKcQL0ZV45vnSxcZw4QgPlr4C25qW
 ca05r3O1LpRdwG4XaTKSdyEQ/GMQwEMgyDIB7FyCaplgFdOOQ1Qeb0oIW/GSiSzS+c6S
 qIFsp6jfTKpplCFY4Bs96LrchLr0yxjf7YgsRKEBRltoXtvM9mTZNn8BPYDV1EJh+a9Z
 R2yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A3ApD1r89IKCKBUQAIuYnlyNLwsHsGuGWTT6AA4L6A4=;
 b=M49Tow4ie+0Hk9mGcevMN+3UZFXz/4mJta2ZFI/nDUfiX6fTUKXUBmn8LcUj+Lb9yn
 Sc7CEdaxpY3Wqre+2HdV5HhvdYV80wDtPyVzqETnBCWT5yCcEqU5rOL1PNzRbdpI9fH9
 Bc6bqaO7oKNzrBkZP6g2LKrL5kywIHmZJBi0AO6fXgwkkrh6rQ1aZuyhfV8xTcTmGfgZ
 j5ZaIhGzCsRtnDyY0MZo9Js7pTLwjsEDDVAQ/RqoHcYg7Ad8AI0Q09x63ytggYqULVtT
 m8SjhU/LyMwej0XEB9vY5PypHNbNCPTn3bT4BsFyDZUYnFJl88znjJeF6SrxyeXZJuzC
 wixw==
X-Gm-Message-State: AOAM533oiwNe2ATQXsE0wKDmnf6iK7Ojwiv9S926TX8F12EUtkGdRS3Z
 mepUjQ3u40RDPqFTCdwYVfFLhpDsWBDOoBxO1Vd1wg==
X-Google-Smtp-Source: ABdhPJwGYNAV3m7ZLYwUmJi0SWRQOQA6ZANfRl+u+29qHxIp8jLwSbZEg8Lw/5+u7Q/0LTa67KkSDwG9640VmaRzqzw=
X-Received: by 2002:a1c:bc88:: with SMTP id m130mr3471842wmf.82.1607527963732; 
 Wed, 09 Dec 2020 07:32:43 -0800 (PST)
MIME-Version: 1.0
References: <20201207155719.17149-1-maxime@cerno.tech>
 <20201207155719.17149-7-maxime@cerno.tech>
In-Reply-To: <20201207155719.17149-7-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 9 Dec 2020 15:32:28 +0000
Message-ID: <CAPY8ntC=p-JEVZZxxAd5RdPt+ogF4cM2jW3nJ2CDw=jPOV+k3w@mail.gmail.com>
Subject: Re: [PATCH v5 6/9] drm/vc4: hdmi: Store pixel frequency in the
 connector state
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

On Mon, 7 Dec 2020 at 15:57, Maxime Ripard <maxime@cerno.tech> wrote:
>
> The pixel rate is for now quite simple to compute, but with more features
> (30 and 36 bits output, YUV output, etc.) will depend on a bunch of
> connectors properties.
>
> Let's store the rate we have to run the pixel clock at in our custom
> connector state, and compute it in atomic_check.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 26 +++++++++++++++++++++++++-
>  drivers/gpu/drm/vc4/vc4_hdmi.h |  1 +
>  2 files changed, 26 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 744396c8dcb9..83699105c7a5 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -194,6 +194,7 @@ vc4_hdmi_connector_duplicate_state(struct drm_connector *connector)
>         if (!new_state)
>                 return NULL;
>
> +       new_state->pixel_rate = vc4_state->pixel_rate;
>         __drm_atomic_helper_connector_duplicate_state(connector, &new_state->base);
>
>         return &new_state->base;
> @@ -611,9 +612,29 @@ static void vc4_hdmi_recenter_fifo(struct vc4_hdmi *vc4_hdmi)
>                   "VC4_HDMI_FIFO_CTL_RECENTER_DONE");
>  }
>
> +static struct drm_connector_state *
> +vc4_hdmi_encoder_get_connector_state(struct drm_encoder *encoder,
> +                                    struct drm_atomic_state *state)
> +{
> +       struct drm_connector_state *conn_state;
> +       struct drm_connector *connector;
> +       unsigned int i;
> +
> +       for_each_new_connector_in_state(state, connector, conn_state, i) {
> +               if (conn_state->best_encoder == encoder)
> +                       return conn_state;
> +       }
> +
> +       return NULL;
> +}
> +
>  static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
>                                                 struct drm_atomic_state *state)
>  {
> +       struct drm_connector_state *conn_state =
> +               vc4_hdmi_encoder_get_connector_state(encoder, state);
> +       struct vc4_hdmi_connector_state *vc4_conn_state =
> +               conn_state_to_vc4_hdmi_conn_state(conn_state);
>         struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
>         struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
>         unsigned long pixel_rate, hsm_rate;
> @@ -625,7 +646,7 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
>                 return;
>         }
>
> -       pixel_rate = mode->clock * 1000 * ((mode->flags & DRM_MODE_FLAG_DBLCLK) ? 2 : 1);
> +       pixel_rate = vc4_conn_state->pixel_rate;
>         ret = clk_set_rate(vc4_hdmi->pixel_clock, pixel_rate);
>         if (ret) {
>                 DRM_ERROR("Failed to set pixel clock rate: %d\n", ret);
> @@ -797,6 +818,7 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
>                                          struct drm_crtc_state *crtc_state,
>                                          struct drm_connector_state *conn_state)
>  {
> +       struct vc4_hdmi_connector_state *vc4_state = conn_state_to_vc4_hdmi_conn_state(conn_state);
>         struct drm_display_mode *mode = &crtc_state->adjusted_mode;
>         struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
>         unsigned long long pixel_rate = mode->clock * 1000;
> @@ -827,6 +849,8 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
>         if (pixel_rate > vc4_hdmi->variant->max_pixel_clock)
>                 return -EINVAL;
>
> +       vc4_state->pixel_rate = pixel_rate;
> +
>         return 0;
>  }
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
> index 2cf5362052e2..bca6943de884 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> @@ -182,6 +182,7 @@ encoder_to_vc4_hdmi(struct drm_encoder *encoder)
>
>  struct vc4_hdmi_connector_state {
>         struct drm_connector_state      base;
> +       unsigned long long              pixel_rate;
>  };
>
>  static inline struct vc4_hdmi_connector_state *
> --
> 2.28.0
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
