Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 052ED3CC233
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jul 2021 11:35:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BB8A6EA3E;
	Sat, 17 Jul 2021 09:35:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A44E66E9F9
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jul 2021 01:15:34 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id h3so9955827ilc.9
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 18:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dtAOvJ/2X0/rifE2LFs90JkkoIPzC0cIi8g4UCCnjeA=;
 b=SGTvt1ihsPrvuMtmmWuCXTESY6NH8rd6ujY6IPBirpAYWZ9khKUUWYRnSQmEk6j3gX
 vz2t3bO5RDMWI7I5Y/E1N+cz40W3FMk4TMj7uSZI11ur81WSrx3IR6otyLhvOgjs/sgd
 Y1zDbi2XSJnoGGV8floDDCWBDp/tV530gKso/lJ00fSC9JHjOS8uXOYk6ZI4pYuZBd6v
 Zmgf+SjvFOWUFCWRL7CvZYzszFPC+xJapJuswDjHrU7Rcf56Jz+VsjlGeuONEtCYsRgA
 eKrL8k0ws9LixPQyJrzIL8plrvMKrr0ljdnzd2nOrO+ex1j/JpcIqtUe+VdAGcAaPlsJ
 8low==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dtAOvJ/2X0/rifE2LFs90JkkoIPzC0cIi8g4UCCnjeA=;
 b=EDVK2l2W2a+enS08jCwmCcFfbVYG8Ece+Z/fVDQZFYE/6zoIPeMhoiH5jjP71RSHBy
 sdp4sR8BARbZPaeXDjRFJ4ToR/cysO5OMQPFwHYV3sQML8kVUj5LT6XIFUA5L1dbek7z
 W2PIB3BVSzlQNnoxoeDpZnZWEFMvhoH3vtOOR5Ir0hNrSSW0HaEOvynCgSyoDTd1RzCJ
 2MqFd9tYvNroNN3uxCrYmjSHZ2IZ7Hk6d5Z0xcdQ2g9M/GiLgtDjOVHS9nYsjAB8Qp44
 JEckxXNhGmDRCbZqMQCE1q7r5zzzj4K+Uv8RdblLBt0QtNw1wG8dqRRvcWeaJ+YLUVhx
 aegg==
X-Gm-Message-State: AOAM53347PCHG48iVzOUpT0qOyHrfwhiXeYHy5+LKRJ+xl40wOWP5C2k
 Awf7XJH+8jTf8hDa+OJgIlD5+BVkSXxkunqVn2s=
X-Google-Smtp-Source: ABdhPJw3v9MipS5o0iHxS2PC0MZmVrCiFhi6gthJJB/CDuS5lsToAvXg/Cpq4cYFHNly8QtusiCE6pS7YSCc2qFyEtE=
X-Received: by 2002:a05:6e02:b24:: with SMTP id
 e4mr8283427ilu.41.1626484534059; 
 Fri, 16 Jul 2021 18:15:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210716095522.27187-1-ainux.wang@gmail.com>
 <227ae846-c8a4-876a-2d4b-363aec33eca9@suse.de>
In-Reply-To: <227ae846-c8a4-876a-2d4b-363aec33eca9@suse.de>
From: Ainux Wang <ainux.wang@gmail.com>
Date: Sat, 17 Jul 2021 09:14:58 +0800
Message-ID: <CAPWE4_ytU9qz_FLg3ru90nW+0G=mkGoSgerCnniks+H+2_Ba-A@mail.gmail.com>
Subject: Re: [PATCH] drm/ast: Return value when do not get edid
To: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 17 Jul 2021 09:35:00 +0000
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
Cc: airlied@linux.ie, teng sterling <sterlingteng@gmail.com>,
 Huacai Chen <chenhuacai@kernel.org>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> =E4=BA=8E2021=E5=B9=B47=E6=9C=8816=
=E6=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=888:00=E5=86=99=E9=81=93=EF=BC=
=9A
>
> Hi
>
> Am 16.07.21 um 11:55 schrieb ainux.wang@gmail.com:
> > From: "Ainux.Wang" <ainux.wang@gmail.com>
> >
> > There is should a status when do not get edid.
>
> Well, not really.
>
> So, the problem is that VGA is not hotplug-able. It's supposed to be
> connected when the computer gets switched on. And there's no interface
> for sensing the connection state.
>
> But in practice, the cable can be attached/detached at any time. Reading
> out the EDID is the non-official way for detecting the connection state.
> You either get EDID data or garbage, where the latter is interpreted as
> 'disconnected'.
>
> But really old monitors (maybe mid-90s and before) don't provide EDID
> data. For those, DRM adds standard VGA modes IIRC. And they would likely
> be detected as 'disconnected'.
>
> I'll merge your original patch '(r <=3D 0)' and anyone who's stuck with
> such an old monitor can probably specify a compatible EDID on the kernel
> command line.
>
> (I'd like to hear other people's opinion about this TBH.)
>
> Best regards
> Thomas
>
Hi=EF=BC=8C
Thank you for your review and reply, and what is the =E2=80=98IIRC=E2=80=99=
, i do not
find it in the
kernel document.

Best regards
Ainux
> >
> > Signed-off-by: Ainux.Wang <ainux.wang@gmail.com>
> > ---
> >   drivers/gpu/drm/ast/ast_mode.c | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_m=
ode.c
> > index e5996ae03c49..05df48b3d223 100644
> > --- a/drivers/gpu/drm/ast/ast_mode.c
> > +++ b/drivers/gpu/drm/ast/ast_mode.c
> > @@ -1231,8 +1231,10 @@ static int ast_get_modes(struct drm_connector *c=
onnector)
> >               ret =3D drm_add_edid_modes(connector, edid);
> >               kfree(edid);
> >               return ret;
> > -     } else
> > +     } else {
> >               drm_connector_update_edid_property(&ast_connector->base, =
NULL);
> > +             return -ENXIO;
> > +     }
> >       return 0;
> >   }
> >
> >
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>
