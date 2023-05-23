Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B1D70E75B
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 23:30:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1337710E4E4;
	Tue, 23 May 2023 21:30:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4887010E4E4
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 21:30:11 +0000 (UTC)
Received: by mail-qv1-xf2b.google.com with SMTP id
 6a1803df08f44-62387baa403so25900816d6.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 14:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1684877410; x=1687469410;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=12a8TVZQvjkkyWtI7fz8x1oDJA/k8YRY6ApQKDzedDE=;
 b=i5moAtbaux+oKTRJvt8kgT2kh9lY+QtUnf5dOM8p9NVz4BW7Jbvr/60GqaqzzqW91O
 ciN7S77mH1rmkRF+C0oA2vYi02ye9vfNbVpAmFoKiPBeORYUuzHCIKrCwltxv5szNa+B
 2OQBuSzBN/s/EG4L6EegcVwP1XVnCnWc1EAQNkV5cI+Sz7UdfWpertNCSdk1DfxA02R4
 Ky5c0TpQcbqG4a8Q1xOvmGokmJMDow7bLEH67Ow78PcsGt+TgIEK+/XGezREYGbPWYac
 m1qKMHu+hz4+FsbCHOWFJiYEEn37+QHR3z+Uoi88pXSBgnIzSpenOztV60VvMWUjIBJY
 j6xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684877410; x=1687469410;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=12a8TVZQvjkkyWtI7fz8x1oDJA/k8YRY6ApQKDzedDE=;
 b=DiMtXWvPKHcqU9TnWiD411xB/W1gvh+ypUoKZMQmE/bZFSHxr9vbtfH877KwkGkCbq
 1brNHANXNEPcVlbBqJ96wMmjy1H/2SsPFrmni4YM7qE6kvbg5sHRBzcer9ZRVxVuJ+9H
 IU+sF0bbJObPAzNaIDQUXVh5+J/OgCXwCsP+Ixe2kYEsSz6bD5b6y89sVM6FiQRpcPIR
 DNRS2ebauiaxfGNqbQGWimd7ngIp2ACpqyEONsZostNHywVol3j87D2CRZqSgoBQYDIx
 wKCccUBhbq/c57KLpoavvXA1yaLvyaQnXOIuPt4RkBPqy42LZiSZsg+dnWutqVc8cigF
 UjYg==
X-Gm-Message-State: AC+VfDwcqWRhuJsKHvTyXcIcyw0Q+McSxMaLwysh9mkLV6gmHNDjgCTQ
 vjly/Mx12JanmJJPq1MuO9b9W8B8jBOVKdQGjp0+0w==
X-Google-Smtp-Source: ACHHUZ4Wan+pBGA30UDc0Hp2h00PD3iAXL1/dmWzS2pNFookLK0VclHG8VPaSvULEt2cdpPwFDE0Oudo35XhtSYs7m4=
X-Received: by 2002:a05:6214:20ef:b0:623:7108:362d with SMTP id
 15-20020a05621420ef00b006237108362dmr28098589qvk.9.1684877409885; Tue, 23 May
 2023 14:30:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230523212050.9970-1-aweber.kernel@gmail.com>
In-Reply-To: <20230523212050.9970-1-aweber.kernel@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 23 May 2023 14:29:59 -0700
Message-ID: <CAKwvOd=00s_MMQcnbyQkEsUE8HwhSCw+=KyzckKpdTrivQ3N-w@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: samsung-s6d7aa0: use pointer for drm_mode in
 panel desc struct
To: Artur Weber <aweber.kernel@gmail.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 llvm@lists.linux.dev, Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 thierry.reding@gmail.com, Nikita Travkin <nikita@trvn.ru>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 23, 2023 at 2:20=E2=80=AFPM Artur Weber <aweber.kernel@gmail.co=
m> wrote:
>
> Fixes compilation errors on older GCC versions (before 8.x) and Clang
> after changes introduced in commit 6810bb390282 ("drm/panel: Add
> Samsung S6D7AA0 panel controller driver"). Tested with GCC 13.1.1,
> GCC 6.4.0 and Clang 16.0.3.

Hi Artur,
Thanks for the patch! Mind sending a v2 with the diagnostic added to
the commit message? This gives reviewers much more context as to what
issue you are fixing.

>
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---
>  drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c b/drivers/gpu/=
drm/panel/panel-samsung-s6d7aa0.c
> index f532aa018428..102e1fc7ee38 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
> @@ -37,7 +37,7 @@ struct s6d7aa0_panel_desc {
>         unsigned int panel_type;
>         int (*init_func)(struct s6d7aa0 *ctx);
>         int (*off_func)(struct s6d7aa0 *ctx);
> -       const struct drm_display_mode drm_mode;
> +       const struct drm_display_mode *drm_mode;
>         unsigned long mode_flags;
>         u32 bus_flags;
>         bool has_backlight;
> @@ -309,7 +309,7 @@ static const struct s6d7aa0_panel_desc s6d7aa0_lsl080=
al02_desc =3D {
>         .panel_type =3D S6D7AA0_PANEL_LSL080AL02,
>         .init_func =3D s6d7aa0_lsl080al02_init,
>         .off_func =3D s6d7aa0_lsl080al02_off,
> -       .drm_mode =3D s6d7aa0_lsl080al02_mode,
> +       .drm_mode =3D &s6d7aa0_lsl080al02_mode,
>         .mode_flags =3D MIPI_DSI_MODE_VSYNC_FLUSH | MIPI_DSI_MODE_VIDEO_N=
O_HFP,
>         .bus_flags =3D DRM_BUS_FLAG_DE_HIGH,
>
> @@ -412,7 +412,7 @@ static const struct s6d7aa0_panel_desc s6d7aa0_lsl080=
al03_desc =3D {
>         .panel_type =3D S6D7AA0_PANEL_LSL080AL03,
>         .init_func =3D s6d7aa0_lsl080al03_init,
>         .off_func =3D s6d7aa0_lsl080al03_off,
> -       .drm_mode =3D s6d7aa0_lsl080al03_mode,
> +       .drm_mode =3D &s6d7aa0_lsl080al03_mode,
>         .mode_flags =3D MIPI_DSI_MODE_NO_EOT_PACKET,
>         .bus_flags =3D 0,
>
> @@ -440,7 +440,7 @@ static const struct s6d7aa0_panel_desc s6d7aa0_ltl101=
at01_desc =3D {
>         .panel_type =3D S6D7AA0_PANEL_LTL101AT01,
>         .init_func =3D s6d7aa0_lsl080al03_init, /* Similar init to LSL080=
AL03 */
>         .off_func =3D s6d7aa0_lsl080al03_off,
> -       .drm_mode =3D s6d7aa0_ltl101at01_mode,
> +       .drm_mode =3D &s6d7aa0_ltl101at01_mode,
>         .mode_flags =3D MIPI_DSI_MODE_NO_EOT_PACKET,
>         .bus_flags =3D 0,
>
> @@ -458,7 +458,7 @@ static int s6d7aa0_get_modes(struct drm_panel *panel,
>         if (!ctx)
>                 return -EINVAL;
>
> -       mode =3D drm_mode_duplicate(connector->dev, &ctx->desc->drm_mode)=
;
> +       mode =3D drm_mode_duplicate(connector->dev, ctx->desc->drm_mode);
>         if (!mode)
>                 return -ENOMEM;
>
>
> base-commit: 37cee4876a45a5c3da79a83d34ed4f3c68548aef
> --
> 2.40.1
>


--=20
Thanks,
~Nick Desaulniers
