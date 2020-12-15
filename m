Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A87A2DAB91
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 12:02:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 550086E1A7;
	Tue, 15 Dec 2020 11:02:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24E976E1A7
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 11:02:46 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id y17so19389853wrr.10
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 03:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g8OiD2oVgl752irPXqrQDpekK2rivukbIEiJ5JnIADY=;
 b=R5y0LIxZe4MNJZDqhTONBJ1GaUq7eieWDKfVrO3i1k4QfMLGW22iLzmbxvjufSHL5A
 DGg/GhqQuRitslub+3yqDVwZ6WJZ4itOej1ZARgTjiwhFjghVrYOLZ8WSssMFclHUkg1
 2NZ81F/7EEL1H0E6bxihrpsV39PocXHojo0ESr0UfRjzuruhMradLVbvdmEBEA9voGjJ
 ZW9R4EEw/9GT8ZxVx0Ngmzj4tpY2p0SLKHZKYpy/FDKpCN67A6hoTx/AUJyWAzWJDWxR
 vicb/SVNkQ0Fr5b7w+nkVAqjY7TpEZ/zmoN3fptDBcqtxGlyF//FBqzL4accbsdVK7II
 aZEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g8OiD2oVgl752irPXqrQDpekK2rivukbIEiJ5JnIADY=;
 b=AwvluTCZRQpVopdT14SrhQkxI6dyRWLkeT+AR47zbOhhoOBPwbMKwETf1e8xJgzbsC
 mGnUH1/QbXQ9f1p7NXkUlvyYX+i3jEw9C0GWGUXnGe3wDhPvNdNJ03vSBsB9YVUw7/oh
 ZFPIqEnPrFMzJcCOFh/SVFo8A0pDv55+4czCszDQ/0rXvB+n6g4Wq7K6QeSV5uo8k3jM
 YNxTJlXZo0iC8dHeCtV/+I35kHJNdyY4JE3uoJozEIEra6xFbhtS43VSOfYGN+I1I0O0
 EpYVxHLNRhon3O0osKzER5TwS/Vk6UqRUhrwnOofW7UxbH+HNuqfgEUK8f/XlJrZaoPD
 5liw==
X-Gm-Message-State: AOAM5307aDMiySEwfuwfHNFqPUD0OqN9d0zCi4XW7Ewn1OVLb3fFR1MZ
 GXfSsNlfgN+XfkZlE393lihsw3Lg+b+pdGrRua26jA==
X-Google-Smtp-Source: ABdhPJySaBSVh6y3AEsd2fDbJ39jQm7186om8mV/XYQW51MtOHvpo5t+dWJrqpneH6u+SxAeFDqH0pKK/s49FbU90jU=
X-Received: by 2002:adf:8290:: with SMTP id 16mr32425767wrc.27.1608030164545; 
 Tue, 15 Dec 2020 03:02:44 -0800 (PST)
MIME-Version: 1.0
References: <20201210142329.10640-1-maxime@cerno.tech>
 <20201210142329.10640-6-maxime@cerno.tech>
In-Reply-To: <20201210142329.10640-6-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 15 Dec 2020 11:02:28 +0000
Message-ID: <CAPY8ntAo0VOHRBh32-k5+v_E0E91pbhaC-An0Hhv+_nWFSkyYQ@mail.gmail.com>
Subject: Re: [PATCH v6 5/9] drm/vc4: hdmi: Create a custom connector state
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

On Thu, 10 Dec 2020 at 14:23, Maxime Ripard <maxime@cerno.tech> wrote:
>
> When run with a higher bpc than 8, the clock of the HDMI controller needs
> to be adjusted. Let's create a connector state that will be used at
> atomic_check and atomic_enable to compute and store the clock rate
> associated to the state.
>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 33 ++++++++++++++++++++++++++++++---
>  drivers/gpu/drm/vc4/vc4_hdmi.h | 10 ++++++++++
>  2 files changed, 40 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 61039cc89d9d..8978df3f0ca4 100644
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
> +               kzalloc(sizeof(*conn_state), GFP_KERNEL);
>
>         if (connector->state)
> -               drm_atomic_helper_connector_tv_reset(connector);
> +               __drm_atomic_helper_connector_destroy_state(connector->state);
> +
> +       kfree(old_state);
> +
> +       if (!new_state)
> +               return;

This has changed since v5 that I added my R-B to.

So we no longer call __drm_atomic_helper_connector_reset should the
kzalloc fail. Doesn't that mean connector->state is still set to
old_state? Except we've called kfree on that and it's therefore
invalid.

Calling __drm_atomic_helper_connector_reset unconditionally is fine as
it checks for the new pointer being NULL before dereferencing, but
always assigns it to connector->state.
Calling drm_atomic_helper_connector_tv_reset when connector->state =
NULL isn't safe.

> +       __drm_atomic_helper_connector_reset(connector, &new_state->base);

Put the if (!new_state) return; here?
Patch 9/9 can set the max_bpc and max_bpc_requested field here too.

  Dave

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
> 2.28.0
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
