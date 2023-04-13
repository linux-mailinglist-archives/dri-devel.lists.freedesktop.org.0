Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A313F6E1159
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 17:42:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57A9910E36E;
	Thu, 13 Apr 2023 15:42:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D85C10E320;
 Thu, 13 Apr 2023 15:42:26 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-18782426c4bso5196059fac.9; 
 Thu, 13 Apr 2023 08:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681400546; x=1683992546;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UvOwIt6zrh6qQP/JicH9P8YGOKCDxcWkEi/fkX5OxdY=;
 b=DZQPJy/M7D6+C30lu02m120iL+T6vp+vaS8myftqhYSEFMqshFhMy1XMtPH0E3djE7
 NHM7/n4ECSXGwKKl15MF4BukNnlqTcO+gujVR0gDpwTDsjaTmpIQ4O2goFrmK83zmBWr
 OGptPOA5KySMwGEkH/4W7DehC1+MuDtbHyU72eDCxDYFtFHPrSwlyu580g35WLeonjxg
 pORxFfPBUnQCqUIKPkq1dadINCHHNZEptaL0CmBAXcC75tLVavtEQn7/Ym/oMW6bJeVz
 mh0wJtLteVSJi81WGWRPcq4FzHldaNy514pHneGjC9MNq6I1yPtYPLBrIisCUDe+QgmN
 gJUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681400546; x=1683992546;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UvOwIt6zrh6qQP/JicH9P8YGOKCDxcWkEi/fkX5OxdY=;
 b=eWpOefdbj7l3KuFb5r0yCkVBhRt4UZZoaVgy/pJYSsol8uBvdG3bs0qRWoBq0u/RiE
 GIvMK79wQOyKA5kC+iJ24MCYqfHsWDDmkipfDOdYbOGEXy0u2GY8g0BLcQJMC21239jR
 RVobDAJY0Y2FtXnendHWC1mU4rd3tgtga5BltoJWypU6GKEHzhSuXP9qU7FAaACcFpLf
 +4sN8LwvoyJuL557wuRMjJmyQkLjFTN+pehcP8htnSqdcBHcTwDhHRjRzjuMClT3Ic0/
 DAE6T8jipqje13UnbZHI5UEgrc61GvRSqnxOHpmD4HTmVevr7+42tjnCmIkNM0cosAFI
 szVw==
X-Gm-Message-State: AAQBX9fT2J9G59HV087TTDOLKt1r0JrrUhNBROJkQJaQ8pvtmsLnQ2L6
 ZcG1eIBynifxJEiFtLwdx50x2S2Zo4MJCfmUeKA=
X-Google-Smtp-Source: AKy350ZAgVzz5BXpDRoz4Vk0NnfWkifKhvoNjPgM4LHsIs0L+m4N8v2UKA5TVoIKsXmP3B/93dtTyfXxAlyBiTZSEXg=
X-Received: by 2002:a05:6870:8a22:b0:184:2097:e64f with SMTP id
 p34-20020a0568708a2200b001842097e64fmr1457122oaq.5.1681400545763; Thu, 13 Apr
 2023 08:42:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230412224311.23511-1-robdclark@gmail.com>
 <20230412224311.23511-5-robdclark@gmail.com>
 <76c836a3-30a8-a46e-5a1a-0e3dc5967459@linux.intel.com>
In-Reply-To: <76c836a3-30a8-a46e-5a1a-0e3dc5967459@linux.intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 13 Apr 2023 08:42:12 -0700
Message-ID: <CAF6AEGu7=fLYsA6sFSNJCB6kNBJLNg8b3Z6L-ROOa31zTeneFg@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] drm/i915: Switch to fdinfo helper
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Emil Velikov <emil.l.velikov@gmail.com>,
 Christopher Healy <healych@amazon.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 13, 2023 at 6:07=E2=80=AFAM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 12/04/2023 23:42, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
>
> There is more do to here to remove my client->id fully (would now be
> dead code) so maybe easiest if you drop this patch and I do it after you
> land this and it propagates to our branches? I'd like to avoid pain with
> conflicts if possible..

That is fine by me

BR,
-R

> Regards,
>
> Tvrtko
>
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >   drivers/gpu/drm/i915/i915_driver.c     |  3 ++-
> >   drivers/gpu/drm/i915/i915_drm_client.c | 18 +++++-------------
> >   drivers/gpu/drm/i915/i915_drm_client.h |  2 +-
> >   3 files changed, 8 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/=
i915_driver.c
> > index db7a86def7e2..0d91f85f8b97 100644
> > --- a/drivers/gpu/drm/i915/i915_driver.c
> > +++ b/drivers/gpu/drm/i915/i915_driver.c
> > @@ -1696,7 +1696,7 @@ static const struct file_operations i915_driver_f=
ops =3D {
> >       .compat_ioctl =3D i915_ioc32_compat_ioctl,
> >       .llseek =3D noop_llseek,
> >   #ifdef CONFIG_PROC_FS
> > -     .show_fdinfo =3D i915_drm_client_fdinfo,
> > +     .show_fdinfo =3D drm_show_fdinfo,
> >   #endif
> >   };
> >
> > @@ -1796,6 +1796,7 @@ static const struct drm_driver i915_drm_driver =
=3D {
> >       .open =3D i915_driver_open,
> >       .lastclose =3D i915_driver_lastclose,
> >       .postclose =3D i915_driver_postclose,
> > +     .show_fdinfo =3D i915_drm_client_fdinfo,
> >
> >       .prime_handle_to_fd =3D drm_gem_prime_handle_to_fd,
> >       .prime_fd_to_handle =3D drm_gem_prime_fd_to_handle,
> > diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/drm/i=
915/i915_drm_client.c
> > index b09d1d386574..4a77e5e47f79 100644
> > --- a/drivers/gpu/drm/i915/i915_drm_client.c
> > +++ b/drivers/gpu/drm/i915/i915_drm_client.c
> > @@ -101,7 +101,7 @@ static u64 busy_add(struct i915_gem_context *ctx, u=
nsigned int class)
> >   }
> >
> >   static void
> > -show_client_class(struct seq_file *m,
> > +show_client_class(struct drm_printer *p,
> >                 struct i915_drm_client *client,
> >                 unsigned int class)
> >   {
> > @@ -117,22 +117,20 @@ show_client_class(struct seq_file *m,
> >       rcu_read_unlock();
> >
> >       if (capacity)
> > -             seq_printf(m, "drm-engine-%s:\t%llu ns\n",
> > +             drm_printf(p, "drm-engine-%s:\t%llu ns\n",
> >                          uabi_class_names[class], total);
> >
> >       if (capacity > 1)
> > -             seq_printf(m, "drm-engine-capacity-%s:\t%u\n",
> > +             drm_printf(p, "drm-engine-capacity-%s:\t%u\n",
> >                          uabi_class_names[class],
> >                          capacity);
> >   }
> >
> > -void i915_drm_client_fdinfo(struct seq_file *m, struct file *f)
> > +void i915_drm_client_fdinfo(struct drm_printer *p, struct drm_file *fi=
le)
> >   {
> > -     struct drm_file *file =3D f->private_data;
> >       struct drm_i915_file_private *file_priv =3D file->driver_priv;
> >       struct drm_i915_private *i915 =3D file_priv->dev_priv;
> >       struct i915_drm_client *client =3D file_priv->client;
> > -     struct pci_dev *pdev =3D to_pci_dev(i915->drm.dev);
> >       unsigned int i;
> >
> >       /*
> > @@ -141,12 +139,6 @@ void i915_drm_client_fdinfo(struct seq_file *m, st=
ruct file *f)
> >        * **************************************************************=
****
> >        */
> >
> > -     seq_printf(m, "drm-driver:\t%s\n", i915->drm.driver->name);
> > -     seq_printf(m, "drm-pdev:\t%04x:%02x:%02x.%d\n",
> > -                pci_domain_nr(pdev->bus), pdev->bus->number,
> > -                PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn));
> > -     seq_printf(m, "drm-client-id:\t%u\n", client->id);
> > -
> >       /*
> >        * Temporarily skip showing client engine information with GuC su=
bmission till
> >        * fetching engine busyness is implemented in the GuC submission =
backend
> > @@ -155,6 +147,6 @@ void i915_drm_client_fdinfo(struct seq_file *m, str=
uct file *f)
> >               return;
> >
> >       for (i =3D 0; i < ARRAY_SIZE(uabi_class_names); i++)
> > -             show_client_class(m, client, i);
> > +             show_client_class(p, client, i);
> >   }
> >   #endif
> > diff --git a/drivers/gpu/drm/i915/i915_drm_client.h b/drivers/gpu/drm/i=
915/i915_drm_client.h
> > index 69496af996d9..ef85fef45de5 100644
> > --- a/drivers/gpu/drm/i915/i915_drm_client.h
> > +++ b/drivers/gpu/drm/i915/i915_drm_client.h
> > @@ -60,7 +60,7 @@ static inline void i915_drm_client_put(struct i915_dr=
m_client *client)
> >   struct i915_drm_client *i915_drm_client_add(struct i915_drm_clients *=
clients);
> >
> >   #ifdef CONFIG_PROC_FS
> > -void i915_drm_client_fdinfo(struct seq_file *m, struct file *f);
> > +void i915_drm_client_fdinfo(struct drm_printer *p, struct drm_file *fi=
le);
> >   #endif
> >
> >   void i915_drm_clients_fini(struct i915_drm_clients *clients);
