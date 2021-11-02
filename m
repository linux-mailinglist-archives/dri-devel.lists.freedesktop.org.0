Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDDE44362E
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 19:59:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5466F6E438;
	Tue,  2 Nov 2021 18:59:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF9686E438;
 Tue,  2 Nov 2021 18:59:13 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id bi29so40619qkb.5;
 Tue, 02 Nov 2021 11:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=y7U0BrIJ7qbRhUaIlWDe1pMpMoyW7l6GWGkwBAQ7Uzk=;
 b=B6iw16fQQQiFmJ8VprO5/MozsadT6/nRCXtOo4FVfdVSC6yoE8T0WaxCszgNatXmA0
 alRp5RQxDs5UyLF89s/Y0acuH++AQuNdPBgCwkHZPOEeKiUgjkK05WhgzdHGJo/Felk0
 J9ub5ipPcPV6PJQRX504hiMmfZwRpSa5c8+dDqC+nEINDO4OAx9Iba20hRGLVubTbJyA
 hyM5Psdyvxq3TAFbU1NQip82XkSHY5qCmrLvsKQvhTJdHH8RlQfEI/52DhwrHkAtqpiA
 xmt6ZZ5mBWSUz02EU6PLyynTGADPna+CoOLyuVQGO7yBYx6cAF4SaVLub67gFOJ/i9Du
 Rshw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=y7U0BrIJ7qbRhUaIlWDe1pMpMoyW7l6GWGkwBAQ7Uzk=;
 b=dhscsu4tPsnhOZd5ASDN3HmPNdzZK6K/JGIGVGJf+3fcyYXl4Nb29Lf6dMDhile/ws
 FO/0/eKoEAL/zTlc2+MatJ9IigGROapBm1s3tbBMk+Mw1cTkBVSZvXnBqKZdxR1CuM1D
 2yWEDtPh1yHF2Yqrm17PGPBZUTjpxMQmLvkWZgIILXM0dBSMaz+4xoDuPNAgn9DD7akV
 mWkdUHenA88Vj0pUTYUjGgUypoufCyRXFGa5HImQnb2uFG9LxEEHZlSdbKopCZPbCiFP
 /GfkY98JWE+NP2xxiXYPV9oC/B/P21haqa0SGIfXjAKmcdDtVjHYjcQUvOGEptJ4tsAT
 AKyA==
X-Gm-Message-State: AOAM531jaP9a9M5koDD7gyY165rm8vOockWKNw/IJwXCKXUIK84U0acq
 9B35141qwLMMycfsv5ugkuLuqmwCsqQDwTux3udLzMKwfRfK+w==
X-Google-Smtp-Source: ABdhPJybLQ2hwIu/QbfY1bfycCoNVV0QqYTmcCnFmgqMwWToOXwW9YG0ydP8ZshirnXffxcEMDTJt0B60ISO4KDbKTo=
X-Received: by 2002:a05:620a:2849:: with SMTP id
 h9mr28938225qkp.107.1635879552057; 
 Tue, 02 Nov 2021 11:59:12 -0700 (PDT)
MIME-Version: 1.0
References: <20211102163425.505732-1-thomas.hellstrom@linux.intel.com>
 <20211102163425.505732-3-thomas.hellstrom@linux.intel.com>
 <CAM0jSHO-ZUP39Rw=Nm=wUrNEhCzhVG_ve+3we8gWzSkoisn4yQ@mail.gmail.com>
 <d9c63560-86fa-9efd-c962-eddb8cf76757@linux.intel.com>
In-Reply-To: <d9c63560-86fa-9efd-c962-eddb8cf76757@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 2 Nov 2021 18:58:45 +0000
Message-ID: <CAM0jSHOfz34j9PjPe-_iGiNeK62xFJ=C3Eg4uq-sxvSkgdFfCw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/i915/ttm: Failsafe migration blits
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2 Nov 2021 at 17:55, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
>
> On 11/2/21 18:40, Matthew Auld wrote:
> > On Tue, 2 Nov 2021 at 16:39, Thomas Hellstr=C3=B6m
> > <thomas.hellstrom@linux.intel.com> wrote:
> >> If the initial fill blit or copy blit of an object fails, the old
> >> content of the data might be exposed and read as soon as either CPU- o=
r
> >> GPU PTEs are set up to point at the pages.
> >>
> >> Intercept the blit fence with an async callback that checks the
> >> blit fence for errors and if there are errors performs an async cpu bl=
it
> >> instead. If there is a failure to allocate the async dma_fence_work,
> >> allocate it on the stack and sync wait for the blit to complete.
> >>
> >> Add selftests that simulate gpu blit failures and failure to allocate
> >> the async dma_fence_work.
> >>
> >> A previous version of this pach used dma_fence_work, now that's
> >> opencoded which adds more code but might lower the latency
> >> somewhat in the common non-error case.
> >>
> >> v3:
> >> - Style fixes (Matthew Auld)
> >>
> >> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com=
>
> >> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> >> ---
> >>   drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  | 322 +++++++++++++++-=
--
> >>   drivers/gpu/drm/i915/gem/i915_gem_ttm_move.h  |   5 +
> >>   .../drm/i915/gem/selftests/i915_gem_migrate.c |  24 +-
> >>   3 files changed, 295 insertions(+), 56 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gp=
u/drm/i915/gem/i915_gem_ttm_move.c
> >> index 0ed6b7f2b95f..b89672c547f8 100644
> >> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> >> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> >> @@ -18,6 +18,29 @@
> >>   #include "gt/intel_gt.h"
> >>   #include "gt/intel_migrate.h"
> >>
> >> +/**
> >> + * DOC: Selftest failure modes for failsafe migration:
> >> + *
> >> + * For fail_gpu_migration, the gpu blit scheduled is always a clear b=
lit
> >> + * rather than a copy blit, and then we force the failure paths as if
> >> + * the blit fence returned an error.
> >> + *
> >> + * For fail_work_allocation we fail the kmalloc of the async worker, =
we
> >> + * sync the gpu blit. If it then fails, or fail_gpu_migration is set =
to
> >> + * true, then a memcpy operation is performed sync.
> >> + */
> >> +#ifdef CONFIG_DRM_I915_SELFTEST
> > When pushing maybe make this:
> >
> > #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
> >
> > Which seems to be consistent with most of the other places.
>
> Hmm,
>
> I noticed that i915 is doing that, although I thought these macros were
> primarily intended for C expressions?

i915 is not the only one. AFAIK it just conveniently handles both
bultin and module.

>
> /Thomas
>
>
> >
> >> +static bool fail_gpu_migration;
> >> +static bool fail_work_allocation;
> >> +
> >> +void i915_ttm_migrate_set_failure_modes(bool gpu_migration,
> >> +                                       bool work_allocation)
> >> +{
> >> +       fail_gpu_migration =3D gpu_migration;
> >> +       fail_work_allocation =3D work_allocation;
> >> +}
> >> +#endif
> >> +
