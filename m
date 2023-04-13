Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB40D6E14E2
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 21:11:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6EE110EBEC;
	Thu, 13 Apr 2023 19:11:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B23CD10EBEC
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 19:11:11 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-54fc337a650so49880677b3.4
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 12:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1681413069; x=1684005069;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/n5rfNu1HowE7oAZejmf2ckXvzQnhKf+e7UaYPPXJgI=;
 b=A6e1DKxF6H7MjNeylQgN8V8gRbpqhL5yWOJYGtKJEmCV89lomd+rOz8QW8Sxvj+6//
 yrEe8WOud7RmCNfEi+TDt4Bi6dV+zgGrwODAotoz35lVsLzUORmzrQQ6qZbwsCCSJQXm
 9FP92uPZykSszpf1aSbq1ZdQYmxaU3A6IyKrk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681413069; x=1684005069;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/n5rfNu1HowE7oAZejmf2ckXvzQnhKf+e7UaYPPXJgI=;
 b=GW74xOZiGIDu6E+REA8Bz4IXOilSvepjPs0R1KFnxG4X/c+ST95e2sF6e9l7HxsxG0
 KoV74lbm8dDxyCOrS/zYe4jQZqI4CtkJVo2/ik7iU61wer8pt0fOGLj873VLzYDuUxs3
 o0H/uJ1R4m+QAzdZGnkGuba6wtoB7npXl35ON7knnDdpk5DdkQZRXBoGtciIAKMck10D
 5w4SvWXVV3oRyDPfZir9j6hDTf8yxDWLcFqOTi+3eiDldm9GokMvpegPJtIDLD4HTFog
 TqQ7UWaSMLiJSil43it4wAK4D+uTOyothKZ4KJej/Mmb24Cs/lHXBEC0EQzLVJh16H7z
 lTVg==
X-Gm-Message-State: AAQBX9fJgkIvSLQIrwsRCmqpD1ndBX0GaYaFd3cPdNlmJ9wcyy4eFh+M
 J6fbfuqmXvt2/hv1J0aS0xWLfUn4SpvhUAk4LBo=
X-Google-Smtp-Source: AKy350Z7Q0RSiaQcIwx1bBZDyhlRHPpaW5CNG9yfR4eQIFpv76N9Kvecyr3W7h+WgAFHZ73O4qQ9VA==
X-Received: by 2002:a81:83cd:0:b0:54f:2b6e:6cd0 with SMTP id
 t196-20020a8183cd000000b0054f2b6e6cd0mr2990406ywf.7.1681413069409; 
 Thu, 13 Apr 2023 12:11:09 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com.
 [209.85.219.181]) by smtp.gmail.com with ESMTPSA id
 cn24-20020a05690c0d1800b0054fb1f20948sm425756ywb.83.2023.04.13.12.11.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Apr 2023 12:11:07 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id c7so1820522ybn.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 12:11:06 -0700 (PDT)
X-Received: by 2002:a25:cc05:0:b0:b8b:eea7:525a with SMTP id
 l5-20020a25cc05000000b00b8beea7525amr1725774ybf.7.1681413066412; Thu, 13 Apr
 2023 12:11:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230408082014.235425-1-nikita@trvn.ru>
 <CAD=FV=XEQS9MB4e52B4yLjiP8ksYmeos_emiH4=-adCOwzfGUA@mail.gmail.com>
 <905403377ec62914a2fbe21a6b4a6c8e@trvn.ru>
In-Reply-To: <905403377ec62914a2fbe21a6b4a6c8e@trvn.ru>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 13 Apr 2023 12:10:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X_NUNXgY-9p6CUvNwYte+aPjjZPLV4oZRXR5zdEn0Kjg@mail.gmail.com>
Message-ID: <CAD=FV=X_NUNXgY-9p6CUvNwYte+aPjjZPLV4oZRXR5zdEn0Kjg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Implement wait_hpd_asserted
To: Nikita Travkin <nikita@trvn.ru>
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
Cc: neil.armstrong@linaro.org, rfoss@kernel.org, andrzej.hajda@intel.com,
 jonas@kwiboo.se, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jernej.skrabec@gmail.com, Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Apr 12, 2023 at 9:19=E2=80=AFPM Nikita Travkin <nikita@trvn.ru> wro=
te:
>
> Doug Anderson =D0=BF=D0=B8=D1=81=D0=B0=D0=BB(=D0=B0) 13.04.2023 01:22:
> > Hi,
> >
> > On Sat, Apr 8, 2023 at 1:20=E2=80=AFAM Nikita Travkin <nikita@trvn.ru> =
wrote:
> >>
> >> This bridge doesn't actually implement HPD due to it being way too slo=
w
> >> but instead expects the panel driver to wait enough to assume HPD is
> >> asserted. However some panels (such as the generic 'edp-panel') expect
> >> the bridge to deal with the delay and pass maximum delay to the aux
> >> instead.
> >>
> >> In order to support such panels, add a dummy implementation of wait
> >> that would just sleep the maximum delay and assume no failure has
> >> happened.
> >>
> >> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
> >> ---
> >> This was suggested in [1] to make sure DT users can be semantically
> >> correct (not adding no-hpd when the line is actually there) while
> >> still using a hard delay to be faster than waiting the long debounce
> >> time.
> >>
> >> [1] - https://lore.kernel.org/all/CAD=3DFV=3DVR7sKsquE25eF7joc7gPApu-v=
qwduZzjE=3DwFCoXjMYnQ@mail.gmail.com/
> >> ---
> >>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 19 +++++++++++++++++++
> >>  1 file changed, 19 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/b=
ridge/ti-sn65dsi86.c
> >> index 7a748785c545..260cad1fd1da 100644
> >> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> >> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> >> @@ -618,6 +618,24 @@ static ssize_t ti_sn_aux_transfer(struct drm_dp_a=
ux *aux,
> >>         return len;
> >>  }
> >>
> >> +static int ti_sn_aux_wait_hpd_asserted(struct drm_dp_aux *aux, unsign=
ed long wait_us)
> >> +{
> >> +       /*
> >> +        * The HPD in this chip is a bit useless (See comment in
> >> +        * ti_sn65dsi86_enable_comms) so if our driver is expected to =
wait
> >> +        * for HPD, we just assume it's asserted after the wait_us del=
ay.
> >> +        *
> >> +        * In case we are asked to wait forever (wait_us=3D0) take con=
servative
> >> +        * 500ms delay.
> >> +        */
> >> +       if (wait_us =3D=3D 0)
> >> +               wait_us =3D 500000;
> >> +
> >> +       usleep_range(wait_us, wait_us + 1000);
> >> +
> >> +       return 0;
> >> +}
> >> +
> >>  static int ti_sn_aux_probe(struct auxiliary_device *adev,
> >>                            const struct auxiliary_device_id *id)
> >>  {
> >> @@ -627,6 +645,7 @@ static int ti_sn_aux_probe(struct auxiliary_device=
 *adev,
> >>         pdata->aux.name =3D "ti-sn65dsi86-aux";
> >>         pdata->aux.dev =3D &adev->dev;
> >>         pdata->aux.transfer =3D ti_sn_aux_transfer;
> >> +       pdata->aux.wait_hpd_asserted =3D ti_sn_aux_wait_hpd_asserted;
> >
> > This looks reasonable to me, but I think you only want this
> > implementation if the "no-hpd" property _isn't_ present. In other
> > words:
> >
> > if (!of_property_read_bool(np, "no-hpd"))
> >   pdata->aux.wait_hpd_asserted =3D ti_sn_aux_wait_hpd_asserted;
> >
> > Essentially:
> >
> > * If "no-hpd" is present in ti-sn65dsi86 then we'll assume that HPD is
> > handled by the panel driver via a GPIO or a "no-hpd" there (which will
> > cause the panel driver to wait the maximum duration).
> >
> > * If "no-hpd" isn't present in ti-sn65dsi86 then HPD is actually
> > hooked up and thus the panel driver _won't_ handle it.
> >
> > Does that seem right? Presumably this should be explained by comments.
> >
>
> This does sound reasonable indeed, I didn't think to add it
> conditionally because, looking at the current users of
> wait_hpd_asserted, they will first try the "no-hpd" paths
> and will only call the bridge when they think it's on the
> bridge to wait.
>
> Thus, if DT is modeled properly - Panel has no-hpd or a gpio,
> wait_hpd_asserted will never be called anyway. Other bridges
> seem to also unconditionally enable the method.
>
> For this to be a trouble, a panel driver has to be "broken"
> with some form of calling wait_hpd_asserted despite knowing
> the HPD line is not hooked up...
>
> So I feel like guarding the wait_hpd_asserted for no-hpd
> users should not actually change much, but if you think
> I should add the check anyway, please let me know.

Ah, true, it shouldn't actually matter. I guess I still like it
slightly better with the extra check but not enough that I'll insist
on it. Thus:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I can commit this to drm-misc-next, but I'll plan to wait ~1 week to
see if anyone else has any comments about it.

-Doug
