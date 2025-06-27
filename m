Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DDEAEBDAE
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 18:39:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44F3C10E27A;
	Fri, 27 Jun 2025 16:39:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SiDbWCYm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
 [209.85.166.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D400710E27A
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 16:39:50 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id
 e9e14a558f8ab-3df2ccbb895so509155ab.3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 09:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751042390; x=1751647190; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sSwQlatYo2hfWz4yZlz2QlGPM20UYuQK38iob7ZA/l4=;
 b=SiDbWCYmyvwn8ynprT1Ljj4yUPzf24UnRTw/9GpruT3K2Yu+rn5DxNsllB0UXqsu0s
 f+zlYsOwfeA/PpKbRa/VqQS4G1vFGtsFadJiAov9ZKoSsG0OMe6LySnMOfutDyEA80jC
 ZI6MebjGMoGQJP4I8dYGD+PxDSb8i0Tb/XG/IHMzGN1+hywDzhboT/pFGF6rPoOQFlbf
 a+LRewnEB5BAm6LHFZtAQYDlCaR1NiCQxCAta0jessC9KmlDAl2U4BTNuWfxAjJA3Tsl
 yF+/6Z9p7sZakwtxdnDv6L5ajr3uRGPzvkImpdG4HmULzOfKGR6p489J5dpX6nFGwC56
 +IxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751042390; x=1751647190;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sSwQlatYo2hfWz4yZlz2QlGPM20UYuQK38iob7ZA/l4=;
 b=s6O7Fz9zKvoImscicTHRmfrFzdtfgAuNayZSrvbBsth1+wTDLv6Hw0sYq+8AcsUPje
 YaQhp+pMkze2o0DHaXvTcl8FYs9+apZ66FG3vcwWfwUSAGc9EAX9H9/kgdJV5pRq/5Rk
 XMYvFMXNTNRyWfA6c3PlUTj5fRegZikNb/rLvV9ky0WrAoUmPWzqVaQr6g/7/QmG9WVi
 SOjFOhkPV5d5gNhNqHUlPtcQqFTNjvv4tJGNOmorwsHeKYvnaF2KgccBmGdYha6iItQM
 r3c7bcScA4U48eavXzrV/iENHAh6V38hHLNqwszApz9EIvo+AONhmZ5vHY2F2eqgN/31
 Lmfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeXnF9BuETk+heucm2SUoKBJWqOCj+r31QoA8HqKwInu8po0kXZGLPQpp5/sJup1a9HiIdHbxLoOg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyCHLwqGZIEiTXjQWRSBxyW0DlZjYepN+s8lCGNvUcC8e7zPAmy
 EJRR0DlFRFH5IySHljH8WhmYUHDjfqpUkJ2WuwreG4zaCk7D++5cr/ej5n/gn2jxK15+J8AedbN
 fpdss1tt4Bz7FKDlfgSdsf2Kdex/IVOo=
X-Gm-Gg: ASbGncv1Nt9kOCgK9A+bfErWgcjLlW2Ybc1Um95FWsHhK65NDEbBxsibWAZZ9geKC1h
 RHXSiFpMbRJDli+B6BosalrkISdd7k9ft10PEtdRR2K9ifgmlDzAOBNnfc/7ilgJep5oDz4ASZ/
 3azINrhrA8001EtMXNFJ0HYjYsfLxnVv8ow3RtcgcMVtN8IS6u7RA4TorxzPYvqjMrDZcRM1sNU
 HW5AQn5La655g==
X-Google-Smtp-Source: AGHT+IE+EQJINO2hqvKdeq50nVAmw4xPSXVM3N9Np89oAO2+jjaTnQXXEEePMfd+k6JVFTPXRjeWMGtc9KqvK2DKFT4=
X-Received: by 2002:a05:6e02:3708:b0:3da:71c7:5c7f with SMTP id
 e9e14a558f8ab-3df4ab9bd2bmr56840715ab.15.1751042389877; Fri, 27 Jun 2025
 09:39:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240226132544.82817-1-jacopo.mondi@ideasonboard.com>
In-Reply-To: <20240226132544.82817-1-jacopo.mondi@ideasonboard.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 27 Jun 2025 09:39:37 -0700
X-Gm-Features: Ac12FXwhljaBE40PrupTpRd1f6sZbUiAEPUkOhAArAoICLRBlhYXmUUMciYGwDA
Message-ID: <CAF6AEGvhjktN52k4_hJjz3mXTGJgH+QtK68yhFbsX45ukKnG+g@mail.gmail.com>
Subject: Re: [PATCH] drm/fourcc: Add RGB161616 and BGR161616 formats
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Naushir Patuck <naush@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, libcamera-devel@lists.libcamera.org
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

On Mon, Feb 26, 2024 at 5:43=E2=80=AFAM Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
>
> Add FourCC definitions for the 48-bit RGB/BGR formats to the
> DRM/KMS uapi.
>
> The format will be used by the Raspberry Pi PiSP Back End,
> supported by a V4L2 driver in kernel space and by libcamera in
> userspace, which uses the DRM FourCC identifiers.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Resurrecting this, as it appears to have not ever landed upstream

Reviewed-by: Rob Clark <robin.clark@oss.qualcomm.com>

> ---
>  drivers/gpu/drm/drm_fourcc.c  | 8 ++++++++
>  include/uapi/drm/drm_fourcc.h | 4 ++++
>  2 files changed, 12 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> index 193cf8ed7912..908f20b96fd5 100644
> --- a/drivers/gpu/drm/drm_fourcc.c
> +++ b/drivers/gpu/drm/drm_fourcc.c
> @@ -210,6 +210,14 @@ const struct drm_format_info *__drm_format_info(u32 =
format)
>                 { .format =3D DRM_FORMAT_ABGR2101010,     .depth =3D 30, =
.num_planes =3D 1, .cpp =3D { 4, 0, 0 }, .hsub =3D 1, .vsub =3D 1, .has_alp=
ha =3D true },
>                 { .format =3D DRM_FORMAT_RGBA1010102,     .depth =3D 30, =
.num_planes =3D 1, .cpp =3D { 4, 0, 0 }, .hsub =3D 1, .vsub =3D 1, .has_alp=
ha =3D true },
>                 { .format =3D DRM_FORMAT_BGRA1010102,     .depth =3D 30, =
.num_planes =3D 1, .cpp =3D { 4, 0, 0 }, .hsub =3D 1, .vsub =3D 1, .has_alp=
ha =3D true },
> +               { .format =3D DRM_FORMAT_RGB161616,       .depth =3D 0,
> +                 .num_planes =3D 1, .char_per_block =3D { 6, 0, 0 },
> +                 .block_w =3D { 1, 0, 0 }, .block_h =3D { 1, 0, 0 },
> +                 .hsub =3D 1, .vsub =3D 1, .has_alpha =3D false },
> +               { .format =3D DRM_FORMAT_BGR161616,       .depth =3D 0,
> +                 .num_planes =3D 1, .char_per_block =3D { 6, 0, 0 },
> +                 .block_w =3D { 1, 0, 0 }, .block_h =3D { 1, 0, 0 },
> +                 .hsub =3D 1, .vsub =3D 1, .has_alpha =3D false },
>                 { .format =3D DRM_FORMAT_ARGB8888,        .depth =3D 32, =
.num_planes =3D 1, .cpp =3D { 4, 0, 0 }, .hsub =3D 1, .vsub =3D 1, .has_alp=
ha =3D true },
>                 { .format =3D DRM_FORMAT_ABGR8888,        .depth =3D 32, =
.num_planes =3D 1, .cpp =3D { 4, 0, 0 }, .hsub =3D 1, .vsub =3D 1, .has_alp=
ha =3D true },
>                 { .format =3D DRM_FORMAT_RGBA8888,        .depth =3D 32, =
.num_planes =3D 1, .cpp =3D { 4, 0, 0 }, .hsub =3D 1, .vsub =3D 1, .has_alp=
ha =3D true },
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.=
h
> index 84d502e42961..00db00083175 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -210,6 +210,10 @@ extern "C" {
>  #define DRM_FORMAT_RGBA1010102 fourcc_code('R', 'A', '3', '0') /* [31:0]=
 R:G:B:A 10:10:10:2 little endian */
>  #define DRM_FORMAT_BGRA1010102 fourcc_code('B', 'A', '3', '0') /* [31:0]=
 B:G:R:A 10:10:10:2 little endian */
>
> +/* 48 bpp RGB */
> +#define DRM_FORMAT_RGB161616 fourcc_code('R', 'G', '4', '8') /* [47:0] R=
:G:B 16:16:16 little endian */
> +#define DRM_FORMAT_BGR161616 fourcc_code('B', 'G', '4', '8') /* [47:0] B=
:G:R 16:16:16 little endian */
> +
>  /* 64 bpp RGB */
>  #define DRM_FORMAT_XRGB16161616        fourcc_code('X', 'R', '4', '8') /=
* [63:0] x:R:G:B 16:16:16:16 little endian */
>  #define DRM_FORMAT_XBGR16161616        fourcc_code('X', 'B', '4', '8') /=
* [63:0] x:B:G:R 16:16:16:16 little endian */
> --
> 2.43.0
>
