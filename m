Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 466B68D0A82
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 21:00:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC2EB10FC4E;
	Mon, 27 May 2024 19:00:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="A/rIdlmd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6972210E48E
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 19:00:49 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-df7719583d0so81201276.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 12:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716836448; x=1717441248; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6Ja7vlfEqAriKa+FwY5Dmg/udaegLnmPF1+eRGrrskg=;
 b=A/rIdlmdO0d+X5rEQtDdw+9X6HjfRYT8d/H2rDmCBnb/WtDKZgPuAX7Tn2GmlgQ2HF
 FnS/uEzDbmlddkNRpa8VRnTuKs9QxVs2wbqA3OTju/n3+UUi82BOZV96AQddyPqfmWBq
 WejSNTZ3EaX05AaNXkn3Mdsw5MuIj4EXjOU8ioGjPLJRXB/oqB4Jon7DZmd6LadVd2wb
 Jec8XxagKJkTAsmUoOc5pgyeIZ4MWDdEBXUHpP5R4pHkZUDDG2HVlZquP9NfiCWtRsGW
 OytvqEPxcAGAg5oAxU98h8u2Cym1IyBW5Ok4mJHPQ7UJC/4zG18wZOxnW6kLc+z9ur24
 HelA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716836448; x=1717441248;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6Ja7vlfEqAriKa+FwY5Dmg/udaegLnmPF1+eRGrrskg=;
 b=QC9ALEMs4qSH/S+cySBlIoWY1ZwqXpwgff/CpfUpZZj6+pQaDwYzXt1/s+5kKmscyh
 DPJEsek61Y8u+SdY9UbWGVGhqJoppX/ZEumKmcAO9IrHxjaO00wl193Rwmli7pcr0XBc
 EHq+aGlMQgWdpzmX+fmMNnMBUqso8GRXOQsNs4tA5lKQ4ofI+c9sKPlKCXSJA5QGP/PI
 hejFE6WXClR1RFy7O6k+2kTkMNBRFsug1GN8mioV4YrU9I15xZMfYSba/fPFHOtiwOLV
 EfwxKVGMeDt9iF2ugF5z8k/1czjlvmcGl9h7+Hazk4BmrF1bnhY7v1YOlcwbCS22D+io
 iuIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDLgUw0J2M6Zh+5GKdsoPfto14iJJJU98KdLgIojZVVGLCrIeIv/grqCDLeh0xUtEEN7kNCFjc0aIPE0yWvTZW8C3aezK+F2wlYHp9EQ3Y
X-Gm-Message-State: AOJu0Yw1e6/K7NUV2MqpJ5d8FlfZSW5LrZ1/rDwTRdLwM20gJELYJygP
 637jiAZjHK2mrBcQvIVEY9D1shKjxpRD+RMJ3FlUATBl8syQhsQUPuvYrWi1jUa7VO98X60sLQW
 yQYplgKp+7kDbbAzxb2LmAi6ceAOucBSLK8YOYA==
X-Google-Smtp-Source: AGHT+IFCtPi34MiO9HbMkpVChKlNZ5PYokKGNe1Zkm5+YriPlaD5ppmt2yv+lpMdcC4aRafyvtA23o5zBngE0l9ui5s=
X-Received: by 2002:a25:86c7:0:b0:df7:94d3:5555 with SMTP id
 3f1490d57ef6-df794d357fcmr5601696276.41.1716836447989; Mon, 27 May 2024
 12:00:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-17-51950db4fedb@kernel.org>
 <4n55dbl2h275z5ubebigri4xjtjsvt44w62n656srdgndcav2j@rrq5haucqx5u>
 <20240527-adamant-just-spaniel-ebed4e@houat>
 <a65wtf2hy7ufimkcgo5k2c34ygvtv7erwh567ngsnuaha7qiny@nl6lx67qsjuw>
 <20240527-colorful-orange-bug-bbeefe@houat>
In-Reply-To: <20240527-colorful-orange-bug-bbeefe@houat>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 27 May 2024 22:00:36 +0300
Message-ID: <CAA8EJpre5u_tD7VVnHwcjzJEV=9X_0Z+U==+gJGQBz6ie8FzFA@mail.gmail.com>
Subject: Re: [PATCH v14 17/28] drm/connector: hdmi: Add Broadcast RGB property
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Andy Yan <andy.yan@rock-chips.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Sebastian Wick <sebastian.wick@redhat.com>, 
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>
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

On Mon, 27 May 2024 at 16:30, Maxime Ripard <mripard@kernel.org> wrote:
>
> Hi,
>
> On Mon, May 27, 2024 at 12:43:18PM GMT, Dmitry Baryshkov wrote:
> > On Mon, May 27, 2024 at 11:02:13AM +0200, Maxime Ripard wrote:
> > > Hi,
> > >
> > > Thanks again for that thorough review :)
> > >
> > > On Thu, May 23, 2024 at 01:22:56PM GMT, Dmitry Baryshkov wrote:
> > > > On Tue, May 21, 2024 at 12:13:50PM +0200, Maxime Ripard wrote:
> > > > > The i915 driver has a property to force the RGB range of an HDMI =
output.
> > > > > The vc4 driver then implemented the same property with the same
> > > > > semantics. KWin has support for it, and a PR for mutter is also t=
here to
> > > > > support it.
> > > > >
> > > > > Both drivers implementing the same property with the same semanti=
cs,
> > > > > plus the userspace having support for it, is proof enough that it=
's
> > > > > pretty much a de-facto standard now and we can provide helpers fo=
r it.
> > > > >
> > > > > Let's plumb it into the newly created HDMI connector.
> > > > >
> > > > > Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > > > Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> > > > > Reviewed-by: Sebastian Wick <sebastian.wick@redhat.com>
> > > > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > > > ---
> > > > >  Documentation/gpu/kms-properties.csv            |  1 -
> > > > >  drivers/gpu/drm/display/drm_hdmi_state_helper.c |  4 +-
> > > > >  drivers/gpu/drm/drm_atomic.c                    |  2 +
> > > > >  drivers/gpu/drm/drm_atomic_uapi.c               |  4 ++
> > > > >  drivers/gpu/drm/drm_connector.c                 | 88 +++++++++++=
++++++++++++++
> > > > >  include/drm/drm_connector.h                     | 36 ++++++++++
> > > > >  6 files changed, 133 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/Documentation/gpu/kms-properties.csv b/Documentation=
/gpu/kms-properties.csv
> > > > > index 0f9590834829..caef14c532d4 100644
> > > > > --- a/Documentation/gpu/kms-properties.csv
> > > > > +++ b/Documentation/gpu/kms-properties.csv
> > > > > @@ -15,11 +15,10 @@ Owner Module/Drivers,Group,Property Name,Type=
,Property Values,Object attached,De
> > > > >  ,,=E2=80=9Csaturation=E2=80=9D,RANGE,"Min=3D0, Max=3D100",Connec=
tor,TBD
> > > > >  ,,=E2=80=9Chue=E2=80=9D,RANGE,"Min=3D0, Max=3D100",Connector,TBD
> > > > >  ,Virtual GPU,=E2=80=9Csuggested X=E2=80=9D,RANGE,"Min=3D0, Max=
=3D0xffffffff",Connector,property to suggest an X offset for a connector
> > > > >  ,,=E2=80=9Csuggested Y=E2=80=9D,RANGE,"Min=3D0, Max=3D0xffffffff=
",Connector,property to suggest an Y offset for a connector
> > > > >  ,Optional,"""aspect ratio""",ENUM,"{ ""None"", ""4:3"", ""16:9""=
 }",Connector,TDB
> > > > > -i915,Generic,"""Broadcast RGB""",ENUM,"{ ""Automatic"", ""Full""=
, ""Limited 16:235"" }",Connector,"When this property is set to Limited 16:=
235 and CTM is set, the hardware will be programmed with the result of the =
multiplication of CTM by the limited range matrix to ensure the pixels norm=
ally in the range 0..1.0 are remapped to the range 16/255..235/255."
> > > >
> > > > Should it still be defined as a generic property?
> > >
> > > I'm not sure what you mean here, sorry. It's being documented as a
> > > connector property now, so it's very much still listed as a generic
> > > property?
> >
> > I didn't perform my duty well enough and I didn't check the file for
> > other instances of the property. Now I indeed see a generic "Broadcast
> > RGB" property, but to me it looks like having a different set of values=
:
> >
> > ,,"""Broadcast RGB""",ENUM,"{ =E2=80=9Coff=E2=80=9D, =E2=80=9Cauto=E2=
=80=9D, =E2=80=9Con=E2=80=9D }",Connector,TBD
>
> That's not really what I meant: that file is deprecated now and it's not
> where we document the properties anymore. This patch has improved that
> documentation and moved it to the new place, and removed the deprecated
> part.
>
> However, this line shouldn't be there at all. I'll add a patch to remove
> it.

SG

>
> Thanks!
> Maxime



--=20
With best wishes
Dmitry
