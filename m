Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45674900AC8
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 18:52:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B37BD10E06D;
	Fri,  7 Jun 2024 16:52:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ICmDu/YN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5F4210E06D;
 Fri,  7 Jun 2024 16:52:33 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id
 46e09a7af769-6f96064f38cso27394a34.0; 
 Fri, 07 Jun 2024 09:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717779152; x=1718383952; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d9oBCOvPN+myCQtEdlIKkY65EngGca25XZLlE9lZXnA=;
 b=ICmDu/YNjk+zWX0UUX8T5cP+oc4GuBhEU4hVUxcqL3fth2yMeJHn7bRiqe3NmKd0Gm
 DPa6Xz3T5WGdBF44Yxzdb+hG/uNrsM8rFt49AlqSCdmO8R84xVKKvcDMwAjB7kbJmYE2
 Bz8aJDfJo+Pnb9S87veoHGBVZAf7KKtPta9+EWlC6Y8JC6asEQHHd6gxwiYQwdm7hsKS
 I2d3EceOWOHTtL8/L6uMmDsSwtG/6X7ySmq+tRAWE+/2ZlZIUFu9/HZ2uZi7VUApuGVg
 A9sMpfpx4W5+uxwyKXgWlKgW+1EgEzTNthDoeQzCZEczIJA307CzwmvNVZZvpnnjZ7+F
 /EGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717779152; x=1718383952;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d9oBCOvPN+myCQtEdlIKkY65EngGca25XZLlE9lZXnA=;
 b=O5w/3jdui4L9TnH8x02NG9/mibvrMGqVj7SbijPMYJhPQFHvMEaNu38/owauuBy5wZ
 /3rsCV9oEEb8olyjc/EWHAaV9WO8tw/IVyJwUvPtQgFojeSNQ1pset7jZyEhuTqRTsy1
 4VoWDgwkNYne2DjauiY+0mLmBrpvHTdJ85VIHCZgLidyZB77FSzsXf+pAG6eH6+7IFYN
 h0Rl9ZeldIV9Ja5iYTtXrM8T5ZAMrFo6Tjc0xQwL2eLHjnVbxIQQeCDnN+EntWVgcE0a
 KwnzhLps9Ugbb7pdDMPnq96/D/imOlTHG6Vvq0QMXercHeWZU7e+MHB6JZB3chT3b7BV
 W9sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdj3gmsOavpDIIuRwS4q8qsvCStvv/HBZSeQwR0Pz08DrIcoa0dWO+8S+gdOPZJ6MRR5WtKRusBOcuK7CuChL1uUh1tl6kCtC4XTqfPQV1grHVcQa52cLlht0WYNsaNDXCIuXf//AfT9yExlQWbA==
X-Gm-Message-State: AOJu0Yzw0626fypF+2AbFwlzV9jjRIYxCnsQefgg1yEzryWdLdhcYkAL
 WK+ASvrY4iWxA09irj2RgFpitY0/MWrWcH5M8Sb2cG5bo8trNczJkIO34srrrpGys9QMos0lQl8
 riQsPlniaa4WoTPQZQY1yvgXnsR4=
X-Google-Smtp-Source: AGHT+IEDD2D/77JuggPksgMH8B6CmEL8dBhYEJyZEJL7LHJun60lv2Kkvnb8DAxx4zJzT5b+XQbIZfxuZXVX9RlQt3g=
X-Received: by 2002:a05:6871:20b:b0:250:702f:8bab with SMTP id
 586e51a60fabf-254649487e9mr3022741fac.3.1717779152521; Fri, 07 Jun 2024
 09:52:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240528215344.2442-1-anarsoul@gmail.com>
 <d388ebb2-fdef-400f-a62e-67352385effd@nvidia.com>
 <CAPM=9txUt=vRyO=ozZNHhreb3Lsn6Pjtm=Na=NfU-D-pmnyxOw@mail.gmail.com>
In-Reply-To: <CAPM=9txUt=vRyO=ozZNHhreb3Lsn6Pjtm=Na=NfU-D-pmnyxOw@mail.gmail.com>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Fri, 7 Jun 2024 09:52:06 -0700
Message-ID: <CA+E=qVe+H93bqJ=o-zVKj8UaRsnj8jbi1E2t+Mbmq9aLecKtnQ@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau: don't attempt to schedule hpd_work on
 headless cards
To: Dave Airlie <airlied@gmail.com>
Cc: Ben Skeggs <bskeggs@nvidia.com>, dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org
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

On Thu, Jun 6, 2024 at 6:37=E2=80=AFPM Dave Airlie <airlied@gmail.com> wrot=
e:
>
> readding original poster

Thanks, Dave!

Ben, please keep me on CC, since I'm not subscribed to either nouveau
or dri-devel mailing lists.

> On Wed, 29 May 2024 at 09:57, Ben Skeggs <bskeggs@nvidia.com> wrote:

> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gp=
u/drm/nouveau/nouveau_connector.c
> > > index 856b3ef5edb8..b315a2ef5b28 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_connector.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
> > > @@ -1190,6 +1190,9 @@ nouveau_connector_hpd(struct nouveau_connector =
*nv_connector, u64 bits)
> > >       u32 mask =3D drm_connector_mask(&nv_connector->base);
> > >       unsigned long flags;
> > >
> > > +     if (drm->headless)
> > > +             return;
> > > +
> >
> > You shouldn't need this change, the function can't be called if there's
> > no display.

You are right. I added it for extra safety in case if the code changes
in future and it somehow gets called, but I don't have a strong
preference, so I can drop it in v2.

> >
> > >       spin_lock_irqsave(&drm->hpd_lock, flags);
> > >       if (!(drm->hpd_pending & mask)) {
> > >               nv_connector->hpd_pending |=3D bits;
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/=
drm/nouveau/nouveau_display.c
> > > index aed5d5b51b43..1961ef665e97 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_display.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
> > > @@ -450,6 +450,9 @@ nouveau_display_hpd_resume(struct drm_device *dev=
)
> > >   {
> > >       struct nouveau_drm *drm =3D nouveau_drm(dev);
> > >
> > > +     if (drm->headless)
> > > +             return;
> > > +
> > >       spin_lock_irq(&drm->hpd_lock);
> > >       drm->hpd_pending =3D ~0;
> > >       spin_unlock_irq(&drm->hpd_lock);
> > > @@ -468,6 +471,11 @@ nouveau_display_hpd_work(struct work_struct *wor=
k)
> > >       int changed =3D 0;
> > >       struct drm_connector *first_changed_connector =3D NULL;
> > >
> > > +     WARN_ON_ONCE(drm->headless);
> > > +
> > > +     if (drm->headless)
> > > +             return;
> > > +
> >
> > Same here.

Same comment, I'll drop it for v2.

Regards,
Vasily
