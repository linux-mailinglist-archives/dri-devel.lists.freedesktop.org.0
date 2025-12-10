Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E25DCCB2149
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 07:34:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B732410E66C;
	Wed, 10 Dec 2025 06:34:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dPXYz7XL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 671D310E66C
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 06:34:14 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-78c4d112cd8so30898037b3.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Dec 2025 22:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765348453; x=1765953253; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gPYSmj3nUU3qbQUbub7stHY6ioeYz9em6X0ByWKrVW4=;
 b=dPXYz7XLjWFfafGbeG5CzLd+tIzfGjkLJkXLTK8icoKPau53nr9ft/AYApoHH50Kzm
 Nr6Kos+EW04v88WNmq04M/ok91lUkNbrQbFduVXpD+rf4p7V+vtIzClmQtawQ2nRAxlF
 MiEWDmtOxc1ZxbwdVyaodZig5A/Ny0fiYoX/sr0nGDgciFNBXC1galD6otz62Bb0UR+d
 0aniLKqP1s6syTFx3lBf9SjV6I1wVtLmjGVX7yMJ8ThmqHIwz0BcGGj8t+GDAkb1YREi
 MolGGypf26wRB2bIc3S9v7AbuJwTDo9b5frhg8Uh66ac85TvlpKptNK741EnXh1xjhf4
 9lXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765348453; x=1765953253;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gPYSmj3nUU3qbQUbub7stHY6ioeYz9em6X0ByWKrVW4=;
 b=k6WO1I+AYdUjmGjH/pVm3mJbKsqBFqf7RXb50NIninqSRvVr6lfvJfagqPl7lA4Qtx
 g4PT07YVs6ALqN0rl7m0rQFmAblfjTLgiL/QxWDd5lLPsywwyIR2X/MZ6Epja6/6t516
 v4ZKSPiDt+qAWZI6v+zol36Jk4xVhEEBFFHDdZwVBAj99nYeUu20rdiEWaz+V/rnqsk+
 sytybN32BkQSwDdFFXK0orIcLLhjJWUPBhQAzC9CZzlc/mFckLXJSLzsvPLZLyUG7C0j
 QgMRHghSIZ666ADrXh5+pC8WwS/B0pKK3nFKo617qIJBawhUlnleMLylwwBwj7mp0Xsp
 P2BQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVitHbHcPB2nhgirXH751mNWJ/zbNy+vsUqa4Tibhe4fYaqG8OQ3WV77YrCyz0spSKKlfn0FpMUcoo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyoe+ZRevpgosEhXhUG/A+ThYnH1xiEKI2SMu3GFmXmhwqeaR2D
 y3k513dpBzwqP18YAawXU0iMBl7eqhtE8HGX/7cC60Q7H5ev4lPKxaBKBywkevYKuMtMcBNd5K2
 EuyzEV0c9QyhT/vvtomZLqX4IksmgdK0=
X-Gm-Gg: AY/fxX5MGI4iOKI2LnfMY81WNc4TpMS35zeUWP8afk0OHvajGHTIddy9P67icuHZH10
 9HDZbAYUhjT7WG2Pje+rLoloypVehJpHAJlEpgdIQJNKiaC4E0AmDPhxJkR0SVVCqXmpD2tceHN
 SB0TFM1zlD4WTtaC5bxa6v1C1U00kZxkzw5DEdDn4yxcNvHDmHTVgW478Ce2WP50A1UFH9b5zfx
 0WOWhvEXO5pV1pxRF9F6Ryz6jAdtUXaik8QsKRM9LmD31pT9msh/CjIo4rv2D+Xt2qi1cvd4Q==
X-Google-Smtp-Source: AGHT+IH+UEovCe7kN6Nf7ccKLbaPzdFcb7zZEUyyX7Q4BkWaTU9tPaQqrTGnj0KHYSpSzqO7sIeiTEGWH+V2sNjruGw=
X-Received: by 2002:a05:690c:7303:b0:78c:5803:f698 with SMTP id
 00721157ae682-78c9d7264d9mr24677747b3.33.1765348453124; Tue, 09 Dec 2025
 22:34:13 -0800 (PST)
MIME-Version: 1.0
References: <20251118201842.1447666-1-jim.cromie@gmail.com>
 <20251118201842.1447666-17-jim.cromie@gmail.com>
 <fcb2532d-5627-4bc3-a990-ed361b56ccd3@akamai.com>
In-Reply-To: <fcb2532d-5627-4bc3-a990-ed361b56ccd3@akamai.com>
From: jim.cromie@gmail.com
Date: Wed, 10 Dec 2025 19:33:46 +1300
X-Gm-Features: AQt7F2qmJxELXQnowdSUwtjD8vBYrs2EF4Sxvs2wr409OK17Nbb572VDcYC5uPg
Message-ID: <CAJfuBxxeaZDY+-f=7R0RSnE7FAyPtB_O+S3E4L_OckKNRK+7ag@mail.gmail.com>
Subject: Re: [PATCH v6 16/31] dyndbg: hoist classmap-filter-by-modname up to
 ddebug_add_module
To: Jason Baron <jbaron@akamai.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com, 
 Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux Documentation List <linux-doc@vger.kernel.org>
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

On Wed, Dec 10, 2025 at 11:43=E2=80=AFAM Jason Baron <jbaron@akamai.com> wr=
ote:
>
> Hi Jim,
>
> Very minor nit below about the kernel-doc ordering for args...
>

> > +/*
> > + * Walk the @_box->@_vec member, over @_vec.start[0..len], and find
> > + * the contiguous subrange of elements matching on ->mod_name.  Copy
> > + * the subrange into @_dst.  This depends on vars defd by caller.
> > + *
> > + * @_i:   caller provided counter var, init'd by macro
> > + * @_sp:  cursor into @_vec.
> > + * @_box: contains member named @_vec
> > + * @_vec: member-name of a type with: .start .len fields.
> > + * @_dst: an array-ref: to remember the module's subrange
> > + */
>
> Not sure if the odering matters for the docs, but it makes it a bit
> harder read when these don't go in order.
>
> Thanks,
>
> -Jason
>

I chose that doc ordering for clarity,  the easy ones 1st,
and @dst last since it gets the subrange info.
I think reordering might mean more words trying to connect
the pieces, and with less clarity.
It does work against the macro arg ordering,
which places @dst near the front,
I did that to follow  LHS =3D RHS(...)   convention.

Im happy to swap it around if anyone thinks that convention
should supercede these reasons,
but Im in NZ on vacation right now,
and I forgot to pull the latest rev off my desktop before I left.
so I dont want to fiddle with the slightly older copy I have locally,
and then have to isolate and fix whatever is different.

the same applies to the Documentation tweaks that Bagas noted.





> > +#define dd_mark_vector_subrange(_i, _dst, _sp, _box, _vec) ({         =
       \
> > +     typeof(_dst) __dst =3D (_dst);                                   =
 \
> > +     int __nc =3D 0;                                                  =
 \
> > +     for_subvec(_i, _sp, _box, _vec) {                               \
> > +             if (!strcmp((_sp)->mod_name, (_dst)->mod_name)) {       \
> > +                     if (!__nc++)                                    \
> > +                             (__dst)->info._vec.start =3D (_sp);      =
 \
> > +             } else {                                                \
> > +                     if (__nc)                                       \
> > +                             break; /* end of consecutive matches */ \
> > +             }                                                       \
> > +     }                                                               \
> > +     (__dst)->info._vec.len =3D __nc;                                 =
 \
> > +})
> > +
> >   /*
> >    * Allocate a new ddebug_table for the given module
> >    * and add it to the global list.
> > @@ -1278,6 +1283,8 @@ static void ddebug_attach_module_classes(struct d=
debug_table *dt, struct _ddebug
> >   static int ddebug_add_module(struct _ddebug_info *di, const char *mod=
name)
> >   {
> >       struct ddebug_table *dt;
> > +     struct _ddebug_class_map *cm;
> > +     int i;
> >
> >       if (!di->descs.len)
> >               return 0;
> > @@ -1300,6 +1307,8 @@ static int ddebug_add_module(struct _ddebug_info =
*di, const char *modname)
> >
> >       INIT_LIST_HEAD(&dt->link);
> >
> > +     dd_mark_vector_subrange(i, dt, cm, di, maps);
> > +
> >       if (di->maps.len)
> >               ddebug_attach_module_classes(dt, di);
> >
>
