Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FFCA6E69E
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 23:34:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3223789207;
	Mon, 24 Mar 2025 22:34:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="E1q9ISb9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3900F89207;
 Mon, 24 Mar 2025 22:34:14 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-6fedefb1c9cso34704337b3.0; 
 Mon, 24 Mar 2025 15:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742855653; x=1743460453; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JXW9Ba0yg/9do6JW2lVD4twSPOAKnKfAxL8vF9iY1Ls=;
 b=E1q9ISb9k7CL5dGgQTAba3Z4aM4PVihaCvGk9UG2JqJX9+s8wSg0+bxzu6J5rBjvCz
 G5LWio1Iz7YC1366SXd73ORc9cYFUwdxJT9/vfc164voVqZDfun3onSnfXnSRahQZZFJ
 b7surM4byy599P+bmrfJyC9rMTJcR91sPJrIvfFNhjGBgLwszPduhjF7XMuxFJvTejD3
 scVfk4ibkFArhTLm0StHBH1X4laCYKD9qjFm3HUHIrc4vHT1VmkFSA5vGLxjBXU6R3AN
 gQ9cnWXwPqXFcM0YkJGKsAK1OeipMtl0YA1+J/isdaBZcA3Njl7ta/79uWX0LEvHFWzE
 r+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742855653; x=1743460453;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JXW9Ba0yg/9do6JW2lVD4twSPOAKnKfAxL8vF9iY1Ls=;
 b=FKCH/UjoY1y2st2LLUVuCVLK3nN7CZU9IeQphKijsT/2Z2iI/DOUW5vKTW9FnpsGqi
 QuLgXKkbji7fwHAc3plHW4TbMqHAGK8ZewgMcmOEdOPG74b4PxiME7nG/G+MQmQhauXI
 jVR64ECtHPM0WC7MpPRCok+XILR2v5H/LCeIlsVqGt1dEN2Z10NInP1koB8qjgZh/vuk
 PfAA5618fj6R3QwyRd0ZDemFCxA4yXazDBgNWlOSL8MmZOVSqLQi5aUbroNsMjX63s32
 vdG61lARwShopj3IG3e1j/EBvQ5+PvOII7EfanZbYuAl8pvE37klKV3pYUWLG8INPcXI
 bUVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+zPrAjGyvOnG+tchqLfLvk0mLRC9lz0PkhqGUjmh3em7ouFzc1SuuT6QJHXnpRiYqE2gE8mBBc9sV@lists.freedesktop.org,
 AJvYcCUbtI957PenI1OOKWD5kx+ROovg99RvJkEHQRlaJ1svqSevR+sfSw20oPrvz1SV60GqnsCHgyUKfda3@lists.freedesktop.org,
 AJvYcCV57xYOPaIkE7zA4RMnLGqILl7vkT59NEY9thhNwkfih2+/0pG7rYC/LAX4dGgY90ouzxLyPje0@lists.freedesktop.org,
 AJvYcCVz1F+ncZnKudjsFY45W876CISD4jL85+KxMIkL/+d3qlJqA0L2LF1g2uRXzxiD3hsUw+VAy5edC7i33c3skg==@lists.freedesktop.org,
 AJvYcCXYOGqmwerVgGxitRa1ByQbgKOFfsiPejA5Y/TmOHv6JoOXNGzxnSppT6pF1xKFsGTRKOOqYlLViZUQjhxOAYrHQw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzT9f86YKZ2G5cxAM8mKyXWMJ8Ufx9VKIOVC9hUXO9MYCwviH/S
 bVyVCnNPIqtt813KWqb6fL573xLQ9BPNE8UacvC8SqL7vOgtz7O+aE3qa9mtTWvLl6k4m7o21pM
 bNU7mXc36AHWfnOqW4yKTU+RedCg=
X-Gm-Gg: ASbGncu5f9er4XkSMI78O90AMqifdcblCbcYwzjZoTQdy7bJD0yWlIeqJe+lp/M+ErL
 cZr+eCMh0mp9thMmz/yglUtBA1MZGPysw2zOLdVMlppyWq6G61X51chjP9X0XfgM6wi+aq75wPz
 Q0Na+kdAYQPNNDhXypNgDZCOCm
X-Google-Smtp-Source: AGHT+IEAuhP7vvdOzarCdW0VuBfIcbVdJSz9H/zF3pCHpb16IT3KDy1crvUqwy7lhsLsmzsfQLcR6jkkbkjhhuB8rXs=
X-Received: by 2002:a05:690c:6d0c:b0:700:a6a0:1e2e with SMTP id
 00721157ae682-700ba9ba6camr198985667b3.0.1742855652804; Mon, 24 Mar 2025
 15:34:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250320185238.447458-1-jim.cromie@gmail.com>
 <20250320185238.447458-11-jim.cromie@gmail.com>
 <b1615fb9-4689-4121-a7d1-7e9c5d10282b@bootlin.com>
In-Reply-To: <b1615fb9-4689-4121-a7d1-7e9c5d10282b@bootlin.com>
From: jim.cromie@gmail.com
Date: Mon, 24 Mar 2025 16:33:46 -0600
X-Gm-Features: AQ5f1JqVlYB97GtfUO_TrCYVCq0ZeJs8JZLkz_f5qfP4oh5XPxHDfUpsv0ShhA8
Message-ID: <CAJfuBxxRDpHSBY=AAbyT-gFSiaCkAbFtKap4NQ7MyQZ1CyR7EQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/59] dyndbg: replace classmap list with a vector
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org, 
 jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org, 
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

On Mon, Mar 24, 2025 at 9:08=E2=80=AFAM Louis Chauvet <louis.chauvet@bootli=
n.com> wrote:
>
>
>
> Le 20/03/2025 =C3=A0 19:51, Jim Cromie a =C3=A9crit :

> Thanks for your explanation of __outvar! It makes sense. I never seen
> this pattern anywhere in the kernel, maybe a simple doc comment is
> enough to carry the information:


Im gonna pull it - Ive decided its misleading,
since it looks like it does something that it cant do.

a plain old comment would be enough, if its needed at all.
__outvar was at least brief ;-)

In fact I did, but in a later patch. cleaning now.



>         /**
>          * ddebug_find_valid_class - Find a valid class for a
>          * given string
>          * @dt: debug table to inspect
>          * @class_string: string to match on
>          * @class_id: output pointer for the class_id value
>          *
>          * Returns: Pointer to the ddebug_class_map instance, if found.
>          * @class_id will be set to the id of this class. If no class
>          * matching @class_string is found, returns NULL and class_id is
>          * set to -ENOENT.
>          */
>
> Or at maybe change the documentation of __outvar to be a bit more
> explicit about how it works (I had difficulties to understand because a
> lot of "magic macro" exist in the kernel and sometimes carry information
> to the compiler, but this one is always empty):
>
>         /**
>          * __outvar - Denotes that an argument is used as an output
>          * value
>          * This macro does nothing apart clarify  for the reader that
>          * the parameter will be filled by the callee
>          */
>
> With any of the modifications (feel free to reword them as you want):
>
> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
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
> > @@ -1122,9 +1124,10 @@ static void *ddebug_proc_next(struct seq_file *m=
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
> > @@ -1208,30 +1211,31 @@ static const struct proc_ops proc_fops =3D {
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
> > @@ -1263,10 +1267,9 @@ static int ddebug_add_module(struct _ddebug_info=
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
> > @@ -1379,8 +1382,8 @@ static void ddebug_remove_all_tables(void)
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
>
