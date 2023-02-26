Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68ADB6A32F1
	for <lists+dri-devel@lfdr.de>; Sun, 26 Feb 2023 17:55:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC6310E0CC;
	Sun, 26 Feb 2023 16:55:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 240AB10E0CC
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Feb 2023 16:55:08 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id z2so4368281plf.12
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Feb 2023 08:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sladewatkins.net; s=googled;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ql+yDfRUjhQ1hgNI3xy6n4GGh0K0UVaI2xpdn33H+Ic=;
 b=gYQzSACEKh0zs4gFPgAXB6ArGX6MaqkokPlAQwWBJU2qG0PfuRW1zF3JRjMg7Y0Dya
 VuEcDJnPQrsh+Lj0/NiS5IB3blBUckTujvo0LDKo+s5WDq0HYlXoGnf9Ve1jqbCtzt9g
 6hrZx6WPgWklW2tx/3/MDT3SZDhnQvZOolf0ZRGxovUUp10oswne1b0C08XNOayUnSGC
 JDhWT5Litp5NOPJ3WE4z8qaGdx1yFxOZMu4Xag+gzcDDA37rwM6KYp3/AnY6ViC3Q6ZW
 3txK+vUt1zYlwUiP7haY6GZSX2TnrL4CiWIlruwDAhscf0NlaBE349I6yMNTILQrCs3H
 ga0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ql+yDfRUjhQ1hgNI3xy6n4GGh0K0UVaI2xpdn33H+Ic=;
 b=yeIMVJm9z7TiX4wLIDNdVZECmVNYuqJQrYCw0T32gXBxAM3kw7xX38kqhrNAHl9FuR
 33FYrxFfJElu1jSsGJ4rQtkPR5ERB6DdvPoqzvyMZ7YsQurU60xfYG+Sx9N5S5xt/wKC
 DJfIqfkMZ4mSYk4QPDPbb9DZZc4zoGoKNIsXFgShVH5D9fACufSts5lwqNO4IxQMvPOx
 KcZ+Bj0WAzBFGbbrN3qwmtoJIAN4+VMv/bb+mvKUeOxd36sTP6Zy/hsFx5jfU8UUvygS
 9v6cZ35afGjrYH+Uh9hLibQd9E8kgM2lDIaner8axwJdhR90hOLAY6qJ8My3eCrREBRq
 K1Bg==
X-Gm-Message-State: AO0yUKUeLwQiNnEKbk2Q3Ij09ULa660CHZhGtO4HXcRZ9Sh6YfWZmGVz
 MuwXT2YiQ/2/qnpFyNfd+AA7jjNw+lzOqbI31wxK9ymaO+Zt/i+jpb4=
X-Google-Smtp-Source: AK7set9Ikfshxz47YPGsMc6LSpX5SxueLD5B/mdGwn7HOn3xfGsl1Yx4OcF4JUNskEbnN2Ww16qkz8sXhfGraHOUlng=
X-Received: by 2002:a17:903:2404:b0:19c:9fa5:b68a with SMTP id
 e4-20020a170903240400b0019c9fa5b68amr4699738plo.11.1677430508330; Sun, 26 Feb
 2023 08:55:08 -0800 (PST)
MIME-Version: 1.0
References: <20230219114553.288057-1-frank@oltmanns.dev>
 <20230219114553.288057-2-frank@oltmanns.dev>
In-Reply-To: <20230219114553.288057-2-frank@oltmanns.dev>
From: Slade Watkins <srw@sladewatkins.net>
Date: Sun, 26 Feb 2023 11:54:57 -0500
Message-ID: <CA+pv=HPY1HCDJ=sHeg_S7ZusS1RqiYvGOUf2bPVZK7Rq_EfHUg@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm/panel: st7703: Fix vertical refresh rate of XBD599
To: frank@oltmanns.dev
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
Cc: Ondrej Jirman <megous@megous.com>, Purism Kernel Team <kernel@puri.sm>,
 Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Feb 19, 2023 at 6:46=E2=80=AFAM Frank Oltmanns <frank@oltmanns.dev>=
 wrote:
>
> Fix the XBD599 panel's slight visual stutter by correcting the pixel
> clock speed so that the panel's 60Hz vertical refresh rate is met.
>
> Set the clock speed using the underlying formula instead of a magic
> number. To have a consistent procedure for both panels, set the JH057N
> panel's clock also as a formula.
> ---

Hi Frank,
Just wanted to let you know that this appears to be missing your Signed-off=
-by:.

Thanks,
-- Slade

>  drivers/gpu/drm/panel/panel-sitronix-st7703.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/=
drm/panel/panel-sitronix-st7703.c
> index 6747ca237ced..cd7d631f7573 100644
> --- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> @@ -139,7 +139,7 @@ static const struct drm_display_mode jh057n00900_mode=
 =3D {
>         .vsync_start =3D 1440 + 20,
>         .vsync_end   =3D 1440 + 20 + 4,
>         .vtotal      =3D 1440 + 20 + 4 + 12,
> -       .clock       =3D 75276,
> +       .clock       =3D (720 + 90 + 20 + 20) * (1440 + 20 + 4 + 12) * 60=
 / 1000,
>         .flags       =3D DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
>         .width_mm    =3D 65,
>         .height_mm   =3D 130,
> @@ -324,7 +324,7 @@ static const struct drm_display_mode xbd599_mode =3D =
{
>         .vsync_start =3D 1440 + 18,
>         .vsync_end   =3D 1440 + 18 + 10,
>         .vtotal      =3D 1440 + 18 + 10 + 17,
> -       .clock       =3D 69000,
> +       .clock       =3D (720 + 40 + 40 + 40) * (1440 + 18 + 10 + 17) * 6=
0 / 1000,
>         .flags       =3D DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
>         .width_mm    =3D 68,
>         .height_mm   =3D 136,
> --
> 2.39.1
>
