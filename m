Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DCA7EFB30
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 23:09:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BDAB10E79B;
	Fri, 17 Nov 2023 22:09:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C89C010E79B
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 22:09:35 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-6ce37683cf6so1388426a34.3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 14:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1700258975; x=1700863775;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DiSGNQiY58h0LQFsDu9CHE6/vvGSghMl0TnoDbQc6jc=;
 b=TuI7NiGC8FdXcO/V4DLFbG5Pg1H5bGY/Y+Ig8PAnxnCqhieMjQIKf0kWqyXnlMHAcf
 Ta89SJtqa4JSEw9CqlOz3befTm6hw6JGeJ4nUH51UwhEZ42eK9AJaiZ2sPmTvxW8eQN7
 Ou8UPa/73l4YJ0ibWiq3Bt5HfRvzJ+2+aseSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700258975; x=1700863775;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DiSGNQiY58h0LQFsDu9CHE6/vvGSghMl0TnoDbQc6jc=;
 b=rBpoKCk6F5kq4AGHKZi6AkY2SHSSEoF7EWR7teEtqGERmIVwj6apt6KiIRPzo9l6L5
 FYmXjUF4MVAd30bi1xEyySoQ54AbA24ZPKo6X7zGs85G46OpG/y1Z+KvJMO6e1/EC4Kc
 hhW5xsOu+ZIb4rDcBUOdBcm5H9ks9o6EskoV6yU8IFJNkgkRldNlCyAfDGpFxvfrXEYN
 99LCcX4t8arZ4dTLmJL/Bm1qmpKUopFahaEsU86HW4zKmhRbuwm1wzODtMOQdGzA8CDL
 GTHgnzejfPivmBuy3rZT9ffQyeEQALFZDsDxw4rmexbk1wcNRs1U4dXXIK/yuBeT2ZO8
 a0RA==
X-Gm-Message-State: AOJu0Yw6ihnpVNRHNjhH4mxMK0Kn/409jiVUGivWLkp9mKH7x+mAQEIX
 VFX3hntdTntHn7uwGnV0SkbZ/Blx9kIwsPcj7GihKg==
X-Google-Smtp-Source: AGHT+IE1WL0A4FB3z3NP8LQZs3oHN76xjcRc0rEag6q+PtdV49d7lmD+su3O8vYYEMA28Fc3JfJ/GoVZJsJHvK38vjs=
X-Received: by 2002:a05:6830:1d51:b0:6d6:4972:b7ae with SMTP id
 p17-20020a0568301d5100b006d64972b7aemr539643oth.13.1700258975059; Fri, 17 Nov
 2023 14:09:35 -0800 (PST)
MIME-Version: 1.0
References: <20231117215056.1883314-1-hsinyi@chromium.org>
 <20231117215056.1883314-3-hsinyi@chromium.org>
In-Reply-To: <20231117215056.1883314-3-hsinyi@chromium.org>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 17 Nov 2023 14:09:09 -0800
Message-ID: <CAJMQK-iBtNOeLBBsdKOHxN-A3i2eAuc78SYtr91kOHijFHOFLw@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] drm/panel-edp: Add auo_b116xa3_mode
To: Douglas Anderson <dianders@chromium.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 17, 2023 at 1:51=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org> =
wrote:
>
> Add auo_b116xa3_mode to override the original modes parsed from edid
> of the panels 0x405c B116XAK01.0 and 0x615c B116XAN06.1 which result
> in glitches on panel.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> v6->v7: split usecase to another patch.

 -cc: stable

> ---
>  drivers/gpu/drm/panel/panel-edp.c | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index 33535f6de343..3e144145a6bd 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -983,6 +983,19 @@ static const struct panel_desc auo_b101ean01 =3D {
>         },
>  };
>
> +static const struct drm_display_mode auo_b116xa3_mode =3D {
> +       .clock =3D 70589,
> +       .hdisplay =3D 1366,
> +       .hsync_start =3D 1366 + 40,
> +       .hsync_end =3D 1366 + 40 + 40,
> +       .htotal =3D 1366 + 40 + 40 + 32,
> +       .vdisplay =3D 768,
> +       .vsync_start =3D 768 + 10,
> +       .vsync_end =3D 768 + 10 + 12,
> +       .vtotal =3D 768 + 10 + 12 + 6,
> +       .flags =3D DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
> +};
> +
>  static const struct drm_display_mode auo_b116xak01_mode =3D {
>         .clock =3D 69300,
>         .hdisplay =3D 1366,
> @@ -1908,9 +1921,11 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x239b, &delay_200_500_e50, "B116X=
AN06.1"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x255c, &delay_200_500_e50, "B116X=
TN02.5"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x403d, &delay_200_500_e50, "B140H=
AN04.0"),
> -       EDP_PANEL_ENTRY('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "B11=
6XAK01.0"),
> +       EDP_PANEL_ENTRY2('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "B1=
16XAK01.0",
> +                        &auo_b116xa3_mode),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x582d, &delay_200_500_e50, "B133U=
AN01.0"),
> -       EDP_PANEL_ENTRY('A', 'U', 'O', 0x615c, &delay_200_500_e50, "B116X=
AN06.1"),
> +       EDP_PANEL_ENTRY2('A', 'U', 'O', 0x615c, &delay_200_500_e50, "B116=
XAN06.1",
> +                        &auo_b116xa3_mode),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x635c, &delay_200_500_e50, "B116X=
AN06.3"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x639c, &delay_200_500_e50, "B140H=
AK02.7"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x8594, &delay_200_500_e50, "B133U=
AN01.0"),
> --
> 2.43.0.rc0.421.g78406f8d94-goog
>
