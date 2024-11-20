Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CC09D445A
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 00:18:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81CBE10E050;
	Wed, 20 Nov 2024 23:18:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="aTL+VC8M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D45BB10E050
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 23:18:24 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-53b34ed38easo278452e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 15:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1732144702; x=1732749502;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qk9xg8NxsXbSQYsTpmZ0ltyqprizEJtz7wq8qhfk4DE=;
 b=aTL+VC8MC9tc5DZEdnP9/UAY8k0kaFV8NZ1av9ZFxGpOi+72u6SSIM6e40MFJ2lmgW
 BNaRVE/6LDrxK6g4FHaWqxio26+Bp5z63RTLsZrsJJv6FlQ5GPJAOL1zpMbTeSmM8bhA
 tsWcPMshFH0SO656Rjyv7bv9eqAvprXWRgjEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732144702; x=1732749502;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qk9xg8NxsXbSQYsTpmZ0ltyqprizEJtz7wq8qhfk4DE=;
 b=MY8LY7Bs2akgSx4TLAa04nDHsl5vBhmdLb2Xs7n2G5AXrprxdlp9AYcKlj6nTSEhF5
 tf7Sc9+fRRWQPK4hY+MVnjDfkfom8BL9NJNDtiJ+1ZVg4+UQVxia6gAOfBkbTRu2nPUX
 L1paGL+VS5GLiLk5HFAUiVlf0k1WbRLIspGLSEX1zyrd6zO6UexNvrR7muucJ28lPn5c
 cMp+OmSb4QysQ9JvLql+5ycoClWCVw8Y4fQDQBgPsbxzyZsl0kSFC+RrtvD58xJlFm2F
 May4EX2bxM00VupO8X8xxkahEK1XAs7qlgAp0VzW9R6PfXzCm2U/HsZt4/TjNxC7PRuY
 9Vvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/NYVa7I5/nZhwUMEkZcEMF1X+VX/Dze3jZEQ/WLKVuoXRh0cVn7y5nNUX526dK91jMhV3IcQzN0I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyawoIJe+af+WQgV9gtgaTu6yQext973jJcamM/vNtW3XRMUi55
 xdWjtDqctXJhKdnK/eo1qSo92u004UG7Mtvo3mFrVuNFeb2aexLkToXsInMnZ7LRB8Pmoxdu7or
 VWA==
X-Gm-Gg: ASbGncsQKCocKJPP8y5eg+Mtp1gLwnboCNJwYGRCJphcShvAPI/Oop0hviP9AojaUfi
 rug+LIQGvT+BDtOjuschlqV442Tlki6DG9P9CeN6Z04NCFk7vQLNAa6Z+FzeE+4oi5mfslX5bdc
 a7TUFVCp6RLHmyG5JMZpiZlxYycR8q36WQkW5aJGbb0E2/kMaFL+kwhBl3JtxrtBsqCMIXug6fp
 qI39LBk3K2VgPSi1Fm0SzVCEcjt0bws2FeMR+x+lhCewGhlLg1A7QvJ84gd5amgy8/TzEmdq2+y
 C1SmW5AccfD68XoWTQ==
X-Google-Smtp-Source: AGHT+IHPRqOYsu1SqI0rxg9d9gEpUd2B6MR8KgrafRIihM9OIo/hzVP3c11WQDef8Cf3BXYRdi6BSg==
X-Received: by 2002:a05:6512:705:b0:536:55a9:caf0 with SMTP id
 2adb3069b0e04-53dc12d49f9mr1948757e87.0.1732144701625; 
 Wed, 20 Nov 2024 15:18:21 -0800 (PST)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com.
 [209.85.208.178]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ff69b3b970sm16765761fa.123.2024.11.20.15.18.20
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Nov 2024 15:18:20 -0800 (PST)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2fb6110c8faso3343271fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 15:18:20 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW+K5c1uv/2TotyUtlnfd0DJMredTcdeo3KJ/fQjTrDDrMpSMpghGzb2gATTAhTScW1ISywHfg6a6A=@lists.freedesktop.org
X-Received: by 2002:a05:6512:2347:b0:539:edbe:ac86 with SMTP id
 2adb3069b0e04-53dc1326d69mr2039832e87.10.1732144699638; Wed, 20 Nov 2024
 15:18:19 -0800 (PST)
MIME-Version: 1.0
References: <bdba1f49b4b48e22628482b49ce81f8e1f0d97b1.1731445901.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <bdba1f49b4b48e22628482b49ce81f8e1f0d97b1.1731445901.git.christophe.jaillet@wanadoo.fr>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 20 Nov 2024 15:18:08 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UQxLkr3vm7F0KtzKw9Kq6=yf8Q5jg2c3E9ksV+Stv4Ow@mail.gmail.com>
Message-ID: <CAD=FV=UQxLkr3vm7F0KtzKw9Kq6=yf8Q5jg2c3E9ksV+Stv4Ow@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: Constify struct i2c_device_id
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
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

Hi,

On Tue, Nov 12, 2024 at 1:12=E2=80=AFPM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> 'struct i2c_device_id' is not modified in these drivers.
>
> Constifying this structure moves some data to a read-only section, so
> increase overall security.
>
> On a x86_64, with allmodconfig, as an example:
> Before:
> =3D=3D=3D=3D=3D=3D
>    text    data     bss     dec     hex filename
>   15566     987      32   16585    40c9 drivers/gpu/drm/bridge/chipone-ic=
n6211.o
>
> After:
> =3D=3D=3D=3D=3D
>    text    data     bss     dec     hex filename
>   15630     923      32   16585    40c9 drivers/gpu/drm/bridge/chipone-ic=
n6211.o
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested-only.
> ---
>  drivers/gpu/drm/bridge/chipone-icn6211.c   | 2 +-
>  drivers/gpu/drm/bridge/lontium-lt9211.c    | 2 +-
>  drivers/gpu/drm/bridge/lontium-lt9611.c    | 2 +-
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 2 +-
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c      | 2 +-
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c      | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)

I figured it didn't hurt if I just pushed this so I did. Now in drm-misc-ne=
xt:

[1/1] drm/bridge: Constify struct i2c_device_id
      commit: dbf7986f8a56ce47465bb6e0f2b2d166b931d707

-Doug
