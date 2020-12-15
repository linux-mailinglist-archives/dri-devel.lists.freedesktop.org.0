Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DF62DB14F
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 17:26:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD9486E402;
	Tue, 15 Dec 2020 16:26:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAE526E402
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 16:26:03 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id g185so19088499wmf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 08:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z8DLWt/BMNBGPK8e4/Z4NKeqSUXEvnfm8MWTWhLXzLs=;
 b=LZFxpYwDk+Hkm94pgVr3L8Vx2VpmVfAT4YvJAv56XWUeumQ6ZJIdAyhvrY9nG9uwQg
 LfTfhRwL+I8d0+yrQ+A4tT2XCjH/S2MRvq40Eiw1vwaW/NhhcjRAMY8DEDjJFeVIsCA9
 26LPnQiJikX8Bf1RspN7fF/3FevJzae7QEtWs25mXUZoESzBhrYoWlcZSLdoIqW6sqln
 XN3WO6DWMTKHp7KrKD8znUmkpKHnnxFXFxHg0ShWb6IRx57hv0rdpZ/qz0mP/wSeUsp/
 /mdBw+0RqufdV+1m5PdBiRi4nli4yjbBfyCNJIIwkfm47aaHEnyRJebSU6Z7W2txDXpE
 wrpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z8DLWt/BMNBGPK8e4/Z4NKeqSUXEvnfm8MWTWhLXzLs=;
 b=q2y8FAFbcopa8xPayPuAxlsyyFN/qH5OUrGwTStEVUgfispIxTg8li5aEmI0HXXRlD
 p7EYZw32J+vbf7B4zgq2YWf3DXXSCxoSxAUAprVhlYBVfDFs9w5kpfgpeNzlH6vwJshB
 xugzL7vHJzLLCad+dXZZrPnVvnphFiFS8//XuIXX+V/HAguND7W+DnqOnMvztH+HCDH8
 Chcp4cJuFF2yM73EjSSuqWCge2EHoHmnoOUD/+1/1ZMYXUzs+Mj7/TxfQAHAj/yqwm+C
 QHV4ReP+bneRhglcZIrAKkzU3WeA/0UHKTf9EA2ZSfUSY3pDNUxTItvplTp6aZmkmzAK
 245g==
X-Gm-Message-State: AOAM532r4f3IScPaLhFxr+WAQ4ZVnmRTy6xyf3lyA6nrv1yoZ43d7yW0
 KjydfEvL24D1mKSBYCVafRnNkVc9tCFx7RjyGNOKSA==
X-Google-Smtp-Source: ABdhPJx379gbKarEY/pbl6fkCihhC2fVkfTvpz5iHgh/GkfqxdwDBZxFq3UOldYeD1R7jbnq6gDwO5S5ebhFPecPHpk=
X-Received: by 2002:a1c:7d88:: with SMTP id
 y130mr33014644wmc.158.1608049562359; 
 Tue, 15 Dec 2020 08:26:02 -0800 (PST)
MIME-Version: 1.0
References: <20201215154243.540115-1-maxime@cerno.tech>
 <20201215154243.540115-6-maxime@cerno.tech>
In-Reply-To: <20201215154243.540115-6-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 15 Dec 2020 16:25:46 +0000
Message-ID: <CAPY8ntCP7O9GOrAo0qutHR8g3aJGY4a3ps-sa8LS5LjrN2D+Nw@mail.gmail.com>
Subject: Re: [PATCH v7 5/9] drm/vc4: hdmi: Create a custom connector state
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

On Tue, 15 Dec 2020 at 15:42, Maxime Ripard <maxime@cerno.tech> wrote:
>
> When run with a higher bpc than 8, the clock of the HDMI controller needs
> to be adjusted. Let's create a connector state that will be used at
> atomic_check and atomic_enable to compute and store the clock rate
> associated to the state.
>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

I'm happy again
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 33 ++++++++++++++++++++++++++++++---
>  drivers/gpu/drm/vc4/vc4_hdmi.h | 10 ++++++++++
>  2 files changed, 40 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 920895deb2e7..d22a0dbd0ce2 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -170,10 +170,37 @@ static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
>
>  static void vc4_hdmi_connector_reset(struct drm_connector *connector)
>  {
> -       drm_atomic_helper_connector_reset(connector);
> +       struct vc4_hdmi_connector_state *old_state =
> +               conn_state_to_vc4_hdmi_conn_state(connector->state);
> +       struct vc4_hdmi_connector_state *new_state =
> +               kzalloc(sizeof(*new_state), GFP_KERNEL);
>
>         if (connector->state)
> -               drm_atomic_helper_connector_tv_reset(connector);
> +               __drm_atomic_helper_connector_destroy_state(connector->state);
> +
> +       kfree(old_state);
> +       __drm_atomic_helper_connector_reset(connector, &new_state->base);
> +
> +       if (!new_state)
> +               return;
> +
> +       drm_atomic_helper_connector_tv_reset(connector);
> +}
> +
> +static struct drm_connector_state *
> +vc4_hdmi_connector_duplicate_state(struct drm_connector *connector)
> +{
> +       struct drm_connector_state *conn_state = connector->state;
> +       struct vc4_hdmi_connector_state *vc4_state = conn_state_to_vc4_hdmi_conn_state(conn_state);
> +       struct vc4_hdmi_connector_state *new_state;
> +
> +       new_state = kzalloc(sizeof(*new_state), GFP_KERNEL);
> +       if (!new_state)
> +               return NULL;
> +
> +       __drm_atomic_helper_connector_duplicate_state(connector, &new_state->base);
> +
> +       return &new_state->base;
>  }
>
>  static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
> @@ -181,7 +208,7 @@ static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
>         .fill_modes = drm_helper_probe_single_connector_modes,
>         .destroy = vc4_hdmi_connector_destroy,
>         .reset = vc4_hdmi_connector_reset,
> -       .atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +       .atomic_duplicate_state = vc4_hdmi_connector_duplicate_state,
>         .atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>  };
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
> index 0526a9cf608a..2cf5362052e2 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> @@ -180,6 +180,16 @@ encoder_to_vc4_hdmi(struct drm_encoder *encoder)
>         return container_of(_encoder, struct vc4_hdmi, encoder);
>  }
>
> +struct vc4_hdmi_connector_state {
> +       struct drm_connector_state      base;
> +};
> +
> +static inline struct vc4_hdmi_connector_state *
> +conn_state_to_vc4_hdmi_conn_state(struct drm_connector_state *conn_state)
> +{
> +       return container_of(conn_state, struct vc4_hdmi_connector_state, base);
> +}
> +
>  void vc4_hdmi_phy_init(struct vc4_hdmi *vc4_hdmi,
>                        struct drm_display_mode *mode);
>  void vc4_hdmi_phy_disable(struct vc4_hdmi *vc4_hdmi);
> --
> 2.29.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
