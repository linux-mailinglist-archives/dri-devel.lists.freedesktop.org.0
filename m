Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B516E66E8
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 16:17:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9A2B10E7BE;
	Tue, 18 Apr 2023 14:17:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B065C10E71A;
 Tue, 18 Apr 2023 14:17:03 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-187c78c6657so348911fac.2; 
 Tue, 18 Apr 2023 07:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681827422; x=1684419422;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FmBaQkHIE64deNzpVv55QJIbTu5/1hu1+/btmYt5dHY=;
 b=jKa5OfFTS+n4vtrJc8mzIHygxLW41dhG2sFd2J0lZ+RAPOjG84AtApkFQuR0FeiC2c
 srTwSAEN7o5UdrHsVZyFUHBedmwl0TgJa4AmVg+w3B653gVfvaxsTIDmqe3b2LN9OZb2
 L0HM4her9SCO1HM20OFnSZJniZibPtW0AzB7sTakTD0zFaozs///zq/SvZOML7hC2a4a
 D8d7eZiYcI9rm/QO2WWgXwrm+WcVNASMoPNd78hjsNUslAdzGqzrVyuiK8kHxluY+tqK
 TVmm7zufSqhpaG5zzpGVlw1x5lAGQIAHNbDheYPvOz0afgWdDmfHyT2uDKLwdzYkJw45
 mG/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681827422; x=1684419422;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FmBaQkHIE64deNzpVv55QJIbTu5/1hu1+/btmYt5dHY=;
 b=YMSg6JZCN0weI1eZ7vaNlbwU/XxL0tZdUM5Kg3fyU9m6Sgdw8eSSvVCCWUw+377cd/
 U2pFIGQW9k73fsz/azyTrjRXiHDp0rYgx/0b9VsD+mMT/prVfc+r+rWVUXeYNZdFTmIP
 xwcfceY9rmksO8zc5Cg3QIYrCvWBsf/JTurVDGgy24B4pUyCvaXDn2fEMHWrUA4FEMRO
 anHp9b8MqNTDYsPtGuze6JfJKGK0+RYF0QW0jOaDuf8jdhDLSbrwOOPtcnmtpQoKraiP
 Rj8DlanNXM1qOKQBLrGFbxt+RKFY3LPlzxYhPQESKRQBqhu1pbjRcwxzlSWiBGsTaZ1a
 Zbsg==
X-Gm-Message-State: AAQBX9e24SvsHO6KrmGD0WtiOYoCkOvklUSE4PZZd8odBcPj6NKp7Uwb
 ZeMB9HZ9hs3Qx9g+FUULuUjrNa9qRvozW8RH4aiUutwn
X-Google-Smtp-Source: AKy350aF5xQ4ly7rIUprVqghxM9cShr8cRj38BCRc5QDT8ptSh2iDMapuHyM24yw4Yoo51Su0/AEj2FBFGkJJHNFPKw=
X-Received: by 2002:a05:6870:f289:b0:187:fd12:f6d0 with SMTP id
 u9-20020a056870f28900b00187fd12f6d0mr1080334oap.5.1681827422329; Tue, 18 Apr
 2023 07:17:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230417155613.4143258-1-tvrtko.ursulin@linux.intel.com>
 <20230417155613.4143258-4-tvrtko.ursulin@linux.intel.com>
 <f708dbc2-cf55-6cf6-eef0-b69d00c3eee9@amd.com>
 <54b21ae8-33ce-0f5c-4e0b-1118d25b12bf@linux.intel.com>
In-Reply-To: <54b21ae8-33ce-0f5c-4e0b-1118d25b12bf@linux.intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 18 Apr 2023 07:16:51 -0700
Message-ID: <CAF6AEGvAeguBLdHGqu_uTCrvGUJ-gEDZ2pvNUnxar6OiseJQkw@mail.gmail.com>
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

On Tue, Apr 18, 2023 at 3:47=E2=80=AFAM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 17/04/2023 17:20, Christian K=C3=B6nig wrote:
> > Am 17.04.23 um 17:56 schrieb Tvrtko Ursulin:
> >> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> >>
> >> Add support to dump GEM stats to fdinfo.
> >>
> >> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> >> ---
> >>   Documentation/gpu/drm-usage-stats.rst | 12 +++++++
> >>   drivers/gpu/drm/drm_file.c            | 52 +++++++++++++++++++++++++=
++
> >>   include/drm/drm_drv.h                 |  7 ++++
> >>   include/drm/drm_file.h                |  8 +++++
> >>   4 files changed, 79 insertions(+)
> >>
> >> diff --git a/Documentation/gpu/drm-usage-stats.rst
> >> b/Documentation/gpu/drm-usage-stats.rst
> >> index 2ab32c40e93c..8273a41b2fb0 100644
> >> --- a/Documentation/gpu/drm-usage-stats.rst
> >> +++ b/Documentation/gpu/drm-usage-stats.rst
> >> @@ -21,6 +21,7 @@ File format specification
> >>   - File shall contain one key value pair per one line of text.
> >>   - Colon character (`:`) must be used to delimit keys and values.
> >> +- Caret (`^`) is also a reserved character.
> >>   - All keys shall be prefixed with `drm-`.
> >>   - Whitespace between the delimiter and first non-whitespace
> >> character shall be
> >>     ignored when parsing.
> >> @@ -105,6 +106,17 @@ object belong to this client, in the respective
> >> memory region.
> >>   Default unit shall be bytes with optional unit specifiers of 'KiB'
> >> or 'MiB'
> >>   indicating kibi- or mebi-bytes.
> >> +- drm-memory-<str>^size:      <uint> [KiB|MiB]
> >> +- drm-memory-<str>^shared:    <uint> [KiB|MiB]
> >> +- drm-memory-<str>^resident:  <uint> [KiB|MiB]
> >> +- drm-memory-<str>^purgeable: <uint> [KiB|MiB]
> >> +- drm-memory-<str>^active:    <uint> [KiB|MiB]
> >
> > What exactly does size/shared/active mean here?
> >
> > If it means what I think it does I don't see how TTM based drivers
> > should track that in the first place.
>
> Size is an analogue to process VM size - maximum reachable/allocated
> memory belonging to a client.
>
> Shared could be IMO viewed as a bit dodgy and either could be dropped or
> needs to be better defined. For now I simply followed the implementation
> from Rob's RFC which is:
>
>         if (obj->handle_count > 1)
>                 stats[0].shared +=3D sz;
>
> I can see some usefulness to it but haven't thought much about semantics
> yet.
>
> Similar story with active which I think is not very useful.
> Implementation is like this:
>
>         if (!dma_resv_test_signaled(obj->resv, dma_resv_usage_rw(true)))
>                 stats[0].active +=3D sz;
>
> For me it is too transient to bring much value over the resident
> category. I supposed only advantage is that resident (as does purgeable)
> needs driver cooperation while active can be done like about from DRM
> core. Although I am not a big fan of counting these stats from the core
> to begin with..

Maybe there is a better way to track it, like setting an age/time when
the buffer is last active (which could be made part of dma_resv to
make it automatic). The question I really want to answer is more like
"over the last T ms how many buffers were active".  This is a useful
metric esp when you think about a use-case like the browser where you
might have a lot of textures/etc for your 80 different tabs but at any
given time only a small subset is active and the rest can be swapped
out to zram if needed.

BR,
-R

>
> Regards,
>
> Tvrtko
>
> >> +Resident category is identical to the drm-memory-<str> key and two
> >> should be
> >> +mutually exclusive.
> >> +
> >> +TODO more description text...
> >> +
> >>   - drm-cycles-<str> <uint>
> >>   Engine identifier string must be the same as the one specified in th=
e
> >> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> >> index 37b4f76a5191..e202f79e816d 100644
> >> --- a/drivers/gpu/drm/drm_file.c
> >> +++ b/drivers/gpu/drm/drm_file.c
> >> @@ -42,6 +42,7 @@
> >>   #include <drm/drm_client.h>
> >>   #include <drm/drm_drv.h>
> >>   #include <drm/drm_file.h>
> >> +#include <drm/drm_gem.h>
> >>   #include <drm/drm_print.h>
> >>   #include "drm_crtc_internal.h"
> >> @@ -871,6 +872,54 @@ void drm_send_event(struct drm_device *dev,
> >> struct drm_pending_event *e)
> >>   }
> >>   EXPORT_SYMBOL(drm_send_event);
> >> +static void
> >> +print_stat(struct drm_printer *p, const char *stat, const char
> >> *region, u64 sz)
> >> +{
> >> +    const char *units[] =3D {"", " KiB", " MiB"};
> >> +    unsigned int u;
> >> +
> >> +    if (sz =3D=3D ~0ull) /* Not supported by the driver. */
> >> +        return;
> >> +
> >> +    for (u =3D 0; u < ARRAY_SIZE(units) - 1; u++) {
> >> +        if (sz < SZ_1K)
> >> +            break;
> >> +        sz =3D div_u64(sz, SZ_1K);
> >> +    }
> >> +
> >> +    drm_printf(p, "drm-memory-%s^%s:\t%llu%s\n",
> >> +           region, stat, sz, units[u]);
> >> +}
> >> +
> >> +static void print_memory_stats(struct drm_printer *p, struct drm_file
> >> *file)
> >> +{
> >> +    struct drm_device *dev =3D file->minor->dev;
> >> +    struct drm_fdinfo_memory_stat *stats;
> >> +    unsigned int num, i;
> >> +    char **regions;
> >> +
> >> +    regions =3D dev->driver->query_fdinfo_memory_regions(dev, &num);
> >> +
> >> +    stats =3D kcalloc(num, sizeof(*stats), GFP_KERNEL);
> >> +    if (!stats)
> >> +        return;
> >> +
> >> +    dev->driver->query_fdinfo_memory_stats(file, stats);
> >> +
> >> +    for (i =3D 0; i < num; i++) {
> >> +        if (!regions[i]) /* Allow sparse name arrays. */
> >> +            continue;
> >> +
> >> +        print_stat(p, "size", regions[i], stats[i].size);
> >> +        print_stat(p, "shared", regions[i], stats[i].shared);
> >> +        print_stat(p, "resident", regions[i], stats[i].resident);
> >> +        print_stat(p, "purgeable", regions[i], stats[i].purgeable);
> >> +        print_stat(p, "active", regions[i], stats[i].active);
> >> +    }
> >> +
> >> +    kfree(stats);
> >> +}
> >> +
> >>   /**
> >>    * drm_show_fdinfo - helper for drm file fops
> >>    * @seq_file: output stream
> >> @@ -900,6 +949,9 @@ void drm_show_fdinfo(struct seq_file *m, struct
> >> file *f)
> >>       if (dev->driver->show_fdinfo)
> >>           dev->driver->show_fdinfo(&p, file);
> >> +
> >> +    if (dev->driver->query_fdinfo_memory_regions)
> >> +        print_memory_stats(&p, file);
> >>   }
> >>   EXPORT_SYMBOL(drm_show_fdinfo);
> >> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> >> index 89e2706cac56..ccc1cd98d2aa 100644
> >> --- a/include/drm/drm_drv.h
> >> +++ b/include/drm/drm_drv.h
> >> @@ -35,6 +35,7 @@
> >>   #include <drm/drm_device.h>
> >>   struct drm_file;
> >> +struct drm_fdinfo_memory_stat;
> >>   struct drm_gem_object;
> >>   struct drm_master;
> >>   struct drm_minor;
> >> @@ -408,6 +409,12 @@ struct drm_driver {
> >>        */
> >>       void (*show_fdinfo)(struct drm_printer *p, struct drm_file *f);
> >> +    char ** (*query_fdinfo_memory_regions)(struct drm_device *dev,
> >> +                           unsigned int *num);
> >> +
> >> +    void (*query_fdinfo_memory_stats)(struct drm_file *f,
> >> +                      struct drm_fdinfo_memory_stat *stat);
> >> +
> >>       /** @major: driver major number */
> >>       int major;
> >>       /** @minor: driver minor number */
> >> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> >> index 7d9b3c65cbc1..00d48beeac5c 100644
> >> --- a/include/drm/drm_file.h
> >> +++ b/include/drm/drm_file.h
> >> @@ -375,6 +375,14 @@ struct drm_file {
> >>   #endif
> >>   };
> >> +struct drm_fdinfo_memory_stat {
> >> +    u64 size;
> >> +    u64 shared;
> >> +    u64 resident;
> >> +    u64 purgeable;
> >> +    u64 active;
> >> +};
> >> +
> >>   /**
> >>    * drm_is_primary_client - is this an open file of the primary node
> >>    * @file_priv: DRM file
> >
