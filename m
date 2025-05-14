Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D17BAB77AF
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 23:08:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A490310E742;
	Wed, 14 May 2025 21:08:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lUju4G0d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3099210E742;
 Wed, 14 May 2025 21:08:00 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-b1faa09bae7so23069a12.1; 
 Wed, 14 May 2025 14:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747256880; x=1747861680; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lx4Dn1t84Y1ja4KtBsaQ9M4LGHTcfm3gj7O9Xg07aZQ=;
 b=lUju4G0dXTtqfex7tvN/gln2TPZdDZVqLLuQr0nd1rXNXlDCKcqwdcc5CmHHk7qcrv
 M7ckrsryooa8Gm/5jWbK2CBN1nwmqdRZnHdpZJdqXvFBqrWR8lN4DK4ocdNJKK7exEf5
 Tdg9WsnDecjHdzGpc0wucTys6rko1ykjE2lQioVWMLJQywgroHmzO0CmCJ5sXkcduRnA
 4I8N0e6iWnBaWaM0x9hTb4ScIRvz/8vunxAQ1keWSMWX5hwVR3ZjEnAo8fosmlwPt8lu
 VTXoVLdsCDSd/f59Ud+Zo/Vyg9B5/JHYefe6Ew9TtEZXcf3S0HhZxkiSSdzwkJQQcluF
 iyeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747256880; x=1747861680;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lx4Dn1t84Y1ja4KtBsaQ9M4LGHTcfm3gj7O9Xg07aZQ=;
 b=tGNDGsAHTXTYwoct8my1Net2ruS01Z1Cz+x1rb16YOn1BeRhjLAPONmG/XQKq2r7vA
 LYB7CiIm4FTj1ChY481SHNOlDgWrsiLrKJeNCe1fyub+rBjUdCsoefvAfIMrlLZogTnq
 8cuV1ulEWsHl6pHVCpCRgSg4ipfatujwF2M+LTyCePpnR7++DPXIJ8BopJk6Q1m4k8Iv
 NxJCuKtWWnN3+CkUwOqS5uVMqiSWJnHqQ1OTPpCXeKW5EIroSXUciv5VmAqWtOh7XXcT
 r+asOpz9V5AnAwHflDOWQxNecHapBAIoVdtj7ovVQz8kIAmn/dPMiD/NaL4/rTfISDZ+
 /AYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWflULdp35zPWWJVTRHOs0sMaYpm+XRTanhZ1wTYGk9PG5F8DHMkBv2nejNeK8lUCf2JMQ5y1LD@lists.freedesktop.org,
 AJvYcCWiRs4jsgQiaE0hyCV64VhgT3byrW4xUdXA6MOz+pF6xy5Jzyn0RvfJwrys0e6qc+ckbaNguSgow05+@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzdSt3VNIvU1U7LxIW7GeFIyXxRRiNrT5Xsd3B28stBbOKwELFB
 H2hdOTrT6fo6utK684cKDxMGfLrHtWQ44t2VaDOrLVXSYezVfBBcaI9sd60yezvqAjFe5uWbV89
 Sss7EhXJa01uHQRGehLs1ubxRt6Q=
X-Gm-Gg: ASbGncuUhoHOldQKN0KIdoGle//xJihcVpU4ZVgy01ttQyF2/+2E7IJdVHRUT9W367R
 1OcEwU5NxWDr4bLSawyIqQ9ypqAz7tmQ5Y/NLAhgDHq0zE5XR+auYzrno3iOxfTAMKzOkN3qOmj
 xZYvrt38jzZeVUzgSLNolUucNPBl5ZJmss
X-Google-Smtp-Source: AGHT+IGBU4AnxaGdz3+W/aZ/NsTQmZSGDLIi9hu4RjfGwB+OV3yHSxSABfZO+2VHj6lusvHJdZvi0Bis/Bvqs6c+QUk=
X-Received: by 2002:a17:903:2a8d:b0:230:413c:d46b with SMTP id
 d9443c01a7336-2319813852amr29202835ad.6.1747256879647; Wed, 14 May 2025
 14:07:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250514174306.82693-1-leonardodasigomes@gmail.com>
In-Reply-To: <20250514174306.82693-1-leonardodasigomes@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 14 May 2025 17:07:48 -0400
X-Gm-Features: AX0GCFunWWT3CDxNB8ETZKOU5bde5b4Ig1OLZGL5DpGwcWxDzL3eZnVxm427R20
Message-ID: <CADnq5_OEdpRvpfL9+aCQOfRGUW-vOGzXq3ts5buWXoOTxtHr6Q@mail.gmail.com>
Subject: Re: [PATCH 1/2 RESEND] drm/amd/display: Adjust get_value function
 with prefix to help in ftrace
To: Leonardo Gomes <leonardodasigomes@gmail.com>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com, 
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch, 
 derick.william.moraes@gmail.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
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

On Wed, May 14, 2025 at 4:48=E2=80=AFPM Leonardo Gomes
<leonardodasigomes@gmail.com> wrote:
>
> Adjust get_value function in hw_hpd.c file to have
> prefix to help in ftrace, the name change from
> 'get_value' to 'dal_hw_gpio_get_value'

This won't compile.  dal_hw_gpio_get_value is already defined in
drivers/gpu/drm/amd/display/dc/gpio/hw_gpio.c.

Alex

>
> Signed-off-by: Leonardo da Silva Gomes <leonardodasigomes@gmail.com>
> Co-developed-by: Derick Frias <derick.william.moraes@gmail.com>
> Signed-off-by: Derick Frias <derick.william.moraes@gmail.com>
> ---
>  drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c b/drivers/gpu/d=
rm/amd/display/dc/gpio/hw_hpd.c
> index 3f13a744d07d..b11ed1089589 100644
> --- a/drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c
> +++ b/drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c
> @@ -62,7 +62,7 @@ static void dal_hw_hpd_destroy(
>         *ptr =3D NULL;
>  }
>
> -static enum gpio_result get_value(
> +static enum gpio_result dal_hw_gpio_get_value(
>         const struct hw_gpio_pin *ptr,
>         uint32_t *value)
>  {
> @@ -104,7 +104,7 @@ static enum gpio_result set_config(
>  static const struct hw_gpio_pin_funcs funcs =3D {
>         .destroy =3D dal_hw_hpd_destroy,
>         .open =3D dal_hw_gpio_open,
> -       .get_value =3D get_value,
> +       .get_value =3D dal_hw_gpio_get_value,
>         .set_value =3D dal_hw_gpio_set_value,
>         .set_config =3D set_config,
>         .change_mode =3D dal_hw_gpio_change_mode,
> --
> 2.43.0
>
