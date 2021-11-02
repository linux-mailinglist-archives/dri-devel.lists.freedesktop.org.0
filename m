Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F31154432C5
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 17:33:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83FE86E99C;
	Tue,  2 Nov 2021 16:32:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54B1E6E99C
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Nov 2021 16:32:55 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so2537059wme.4
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Nov 2021 09:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w3lKGRRkGQqJSEit1/FXA4LRHXPjXkJLsSYikt6iWVk=;
 b=sd58/iLDu7rGAwrsSY+Qta8kD4bYbi8auOoEeLBv7MTP+Y41O0UIxlTioJm9QIDDRl
 ywHELwxoTsq4aB3O0fMcmKr399lKZ9zKRbNGB7+WgIkn/ELZ4SA9wDWsuAJVbWDjkz4I
 ekDa1b+6BGoWy47eBFbNfCpUAocsap0/i+liwQRctfB1Rpp7OJqD5wBWKs/MUpwG+W3v
 ngQDM406vGEMBOyR8y/TlwzXujogWjr33Z4+MOfdbTb6G4/hiuc3+gz3SQ0XacaMpfzA
 DZFuDaPZB25EVeO1uV3vKusbWeoGfULzH2q1HF3iT3pwIViJcpK/r9BIVa6JTM4rR7h+
 MmSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w3lKGRRkGQqJSEit1/FXA4LRHXPjXkJLsSYikt6iWVk=;
 b=bq9OkDEoJPCzzqoyGlfHgKiUgeDHYoNgwrfeOkKZqeVoDhuR3CdwgTp5+5bp/R/++9
 e8iJb0KbJLBzQKFEpxlzifSASuR1MfvWWgfTY0HmqePrO1fvmzEqeNUws4FD3vELeWtU
 0oS7494hs5UtHBX8QfP1W/FU4w6LbLna+Etf7ab5Nlc+nUtw3kLXMw+MhkTMMsyOvYbb
 G/aEtjBNLbHF+mpBGQ8c8jtizQBeAluMq6OsENoWKP+Pu3zQl12myAQYg5OOXZ/J/wEF
 xTbiSBHoMAG2inN4sdjYxHnJXPpkgaUztcKBa4J5nBJsNRQg4j1yg6xrGHoD7bzSLwyj
 ELCA==
X-Gm-Message-State: AOAM532ocGrZ7G8MSFkVlOI+vVG6zt0HOgEDfWEfOmE/YZS5lnn978rF
 fceu+KiqvHJT6clwT0qi+MSe+tvjsZldnehvM3cbFQ==
X-Google-Smtp-Source: ABdhPJzAOU1qVLqVqjhLX//l0o87yTJPT7qeHI8GMR8AeobhuiyQ5rhy9/b50OOr2asWqIdFyI+ewPMxepwNXhiMrBo=
X-Received: by 2002:a1c:4e04:: with SMTP id g4mr8026951wmh.15.1635870773733;
 Tue, 02 Nov 2021 09:32:53 -0700 (PDT)
MIME-Version: 1.0
References: <20211025152903.1088803-1-maxime@cerno.tech>
 <20211025152903.1088803-6-maxime@cerno.tech>
In-Reply-To: <20211025152903.1088803-6-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 2 Nov 2021 16:32:37 +0000
Message-ID: <CAPY8ntDHdaz0r8Uxq-QsNkmBSz7Ywbf829uLTj=ZL_OwBhwAgA@mail.gmail.com>
Subject: Re: [PATCH v8 05/10] drm/vc4: crtc: Rework the encoder retrieval code
 (again)
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Tim Gover <tim.gover@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 25 Oct 2021 at 16:29, Maxime Ripard <maxime@cerno.tech> wrote:
>
> It turns out the encoder retrieval code, in addition to being
> unnecessarily complicated, has a bug when only the planes and crtcs are
> affected by a given atomic commit.
>
> Indeed, in such a case, either drm_atomic_get_old_connector_state or
> drm_atomic_get_new_connector_state will return NULL and thus our encoder
> retrieval code will not match on anything.
>
> We can however simplify the code by using drm_for_each_encoder_mask, the
> drm_crtc_state storing the encoders a given CRTC is connected to
> directly and without relying on any other state.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_crtc.c | 30 +++++++++---------------------
>  drivers/gpu/drm/vc4/vc4_drv.h  |  4 +---
>  2 files changed, 10 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
> index e5c2e29a6f01..fbc1d4638650 100644
> --- a/drivers/gpu/drm/vc4/vc4_crtc.c
> +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
> @@ -282,26 +282,14 @@ static u32 vc4_crtc_get_fifo_full_level_bits(struct vc4_crtc *vc4_crtc,
>   * same CRTC.
>   */
>  struct drm_encoder *vc4_get_crtc_encoder(struct drm_crtc *crtc,
> -                                        struct drm_atomic_state *state,
> -                                        struct drm_connector_state *(*get_state)(struct drm_atomic_state *state,
> -                                                                                 struct drm_connector *connector))
> +                                        struct drm_crtc_state *state)
>  {
> -       struct drm_connector *connector;
> -       struct drm_connector_list_iter conn_iter;
> +       struct drm_encoder *encoder;
>
> -       drm_connector_list_iter_begin(crtc->dev, &conn_iter);
> -       drm_for_each_connector_iter(connector, &conn_iter) {
> -               struct drm_connector_state *conn_state = get_state(state, connector);
> +       WARN_ON(hweight32(state->encoder_mask) > 1);
>
> -               if (!conn_state)
> -                       continue;
> -
> -               if (conn_state->crtc == crtc) {
> -                       drm_connector_list_iter_end(&conn_iter);
> -                       return connector->encoder;
> -               }
> -       }
> -       drm_connector_list_iter_end(&conn_iter);
> +       drm_for_each_encoder_mask(encoder, crtc->dev, state->encoder_mask)
> +               return encoder;
>
>         return NULL;
>  }
> @@ -550,8 +538,7 @@ static void vc4_crtc_atomic_disable(struct drm_crtc *crtc,
>         struct drm_crtc_state *old_state = drm_atomic_get_old_crtc_state(state,
>                                                                          crtc);
>         struct vc4_crtc_state *old_vc4_state = to_vc4_crtc_state(old_state);
> -       struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc, state,
> -                                                          drm_atomic_get_old_connector_state);
> +       struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc, old_state);
>         struct drm_device *dev = crtc->dev;
>
>         require_hvs_enabled(dev);
> @@ -578,10 +565,11 @@ static void vc4_crtc_atomic_disable(struct drm_crtc *crtc,
>  static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
>                                    struct drm_atomic_state *state)
>  {
> +       struct drm_crtc_state *new_state = drm_atomic_get_new_crtc_state(state,
> +                                                                        crtc);
>         struct drm_device *dev = crtc->dev;
>         struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
> -       struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc, state,
> -                                                          drm_atomic_get_new_connector_state);
> +       struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc, new_state);
>         struct vc4_encoder *vc4_encoder = to_vc4_encoder(encoder);
>
>         require_hvs_enabled(dev);
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
> index f5e678491502..60826aca9e5b 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.h
> +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> @@ -545,9 +545,7 @@ vc4_crtc_to_vc4_pv_data(const struct vc4_crtc *crtc)
>  }
>
>  struct drm_encoder *vc4_get_crtc_encoder(struct drm_crtc *crtc,
> -                                        struct drm_atomic_state *state,
> -                                        struct drm_connector_state *(*get_state)(struct drm_atomic_state *state,
> -                                                                                 struct drm_connector *connector));
> +                                        struct drm_crtc_state *state);
>
>  struct vc4_crtc_state {
>         struct drm_crtc_state base;
> --
> 2.31.1
>
