Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B33CBA635FB
	for <lists+dri-devel@lfdr.de>; Sun, 16 Mar 2025 15:05:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 250F010E140;
	Sun, 16 Mar 2025 14:05:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Pjrx8OTE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E284C10E13B;
 Sun, 16 Mar 2025 14:05:05 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-6f47ed1f40dso27958047b3.1; 
 Sun, 16 Mar 2025 07:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742133905; x=1742738705; darn=lists.freedesktop.org;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PDeTtb50k9P9LzzadEe61v2QwU9luKmDuJ/im9ef0So=;
 b=Pjrx8OTERXvSyzhYYbGMPZ63heTvZrqJxVkXRjp/yLu1yPdbsGKxYjRuLtA0PxW3+u
 JZUiCZrzHwoUR1QkBmdVwSb0O/A1X03QXVHxl8EA8sBZIhVKg/1zFlkCCyc7vNeew+Zw
 5k3dVXAMnDSkgOF7NngFQfwPN1rXhjLQ7+dDDLnqgWyS+ap/5l9i2voXCdkSwglxDCN6
 190bQuh6HSLhGsvs3PcAVOmDSILiJrIXjPJNK00a3PQww18hgVrB2x5UihGgiJSVPHjy
 rU4pNoFXU/RbhUmXBqT+i7TVul96arjJHH4O7spAKK/q0kw2qmf/b4YzqtICpkKSJ9lh
 tPeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742133905; x=1742738705;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PDeTtb50k9P9LzzadEe61v2QwU9luKmDuJ/im9ef0So=;
 b=W/cPYdwo0MYyTnPTQ5dj1kl6XctvfOSH3PJ8svKE8D7EghMiPW8SnTrmpENKI9gphF
 rN8GEtWLKzmEXdI5Td5b+uRVOGmyrOZkXnYlumID7s9JSBs1QsLBAGuKp4FTy8CLgI2s
 f++QcUfKlW/fkJrU2pnJIS6Oghyp5jTdRSLI5jcKIRatNOINfailoUi8jqo6WI1x4g4o
 El2EIw12NpS7BUAIja38z++4T1HP8wry304qatFNzWRnSSdEjpxkKKdYzmGXd0gmBqds
 6EX3QVz/rRZ6veiS82GrWMa1u/M3DR0ccVCKOsR3+AiEbN7dFGjioMHdiDC3ZK501P4P
 4Dcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTm0JukF1tKOVh3HrzbfLSrmOkYLrsCeFMBlvMjgt0sNnw+sefMoqbq+kYyGvrKLpDEKeitfsU@lists.freedesktop.org,
 AJvYcCVzBVFOuiZhsYTRRv6cfg5sdd07zO73kMbMm2Zz7IcjVFnXo7Onb5iIFKhdp7KucECveunXTLYr/UOm@lists.freedesktop.org,
 AJvYcCW3RQo0ltISwCzboUfG9qI9xU+16EqQ2qWCkfSXdyBsi0RAD/y9K6upuK4iMzdoXtjn9SLkq8KVtaWP@lists.freedesktop.org,
 AJvYcCWSU2bOgQ40lFglb76RdYxfaxtmZjX71JlNgV4Dw+hYoLXsW7yJg22fJkXAZJUTsXxVG1OXs9va3o+Egc9H81XedA==@lists.freedesktop.org,
 AJvYcCWSwIFuQoqdeKUAafTBwXrV5Iaxp8G6xRHDQkXa61/9vTftX4s+NUQXye65ieukDqodQ7oRNslpXTZKazJw3w==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw5Py692QW2kON4ORPWXE9VLlAPB+r3fPCuGdoQFqI28Iril1Vj
 XU+dekfyPZhtzXRjh5j8Td0F8AhT+mT9euhu+Jrfc034aHEADYlRZ1TI00WqQMOWuHof+i+QKoD
 v26muAUf1lCppyFBGuDpq57RULrg=
X-Gm-Gg: ASbGncvPww3t9jo1BodwM45LwjzbsQAmwmAuEHp9RprElt6wYc+YeSCymDISxMi5I30
 vIx+musBk039lcu1ViKH3rzBfRhtWTL3ftnBSOYYRsysQ3BcjEA0sXJaqXpObDeN2daXKm2XmhU
 4JBBkf4762RvQKsnpNH8UwgLF5
X-Google-Smtp-Source: AGHT+IEkq0dikkwQqGeY8g4W1TxCVsud54HevqibVi+N74RIzgXFQiUIQt5fFhsqwqaLI+C0E5rHPBZDIZmWrCBrDAM=
X-Received: by 2002:a05:690c:700d:b0:6fe:bff2:3a6d with SMTP id
 00721157ae682-6ff45f1564dmr119778087b3.1.1742133904715; Sun, 16 Mar 2025
 07:05:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250125064619.8305-1-jim.cromie@gmail.com>
 <20250125064619.8305-6-jim.cromie@gmail.com>
 <22989ed1-90a4-4acd-9ca0-00f65677ad4f@bootlin.com>
In-Reply-To: <22989ed1-90a4-4acd-9ca0-00f65677ad4f@bootlin.com>
From: jim.cromie@gmail.com
Date: Sun, 16 Mar 2025 08:04:38 -0600
X-Gm-Features: AQ5f1JrrEoFY2QvB7Q2c4QZCzcvKITkF-RuKV8wOT8kqpn_6ZcJ2YIMcZ80jx6o
Message-ID: <CAJfuBxyYGUpF+n1nHNUS-GtTU9ROi9vx_RQj6kOP1zSMHgM45Q@mail.gmail.com>
Subject: Re: [PATCH 05/63] dyndbg: replace classmap list with a vector
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

On Tue, Feb 25, 2025 at 7:08=E2=80=AFAM Louis Chauvet <louis.chauvet@bootli=
n.com> wrote:
>
>
>
> Le 25/01/2025 =C4=85 07:45, Jim Cromie a =C3=A9crit :
> > Classmaps are stored in an elf section/array, but are individually
> > list-linked onto dyndbg's per-module ddebug_table for operation.
> >
> > This is unnecessary; even when ddebug_attach_classmap() is handling
> > the builtin section (with classmaps for multiple builtin modules), its
> > contents are ordered, so a module's possibly multiple classmaps will
> > be consecutive in the section, and could be treated as a vector/block,
> > since both start-address and subrange length are in the ddebug_info arg=
.
> >
> > IOW, this treats classmaps similarly to _ddebugs, which are already
> > kept as vector-refs (address+len).
> >
> > So this changes:
> >
> > struct ddebug_class_map drops list-head link.
> >
> > struct ddebug_table drops the list-head maps, and gets: classes &
> > num_classes for the start-address and num_classes, placed to improve
> > struct packing.
> >
> > The loading: in ddebug_attach_module_classes(), replace the
> > for-the-modname list-add loop, with a forloop that finds the module's
> > subrange (start,length) of matching classmaps within the possibly
> > builtin classmaps vector, and saves those to the ddebug_table.
> >
> > The reading/using: change list-foreach loops in ddebug_class_name() &
> > ddebug_find_valid_class() to walk the array from start to length.
> >
> > Also:
> > Move #define __outvar up, above an added use in a fn-prototype.
> > Simplify ddebug_attach_module_classes args, ref has both address & len.
> >
> > no functional changes
> >
> > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> > ---
> >   include/linux/dynamic_debug.h |  1 -
> >   lib/dynamic_debug.c           | 61 ++++++++++++++++++----------------=
-
> >   2 files changed, 32 insertions(+), 30 deletions(-)
> >
> > diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debu=
g.h
> > index b9afc7731b7c..2b0057058ecf 100644
> > --- a/include/linux/dynamic_debug.h
> > +++ b/include/linux/dynamic_debug.h
> > @@ -83,7 +83,6 @@ enum class_map_type {
> >   };
> >
> >   struct ddebug_class_map {
> > -     struct list_head link;
> >       struct module *mod;
> >       const char *mod_name;   /* needed for builtins */
> >       const char **class_names;
> > diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
> > index 55df35df093b..41cbaa96f83d 100644
> > --- a/lib/dynamic_debug.c
> > +++ b/lib/dynamic_debug.c
> > @@ -45,10 +45,11 @@ extern struct ddebug_class_map __start___dyndbg_cla=
sses[];
> >   extern struct ddebug_class_map __stop___dyndbg_classes[];
> >
> >   struct ddebug_table {
> > -     struct list_head link, maps;
> > +     struct list_head link;
> >       const char *mod_name;
> > -     unsigned int num_ddebugs;
> >       struct _ddebug *ddebugs;
> > +     struct ddebug_class_map *classes;
> > +     unsigned int num_ddebugs, num_classes;
> >   };
> >
> >   struct ddebug_query {
> > @@ -147,13 +148,15 @@ static void vpr_info_dq(const struct ddebug_query=
 *query, const char *msg)
> >                 query->first_lineno, query->last_lineno, query->class_s=
tring);
> >   }
> >
> > +#define __outvar /* filled by callee */
>
> Hi Jim,
>
> What is the goal of this __outvar define? I can't find any other #define
> of it in the kernel.

its basically a comment, trying to be more important.

if its misleading or overwrought, I can yank it :-)

>
> >   static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug=
_table const *dt,
> > -                                                       const char *cla=
ss_string, int *class_id)
> > +                                                     const char *class=
_string,
> > +                                                     __outvar int *cla=
ss_id)
>
> The order between __outvar and int is not important? Here you have
> __outvar before int, but later [1] the __outvar is after int.
>


I intended no difference, I used it where I thought it communicated best
in each case, and since the macro is empty, it makes none.



> [1]:https://elixir.bootlin.com/linux/v6.14-rc3/source/lib/dynamic_debug.c=
#L183
>
> Thanks,
> Louis Chauvet
>
> >   {
> >       struct ddebug_class_map *map;
> > -     int idx;
> > +     int i, idx;
> >
> > -     list_for_each_entry(map, &dt->maps, link) {
> > +     for (map =3D dt->classes, i =3D 0; i < dt->num_classes; i++, map+=
+) {
> >               idx =3D match_string(map->class_names, map->length, class=
_string);
> >               if (idx >=3D 0) {
> >                       *class_id =3D idx + map->base;
> > @@ -164,7 +167,6 @@ static struct ddebug_class_map *ddebug_find_valid_c=
lass(struct ddebug_table cons
> >       return NULL;
> >   }
> >
> > -#define __outvar /* filled by callee */
> >   /*
> >    * Search the tables for _ddebug's which match the given `query' and
> >    * apply the `flags' and `mask' to them.  Returns number of matching
> > @@ -1114,9 +1116,10 @@ static void *ddebug_proc_next(struct seq_file *m=
, void *p, loff_t *pos)
> >
> >   static const char *ddebug_class_name(struct ddebug_iter *iter, struct=
 _ddebug *dp)
> >   {
> > -     struct ddebug_class_map *map;
> > +     struct ddebug_class_map *map =3D iter->table->classes;
> > +     int i, nc =3D iter->table->num_classes;
> >
> > -     list_for_each_entry(map, &iter->table->maps, link)
> > +     for (i =3D 0; i < nc; i++, map++)
> >               if (class_in_range(dp->class_id, map))
> >                       return map->class_names[dp->class_id - map->base]=
;
> >
> > @@ -1200,30 +1203,31 @@ static const struct proc_ops proc_fops =3D {
> >       .proc_write =3D ddebug_proc_write
> >   };
> >
> > -static void ddebug_attach_module_classes(struct ddebug_table *dt,
> > -                                      struct ddebug_class_map *classes=
,
> > -                                      int num_classes)
> > +static void ddebug_attach_module_classes(struct ddebug_table *dt, stru=
ct _ddebug_info *di)
> >   {
> >       struct ddebug_class_map *cm;
> > -     int i, j, ct =3D 0;
> > +     int i, nc =3D 0;
> >
> > -     for (cm =3D classes, i =3D 0; i < num_classes; i++, cm++) {
> > +     /*
> > +      * Find this module's classmaps in a subrange/wholerange of
> > +      * the builtin/modular classmap vector/section.  Save the start
> > +      * and length of the subrange at its edges.
> > +      */
> > +     for (cm =3D di->classes, i =3D 0; i < di->num_classes; i++, cm++)=
 {
> >
> >               if (!strcmp(cm->mod_name, dt->mod_name)) {
> > -
> > -                     v2pr_info("class[%d]: module:%s base:%d len:%d ty=
:%d\n", i,
> > -                               cm->mod_name, cm->base, cm->length, cm-=
>map_type);
> > -
> > -                     for (j =3D 0; j < cm->length; j++)
> > -                             v3pr_info(" %d: %d %s\n", j + cm->base, j=
,
> > -                                       cm->class_names[j]);
> > -
> > -                     list_add(&cm->link, &dt->maps);
> > -                     ct++;
> > +                     if (!nc) {
> > +                             v2pr_info("start subrange, class[%d]: mod=
ule:%s base:%d len:%d ty:%d\n",
> > +                                       i, cm->mod_name, cm->base, cm->=
length, cm->map_type);
> > +                             dt->classes =3D cm;
> > +                     }
> > +                     nc++;
> >               }
> >       }
> > -     if (ct)
> > -             vpr_info("module:%s attached %d classes\n", dt->mod_name,=
 ct);
> > +     if (nc) {
> > +             dt->num_classes =3D nc;
> > +             vpr_info("module:%s attached %d classes\n", dt->mod_name,=
 nc);
> > +     }
> >   }
> >
> >   /*
> > @@ -1256,10 +1260,9 @@ static int ddebug_add_module(struct _ddebug_info=
 *di, const char *modname)
> >       dt->num_ddebugs =3D di->num_descs;
> >
> >       INIT_LIST_HEAD(&dt->link);
> > -     INIT_LIST_HEAD(&dt->maps);
> >
> >       if (di->classes && di->num_classes)
> > -             ddebug_attach_module_classes(dt, di->classes, di->num_cla=
sses);
> > +             ddebug_attach_module_classes(dt, di);
> >
> >       mutex_lock(&ddebug_lock);
> >       list_add_tail(&dt->link, &ddebug_tables);
> > @@ -1372,8 +1375,8 @@ static void ddebug_remove_all_tables(void)
> >       mutex_lock(&ddebug_lock);
> >       while (!list_empty(&ddebug_tables)) {
> >               struct ddebug_table *dt =3D list_entry(ddebug_tables.next=
,
> > -                                                   struct ddebug_table=
,
> > -                                                   link);
> > +                                                  struct ddebug_table,
> > +                                                  link);
> >               ddebug_table_free(dt);
> >       }
> >       mutex_unlock(&ddebug_lock);
>
> --
> Louis Chauvet, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
