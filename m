Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4131C0F725
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 17:50:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E539810E15C;
	Mon, 27 Oct 2025 16:50:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ejm4/FHZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D21F10E160
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 16:50:10 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-4270491e9easo4045167f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 09:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761583809; x=1762188609; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=llXiWHJLf2syx3blZo0CXJGIyiry1LJYTByzcLi8/h0=;
 b=Ejm4/FHZ8YsQnkIxoSxMVcrjNtAprn7Vb3X8yOWWoYo0wAbqslhe/CvLfx0xyTZTBj
 hOqVMLg/AN4xkGGae6lhwGEqXNoesuaa/5mu3qAoM+NWUjkrKOMSovWw/qroMQGRLr3C
 t1XKaoV6LmNxzZPFOBIoEo92G/MfW+LQN4sFf9UXm2m//khsw6tPZMPh2IAZPTDko6CQ
 SE/x5TdLQWFeph9P6ApE99TRh9ZMl2MwbkcaNGWpZHcJNDwUZ99rd0mfjPZ2jc/s9cmo
 hLG6vTYOA++DPZCzc5Ehm+vjBjA/t9dSoO3WZqnf2H+RpchB59IlQUbe1gCQ6O2i/LDu
 J3nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761583809; x=1762188609;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=llXiWHJLf2syx3blZo0CXJGIyiry1LJYTByzcLi8/h0=;
 b=eHArb5GgHWOeTrdM0qluB1kmD85kd50LAnG8wXIu2RYPJ8SaxZq64vCAcIaXcdezWO
 m2R6lwrdZBlsISL+Wtv5aMdODgVRWygim7jm7FrUZba7q+mnokzXcxw5jVfqZXSq8NQG
 2evo6E///s4scHJ0/KUBjrlKw/38LyUjFt6f/Iq2k1zcw4KK/3Ufe6PF248PqafRSm6y
 0g38/OF3wHXOtLj8HFNmLsSt6FQHwRFAZgsRcpJK4AE6wVKISY4m8eMxQShbUfxhYN+Q
 bAwgLubxDp16tIQ8d9ghfsAleHs0t5KnZ39nqzKDAkqVgWd6BdT7jzaDNWClRVx5jBL4
 zjvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtRUY1oxnUSjUhcSb3GI7GrOn/7Q+StaLQD7eMA1PsbODeDmqonUzUAKH0CMSth/ugc93UpE9T3d0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKjCFvgaj5l30oPTAme19VqfmtFzP6NuRwL0hVP8xPqN9ybmPc
 XDmKNay2qZPmW0avxeipSFdH1PQHhxa5LmE3EIucLJjTVMm8tvAnaVra+DuVH6zNLpMQAhdqEGB
 7ac0Q/bh9tDh3gsGWNIkqplaDu4C6wf0=
X-Gm-Gg: ASbGncvYsvJHNoS1m/B23KY8j7UJrmcbw3YWwOrF63KOZAwjI0kiw+ptzM9ALGGQ5pm
 MfRyudWs3g8+vJD6Rw3co483vvv7wAJvvrAUiISJ6unX4Z8uvfZiQ/QVlUW72pfzu7cFdC9VuKT
 qEBnK4DD/+9E6RsFKK2V0mWNMJoUodj53pkpBgRXGUiAL0jYfTXzvk6IEvFXqJkQA5gT7BT39tb
 vNYmR3Qn43tVjukv/jC929QF54oGZJpDlR6Aqw5ClJZcMre1gwWNSOpoFeloA==
X-Google-Smtp-Source: AGHT+IH4XlaBzxcnNj5YFZ0kloDrzQaT1eJpLjTjeIpDU2XpK4VeABDkTozkzcR3WZnwD6TgVQ+f15BePNjDYvfetA4=
X-Received: by 2002:a05:6000:186e:b0:428:476e:e0ab with SMTP id
 ffacd0b85a97d-429a7e97661mr333005f8f.60.1761583808872; Mon, 27 Oct 2025
 09:50:08 -0700 (PDT)
MIME-Version: 1.0
References: <20251022142051.70400-1-clamor95@gmail.com>
 <20251022142051.70400-7-clamor95@gmail.com>
 <bd6262c6-a31c-43a6-8ec5-2735fb2fe0d2@kernel.org>
In-Reply-To: <bd6262c6-a31c-43a6-8ec5-2735fb2fe0d2@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 27 Oct 2025 18:49:57 +0200
X-Gm-Features: AWmQ_blgGtMyE7YToN26_Q2JZoB8VDufuUc2Jv2Dui7Z-P7sPMVoiu7__HneWyw
Message-ID: <CAPVz0n277DZ8S5wX5n0gCaOpng64uEfx3VVue4Zp0n5bsDevqQ@mail.gmail.com>
Subject: Re: [PATCH v5 06/23] staging: media: tegra-video: vi: adjust
 get_selection op check
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 =?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
 Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, Aaron Kling <webgeek1234@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org, 
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

=D0=BF=D0=BD, 27 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 17:4=
4 Hans Verkuil <hverkuil+cisco@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyatoslav,
>
> On 22/10/2025 16:20, Svyatoslav Ryhel wrote:
> > Get_selection operation may be implemented only for sink pad and may
> > return error code. Set try_crop to 0 instead of returning error.
>
> Can you mention why try_crop is set to 0 instead of returning an error?
>
> That would be good to have in the commit log. And in fact, it's not
> clear to me either why you want this.
>
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/staging/media/tegra-video/vi.c | 8 ++------
> >  1 file changed, 2 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/m=
edia/tegra-video/vi.c
> > index 7c44a3448588..856b7c18b551 100644
> > --- a/drivers/staging/media/tegra-video/vi.c
> > +++ b/drivers/staging/media/tegra-video/vi.c
> > @@ -476,15 +476,11 @@ static int __tegra_channel_try_format(struct tegr=
a_vi_channel *chan,
> >       fse.code =3D fmtinfo->code;
> >       ret =3D v4l2_subdev_call(subdev, pad, enum_frame_size, sd_state, =
&fse);
> >       if (ret) {
> > -             if (!v4l2_subdev_has_op(subdev, pad, get_selection)) {
> > +             if (!v4l2_subdev_has_op(subdev, pad, get_selection) ||
> > +                 v4l2_subdev_call(subdev, pad, get_selection, NULL, &s=
dsel)) {
> >                       try_crop->width =3D 0;
> >                       try_crop->height =3D 0;
>
> This looks all a bit magical. Which subdev is queried here? I.e. what is =
the corresponding
> subdev driver that implements get_selection?
>

Camera sensor subdev, Tegra VI driver directly interacts with camera sensor=
.

> >               } else {
> > -                     ret =3D v4l2_subdev_call(subdev, pad, get_selecti=
on,
> > -                                            NULL, &sdsel);
> > -                     if (ret)
> > -                             return -EINVAL;
> > -
> >                       try_crop->width =3D sdsel.r.width;
> >                       try_crop->height =3D sdsel.r.height;
> >               }
>
> It looks odd (esp. setting try_crop to 0), and I wonder if this code path=
 has been tested.
>

Yes it was tested.

Original code checked if the camera sensor has get_selection
implemented and if such operation is supported then it applies width
and height from get_selection, else zeroes. This works just fine with
most cameras and v4l2 compliance tests pass fine, with most but not
with mt9m114 which implements get_selection only for its ifp source
pad while sink pad always returns -EINVAL, hence VI driver fails with
-EINVAL too. To address drivers like mt9m114 instead of just fail with
-EINVAL if get_selection returns error try_crop width and height will
be set the same as get_selection is not implemented.

> Regards,
>
>         Hans
