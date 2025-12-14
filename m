Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E94CBBE83
	for <lists+dri-devel@lfdr.de>; Sun, 14 Dec 2025 19:10:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AB6510E096;
	Sun, 14 Dec 2025 18:10:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="S7XwZVfn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A067110E096
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Dec 2025 18:10:10 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-78c4aa7af99so29928557b3.0
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Dec 2025 10:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765735809; x=1766340609; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zZqYkbEe/Xq+3mf6Qd1chR8xrEn1+HhKwYrS5bPNLz0=;
 b=S7XwZVfnnqYKHCE6yPadddUxInVpHztoUeiH5pbR5tsYk8w7wHr/UaP8/9tVXQHDha
 Fhg8mBYXqWiMc/NPbM6MMXOOHhSJiwMK+lTPhsmWwuErP7JCyBqgU9Y9djdytX8Dkt1C
 AMb132chGS0MbSvsnHDjSbOf0n7JgCx0Ze6clGsNJg5/AVLEQ1eGUq1PyRRvFSvDUd2W
 qaYefbxiqIFJcQz2PNCKZ9TNAkRr8Ukcg+ZvitwBzKoVmtMhQPbyv4nNRzVoMkrRmZ+m
 guQW8dWRinLftYMZcfJm84bLWHzllv5YSZAWjYyfuCT5ym17sF9nyoU980/5ut11Uxdl
 NXqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765735809; x=1766340609;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zZqYkbEe/Xq+3mf6Qd1chR8xrEn1+HhKwYrS5bPNLz0=;
 b=My9HOLn9pJLehGAcKQsiTpKOhv1tkHlOq+ftREaIzwfk7n4s6TPCLLEI2c3y0mFN15
 kdRHfzkm3cEh2MCUPDWkn5argQQ0jlYpwr34zETjBdnpBzrBxsdC3Nh+rknsrvH0lOXF
 a8nHr0xlBdf4TB8bVminsGkDl7Th1SC7Kmt8ZJx+sXgPG+JLQZGw8bTt94fodwQb/boT
 ZXsdKVhw9fstV06jAbwo3iR5ZNt/tKOXI8P9F+ElIbuo+B860I76gZQQ8T5L2N2cy7/Y
 da8Rrv1ne5jtFRFX/lLwevq3/abGMAtt/8vEeaMNdB/z2icxcNpliVCbDUN2Q4dxzJgA
 CJPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJlI253GulOIY+yqGDlgDuT9UX3o0OIyvwY+h8QFUeb6TMCozTadInedbkcdAedPhGo/sitY1FJY0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+aI4D3bWB7JijYhN2HVI+r3I113YoBZjxd8bOuSEegl3/U/HO
 a0/D4sAAxDlaACL2rp7wNgyupcO1o/Hrvb/yxWQrWlLpk8GOv8uRw6fa6X4KNlEaXffn+sbcrro
 5quDDllv9ZTS0nheK12muJuMHHJNWH4I=
X-Gm-Gg: AY/fxX7p/epmRuitUNoz4c+wCi8nbwPMFTpRpWuE7Uo9gN9gRtbLmcgz8il3j77Pf35
 L5ByVOEfWDdAA2E3YVCVe6bNoKuQwLy1/k7sOWlEEZMC+mPJyNCjpnMJta96nXm003swpPcP/ba
 uN+/cyU5hThwoTfZOTaA/XaUhqlPnfbNxR+3wLINCtoJ+aqvTicIjCOfKN2zj4TKhaB1f5WfwP2
 TZAq+B5MtohszW8ifbPgusAR5+tY6tclUrY2sSXHEFxBkuxAWJnrxHJAaVjAPO46vYejRU=
X-Google-Smtp-Source: AGHT+IGino1qHIDwJ6cEfIUzo6jCRJVXk0LuBRnXNQO/QH8pcfmRfAf3d3wzGz/SMhaMEyHjIdABfSVnP3NytN8IepA=
X-Received: by 2002:a05:690e:d05:b0:641:f5bc:68cb with SMTP id
 956f58d0204a3-64555667fb3mr6516934d50.72.1765735809547; Sun, 14 Dec 2025
 10:10:09 -0800 (PST)
MIME-Version: 1.0
References: <20251118201842.1447666-1-jim.cromie@gmail.com>
 <20251118201842.1447666-17-jim.cromie@gmail.com>
 <fcb2532d-5627-4bc3-a990-ed361b56ccd3@akamai.com>
 <CAJfuBxxeaZDY+-f=7R0RSnE7FAyPtB_O+S3E4L_OckKNRK+7ag@mail.gmail.com>
 <9f36429d-1d6e-4501-a092-fbf45254d116@akamai.com>
 <CAJfuBxw8xV2RrbTWpmQFpCpiSp9A7KCLP74T_bu+4mxBROf1sg@mail.gmail.com>
 <81ba7b82-facc-4254-b0d6-439146a42a4c@akamai.com>
In-Reply-To: <81ba7b82-facc-4254-b0d6-439146a42a4c@akamai.com>
From: jim.cromie@gmail.com
Date: Mon, 15 Dec 2025 07:09:43 +1300
X-Gm-Features: AQt7F2qgCbTMdEj1C-C9SWcxTgRqSBurkZmHZRWmEznBwW5oly5EANWs7QkGuCE
Message-ID: <CAJfuBxwC0iTi34jD0TMxLPQTN0vSv+-_Y67hzQfzQX3ie3z9Fg@mail.gmail.com>
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

On Sat, Dec 13, 2025 at 5:06=E2=80=AFAM Jason Baron <jbaron@akamai.com> wro=
te:
>
>
>
> On 12/10/25 3:21 PM, jim.cromie@gmail.com wrote:
> > !-------------------------------------------------------------------|
> >    This Message Is From an External Sender
> >    This message came from outside your organization.
> > |-------------------------------------------------------------------!
> >
> > On Thu, Dec 11, 2025 at 8:14=E2=80=AFAM Jason Baron <jbaron@akamai.com>=
 wrote:
> >>
> >>
> >>
> >> On 12/10/25 1:33 AM, jim.cromie@gmail.com wrote:
> >>> !-------------------------------------------------------------------|
> >>>     This Message Is From an External Sender
> >>>     This message came from outside your organization.
> >>> |-------------------------------------------------------------------!
> >>>
> >>> On Wed, Dec 10, 2025 at 11:43=E2=80=AFAM Jason Baron <jbaron@akamai.c=
om> wrote:
> >>>>
> >>>> Hi Jim,
> >>>>
> >>>> Very minor nit below about the kernel-doc ordering for args...
> >>>>
> >>>
> >>>>> +/*
> >>>>> + * Walk the @_box->@_vec member, over @_vec.start[0..len], and fin=
d
> >>>>> + * the contiguous subrange of elements matching on ->mod_name.  Co=
py
> >>>>> + * the subrange into @_dst.  This depends on vars defd by caller.
> >>>>> + *
> >>>>> + * @_i:   caller provided counter var, init'd by macro
> >>>>> + * @_sp:  cursor into @_vec.
> >>>>> + * @_box: contains member named @_vec
> >>>>> + * @_vec: member-name of a type with: .start .len fields.
> >>>>> + * @_dst: an array-ref: to remember the module's subrange
> >>>>> + */
> >>>>
> >>>> Not sure if the odering matters for the docs, but it makes it a bit
> >>>> harder read when these don't go in order.
> >>>>
> >>>> Thanks,
> >>>>
> >>>> -Jason
> >>>>
> >>>
> >>> I chose that doc ordering for clarity,  the easy ones 1st,
> >>> and @dst last since it gets the subrange info.
> >>> I think reordering might mean more words trying to connect
> >>> the pieces, and with less clarity.
> >>> It does work against the macro arg ordering,
> >>> which places @dst near the front,
> >>> I did that to follow  LHS =3D RHS(...)   convention.
> >>>
> >>> Im happy to swap it around if anyone thinks that convention
> >>> should supercede these reasons,
> >>> but Im in NZ on vacation right now,
> >>> and I forgot to pull the latest rev off my desktop before I left.
> >>> so I dont want to fiddle with the slightly older copy I have locally,
> >>> and then have to isolate and fix whatever is different.
> >>>
> >>> the same applies to the Documentation tweaks that Bagas noted.
> >>
> >> Couldn't you then re-order the function args to match the doc order in=
stead?
> >>
> >
> > As you might surmise, the code was written before the kdoc.
> > Since it is setting the @_dst, it feels like an assignment.
> > Therefore the LHS =3D RHS convention seemed pertinent,
> > and the macro args are ordered to conform to this.
> > For the (pseudo- since its not /** ) kdoc,
> > the linear explanation was simplest and clearest, ending with @_dst.
> >
> > So I see these options (in my preferred order), please pick one.
> > 1. leave as is
> > 2. add an NB: that arg order differs from doc-order
> > 3. change macro arg order
> > 4. change kdoc arg order
> >
> > If 2-4 can wait, I can do that trivially once Im home (in Jan)
> > Doing it now, from here, will require fiddling with git am on the mbox.=
gz
> > with which Ive had mixed results/troubles in the past.
> >
>
> Hi Jim,
>
> I am fine leaving this as is, but I do feel like we should perhaps do at
> least #2 at some point, to clarify things.
>
>

Im redoing the set anyway, so I'll do either 2 or 3.

thx


> Thanks,
>
> -Jason
>
>
>
>
>
>
>
>
> > thanks,
> > Jim
> >
> >> Thanks,
> >>
> >> -Jason
> >>
> >>
> >>>
> >>>
> >>>
> >>>
> >>>
> >>>>> +#define dd_mark_vector_subrange(_i, _dst, _sp, _box, _vec) ({     =
           \
> >>>>> +     typeof(_dst) __dst =3D (_dst);                               =
     \
> >>>>> +     int __nc =3D 0;                                              =
     \
> >>>>> +     for_subvec(_i, _sp, _box, _vec) {                            =
   \
> >>>>> +             if (!strcmp((_sp)->mod_name, (_dst)->mod_name)) {    =
   \
> >>>>> +                     if (!__nc++)                                 =
   \
> >>>>> +                             (__dst)->info._vec.start =3D (_sp);  =
     \
> >>>>> +             } else {                                             =
   \
> >>>>> +                     if (__nc)                                    =
   \
> >>>>> +                             break; /* end of consecutive matches =
*/ \
> >>>>> +             }                                                    =
   \
> >>>>> +     }                                                            =
   \
> >>>>> +     (__dst)->info._vec.len =3D __nc;                             =
     \
> >>>>> +})
> >>>>> +
> >>>>>     /*
> >>>>>      * Allocate a new ddebug_table for the given module
> >>>>>      * and add it to the global list.
> >>>>> @@ -1278,6 +1283,8 @@ static void ddebug_attach_module_classes(stru=
ct ddebug_table *dt, struct _ddebug
> >>>>>     static int ddebug_add_module(struct _ddebug_info *di, const cha=
r *modname)
> >>>>>     {
> >>>>>         struct ddebug_table *dt;
> >>>>> +     struct _ddebug_class_map *cm;
> >>>>> +     int i;
> >>>>>
> >>>>>         if (!di->descs.len)
> >>>>>                 return 0;
> >>>>> @@ -1300,6 +1307,8 @@ static int ddebug_add_module(struct _ddebug_i=
nfo *di, const char *modname)
> >>>>>
> >>>>>         INIT_LIST_HEAD(&dt->link);
> >>>>>
> >>>>> +     dd_mark_vector_subrange(i, dt, cm, di, maps);
> >>>>> +
> >>>>>         if (di->maps.len)
> >>>>>                 ddebug_attach_module_classes(dt, di);
> >>>>>
> >>>>
> >>
>
