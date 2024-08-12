Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FB594FA14
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 00:59:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 941AF10E1AE;
	Mon, 12 Aug 2024 22:59:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="ZTBFv77s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD65310E1AE
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 22:59:48 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id
 46e09a7af769-70968db52d0so5135357a34.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 15:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1723503587; x=1724108387;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5ENm0R32ljVSLiP588ivQL+EpMS161fFo6/+DPyhWgc=;
 b=ZTBFv77sAwHIdvWeZAce4+jj5ALPPR+K6ZJLQvvtyxpU2oV0GfHAL1WaiFErAZbV7t
 wwIySATWKSOfMhRPUPenzZQgqxmiv2SoMbfisi/ErZO/5KGZ2kKVCiw28fmVrDxulDyR
 t/ycUYXDPQKqPQIZzMlSaedCVEjeCFgsTrx2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723503587; x=1724108387;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5ENm0R32ljVSLiP588ivQL+EpMS161fFo6/+DPyhWgc=;
 b=mqrdNWhpPNk6doabnqAK4jMCZFhpd04ETdrzt8qUKpP4QmDB+l9Ya0L1HeeRPe//Np
 N/m0Cv7uRXEy3V9Y8blwz1NBavtSatiJQ+F9dOM13IG2vGcUj9fskV0n+LGIfGVnez6r
 CpDyCukimB9xUiz1knKX4mnA4mdoEje06GvfqmdS3ZKfYz84vpNyqdsMS0ZlsvdnKSuC
 YKw1dbGNUotKDrFVYRayfRqnsXyxCur712PfPO7u4CbIXWjtcbmFP8mX5yImP1fzTZzd
 UPYhQe2LkWUhY+u2ucuPyNqaJHEqIhrWf17S88h613rvM75xQo59ytE7YM4yG5l+mig0
 7t5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMi+ppMU/gQdQ59v2nY7Ya++yFmk1ZAwiQ7DC1ZRXGAMltcf8P3fS0THWmxZvIMj6j3JXYdXZOITUfD0HgNtZWSR+LFvZNmGRsQvQSiFTK
X-Gm-Message-State: AOJu0YxwRkQveQsk2SlNovfmRqjri3jmnUJLz1+4wJ5eYhVF/HrOoqkH
 QTBTCR07dPbcHTlin5DHq9FYO0sGFrnUbyuvJrVpMNYDdzpoxLFq7cScdo48ERrH93X/DWwhY+0
 =
X-Google-Smtp-Source: AGHT+IGm8N0+Kkci47MNOwPc4F1bHTzc6wmYSxMJxdk+C5KmnE+zRfx9smQIo/9yyDLIUc+vJb13Xg==
X-Received: by 2002:a05:6830:3150:b0:709:400a:5f88 with SMTP id
 46e09a7af769-70c9389962emr1730844a34.11.1723503587181; 
 Mon, 12 Aug 2024 15:59:47 -0700 (PDT)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com.
 [209.85.210.45]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-70c7b89052dsm1570353a34.70.2024.08.12.15.59.46
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Aug 2024 15:59:46 -0700 (PDT)
Received: by mail-ot1-f45.google.com with SMTP id
 46e09a7af769-7093997dffdso1920835a34.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 15:59:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUyLwJ0mVhFy3rmUFN1ZqOm9HwUmgGM58S8xa/XNSH/EFWH6I3dbLCbJ4X+cuPemMxoLigXeAm6QelhogNH5y8SXqFqIgIrUVoiAd/6TAAA
X-Received: by 2002:a05:6358:430e:b0:19f:4c1b:f0f8 with SMTP id
 e5c5f4694b2df-1b19d2e6507mr253084955d.24.1723503585569; Mon, 12 Aug 2024
 15:59:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240810045404.188146-1-tejasvipin76@gmail.com>
 <20240810045404.188146-3-tejasvipin76@gmail.com>
In-Reply-To: <20240810045404.188146-3-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 12 Aug 2024 15:59:33 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XPX+q9wVO4h2P_4JASoFeAozLP5uDqAXj7fxZe4woj9w@mail.gmail.com>
Message-ID: <CAD=FV=XPX+q9wVO4h2P_4JASoFeAozLP5uDqAXj7fxZe4woj9w@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/panel: jdi-fhd-r63452: transition to mipi_dsi
 wrapped functions
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, airlied@gmail.com, 
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
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

On Fri, Aug 9, 2024 at 9:55=E2=80=AFPM Tejas Vipin <tejasvipin76@gmail.com>=
 wrote:
>
> @@ -41,79 +41,41 @@ static void jdi_fhd_r63452_reset(struct jdi_fhd_r6345=
2 *ctx)
>  static int jdi_fhd_r63452_on(struct jdi_fhd_r63452 *ctx)
>  {
>         struct mipi_dsi_device *dsi =3D ctx->dsi;
> -       struct device *dev =3D &dsi->dev;
> -       int ret;
> +       struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi };
>
>         dsi->mode_flags |=3D MIPI_DSI_MODE_LPM;
>
> -       mipi_dsi_generic_write_seq(dsi, 0xb0, 0x00);
> -       mipi_dsi_generic_write_seq(dsi, 0xd6, 0x01);
> -       mipi_dsi_generic_write_seq(dsi, 0xec,
> -                                  0x64, 0xdc, 0xec, 0x3b, 0x52, 0x00, 0x=
0b, 0x0b,
> -                                  0x13, 0x15, 0x68, 0x0b, 0xb5);
> -       mipi_dsi_generic_write_seq(dsi, 0xb0, 0x03);
> +       mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb0, 0x00);
> +       mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xd6, 0x01);
> +       mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xec,
> +                                        0x64, 0xdc, 0xec, 0x3b, 0x52, 0x=
00, 0x0b, 0x0b,
> +                                        0x13, 0x15, 0x68, 0x0b, 0xb5);
> +       mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb0, 0x03);
>
> -       ret =3D mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLA=
NK);
> -       if (ret < 0) {
> -               dev_err(dev, "Failed to set tear on: %d\n", ret);
> -               return ret;
> -       }
> +       mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_V=
BLANK);
>
> -       mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_ADDRESS_MODE, 0x00);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_ADDRESS_MODE,=
 0x00);
>
> -       ret =3D mipi_dsi_dcs_set_pixel_format(dsi, 0x77);
> -       if (ret < 0) {
> -               dev_err(dev, "Failed to set pixel format: %d\n", ret);
> -               return ret;
> -       }
> +       mipi_dsi_dcs_set_pixel_format_multi(&dsi_ctx, 0x77);
> +       mipi_dsi_dcs_set_column_address_multi(&dsi_ctx, 0x0000, 0x0437);
> +       mipi_dsi_dcs_set_page_address_multi(&dsi_ctx, 0x0000, 0x077f);
> +       mipi_dsi_dcs_set_tear_scanline_multi(&dsi_ctx, 0x0000);
> +       mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx, 0x00ff);
>
> -       ret =3D mipi_dsi_dcs_set_column_address(dsi, 0x0000, 0x0437);
> -       if (ret < 0) {
> -               dev_err(dev, "Failed to set column address: %d\n", ret);
> -               return ret;
> -       }
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DIS=
PLAY, 0x24);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_POWER_SAVE,=
 0x00);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_CABC_MIN_BRIG=
HTNESS, 0x00);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x84, 0x00);
>
> -       ret =3D mipi_dsi_dcs_set_page_address(dsi, 0x0000, 0x077f);
> -       if (ret < 0) {
> -               dev_err(dev, "Failed to set page address: %d\n", ret);
> -               return ret;
> -       }
> -
> -       ret =3D mipi_dsi_dcs_set_tear_scanline(dsi, 0x0000);
> -       if (ret < 0) {
> -               dev_err(dev, "Failed to set tear scanline: %d\n", ret);
> -               return ret;
> -       }
> +       mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> +       mipi_dsi_msleep(&dsi_ctx, 20);
> +       mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> +       mipi_dsi_msleep(&dsi_ctx, 80);
>
> -       ret =3D mipi_dsi_dcs_set_display_brightness(dsi, 0x00ff);
> -       if (ret < 0) {
> -               dev_err(dev, "Failed to set display brightness: %d\n", re=
t);
> -               return ret;
> -       }
> -
> -       mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x24)=
;
> -       mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
> -       mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_CABC_MIN_BRIGHTNESS, 0x0=
0);
> -       mipi_dsi_dcs_write_seq(dsi, 0x84, 0x00);
> -
> -       ret =3D mipi_dsi_dcs_set_display_on(dsi);
> -       if (ret < 0) {
> -               dev_err(dev, "Failed to set display on: %d\n", ret);
> -               return ret;
> -       }
> -       msleep(20);
> -
> -       ret =3D mipi_dsi_dcs_exit_sleep_mode(dsi);
> -       if (ret < 0) {
> -               dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
> -               return ret;
> -       }
> -       msleep(80);
> -
> -       mipi_dsi_generic_write_seq(dsi, 0xb0, 0x04);
> -       mipi_dsi_dcs_write_seq(dsi, 0x84, 0x00);
> -       mipi_dsi_generic_write_seq(dsi, 0xc8, 0x11);
> -       mipi_dsi_generic_write_seq(dsi, 0xb0, 0x03);
> +       mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb0, 0x04);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x84, 0x00);
> +       mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xc8, 0x11);
> +       mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb0, 0x03);
>
>         return 0;

Whoops! Not "return 0". "return dsi_ctx.accum_err".


> @@ -121,31 +83,22 @@ static int jdi_fhd_r63452_on(struct jdi_fhd_r63452 *=
ctx)
>  static int jdi_fhd_r63452_off(struct jdi_fhd_r63452 *ctx)
>  {
>         struct mipi_dsi_device *dsi =3D ctx->dsi;
> -       struct device *dev =3D &dsi->dev;
> -       int ret;
> +       struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi };
>
>         dsi->mode_flags &=3D ~MIPI_DSI_MODE_LPM;
>
> -       mipi_dsi_generic_write_seq(dsi, 0xb0, 0x00);
> -       mipi_dsi_generic_write_seq(dsi, 0xd6, 0x01);
> -       mipi_dsi_generic_write_seq(dsi, 0xec,
> -                                  0x64, 0xdc, 0xec, 0x3b, 0x52, 0x00, 0x=
0b, 0x0b,
> -                                  0x13, 0x15, 0x68, 0x0b, 0x95);
> -       mipi_dsi_generic_write_seq(dsi, 0xb0, 0x03);
> -
> -       ret =3D mipi_dsi_dcs_set_display_off(dsi);
> -       if (ret < 0) {
> -               dev_err(dev, "Failed to set display off: %d\n", ret);
> -               return ret;
> -       }
> -       usleep_range(2000, 3000);
> -
> -       ret =3D mipi_dsi_dcs_enter_sleep_mode(dsi);
> -       if (ret < 0) {
> -               dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
> -               return ret;
> -       }
> -       msleep(120);
> +       mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb0, 0x00);
> +       mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xd6, 0x01);
> +       mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xec,
> +                                        0x64, 0xdc, 0xec, 0x3b, 0x52, 0x=
00, 0x0b, 0x0b,
> +                                        0x13, 0x15, 0x68, 0x0b, 0x95);
> +       mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb0, 0x03);
> +
> +       mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> +       if (!dsi_ctx.accum_err)
> +               usleep_range(2000, 3000);
> +       mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> +       mipi_dsi_msleep(&dsi_ctx, 120);
>
>         return 0;

Whoops! Not "return 0". "return dsi_ctx.accum_err".

Aside from that, this looks really nice to me. The code is much more
succinct and I bet much smaller.

FWIW, I won't insist, but I wouldn't object to this patch also fixing
the callers of jdi_fhd_r63452_on() and jdi_fhd_r63452_off() so that
they no longer print error messages since the _multi functions are
always chatty and thus they're just extra double-prints. If you do
this, jdi_fhd_r63452_off() could actually be a function that returned
"void". ...then you might want to add a comment saying why
jdi_fhd_r63452_unprepare() doesn't pass on any errors. That would be
something like "NOTE: even if sending one of the poweroff commands
failed, we won't return an error here. While the panel won't have been
cleanly turned off at least we've asserted the reset signal so it
should be safe to power it back on again later". ...or something like
that.
