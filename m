Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A079F13A8
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 18:31:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B63C10E26D;
	Fri, 13 Dec 2024 17:31:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="AHyvdBep";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D87B410E26D
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 17:30:59 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-540218726d5so2017393e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 09:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1734111057; x=1734715857;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1MR3jomgsikL/ItXNApbi5zDUtVTiZ24TTxj2eu4zFo=;
 b=AHyvdBepfjwMV4oYO+Isq8Ke6LGKGxXZUW/GolSrVU0II9qW4iHKdy/w3orU8aNvgI
 qSZ1u91GMy+fuLAvqk07hhYraESW9W+bpxv+ST6J+tywTlVvtjsy0YoAgyRC4Q7kAmgM
 4Hhgk/BIAs+iib/8yDn8YYjqIsaMQHMoLnNvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734111057; x=1734715857;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1MR3jomgsikL/ItXNApbi5zDUtVTiZ24TTxj2eu4zFo=;
 b=iWVAPBWv5piGKQu9ZFimhULFogZqHvDJ9ixsUcFMdQj6LyXsLsLw810ewQpIzIufSR
 vRoS3fYRS3gszCTHHnO8ZKYnWkCiknKhhxKBPHwx8bWqmwmjfH4bDkrnZPP17gw6+O5A
 fj92FMtMpccytq2+mnTlQyFmwWR5qcWdGs9/7daVbCVWYM/lV+rwQvA8i+2DINmlDmJP
 SCBTfBCBuo2hAetuRz8nDUld/j+nZt+6gTLjvMTBNxhkCO0ZudnBleRldMm3GRB7Ocfj
 RmV7hVWOI2cWioguyh9TT4JnRckQO/DRhbnPc5dGNiggD2viCuVyjV+bAaqie2Tk0dqm
 oTVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeBbNGF83xD2mqhrUr7Ryv+LuVetwmgI2ayGmlsBxVAj24QAwVDSgKAsxIdI2Gc57t76JM6+IjhdE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJXAIF/MZNrUJdlZja5rZt2uCuJjeLdm263Lg5p6M5iDy+sMNU
 1LqWLM3Yj4vRPEAn2KWir5S/7Vt3VzDC/N6QBrK6GeimMsQvi+O4a/m3WHVEkUynxveh+mRw9BN
 zGg==
X-Gm-Gg: ASbGncts7HnY/2khx1Alq+gXV/ydkvzhB9uteb2E99MfW6ntNTIVGoEWJe2Kq1Xztsc
 eJENduab7+R3SIK+HxRLqwUWJs6rO5AadCBkrf44avro0jhx+Zlh4GuMVF+p2uxm5GjiN9XgpL1
 K+PRVW23AhF7qEBZn50Eg9V/S1xeqyPEgoemCXyiANDsg60m2ByeZZ0EKfKCaeb4ZgWG+wZtCMN
 IrA8JVePlcDnrbUvT06jvOWznvGTdYSEg48Gl7TGpPRujbT8Tt25CJmh9notxpuKVYVKYP+ZIfF
 sFSGk073gePq6Qj4L+STIkXA
X-Google-Smtp-Source: AGHT+IFuRkZSvWnkuA3oE/W+DCUn1y16wnb+EXhim/FVi0R6g7VkZpb/ggJpXU/bPN42QD+/brGsUQ==
X-Received: by 2002:a05:6512:224e:b0:53e:2e6b:385b with SMTP id
 2adb3069b0e04-54099b6d722mr1006246e87.48.1734111057042; 
 Fri, 13 Dec 2024 09:30:57 -0800 (PST)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com.
 [209.85.208.170]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53ed898be64sm2063183e87.88.2024.12.13.09.30.56
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Dec 2024 09:30:56 -0800 (PST)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-300479ca5c6so17826601fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 09:30:56 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXsgzmGAiJklQPH6xfrDXIpC0c824W+v7JNrX7qDlawwKDofY5IhVJbMy7gMn3M6I5fSgtW7+n9420=@lists.freedesktop.org
X-Received: by 2002:a2e:bc12:0:b0:302:4130:e0c7 with SMTP id
 38308e7fff4ca-302544267c6mr11549691fa.5.1734111055499; Fri, 13 Dec 2024
 09:30:55 -0800 (PST)
MIME-Version: 1.0
References: <20241204105827.1682632-2-u.kleine-koenig@baylibre.com>
In-Reply-To: <20241204105827.1682632-2-u.kleine-koenig@baylibre.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 13 Dec 2024 09:30:44 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VLMXFgNSB6n3GY+VJe-CRkfjyXy5cED-bEt9mkpqCs8Q@mail.gmail.com>
X-Gm-Features: AbW1kvY3keQCG1I46RDu5nyCxRQG2tvidov72mRN8rmal5ex5DD7ijraZ2zeoTQ
Message-ID: <CAD=FV=VLMXFgNSB6n3GY+VJe-CRkfjyXy5cED-bEt9mkpqCs8Q@mail.gmail.com>
Subject: Re: [PATCH v3] drm: Drop explicit initialization of struct
 i2c_device_id::driver_data to 0
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Liu Ying <victor.liu@nxp.com>, 
 Adrien Grassein <adrien.grassein@gmail.com>,
 Peter Senna Tschudin <peter.senna@gmail.com>, 
 Ian Ray <ian.ray@ge.com>, Martyn Welch <martyn.welch@collabora.co.uk>, 
 Jagan Teki <jagan@amarulasolutions.com>, Russell King <linux@armlinux.org.uk>, 
 Sui Jingfeng <sui.jingfeng@linux.dev>, Jani Nikula <jani.nikula@intel.com>, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>, "Rob Herring (Arm)" <robh@kernel.org>, 
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, dri-devel@lists.freedesktop.org
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

On Wed, Dec 4, 2024 at 2:58=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> These drivers don't use the driver_data member of struct i2c_device_id,
> so don't explicitly initialize this member.
>
> This prepares putting driver_data in an anonymous union which requires
> either no initialization or named designators. But it's also a nice
> cleanup on its own.
>
> While add it, also remove commas after the sentinel entries.
>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Liu Ying <victor.liu@nxp.com> # ite-it6263.c
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> ---
> Hello,
>
> On Mon, Dec 02, 2024 at 04:50:01PM -0800, Doug Anderson wrote in reply
> to v2:
> > This conflicts with commit dbf7986f8a56 ("drm/bridge: Constify struct
> > i2c_device_id"). Can you rebase, please?
> >
> > Other than that:
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> It took me a moment to find a tree + branch that contained the
> above mentioned commit. It would be a real time saver if drm-misc-next
> was included in next. At least saying "drm-misc-next" in such a context
> would be helpful, bonus points for mentioning
>
>         https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next

Sorry about that! drm-misc-next often feeds linux-next, but not
always. I'll try to remember to be more explicit in the future.

> The changes in this patch compared to v2,
> https://lore.kernel.org/dri-devel/20241202114731.1005549-2-u.kleine-koeni=
g@baylibre.com/:
>
>  - Rebased to drm-misc-next, resolving conflicts in
>    drivers/gpu/drm/bridge/lontium-lt9611.c
>    drivers/gpu/drm/bridge/lontium-lt9611uxc.c
>    drivers/gpu/drm/bridge/ti-sn65dsi86.c
>
>  - Applied the R-b tag received for v2.
>
>  drivers/gpu/drm/bridge/analogix/analogix-anx6345.c       | 2 +-
>  drivers/gpu/drm/bridge/analogix/anx7625.c                | 2 +-
>  drivers/gpu/drm/bridge/chrontel-ch7033.c                 | 2 +-
>  drivers/gpu/drm/bridge/ite-it6263.c                      | 2 +-
>  drivers/gpu/drm/bridge/ite-it6505.c                      | 2 +-
>  drivers/gpu/drm/bridge/lontium-lt8912b.c                 | 4 ++--
>  drivers/gpu/drm/bridge/lontium-lt9611.c                  | 2 +-
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c               | 2 +-
>  drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c | 8 ++++----
>  drivers/gpu/drm/bridge/nxp-ptn3460.c                     | 4 ++--
>  drivers/gpu/drm/bridge/sii902x.c                         | 4 ++--
>  drivers/gpu/drm/bridge/sii9234.c                         | 4 ++--
>  drivers/gpu/drm/bridge/sil-sii8620.c                     | 4 ++--
>  drivers/gpu/drm/bridge/tc358767.c                        | 2 +-
>  drivers/gpu/drm/bridge/tc358768.c                        | 4 ++--
>  drivers/gpu/drm/bridge/ti-dlpc3433.c                     | 2 +-
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c                    | 4 ++--
>  drivers/gpu/drm/bridge/ti-tfp410.c                       | 2 +-
>  drivers/gpu/drm/i2c/ch7006_drv.c                         | 2 +-
>  drivers/gpu/drm/i2c/sil164_drv.c                         | 2 +-
>  drivers/gpu/drm/i2c/tda9950.c                            | 4 ++--
>  drivers/gpu/drm/i2c/tda998x_drv.c                        | 2 +-
>  22 files changed, 33 insertions(+), 33 deletions(-)

Pushed to drm-misc-next:

[1/1] drm: Drop explicit initialization of struct
i2c_device_id::driver_data to 0
      commit: b690f5d955e033b9bd80de0486a04adf150f89a8
