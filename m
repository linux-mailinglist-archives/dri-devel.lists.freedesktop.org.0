Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5180A63772
	for <lists+dri-devel@lfdr.de>; Sun, 16 Mar 2025 21:58:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5EF010E050;
	Sun, 16 Mar 2025 20:58:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Nja6Fi9i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80D2810E050;
 Sun, 16 Mar 2025 20:58:42 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-6ff4faf858cso14142987b3.2; 
 Sun, 16 Mar 2025 13:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742158721; x=1742763521; darn=lists.freedesktop.org;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q4YtoW9QYN27EM1Dm6vfHGi/yc6Ixn0UAaM/j9EuR9A=;
 b=Nja6Fi9iupJEOfQ5cgqE0tp3M7CgmaXf24H+uVPBnWI6pfMUoBpwhKzz2rsz8Nt1qT
 LtGujxayO14Yo4dMHFVY0+CcPIQbB5epBrMPpNcRwdrqb3lZAoNgMkP2iUTl8yHC6peO
 U1WzrQBq4JX/CFnCkGr2q09TCZE9JTcYyvUCMDO5xPdBF+UQjBMBNr2jmg3Va664J+Uh
 ci10eYiWCWh8IqsigRSCXWdnWb+u0utNFsiO1VWtwSesFPgQgsMcvJRTRxD+m5JojgxM
 B2ols0BLCu0fueXospGw6qCotQJZ5CQQbESc5mE8GTSb6yLeVuSgL4lpPbBe60AoVBUt
 JvQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742158721; x=1742763521;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q4YtoW9QYN27EM1Dm6vfHGi/yc6Ixn0UAaM/j9EuR9A=;
 b=MKdRh46F5HgMoGhh/E20PlCl458efrDc4u7hW/QkfM8Jfg3nsFJq1XKWdv6ja3EYYE
 I8goqufM1Rg9uX+B4IP2AnKk5jLH0NlhrDQM/Gm4FL3ijGfDWOUVThfObw+QNkimD6ZC
 yKneAteUJt5ToiF/5izhnVJBRxSIA7MGKp6fo9maX0sXdNjlsYRCJDnqq4ZLMCa2/Q65
 tv+8WGaGka1zpxnoe/2WOkzUe0jMeg4sCN+aUroFd4bAcvLJTWrsakpbDJCKOvDWDgTD
 sKzUBSwJews1RsaCPSB9icTuGN7V3pDW7BKallAPzv4H7vamlWtJ1ctl9zUCW2jVzouC
 hKRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVB2ZCS5XT3lrfYT1BhnfNoBUqXmaR+kChVlj2ggQlbUnxkGpZZ5Vx3i3o2bXBBl0fvcykC+rsN+REl@lists.freedesktop.org,
 AJvYcCVQUaNTLbghIFqyCz1Oe6nxQ+ZXU/tVBoGw4qjjGd6ZWXekczo3plH1ugWxyy/vjBdqX7d8Sx8V@lists.freedesktop.org,
 AJvYcCVXnfHr59cFSHBvpe209NZ2mzbUbhFlCg2488hFqYOS+uQm8SsJ8fXrMStSF78Wqi0lj+NWmTsB224L@lists.freedesktop.org,
 AJvYcCWaCG2yXf3z91Wj+mqehF4tXdfEjB8icpDblVAZ58/q5Q4sV4D6ZfrGbLqZwj9nRJ1HvgnpG/dbubzuHJCPqA==@lists.freedesktop.org,
 AJvYcCXR/CY/zigcXUoSIR28qF8MnM3PXE6TA12IxVLJ6mmdPzrqsdOVqvaYPHmK4Y0qzdNfYztVHKd2JhEL0HTWsYrysw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvcYpq1XrrDOQuAXW4IrwIGhUWZMbOJ7YwJwayrIqlMIq5UPlf
 3IdlJuB3zW9+2DrTgqWjuQSRXikNADKHSf+9N6kAZsU8I22rOLyzWOr8JECXVfKlcqKi19qYdzj
 BN1GFjNf46a8g1W/7ymMAxyGZqNM=
X-Gm-Gg: ASbGncvK2hIAxx6kdtHHbKcf1sxE6o58kB8QQU1Z2GXRtyFTvBQaidD3JQGrw82ZpP5
 snQBxq6lbwUvoa9ypStYmWjCKzxCAllA035QdmyjHAhyv66BpKxjhQEV/bN15Ef4+C6MhF2YWrj
 TKFm2ZRx5Kg0AZgt5TX3ffkPzq+63tKvxg6ds=
X-Google-Smtp-Source: AGHT+IH7oSQiP8IeAJPsxc2D3G2NZAAJ/MM3V/d+KTFwT0rVfp2vuJUsqxOwPMIy+Ocea6u7Eg9j/TxTYapI0kKjTCE=
X-Received: by 2002:a05:690c:380e:b0:6fd:4670:80e0 with SMTP id
 00721157ae682-6ff46025b58mr137304087b3.36.1742158721279; Sun, 16 Mar 2025
 13:58:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250125064619.8305-1-jim.cromie@gmail.com>
 <20250125064619.8305-20-jim.cromie@gmail.com>
 <74f6ee77-523c-4943-9b3f-a9bcab78faa7@bootlin.com>
In-Reply-To: <74f6ee77-523c-4943-9b3f-a9bcab78faa7@bootlin.com>
From: jim.cromie@gmail.com
Date: Sun, 16 Mar 2025 14:58:15 -0600
X-Gm-Features: AQ5f1JpYzPaIPDAwIHcE1bohYKLQcsEp3UFwkX4GsfBeMButb_6-z5bM_Lj-WEc
Message-ID: <CAJfuBxyivEYRXUPuu3k8GeLkx+XTFt4qBM_=0kF-OnY7YnB8xA@mail.gmail.com>
Subject: Re: [PATCH 19/63] dyndbg: make proper substructs in _ddebug_info
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Jim Cromie <jim.cromie@gmail.com>, 
 linux-kernel@vger.kernel.org, jbaron@akamai.com, gregkh@linuxfoundation.org, 
 ukaszb@chromium.org, intel-gfx-trybot@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com, 
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

On Tue, Feb 25, 2025 at 7:19=E2=80=AFAM Louis Chauvet <louis.chauvet@bootli=
n.com> wrote:
>
>
>
> Le 25/01/2025 =C3=A0 07:45, Jim Cromie a =C3=A9crit :
> > struct _ddebug_info's jobs is to enapsulate the __sections of dyndbg
> > data from the linker.  The data started as a single pair of fields:
> > descs - ref'g an array of descriptors & num_descs - counting the
> > "pertinent" descriptors.  Then classes & num_classes were added, and
> > _ddebug_info was invented to contain the 4 fields.
> >
> > When class_users & num_class_users were added (earlier in this
> > series), the easy path was to replicate functions and adapt them to
> > work on ddebug_class_users, instead of class_maps.  This worked, but
> > made repetitive boilerplate code, leading to (other commits with)
> > macros walking num_##{classes,class_users} to capture the repetition.
> >
> > To fix it better, create structs to contain start,len for vectors of
> > all 3 objects: classmaps, class_users, and pr_debug descriptors, and
> > adjust field-refs accordingly.
> >
> > Also recompose struct ddebug_table to contain a _ddebug_info (rather
> > than repeat the contents, as before), and adjust all array-walks to
> > use the newly contained info.
> >
> > This allows ridding the class* macros of the num##<T> paste-up, and
> > should enable further cleanups.
> >
> > NB: The __packed attribute on _ddebug_info and the 3 contained structs
> > closes the holes otherwise created by the structification (which was
> > the excuse for not doing it originally).
> >
> > TBD: see if this can precede other patches, to reduce churn
>
> Hi Jim,
>
> This could be amazing if possible!

Yup. this one now immediately follows for-subvec
it does help clean up the set.


>
> > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
>
> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
>
> > ---
> >   include/linux/dynamic_debug.h | 29 ++++++++---
> >   kernel/module/main.c          | 18 +++----
> >   lib/dynamic_debug.c           | 93 +++++++++++++++++-----------------=
-
> >   3 files changed, 74 insertions(+), 66 deletions(-)
> >
> > diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debu=
g.h
> > index 2b0c943af330..48d76a273f68 100644
> > --- a/include/linux/dynamic_debug.h
> > +++ b/include/linux/dynamic_debug.h
> > @@ -173,15 +173,28 @@ struct ddebug_class_user {
> >               .map =3D &(_var),                                        =
 \
> >       }
> >
> > -/* encapsulate linker provided built-in (or module) dyndbg data */
> > +/*
> > + * @_ddebug_info: gathers module/builtin dyndbg_* __sections together.
> > + * For builtins, it is used as a cursor, with the inner structs
> > + * marking sub-vectors of the builtin __sections in DATA.
> > + */
> > +struct _ddebug_descs {
> > +     struct _ddebug *start;
> > +     int len;
> > +} __packed;
> > +struct dd_class_maps {
> > +     struct ddebug_class_map *start;
> > +     int len;
> > +} __packed;
> > +struct dd_class_users {
> > +     struct ddebug_class_user *start;
> > +     int len;
> > +} __packed;
> >   struct _ddebug_info {
> > -     struct _ddebug *descs;
> > -     struct ddebug_class_map *classes;
> > -     struct ddebug_class_user *class_users;
> > -     unsigned int num_descs;
> > -     unsigned int num_classes;
> > -     unsigned int num_class_users;
> > -};
> > +     struct _ddebug_descs descs;
> > +     struct dd_class_maps maps;
> > +     struct dd_class_users users;
> > +} __packed;
> >
> >   struct ddebug_class_param {
> >       union {
> > diff --git a/kernel/module/main.c b/kernel/module/main.c
> > index c394a0c6e8c6..858882a1eacd 100644
> > --- a/kernel/module/main.c
> > +++ b/kernel/module/main.c
> > @@ -2540,15 +2540,15 @@ static int find_module_sections(struct module *=
mod, struct load_info *info)
> >               pr_warn("%s: Ignoring obsolete parameters\n", mod->name);
> >
> >   #ifdef CONFIG_DYNAMIC_DEBUG_CORE
> > -     mod->dyndbg_info.descs =3D section_objs(info, "__dyndbg",
> > -                                           sizeof(*mod->dyndbg_info.de=
scs),
> > -                                           &mod->dyndbg_info.num_descs=
);
> > -     mod->dyndbg_info.classes =3D section_objs(info, "__dyndbg_classes=
",
> > -                                             sizeof(*mod->dyndbg_info.=
classes),
> > -                                             &mod->dyndbg_info.num_cla=
sses);
> > -     mod->dyndbg_info.class_users =3D section_objs(info, "__dyndbg_cla=
ss_users",
> > -                                                 sizeof(*mod->dyndbg_i=
nfo.class_users),
> > -                                                &mod->dyndbg_info.num_=
class_users);
> > +     mod->dyndbg_info.descs.start =3D section_objs(info, "__dyndbg",
> > +                                                 sizeof(*mod->dyndbg_i=
nfo.descs.start),
> > +                                                 &mod->dyndbg_info.des=
cs.len);
> > +     mod->dyndbg_info.maps.start =3D section_objs(info, "__dyndbg_clas=
ses",
> > +                                                sizeof(*mod->dyndbg_in=
fo.maps.start),
> > +                                                &mod->dyndbg_info.maps=
.len);
> > +     mod->dyndbg_info.users.start =3D section_objs(info, "__dyndbg_cla=
ss_users",
> > +                                                 sizeof(*mod->dyndbg_i=
nfo.users.start),
> > +                                                 &mod->dyndbg_info.use=
rs.len);
> >   #endif
> >
> >       return 0;
> > diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
> > index 08b6e4e7489f..067db504dd1d 100644
> > --- a/lib/dynamic_debug.c
> > +++ b/lib/dynamic_debug.c
> > @@ -49,10 +49,7 @@ extern struct ddebug_class_user __stop___dyndbg_clas=
s_users[];
> >   struct ddebug_table {
> >       struct list_head link;
> >       const char *mod_name;
> > -     struct _ddebug *ddebugs;
> > -     struct ddebug_class_map *classes;
> > -     struct ddebug_class_user *class_users;
> > -     unsigned int num_ddebugs, num_classes, num_class_users;
> > +     struct _ddebug_info info;
> >   };
> >
> >   struct ddebug_query {
> > @@ -154,8 +151,8 @@ static void vpr_info_dq(const struct ddebug_query *=
query, const char *msg)
> >   #define vpr_dt_info(dt_p, msg_p, ...) ({                            \
> >       struct ddebug_table const *_dt =3D dt_p;                         =
 \
> >       v2pr_info(msg_p " module:%s nd:%d nc:%d nu:%d\n", ##__VA_ARGS__, =
\
> > -               _dt->mod_name, _dt->num_ddebugs, _dt->num_classes,    \
> > -               _dt->num_class_users);                                \
> > +               _dt->mod_name, _dt->info.descs.len, _dt->info.maps.len,=
 \
> > +               _dt->info.users.len);                                 \
> >       })
> >
> >   /*
> > @@ -168,8 +165,8 @@ static void vpr_info_dq(const struct ddebug_query *=
query, const char *msg)
> >    * @_vec: name of a sub-struct member in _box, with array-ref and len=
gth
> >    */
> >   #define for_subvec(_i, _sp, _box, _vec)                              =
      \
> > -     for ((_i) =3D 0, (_sp) =3D (_box)->_vec;                         =
  \
> > -          (_i) < (_box)->num_##_vec;                                \
> > +     for ((_i) =3D 0, (_sp) =3D (_box)->_vec.start;                   =
  \
> > +          (_i) < (_box)->_vec.len;                                  \
> >            (_i)++, (_sp)++)
> >
> >   static int ddebug_find_valid_class(struct ddebug_table const *dt, con=
st char *class_string)
> > @@ -178,14 +175,14 @@ static int ddebug_find_valid_class(struct ddebug_=
table const *dt, const char *cl
> >       struct ddebug_class_user *cli;
> >       int i, idx;
> >
> > -     for_subvec(i, map, dt, classes) {
> > +     for_subvec(i, map, &dt->info, maps) {
> >               idx =3D match_string(map->class_names, map->length, class=
_string);
> >               if (idx >=3D 0) {
> >                       vpr_dt_info(dt, "good-class: %s.%s ", map->mod_na=
me, class_string);
> >                       return idx + map->base;
> >               }
> >       }
> > -     for_subvec(i, cli, dt, class_users) {
> > +     for_subvec(i, cli, &dt->info, users) {
> >               idx =3D match_string(cli->map->class_names, cli->map->len=
gth, class_string);
> >               if (idx >=3D 0) {
> >                       vpr_dt_info(dt, "class-ref: %s -> %s.%s ",
> > @@ -229,8 +226,8 @@ static int ddebug_change(const struct ddebug_query =
*query, struct flag_settings
> >                       valid_class =3D _DPRINTK_CLASS_DFLT;
> >               }
> >
> > -             for (i =3D 0; i < dt->num_ddebugs; i++) {
> > -                     struct _ddebug *dp =3D &dt->ddebugs[i];
> > +             for (i =3D 0; i < dt->info.descs.len; i++) {
> > +                     struct _ddebug *dp =3D &dt->info.descs.start[i];
> >
> >                       /* match site against query-class */
> >                       if (dp->class_id !=3D valid_class)
> > @@ -990,8 +987,8 @@ static struct _ddebug *ddebug_iter_first(struct dde=
bug_iter *iter)
> >       }
> >       iter->table =3D list_entry(ddebug_tables.next,
> >                                struct ddebug_table, link);
> > -     iter->idx =3D iter->table->num_ddebugs;
> > -     return &iter->table->ddebugs[--iter->idx];
> > +     iter->idx =3D iter->table->info.descs.len;
> > +     return &iter->table->info.descs.start[--iter->idx];
> >   }
> >
> >   /*
> > @@ -1012,10 +1009,10 @@ static struct _ddebug *ddebug_iter_next(struct =
ddebug_iter *iter)
> >               }
> >               iter->table =3D list_entry(iter->table->link.next,
> >                                        struct ddebug_table, link);
> > -             iter->idx =3D iter->table->num_ddebugs;
> > +             iter->idx =3D iter->table->info.descs.len;
> >               --iter->idx;
> >       }
> > -     return &iter->table->ddebugs[iter->idx];
> > +     return &iter->table->info.descs.start[iter->idx];
> >   }
> >
> >   /*
> > @@ -1064,15 +1061,15 @@ static void *ddebug_proc_next(struct seq_file *=
m, void *p, loff_t *pos)
> >
> >   static const char *ddebug_class_name(struct ddebug_table *dt, struct =
_ddebug *dp)
> >   {
> > -     struct ddebug_class_map *map =3D dt->classes;
> > -     struct ddebug_class_user *cli =3D dt->class_users;
> > +     struct ddebug_class_map *map;
> > +     struct ddebug_class_user *cli;
> >       int i;
> >
> > -     for (i =3D 0; i < dt->num_classes; i++, map++)
> > +     for_subvec(i, map, &dt->info, maps)
> >               if (class_in_range(dp->class_id, map))
> >                       return map->class_names[dp->class_id - map->base]=
;
> >
> > -     for (i =3D 0; i < dt->num_class_users; i++, cli++)
> > +     for_subvec(i, cli, &dt->info, users)
> >               if (class_in_range(dp->class_id, cli->map))
> >                       return cli->map->class_names[dp->class_id - cli->=
map->base];
> >
> > @@ -1203,8 +1200,7 @@ static void ddebug_apply_params(const struct ddeb=
ug_class_map *cm, const char *m
> >
> >       if (cm->mod) {
> >               vpr_cm_info(cm, "loaded classmap: %s", modnm);
> > -             /* ifdef protects the cm->mod->kp deref */
> > -             for_subvec(i, kp, cm->mod, kp)
> > +             for (i =3D 0, kp =3D cm->mod->kp; i < cm->mod->num_kp; i+=
+, kp++)
> >                       ddebug_match_apply_kparam(kp, cm, modnm);
> >       }
> >   #endif
> > @@ -1226,20 +1222,20 @@ static void ddebug_attach_module_classes(struct=
 ddebug_table *dt,
> >       struct ddebug_class_map *cm;
> >       int i, nc =3D 0;
> >
> > -     for_subvec(i, cm, di, classes) {
> > +     for_subvec(i, cm, di, maps) {
> >               if (!strcmp(cm->mod_name, dt->mod_name)) {
> >                       vpr_cm_info(cm, "classes[%d]:", i);
> >                       if (!nc++)
> > -                             dt->classes =3D cm;
> > +                             dt->info.maps.start =3D cm;
> >               }
> >       }
> >       if (!nc)
> >               return;
> >
> >       vpr_info("module:%s attached %d classes\n", dt->mod_name, nc);
> > -     dt->num_classes =3D nc;
> > +     dt->info.maps.len =3D nc;
> >
> > -     for_subvec(i, cm, dt, classes)
> > +     for_subvec(i, cm, &dt->info, maps)
> >               ddebug_apply_params(cm, cm->mod_name);
> >   }
> >
> > @@ -1259,23 +1255,23 @@ static void ddebug_attach_user_module_classes(s=
truct ddebug_table *dt,
> >        * module's refs, save to dt.  For loadables, this is the
> >        * whole array.
> >        */
> > -     for_subvec(i, cli, di, class_users) {
> > +     for_subvec(i, cli, di, users) {
> >               if (WARN_ON_ONCE(!cli || !cli->map || !cli->mod_name))
> >                       continue;
> >               if (!strcmp(cli->mod_name, dt->mod_name)) {
> >                       vpr_cm_info(cli->map, "class_ref[%d] %s -> %s", i=
,
> >                                   cli->mod_name, cli->map->mod_name);
> >                       if (!nc++)
> > -                             dt->class_users =3D cli;
> > +                             dt->info.users.start =3D cli;
> >               }
> >       }
> >       if (!nc)
> >               return;
> >
> > -     dt->num_class_users =3D nc;
> > +     dt->info.users.len =3D nc;
> >
> >       /* now iterate dt */
> > -     for_subvec(i, cli, di, class_users)
> > +     for_subvec(i, cli, di, users)
> >               ddebug_apply_params(cli->map, cli->mod_name);
> >
> >       vpr_dt_info(dt, "attach-client-module: ");
> > @@ -1291,10 +1287,10 @@ static int ddebug_add_module(struct _ddebug_inf=
o *di, const char *modname)
> >       struct _ddebug *iter;
> >       int i, class_ct =3D 0;
> >
> > -     if (!di->num_descs)
> > +     if (!di->descs.len)
> >               return 0;
> >
> > -     v3pr_info("add-module: %s %d sites\n", modname, di->num_descs);
> > +     v3pr_info("add-module: %s %d sites\n", modname, di->descs.len);
> >
> >       dt =3D kzalloc(sizeof(*dt), GFP_KERNEL);
> >       if (dt =3D=3D NULL) {
> > @@ -1308,8 +1304,7 @@ static int ddebug_add_module(struct _ddebug_info =
*di, const char *modname)
> >        * this struct ddebug_table.
> >        */
> >       dt->mod_name =3D modname;
> > -     dt->ddebugs =3D di->descs;
> > -     dt->num_ddebugs =3D di->num_descs;
> > +     dt->info.descs =3D di->descs;
> >
> >       INIT_LIST_HEAD(&dt->link);
> >
> > @@ -1317,17 +1312,17 @@ static int ddebug_add_module(struct _ddebug_inf=
o *di, const char *modname)
> >               if (iter->class_id !=3D _DPRINTK_CLASS_DFLT)
> >                       class_ct++;
> >
> > -     if (class_ct && di->num_classes)
> > +     if (class_ct && di->maps.len)
> >               ddebug_attach_module_classes(dt, di);
> >
> >       mutex_lock(&ddebug_lock);
> >       list_add_tail(&dt->link, &ddebug_tables);
> >       mutex_unlock(&ddebug_lock);
> >
> > -     if (class_ct && di->num_class_users)
> > +     if (class_ct && di->users.len)
> >               ddebug_attach_user_module_classes(dt, di);
> >
> > -     vpr_info("%3u debug prints in module %s\n", di->num_descs, modnam=
e);
> > +     vpr_info("%3u debug prints in module %s\n", di->descs.len, modnam=
e);
> >       return 0;
> >   }
> >
> > @@ -1474,12 +1469,12 @@ static int __init dynamic_debug_init(void)
> >       char *cmdline;
> >
> >       struct _ddebug_info di =3D {
> > -             .descs =3D __start___dyndbg,
> > -             .classes =3D __start___dyndbg_classes,
> > -             .class_users =3D __start___dyndbg_class_users,
> > -             .num_descs =3D __stop___dyndbg - __start___dyndbg,
> > -             .num_classes =3D __stop___dyndbg_classes - __start___dynd=
bg_classes,
> > -             .num_class_users =3D __stop___dyndbg_class_users - __star=
t___dyndbg_class_users,
> > +             .descs.start =3D __start___dyndbg,
> > +             .maps.start =3D __start___dyndbg_classes,
> > +             .users.start =3D __start___dyndbg_class_users,
> > +             .descs.len =3D __stop___dyndbg - __start___dyndbg,
> > +             .maps.len =3D __stop___dyndbg_classes - __start___dyndbg_=
classes,
> > +             .users.len =3D __stop___dyndbg_class_users - __start___dy=
ndbg_class_users,
> >       };
> >
> >   #ifdef CONFIG_MODULES
> > @@ -1508,8 +1503,8 @@ static int __init dynamic_debug_init(void)
> >
> >               if (strcmp(modname, iter->modname)) {
> >                       mod_ct++;
> > -                     di.num_descs =3D mod_sites;
> > -                     di.descs =3D iter_mod_start;
> > +                     di.descs.len =3D mod_sites;
> > +                     di.descs.start =3D iter_mod_start;
> >                       ret =3D ddebug_add_module(&di, modname);
> >                       if (ret)
> >                               goto out_err;
> > @@ -1519,8 +1514,8 @@ static int __init dynamic_debug_init(void)
> >                       iter_mod_start =3D iter;
> >               }
> >       }
> > -     di.num_descs =3D mod_sites;
> > -     di.descs =3D iter_mod_start;
> > +     di.descs.len =3D mod_sites;
> > +     di.descs.start =3D iter_mod_start;
> >       ret =3D ddebug_add_module(&di, modname);
> >       if (ret)
> >               goto out_err;
> > @@ -1530,8 +1525,8 @@ static int __init dynamic_debug_init(void)
> >                i, mod_ct, (int)((mod_ct * sizeof(struct ddebug_table)) =
>> 10),
> >                (int)((i * sizeof(struct _ddebug)) >> 10));
> >
> > -     if (di.num_classes)
> > -             v2pr_info("  %d builtin ddebug class-maps\n", di.num_clas=
ses);
> > +     if (di.maps.len)
> > +             v2pr_info("  %d builtin ddebug class-maps\n", di.maps.len=
);
> >
> >       /* now that ddebug tables are loaded, process all boot args
> >        * again to find and activate queries given in dyndbg params.
>
> --
> Louis Chauvet, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
