Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 044836E5117
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 21:40:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8172B10E2C5;
	Mon, 17 Apr 2023 19:40:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30F3010E045;
 Mon, 17 Apr 2023 19:40:09 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-187f76c50dbso3114943fac.10; 
 Mon, 17 Apr 2023 12:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681760408; x=1684352408;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S4AtwSgS1U9aQI3heN3xhjiBm87Kx97eiyVNi0GDfQ8=;
 b=i2FX+EugUZKwuW6IsETGkdAGWABPgxWh5+l7jhNawuh7jD8cbBLT6wQP4z+8usooGv
 Ow8M7vswf8IbHi4OXSCZex7OxaYIdwIAuLV3meCqHwQahaOeAPqIbuEK18Kb6fBg6LeR
 YkKehM93aTVraymOE3TBWgxonG/2ARMSgGoAnYgDedEzSmNCe/FOLnQY5haL0yxiD2X3
 CElWOca3fF0qSw8zTWVZ6dZ/aNigMi7Cf60vM6UZcv1LyApsQMmD/cGuqOCq1hVf0Pjc
 yAeF916H71qE33uRIoLLhapmlIF0BjoDgAX3WsHcwbhG6okcE1RuAoHqvOZ1wDKv2r2V
 0WVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681760408; x=1684352408;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S4AtwSgS1U9aQI3heN3xhjiBm87Kx97eiyVNi0GDfQ8=;
 b=J2IYvfTJ3TgdyxBEcAFCc0bcWp/bPvv2gxOzLlPthCj/xwe4U97qAzw3kPysrD7i1o
 BaB+nd+e9xU1/BsjBJfGpcXLAGfwC1TA8Wfh+XS4xR2okcokyP1SriQofgXzLwWlhYGm
 rqudAfoesFG/K11FmvMHz7Vm9N7QoMRLB5dsGoAHzfyyXq+fxSK0MphX4GuRcwuHm/8H
 xS5ywiUu/RYL6/0sGsTZ6G/XeOYk+c+1Js2qvZ5rn74z2sP5zIlCVFMshlFmTTboFChW
 JYd02gZxdFw8ZqNYbYlp6Hhx/TXuN3XcvvOpKPBRVHbaUDm3IoGPmTAC6ED53+/P2VD5
 61pQ==
X-Gm-Message-State: AAQBX9c1KoOYFey6jZusAIkomtKFYdXGH4znbH45zUql3+Q+Nx9fUZO0
 agg4VQ5yIGVCEpNsVlZOCIQ5FC2QFcz2tAzUS9s=
X-Google-Smtp-Source: AKy350YrzWFIgPLqA1hBWSHZlJsb2xGasQO+8LcgBc0J+7kvbJOM0X+61kmORMt2wSXEVHQkOIzj5auJ+FWVn5ixy9U=
X-Received: by 2002:a05:6870:8a22:b0:184:2097:e64f with SMTP id
 p34-20020a0568708a2200b001842097e64fmr7358367oaq.5.1681760407702; Mon, 17 Apr
 2023 12:40:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230417155613.4143258-1-tvrtko.ursulin@linux.intel.com>
 <20230417155613.4143258-4-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230417155613.4143258-4-tvrtko.ursulin@linux.intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 17 Apr 2023 12:39:56 -0700
Message-ID: <CAF6AEGu3oagVYqBcgqKFO6-gbLbVdFn51fKeV7CfWTJXJjTNYA@mail.gmail.com>
Subject: Re: [RFC 3/6] drm: Add fdinfo memory stats
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Intel-gfx@lists.freedesktop.org,
 Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 17, 2023 at 8:56=E2=80=AFAM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> Add support to dump GEM stats to fdinfo.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>  Documentation/gpu/drm-usage-stats.rst | 12 +++++++
>  drivers/gpu/drm/drm_file.c            | 52 +++++++++++++++++++++++++++
>  include/drm/drm_drv.h                 |  7 ++++
>  include/drm/drm_file.h                |  8 +++++
>  4 files changed, 79 insertions(+)
>
> diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/dr=
m-usage-stats.rst
> index 2ab32c40e93c..8273a41b2fb0 100644
> --- a/Documentation/gpu/drm-usage-stats.rst
> +++ b/Documentation/gpu/drm-usage-stats.rst
> @@ -21,6 +21,7 @@ File format specification
>
>  - File shall contain one key value pair per one line of text.
>  - Colon character (`:`) must be used to delimit keys and values.
> +- Caret (`^`) is also a reserved character.

this doesn't solve the problem that led me to drm-$CATEGORY-memory... ;-)

(also, it is IMHO rather ugly)

BR,
-R

>  - All keys shall be prefixed with `drm-`.
>  - Whitespace between the delimiter and first non-whitespace character sh=
all be
>    ignored when parsing.
> @@ -105,6 +106,17 @@ object belong to this client, in the respective memo=
ry region.
>  Default unit shall be bytes with optional unit specifiers of 'KiB' or 'M=
iB'
>  indicating kibi- or mebi-bytes.
>
> +- drm-memory-<str>^size:      <uint> [KiB|MiB]
> +- drm-memory-<str>^shared:    <uint> [KiB|MiB]
> +- drm-memory-<str>^resident:  <uint> [KiB|MiB]
> +- drm-memory-<str>^purgeable: <uint> [KiB|MiB]
> +- drm-memory-<str>^active:    <uint> [KiB|MiB]
> +
> +Resident category is identical to the drm-memory-<str> key and two shoul=
d be
> +mutually exclusive.
> +
> +TODO more description text...
> +
>  - drm-cycles-<str> <uint>
>
>  Engine identifier string must be the same as the one specified in the
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index 37b4f76a5191..e202f79e816d 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -42,6 +42,7 @@
>  #include <drm/drm_client.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_file.h>
> +#include <drm/drm_gem.h>
>  #include <drm/drm_print.h>
>
>  #include "drm_crtc_internal.h"
> @@ -871,6 +872,54 @@ void drm_send_event(struct drm_device *dev, struct d=
rm_pending_event *e)
>  }
>  EXPORT_SYMBOL(drm_send_event);
>
> +static void
> +print_stat(struct drm_printer *p, const char *stat, const char *region, =
u64 sz)
> +{
> +       const char *units[] =3D {"", " KiB", " MiB"};
> +       unsigned int u;
> +
> +       if (sz =3D=3D ~0ull) /* Not supported by the driver. */
> +               return;
> +
> +       for (u =3D 0; u < ARRAY_SIZE(units) - 1; u++) {
> +               if (sz < SZ_1K)
> +                       break;
> +               sz =3D div_u64(sz, SZ_1K);
> +       }
> +
> +       drm_printf(p, "drm-memory-%s^%s:\t%llu%s\n",
> +                  region, stat, sz, units[u]);
> +}
> +
> +static void print_memory_stats(struct drm_printer *p, struct drm_file *f=
ile)
> +{
> +       struct drm_device *dev =3D file->minor->dev;
> +       struct drm_fdinfo_memory_stat *stats;
> +       unsigned int num, i;
> +       char **regions;
> +
> +       regions =3D dev->driver->query_fdinfo_memory_regions(dev, &num);
> +
> +       stats =3D kcalloc(num, sizeof(*stats), GFP_KERNEL);
> +       if (!stats)
> +               return;
> +
> +       dev->driver->query_fdinfo_memory_stats(file, stats);
> +
> +       for (i =3D 0; i < num; i++) {
> +               if (!regions[i]) /* Allow sparse name arrays. */
> +                       continue;
> +
> +               print_stat(p, "size", regions[i], stats[i].size);
> +               print_stat(p, "shared", regions[i], stats[i].shared);
> +               print_stat(p, "resident", regions[i], stats[i].resident);
> +               print_stat(p, "purgeable", regions[i], stats[i].purgeable=
);
> +               print_stat(p, "active", regions[i], stats[i].active);
> +       }
> +
> +       kfree(stats);
> +}
> +
>  /**
>   * drm_show_fdinfo - helper for drm file fops
>   * @seq_file: output stream
> @@ -900,6 +949,9 @@ void drm_show_fdinfo(struct seq_file *m, struct file =
*f)
>
>         if (dev->driver->show_fdinfo)
>                 dev->driver->show_fdinfo(&p, file);
> +
> +       if (dev->driver->query_fdinfo_memory_regions)
> +               print_memory_stats(&p, file);
>  }
>  EXPORT_SYMBOL(drm_show_fdinfo);
>
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index 89e2706cac56..ccc1cd98d2aa 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -35,6 +35,7 @@
>  #include <drm/drm_device.h>
>
>  struct drm_file;
> +struct drm_fdinfo_memory_stat;
>  struct drm_gem_object;
>  struct drm_master;
>  struct drm_minor;
> @@ -408,6 +409,12 @@ struct drm_driver {
>          */
>         void (*show_fdinfo)(struct drm_printer *p, struct drm_file *f);
>
> +       char ** (*query_fdinfo_memory_regions)(struct drm_device *dev,
> +                                              unsigned int *num);
> +
> +       void (*query_fdinfo_memory_stats)(struct drm_file *f,
> +                                         struct drm_fdinfo_memory_stat *=
stat);
> +
>         /** @major: driver major number */
>         int major;
>         /** @minor: driver minor number */
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index 7d9b3c65cbc1..00d48beeac5c 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -375,6 +375,14 @@ struct drm_file {
>  #endif
>  };
>
> +struct drm_fdinfo_memory_stat {
> +       u64 size;
> +       u64 shared;
> +       u64 resident;
> +       u64 purgeable;
> +       u64 active;
> +};
> +
>  /**
>   * drm_is_primary_client - is this an open file of the primary node
>   * @file_priv: DRM file
> --
> 2.37.2
>
