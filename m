Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8639690252D
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 17:15:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F30110E3D5;
	Mon, 10 Jun 2024 15:15:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="HZGFNhEr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D445010E4A1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 15:15:01 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-796df041d73so64363785a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 08:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718032498; x=1718637298;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V8k131QfovC2BNlbUq5Ew31XLDovv9vVvADmI61e7PE=;
 b=HZGFNhErJwfWFnL8pg99ZZfxJJFqEDNGzyM7Oe4CoMd/PxD6CvB8VOCKjvMQYLyQJQ
 eJ4/Y724oNbVNlAW+a6L4d9gpFnlL5BwL/bUAUUtcyJJjM7N6YPeg7YdPt+olaf032P4
 tDKG1xToAdBR0fIA0BewYpqQGccPaYVv2lZr0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718032498; x=1718637298;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V8k131QfovC2BNlbUq5Ew31XLDovv9vVvADmI61e7PE=;
 b=Hmksmv0NgB3aBTJXhQTKSe804U1/nF725EVW6jVHKy+eaikNaCN6j2HpQjYlvJg0AJ
 dw3uLkqJJMPaRJR5ullw5n09H8eW07et2SndcZulGacofDae/GjUw2Rks8etkgBTqq8M
 mHNlOwj07/T154ZrG7Mz11a0jIr2NLY2ny1NI+lG8R8jcDze9ngnrJzlnjNgsMTcIBPL
 FW1ZOzwvjomULu51rDZZNpluYl7gw5MEO38hb4k9/BwAsIPNpqYyewOzsbZn3yNx4FHz
 r/RgQfiuLv3//63woLIpmG8DKjjatsT6RkoF9EtL0rqAhoS+2BU9if4c4ulXAeIG3ibp
 lJSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHLb4PZAXd2itMWMuziesGO7iRJBGMEKVsY7mQEp5m/nCP6+becImgQVt6pyR7TAce1fk1pClYhsf5rbOBneRKrmYtPNikBY+StLfmUS+z
X-Gm-Message-State: AOJu0Yyg7NkR95A9N+Cp7c6rDjJnYO9URnXBlai7NcKa6grYi9sFOGEj
 rG3NOvKJhG+QfsG4d75Z82D8IcuVrP79IP5oZo5h8NN91FwYi4azZQj2dlemOL+layB8tSXq02g
 =
X-Google-Smtp-Source: AGHT+IG2MdOFe3E1r/2bO01U7CIe0F2TJwGxCBZNd8dpsIrxD5zoLM6Nbv3TJ5gWN0VGX4HVbm8gbQ==
X-Received: by 2002:a05:6214:318a:b0:6af:4c7:2c04 with SMTP id
 6a1803df08f44-6b059f840c4mr102462186d6.55.1718032497702; 
 Mon, 10 Jun 2024 08:14:57 -0700 (PDT)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com.
 [209.85.160.170]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b0789aa042sm15380956d6.81.2024.06.10.08.14.56
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jun 2024 08:14:57 -0700 (PDT)
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-44056f72257so574561cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 08:14:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXJgUOHC3d+z8RoMQrBKkK7PRTpzNBbHKYnKIS+QzGskhMMNJNOPeuhSDG/V/YcFBF2Q+3NbmZJfN5tmcQ6AIicHk4xg5RCKZFQtQCpga2n
X-Received: by 2002:a05:622a:5986:b0:43f:f54d:8a6d with SMTP id
 d75a77b69052e-440562b2805mr6885921cf.4.1718032495826; Mon, 10 Jun 2024
 08:14:55 -0700 (PDT)
MIME-Version: 1.0
References: <485eef24-ddad-466a-a89f-f9f226801bb7@gmail.com>
In-Reply-To: <485eef24-ddad-466a-a89f-f9f226801bb7@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 10 Jun 2024 08:14:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UZNQ8Beg7mZMNLh8FrenchGVt9SJAPdwHMZ8bPvo57mQ@mail.gmail.com>
Message-ID: <CAD=FV=UZNQ8Beg7mZMNLh8FrenchGVt9SJAPdwHMZ8bPvo57mQ@mail.gmail.com>
Subject: Re: Subject: [PATCH] drm/panel : truly-nt35521: transition to
 mipi_dsi wrapped functions
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
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

On Sat, Jun 8, 2024 at 3:57=E2=80=AFAM Tejas Vipin <tejasvipin76@gmail.com>=
 wrote:
>
> Use functions introduced in 966e397e4f603 ("drm/mipi-dsi: Introduce
> mipi_dsi_*_write_seq_multi()") and f79d6d28d8fe
> ("drm/mipi-dsi: wrap more functions for streamline handling") for the
> sony tulip truly nt35521 panel.

Running "scripts/checkpatch.pl" will yell about the above. You're
supposed to write the word "commit" before the git hash. AKA:

Use functions introduced in commit 966e397e4f603  ("drm/mipi-dsi:
Introduce mipi_dsi_*_write_seq_multi()") and commit f79d6d28d8fe
("drm/mipi-dsi: wrap more functions for streamline handling") for
the...


> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
>  .../panel/panel-sony-tulip-truly-nt35521.c    | 383 +++++++++---------
>  1 file changed, 183 insertions(+), 200 deletions(-)

The subject of your patch has an extra "Subject:" prefix. See:

https://lore.kernel.org/r/485eef24-ddad-466a-a89f-f9f226801bb7@gmail.com

...where you can see "Subject: Subject:". Maybe use "b4" or "patman"
to help you send your patch?


> diff --git a/drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c b/dri=
vers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c
> index 6d44970dccd9..13472c7c37f5 100644
> --- a/drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c
> +++ b/drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c
> @@ -44,248 +44,231 @@ static void truly_nt35521_reset(struct truly_nt3552=
1 *ctx)
>  static int truly_nt35521_on(struct truly_nt35521 *ctx)
>  {
>         struct mipi_dsi_device *dsi =3D ctx->dsi;
> -       struct device *dev =3D &dsi->dev;
> -       int ret;
>
>         dsi->mode_flags |=3D MIPI_DSI_MODE_LPM;
>
> -       mipi_dsi_generic_write_seq(dsi, 0xf0, 0x55, 0xaa, 0x52, 0x08, 0x0=
0);
> -       mipi_dsi_generic_write_seq(dsi, 0xff, 0xaa, 0x55, 0xa5, 0x80);
> -       mipi_dsi_generic_write_seq(dsi, 0x6f, 0x11, 0x00);
> -       mipi_dsi_generic_write_seq(dsi, 0xf7, 0x20, 0x00);
> -       mipi_dsi_generic_write_seq(dsi, 0x6f, 0x01);
> -       mipi_dsi_generic_write_seq(dsi, 0xb1, 0x21);
> -       mipi_dsi_generic_write_seq(dsi, 0xbd, 0x01, 0xa0, 0x10, 0x08, 0x0=
1);
> -       mipi_dsi_generic_write_seq(dsi, 0xb8, 0x01, 0x02, 0x0c, 0x02);
> -       mipi_dsi_generic_write_seq(dsi, 0xbb, 0x11, 0x11);
> -       mipi_dsi_generic_write_seq(dsi, 0xbc, 0x00, 0x00);
> -       mipi_dsi_generic_write_seq(dsi, 0xb6, 0x02);
> -       mipi_dsi_generic_write_seq(dsi, 0xf0, 0x55, 0xaa, 0x52, 0x08, 0x0=
1);
> -       mipi_dsi_generic_write_seq(dsi, 0xb0, 0x09, 0x09);
> -       mipi_dsi_generic_write_seq(dsi, 0xb1, 0x09, 0x09);
> -       mipi_dsi_generic_write_seq(dsi, 0xbc, 0x8c, 0x00);
> -       mipi_dsi_generic_write_seq(dsi, 0xbd, 0x8c, 0x00);
> -       mipi_dsi_generic_write_seq(dsi, 0xca, 0x00);
> -       mipi_dsi_generic_write_seq(dsi, 0xc0, 0x04);
> -       mipi_dsi_generic_write_seq(dsi, 0xbe, 0xb5);
> -       mipi_dsi_generic_write_seq(dsi, 0xb3, 0x35, 0x35);
> -       mipi_dsi_generic_write_seq(dsi, 0xb4, 0x25, 0x25);
> -       mipi_dsi_generic_write_seq(dsi, 0xb9, 0x43, 0x43);
> -       mipi_dsi_generic_write_seq(dsi, 0xba, 0x24, 0x24);
> -       mipi_dsi_generic_write_seq(dsi, 0xf0, 0x55, 0xaa, 0x52, 0x08, 0x0=
2);
> -       mipi_dsi_generic_write_seq(dsi, 0xee, 0x03);
> -       mipi_dsi_generic_write_seq(dsi, 0xb0,
> +       struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi };

Please move the variable declaration above the line "dsi->mode_flags
|=3D MIPI_DSI_MODE_LPM;"


> +       mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xf0, 0x55, 0xaa, 0x52=
, 0x08, 0x00);
> +       mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xff, 0xaa, 0x55, 0xa5=
, 0x80);
> +       mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x6f, 0x11, 0x00);
> +       mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xf7, 0x20, 0x00);
> +       mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x6f, 0x01);
> +       mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb1, 0x21);
> +       mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xbd, 0x01, 0xa0, 0x10=
, 0x08, 0x01);
> +       mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb8, 0x01, 0x02, 0x0c=
, 0x02);
> +       mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xbb, 0x11, 0x11);
> +       mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xbc, 0x00, 0x00);
> +       mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb6, 0x02);
> +       mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xf0, 0x55, 0xaa, 0x52=
, 0x08, 0x01);
> +       mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb0, 0x09, 0x09);
> +       mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb1, 0x09, 0x09);
> +       mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xbc, 0x8c, 0x00);
> +       mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xbd, 0x8c, 0x00);
> +       mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xca, 0x00);
> +       mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xc0, 0x04);
> +       mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xbe, 0xb5);
> +       mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb3, 0x35, 0x35);
> +       mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb4, 0x25, 0x25);
> +       mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb9, 0x43, 0x43);
> +       mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xba, 0x24, 0x24);
> +       mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xf0, 0x55, 0xaa, 0x52=
, 0x08, 0x02);
> +       mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xee, 0x03);
> +       mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb0,
>                                    0x00, 0xb2, 0x00, 0xb3, 0x00, 0xb6, 0x=
00, 0xc3,
>                                    0x00, 0xce, 0x00, 0xe1, 0x00, 0xf3, 0x=
01, 0x11);

Please adjust the indentation for the followup lines to match. Right
now they line up properly with the old function name, but not the new
one.


>  static int truly_nt35521_off(struct truly_nt35521 *ctx)
>  {
>         struct mipi_dsi_device *dsi =3D ctx->dsi;
> -       struct device *dev =3D &dsi->dev;
> -       int ret;
>
>         dsi->mode_flags &=3D ~MIPI_DSI_MODE_LPM;
>
> -       ret =3D mipi_dsi_dcs_set_display_off(dsi);
> -       if (ret < 0) {
> -               dev_err(dev, "Failed to set display off: %d\n", ret);
> -               return ret;
> -       }
> -       msleep(50);
> +       struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi };

Please move the variable declaration above the line "dsi->mode_flags
&=3D ~MIPI_DSI_MODE_LPM;"

-Doug
