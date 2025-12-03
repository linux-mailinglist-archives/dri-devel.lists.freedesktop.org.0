Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C99F6C9F3E5
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 15:12:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61EC310E168;
	Wed,  3 Dec 2025 14:12:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="huq/ufjz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CE1C10E168
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 14:12:01 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-4ee1879e6d9so69152371cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Dec 2025 06:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764771120; x=1765375920; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TjikvMbBLAvP8JTEk2DJsCaYzW4mbrgZZwpCXseTwmY=;
 b=huq/ufjz23uyW1FYurm6BurUEPAOCibQCyFEzBQvgg9W83YQDN75Rm/+tyFPRdZLi9
 wE48hw513ZysiCWILtG5KjRQEZsZLyz3svHKYqMfN4tueWQ07KxfM6nNnG4wtp0uDgqO
 TjrsjZbfs6XkXAi9cJW82kcK/sFBbc0T3OcxEiR6EwTHtTCmgxMfwwZn1vBfAu0YGZln
 Yzu2mMnBwPr38mQIQNInnDmv+PX+w4oJ5s4cohJQCfKQYrSdNgKtvp8gvrziPNwjqejh
 OyoJEhOeoTss9sx2hVWu6vsu0A1l+L3rJ4YKps6X7kHZ1cYaKo6GOKNcXW/FsS5Ep7Us
 RsVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764771120; x=1765375920;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TjikvMbBLAvP8JTEk2DJsCaYzW4mbrgZZwpCXseTwmY=;
 b=rg8JKqCeFsW8bVm+Tk+GrRocQxqFBoWUCzm6MHxOUgLGAAUGv3IyIo2RQAX9rNvYlA
 HnkuAugPRDboKtnD3oXsTNGdvBsNe0B0fHl0aMozfseKsuGH6trgwE6XhsXT3baX/0YD
 4JWUMIHXaoND7HFBzpFby9MZm7WwLF4GwFOCoi0+Hb64N4alOorr4f8ULJF/bev9slMM
 2DjW4zCXeATNenxGteUJo2WxPej93sbj2vTJqcc7QkQVSisKIHu1BErBha8FYfrVf6Ow
 H7+Yy2E1LO9/CrIjgNen3DaN0WJXDuTzJqC22BBDG8DNRxkUmM/67hBOecZ3fQMNRoOb
 PIiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8eiAUz/hkh8yqv53DS7J7bfAheGLcUPW63BwBkr1aLh3FXWcIECfpRyVDZoKHKJFgm7G9FFl4YBo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKgUr0twRCzCXGMDh5LWj8JEffC3yno3IoF2a+G5B0ntgSFD1p
 9NzV0wO4OxMIES8GHh3FvIJhKK+K03wIlbqLo2ldEPOfLJlDx0Io38tzUY3AlcBpCHR2uo4uWCT
 cV2T9gNjZb3G5gUGniEVpk+N9eAXFKSA=
X-Gm-Gg: ASbGncuXCIrn2F2NPAAvqUvvQQ74arYoXNsSAS2ri96qZ435KtRsYeAXrfi3iFaNg3p
 YPrcF32rHnfCHLBOHPAX/QX8lYGcSd/hHkr4X9TgorBuHV3bliWyvaZ9IeHCor1mY2tXC5fKwEx
 RpaSE9wVTPIa/dSNrQ0qzYDnn4AHUPm5dzs2fAY2P5TS85jPf7Mp0g4BB5FnhT5r/tut+WG6h3k
 SkOdVoh8Msux1dNkLUIp/WM9dCHEod4B4+M616s2/huL++yp9hQ5viCZvkKfQ3fzOyZiNg=
X-Google-Smtp-Source: AGHT+IHYrT4T9dL1OLnbfPDjT28JMb2318J5/B3eoFhCblccxFHS7LXQDPLZwahRE4rYRyKabmK+IYyCL27PUavzRcU=
X-Received: by 2002:ac8:7c4b:0:b0:4ee:1db1:a61b with SMTP id
 d75a77b69052e-4f0176e0e22mr32108741cf.75.1764771119925; Wed, 03 Dec 2025
 06:11:59 -0800 (PST)
MIME-Version: 1.0
References: <20251202-mcde-drm-regression-thirdfix-v6-0-f1bffd4ec0fa@kernel.org>
 <20251202-mcde-drm-regression-thirdfix-v6-4-f1bffd4ec0fa@kernel.org>
In-Reply-To: <20251202-mcde-drm-regression-thirdfix-v6-4-f1bffd4ec0fa@kernel.org>
From: Vicente Bergas <vicencb@gmail.com>
Date: Wed, 3 Dec 2025 15:11:47 +0100
X-Gm-Features: AWmQ_bkzp4_vseBr9tvcxqOGhh90DbsGff_6vKvilwsSsGnyg33iWaxt34V14Bc
Message-ID: <CAAMcf8AtH_WmM=EBNkcYyD7otYjk6YuuHHCVHUi4n+viOpu5WA@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] RFT: drm/rockchip: Create custom commit tail
To: Linus Walleij <linusw@kernel.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Aradhya Bhatia <a-bhatia1@ti.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Sandy Huang <hjc@rock-chips.com>, 
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, dri-devel@lists.freedesktop.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 2, 2025 at 10:03=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> commit c9b1150a68d9362a0827609fc0dc1664c0d8bfe1
> "drm/atomic-helper: Re-order bridge chain pre-enable and post-disable"
> caused a series of regressions in all panels that send
> DSI commands in their .prepare() and .unprepare()
> callbacks when used with the Rockchip driver.
>
> As the CRTC is no longer online at bridge_pre_enable()
> and gone at brige_post_disable() which maps to the panel
> bridge .prepare()/.unprepare() callbacks, any CRTC that
> enable/disable the DSI transmitter in it's enable/disable
> callbacks will be unable to send any DSI commands in the
> .prepare() and .unprepare() callbacks.
>
> However the Rockchip driver definitely need the CRTC to be
> enabled during .prepare()/.unprepare().
>
> Solve this by implementing a custom commit tail function
> in the Rockchip driver that always enables the CRTC first
> and disables it last, using the newly exported helpers.
>
> This patch is an edited carbon-copy of the same patch to
> the ST-Ericsson MCDE driver.
>
> Link: https://lore.kernel.org/all/CAAMcf8Di8sc_XVZAnzQ9sUiUf-Ayvg2yjhx2dW=
mvvCnfF3pBRA@mail.gmail.com/
> Reported-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
> Reported-by: Vicente Bergas <vicencb@gmail.com>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
> Rockchip people: can you please test this patch (along
> with patch 1 of course).

Hi Linus,
i've applied all 4 patches from the V6 patch series on top of v6.18
and tested on the rk3399-gru-kevin platform.
It indeed fixes the reported issue.

Tested-by: Vicente Bergas <vicencb@gmail.com>

Regards,
  Vicente.

> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_fb.c | 50 ++++++++++++++++++++++++=
+++++-
>  1 file changed, 49 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c b/drivers/gpu/drm=
/rockchip/rockchip_drm_fb.c
> index 2f469d370021..63e50ea00920 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
> @@ -24,8 +24,56 @@ static const struct drm_framebuffer_funcs rockchip_drm=
_fb_funcs =3D {
>         .dirty         =3D drm_atomic_helper_dirtyfb,
>  };
>
> +/*
> + * This commit tail explicitly copies and changes the behaviour of
> + * the related core DRM atomic helper instead of trying to make
> + * the core helpers overly generic.
> + */
> +static void rockchip_drm_atomic_commit_tail(struct drm_atomic_state *sta=
te)
> +{
> +       struct drm_device *dev =3D state->dev;
> +
> +       /*
> +        * Variant of drm_atomic_helper_commit_modeset_disables()
> +        * that will disable and post-disable all bridges BEFORE
> +        * disabling the CRTC.
> +        */
> +       drm_atomic_helper_commit_encoder_bridge_disable(dev, state);
> +       drm_atomic_helper_commit_encoder_bridge_post_disable(dev, state);
> +       drm_atomic_helper_commit_crtc_disable(dev, state);
> +       drm_atomic_helper_update_legacy_modeset_state(dev, state);
> +       drm_atomic_helper_calc_timestamping_constants(state);
> +       drm_atomic_helper_commit_crtc_set_mode(dev, state);
> +
> +       /*
> +        * Variant of drm_atomic_helper_commit_modeset_enables()
> +        * that will enable the CRTC BEFORE pre-enabling and
> +        * enabling the bridges.
> +        */
> +       drm_atomic_helper_commit_crtc_enable(dev, state);
> +       drm_atomic_helper_commit_encoder_bridge_pre_enable(dev, state);
> +       drm_atomic_helper_commit_encoder_bridge_enable(dev, state);
> +       drm_atomic_helper_commit_writebacks(dev, state);
> +
> +       drm_atomic_helper_commit_planes(dev, state,
> +                                       DRM_PLANE_COMMIT_ACTIVE_ONLY);
> +
> +       drm_atomic_helper_fake_vblank(state);
> +
> +       drm_atomic_helper_commit_hw_done(state);
> +
> +       drm_atomic_helper_wait_for_vblanks(dev, state);
> +
> +       drm_atomic_helper_cleanup_planes(dev, state);
> +}
> +
>  static const struct drm_mode_config_helper_funcs rockchip_mode_config_he=
lpers =3D {
> -       .atomic_commit_tail =3D drm_atomic_helper_commit_tail_rpm,
> +       /*
> +        * Using this function is necessary to commit atomic updates
> +        * that need the CRTC to be enabled before a commit, as is
> +        * the case with e.g. DSI displays.
> +        */
> +       .atomic_commit_tail =3D rockchip_drm_atomic_commit_tail,
>  };
>
>  static struct drm_framebuffer *
>
> --
> 2.51.1
>
