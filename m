Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3B6BACEBF
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 14:48:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E799810E33A;
	Tue, 30 Sep 2025 12:48:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="CrIZTPf9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com
 [74.125.224.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDF3A10E33A
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 12:48:21 +0000 (UTC)
Received: by mail-yx1-f44.google.com with SMTP id
 956f58d0204a3-633b87e7b9fso4172594d50.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 05:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1759236501; x=1759841301;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=26rK1nGXOzO4aINsTMNnV60SwbuNUoXd+DWp40D7tB8=;
 b=CrIZTPf97116NDh9WAtvCYHhRTurvoT6kTws171de2T3ml1hr9zNAFAQgFl9iinNVO
 8kW/8CJxM2sa+mi5iCaDwxfdsmHQtmz/cgmfxQCldePwW+HmLCbjsYm7mh+/C07MvWqn
 JngivBxx0bfS9uGpsyoWBvaMhQScie0jjfmoZMLw3IIwKtK+ZQhpfCeKorTr2s8WvRGt
 /3sb7QONbkOpkgfJwtrOSvRwsaBPmiXpCX9glUlsVDVcaPlFRFFNQMOQKq21kZBuP8fX
 J5KejzUSxb/4HP8IG/nvJAXD9pPaBOABhsWNGxhKFN79cfQd/YvF5T/R6Ai40OwoH46k
 wV2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759236501; x=1759841301;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=26rK1nGXOzO4aINsTMNnV60SwbuNUoXd+DWp40D7tB8=;
 b=du0IxV0TPkDn5CdPrOGlYh/1KcQIXqfsWE6ftjXe1ptnOURmcF2dcWotm1n88Wu0oL
 iEUrKjlBBkrtqV7AmTtsc+v9Io0darcJOXkERdPYtX1j3sewMN++XEl4AawBhsjiic05
 OL8gEsNLnobQu03I0gXanGs4ghx2TW804EPv7uhU5pWP44qrkq6yfrdA7FmMUJXfjlPR
 iDfHbDwoETU0J695lSjU7q/Pz9oFmnJT8mWaig6CGgxVd3A4h7wNqYZy2zrWaYWBemNQ
 gdzpPEYnYUw1idPB+Cr0AvRjzqCYjnhAeH5VhiCqzRAt4NgNIUNApisJ+pGPPC2PoriN
 3Yww==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrfSHCUIgc4vJdM8dzK0BOEcoTP8mtKKtZsSyQBcljXcGtkfVxjQFCcfYOo+WCAKic/YO4jLKiVks=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5f40bf0CedcJyNYUUfj7w6xuqSHhKAlmtkeOE/joTFt9LeWI6
 Ef2WHGnVwahkFdxQrUmBgyWDj5iome6OxHVaFhgzF8zwFbcaMlAVX7szWw78WP74Qxf1CFNRHzB
 hEa85ifvHWd0JmjAjSBPCmjw8xKQFs2Mxe0NXQXP44g==
X-Gm-Gg: ASbGncucQta3j+SDpf1uVz9R74cbc+utTFuCoeaBh3GypnNCbVO4lTPUILaSKiA0XeH
 4eTlOOwpJq9uKgI+81OfexFvVWbciwLlcHFIVV8lP5RfjBrGw10VaU1giIvQfHP5ggbwOHKw868
 03NBkYrKhJnVJ7CQ9HNBlZyUnMHUCb9MAcm4CiBWLykIPnnbJwwdhZSuBWoVqvBjZFBIHPtikzI
 HPveoJtjBSDoC+Ospl4bAUVRgKnL43b
X-Google-Smtp-Source: AGHT+IFaKiTaeaRt6GEYVXzgWpC902TLZnWlqb3rwp2AjrWmDufsUj8LomhkqFaUXq1mgnnM0qDuKinXXskydmr/oy8=
X-Received: by 2002:a05:690e:4301:b0:634:647d:f582 with SMTP id
 956f58d0204a3-6361a838da8mr17980687d50.37.1759236500573; Tue, 30 Sep 2025
 05:48:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
 <20250930-drm-no-more-existing-state-v5-32-eeb9e1287907@kernel.org>
In-Reply-To: <20250930-drm-no-more-existing-state-v5-32-eeb9e1287907@kernel.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 30 Sep 2025 13:48:03 +0100
X-Gm-Features: AS18NWC1SHAM1fFk4iAHH8s3YEq1qll0_eofSLzhgsxup4jyV0OUSNRh1SXRZNE
Message-ID: <CAPY8ntCLsGmfSXHbhV35QtHDxQbhGGrcbPJrBLmFv_N+UyxUSg@mail.gmail.com>
Subject: Re: [PATCH v5 32/39] drm/vc4: Switch to
 drm_atomic_get_new_crtc_state()
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
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

On Tue, 30 Sept 2025 at 12:01, Maxime Ripard <mripard@kernel.org> wrote:
>
> The vc4 atomic_check implementation uses the deprecated
> drm_atomic_get_existing_crtc_state() helper.
>
> This hook is called as part of the global atomic_check, thus before the
> states are swapped. The existing state thus points to the new state, and
> we can use drm_atomic_get_new_crtc_state() instead.
>
> Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
> To: Maxime Ripard <mripard@kernel.org>
> To: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: "Ma=C3=ADra Canal" <mcanal@igalia.com>
> Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
> ---
>  drivers/gpu/drm/vc4/vc4_plane.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_pl=
ane.c
> index 056d344c5411db0eae975b0fa52c0de7418306f1..b4a53f68865bc18f6cb1fa92b=
1057890d3fe0382 100644
> --- a/drivers/gpu/drm/vc4/vc4_plane.c
> +++ b/drivers/gpu/drm/vc4/vc4_plane.c
> @@ -495,12 +495,11 @@ static int vc4_plane_setup_clipping_and_scaling(str=
uct drm_plane_state *state)
>         struct drm_crtc_state *crtc_state;
>         u32 h_subsample =3D fb->format->hsub;
>         u32 v_subsample =3D fb->format->vsub;
>         int ret;
>
> -       crtc_state =3D drm_atomic_get_existing_crtc_state(state->state,
> -                                                       state->crtc);
> +       crtc_state =3D drm_atomic_get_new_crtc_state(state->state, state-=
>crtc);
>         if (!crtc_state) {
>                 DRM_DEBUG_KMS("Invalid crtc state\n");
>                 return -EINVAL;
>         }
>
> @@ -873,12 +872,11 @@ static void vc4_plane_calc_load(struct drm_plane_st=
ate *state)
>         struct vc4_plane_state *vc4_state;
>         struct drm_crtc_state *crtc_state;
>         unsigned int vscale_factor;
>
>         vc4_state =3D to_vc4_plane_state(state);
> -       crtc_state =3D drm_atomic_get_existing_crtc_state(state->state,
> -                                                       state->crtc);
> +       crtc_state =3D drm_atomic_get_new_crtc_state(state->state, state-=
>crtc);
>         vrefresh =3D drm_mode_vrefresh(&crtc_state->adjusted_mode);
>
>         /* The HVS is able to process 2 pixels/cycle when scaling the sou=
rce,
>          * 4 pixels/cycle otherwise.
>          * Alpha blending step seems to be pipelined and it's always oper=
ating
>
> --
> 2.51.0
>
