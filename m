Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E1B4EDDA6
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 17:44:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3D6A10F3ED;
	Thu, 31 Mar 2022 15:44:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC69E10F405
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 15:44:10 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id bo5so2945705pfb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 08:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xrDl2apXyRDvoddd0gbJjbupKUU2R+sSbxH5j+wM5do=;
 b=AF4egx1p5NMdKHD7yfq0mTIpvsmeLWIboyQzRjOSYe7huhzN+JQvhxRX0tOc5iKQSs
 RsdzV+cqBaF9vWnlNfp7PWP5VAgzONzFuCHy5jICqNQqt9OzN2b/OAcJXAt8slAMIBz9
 +SfG+QMoGR9gzZNT59tFjovvG6qvNzpUou0nhEc8OJ2QUOrnZIPztLBs9IZBUOUhU1p3
 Ou1i4BvS0RMeSlE3IOXOfatxxuAJ/PooLyFM7KZ8rRjgttoVKZmql9vbNj+B33PaNZ8r
 633SuZfOSGtq+H0Yo5sIkbK0J2Xub+W7qygIuOKxcgrbZW8K1ZjQANKuZRvtnDB1gZGj
 tfpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xrDl2apXyRDvoddd0gbJjbupKUU2R+sSbxH5j+wM5do=;
 b=a79AHf3VY3Zr546aQ8q2P6b15pxSdLDoEH3C9SQG5JFbQqPdBIh2WRj1FY9FL6fX3Q
 NeLoGRHr9p+NkN86nLifspCegWgzrXgy2+NxtauMUxnq0DUYDJEe9KJ/OnJfN5cJcKn+
 GTM6vM7PAya1BiGxui72DDlk5K9B9d1ceL6FHUQQQ/BShUly7OLKk4QNGvAMM4sJD04u
 /bebJjIU6dqVgdkTEERyv2vedQnMgdfF0pZdXUKnaPpj1Qz/7YD8L7pSIp4EwxP0DWfJ
 6zaujlggdiwyaaKuEv7ROwT8O0iZd69+dnPTIZEF8DZVR+VEQL1dG0lOkbVgQfy3XDA+
 xZbw==
X-Gm-Message-State: AOAM530aMod+RbfB/G/xAxk552xcPfGGNIvloz/G30EfU4lVklgHfAyN
 cBqt09nHfv8swLlAq970RXk8Xap4WVGaf75/UsCkpg==
X-Google-Smtp-Source: ABdhPJx4sVzEmGP9y0iW/cn26adogcZqrrwHDB39ENVjTBa1p5JXj51bDuge9Nls9ANEnHFcenKftvnaB1Rj1dG6muM=
X-Received: by 2002:a63:3648:0:b0:398:a0c9:7c58 with SMTP id
 d69-20020a633648000000b00398a0c97c58mr9001269pga.201.1648741450356; Thu, 31
 Mar 2022 08:44:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220331153923.14314-1-marex@denx.de>
In-Reply-To: <20220331153923.14314-1-marex@denx.de>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 31 Mar 2022 17:43:59 +0200
Message-ID: <CAG3jFyu=_Ep3GjrBJeZ0f1ii_PG=ZdeXC-RBCvama9XxnQ5L+A@mail.gmail.com>
Subject: Re: [RESEND][PATCH 1/2] drm/bridge: lt9611: Switch to atomic
 operations
To: Marek Vasut <marex@denx.de>
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
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 31 Mar 2022 at 17:39, Marek Vasut <marex@denx.de> wrote:
>
> Use the atomic version of the enable/disable operations to continue the
> transition to the atomic API. This will be needed to access the mode
> from the atomic state.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: John Stultz <john.stultz@linaro.org>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611.c | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
> index 63df2e8a8abc..9b3ac3794a2c 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -700,7 +700,9 @@ lt9611_connector_mode_valid(struct drm_connector *connector,
>  }
>
>  /* bridge funcs */
> -static void lt9611_bridge_enable(struct drm_bridge *bridge)
> +static void
> +lt9611_bridge_atomic_enable(struct drm_bridge *bridge,
> +                           struct drm_bridge_state *old_bridge_state)
>  {
>         struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
>
> @@ -721,7 +723,9 @@ static void lt9611_bridge_enable(struct drm_bridge *bridge)
>         regmap_write(lt9611->regmap, 0x8130, 0xea);
>  }
>
> -static void lt9611_bridge_disable(struct drm_bridge *bridge)
> +static void
> +lt9611_bridge_atomic_disable(struct drm_bridge *bridge,
> +                            struct drm_bridge_state *old_bridge_state)
>  {
>         struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
>         int ret;
> @@ -856,7 +860,9 @@ static void lt9611_bridge_pre_enable(struct drm_bridge *bridge)
>         lt9611->sleep = false;
>  }
>
> -static void lt9611_bridge_post_disable(struct drm_bridge *bridge)
> +static void
> +lt9611_bridge_atomic_post_disable(struct drm_bridge *bridge,
> +                                 struct drm_bridge_state *old_bridge_state)
>  {
>         struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
>
> @@ -919,13 +925,17 @@ static void lt9611_bridge_hpd_enable(struct drm_bridge *bridge)
>  static const struct drm_bridge_funcs lt9611_bridge_funcs = {
>         .attach = lt9611_bridge_attach,
>         .mode_valid = lt9611_bridge_mode_valid,
> -       .enable = lt9611_bridge_enable,
> -       .disable = lt9611_bridge_disable,
> -       .post_disable = lt9611_bridge_post_disable,
>         .mode_set = lt9611_bridge_mode_set,
>         .detect = lt9611_bridge_detect,
>         .get_edid = lt9611_bridge_get_edid,
>         .hpd_enable = lt9611_bridge_hpd_enable,
> +
> +       .atomic_enable = lt9611_bridge_atomic_enable,
> +       .atomic_disable = lt9611_bridge_atomic_disable,
> +       .atomic_post_disable = lt9611_bridge_atomic_post_disable,
> +       .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +       .atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +       .atomic_reset = drm_atomic_helper_bridge_reset,
>  };
>
>  static int lt9611_parse_dt(struct device *dev,
> --
> 2.35.1
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
