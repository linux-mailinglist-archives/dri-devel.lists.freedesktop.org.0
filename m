Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D469B45D69
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 18:05:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 963F610EC09;
	Fri,  5 Sep 2025 16:05:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DdU++sB3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02BF610EC08
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 16:05:29 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-45ddc7d5731so2403765e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Sep 2025 09:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757088328; x=1757693128; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ob2dOE5lLXVb6RqGFMwvVMJwP8tb3SAsPX4YiQh5IfQ=;
 b=DdU++sB304Q+UYZ6hNZu2bmQiD94KQTYK4TOEYido0PkrgAwQZ9Sqh7Mq3Spu1C90x
 aNVrDXRKlLXeKdvnYzZRBKBi9SsgfEnS9geGqg3csjjhAYdpmAFh1L9VBwiwciH7xgYE
 qCz62hK9qvZLPq5D1g3WeC3eZbP0dMMT+1OrR6fvgmOnRfft569oDQwoucH+dnC5TGJj
 Gud03AOXxmYIw8wR5x43GwJwWfURtRJg4K1mIvn1ckKkHm0RIqsJ8zC1HGaaSmW8jK7b
 OQa63NIkRR8+mqqyFjgmEGNrUTRKuclOxUOYI51pZXAlmTZ9rZWXMZOo6T+hYmK8OVqV
 osdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757088328; x=1757693128;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ob2dOE5lLXVb6RqGFMwvVMJwP8tb3SAsPX4YiQh5IfQ=;
 b=wypFedA+Hprql+L6DyUscjSbcfuN/YEYCaCu+ksVY3yw6Ur0OObQtGmOosYHicVrO7
 zOZ2Z90gfyUgA42lJARWBm5Kpi83jybIeUKOZfFIMcq2QnNS+WzXBgZKAJBr8rLfMoTs
 2OashJdmLicWBvyHfHulQk/I/9Dt48lJ2KHALM2sB3ELo2eYfQU5HuyE0UUuXHN5PUsN
 S8csnxz4fHkmHA4IRE4q3akjEBQFlgy0pqf+EJq21MIG5HVoEosAOs4DwvfXHiVJN57m
 k/M6HYBdZmNDwVh8py/9OmcXcVR8CPJeeWkMrRy4SlH5wSXKdye3BAy5sfXCXByNCGIc
 z4GQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIgp/XCo8j4TUxsgscRJjRXCmpklLJTQwL3sjwAV+pR9mNK6OJG4GuLIsSdy23heFUVrSrACnrMs8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywn8A6ZxzLr2ppNTYrKsIf/KuS9nho0s6psdrcHYLM4RL8ogsxM
 xHOkYbcSQkvJD+CRmxi1+MlCspZoHkFbOoHztvva1xavOAhfyD+M7tOisytKG0NmR6jptJPqD0c
 7LkYxGGtd3dqunFKRref27HD0dy6z/FY=
X-Gm-Gg: ASbGncsdyVLs1KLs0aylJa9mwryis4gDQNe+zKh4zGRfOYFV8PsOENiieFJeFepm5oe
 tWn+FCGegyrq5DsB9pIK8MgHqzYKx+O3C5+6M1R5mhpnpd1TvPNYP8dbV1KR7KiVuhULcoZy64t
 yO4tBVQEZCPAMUav0PIy5JX6BOYAwfMkzSfUhH6M7i5vJ9L2oKPBT0dmsFJskg56I5UkQ+7GJym
 NG5hheYMpQ2mGuxrWs=
X-Google-Smtp-Source: AGHT+IHQFdT92ui+oOPmAAzcjKrst1A5X5grtZ18QdUjMPD7e/2IxfW8vgkJ8xIP5tdh0aCS17FWkqJxwRfpnaKU8Is=
X-Received: by 2002:a05:600c:1c0d:b0:45b:97d9:4127 with SMTP id
 5b1f17b1804b1-45b9973a7bfmr114115425e9.1.1757088328192; Fri, 05 Sep 2025
 09:05:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250819121631.84280-1-clamor95@gmail.com>
 <20250819121631.84280-10-clamor95@gmail.com>
 <20250905175915.2d7e02a7@booty>
In-Reply-To: <20250905175915.2d7e02a7@booty>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 5 Sep 2025 19:05:16 +0300
X-Gm-Features: Ac12FXy8-gf4rqnnMixpiVUbphC0vtcMsbDHxj7dfCPkBooqcg0F62Ji9EeEqrA
Message-ID: <CAPVz0n0_DJh9M-h5a0bcBA8b6_7vzgOYSktGxAhFzuVncoJhmw@mail.gmail.com>
Subject: Re: [PATCH v1 09/19] staging: media: tegra-video: vi: add flip
 controls only if no source controls are provided
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>,
 linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-staging@lists.linux.dev
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

=D0=BF=D1=82, 5 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 18:59 Luca =
Ceresoli <luca.ceresoli@bootlin.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hello Svyatoslav,
>
> On Tue, 19 Aug 2025 15:16:21 +0300
> Svyatoslav Ryhel <clamor95@gmail.com> wrote:
>
> > Add HFLIP and VFLIP from SoC only if camera sensor does not provide tho=
se
> > controls.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/staging/media/tegra-video/vi.c | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/m=
edia/tegra-video/vi.c
> > index 4f67adc395ac..61b65a2c1436 100644
> > --- a/drivers/staging/media/tegra-video/vi.c
> > +++ b/drivers/staging/media/tegra-video/vi.c
> > @@ -961,6 +961,7 @@ static int tegra_channel_setup_ctrl_handler(struct =
tegra_vi_channel *chan)
> >       }
> >  #else
> >       struct v4l2_subdev *subdev;
> > +     struct v4l2_ctrl *hflip, *vflip;
> >
> >       /* custom control */
> >       v4l2_ctrl_new_custom(&chan->ctrl_handler, &syncpt_timeout_ctrl, N=
ULL);
> > @@ -986,11 +987,13 @@ static int tegra_channel_setup_ctrl_handler(struc=
t tegra_vi_channel *chan)
> >               return ret;
> >       }
> >
> > -     if (chan->vi->soc->has_h_v_flip) {
> > +     hflip =3D v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_HFLIP);
> > +     if (chan->vi->soc->has_h_v_flip && !hflip)
> >               v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2=
_CID_HFLIP, 0, 1, 1, 0);
> > -             v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2=
_CID_VFLIP, 0, 1, 1, 0);
> > -     }
> >
> > +     vflip =3D v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_VFLIP);
> > +     if (chan->vi->soc->has_h_v_flip && !vflip)
> > +             v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2=
_CID_VFLIP, 0, 1, 1, 0);
>
> Based on my understanding of V4L2, this should not be done.
> AFAIK subdevs should expose what the hardware block can do,
> independently from other subdevs. It is up to userspace (e.g.
> libcamera) to use the most appropriate control when there are redundant
> ones.
>

This driver is video-centric, interactions are done via /dev/videoX
not subdevices like media-centric derivers do. Conversion is possible
but it is not scope of this patchset and in case such conversion takes
place, one who will do that, will definitely know what to do.
Video-centric drivers expose all controls within single video device
and it cannot hold duplicates of controls, this causes error. So this
solution exposes camera flip controls and if camera has none, SoC
controls are exposed.

> Luca
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
