Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 462B9A70907
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 19:29:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F70810E5D5;
	Tue, 25 Mar 2025 18:29:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jYXSRaRR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2158310E295;
 Tue, 25 Mar 2025 18:29:44 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-6fead015247so48653747b3.2; 
 Tue, 25 Mar 2025 11:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742927383; x=1743532183; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MrcQMqawSQzJcQ5iaIhabL0LanhIuq3ELqb60ctwCEk=;
 b=jYXSRaRR0hKtaV1Mk4b3VqNEDn9C4xtOoNn47EmpXvXeuOs8KdUUMIp9CKepTii6Ae
 JVph6ISCShvp5HaT3IzW6PqMAt9apsD52E4ELAmeRMe6c0jbHNyur8geAp1uTLm7q5M4
 dxVrHwdw/jCO/wxz0SBhHxzz5rL6zEHuXBpfo6T7u9ZXrJC4KZEhcZ9gLJOuWSFoRXaD
 AYGh3ssvSxOg7jkOpWfLrJsRqaO/XkEiGzZ7A61GcwbCmSDqNPCc4MZFTGpY7rfstpVk
 Ba4Iwub85TD/GpsVstC3jZSPLiaibdk7yQhx0p3a8yv1yPotxpGepkhwQ08jcmu0M5+7
 ERSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742927383; x=1743532183;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MrcQMqawSQzJcQ5iaIhabL0LanhIuq3ELqb60ctwCEk=;
 b=rIF8h2g8a2d4xd4Zsj521aP+2k+Rbd5KFVYR0xuo+j6u+xixinq7cXDc/MMqrZ2RkW
 mGma5OhIsJneHXbt2bo4rw2SsEYv6L3396UG4lB4VMHdV/CTD+xtUFiPLxAcBZTxoqrh
 sTz1h/MWX4wWhy8VqHl+KdFfSxL0XCaFPBArV+uAJ/lx1zHhUShGDP27Asn+Im0R4d62
 jvKArj6QncdPycUsld4H8BIk1xgdquoD54n8f7hJ8x9L3KhN+W0wzaw34+A5jmo5GeM9
 G9Nqc4+CSoCSn6vwg0nQJcE0O/DO6jtSodl6A925tRy7hOuip0Kt05/40cG4/6q1KpVa
 Z/pA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxINww4ETnhOQlc2xnMkRwKoH+pT0iquq3C5g7a4onXc/cxMHVDWAgEineFbobbUpsJXpl9wL9QiRT@lists.freedesktop.org,
 AJvYcCVYVYqyc0opbvrL25e6n8/u0d8LfEbfp7+GQzw9xgTSPk0F/8V4flOpXA7K0iJApDnW2PLcObSJZzMqwpU2EYBoWA==@lists.freedesktop.org,
 AJvYcCWciastFPj6CJM3mmor6msAM58cH7j4JXJVGr9br92Nd6MyO/kwaC6wMNVp8cae6wfWjXZZSa5fExgc@lists.freedesktop.org,
 AJvYcCXKvAnXtgSx+K1dTaGOM1poLW7f9UY6Ld8QJC+FAWcgilFMyz6m3C7ExfQ1qIXsT7I+VpRoTziz@lists.freedesktop.org,
 AJvYcCXWyM75rAS2n9lmGBRYwBkH7MyXCyUtoWKPC+ZCe41vV4B92K4tG2ThKHicLE/bsdfcTpB5JDthccAalocP3g==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3POSAk8Ta1uRBfMF3yTGOID3jRU5/scJwu+h0XQhdutKSkSmo
 JBeNUyubOdaysnF3x1xl8CJ90FIIP35e45IlJgbV1G935YLaVZqy6ILobJxiBxd+BfvJp5Hq+ZM
 u6jU4SCm9lL7YcO8lE+IvRcKcenM=
X-Gm-Gg: ASbGncs8tSV7uK4i4oJTpaoYxeu2FBUpXJBq5E2W6Rd6YQ6ek4MYT6GETeACnZRZRTU
 glUmFIi9OZLvJ61NMk6DVKovoqNbrecp5oj+t18Ik84hMZiIWgG3x9vOPmkr+sTxe4+HA6lK7F/
 Xq2EdAMTiYivucX7hi2vl5vO5o
X-Google-Smtp-Source: AGHT+IGSYmYgheX9gYmSYWZVtqE6/0HkKR1jPp2CwbNY9HGr77Lm7kMi0w0OpRvDpWIHY8B30zbphEO20QwIKfu/s4A=
X-Received: by 2002:a05:690c:640d:b0:6fb:b4e7:1471 with SMTP id
 00721157ae682-700babf5ec9mr217278727b3.7.1742927382961; Tue, 25 Mar 2025
 11:29:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250320185238.447458-1-jim.cromie@gmail.com>
 <20250320185238.447458-31-jim.cromie@gmail.com>
 <0828cfdb-abf3-42c5-8500-70f36affd0a8@bootlin.com>
In-Reply-To: <0828cfdb-abf3-42c5-8500-70f36affd0a8@bootlin.com>
From: jim.cromie@gmail.com
Date: Tue, 25 Mar 2025 12:29:16 -0600
X-Gm-Features: AQ5f1JpL4zfuR5gFvMhO5JMn9AbG8jHdc2qnKxdZBAmkJZi1rc9OZZj-4YfgnjU
Message-ID: <CAJfuBxzHEtS1psJ+L_6=FP-mU3b8mgLQbXRWoizLkZoRUB6G1Q@mail.gmail.com>
Subject: Re: [PATCH v2 30/59] dyndbg: drop "protection" of class'd pr_debugs
 from legacy queries
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

On Mon, Mar 24, 2025 at 9:20=E2=80=AFAM Louis Chauvet <louis.chauvet@bootli=
n.com> wrote:
>
>
>
> Le 20/03/2025 =C3=A0 19:52, Jim Cromie a =C3=A9crit :
> > Current classmap code protects class'd pr_debugs from unintended
> > changes by "legacy" unclassed queries:
> >
> >    # this doesn't disable all of DRM_UT_* categories
> >    echo "-p" > /proc/dynamic_debug/control
> >
> >    # name the class to change it - protective but tedious
> >    echo "class DRM_UT_CORE +p" > /proc/dynamic_debug/control
> >
> >    # or do it the subsystem way
> >    echo 1 > /sys/module/drm/parameters/debug
> >
> > This "name the class to change it" behavior gave a modicum of
> > protection to classmap users (ie DRM) so their debug settings aren't
> > trivially and unintentionally altered underneath them.
> >
> > But this made the class keyword special in some sense; the other
> > keywords skip only on explicit mismatch, otherwize the code falls thru
>
> s/otherwize/otherwise/

ack

>
> > to adjust the pr-debug site.
> >
> > So Jason Baron didn't like this special case when I 1st proposed it;
> > I argued 2 points:
> > - "protection gives stable-debug, improving utility"
> > - __drm_debug is authoritative w/o dyndbg under it.
> >
> > I thought I'd convinced him back then, (and the patchset got merged),
> > but he noted it again when he reviewed this series.  So this commit
> > names the "special case": ddebug_client_module_protects_classes(), and
> > reverts it to Jason's preference.
>   >
> > If a class mismatch is seen, code distinguishes whether the class was
> > explicitly given (and always skips/continue), or the DFLT was assumed
> > because no class was given.  Here we test
> > ddebug_client_module_protects_classes(), skip if so.
> >
> > Later, if any user/module wants to protect its classes, we could add a
> > flag to ddebug_table, a means to set it from CLASSMAP_DEFINE, and
> > check it when applying a classless query/cmd.
>
> I don't really understand the goal of the protection, do you have the
> discussion between you and Jason so I can have some context and some
> answer to my questions?
>

The on-list discussion is here.

https://lore.kernel.org/lkml/2d3846cb-ff9a-3484-61a8-973799727d8f@akamai.co=
m/
https://lore.kernel.org/lkml/0d9f644f-3d60-02c3-7ce0-01296757e181@akamai.co=
m/#t

At the time I thought it was unfinished business, and expected some
more discussion,
but that didnt happen, and later GregKH committed the set.

Last summer I emailed him privately, and he made a 5-6 points Ive
addressed in this rev,
(reduction of repetitive code, enforcing classmap constraints,
protecting against misuse)
but it also became clear he still didnt like the "specialness" of the keywo=
rd,
given by the _DFLT constraint applied to legacy callsites and queries.

Since thats a bit of a philosophical debate, I looked for a technical solut=
ion,
to have it either way with fairly trivial additions, and to yield
until user experience
dictates otherwise

To be clear, I still think protecting the "classed" is proper.
Without dyndbg, /sys/module/drm/parameters/debug is authoritative, full sto=
p.
I'm surprised any customer would give away that certainty,
it looks like a (small caliber) footgun to me.
But its not worth disagreeing on.
Hence this patch reverts that "protection"

> With the example you gave above, I think this could lead to a very odd
> behavior: if I enable dyndbg, I expect any pr_dbg to be managed by
> dyndbg settings.

if by "any" you mean ALL the ones that currently exist,
before we add a whole new "CLASS" of user,
(with ~5k uses, all comfortable with their exclusive control)
I can agree.

echo class FOO +p > control
gives full control.  You just have to say so for the new classes of users.

>
> If a user writes stuff on dyndbg control, he clearly knows what he is
> doing, and he wants to control what logs he wants.
>
> And if you allow multiple "protected" users, the normal way to disable
> all dyndbg logs will be:
>
>         ddcmd -p
>         ddcmd class DRM_UT_CORE -p
>         ddcmd class DRM_... -p # all drm classes
>         ddcmd class SPI_... -p # all spi classes
>         ddcmd class WHATEVER_... -p # all other subsystem
>
>         # And only now you can enable only what you want
>         ddcmd module my_mod +p
>
> This is clearly annoying to write.

It is clearly annoying.
It doesnt need to be handy.
thats what /sys/module/drm/parameters/debug is for.
with modest "protection" of explicit naming,
the sysfs knob can reasonably be expected
to reflect whats going on underneath.
Without it, bets are misplaced.

>
> If DRM (or whatever subsystem) wants to add a debug parameter and use it
> to control their logs without being impacted by dyndbg, I believe it
> should not use dyndbg classes to do it.

hmm - dyndbg's 1st value is its NOOP cost when off.
If thats not worth something, you wouldnt bother using it.


In any case, its pretty clear that my viewpoint isnt prevailing here,
and as I said, I dont care enough to disagree.
the reversion here can stand.


>
> > CC: jbaron@akamai.com
> > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> > ---
> >   lib/dynamic_debug.c | 34 +++++++++++++++++++++++++---------
> >   1 file changed, 25 insertions(+), 9 deletions(-)
> >
> > diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
> > index c44502787c2b..13de0dd3a4ad 100644
> > --- a/lib/dynamic_debug.c
> > +++ b/lib/dynamic_debug.c
> > @@ -193,6 +193,17 @@ static int ddebug_find_valid_class(struct ddebug_t=
able const *dt, const char *cl
> >       return -ENOENT;
> >   }
> >
> > +/*
> > + * classmaps-v1 protected classes from changes by legacy commands
> > + * (those selecting _DPRINTK_CLASS_DFLT by omission), v2 undoes that
> > + * special treatment.  State so explicitly.  Later we could give
> > + * modules the choice to protect their classes or to keep v2 behavior.
> > + */
> > +static inline bool ddebug_client_module_protects_classes(const struct =
ddebug_table *dt)
> > +{
> > +     return false;
> > +}
> > +
> >   /*
> >    * Search the tables for _ddebug's which match the given `query' and
> >    * apply the `flags' and `mask' to them.  Returns number of matching
> > @@ -206,7 +217,7 @@ static int ddebug_change(const struct ddebug_query =
*query, struct flag_settings
> >       unsigned int newflags;
> >       unsigned int nfound =3D 0;
> >       struct flagsbuf fbuf, nbuf;
> > -     int valid_class;
> > +     int slctd_class;
>
> Nitpick: can you use full words? slctd is difficult to read.
>
> >
> >       /* search for matching ddebugs */
> >       mutex_lock(&ddebug_lock);
> > @@ -218,21 +229,26 @@ static int ddebug_change(const struct ddebug_quer=
y *query, struct flag_settings
> >                       continue;
> >
> >               if (query->class_string) {
> > -                     valid_class =3D ddebug_find_valid_class(dt, query=
->class_string);
> > -                     if (valid_class < 0)
> > +                     slctd_class =3D ddebug_find_valid_class(dt, query=
->class_string);
> > +                     if (slctd_class < 0)
> > +                             /* skip/reject classes unknown by module =
*/
> >                               continue;
> >               } else {
> > -                     /* constrain query, do not touch class'd callsite=
s */
> > -                     valid_class =3D _DPRINTK_CLASS_DFLT;
> > +                     slctd_class =3D _DPRINTK_CLASS_DFLT;
> >               }
> >
> >               for (i =3D 0; i < dt->info.descs.len; i++) {
> >                       struct _ddebug *dp =3D &dt->info.descs.start[i];
> >
> > -                     /* match site against query-class */
> > -                     if (dp->class_id !=3D valid_class)
> > -                             continue;
> > -
> > +                     if (dp->class_id !=3D slctd_class) {
> > +                             if (query->class_string)
> > +                                     /* site.class !=3D given class */
> > +                                     continue;
> > +                             /* legacy query, class'd site */
> > +                             else if (ddebug_client_module_protects_cl=
asses(dt))
> > +                                     continue;
> > +                             /* allow change on class'd pr_debug */
> > +                     }
> >                       /* match against the source filename */
> >                       if (query->filename &&
> >                           !match_wildcard(query->filename, dp->filename=
) &&
>
> --
> Louis Chauvet, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
