Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E77286633CF
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 23:18:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8343510E0AB;
	Mon,  9 Jan 2023 22:18:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com
 [IPv6:2607:f8b0:4864:20::a2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B90C10E0A4;
 Mon,  9 Jan 2023 22:18:20 +0000 (UTC)
Received: by mail-vk1-xa2f.google.com with SMTP id t2so4725130vkk.9;
 Mon, 09 Jan 2023 14:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2KmFF4MIYR1i1tDn7HkCXsIkV2zq/DOASpD61PD2PiQ=;
 b=o9O4iMagnefvuL39/DCHp9NN7X7dAfd5489k94RQaSeNu3Qe9PpX1LHn7PZ/LN+PbQ
 RVsgiQvejr/XomlyXBf1cUFSzBxzGYdacyaOzd7SMmecWNm9U614/aPFL5AcKuzHIbmu
 dvR8umH3QOBwYCCAxQURO8baXqc1BXRLsrD+jb+n9r/LK6hnJvxs0UvVGgWiNjiCZPWM
 AI5eDEMtsueo+BwAXqiMBJ/S0LncsC+rkUqYn7kr+LbcTe0u9O2o+jIxC8s7Y8CjqKgS
 5pwXk2CUXPWNQ4b6/KCTNTHCdqfaawCe3iZSXqvfUyCGnYfkUId34ZLl/akgrplN2Jho
 x1Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2KmFF4MIYR1i1tDn7HkCXsIkV2zq/DOASpD61PD2PiQ=;
 b=gIPUHOwrjjfTyUzZBQ8GB/nog4Ee5S3DSlvT10aJn5kKEV20ofh2GeEHGd+qTEr8ud
 E0NPYtZ9x0wsjdJXEwEjpqaQvhl8m/dOEeTmwa4Dlomv/bc74TBgJW3Jpbp2sOB1kjW0
 fBhESUItfnOoH82NIwkktnEcgA8/bEGLf2Qb6HVDsgXgsym5BeYVeSdjUF+yAuCWiEt/
 LZg/GsHr4qPYYXA69vh8sR8+7jLI3tPRGqGkhYoI9e5hxX60444tdLqe1HtI0JC4zIFV
 oyqpuXJ/UUOd4P+65jU0jz8qC2N7XqpATceNxpO2jBEJRzmwgCUY6c0orWePuwCsSitp
 uRkg==
X-Gm-Message-State: AFqh2koZ86G2EEuYuje35y0/bfABRsO3YqqA1zIK7g7uaD/Ssi+qMx8a
 xHFS+02i0nLxJgULm2q389WPRfc/qJAFtdc407o=
X-Google-Smtp-Source: AMrXdXvv7mF9XZiIt7npgmZEq2JiEakZJUiZv6jkCpyOs0AGEHA8TcqpOYnAIxhbZwkFgHo27x1dr29c97ldfYsMuy8=
X-Received: by 2002:a1f:5f90:0:b0:3d5:e6da:6d53 with SMTP id
 t138-20020a1f5f90000000b003d5e6da6d53mr3409574vkb.36.1673302699525; Mon, 09
 Jan 2023 14:18:19 -0800 (PST)
MIME-Version: 1.0
References: <20221205161005.222274-1-jim.cromie@gmail.com>
 <20221205161005.222274-3-jim.cromie@gmail.com>
 <Y7bGiLRanR3Y7tXM@phenom.ffwll.local>
In-Reply-To: <Y7bGiLRanR3Y7tXM@phenom.ffwll.local>
From: jim.cromie@gmail.com
Date: Mon, 9 Jan 2023 15:17:52 -0700
Message-ID: <CAJfuBxz=JQkXOYRRdbrcsZ+EjzjcSAMrd4P_NrbUAxCqYy2TMw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm_print: fix stale macro-name in comment
To: Jim Cromie <jim.cromie@gmail.com>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, seanpaul@chromium.org, 
 robdclark@gmail.com
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
Cc: daniel.vetter@ffwll.ch
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 5, 2023 at 5:46 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, Dec 05, 2022 at 09:10:05AM -0700, Jim Cromie wrote:
> > Cited commit uses stale macro name, fix this, and explain better.
> >
> > When DRM_USE_DYNAMIC_DEBUG=y, DYNDBG_CLASSMAP_DEFINE() maps DRM_UT_*
> > onto BITs in drm.debug.  This still uses enum drm_debug_category, but
> > it is somewhat indirect, with the ordered set of DRM_UT_* enum-vals.
> > This requires that the macro args: DRM_UT_* list must be kept in sync
> > and in order.
> >
> > Fixes: f158936b60a7 ("drm: POC drm on dyndbg - use in core, 2 helpers, 3 drivers.")
> > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
>
> What's the status of this series?
>

dead - superseded by
https://patchwork.freedesktop.org/series/111652/
which is still WIP, but improved since that post.
I'll resubmit soon, with same title so patchwork calls it rev 2

> Greg, you landed the original entire pile that wasn't quite ready yet? Or
> should I apply these two?
> -Daniel
>
> > ---
> > . emphasize ABI non-change despite enum val change - Jani Nikula
> > . reorder to back of patchset to follow API name changes.
> > ---
> >  include/drm/drm_print.h | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> > index a44fb7ef257f..e4c0c7e6d49d 100644
> > --- a/include/drm/drm_print.h
> > +++ b/include/drm/drm_print.h
> > @@ -276,7 +276,10 @@ static inline struct drm_printer drm_err_printer(const char *prefix)
> >   *
> >   */
> >  enum drm_debug_category {
> > -     /* These names must match those in DYNAMIC_DEBUG_CLASSBITS */
> > +     /*
> > +      * Keep DYNDBG_CLASSMAP_DEFINE args in sync with changes here,
> > +      * the enum-values define BIT()s in drm.debug, so are ABI.
> > +      */
> >       /**
> >        * @DRM_UT_CORE: Used in the generic drm code: drm_ioctl.c, drm_mm.c,
> >        * drm_memory.c, ...
> > --
> > 2.38.1
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
