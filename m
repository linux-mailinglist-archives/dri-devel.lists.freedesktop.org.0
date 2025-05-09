Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AB8AB117E
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 13:06:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5626310EA17;
	Fri,  9 May 2025 11:06:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZmmSH5ZG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F80610EA17
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 11:06:27 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-310447fe59aso19860471fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 May 2025 04:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746788786; x=1747393586; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t2C4HMX2q+ykrxCLasIqR6WQaMhRrz7zJKiG5kqBRoM=;
 b=ZmmSH5ZGNvMbPo4c+8wIjhSilIW2KSbYGJYRsQ3NkiDyHDh5dkbf4FTEcgybIVIKhq
 YD8pbs2GM+7znp9Pkt5dyQDBcrxymuqWB1AayIZGL3GtzUA2Ddy01vMsMS8WNrydVKE7
 O16MjAlgOj1WZDUKmEZdwkUg7eomcYm6YMQwIayxvUyeih29hDpw6D16VHL4wd+2jRR/
 To9JztqGEfCSh7rcwgEB/P0yW93RCcNcFktAqWiwXJ4vDC9W5S9oamVlcfn0jW4CIEGZ
 EtB430y48WRzPuI25JDHgH4T+lWGHRbtyQJWvLZq70r9PJH8pPsnv7XRqvABlwBTVxtL
 jL1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746788786; x=1747393586;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t2C4HMX2q+ykrxCLasIqR6WQaMhRrz7zJKiG5kqBRoM=;
 b=N/iU3dsf/pLXI7tLfgW+DvNL+WnITCchmXc4AUDYa05W7VSvX5hPmZACHvaSs9oErO
 dTMQRiO0GrkxfOGYDDyRFVmlER/ZbwKdlGXReuph6DKY4tr8BbKjNPcPHKbbHrDGQxRl
 nCX8opta8/Ce7l18G51uBLLGKg0kCY1zkJZcNZBfn9S0fxj50Ds4hBWqBODc7m6Gi1cK
 wdLgpAu3ib/lQWvaov8jwYw3W1tLEN/jYdzG6n4dlOoFArlvygctkYfaoZWH0RNyRTPA
 I5p/WVtasGaIZf2zcy4gQfXwNxrZlxsvC8e0La+zZJiLTRaq5cc0AeCslMJJpToD3grx
 O68A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/+G3LHnkHYv5HAS5p0bfxXWKxbPF/LwPJxSKCkZNevGPdymNUEjTjsPEWxhJmMnU1jLKUXDhSrNg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyO43DNCsQKRr2un3WUJjMvM4Hklt03PB2dW9Zw0psttEx3+zhu
 eNAlElQmi1p+jiFDsUpcG2sa3VHdSfAcv0GYQfZxv6f0Exc6eUZBfJ9yiyqK7PIT4yMZ3hrLzNr
 ujKo9F3kFEgBS+tINJZo2aX0ko28=
X-Gm-Gg: ASbGncuTTT2WihQbQ07kY6san85l4imzS6VQmtux/44N1TzOfOWV/H2wqXRCElNciZR
 2FF/gbstS49OKwaUVcSzOhzrxQWRxP9BF6MB0QqbC0f/deiiJMHzMQJY/aC8YU86PZScortMlk1
 mbdojA5YzmmQFp7KTwyyTzBqyooaFc74Ic6ZRoHx/Fq3I1V03pDP5fxA==
X-Google-Smtp-Source: AGHT+IHiMtszuL64FRiLenfMWJnjacyFz/EaJ395z0Hb6Q2QJkAv3A/Z9lBNihBKSxG9s8jWhG0EvBQMivIP3Y13B+I=
X-Received: by 2002:a2e:a10a:0:b0:30d:e104:cd57 with SMTP id
 38308e7fff4ca-326c469229bmr10665481fa.40.1746788785405; Fri, 09 May 2025
 04:06:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250417103458.2496790-1-festevam@gmail.com>
 <87cyd3c180.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87cyd3c180.fsf@minerva.mail-host-address-is-not-set>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 9 May 2025 08:06:14 -0300
X-Gm-Features: ATxdqUGhLIWwN25Ny1sR2sK7ptO4iuCb08bNbX96W5xMiFLLSRewadVWruWN4GA
Message-ID: <CAOMZO5CghWOyYse2nJjKzAk2tTGXTsag=EYeS+cS6tV6YO+NLw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/tiny: panel-mipi-dbi: Use
 drm_client_setup_with_fourcc()
To: Javier Martinez Canillas <javierm@redhat.com>, tzimmermann@suse.de
Cc: simona@ffwll.ch, airlied@gmail.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, noralf@tronnes.org, dri-devel@lists.freedesktop.org, 
 Fabio Estevam <festevam@denx.de>, stable@vger.kernel.org
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

Hi Javier and Thomas,

On Tue, Apr 22, 2025 at 6:53=E2=80=AFPM Javier Martinez Canillas
<javierm@redhat.com> wrote:
>
> Fabio Estevam <festevam@gmail.com> writes:
>
> Hello Fabio,
>
> > From: Fabio Estevam <festevam@denx.de>
> >
> > Since commit 559358282e5b ("drm/fb-helper: Don't use the preferred dept=
h
> > for the BPP default"), RGB565 displays such as the CFAF240320X no longe=
r
> > render correctly: colors are distorted and the content is shown twice
> > horizontally.
> >
> > This regression is due to the fbdev emulation layer defaulting to 32 bi=
ts
> > per pixel, whereas the display expects 16 bpp (RGB565). As a result, th=
e
> > framebuffer data is incorrectly interpreted by the panel.
> >
> > Fix the issue by calling drm_client_setup_with_fourcc() with a format
> > explicitly selected based on the display's bits-per-pixel value. For 16
> > bpp, use DRM_FORMAT_RGB565; for other values, fall back to the previous
> > behavior. This ensures that the allocated framebuffer format matches th=
e
> > hardware expectations, avoiding color and layout corruption.
> >
> > Tested on a CFAF240320X display with an RGB565 configuration, confirmin=
g
> > correct colors and layout after applying this patch.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 559358282e5b ("drm/fb-helper: Don't use the preferred depth for =
the BPP default")
> > Signed-off-by: Fabio Estevam <festevam@denx.de>
> > Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> > ---
>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Could you please help apply this fix?

Thanks
