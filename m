Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9AB9B3C59
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 21:55:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2B9910E1AE;
	Mon, 28 Oct 2024 20:55:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NZ453pR6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06F6710E113;
 Mon, 28 Oct 2024 20:55:00 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-7202e1a0209so357317b3a.0; 
 Mon, 28 Oct 2024 13:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730148899; x=1730753699; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SrHVAI6up7gguvzqac0TG9QFerLXr+VuS6wCmQhW7IA=;
 b=NZ453pR6fE4pRhZi6LEn8XJrb1OsVFBZcetRGLcSNXvgAjiIBPw8klwF68NnJ05+0v
 nFP1+fTH1QacTbWRizMB3naWWonpWXi75/2JzecEMlF1D6YBcVbRL6A1oFgnQdty2yKp
 116lQpMcG0e8w3kJvxBRLYmnP4WR6+EqCMfIbayOWIuFD/LeOfN0NspVA03m4MHdDWsZ
 L1yJhLa9nhO0+2g5yeconiqW4FUksAbXaxK3ycIu+6/+nUlLAXArLjTcd28FWag7jF5P
 Ke7LRkhEVwyEP+UCbbtQlFO4MM5vhAfVYKMXcyl/YW+eWph0NI6GNPhi4LfQSQtHH6ym
 b/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730148899; x=1730753699;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SrHVAI6up7gguvzqac0TG9QFerLXr+VuS6wCmQhW7IA=;
 b=WOrU2zjYkqlaFkmMC4hZxqupprU5J9ONzSddR8/6FCIG1zXZAAxFJUKwxa3p8y18Xm
 boWg86jsZH85nIA0VSE6myZnt1gYHlioTEUorghcjoDY6Ze0gaC6xbZ/nOuGkEugvO/8
 Ekdo4k912SlqGDwLcNqUGJBPYHF0j1pYAlcIFK2T0dQdlSLy/3c/OT8iZ2dPgkzEwV1s
 6Wku+Km5OrtdedOah6lsjrLVKUbgSjka24Wy0k5oRsj57aErfcXJm5b42Fk1f5C8oYS1
 nVWyO31Ocab3UyedXZrz0gsu2TQgJ5+S4cUunyNeYN9WHdrdVLMwiygIjU+yWW7/jU3z
 etIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0xsmKJZlOINiJhMITP4Xg/Td4oClB3b9PiR383/EhlWbJH310UIocJngseOVJDWHA7rrKgBUD0oI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5txwX03Pdt0uuCL+OcrnSt6uSqahvDjHtnJJdKPp5FwpfzIoI
 FNo5gNKF79Xv8vFUB0L5kZnAyx8JN2C00xUuT+zavk46a1Gh+oH3249aqALD0WRfOGrA/ZSjKys
 6abArkqDUEtLiYJR93SgkEBy+kNc=
X-Google-Smtp-Source: AGHT+IGL0KecMoHqxlglpS9xJk3IkntuFzNsJW9h8gCrDie3Vc7O9mV+6Bhpm8A79lt+FGEieh6UE/JLiaPmC7HEa08=
X-Received: by 2002:a05:6a20:394b:b0:1cf:2be2:6526 with SMTP id
 adf61e73a8af0-1d9a8519070mr5784517637.12.1730148899472; Mon, 28 Oct 2024
 13:54:59 -0700 (PDT)
MIME-Version: 1.0
References: <20241028185141.3756176-1-jani.nikula@intel.com>
 <20241028185141.3756176-2-jani.nikula@intel.com>
In-Reply-To: <20241028185141.3756176-2-jani.nikula@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 28 Oct 2024 16:54:47 -0400
Message-ID: <CADnq5_NTXJt3phcFnhLTEAibou97yWT-RNpLL+z8RsEkhyzraA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] accel/ivpu: remove DRIVER_DATE conditional
 drm_driver init
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 David Airlie <airlied@gmail.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Oded Gabbay <ogabbay@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
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

On Mon, Oct 28, 2024 at 2:52=E2=80=AFPM Jani Nikula <jani.nikula@intel.com>=
 wrote:
>
> The ivpu struct drm_driver has conditional initialization based on #ifdef
> DRIVER_DATE, which is never defined anywhere. Neither are the macros
> referenced within the block: DRIVER_DATE, DRIVER_MAJOR, DRIVER_MINOR,
> and DRIVER_PATCHLEVEL. With the struct drm_driver date member going away
> anyway, just remove the conditional compilation.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

>
> ---
>
> Note: I prefer to merge this together with the other patches via
> drm-misc-next.
>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Oded Gabbay <ogabbay@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/accel/ivpu/ivpu_drv.c | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.=
c
> index e7d8967c02f2..07c7e5a5f22b 100644
> --- a/drivers/accel/ivpu/ivpu_drv.c
> +++ b/drivers/accel/ivpu/ivpu_drv.c
> @@ -456,15 +456,8 @@ static const struct drm_driver driver =3D {
>         .name =3D DRIVER_NAME,
>         .desc =3D DRIVER_DESC,
>
> -#ifdef DRIVER_DATE
> -       .date =3D DRIVER_DATE,
> -       .major =3D DRIVER_MAJOR,
> -       .minor =3D DRIVER_MINOR,
> -       .patchlevel =3D DRIVER_PATCHLEVEL,
> -#else
>         .date =3D UTS_RELEASE,
>         .major =3D 1,
> -#endif
>  };
>
>  static void ivpu_context_abort_invalid(struct ivpu_device *vdev)
> --
> 2.39.5
>
