Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BDAA63769
	for <lists+dri-devel@lfdr.de>; Sun, 16 Mar 2025 21:51:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1CAC10E09C;
	Sun, 16 Mar 2025 20:51:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KlY1H8jz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5436B10E09C;
 Sun, 16 Mar 2025 20:51:20 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-e3c8ae3a3b2so3013586276.0; 
 Sun, 16 Mar 2025 13:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742158279; x=1742763079; darn=lists.freedesktop.org;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=11D4pPzLAX9lQnZzbCliu3sFwyUhHgj3Q88AGfEQt30=;
 b=KlY1H8jzr5Z3Q2vdWT/8hUZbnZ/ZUlHIr53jZyN3k4sSlYOVuCvjiHe4x1VHrTSVNu
 B+olEv3MqFAnGpJrfd6Koy0U1GoIC/DZ/3vEU3pUF/Al5KUAb9dr/0pYAGTGDMESPTPu
 EZH0yxfP1TO9rktzKSrddLPLVYab3qOwN+ymZpUzTLl4gRt86vPYL5zvjfgJzbWAS4Ty
 bOG6D9jJ9RAgdswS5455Wc6UHWyEik5tsunj4HYSZZjpianbLAvjX8cyKCpnFqDEStHQ
 48mPVG/gABkwdNXZvflIb8TffZoarAzLzsaxCtSL/ksBwnhFKkx21Ej3j9JKoiY9PDJx
 mOwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742158279; x=1742763079;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=11D4pPzLAX9lQnZzbCliu3sFwyUhHgj3Q88AGfEQt30=;
 b=DI3BJGeQXDbYdRey7meRATkPay4xIzNk/c/riODpQUm9MGGU9l+kedUbwd8Y6ttCrS
 zCDXiXBmBPfsoMQ7+mkYCPfoUURVPgftl3KtmtjoMKmY6X3UcKseR9GQnCz83PvOzU/D
 uPK/8azYdEVsnBhKzraAECUUdIuTtb7CAVIyOiyxPSfcXyc5ZVYwMZzberrSc3ZilGz4
 MVHoHAzn35X6F3e/axXfDjn1cTX48UZZlDzIfMe8R8Il9efwuexFteQ2j57h3y6owl/Q
 WSDe9YInf2vpPDsiMsoIU+R5f0AN5qdpq2kHkY72xzjfLq48ARaSZ7KluA69nwdZ3EZq
 QVnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVB59U/SpvgLSd7Ds2lSjxqfFJyA53AeubvrutHweMHTV+h72jNQ1DfTPezDlx1V0GXVQClULRLgcNM@lists.freedesktop.org,
 AJvYcCW7oL/WMhjPlnBNzu/W985eDD0dl9wAnCpZGEa2OaL9dPmVTVUjT7DmsSlqVlC3eE+VniomDw0H@lists.freedesktop.org,
 AJvYcCXHhq3s/QL/cs4vFCp350TZRLCcfmA/Jv/yzzrnvof72XEIE26P8m7zu79dB4GAqjOXPKb+KXBltEAUKXeX2g==@lists.freedesktop.org,
 AJvYcCXNNgdFYuy6XIxKLydTYz9IS9xwBbUZtHNcIgdYbS9PrgCei4PqAAdiANd/VzkXstf/Crl9Oamd34ie0lnW7Ej2Cg==@lists.freedesktop.org,
 AJvYcCXyEbY4+JyHxd8wQMCStnghdnsGhZ7gx+SKxmACt+hEk8E/QBoth4oOfi1sm/4xzj1kH3OJwIeY/NXw@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPLKJvNxBffAukA425QCPg4xwcs6mLN+x6Symg2MAs3XaNVISa
 Tmk6p49vjQH3rGr13C7If4VCR0XnLTHcJncWGnq+UTiOT7PS1t+W41BsJH99uOYhzh2ZmwGQtRO
 PpFNt/5RXeS9UbIcEromLc0Q6gy8=
X-Gm-Gg: ASbGncuJR2X8Q+u5R2Zwhj/PJxv2909IjQI46eQQKlq1ketOYVuYMJFX0himd7vyAaK
 fnBzfi7fFWJaoxX0/EpVx3fm15pd961gicPBT0pC2zqmI/+wCOM4GkefzrHca07zRd6XnaV3h/n
 D3JlVb1fHnF2dRHh7ZvlqxYjb7
X-Google-Smtp-Source: AGHT+IG09/hi3MWmZ5hXI5cFNStCtCXVSwoKZTPmX0FpXqU/1r4YevvC42k15kjCrt+L/Qd4ciu27ip6+SLn6v+K42s=
X-Received: by 2002:a05:690c:3589:b0:6ef:6536:bb6f with SMTP id
 00721157ae682-6ff45ef8e68mr133675927b3.22.1742158279351; Sun, 16 Mar 2025
 13:51:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250125064619.8305-1-jim.cromie@gmail.com>
 <20250125064619.8305-19-jim.cromie@gmail.com>
 <1a0034df-292b-49f5-bc90-709bcd5af9a9@bootlin.com>
In-Reply-To: <1a0034df-292b-49f5-bc90-709bcd5af9a9@bootlin.com>
From: jim.cromie@gmail.com
Date: Sun, 16 Mar 2025 14:50:53 -0600
X-Gm-Features: AQ5f1JpRQbL7Kh3EhTVw1my5Ym8uTbp3MrpYCs-8HOghT6Dic3lqwx4ocejIakU
Message-ID: <CAJfuBxwwcXPuaievcJ6Hg0JhS2vraoTV8=r=rrh9X7XiM9tcNw@mail.gmail.com>
Subject: Re: [PATCH 18/63] dyndbg: add/use for_subvec() to reduce boilerplate
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

On Tue, Feb 25, 2025 at 7:18=E2=80=AFAM Louis Chauvet <louis.chauvet@bootli=
n.com> wrote:
>
>
>
> Le 25/01/2025 =C3=A0 07:45, Jim Cromie a =C3=A9crit :
> > add for_subvec() macro to encapsulate a for-loop pattern thats used
> > repeatedly to iterate over a boxed.vector of N elements.
> >
> > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
>
> Hi Jim,
>
> Do you think it is possible to move this patch earlier in the series, so
> you can use it when introducing class_users.
>

Yup. :-)

> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
>
> Thanks,
> Louis Chauvet
>
> > ---
> >   lib/dynamic_debug.c | 30 ++++++++++++++++++++++--------
> >   1 file changed, 22 insertions(+), 8 deletions(-)
> >
> > diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
> > index 6bca0c6727d4..08b6e4e7489f 100644
> > --- a/lib/dynamic_debug.c
> > +++ b/lib/dynamic_debug.c
> > @@ -158,20 +158,34 @@ static void vpr_info_dq(const struct ddebug_query=
 *query, const char *msg)
> >                 _dt->num_class_users);                                \
> >       })
> >
> > +/*
> > + * simplify a repeated for-loop pattern walking N steps in a T _vec
> > + * member inside a struct _box.  It expects int i and T *_sp to be
> > + * declared in the caller.
> > + * @_i:  caller provided counter.
> > + * @_sp: cursor into _vec, to examine each item.
> > + * @_box: ptr to a struct containing @_vec member
> > + * @_vec: name of a sub-struct member in _box, with array-ref and leng=
th
> > + */
> > +#define for_subvec(_i, _sp, _box, _vec)                               =
      \
> > +     for ((_i) =3D 0, (_sp) =3D (_box)->_vec;                         =
  \
> > +          (_i) < (_box)->num_##_vec;                                \
> > +          (_i)++, (_sp)++)
> > +
> >   static int ddebug_find_valid_class(struct ddebug_table const *dt, con=
st char *class_string)
> >   {
> >       struct ddebug_class_map *map;
> >       struct ddebug_class_user *cli;
> >       int i, idx;
> >
> > -     for (i =3D 0, map =3D dt->classes; i < dt->num_classes; i++, map+=
+) {
> > +     for_subvec(i, map, dt, classes) {
> >               idx =3D match_string(map->class_names, map->length, class=
_string);
> >               if (idx >=3D 0) {
> >                       vpr_dt_info(dt, "good-class: %s.%s ", map->mod_na=
me, class_string);
> >                       return idx + map->base;
> >               }
> >       }
> > -     for (i =3D 0, cli =3D dt->class_users; i < dt->num_class_users; i=
++, cli++) {
> > +     for_subvec(i, cli, dt, class_users) {
> >               idx =3D match_string(cli->map->class_names, cli->map->len=
gth, class_string);
> >               if (idx >=3D 0) {
> >                       vpr_dt_info(dt, "class-ref: %s -> %s.%s ",
> > @@ -1190,7 +1204,7 @@ static void ddebug_apply_params(const struct ddeb=
ug_class_map *cm, const char *m
> >       if (cm->mod) {
> >               vpr_cm_info(cm, "loaded classmap: %s", modnm);
> >               /* ifdef protects the cm->mod->kp deref */
> > -             for (i =3D 0, kp =3D cm->mod->kp; i < cm->mod->num_kp; i+=
+, kp++)
> > +             for_subvec(i, kp, cm->mod, kp)
> >                       ddebug_match_apply_kparam(kp, cm, modnm);
> >       }
> >   #endif
> > @@ -1212,7 +1226,7 @@ static void ddebug_attach_module_classes(struct d=
debug_table *dt,
> >       struct ddebug_class_map *cm;
> >       int i, nc =3D 0;
> >
> > -     for (i =3D 0, cm =3D di->classes; i < di->num_classes; i++, cm++)=
 {
> > +     for_subvec(i, cm, di, classes) {
> >               if (!strcmp(cm->mod_name, dt->mod_name)) {
> >                       vpr_cm_info(cm, "classes[%d]:", i);
> >                       if (!nc++)
> > @@ -1225,7 +1239,7 @@ static void ddebug_attach_module_classes(struct d=
debug_table *dt,
> >       vpr_info("module:%s attached %d classes\n", dt->mod_name, nc);
> >       dt->num_classes =3D nc;
> >
> > -     for (i =3D 0, cm =3D dt->classes; i < dt->num_classes; i++, cm++)
> > +     for_subvec(i, cm, dt, classes)
> >               ddebug_apply_params(cm, cm->mod_name);
> >   }
> >
> > @@ -1245,7 +1259,7 @@ static void ddebug_attach_user_module_classes(str=
uct ddebug_table *dt,
> >        * module's refs, save to dt.  For loadables, this is the
> >        * whole array.
> >        */
> > -     for (i =3D 0, cli =3D di->class_users; i < di->num_class_users; i=
++, cli++) {
> > +     for_subvec(i, cli, di, class_users) {
> >               if (WARN_ON_ONCE(!cli || !cli->map || !cli->mod_name))
> >                       continue;
> >               if (!strcmp(cli->mod_name, dt->mod_name)) {
> > @@ -1261,7 +1275,7 @@ static void ddebug_attach_user_module_classes(str=
uct ddebug_table *dt,
> >       dt->num_class_users =3D nc;
> >
> >       /* now iterate dt */
> > -     for (i =3D 0, cli =3D dt->class_users; i < dt->num_class_users; i=
++, cli++)
> > +     for_subvec(i, cli, di, class_users)
> >               ddebug_apply_params(cli->map, cli->mod_name);
> >
> >       vpr_dt_info(dt, "attach-client-module: ");
> > @@ -1299,7 +1313,7 @@ static int ddebug_add_module(struct _ddebug_info =
*di, const char *modname)
> >
> >       INIT_LIST_HEAD(&dt->link);
> >
> > -     for (i =3D 0, iter =3D di->descs; i < di->num_descs; i++, iter++)
> > +     for_subvec(i, iter, di, descs)
> >               if (iter->class_id !=3D _DPRINTK_CLASS_DFLT)
> >                       class_ct++;
> >
>
> --
> Louis Chauvet, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
