Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC7E4BF415
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 09:52:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B29A010EB03;
	Tue, 22 Feb 2022 08:52:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7EA710E58C
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 00:08:21 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-2d07c4a0d06so155546207b3.13
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 16:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qva2eVchuG91mMO8NiXPQBiXDN67++/1UcHENhMZQPg=;
 b=J1i7ma7EIJzTK+LmOTZCElMH3Vqr8OabMw/6BAsutkzErJb/HGHk+UbMuVoqX1PtUK
 L20RwffKCybGGLZvT7Ij+Nh7LwA4KLNW00bC9v823avgBahOuMiY6/+hpcnynTo2OgBP
 dtPLCLHKRMHTJ6txY/Hz2nxDDoF5VkcBYw9nThAVkLx/YhhAQScR2fC/8dzp+Y99yplQ
 /apP8DkwuST4esSv/MvIYM7AiqIXUmZw0yyAYsNjij/IEcMWz5A+BAk8juT6Tlr6EFi3
 QIiqoELTn9qwWVuuW01H7aLD8Io/tlqf3ERZz4wXEPj/+Zg8EV+Oc7ebmPEc2kjWCTAn
 BFsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qva2eVchuG91mMO8NiXPQBiXDN67++/1UcHENhMZQPg=;
 b=ByFnCCdNF62BGeZod+TRXusgdtILmi+vYWPd7cjDg+IO5x0sAckW0pO3TzFKH8nqsg
 b5zotE/V/q/81/RRe8MNEbtXNgxZfw15JEemgvPe33I7VZotilnSYff6bP/e4JJYX47y
 ObqJUQCDy3FnVUfufMfPJ/rRtbg31z7GzF2OZsozBVjZUpMvceo8QLJ6mk2Ds+zGAQJ8
 79aN/yXBzaC0Abf0NwoGGl/+TeYMgNIMGsKSOGS42aOrD8MTwd4dHLABukwj0uRJz5TC
 qXP/FhyXyu8C3Lfd2o7E2m9/odEuF5+HxYlzxBXrEQzoUoX5vXOSI00RyH/DH1n/fuA4
 UiTA==
X-Gm-Message-State: AOAM530rFHY8J6Ax0Y52wPI6w69Zrc6RA/f9G2qfGxOP8aumxyWPpICM
 aHUjteXuumoHGAJw5OjG4B3IqH0bD4jz+umoUf5hkQ==
X-Google-Smtp-Source: ABdhPJynSfOIQkEOMtXYr81F8ybIWpEzANR6Yr+GnGAd+gTQAFkEgW3l8LZQxeRXwFU/mvr8+vv85qhg/KaXVlOVX/M=
X-Received: by 2002:a81:1d5:0:b0:2d0:e2aa:1ae0 with SMTP id
 204-20020a8101d5000000b002d0e2aa1ae0mr21685288ywb.278.1645488500522; Mon, 21
 Feb 2022 16:08:20 -0800 (PST)
MIME-Version: 1.0
References: <20220221232542.1481315-1-andrzej.hajda@intel.com>
 <20220221232542.1481315-6-andrzej.hajda@intel.com>
In-Reply-To: <20220221232542.1481315-6-andrzej.hajda@intel.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 21 Feb 2022 16:08:09 -0800
Message-ID: <CANn89iJxaPqTLY0BaD79Ubxx55RMtWzZk_jkpuF1cp3Wsy2RzA@mail.gmail.com>
Subject: Re: [PATCH v3 05/11] lib/ref_tracker: __ref_tracker_dir_print improve
 printing
To: Andrzej Hajda <andrzej.hajda@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 22 Feb 2022 08:52:43 +0000
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
Cc: Chris Wilson <chris.p.wilson@intel.com>, netdev <netdev@vger.kernel.org>,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Jakub Kicinski <kuba@kernel.org>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 21, 2022 at 3:26 PM Andrzej Hajda <andrzej.hajda@intel.com> wrote:
>
> To improve readibility of ref_tracker printing following changes

   readability

> have been performed:
> - reports are printed per stack_handle - log is more compact,
> - added display name for ref_tracker_dir,
> - stack trace is printed indented, in the same printk call,
> - total number of references is printed every time,
> - print info about dropped references.
>
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
>  include/linux/ref_tracker.h | 15 +++++--
>  lib/ref_tracker.c           | 90 ++++++++++++++++++++++++++++++++-----
>  2 files changed, 91 insertions(+), 14 deletions(-)
>
> diff --git a/include/linux/ref_tracker.h b/include/linux/ref_tracker.h
> index 3e9e9df2a41f5..a2cf1f6309adb 100644
> --- a/include/linux/ref_tracker.h
> +++ b/include/linux/ref_tracker.h
> @@ -17,12 +17,19 @@ struct ref_tracker_dir {
>         bool                    dead;
>         struct list_head        list; /* List of active trackers */
>         struct list_head        quarantine; /* List of dead trackers */
> +       char                    name[32];
>  #endif
>  };
>
>  #ifdef CONFIG_REF_TRACKER
> -static inline void ref_tracker_dir_init(struct ref_tracker_dir *dir,
> -                                       unsigned int quarantine_count)
> +
> +// Temporary allow two and three arguments, until consumers are converted
> +#define ref_tracker_dir_init(_d, _q, args...) _ref_tracker_dir_init(_d, _q, ##args, #_d)
> +#define _ref_tracker_dir_init(_d, _q, _n, ...) __ref_tracker_dir_init(_d, _q, _n)
> +
> +static inline void __ref_tracker_dir_init(struct ref_tracker_dir *dir,
> +                                       unsigned int quarantine_count,
> +                                       const char *name)
>  {
>         INIT_LIST_HEAD(&dir->list);
>         INIT_LIST_HEAD(&dir->quarantine);
> @@ -31,6 +38,7 @@ static inline void ref_tracker_dir_init(struct ref_tracker_dir *dir,
>         dir->dead = false;
>         refcount_set(&dir->untracked, 1);
>         refcount_set(&dir->no_tracker, 1);
> +       strlcpy(dir->name, name, sizeof(dir->name));
>         stack_depot_init();
>  }
>
> @@ -51,7 +59,8 @@ int ref_tracker_free(struct ref_tracker_dir *dir,
>  #else /* CONFIG_REF_TRACKER */
>
>  static inline void ref_tracker_dir_init(struct ref_tracker_dir *dir,
> -                                       unsigned int quarantine_count)
> +                                       unsigned int quarantine_count,
> +                                       ...)
>  {
>  }
>
> diff --git a/lib/ref_tracker.c b/lib/ref_tracker.c
> index 5e9f90bbf771b..ab1253fde244e 100644
> --- a/lib/ref_tracker.c
> +++ b/lib/ref_tracker.c
> @@ -1,11 +1,16 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
> +
> +#define pr_fmt(fmt) "ref_tracker: " fmt
> +
>  #include <linux/export.h>
> +#include <linux/list_sort.h>
>  #include <linux/ref_tracker.h>
>  #include <linux/slab.h>
>  #include <linux/stacktrace.h>
>  #include <linux/stackdepot.h>
>
>  #define REF_TRACKER_STACK_ENTRIES 16
> +#define STACK_BUF_SIZE 1024
>
>  struct ref_tracker {
>         struct list_head        head;   /* anchor into dir->list or dir->quarantine */
> @@ -14,24 +19,87 @@ struct ref_tracker {
>         depot_stack_handle_t    free_stack_handle;
>  };
>
> -void __ref_tracker_dir_print(struct ref_tracker_dir *dir,
> -                          unsigned int display_limit)
> +struct ref_tracker_dir_stats {
> +       int total;
> +       int count;
> +       struct {
> +               depot_stack_handle_t stack_handle;
> +               unsigned int count;
> +       } stacks[];
> +};
> +
> +static struct ref_tracker_dir_stats *
> +ref_tracker_get_stats(struct ref_tracker_dir *dir, unsigned int limit)
>  {
> +       struct ref_tracker_dir_stats *stats;
>         struct ref_tracker *tracker;
> -       unsigned int i = 0;
>
> -       lockdep_assert_held(&dir->lock);
> +       stats = kmalloc(struct_size(stats, stacks, limit),
> +                       GFP_NOWAIT | __GFP_NOWARN);

I would be more comfortable if the allocation was done by the caller,
possibly using GFP_KERNEL and evenutally kvmalloc(),
instead of under dir->lock ?


> +       if (!stats)
> +               return ERR_PTR(-ENOMEM);
> +       stats->total = 0;
> +       stats->count = 0;
>
>         list_for_each_entry(tracker, &dir->list, head) {
> -               if (i < display_limit) {
> -                       pr_err("leaked reference.\n");
> -                       if (tracker->alloc_stack_handle)
> -                               stack_depot_print(tracker->alloc_stack_handle);
> -                       i++;
> -               } else {
> -                       break;
> +               depot_stack_handle_t stack = tracker->alloc_stack_handle;
> +               int i;
> +
> +               ++stats->total;
> +               for (i = 0; i < stats->count; ++i)
> +                       if (stats->stacks[i].stack_handle == stack)
> +                               break;
> +               if (i >= limit)
> +                       continue;
> +               if (i >= stats->count) {
> +                       stats->stacks[i].stack_handle = stack;
> +                       stats->stacks[i].count = 0;
> +                       ++stats->count;
>                 }
> +               ++stats->stacks[i].count;
> +       }
> +
> +       return stats;
> +}
> +
> +void __ref_tracker_dir_print(struct ref_tracker_dir *dir,
> +                          unsigned int display_limit)
> +{
> +       struct ref_tracker_dir_stats *stats;
> +       unsigned int i = 0, skipped;
> +       depot_stack_handle_t stack;
> +       char *sbuf;
> +
> +       lockdep_assert_held(&dir->lock);
> +
> +       if (list_empty(&dir->list))
> +               return;
> +
> +       stats = ref_tracker_get_stats(dir, display_limit);
> +       if (IS_ERR(stats)) {
> +               pr_err("%s@%pK: couldn't get stats, error %pe\n",
> +                      dir->name, dir, stats);
> +               return;
>         }
> +

> +       sbuf = kmalloc(STACK_BUF_SIZE, GFP_NOWAIT | __GFP_NOWARN);

Same remark. These allocations are most probably going to happen from process
context, I think GFP_KERNEL is more robust.

This is debugging infra, it would be sad if we give up at this point,
after storing MB of traces :)

> +
> +       for (i = 0, skipped = stats->total; i < stats->count; ++i) {
> +               stack = stats->stacks[i].stack_handle;
> +               if (sbuf && !stack_depot_snprint(stack, sbuf, STACK_BUF_SIZE, 4))
> +                       sbuf[0] = 0;
> +               pr_err("%s@%pK has %d/%d users at\n%s\n", dir->name, dir,
> +                      stats->stacks[i].count, stats->total, sbuf);
> +               skipped -= stats->stacks[i].count;
> +       }
> +
> +       if (skipped)
> +               pr_err("%s@%pK skipped reports about %d/%d users.\n",
> +                      dir->name, dir, skipped, stats->total);
> +
> +       kfree(sbuf);
> +
> +       kfree(stats);
>  }
>  EXPORT_SYMBOL(__ref_tracker_dir_print);
>
> --
> 2.25.1
>
