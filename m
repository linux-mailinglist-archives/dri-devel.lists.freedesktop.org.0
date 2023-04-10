Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 111756DCB44
	for <lists+dri-devel@lfdr.de>; Mon, 10 Apr 2023 21:01:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B200C10E0E4;
	Mon, 10 Apr 2023 19:01:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA5610E0E4;
 Mon, 10 Apr 2023 19:01:31 +0000 (UTC)
Received: by mail-oo1-xc2f.google.com with SMTP id
 j4-20020a4adf44000000b0053e8b5524abso4874541oou.2; 
 Mon, 10 Apr 2023 12:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681153290;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YA1oDxKqPlucgkchnpNsPOW/R7uhWJLrBrmfaiPq5Zo=;
 b=HRgQGtTHNz/Pgr7l5cwUq9OicczD7PlbbLDbbtiWuqLZqJ2pOmwGe91v9Ks+1kg8n/
 G1oIoHGkGYLU5+lgeYBVsysWTSZj2m08a77H9d/oDYbqzv/cWMo4V387+oRifE4CCWZV
 rnvide6GUZiPtrdzpQBHgoSly4L7GY219XW9O06QfBrlfvu7NFq8yTAFfVRg13qLRIsV
 4Am6lw9U1VsFkRltK04Um90m8RIZYf/347GUc3pFsJitahPPGhElGVbjzRPMP96eHY+m
 8apOGTuUyhNUS9x/yThOd6Qep4XdCnbtI096DoYlRTGTeXzllJSR8AiEu0a10/4Pkif2
 6NtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681153290;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YA1oDxKqPlucgkchnpNsPOW/R7uhWJLrBrmfaiPq5Zo=;
 b=ijehfafxt5EelMH/atnFH1jFWuQ1lNG/tC0SiBuuZtJBgCAS8bPdnN5TAHJ2xUoBmV
 B7QDLx5ClKpESkRTRcO8lFiLuD+xIh6zjYYL2AeHRXqBEg19Xic2LT2Ske6/MrvKZJo5
 I9c9yNAVg+Dp/UjrLlzPVhtgi5v4+bsytrARrTJ3ZBFE8qQBf2M/L9p+TMMaj0uuoZ6N
 IL2p6dHi1SNhN3l5XTr9CIMMlTxvsmNox0R9213+GYWZQW5jbPynk3KuH87/FiznuZUT
 BE9B4hFsGvehUqrHj8qEiAWRzO6IuRcsHLCxspEC9toD/ZnphClT8LbHPqHHR55rMDkz
 XJnA==
X-Gm-Message-State: AAQBX9dd8ke6l+1ym34nSFRwFXXLRjfu7D11HF5WLH8ruur+1G5EXzgL
 j3bE25LdNiLPRiW+GWnpOCCRdVwF8gd7HrnLbUY=
X-Google-Smtp-Source: AKy350Y+BZTSG4+KMyMj+jH5Xa47NJsPPHVKNdIX3bHK8JgZanUHLbm/3toXbUIzP5woyR3GYsRv8hPNs7jOZr0Zzns=
X-Received: by 2002:a4a:4248:0:b0:541:c42f:2f04 with SMTP id
 i8-20020a4a4248000000b00541c42f2f04mr2203237ooj.1.1681153290350; Mon, 10 Apr
 2023 12:01:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230406215917.1475704-1-robdclark@gmail.com>
 <20230406215917.1475704-2-robdclark@gmail.com>
 <CACvgo50nOw-82pc2mEbydWH3=RDXuOKwnBnjmOhV-UYcbjRKQA@mail.gmail.com>
In-Reply-To: <CACvgo50nOw-82pc2mEbydWH3=RDXuOKwnBnjmOhV-UYcbjRKQA@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 10 Apr 2023 12:01:18 -0700
Message-ID: <CAF6AEGuesqsWQEsEOwriaNC_1TkWoJ-d=mrrUgV9CoPXMftJVQ@mail.gmail.com>
Subject: Re: [RFC 1/2] drm: Add fdinfo memory stats
To: Emil Velikov <emil.l.velikov@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 linux-arm-msm@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Christopher Healy <healych@amazon.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Apr 8, 2023 at 5:20=E2=80=AFAM Emil Velikov <emil.l.velikov@gmail.c=
om> wrote:
>
> Hey Rob,
>
> On Thu, 6 Apr 2023 at 22:59, Rob Clark <robdclark@gmail.com> wrote:
>
> > +- drm-purgeable-memory: <uint> [KiB|MiB]
> > +
> > +The total size of buffers that are purgable.
>
> s/purgable/purgeable/
>
>
> > +static void print_size(struct drm_printer *p, const char *stat, size_t=
 sz)
> > +{
> > +       const char *units[] =3D {"B", "KiB", "MiB", "GiB"};
>
> The documentation says:
>
> > Default unit shall be bytes with optional unit specifiers of 'KiB' or '=
MiB'
> > indicating kibi- or mebi-bytes.
>
> So I would drop the B and/or update the documentation to mention B && GiB=
.
>
> > +       unsigned u;
> > +
> > +       for (u =3D 0; u < ARRAY_SIZE(units) - 1; u++) {
> > +               if (sz < SZ_1K)
> > +                       break;
> > +               sz /=3D SZ_1K;
>
> IIRC size_t can be 64bit, so we should probably use do_div() here.
>
> > +       }
> > +
> > +       drm_printf(p, "%s:\t%lu %s\n", stat, sz, units[u]);
> > +}
> > +
> > +/**
> > + * drm_print_memory_stats - Helper to print standard fdinfo memory sta=
ts
> > + * @file: the DRM file
> > + * @p: the printer to print output to
> > + * @status: callback to get driver tracked object status
> > + *
> > + * Helper to iterate over GEM objects with a handle allocated in the s=
pecified
> > + * file.  The optional status callback can return additional object st=
ate which
>
> s/return additional/return an additional/

"an" reads funny to me, as the state is plural (bitmask).. but agreed
on the other things

> > + * determines which stats the object is counted against.  The callback=
 is called
> > + * under table_lock.  Racing against object status change is "harmless=
", and the
> > + * callback can expect to not race against object destroy.
>
> s/destroy/destruction/
>
> > + */
> > +void drm_print_memory_stats(struct drm_file *file, struct drm_printer =
*p,
> > +                           enum drm_gem_object_status (*status)(struct=
 drm_gem_object *))
> > +{
>
> > +               if (s & DRM_GEM_OBJECT_RESIDENT) {
> > +                       size.resident +=3D obj->size;
> > +                       s &=3D ~DRM_GEM_OBJECT_PURGEABLE;
>
> Is MSM capable of marking the object as both purgeable and resident or
> is this to catch other drivers? Should we add a note to the
> documentation above - resident memory cannot be purgeable

It is just to simplify drivers so they don't have to repeat this
logic.  Ie. an object can be marked purgeable while it is still active
(so it will be eventually purgeable when it becomes idle).  Likewise
it doesn't make sense to count an object that has already been purged
(is no longer resident) as purgeable.

BR,
-R

> > +               }
> > +
> > +               if (s & DRM_GEM_OBJECT_ACTIVE) {
> > +                       size.active +=3D obj->size;
> > +                       s &=3D ~DRM_GEM_OBJECT_PURGEABLE;
>
> Ditto.
>
> With the above nits, the patch is:
> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
>
> HTH
> Emil
