Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D2030FCDE
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 20:34:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99F626EE34;
	Thu,  4 Feb 2021 19:34:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAD016E104
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 18:17:46 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id i5so5360851edu.10
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Feb 2021 10:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lagfreegames.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KKftp13XvAi48Eq3Vr8fDGcXnI9gPzqzJmwQ7Qw95tQ=;
 b=hCT40DBmgljW7bClGXlFLBqO/VmCBam3uHnGMuchAjhNyvAxLu1OFUlFrL5cuzDf5p
 S2VTtpSZe8IeCPtpQZjtJi7tgD6PX4zThoPexkGu8u14zQRDb1kneX1uQ3zTncsEfz3f
 GPYmhQ2/KhabkevaIG5Ithn2uI1q7SIMYLys92kD3b51Iv7AEXqccWaiIq3NOhx43Gdu
 0kTO4uZn4yr74QKgxUzKspLsvG5o0RnZO8TvukByKWAMn9vPvkOEII1HlfX3uUd8Zyww
 g5stzP8RCD+7xlzz4JZdMNNU0KDr0Tc/iZINX3cfGXZCkww9rKpQZ/XlddJitTLrvPlD
 XG7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KKftp13XvAi48Eq3Vr8fDGcXnI9gPzqzJmwQ7Qw95tQ=;
 b=W8ZJrrIM9GqAejLdKPpcXWzk5O2EOLOxDGBn7HYg5lkQSn1G/qqH1JgNIay2r97QVt
 E3mVK+92RUUw8ghVnPLtbEYZdkXm3xuA74hDi53DfDkHN5spGn/JdJEipU2lp5ZfHaw+
 NW+/3Me4olG5bXQ5sGdVbcBhCHq5xietYjzy6N5Vb2MCsfH1Lx6FrToXOJ72ALIEs1zQ
 f9YQOH5xQWYqgXyskjhNv7KmW+uAAyzzftYZr/7sa7eZtUNGoANQrX3h4y2jaUafGjnu
 RZa/VXaqGMwrG916+wXkMGN5XIuRYmKtI2mI1l8VTEnwHu56Rhi6e1yZMnQbIYXZ0DMd
 GG/g==
X-Gm-Message-State: AOAM532G+aTSRQ5aPuHpMLqZlJ1pph8mt9jjMk7MyEGUCj4oR4wMdnO7
 /j69rh8+iWl/CTFj2FRobxCjt6eC0/qAXDv2m4Qw2w==
X-Google-Smtp-Source: ABdhPJy1IEuTYWr0iYBOMD/uEQgvtbBVrv469qYoaEkSdo+xjvLNK9MBAMUlNFhWniiCAel8s5Vz5JXY2NP43TdvBkk=
X-Received: by 2002:aa7:cc98:: with SMTP id p24mr272148edt.126.1612462665057; 
 Thu, 04 Feb 2021 10:17:45 -0800 (PST)
MIME-Version: 1.0
References: <20210204113742.1814456-1-emil.l.velikov@gmail.com>
 <CABjik9cHYArtsTgYvcGbH_AOEcdVWpX-pTrHMq4uv7ct4_NSKQ@mail.gmail.com>
In-Reply-To: <CABjik9cHYArtsTgYvcGbH_AOEcdVWpX-pTrHMq4uv7ct4_NSKQ@mail.gmail.com>
From: James Park <james.park@lagfreegames.com>
Date: Thu, 4 Feb 2021 10:17:33 -0800
Message-ID: <CABjik9dnH0dQ2Am-nfPUstF8Uv7dSixcCZ7pN7yLWNQ4QgTaAg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/fourcc: introduce DRM_FOURCC_STANDALONE guard
To: Emil Velikov <emil.l.velikov@gmail.com>
X-Mailman-Approved-At: Thu, 04 Feb 2021 19:34:32 +0000
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

On Thu, Feb 4, 2021 at 9:37 AM James Park <james.park@lagfreegames.com> wrote:
>
> On Thu, Feb 4, 2021 at 3:37 AM Emil Velikov <emil.l.velikov@gmail.com> wrote:
> >
> > Currently, the drm_fourcc.h header depends on drm.h for __u32 and __u64.
> > At the same time drm.h pulls a lot of unneeded symbols.
> >
> > Add new guard DRM_FOURCC_STANDALONE, which when set will use local
> > declaration of said symbols.
> >
> > When used on linux - we pull linux/types.h which is used either way.
> > On other platforms, BSDs et al, we need a couple of typedefs.
> >
> > Since those can trigger a warning in some corner-cases*, add some GCC
> > magic to silence them. Note that incorrect type redefinitions will still
> > be flagged, and the GCC pragma is ignored by other compilers.
> >
> > *Corner-case:
> > If one sets DRM_FOURCC_STANDALONE and compiles with C99 or earlier while
> > also using -pedantic _and_ the header lives outside of the standard
> > /usr/include (like BSDs normally do).
> >
> > v2:
> >  - Add corner-case handling, based on popular demand.
> >
> > Cc: James Park <james.park@lagfreegames.com>
> > Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> > Cc: Simon Ser <contact@emersion.fr>
> > Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
> > ---
> >  include/uapi/drm/drm.h        | 10 ++++++++++
> >  include/uapi/drm/drm_fourcc.h | 29 +++++++++++++++++++++++++++++
> >  2 files changed, 39 insertions(+)
> >
> > diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> > index 808b48a93330..cd78950e05ce 100644
> > --- a/include/uapi/drm/drm.h
> > +++ b/include/uapi/drm/drm.h
> > @@ -53,6 +53,15 @@ typedef unsigned int drm_handle_t;
> >  #include <stdint.h>
> >  #include <sys/ioccom.h>
> >  #include <sys/types.h>
> > +
> > +/*
> > + * When using C99 -pedantic the typedefs will trigger a warning.
> > + * If the header is considered a system one (-isystem) those will be
> > + * ignored, yet on the target platforms BSDs, et al - the headers live
> > + * in a non-system location.
> > + */
> > +#pragma GCC diagnostic push
> > +#pragma GCC diagnostic ignored "-Wpedantic"
> >  typedef int8_t   __s8;
> >  typedef uint8_t  __u8;
> >  typedef int16_t  __s16;
> > @@ -63,6 +72,7 @@ typedef int64_t  __s64;
> >  typedef uint64_t __u64;
> >  typedef size_t   __kernel_size_t;
> >  typedef unsigned long drm_handle_t;
> > +#pragma GCC diagnostic pop
> >
> >  #endif
> >
> > diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> > index 6f0628eb13a6..84a1f96cc4ef 100644
> > --- a/include/uapi/drm/drm_fourcc.h
> > +++ b/include/uapi/drm/drm_fourcc.h
> > @@ -24,7 +24,36 @@
> >  #ifndef DRM_FOURCC_H
> >  #define DRM_FOURCC_H
> >
> > +/*
> > + * Define DRM_FOURCC_STANDALONE you're interested only FOURCC and do not want
> > + * to pull drm.h into your application.
> > + */
> > +#ifdef DRM_FOURCC_STANDALONE
> > +#if defined(__linux__)
> > +
> > +#include <linux/types.h>
> > +
> > +#else /* One of the BSDs */
> > +
> > +#include <stdint.h>
> > +
> > +/*
> > + * When using C99 -pedantic the typedefs will trigger a warning.
> > + * If the header is considered a system one (-isystem) those will be
> > + * ignored, yet on the target platforms BSDs, et al - the headers live
> > + * in a non-system location.
> > + */
> > +#pragma GCC diagnostic push
> > +#pragma GCC diagnostic ignored "-Wpedantic"
> > +typedef uint32_t __u32;
> > +typedef uint64_t __u64;
> > +#pragma GCC diagnostic pop
> > +
> > +#endif /* __linux __ */
> > +
> > +#else
> >  #include "drm.h"
> > +#endif /* DRM_FOURCC_STANDALONE */
> >
> >  #if defined(__cplusplus)
> >  extern "C" {
> > --
> > 2.30.0
> >
>
> I remember reading GCC diagnostic push/pop requires a recent enough
> compiler version to be supported, which is pretty old, but I don't
> know how old is old enough for Linux headers:
> https://github.com/protocolbuffers/protobuf/issues/4156
>
> Testing snippets in godbolt, I think the pragmas need to be wrapped. MSVC says:
>
> warning C4068: unknown pragma 'GCC'
>
> Also, Clang seems to want -Wtypedef-redefinition, not -Wpedantic. GCC
> complains it doesn't know what -Wtypedef-redefinition is, so that
> would also need to be wrapped.

If we're already conceding copy/paste, then how about inlining my
previous header?

#ifndef DRM_BASIC_TYPES_DEFINED
#define DRM_BASIC_TYPES_DEFINED
// Sync modifications between drm.h and drm_fourcc.h
...
#endif

No compiler games. Valid on all flavors of C (I think).
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
