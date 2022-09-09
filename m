Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5753C5B40E9
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 22:45:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CD9010EE52;
	Fri,  9 Sep 2022 20:44:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com
 [IPv6:2607:f8b0:4864:20::e29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 701A610EE4C;
 Fri,  9 Sep 2022 20:44:51 +0000 (UTC)
Received: by mail-vs1-xe29.google.com with SMTP id m65so2946111vsc.1;
 Fri, 09 Sep 2022 13:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=vNti+T8KdfeUbPCsgvNipWCAd23AlZaiYSX0mU/iJEY=;
 b=e/+fJVZriw6O2R662XaZhAb7hINqQY3Bcv0IJ/NrypmS5hxFIG1BfkNkva1t9FOGV1
 BoIs36Zmo/2s6IlJBQKBFDseUYifKGnKUvP5YBtfbuvQZHLimB92szWtoKQ5ik/556Rz
 5zkYgyXf2Wao95z3LvxFoAhjYt/K3jGajgqzFxFAkziwZi2/khe8ng6YyCzvmOayeOux
 H8GzioC1IDENqDnOU+Cz+s5CGJLh4YgLTx1e6i9/WEPbt/Cz5vTwwSkapkFWd3JtATKq
 avOdZmeR32ZvXMQVoISu5/6EdghhgTWIRJx6QGx5fhoLAbv7p/bvJYBpAbOyDhPlscLu
 Ojtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=vNti+T8KdfeUbPCsgvNipWCAd23AlZaiYSX0mU/iJEY=;
 b=z7xE9OR/r3244wiZo9Lw1IVPTBp+OLexVNq+vZQE/GN2olRg3g9kVq8oPg5vZXNcDN
 6vzbE+BEW5uTT/JEo3eLj4Y74Ib657vbv7HZ08+AaiuTzApeQVhKY7r23myzpAiIojTe
 IKgw2FoM+U8UjtVyF6VGge/MJKlpLIf/kxmugi/lzzj2E/3NE2nGp6IAlbp4ceExDBML
 aEuTI7ZZsl9k6apJtKJvlVSBPrUJ/sZK07WrJwrSNvI3rjehJI8fSY6Ku+/jheki0o2R
 mSGdn7t1hm0hPMOXQbkJk8xfgok+nPZ8i7TvF8TLoeqWBaHBcBjfK6D+yFMq4kcF8tK5
 RKAA==
X-Gm-Message-State: ACgBeo2/nxIIgq46iKfE1COFVWI0m/JYQYq2mQUZ0CeWw25Q+WOZPn9L
 Zs4NbozwPn3UWUfpkhX1+QrWO7cD1iLHiAp38Y0=
X-Google-Smtp-Source: AA6agR7KWk+cWS4XN1yruX0hsk3H+o6x1VgWSHBVGtpUP44GHpQKTBK4PDhhVF+zwznL5K77mxpnW6ZZxQeQLnh4ZAQ=
X-Received: by 2002:a05:6102:3a4c:b0:398:3098:a301 with SMTP id
 c12-20020a0561023a4c00b003983098a301mr3964922vsu.74.1662756289685; Fri, 09
 Sep 2022 13:44:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220904214134.408619-1-jim.cromie@gmail.com>
 <20220904214134.408619-18-jim.cromie@gmail.com>
 <2d3846cb-ff9a-3484-61a8-973799727d8f@akamai.com>
In-Reply-To: <2d3846cb-ff9a-3484-61a8-973799727d8f@akamai.com>
From: jim.cromie@gmail.com
Date: Fri, 9 Sep 2022 14:44:23 -0600
Message-ID: <CAJfuBxzM=KKPbcks-aQLAJM0QVd5sjL-CucYbyFbeG5sgoCVjg@mail.gmail.com>
Subject: Re: [PATCH v6 17/57] dyndbg: validate class FOO by checking with
 module
To: Jason Baron <jbaron@akamai.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Greg KH <gregkh@linuxfoundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Joe Perches <joe@perches.com>,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 7, 2022 at 12:19 PM Jason Baron <jbaron@akamai.com> wrote:
>
>
>
> On 9/4/22 17:40, Jim Cromie wrote:
> > Add module-to-class validation:
> >
> >   #> echo class DRM_UT_KMS +p > /proc/dynamic_debug/control
> >
> > If a query has "class FOO", then ddebug_find_valid_class(), called
> > from ddebug_change(), requires that FOO is known to module X,
> > otherwize the query is skipped entirely for X.  This protects each
> > module's class-space, other than the default:31.
> >
> > The authors' choice of FOO is highly selective, giving isolation
> > and/or coordinated sharing of FOOs.  For example, only DRM modules
> > should know and respond to DRM_UT_KMS.
> >
> > So this, combined with module's opt-in declaration of known classes,
> > effectively privatizes the .class_id space for each module (or
> > coordinated set of modules).
> >
> > Notes:
> >
> > For all "class FOO" queries, ddebug_find_valid_class() is called, it
> > returns the map matching the query, and sets valid_class via an
> > *outvar).
> >
> > If no "class FOO" is supplied, valid_class = _CLASS_DFLT.  This
> > insures that legacy queries do not trample on new class'd callsites,
> > as they get added.
>
>
> Hi Jim,
>
> I'm wondering about the case where we have a callsite which is marked
> as 'class foo', but the query string is done by say module and file, so:
>
> # echo "module bar file foo.c +p" > /proc/dynamic_debug_control
>
> With the proposed code, I think this ends up not enabling anything right?

correct - the only way to enable :    pr_debug_cls(CL_FOO, " ...")
is
   echo class CL_FOO +p > control

1st, existing dyndbg query uses, whether ad-hoc or scripted,
were not written in anticipation of new / classified subsystems.

2nd, new class users dont want to sit in coach. no damn legroom.

3rd, consider DRM, which already has drm.debug
ie:  /sys/module/drm/parameters/debug
and prefers it, at least by inertia.
protecting these new class'd callsites (3-5k of them)
from casual (unintended) manipulations of the kernel-wide
dyndbg state seems prudent, and a usability win.

Not everyone will use module bar, requiring "class foo"
guarantees that changes are intentional.



> Because valid class is set to _DPRINTK_CLASS_DFLT and then:
> 'dp->class_id != valid_class' is true?
>
> This seems confusing to me as a user as this doesn't work like the
> other queries....so maybe we should only do the
> 'dp->class_id != valid_class' check *if* query->class_string is set,
> see below.
>

Could you clarify whether you think this is a logic error
or a frame-of-reference difference as elaborated above ?

ISTM theres a place for a well-worded paragraph in doc
about the class distinction, perhaps a whole for-authors section.



>
>
> >
> > Also add a new column to control-file output, displaying non-default
> > class-name (when found) or the "unknown _id:", if it has not been
> > (correctly) declared with one of the declarator macros.
> >
> > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> > ---
> >  lib/dynamic_debug.c | 76 ++++++++++++++++++++++++++++++++++++++++-----
> >  1 file changed, 68 insertions(+), 8 deletions(-)
> >
> > diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
> > index b71efd0b491d..db96ded78c3f 100644
> > --- a/lib/dynamic_debug.c
> > +++ b/lib/dynamic_debug.c
> > @@ -56,6 +56,7 @@ struct ddebug_query {
> >       const char *module;
> >       const char *function;
> >       const char *format;
> > +     const char *class_string;
> >       unsigned int first_lineno, last_lineno;
> >  };
> >
> > @@ -136,15 +137,33 @@ static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
> >                       fmtlen--;
> >       }
> >
> > -     v3pr_info("%s: func=\"%s\" file=\"%s\" module=\"%s\" format=\"%.*s\" lineno=%u-%u\n",
> > -              msg,
> > -              query->function ?: "",
> > -              query->filename ?: "",
> > -              query->module ?: "",
> > -              fmtlen, query->format ?: "",
> > -              query->first_lineno, query->last_lineno);
> > +     v3pr_info("%s: func=\"%s\" file=\"%s\" module=\"%s\" format=\"%.*s\" lineno=%u-%u class=%s\n",
> > +               msg,
> > +               query->function ?: "",
> > +               query->filename ?: "",
> > +               query->module ?: "",
> > +               fmtlen, query->format ?: "",
> > +               query->first_lineno, query->last_lineno, query->class_string);
> >  }
> >
> > +static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table const *dt,
> > +                                                       const char *class_string, int *class_id)
> > +{
> > +     struct ddebug_class_map *map;
> > +     int idx;
> > +
> > +     list_for_each_entry(map, &dt->maps, link) {
> > +             idx = match_string(map->class_names, map->length, class_string);
> > +             if (idx >= 0) {
> > +                     *class_id = idx + map->base;
> > +                     return map;
> > +             }
> > +     }
> > +     *class_id = -ENOENT;
> > +     return NULL;
> > +}
> > +
> > +#define __outvar /* filled by callee */
> >  /*
> >   * Search the tables for _ddebug's which match the given `query' and
> >   * apply the `flags' and `mask' to them.  Returns number of matching
> > @@ -159,6 +178,8 @@ static int ddebug_change(const struct ddebug_query *query,
> >       unsigned int newflags;
> >       unsigned int nfound = 0;
> >       struct flagsbuf fbuf, nbuf;
> > +     struct ddebug_class_map *map = NULL;
> > +     int __outvar valid_class;
> >
> >       /* search for matching ddebugs */
> >       mutex_lock(&ddebug_lock);
> > @@ -169,9 +190,22 @@ static int ddebug_change(const struct ddebug_query *query,
> >                   !match_wildcard(query->module, dt->mod_name))
> >                       continue;
> >
> > +             if (query->class_string) {
> > +                     map = ddebug_find_valid_class(dt, query->class_string, &valid_class);
> > +                     if (!map)
> > +                             continue;
>
> So remove the else here.
>
> > +             } else {
> > +                     /* constrain query, do not touch class'd callsites */
> > +                     valid_class = _DPRINTK_CLASS_DFLT;
> > +             }
> > +
> >               for (i = 0; i < dt->num_ddebugs; i++) {
> >                       struct _ddebug *dp = &dt->ddebugs[i];
> >
> > +                     /* match site against query-class */
> > +                     if (dp->class_id != valid_class)
>
> And then make this: if (query->class_string && (dp->class_id != valid_class))
>
> thoughts?
>
>
> > +                             continue;
> > +>                    /* match against the source filename */
> >                       if (query->filename &&
> >                           !match_wildcard(query->filename, dp->filename) &&
> > @@ -420,6 +454,8 @@ static int ddebug_parse_query(char *words[], int nwords,
> >               } else if (!strcmp(keyword, "line")) {
> >                       if (parse_linerange(query, arg))
> >                               return -EINVAL;
> > +             } else if (!strcmp(keyword, "class")) {
> > +                     rc = check_set(&query->class_string, arg, "class");
> >               } else {
> >                       pr_err("unknown keyword \"%s\"\n", keyword);
> >                       return -EINVAL;
> > @@ -854,6 +890,20 @@ static void *ddebug_proc_next(struct seq_file *m, void *p, loff_t *pos)
> >       return dp;
> >  }
> >
> > +#define class_in_range(class_id, map)                                        \
> > +     (class_id >= map->base && class_id < map->base + map->length)
> > +
> > +static const char *ddebug_class_name(struct ddebug_iter *iter, struct _ddebug *dp)
> > +{
> > +     struct ddebug_class_map *map;
> > +
> > +     list_for_each_entry(map, &iter->table->maps, link)
> > +             if (class_in_range(dp->class_id, map))
> > +                     return map->class_names[dp->class_id - map->base];
> > +
> > +     return NULL;
> > +}
> > +
> >  /*
> >   * Seq_ops show method.  Called several times within a read()
> >   * call from userspace, with ddebug_lock held.  Formats the
> > @@ -865,6 +915,7 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
> >       struct ddebug_iter *iter = m->private;
> >       struct _ddebug *dp = p;
> >       struct flagsbuf flags;
> > +     char const *class;
> >
> >       if (p == SEQ_START_TOKEN) {
> >               seq_puts(m,
> > @@ -877,7 +928,16 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
> >                  iter->table->mod_name, dp->function,
> >                  ddebug_describe_flags(dp->flags, &flags));
> >       seq_escape_str(m, dp->format, ESCAPE_SPACE, "\t\r\n\"");
> > -     seq_puts(m, "\"\n");
> > +     seq_puts(m, "\"");
> > +
> > +     if (dp->class_id != _DPRINTK_CLASS_DFLT) {
> > +             class = ddebug_class_name(iter, dp);
> > +             if (class)
> > +                     seq_printf(m, " class:%s", class);
> > +             else
> > +                     seq_printf(m, " class unknown, _id:%d", dp->class_id);
> > +     }
> > +     seq_puts(m, "\n");
> >
> >       return 0;
> >  }
