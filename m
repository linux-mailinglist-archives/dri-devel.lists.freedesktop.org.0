Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DE0C2D5F0
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 18:11:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4625710E1FC;
	Mon,  3 Nov 2025 17:11:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SlqXc6fd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1643B10E1FC
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 17:11:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CF93D43A89
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 17:11:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4E07C4CEFD
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 17:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762189882;
 bh=Sv9FQL3Mzv+xYf8NoCGm6lqnm9197fwnn5s+c0L/OC4=;
 h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
 b=SlqXc6fdFdwZKkA3NGn+gW1fT8efWP2Pq9Eay/W3Z/vvEZfuiMhms2HFuhmciuSLQ
 1Kh7RRyWB29Umachh4f15d/U7AQqP3zYHMeYH5OC3ZppNDS1UKTAdPsHgevXW/WW55
 ve9P/zKD57n3O8qju8FiYDzLkoTNe2h4N+7x0a2rVJjuzTYWH53qtGyPu87G5HYLDv
 eCmzAwVZo6J+LklFDGA4aj3LdeXYHdHp3670uap8kl2GfnATtEfPe4pICSzf4/kbdD
 thKd8mjau7IIw+u35stL/MSUdmOQNyQ03rET2COozaTLSqLRDjZQlLrDM1E0HNe3q2
 pDtzVyQqo3pug==
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-378d50e1c77so39071251fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 09:11:22 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXiKUrN/NxYr6ajM0jVg0YB9xSHhaWkFjbAjfNsLXU9zJOYWSt/woYgYsRGiZJloo2qMSN8P99xd90=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDg6dgJzR6WsH5jClhZATcXuMMOVYJPOidZ2c/kInIm3BG8MoZ
 YVYQUp1cwL26nam44lki0NuUnXxhzmkbik4K7Fz5/DlxSl6Im9StQSSdM5X05XorzbXE8ryZ9Bt
 Gn7sa9Z/pTOz9FZAB/pDhDIenmskJ2h8=
X-Google-Smtp-Source: AGHT+IGj3r9zUjzPzn9IEygYQzEgz7ukM/+Lp4b6fW21ZV+0fJdeLDp4noFAI8Yrq2hHKB7s/nRse2db5Ak/8EyGv8Q=
X-Received: by 2002:a2e:9205:0:b0:337:e29c:b0d2 with SMTP id
 38308e7fff4ca-37a18de1e52mr34298411fa.41.1762189881006; Mon, 03 Nov 2025
 09:11:21 -0800 (PST)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
 <20251012192330.6903-27-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-27-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 4 Nov 2025 01:11:07 +0800
X-Gmail-Original-Message-ID: <CAGb2v65RecyHZVUN--oSmtzPDpmUHALd3Pqf79a1fKP9yxD8cA@mail.gmail.com>
X-Gm-Features: AWmQ_bkNL0jahcEQaqn8bSZ19J8F-ktWPPiEchcfhtJA1Ye9Nhc1HXJ4hMb0Q_M
Message-ID: <CAGb2v65RecyHZVUN--oSmtzPDpmUHALd3Pqf79a1fKP9yxD8cA@mail.gmail.com>
Subject: Re: [PATCH 26/30] drm/sun4i: mixer: Add quirk for number of VI scalers
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
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
Reply-To: wens@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 13, 2025 at 3:24=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> On DE2 and DE3, UI scalers are located right after VI scalers. So in
> order to calculate proper UI scaler base address, number of VI scalers
> must be known. In practice, it is same as number of VI channels, but it
> doesn't need to be.
>
> Let's make a quirk for this number. Code for configuring channels and
> associated functions won't have access to vi_num quirk anymore after
> rework for independent planes.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  drivers/gpu/drm/sun4i/sun8i_mixer.c     | 11 +++++++++++
>  drivers/gpu/drm/sun4i/sun8i_mixer.h     |  2 ++
>  drivers/gpu/drm/sun4i/sun8i_ui_scaler.c | 10 +++++-----
>  3 files changed, 18 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/=
sun8i_mixer.c
> index 78bbfbe62833..f9131396f22f 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> @@ -708,6 +708,7 @@ static const struct sun8i_mixer_cfg sun8i_a83t_mixer0=
_cfg =3D {
>         .scaler_mask    =3D 0xf,
>         .scanline_yuv   =3D 2048,
>         .de2_fcc_alpha  =3D 1,
> +       .vi_scaler_num  =3D 1,
>         .ui_num         =3D 3,
>         .vi_num         =3D 1,
>  };
> @@ -718,6 +719,7 @@ static const struct sun8i_mixer_cfg sun8i_a83t_mixer1=
_cfg =3D {
>         .scaler_mask    =3D 0x3,
>         .scanline_yuv   =3D 2048,
>         .de2_fcc_alpha  =3D 1,
> +       .vi_scaler_num  =3D 1,
>         .ui_num         =3D 1,
>         .vi_num         =3D 1,
>  };
> @@ -729,6 +731,7 @@ static const struct sun8i_mixer_cfg sun8i_h3_mixer0_c=
fg =3D {
>         .scaler_mask    =3D 0xf,
>         .scanline_yuv   =3D 2048,
>         .de2_fcc_alpha  =3D 1,
> +       .vi_scaler_num  =3D 1,
>         .ui_num         =3D 3,
>         .vi_num         =3D 1,
>  };
> @@ -740,6 +743,7 @@ static const struct sun8i_mixer_cfg sun8i_r40_mixer0_=
cfg =3D {
>         .scaler_mask    =3D 0xf,
>         .scanline_yuv   =3D 2048,
>         .de2_fcc_alpha  =3D 1,
> +       .vi_scaler_num  =3D 1,
>         .ui_num         =3D 3,
>         .vi_num         =3D 1,
>  };
> @@ -751,6 +755,7 @@ static const struct sun8i_mixer_cfg sun8i_r40_mixer1_=
cfg =3D {
>         .scaler_mask    =3D 0x3,
>         .scanline_yuv   =3D 2048,
>         .de2_fcc_alpha  =3D 1,
> +       .vi_scaler_num  =3D 1,
>         .ui_num         =3D 1,
>         .vi_num         =3D 1,
>  };
> @@ -761,6 +766,7 @@ static const struct sun8i_mixer_cfg sun8i_v3s_mixer_c=
fg =3D {
>         .ui_num =3D 1,
>         .scaler_mask =3D 0x3,
>         .scanline_yuv =3D 2048,
> +       .vi_scaler_num  =3D 2,
>         .ccsc =3D CCSC_MIXER0_LAYOUT,
>         .mod_rate =3D 150000000,
>  };
> @@ -772,6 +778,7 @@ static const struct sun8i_mixer_cfg sun20i_d1_mixer0_=
cfg =3D {
>         .scaler_mask    =3D 0x3,
>         .scanline_yuv   =3D 2048,
>         .de2_fcc_alpha  =3D 1,
> +       .vi_scaler_num  =3D 1,
>         .ui_num         =3D 1,
>         .vi_num         =3D 1,
>  };
> @@ -783,6 +790,7 @@ static const struct sun8i_mixer_cfg sun20i_d1_mixer1_=
cfg =3D {
>         .scaler_mask    =3D 0x1,
>         .scanline_yuv   =3D 1024,
>         .de2_fcc_alpha  =3D 1,
> +       .vi_scaler_num  =3D 1,
>         .ui_num         =3D 0,
>         .vi_num         =3D 1,
>  };
> @@ -794,6 +802,7 @@ static const struct sun8i_mixer_cfg sun50i_a64_mixer0=
_cfg =3D {
>         .scaler_mask    =3D 0xf,
>         .scanline_yuv   =3D 4096,
>         .de2_fcc_alpha  =3D 1,
> +       .vi_scaler_num  =3D 1,
>         .ui_num         =3D 3,
>         .vi_num         =3D 1,
>  };
> @@ -805,6 +814,7 @@ static const struct sun8i_mixer_cfg sun50i_a64_mixer1=
_cfg =3D {
>         .scaler_mask    =3D 0x3,
>         .scanline_yuv   =3D 2048,
>         .de2_fcc_alpha  =3D 1,
> +       .vi_scaler_num  =3D 1,
>         .ui_num         =3D 1,
>         .vi_num         =3D 1,
>  };
> @@ -814,6 +824,7 @@ static const struct sun8i_mixer_cfg sun50i_h6_mixer0_=
cfg =3D {
>         .mod_rate       =3D 600000000,
>         .scaler_mask    =3D 0xf,
>         .scanline_yuv   =3D 4096,
> +       .vi_scaler_num  =3D 1,
>         .ui_num         =3D 3,
>         .vi_num         =3D 1,
>  };
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/=
sun8i_mixer.h
> index def07afd37e1..40b800022237 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
> @@ -178,6 +178,7 @@ enum sun8i_mixer_type {
>   * @scaline_yuv: size of a scanline for VI scaler for YUV formats.
>   * @de2_fcc_alpha: use FCC for missing DE2 VI alpha capability
>   *     Most DE2 cores has FCC. If number of VI planes is one, enable thi=
s.
> + * @vi_scaler_num: Number of VI scalers. Used on DE2 and DE3.
>   * @map: channel map for DE variants processing YUV separately (DE33)
>   */
>  struct sun8i_mixer_cfg {
> @@ -189,6 +190,7 @@ struct sun8i_mixer_cfg {
>         unsigned int    de_type;
>         unsigned int    scanline_yuv;
>         unsigned int    de2_fcc_alpha : 1;
> +       unsigned int    vi_scaler_num;

This could be a smaller type. Please do a sweep of the struct after the
refactoring is done and see if any of the types could be shrunk.

And just a nitpick, but I would probably insert it above scaler_mask.


Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
