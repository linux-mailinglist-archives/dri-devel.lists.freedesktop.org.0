Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0264253C72F
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 10:57:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 258E510E2B9;
	Fri,  3 Jun 2022 08:57:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8FF710E2B9
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jun 2022 08:57:47 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id ew15so5109299qtb.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jun 2022 01:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7zhHII/DS4QRjgxHtKGpmTA0qCxEvYRa7d6vBVg1/3I=;
 b=THwBYsq46Go8yRw7Wlg7M90twt/p83YwtRg3qL/1JSR0F0T37iyEUM00c8QdBcsznG
 F8IuFGaDjeC1Z4+BSm7HnHXkuhwZvrj0ymkj03rHZF6ZOqi4nt1yNgWyu/x5HC8tpPEM
 Qlq7rERMDHI23AVBflNh4oDOQCY8ZsjZeg0CN5GL6+qkpxaXow/UenFc4rSfYfe9cvwi
 6IAliYt1FzAzZGD1mFWSYNw9SxUfk2MtK2ffcXDIBEsUyIIPTv5aW+HLNemTlBSMbOQk
 7Tjn5zPedMx7yhaSebSseH8l1dEFx29eDx0dNpaJLfDGrgY1FQn/aSU5eTYSAy5iJcUX
 CMxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7zhHII/DS4QRjgxHtKGpmTA0qCxEvYRa7d6vBVg1/3I=;
 b=p7XZS6f4nUkd7BxCGCzumBt8B9nThFNGNLTRLbm/1XPgbKsT1fI78OouiIPgwZM2se
 iQawwjSytMv3SiSiNUvldgB81qmSv/ZLmLLhqRsCKMwrKD/TstJUQ2HahxQA7MzWS0M2
 Lww5aE5msTDILz1sU/uIzpWx75u0QfvcYMMa/zkslZATQ02O00GrOYPPcCByCqJE+k7Y
 f/8Er+CqVg4Sw09deCFgM5R9E02gVxIF5jeYN+1+dnWGKVMHr6KOYr3pPYEv6Jixv8dk
 MMDIu1ILw0Pue2yBiyBjpLQu7MZ09eXFfC80li1lP3HDV1rTg8EHanQs9M6T6fxZpINY
 3DJg==
X-Gm-Message-State: AOAM532PlB2TF6+gqiu9uFrI3Y5fdyRmH09d4pVq6/fq4j+43tH8oaWc
 2pKGL7vyL+zIcsQosXP6fy7Kk3nxFsiahtwS7vI=
X-Google-Smtp-Source: ABdhPJy16OoYcLy5R6zXDdyw9O3WXdWXOFOwTUrT9zCMmhkGZeY0qh8vg7dtsB9fpa1i/GTJSVWKf/DI3dB7vtkuJk8=
X-Received: by 2002:ac8:5896:0:b0:2f3:d231:58a9 with SMTP id
 t22-20020ac85896000000b002f3d23158a9mr6574470qta.131.1654246666777; Fri, 03
 Jun 2022 01:57:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220602180118.66170-1-r.stratiienko@gmail.com>
 <20220603082416.ukohug3mwzu43csu@penduick>
In-Reply-To: <20220603082416.ukohug3mwzu43csu@penduick>
From: Roman Stratiienko <r.stratiienko@gmail.com>
Date: Fri, 3 Jun 2022 11:57:35 +0300
Message-ID: <CAGphcdkPJ57bkw4nxuSnk0TD1RGW5j9M-A0ek6t1rDnMY2PS8Q@mail.gmail.com>
Subject: Re: [PATCH] drm/sun4i: sun8i: Add the ability to keep scaler enabled
 for VI layer
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Samuel Holland <samuel@sholland.org>, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, wens@csie.org,
 megi@xff.cz, =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

=D0=BF=D1=82, 3 =D0=B8=D1=8E=D0=BD. 2022 =D0=B3. =D0=B2 11:24, Maxime Ripar=
d <maxime@cerno.tech>:
>
> Hi,
>
> On Thu, Jun 02, 2022 at 06:01:18PM +0000, Roman Stratiienko wrote:
> > According to DE2.0/DE3.0 manual VI scaler enable register is double
> > buffered, but de facto it doesn't, or the hardware has the shadow
> > register latching issues which causes single-frame picture corruption
> > after changing the state of scaler enable register.
> >
> > Allow the user to keep the scaler always enabled, preventing the UI
> > glitches on the transition from scaled to unscaled state.
> >
> > NOTE:
> > UI layer scaler has more registers with double-buffering issue and can'=
t
> > be workarounded in the same manner.
> >
> > You may find a python test and a demo video for this issue at [1]
> >
> > [1]: https://github.com/GloDroid/glodroid_tests/issues/4
>
> Please describe the issue entirely here. The commit log must be self-suff=
icient.

Commit message already states "single-frame picture corruption after
changing the state of scaler enable register", therefore I find it
already self-sufficient

Also I find demo videos and link to tests useful for the followers to
go further with investigation.

If you have something specific in mind when asking to enhance the
commit message please say it.

>
> > Signed-off-by: Roman Stratiienko <r.stratiienko@gmail.com>
> > ---
> >  drivers/gpu/drm/sun4i/sun8i_mixer.c    | 12 ++++++++++++
> >  drivers/gpu/drm/sun4i/sun8i_vi_layer.c |  4 +++-
> >  2 files changed, 15 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4=
i/sun8i_mixer.c
> > index 71ab0a00b4de..15cad0330f66 100644
> > --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > @@ -27,6 +27,18 @@
> >  #include "sun8i_vi_layer.h"
> >  #include "sunxi_engine.h"
> >
> > +/* According to DE2.0/DE3.0 manual VI scaler enable register is double
> > + * buffered, but de facto it doesn't, or the hardware has the shadow
> > + * register latching issues which causes single-frame picture corrupti=
on
> > + * after changing the state of scaler enable register.
> > + * Allow the user to keep the scaler always enabled, preventing the UI
> > + * glitches on the transition from scaled to unscaled state.
> > + */
> > +int sun8i_vi_keep_scaler_enabled;
> > +MODULE_PARM_DESC(keep_vi_scaler_enabled,
> > +              "Keep VI scaler enabled (1 =3D enabled, 0 =3D disabled (=
default))");
> > +module_param_named(keep_vi_scaler_enabled, sun8i_vi_keep_scaler_enable=
d, int, 0644);
> > +
>
> It's not clear to me why we would want to make that a parameter?
>
>1 If it never works, we should fix it once and for all and not allow a bro=
ken setup at all.

It's a hardware issue and can be fixed only within the hardware.

Current patch is a workaround that if enabled can cause increased
power consumption
for existing users. Therefore I think it is better to give existing
distro-maintainers a chance to test it prior to delivery.

Also I do not have all the sunxi SOCs to test it. My tests were
limited only by A64 and H6 SOCs.

> Maxime

Best regards,
Roman
