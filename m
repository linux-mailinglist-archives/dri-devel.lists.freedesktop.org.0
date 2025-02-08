Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 286E4A2D889
	for <lists+dri-devel@lfdr.de>; Sat,  8 Feb 2025 21:19:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94FD210E124;
	Sat,  8 Feb 2025 20:19:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="ZMCDOlmT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CB7010E124
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Feb 2025 20:19:04 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-30762598511so31564301fa.0
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Feb 2025 12:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1739045941; x=1739650741;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nev1SLQZQQHmDHpF4OBWN7y4nvz5UF/4e0pDV1IuWdI=;
 b=ZMCDOlmTCfG7secTthrpJTBdhFRCjf+msqjfxN88xOvy29X7vrP0R6g8afpB3kNJ1J
 E1h/fISBQ2+V4HNDlxKj4sjMmswUaPTIa1Pm9Pu2C6IopW3q4Wh6gMqPEbf3mfImGTdk
 tBxozPkYyltbKd9+yWxt35IzY3fxj8/UVbuJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739045941; x=1739650741;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nev1SLQZQQHmDHpF4OBWN7y4nvz5UF/4e0pDV1IuWdI=;
 b=kJVq7ioUlS/CZm3po98q/kwJrPLBkzUyXxOMN4DneZfb9wygVNCywbXnt7/vhX89u/
 OM1NzYOKI5TSg3VCsi8gbxy47aPl8Vha6xhO/3YmGF+N6SqBubNrfL1uXOMGxSZQsi/y
 FoVR9IFkl0t4wnbTJhv0AAWVbkL1clDw4wASwU+qgC5n6H0AWSPJFPxn0JUVlLvbTQu2
 kRGFwcgKuF7bi0rNBMV9FLFiX03Ej8HJ8nHKMRh3Qe5Z1JrWPIIN2PPCe7JoqqiGTrhJ
 /VvPRrgAiZyyoFFPuJb6Nt55RFCnHt1k2thGDgKowhmzDOdyy/iQN9eSuirJAoBCqaHq
 FZkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWP1mG0VQODzCfpUAsWXqLskSBmCxJ71c4raFpsDfJ4SA7pqOV0M/vK5ierW1tgEq9zoepBLI0ea1s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVoMueLdnifm+/7OHbzh7ZsrP+R895amDfFb3a22PRXDANZmo/
 gMtNesazGa4iDuVFoeDNBdGHpsOT2CjGK9TEbn7mGlqGImUPwhPQvdfmKc+5dF0KMM4ud4VwOMh
 e5cxT
X-Gm-Gg: ASbGnctBlOPx0QqWWSFmTUlcRLp9AJ4SCKqK8qExyz1j5yyPLjqoM5NBHXjg94PuZQQ
 ek6rsgzD8Q/ctcsSQDj5Q7MWS8Nn82b9bjM4DNLGR6n2+GW0TVtsCGb/nh8l35DqEW+bwgSFkOW
 TE6/jmLiITsF/Pax3NBbeolup2Yo425SZSySqPzsqgsXA6ap1SIun5CJkh+m2Dway12AMhiMgQ8
 sTpLuB4qTHEz8EbDW1Sl9F3/5W3FRKQYkvUbh8TQvsWrxKM4ocSDHaqrGwg1p03p9ZlleLGUi2c
 rfYuqZ85Hx2Tx9X9kr198LgRkdYAH5gWyQzMr/sqTfdar2EQ4SFq16AoPFY=
X-Google-Smtp-Source: AGHT+IF74N+8Fx6IlMkZp5KEgrnd3R+7I8YMkxgPx4v8EpvZyPGfgszoTBY5yTcEMcn5/fZQYavg4A==
X-Received: by 2002:a05:6512:159e:b0:540:1c18:4e38 with SMTP id
 2adb3069b0e04-54414aa88bemr2432273e87.28.1739045940580; 
 Sat, 08 Feb 2025 12:19:00 -0800 (PST)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com.
 [209.85.208.175]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5441060429fsm801383e87.243.2025.02.08.12.18.59
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Feb 2025 12:18:59 -0800 (PST)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-30795988ebeso30205021fa.3
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Feb 2025 12:18:59 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXhr7hHJyHQ057AmBJbj2X91nVEMmv1DkdGItqbwgJ2yb24LBMI0PklWepEjE7q7QMlHp1mp/jdFp8=@lists.freedesktop.org
X-Received: by 2002:ac2:5461:0:b0:545:3dd:aa68 with SMTP id
 2adb3069b0e04-54503ddac50mr1113948e87.32.1739045938669; Sat, 08 Feb 2025
 12:18:58 -0800 (PST)
MIME-Version: 1.0
References: <20250208051541.176667-1-tejasvipin76@gmail.com>
In-Reply-To: <20250208051541.176667-1-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sat, 8 Feb 2025 12:18:47 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WmOhHq4qQ5neDjfBy71za3AguvtQ9hFnwf0hwtwSmiqw@mail.gmail.com>
X-Gm-Features: AWEUYZm13bCaUiucxyQUvz1BOJ8yfU7zXn9Iokz6ONSlwhzPjfipmbHjpI1UbLc
Message-ID: <CAD=FV=WmOhHq4qQ5neDjfBy71za3AguvtQ9hFnwf0hwtwSmiqw@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: visionox-r66451: transition to mipi_dsi
 wrapped functions
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

Hi,

On Fri, Feb 7, 2025 at 9:16=E2=80=AFPM Tejas Vipin <tejasvipin76@gmail.com>=
 wrote:
>
> Change the visionox-r66451 panel to use multi style functions for
> improved error handling.
>
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
>  drivers/gpu/drm/panel/panel-visionox-r66451.c | 179 ++++++++----------
>  1 file changed, 76 insertions(+), 103 deletions(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-visionox-r66451.c b/drivers/gpu/=
drm/panel/panel-visionox-r66451.c
> index 493f2a6076f8..81d615e1937a 100644
> --- a/drivers/gpu/drm/panel/panel-visionox-r66451.c
> +++ b/drivers/gpu/drm/panel/panel-visionox-r66451.c
> @@ -42,85 +42,84 @@ static void visionox_r66451_reset(struct visionox_r66=
451 *ctx)
>  static int visionox_r66451_on(struct visionox_r66451 *ctx)
>  {
>         struct mipi_dsi_device *dsi =3D ctx->dsi;
> +       struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi };
>
>         dsi->mode_flags |=3D MIPI_DSI_MODE_LPM;
>
> -       mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x00);
> -       mipi_dsi_dcs_write_seq(dsi, 0xc2,
> -                              0x09, 0x24, 0x0c, 0x00, 0x00, 0x0c, 0x00, =
0x00, 0x00,
> -                              0x09, 0x3c);
> -       mipi_dsi_dcs_write_seq(dsi, 0xd7,
> -                              0x00, 0xb9, 0x3c, 0x00, 0x40, 0x04, 0x00, =
0xa0, 0x0a,
> -                              0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, =
0x00, 0x19,
> -                              0x3c, 0x00, 0x40, 0x04, 0x00, 0xa0, 0x0a);
> -       mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x80);
> -       mipi_dsi_dcs_write_seq(dsi, 0xde,
> -                              0x40, 0x00, 0x18, 0x00, 0x18, 0x00, 0x18, =
0x00, 0x18,
> -                              0x10, 0x00, 0x18, 0x00, 0x18, 0x00, 0x18, =
0x02, 0x00, 0x00);
> -       mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x04);
> -       mipi_dsi_dcs_write_seq(dsi, 0xe8, 0x00, 0x02);
> -       mipi_dsi_dcs_write_seq(dsi, 0xe4, 0x00, 0x08);
> -       mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x00);
> -       mipi_dsi_dcs_write_seq(dsi, 0xc4,
> -                              0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, =
0x00, 0x00,
> -                              0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x32);
> -       mipi_dsi_dcs_write_seq(dsi, 0xcf,
> -                              0x64, 0x0b, 0x00, 0x00, 0x00, 0x00, 0x00, =
0x00, 0x08,
> -                              0x00, 0x0b, 0x77, 0x01, 0x01, 0x01, 0x01, =
0x01, 0x01,
> -                              0x02, 0x02, 0x02, 0x02, 0x02, 0x03);
> -       mipi_dsi_dcs_write_seq(dsi, 0xd3,
> -                              0x45, 0x00, 0x00, 0x01, 0x13, 0x15, 0x00, =
0x15, 0x07,
> -                              0x0f, 0x77, 0x77, 0x77, 0x37, 0xb2, 0x11, =
0x00, 0xa0,
> -                              0x3c, 0x9c);
> -       mipi_dsi_dcs_write_seq(dsi, 0xd7,
> -                              0x00, 0xb9, 0x34, 0x00, 0x40, 0x04, 0x00, =
0xa0, 0x0a,
> -                              0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, =
0x00, 0x19,
> -                              0x34, 0x00, 0x40, 0x04, 0x00, 0xa0, 0x0a);
> -       mipi_dsi_dcs_write_seq(dsi, 0xd8,
> -                              0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, =
0x00, 0x00,
> -                              0x3a, 0x00, 0x3a, 0x00, 0x3a, 0x00, 0x3a, =
0x00, 0x3a,
> -                              0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, =
0x00, 0x00,
> -                              0x00, 0x0a, 0x00, 0x0a, 0x00, 0x00, 0x00, =
0x00, 0x00,
> -                              0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, =
0x00, 0x0a,
> -                              0x00, 0x32, 0x00, 0x0a, 0x00, 0x22);
> -       mipi_dsi_dcs_write_seq(dsi, 0xdf,
> -                              0x50, 0x42, 0x58, 0x81, 0x2d, 0x00, 0x00, =
0x00, 0x00,
> -                              0x00, 0x00, 0x6b, 0x00, 0x00, 0x00, 0x00, =
0x00, 0x00,
> -                              0x00, 0x00, 0x01, 0x0f, 0xff, 0xd4, 0x0e, =
0x00, 0x00,
> -                              0x00, 0x00, 0x00, 0x00, 0x0f, 0x53, 0xf1, =
0x00, 0x00,
> -                              0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
> -       mipi_dsi_dcs_write_seq(dsi, 0xf7, 0x01);
> -       mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x80);
> -       mipi_dsi_dcs_write_seq(dsi, 0xe4, 0x34, 0xb4, 0x00, 0x00, 0x00, 0=
x39, 0x04, 0x09, 0x34);
> -       mipi_dsi_dcs_write_seq(dsi, 0xe6, 0x00);
> -       mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x04);
> -       mipi_dsi_dcs_write_seq(dsi, 0xdf, 0x50, 0x40);
> -       mipi_dsi_dcs_write_seq(dsi, 0xf3, 0x50, 0x00, 0x00, 0x00, 0x00);
> -       mipi_dsi_dcs_write_seq(dsi, 0xf2, 0x11);
> -       mipi_dsi_dcs_write_seq(dsi, 0xf3, 0x01, 0x00, 0x00, 0x00, 0x01);
> -       mipi_dsi_dcs_write_seq(dsi, 0xf4, 0x00, 0x02);
> -       mipi_dsi_dcs_write_seq(dsi, 0xf2, 0x19);
> -       mipi_dsi_dcs_write_seq(dsi, 0xdf, 0x50, 0x42);
> -       mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> -       mipi_dsi_dcs_set_column_address(dsi, 0, 1080 - 1);
> -       mipi_dsi_dcs_set_page_address(dsi, 0, 2340 - 1);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x00);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc2,
> +                                    0x09, 0x24, 0x0c, 0x00, 0x00, 0x0c, =
0x00, 0x00, 0x00,
> +                                    0x09, 0x3c);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd7,
> +                                    0x00, 0xb9, 0x3c, 0x00, 0x40, 0x04, =
0x00, 0xa0, 0x0a,
> +                                    0x00, 0x40, 0x00, 0x00, 0x00, 0x00, =
0x00, 0x00, 0x19,
> +                                    0x3c, 0x00, 0x40, 0x04, 0x00, 0xa0, =
0x0a);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x80);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xde,
> +                                    0x40, 0x00, 0x18, 0x00, 0x18, 0x00, =
0x18, 0x00, 0x18,
> +                                    0x10, 0x00, 0x18, 0x00, 0x18, 0x00, =
0x18, 0x02, 0x00, 0x00);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x04);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe8, 0x00, 0x02);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe4, 0x00, 0x08);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x00);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc4,
> +                                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, =
0x00, 0x00, 0x00,
> +                                    0x00, 0x00, 0x02, 0x00, 0x00, 0x00, =
0x32);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xcf,
> +                                    0x64, 0x0b, 0x00, 0x00, 0x00, 0x00, =
0x00, 0x00, 0x08,
> +                                    0x00, 0x0b, 0x77, 0x01, 0x01, 0x01, =
0x01, 0x01, 0x01,
> +                                    0x02, 0x02, 0x02, 0x02, 0x02, 0x03);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd3,
> +                                    0x45, 0x00, 0x00, 0x01, 0x13, 0x15, =
0x00, 0x15, 0x07,
> +                                    0x0f, 0x77, 0x77, 0x77, 0x37, 0xb2, =
0x11, 0x00, 0xa0,
> +                                    0x3c, 0x9c);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd7,
> +                                    0x00, 0xb9, 0x34, 0x00, 0x40, 0x04, =
0x00, 0xa0, 0x0a,
> +                                    0x00, 0x40, 0x00, 0x00, 0x00, 0x00, =
0x00, 0x00, 0x19,
> +                                    0x34, 0x00, 0x40, 0x04, 0x00, 0xa0, =
0x0a);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd8,
> +                                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, =
0x00, 0x00, 0x00,
> +                                    0x3a, 0x00, 0x3a, 0x00, 0x3a, 0x00, =
0x3a, 0x00, 0x3a,
> +                                    0x05, 0x00, 0x00, 0x00, 0x00, 0x00, =
0x00, 0x00, 0x00,
> +                                    0x00, 0x0a, 0x00, 0x0a, 0x00, 0x00, =
0x00, 0x00, 0x00,
> +                                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, =
0x00, 0x00, 0x0a,
> +                                    0x00, 0x32, 0x00, 0x0a, 0x00, 0x22);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xdf,
> +                                    0x50, 0x42, 0x58, 0x81, 0x2d, 0x00, =
0x00, 0x00, 0x00,
> +                                    0x00, 0x00, 0x6b, 0x00, 0x00, 0x00, =
0x00, 0x00, 0x00,
> +                                    0x00, 0x00, 0x01, 0x0f, 0xff, 0xd4, =
0x0e, 0x00, 0x00,
> +                                    0x00, 0x00, 0x00, 0x00, 0x0f, 0x53, =
0xf1, 0x00, 0x00,
> +                                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf7, 0x01);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x80);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe4, 0x34, 0xb4, 0x00, 0x=
00, 0x00, 0x39,
> +                                    0x04, 0x09, 0x34);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe6, 0x00);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x04);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xdf, 0x50, 0x40);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf3, 0x50, 0x00, 0x00, 0x=
00, 0x00);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf2, 0x11);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf3, 0x01, 0x00, 0x00, 0x=
00, 0x01);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf4, 0x00, 0x02);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf2, 0x19);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xdf, 0x50, 0x42);
> +       mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_V=
BLANK);
> +       mipi_dsi_dcs_set_column_address_multi(&dsi_ctx, 0, 1080 - 1);
> +       mipi_dsi_dcs_set_page_address_multi(&dsi_ctx, 0, 2340 - 1);
>
>         dsi->mode_flags &=3D ~MIPI_DSI_MODE_LPM;

I think that to match the old behavior the most correctly, you'd only
want to clear MIPI_DSI_MODE_LPM if there were no errors, right? All of
the old mipi_dsi_dcs_write_seq() calls would have returned early in
the case of an error because of that non-obvious control flow.

I'm not a total expert on MIPI_DSI_MODE_LPM, but I suspect your new
behavior is actually more correct, but it might not hurt to at least
point out this change in behavior in the commit message.


> @@ -187,25 +181,13 @@ static int visionox_r66451_enable(struct drm_panel =
*panel)
>         }
>
>         drm_dsc_pps_payload_pack(&pps, dsi->dsc);
> -       ret =3D mipi_dsi_picture_parameter_set(dsi, &pps);
> -       if (ret) {
> -               dev_err(&dsi->dev, "Failed to set PPS\n");
> -               return ret;
> -       }
> +       mipi_dsi_picture_parameter_set_multi(&dsi_ctx, &pps);
>
> -       ret =3D mipi_dsi_dcs_exit_sleep_mode(dsi);
> -       if (ret < 0) {
> -               dev_err(&dsi->dev, "Failed to exit sleep mode: %d\n", ret=
);
> -               return ret;
> -       }
> -       msleep(120);
> +       mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> +       mipi_dsi_msleep(&dsi_ctx, 120);
>
> -       ret =3D mipi_dsi_dcs_set_display_on(dsi);
> -       if (ret < 0) {
> -               dev_err(&dsi->dev, "Failed on set display on: %d\n", ret)=
;
> -               return ret;
> -       }
> -       msleep(20);
> +       mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> +       mipi_dsi_msleep(&dsi_ctx, 20);
>
>         return 0;

As Dmitry said, return dsi_ctx.accum_err


-Doug
