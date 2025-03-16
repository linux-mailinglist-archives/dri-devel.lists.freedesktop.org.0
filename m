Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 498DFA63777
	for <lists+dri-devel@lfdr.de>; Sun, 16 Mar 2025 22:04:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A3110E06F;
	Sun, 16 Mar 2025 21:04:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EYcQcN/I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D53D10E06F;
 Sun, 16 Mar 2025 21:04:34 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-6f6ca9a3425so39573797b3.2; 
 Sun, 16 Mar 2025 14:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742159073; x=1742763873; darn=lists.freedesktop.org;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=md11oMIZiDywb0aY7tjjNzmPg1FQkiTZGW/PqfpLY2s=;
 b=EYcQcN/IKrqpFsN0JcZbIvPZ5Y2W56ZSzMfsL7o75L1WUGRQXpymzfWe7jdmUQrtxn
 Ap4RVIZ3NohwonI/Z0/8kfp1Tw8JgJiFgpf5ovkrmBGbzL7cds++2IlNh7kK/bwBxLYc
 tSXrhnSPz0BA21Wz3oFxHU3UPSI7DU3kqcSZaDv3YPKE9dG9OVx3iMy7bohwFYt91pfg
 Tq+R2iUWZZHLYZNuIU4E4rzdFV6/0vF9364n7NghXS8cAwOg5umGT3FsYP2IgMUqhd0e
 vAqaukFzX4nxq5dVzp7NVWdH8iBO9JFjsXvTjbapv1PhZFTQ8F5qrrJty55LNaxb6PxU
 reYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742159073; x=1742763873;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=md11oMIZiDywb0aY7tjjNzmPg1FQkiTZGW/PqfpLY2s=;
 b=oEwRP3IxoTLItaE0rBC7KrfvJwWGoNxFYObGhAVxQbhNjNUiZdEQnpY6DWu3Js0qqg
 OEOdKroZnC3+PIgFiW9Tk1Z3wkOm2gndgcxv7Dg5GiX9nnVUG8fHHONP0ROzSoAzwbDd
 z4vCjG26gicN+qZK3ZVezUNgAi41x3GHtUDotPnfIYLghJKnldPisbvZUTa/rLEnCtMN
 KAEBQLbsJXy/kHvkD38oeI1MvEyKHJgSJ616cJcvZHfsTbl+UYEMJm528FZ1t+feMKul
 xU47rEu4Zjhls9tXp0Q0ADH8/BkeolwiSRH/XZFnXo7n25Z0cCzH+t+REkPsv3mcCtKT
 pUtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUb9rA7cP3szHI1Rfbwa1s8TXC0dxA9ah7t7f/lCiWBqnFv7vCqqXD+fzJOu27+BmOePWM4fR20tZEv@lists.freedesktop.org,
 AJvYcCVAznuo5mYez+bxprPCfx3t9S8hyxSC8jZ8WCMxQ/J9vIqHBSKSLW8IZUlaUBZugOQIPTRobxnn@lists.freedesktop.org,
 AJvYcCWemG9JaIjnrdzBSlfbZRs1jAWRotYPo3r74giyajHCmIQhT6gL5DTx5+qllkq2lbCuiS9TO+OxlF2M@lists.freedesktop.org,
 AJvYcCXEU9DG+pRa9Qp6V/+A1b1v4CL91HN0Tgsg5Id1POJ4fsAXZGPKJ3vyzNI2LzsvrbcbjDvvPa+ZloP7xGpKObyhmw==@lists.freedesktop.org,
 AJvYcCXdr3twbHVPVsbql++0wYyWmmsmFxNwfrqSGUsfeMbioT29k9R4/BekWkxhv4gRDuONXeshEbgOq9yjsRPiuA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwepOA8vc5S5r7H47vw+01AoDrQ+R0/qPwQYegCmgbbZj2S/JZ
 8dDS1XtHdANCDOyzoMYFnMlnAB0F15v+XIZj7XAVL1WUND1s+V8YzVmMpLjiCFCtB7jcPQVFnkG
 JahNXvDCWAtssQDOz1N9nofnGvj4=
X-Gm-Gg: ASbGncsvcUxxZLjm97r3rvCZntDgVqJYtMzdiFDPsMKlqnvYi8m/Bn1W1GrH3I+lkAP
 u5VDcbsx2SBOJ1ts0kWw3GfOjv8nMATdRP42BpKUnqQ4dKsi8rINGR8Gl7nsEuawO595+eWYVJ8
 rEzoRwUMOn/OGqBRxqTDnzufmlxcs8S5/Xpmo=
X-Google-Smtp-Source: AGHT+IH7NTlevocEsFCUsFAJkBJ8eedsf6LuBGDOgJsThKUoWmcfKtIOiaGA86wc6HMeYJIo6S6O4wjQS49carLMfdY=
X-Received: by 2002:a05:690c:7408:b0:6fe:bfb9:549c with SMTP id
 00721157ae682-6ff45eea8a2mr127867937b3.1.1742159073078; Sun, 16 Mar 2025
 14:04:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250125064619.8305-1-jim.cromie@gmail.com>
 <20250125064619.8305-22-jim.cromie@gmail.com>
 <497016b0-9e72-4374-a19b-967df8ed9b44@bootlin.com>
In-Reply-To: <497016b0-9e72-4374-a19b-967df8ed9b44@bootlin.com>
From: jim.cromie@gmail.com
Date: Sun, 16 Mar 2025 15:04:07 -0600
X-Gm-Features: AQ5f1JrQW-ChxEX-mDqp_TgiMFS1z1VACJr_say5FF-oBu6y4_4Lr7pMTHi9qhM
Message-ID: <CAJfuBxxGUk8KdyEuPUoVY3ftWNE8d6GEyG3me85xYetuysFGfQ@mail.gmail.com>
Subject: Re: [PATCH 21/63] dyndbg: allow ddebug_add_module to fail
To: Jim Cromie <jim.cromie@gmail.com>, linux-kernel@vger.kernel.org,
 jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org, 
 intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch, 
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com, 
 ville.syrjala@linux.intel.com
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

On Tue, Feb 25, 2025 at 7:26=E2=80=AFAM Louis Chauvet <louis.chauvet@bootli=
n.com> wrote:
>
>
>
> Le 25/01/2025 =C3=A0 07:45, Jim Cromie a =C3=A9crit :
> > To prep for failing modprobe on classid conflicts, upgrade the
> > call-chain around ddebug_add_module(), in 2 ways:
> >
> > 1. in ddebug_add_module() add local reserved_ids to accumulate
> > reservations, pass it by ref to ddebug_attach_{,user_}module_classes()
> > so they can examine the reservations as they work.
> >
> > 2. return int from both ddebug_attach_{,user_}module_classes(), up to
> > ddebug_add_module(), then to ddebug_module_notify().
> >
> > No conflicts are currently detected or returned.
> >
> > TBD: This is updated further by hoisting the reservation-check, which
> > obsoletes part of 2, creating churn, maybe squash it away.
>

this now done locally as
05b0eed12dcc dyndbg: hoist classmap-filter-by-modname up to ddebug_add_modu=
le
sha will change yet..

Though Ive dropped the fail-on-modprobe,
I didn't want to open up another failure mode

Some WARN or pr_error should suffice for now.


> Hi Jim,
>
> It could be very nice to squash when possible yes!
>
> > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
>
> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
>
> > ---
> >   lib/dynamic_debug.c | 40 +++++++++++++++++++++++++++++-----------
> >   1 file changed, 29 insertions(+), 11 deletions(-)
> >
> > diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
> > index 16c9b752822b..0ef243e30663 100644
> > --- a/lib/dynamic_debug.c
> > +++ b/lib/dynamic_debug.c
> > @@ -1216,8 +1216,9 @@ static void ddebug_apply_params(const struct ddeb=
ug_class_map *cm, const char *m
> >    * modular classmap vector/section.  Save the start and length of the
> >    * subrange at its edges.
> >    */
> > -static void ddebug_attach_module_classes(struct ddebug_table *dt,
> > -                                      const struct _ddebug_info *di)
> > +static int ddebug_attach_module_classes(struct ddebug_table *dt,
> > +                                     const struct _ddebug_info *di,
> > +                                     u64 *reserved_ids)
> >   {
> >       struct ddebug_class_map *cm;
> >       int i, nc =3D 0;
> > @@ -1230,13 +1231,14 @@ static void ddebug_attach_module_classes(struct=
 ddebug_table *dt,
> >               }
> >       }
> >       if (!nc)
> > -             return;
> > +             return 0;
> >
> >       vpr_info("module:%s attached %d classes\n", dt->mod_name, nc);
> >       dt->info.maps.len =3D nc;
> >
> >       for_subvec(i, cm, &dt->info, maps)
> >               ddebug_apply_params(cm, cm->mod_name);
> > +     return 0;
> >   }
> >
> >   /*
> > @@ -1244,8 +1246,9 @@ static void ddebug_attach_module_classes(struct d=
debug_table *dt,
> >    * means a query against the dt/module, which means it must be on the
> >    * list to be seen by ddebug_change.
> >    */
> > -static void ddebug_attach_user_module_classes(struct ddebug_table *dt,
> > -                                           const struct _ddebug_info *=
di)
> > +static int ddebug_attach_user_module_classes(struct ddebug_table *dt,
> > +                                           const struct _ddebug_info *=
di,
> > +                                           u64 *reserved_ids)
> >   {
> >       struct ddebug_class_user *cli;
> >       int i, nc =3D 0;
> > @@ -1266,7 +1269,7 @@ static void ddebug_attach_user_module_classes(str=
uct ddebug_table *dt,
> >               }
> >       }
> >       if (!nc)
> > -             return;
> > +             return 0;
> >
> >       dt->info.users.len =3D nc;
> >
> > @@ -1275,6 +1278,7 @@ static void ddebug_attach_user_module_classes(str=
uct ddebug_table *dt,
> >               ddebug_apply_params(cli->map, cli->mod_name);
> >
> >       vpr_dt_info(dt, "attach-client-module: ");
> > +     return 0;
> >   }
> >
> >   /*
> > @@ -1284,6 +1288,8 @@ static void ddebug_attach_user_module_classes(str=
uct ddebug_table *dt,
> >   static int ddebug_add_module(struct _ddebug_info *di, const char *mod=
name)
> >   {
> >       struct ddebug_table *dt;
> > +     u64 reserved_ids =3D 0;
> > +     int rc;
> >
> >       if (!di->descs.len)
> >               return 0;
> > @@ -1306,16 +1312,23 @@ static int ddebug_add_module(struct _ddebug_inf=
o *di, const char *modname)
> >
> >       INIT_LIST_HEAD(&dt->link);
> >
> > -     if (di->maps.len)
> > -             ddebug_attach_module_classes(dt, di);
> > -
> > +     if (di->maps.len) {
> > +             rc =3D ddebug_attach_module_classes(dt, di, &reserved_ids=
);
> > +             if (rc) {
> > +                     kfree(dt);
> > +                     return rc;
> > +             }
> > +     }
> >       mutex_lock(&ddebug_lock);
> >       list_add_tail(&dt->link, &ddebug_tables);
> >       mutex_unlock(&ddebug_lock);
> >
> > -     if (di->users.len)
> > -             ddebug_attach_user_module_classes(dt, di);
> >
> > +     if (di->users.len) {
> > +             rc =3D ddebug_attach_user_module_classes(dt, di, &reserve=
d_ids);
> > +             if (rc)
> > +                     return rc;
> > +     }
> >       vpr_info("%3u debug prints in module %s\n", di->descs.len, modnam=
e);
> >       return 0;
> >   }
> > @@ -1400,6 +1413,11 @@ static int ddebug_module_notify(struct notifier_=
block *self, unsigned long val,
> >       switch (val) {
> >       case MODULE_STATE_COMING:
> >               ret =3D ddebug_add_module(&mod->dyndbg_info, mod->name);
> > +             if (ret =3D=3D -EINVAL) {
> > +                     pr_err("conflicting dyndbg-classmap reservations\=
n");
> > +                     ddebug_remove_module(mod->name);
> > +                     break;
> > +             }
> >               if (ret)
> >                       WARN(1, "Failed to allocate memory: dyndbg may no=
t work properly.\n");
> >               break;
>
> --
> Louis Chauvet, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
