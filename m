Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4796630FF10
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 22:07:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B66416EDD7;
	Thu,  4 Feb 2021 21:07:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com
 [IPv6:2607:f8b0:4864:20::a2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1D756EDD7
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 21:07:44 +0000 (UTC)
Received: by mail-vk1-xa2a.google.com with SMTP id u9so487959vkb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Feb 2021 13:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z0FGsv4l2ft4jkHNpmqMmTXmRXaRPkWzhpHKIiWSZ7w=;
 b=frSOqtU6NWWgTRpWBqefGSR454l8YJsUhFVVABSvv7UXoHVgBFlgPj+dq7w2lDOz3n
 yr8XSN8kMyCRSb7wgtzR9d3DhbJxNoZNYADKuSpxrvTVFklDm3TorX6ubpMhZa0PjjC/
 FZK9QFmQomomlTA2f8ODOLzLzeFeh+xWwKw5pYD2yhmxYfczBvc2o5P9jfFcQOht9djc
 mg7ZTVNwr59D/pIIFis9nWyF/Ycpa4mpRUY+PdXftnWy+YQiuub8k8/8bM+7lFSJuvX+
 e677TZXKLMWewtDuwamkewrqwuOst06cLf1P/Aclg75XNpFETIng1qAvFF9FF7gUHyHD
 W2nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z0FGsv4l2ft4jkHNpmqMmTXmRXaRPkWzhpHKIiWSZ7w=;
 b=l/IzzzQhuYgBHy6IlHBTsYUdAo/tsaIB15TRU5RSruImpauvoIxkrQPVamkM6Rn8gg
 04vhnAuZxknCL97w8IuaI7olL7HXznyqTC+6JM+PJUoDvrEiMBehCfXNz3Bc5dbEXiPf
 nihwA/Z2HqwsqOc+2gBqwvNzXwPDfXIUcMmCfO9fBlq94EVyC8FKFb0fZCycrEr+1zb/
 dNqr+lha1mZVN/dNWduAWmhjfmkhPagLiWcPl1yukS7xuosofpLtwnD8U8dnunpyvRzF
 Hpebj5ieiVaps3Dzxg8gkUmRom59gy8kKesst6zG3viPTxZSYxDefU1qcgHd9GP6WvYV
 lp0w==
X-Gm-Message-State: AOAM530yAC8dG+ANF+kjF6e0Px6sxtbUlrqYo51j5nmIuaY8JsmCMv5n
 m6Kysgv8fnouKwo3VS/vLcDpr3D2+SXiBMt2JrckjIHLcV0Clw==
X-Google-Smtp-Source: ABdhPJxKGKLdXhmCamfzBOIwdNg2N2aXypRbF4opWdcP3Vcsptwi9SmmREgJs3u4rzstu7m3TN3RDoderr5fQo9fRx4=
X-Received: by 2002:a1f:27cf:: with SMTP id n198mr1352419vkn.16.1612472863971; 
 Thu, 04 Feb 2021 13:07:43 -0800 (PST)
MIME-Version: 1.0
References: <20210204113742.1814456-1-emil.l.velikov@gmail.com>
 <CABjik9cHYArtsTgYvcGbH_AOEcdVWpX-pTrHMq4uv7ct4_NSKQ@mail.gmail.com>
 <CABjik9dnH0dQ2Am-nfPUstF8Uv7dSixcCZ7pN7yLWNQ4QgTaAg@mail.gmail.com>
In-Reply-To: <CABjik9dnH0dQ2Am-nfPUstF8Uv7dSixcCZ7pN7yLWNQ4QgTaAg@mail.gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 4 Feb 2021 21:07:32 +0000
Message-ID: <CACvgo53wwtkr-DeCMsnKRpjsBO=GhTVWBODC=32-6sNxgaQwLQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/fourcc: introduce DRM_FOURCC_STANDALONE guard
To: James Park <james.park@lagfreegames.com>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 4 Feb 2021 at 18:17, James Park <james.park@lagfreegames.com> wrote:
>
> On Thu, Feb 4, 2021 at 9:37 AM James Park <james.park@lagfreegames.com> wrote:
> >
> > On Thu, Feb 4, 2021 at 3:37 AM Emil Velikov <emil.l.velikov@gmail.com> wrote:
> > >
> > > Currently, the drm_fourcc.h header depends on drm.h for __u32 and __u64.
> > > At the same time drm.h pulls a lot of unneeded symbols.
> > >
> > > Add new guard DRM_FOURCC_STANDALONE, which when set will use local
> > > declaration of said symbols.
> > >
> > > When used on linux - we pull linux/types.h which is used either way.
> > > On other platforms, BSDs et al, we need a couple of typedefs.
> > >
> > > Since those can trigger a warning in some corner-cases*, add some GCC
> > > magic to silence them. Note that incorrect type redefinitions will still
> > > be flagged, and the GCC pragma is ignored by other compilers.
> > >
> > > *Corner-case:
> > > If one sets DRM_FOURCC_STANDALONE and compiles with C99 or earlier while
> > > also using -pedantic _and_ the header lives outside of the standard
> > > /usr/include (like BSDs normally do).
> > >
> > > v2:
> > >  - Add corner-case handling, based on popular demand.
> > >
> > > Cc: James Park <james.park@lagfreegames.com>
> > > Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> > > Cc: Simon Ser <contact@emersion.fr>
> > > Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
> > > ---
> > >  include/uapi/drm/drm.h        | 10 ++++++++++
> > >  include/uapi/drm/drm_fourcc.h | 29 +++++++++++++++++++++++++++++
> > >  2 files changed, 39 insertions(+)
> > >
> > > diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> > > index 808b48a93330..cd78950e05ce 100644
> > > --- a/include/uapi/drm/drm.h
> > > +++ b/include/uapi/drm/drm.h
> > > @@ -53,6 +53,15 @@ typedef unsigned int drm_handle_t;
> > >  #include <stdint.h>
> > >  #include <sys/ioccom.h>
> > >  #include <sys/types.h>
> > > +
> > > +/*
> > > + * When using C99 -pedantic the typedefs will trigger a warning.
> > > + * If the header is considered a system one (-isystem) those will be
> > > + * ignored, yet on the target platforms BSDs, et al - the headers live
> > > + * in a non-system location.
> > > + */
> > > +#pragma GCC diagnostic push
> > > +#pragma GCC diagnostic ignored "-Wpedantic"
> > >  typedef int8_t   __s8;
> > >  typedef uint8_t  __u8;
> > >  typedef int16_t  __s16;
> > > @@ -63,6 +72,7 @@ typedef int64_t  __s64;
> > >  typedef uint64_t __u64;
> > >  typedef size_t   __kernel_size_t;
> > >  typedef unsigned long drm_handle_t;
> > > +#pragma GCC diagnostic pop
> > >
> > >  #endif
> > >
> > > diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> > > index 6f0628eb13a6..84a1f96cc4ef 100644
> > > --- a/include/uapi/drm/drm_fourcc.h
> > > +++ b/include/uapi/drm/drm_fourcc.h
> > > @@ -24,7 +24,36 @@
> > >  #ifndef DRM_FOURCC_H
> > >  #define DRM_FOURCC_H
> > >
> > > +/*
> > > + * Define DRM_FOURCC_STANDALONE you're interested only FOURCC and do not want
> > > + * to pull drm.h into your application.
> > > + */
> > > +#ifdef DRM_FOURCC_STANDALONE
> > > +#if defined(__linux__)
> > > +
> > > +#include <linux/types.h>
> > > +
> > > +#else /* One of the BSDs */
> > > +
> > > +#include <stdint.h>
> > > +
> > > +/*
> > > + * When using C99 -pedantic the typedefs will trigger a warning.
> > > + * If the header is considered a system one (-isystem) those will be
> > > + * ignored, yet on the target platforms BSDs, et al - the headers live
> > > + * in a non-system location.
> > > + */
> > > +#pragma GCC diagnostic push
> > > +#pragma GCC diagnostic ignored "-Wpedantic"
> > > +typedef uint32_t __u32;
> > > +typedef uint64_t __u64;
> > > +#pragma GCC diagnostic pop
> > > +
> > > +#endif /* __linux __ */
> > > +
> > > +#else
> > >  #include "drm.h"
> > > +#endif /* DRM_FOURCC_STANDALONE */
> > >
> > >  #if defined(__cplusplus)
> > >  extern "C" {
> > > --
> > > 2.30.0
> > >
> >
> > I remember reading GCC diagnostic push/pop requires a recent enough
> > compiler version to be supported, which is pretty old, but I don't
> > know how old is old enough for Linux headers:
> > https://github.com/protocolbuffers/protobuf/issues/4156
> >
> > Testing snippets in godbolt, I think the pragmas need to be wrapped. MSVC says:
> >
> > warning C4068: unknown pragma 'GCC'
> >
/me shakes fist at MSVC - why are you being so silly

> > Also, Clang seems to want -Wtypedef-redefinition, not -Wpedantic. GCC
> > complains it doesn't know what -Wtypedef-redefinition is, so that
> > would also need to be wrapped.
>
Clang seemed fine here. Must have used a different version or something.

> If we're already conceding copy/paste, then how about inlining my
> previous header?
>
> #ifndef DRM_BASIC_TYPES_DEFINED
> #define DRM_BASIC_TYPES_DEFINED
> // Sync modifications between drm.h and drm_fourcc.h
> ...
> #endif
>
> No compiler games. Valid on all flavors of C (I think).

Hmm cannot find any patch mentioning DRM_BASIC_TYPES_DEFINED - perhaps
you did one in the mesa MR?

Either way, if the proposal is to have the include/typedefs guarded as
above - sure, that works. Please add the guard in both drm.h and
drm_fourcc.h
The comment seems slightly confusing, but that's nitpicking.

Do send a patch, unless someone shouts against it, I'll be happy to
push it and churn the whole copy to drm/mesa game.

Thanks
Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
