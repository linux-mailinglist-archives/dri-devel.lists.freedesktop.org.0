Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F489700DE
	for <lists+dri-devel@lfdr.de>; Sat,  7 Sep 2024 10:22:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6229A10E1FF;
	Sat,  7 Sep 2024 08:22:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="DiSsmUtV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DFD210E1FF
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Sep 2024 08:22:36 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-5bef295a429so3198807a12.2
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Sep 2024 01:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1725697355; x=1726302155;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N2TPr7IpVwM3Z8u+FCHtLHW+fP56LGQQOSqI+TUdSl4=;
 b=DiSsmUtVFs5YzzPApvmCdm2KZtXvEkePTdGk5lEzfE4PdSSdnJMn5y84kgZ7Hb08IQ
 A0AAYYEJ6iHfnwOQb/WhFqJhVWYB4B7ziRZnI25vD8g0ZPz2F0Mnh7q6UjFvOy4e0Orx
 PHH/B/mnU3dQtQWs5MvMOpq54Vd61UqXPuGyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725697355; x=1726302155;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N2TPr7IpVwM3Z8u+FCHtLHW+fP56LGQQOSqI+TUdSl4=;
 b=DJV31k3VDXp8ldTorIj57V8trMCg+ZthNFwF9iZdRWO9hN56/W8jM6DJlq+hb1FGqf
 AZ6DsFDRApTSKgfKCusIgJXGhQ24d9yxeDluA7HRNiT2TRGkQcvoyWaUIWrt5Z+cSqKe
 KwL7AI171JkgdwptuMaOtxURI8QlevyoNo00aA8S4Kas08izWE/fcmrg52OM4AHXGDhr
 0e98iduEz1FOqJ3vzYO1ThYysHsDHxOheUxJaqDOna6IvmGSRrG1XrbknMesOBCCnW4K
 ynv8okWHlVCw1O7VpScQfUZLpLpGNIZ1muSmFyk8sUuQGvDd+wuulcrFlX/v7POfAeK/
 7+6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXATPaCWhzCpRZNc9pj/UCDJR4R1+RQ+JOhiB622mcCh38Xrs03KS4KBFDnogrE6jGs0JOvpVFCilM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw8t9h6vRAfYqIpMy2DmlNN3yF33CyXK4WZmxr4XUsN4y0tV2En
 /X7WrJ0kxnYyv4qZMDN7YtimzFlaGpnMioRb8EqBGO8ePxDNuRKj0falxk/3TEkT+8olUOVHKbR
 pBcAGhSLCV/MUZF1C2ms4NjdmU7rlfbGcN1FdQg==
X-Google-Smtp-Source: AGHT+IEHdBVXEUsVG4PQzBdWj3AoF7Bmnhd4RakCCp5yjjXX3GaxfY++7D7hFdvrbDq69hQ6gzgwTfaKqapj3yKbgyY=
X-Received: by 2002:a17:906:478d:b0:a72:5f9a:159a with SMTP id
 a640c23a62f3a-a8a885c3b20mr471539166b.2.1725697353806; Sat, 07 Sep 2024
 01:22:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240613072630.11690-1-andrea.calabrese@amarulasolutions.com>
 <ed824484-5d69-4ebd-a9b1-f7860f5b2cf6@amarulasolutions.com>
In-Reply-To: <ed824484-5d69-4ebd-a9b1-f7860f5b2cf6@amarulasolutions.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Sat, 7 Sep 2024 10:22:22 +0200
Message-ID: <CAOf5uwn6j_UcmvGR58Sfws=_haB0iR9jHUAQrPOgLB2hPZLLZg@mail.gmail.com>
Subject: Re: [PATCH v4] devres: Refactor using guards
To: Andrea Calabrese <andrea.calabrese@amarulasolutions.com>, 
 Lucas Stach <l.stach@pengutronix.de>
Cc: regkh@linuxfoundation.org, rafael@kernel.org, 
 dri-devel@lists.freedesktop.org, trivial@kernel.org, 
 linux-amarula@amarulasolutions.com
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

Hi Andrea

+cc Lucas

On Mon, Jul 22, 2024 at 10:43=E2=80=AFAM Andrea Calabrese
<andrea.calabrese@amarulasolutions.com> wrote:
>
> Hi all,
>
> just a small push on this, since I received no notifications.
>
> On 13/06/2024 09:26, Andrea Calabrese wrote:
> > Code refactoring using the recent guard and scoped_guard macros
> > for automatic cleanup of the spinlocks. This does not change the
> > effective behaviour of the kernel, but guarantees a cleaned-up exit fro=
m
> > each lock, automatically avoiding potential deadlocks.
> >
> > Signed-off-by: Andrea Calabrese <andrea.calabrese@amarulasolutions.com>
> >
> > ---
> > Diff from V3: as Greg KH and Lucas Stach noticed, there was a
> > behavioural change between the two versions: I used guard(spinlock),
> > while the expected behaviour should have come from a spinlock_irqsave
> > guard. This has been fixed.
> >

Maybe you should just repost to get some attention

Michael

> > diff --git a/drivers/base/devres.c b/drivers/base/devres.c
> > index 3df0025d12aa..4872756426dd 100644
> > --- a/drivers/base/devres.c
> > +++ b/drivers/base/devres.c
> > @@ -194,14 +194,12 @@ void devres_for_each_res(struct device *dev, dr_r=
elease_t release,
> >   {
> >       struct devres_node *node;
> >       struct devres_node *tmp;
> > -     unsigned long flags;
> >
> >       if (!fn)
> >               return;
> >
> > -     spin_lock_irqsave(&dev->devres_lock, flags);
> > -     list_for_each_entry_safe_reverse(node, tmp,
> > -                     &dev->devres_head, entry) {
> > +     guard(spinlock_irqsave)(&dev->devres_lock);
> > +     list_for_each_entry_safe_reverse(node, tmp, &dev->devres_head, en=
try) {
> >               struct devres *dr =3D container_of(node, struct devres, n=
ode);
> >
> >               if (node->release !=3D release)
> > @@ -210,7 +208,6 @@ void devres_for_each_res(struct device *dev, dr_rel=
ease_t release,
> >                       continue;
> >               fn(dev, dr->data, data);
> >       }
> > -     spin_unlock_irqrestore(&dev->devres_lock, flags);
> >   }
> >   EXPORT_SYMBOL_GPL(devres_for_each_res);
> >
> > @@ -243,11 +240,9 @@ EXPORT_SYMBOL_GPL(devres_free);
> >   void devres_add(struct device *dev, void *res)
> >   {
> >       struct devres *dr =3D container_of(res, struct devres, data);
> > -     unsigned long flags;
> >
> > -     spin_lock_irqsave(&dev->devres_lock, flags);
> > +     guard(spinlock_irqsave)(&dev->devres_lock);
> >       add_dr(dev, &dr->node);
> > -     spin_unlock_irqrestore(&dev->devres_lock, flags);
> >   }
> >   EXPORT_SYMBOL_GPL(devres_add);
> >
> > @@ -287,11 +282,8 @@ void * devres_find(struct device *dev, dr_release_=
t release,
> >                  dr_match_t match, void *match_data)
> >   {
> >       struct devres *dr;
> > -     unsigned long flags;
> > -
> > -     spin_lock_irqsave(&dev->devres_lock, flags);
> > +     guard(spinlock_irqsave)(&dev->devres_lock);
> >       dr =3D find_dr(dev, release, match, match_data);
> > -     spin_unlock_irqrestore(&dev->devres_lock, flags);
> >
> >       if (dr)
> >               return dr->data;
> > @@ -318,16 +310,14 @@ void * devres_get(struct device *dev, void *new_r=
es,
> >   {
> >       struct devres *new_dr =3D container_of(new_res, struct devres, da=
ta);
> >       struct devres *dr;
> > -     unsigned long flags;
> > -
> > -     spin_lock_irqsave(&dev->devres_lock, flags);
> > -     dr =3D find_dr(dev, new_dr->node.release, match, match_data);
> > -     if (!dr) {
> > -             add_dr(dev, &new_dr->node);
> > -             dr =3D new_dr;
> > -             new_res =3D NULL;
> > +     scoped_guard(spinlock_irqsave, &dev->devres_lock) {
> > +             dr =3D find_dr(dev, new_dr->node.release, match, match_da=
ta);
> > +             if (!dr) {
> > +                     add_dr(dev, &new_dr->node);
> > +                     dr =3D new_dr;
> > +                     new_res =3D NULL;
> > +             }
> >       }
> > -     spin_unlock_irqrestore(&dev->devres_lock, flags);
> >       devres_free(new_res);
> >
> >       return dr->data;
> > @@ -353,15 +343,13 @@ void * devres_remove(struct device *dev, dr_relea=
se_t release,
> >                    dr_match_t match, void *match_data)
> >   {
> >       struct devres *dr;
> > -     unsigned long flags;
> > -
> > -     spin_lock_irqsave(&dev->devres_lock, flags);
> > -     dr =3D find_dr(dev, release, match, match_data);
> > -     if (dr) {
> > -             list_del_init(&dr->node.entry);
> > -             devres_log(dev, &dr->node, "REM");
> > +     scoped_guard(spinlock_irqsave, &dev->devres_lock) {
> > +             dr =3D find_dr(dev, release, match, match_data);
> > +             if (dr) {
> > +                     list_del_init(&dr->node.entry);
> > +                     devres_log(dev, &dr->node, "REM");
> > +             }
> >       }
> > -     spin_unlock_irqrestore(&dev->devres_lock, flags);
> >
> >       if (dr)
> >               return dr->data;
> > @@ -516,7 +504,6 @@ static void release_nodes(struct device *dev, struc=
t list_head *todo)
> >    */
> >   int devres_release_all(struct device *dev)
> >   {
> > -     unsigned long flags;
> >       LIST_HEAD(todo);
> >       int cnt;
> >
> > @@ -528,9 +515,9 @@ int devres_release_all(struct device *dev)
> >       if (list_empty(&dev->devres_head))
> >               return 0;
> >
> > -     spin_lock_irqsave(&dev->devres_lock, flags);
> > -     cnt =3D remove_nodes(dev, dev->devres_head.next, &dev->devres_hea=
d, &todo);
> > -     spin_unlock_irqrestore(&dev->devres_lock, flags);
> > +     scoped_guard(spinlock_irqsave, &dev->devres_lock) {
> > +             cnt =3D remove_nodes(dev, dev->devres_head.next, &dev->de=
vres_head, &todo);
> > +     }
> >
> >       release_nodes(dev, &todo);
> >       return cnt;
> > @@ -552,7 +539,6 @@ int devres_release_all(struct device *dev)
> >   void * devres_open_group(struct device *dev, void *id, gfp_t gfp)
> >   {
> >       struct devres_group *grp;
> > -     unsigned long flags;
> >
> >       grp =3D kmalloc(sizeof(*grp), gfp);
> >       if (unlikely(!grp))
> > @@ -568,9 +554,8 @@ void * devres_open_group(struct device *dev, void *=
id, gfp_t gfp)
> >       if (id)
> >               grp->id =3D id;
> >
> > -     spin_lock_irqsave(&dev->devres_lock, flags);
> > +     guard(spinlock_irqsave)(&dev->devres_lock);
> >       add_dr(dev, &grp->node[0]);
> > -     spin_unlock_irqrestore(&dev->devres_lock, flags);
> >       return grp->id;
> >   }
> >   EXPORT_SYMBOL_GPL(devres_open_group);
> > @@ -609,17 +594,14 @@ static struct devres_group * find_group(struct de=
vice *dev, void *id)
> >   void devres_close_group(struct device *dev, void *id)
> >   {
> >       struct devres_group *grp;
> > -     unsigned long flags;
> >
> > -     spin_lock_irqsave(&dev->devres_lock, flags);
> > +     guard(spinlock_irqsave)(&dev->devres_lock);
> >
> >       grp =3D find_group(dev, id);
> >       if (grp)
> >               add_dr(dev, &grp->node[1]);
> >       else
> >               WARN_ON(1);
> > -
> > -     spin_unlock_irqrestore(&dev->devres_lock, flags);
> >   }
> >   EXPORT_SYMBOL_GPL(devres_close_group);
> >
> > @@ -635,19 +617,16 @@ EXPORT_SYMBOL_GPL(devres_close_group);
> >   void devres_remove_group(struct device *dev, void *id)
> >   {
> >       struct devres_group *grp;
> > -     unsigned long flags;
> > -
> > -     spin_lock_irqsave(&dev->devres_lock, flags);
> > -
> > -     grp =3D find_group(dev, id);
> > -     if (grp) {
> > -             list_del_init(&grp->node[0].entry);
> > -             list_del_init(&grp->node[1].entry);
> > -             devres_log(dev, &grp->node[0], "REM");
> > -     } else
> > -             WARN_ON(1);
> >
> > -     spin_unlock_irqrestore(&dev->devres_lock, flags);
> > +     scoped_guard(spinlock_irqsave, &dev->devres_lock) {
> > +             grp =3D find_group(dev, id);
> > +             if (grp) {
> > +                     list_del_init(&grp->node[0].entry);
> > +                     list_del_init(&grp->node[1].entry);
> > +                     devres_log(dev, &grp->node[0], "REM");
> > +             } else
> > +                     WARN_ON(1);
> > +     }
> >
> >       kfree(grp);
> >   }
> > @@ -668,11 +647,10 @@ EXPORT_SYMBOL_GPL(devres_remove_group);
> >   int devres_release_group(struct device *dev, void *id)
> >   {
> >       struct devres_group *grp;
> > -     unsigned long flags;
> >       LIST_HEAD(todo);
> >       int cnt =3D 0;
> >
> > -     spin_lock_irqsave(&dev->devres_lock, flags);
> > +     guard(spinlock_irqsave)(&dev->devres_lock);
> >
> >       grp =3D find_group(dev, id);
> >       if (grp) {
> > @@ -683,12 +661,9 @@ int devres_release_group(struct device *dev, void =
*id)
> >                       end =3D grp->node[1].entry.next;
> >
> >               cnt =3D remove_nodes(dev, first, end, &todo);
> > -             spin_unlock_irqrestore(&dev->devres_lock, flags);
> > -
> >               release_nodes(dev, &todo);
> >       } else {
> >               WARN_ON(1);
> > -             spin_unlock_irqrestore(&dev->devres_lock, flags);
> >       }
> >
> >       return cnt;
> > @@ -860,7 +835,6 @@ void *devm_krealloc(struct device *dev, void *ptr, =
size_t new_size, gfp_t gfp)
> >   {
> >       size_t total_new_size, total_old_size;
> >       struct devres *old_dr, *new_dr;
> > -     unsigned long flags;
> >
> >       if (unlikely(!new_size)) {
> >               devm_kfree(dev, ptr);
> > @@ -906,20 +880,17 @@ void *devm_krealloc(struct device *dev, void *ptr=
, size_t new_size, gfp_t gfp)
> >        * The spinlock protects the linked list against concurrent
> >        * modifications but not the resource itself.
> >        */
> > -     spin_lock_irqsave(&dev->devres_lock, flags);
> > +     scoped_guard(spinlock_irqsave, &dev->devres_lock) {
> > +             old_dr =3D find_dr(dev, devm_kmalloc_release, devm_kmallo=
c_match, ptr);
> > +             if (!old_dr) {
> > +                     kfree(new_dr);
> > +                     WARN(1, "Memory chunk not managed or managed by a=
 different device.");
> > +                     return NULL;
> > +             }
> >
> > -     old_dr =3D find_dr(dev, devm_kmalloc_release, devm_kmalloc_match,=
 ptr);
> > -     if (!old_dr) {
> > -             spin_unlock_irqrestore(&dev->devres_lock, flags);
> > -             kfree(new_dr);
> > -             WARN(1, "Memory chunk not managed or managed by a differe=
nt device.");
> > -             return NULL;
> > +             replace_dr(dev, &old_dr->node, &new_dr->node);
> >       }
> >
> > -     replace_dr(dev, &old_dr->node, &new_dr->node);
> > -
> > -     spin_unlock_irqrestore(&dev->devres_lock, flags);
> > -
> >       /*
> >        * We can copy the memory contents after releasing the lock as we=
're
> >        * no longer modifying the list links.
>
>


--=20
Michael Nazzareno Trimarchi
Co-Founder & Chief Executive Officer
M. +39 347 913 2170
michael@amarulasolutions.com
__________________________________

Amarula Solutions BV
Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
T. +31 (0)85 111 9172
info@amarulasolutions.com
www.amarulasolutions.com
