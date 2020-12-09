Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF49B2D453C
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 16:22:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDADB6EA7F;
	Wed,  9 Dec 2020 15:22:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6409A6EA7F
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 15:22:29 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id m5so2154959wrx.9
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Dec 2020 07:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i3/UuxHn3/Y2fDJNeNrBNzscKYGm7t0Oe29JA7xBGgI=;
 b=IXMAHP3ldrvBsOmwacpDnIMIlvc1tH+0DECs3tqeBOnjxwuOovTJb5Gh3OhZE6CByF
 MA6gqp00Ol3cwri3OwmqpiIqS5z9/NKVGAYKUO13bHl8+Wm8f7TRm8EDvX3Kkp3zvt30
 C8SVVLj9bOqC1uKjKtVMRKD06+XByLyk0ihWRobiaFZqhcdSnY1P8YJYafhFYHeMszym
 llX7JMN/M6BaZZhpKU33FLqajJ+C6IB0IWio5r/GqnMCYUtiEkLCFvOFoTRQTOkIFIw+
 a5uTbOXxA5seF5FozTKEjcW4dv/SH2ljcJBJnGZej+53HPnXCVgdCAXx49fkMkBx91nH
 Grbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i3/UuxHn3/Y2fDJNeNrBNzscKYGm7t0Oe29JA7xBGgI=;
 b=NsyhF++G8n86v8mIRB8TgpBam5UEiv9qqMWMsItK+cbqc3eK5JkTUVyBi/H1kogz8i
 suzFjeTuQpCSeWBRraegH4WhcvAygmQk0q+1fFuKw9Y+A8sZauwShB/fMrzfNVwq2gfo
 oZAKuIDCGIIoRZSYBL/ApfphQcrGT3XHjLHDCjq5HMCAYgi58r54A9exXeKy2ayY8K/O
 ivjiXhNjdlsrk3IVLK4TfIvKiDV6CamGX0wcji6okLkuNoCT7AaXDhrek0q9tEfM3gID
 A8DsRuDm6q1HEC/LrPwsigmt53St0ylvWHFwqNLS1aKxpBn6SThenLyw0KUeOOTUwu0a
 Lc7w==
X-Gm-Message-State: AOAM530DFjH1UHYNsU7VMxrdJkALJv2OXffsORz2Y8UTxijvAWpR7+a6
 pSEJGy/GQWMaBIdPEtq3YcQYoXbJROvHGTNXQnzM182tz7wLWw==
X-Google-Smtp-Source: ABdhPJxOXNsISA6a8+Ej2BcoUApKBDMST7hLNFOwlWAPmPC85qXh46aBKPbwve1KayNoXRyvEnNNHyyhlHSGMz1/xnQ=
X-Received: by 2002:a5d:50c6:: with SMTP id f6mr3297898wrt.150.1607527348046; 
 Wed, 09 Dec 2020 07:22:28 -0800 (PST)
MIME-Version: 1.0
References: <20201207155719.17149-1-maxime@cerno.tech>
 <20201207155719.17149-6-maxime@cerno.tech>
In-Reply-To: <20201207155719.17149-6-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 9 Dec 2020 15:22:13 +0000
Message-ID: <CAPY8ntD9+qKKyY_E4cKriQ9G_Ud7JoXjk0rO=UAKu_4Q+Vfy0w@mail.gmail.com>
Subject: Re: [PATCH v5 5/9] drm/vc4: hdmi: Create a custom connector state
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
> When run with a higher bpc than 8, the clock of the HDMI controller needs
> to be adjusted. Let's create a connector state that will be used at
> atomic_check and atomic_enable to compute and store the clock rate
> associated to the state.
>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 27 +++++++++++++++++++++++++--
>  drivers/gpu/drm/vc4/vc4_hdmi.h | 10 ++++++++++
>  2 files changed, 35 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 61039cc89d9d..744396c8dcb9 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -170,18 +170,41 @@ static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
>
>  static void vc4_hdmi_connector_reset(struct drm_connector *connector)
>  {
> -       drm_atomic_helper_connector_reset(connector);
> +       struct vc4_hdmi_connector_state *conn_state = kzalloc(sizeof(*conn_state), GFP_KERNEL);
> +
> +       if (connector->state)
> +               __drm_atomic_helper_connector_destroy_state(connector->state);
> +
> +       kfree(connector->state);
> +
> +       __drm_atomic_helper_connector_reset(connector, &conn_state->base);
>
>         if (connector->state)
>                 drm_atomic_helper_connector_tv_reset(connector);
>  }
>
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
> +}
> +
>  static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
>         .detect = vc4_hdmi_connector_detect,
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
