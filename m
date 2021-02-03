Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE6230D08C
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 01:57:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C8CA89A16;
	Wed,  3 Feb 2021 00:57:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com
 [IPv6:2607:f8b0:4864:20::a32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7C3989A16
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 00:57:01 +0000 (UTC)
Received: by mail-vk1-xa32.google.com with SMTP id m145so5259481vke.7
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Feb 2021 16:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x/71QkziMyjUFnEb9c1WNa159pw3wyZpqixpDJ2yx00=;
 b=WBfBte96JmNY96+s2o+4Fh46Aj/sV3PBPILySG/4betGrPYsnFp10M1A5I8twdMUZ5
 80++0p7Xc0oDA2UkIu+LF3P9TP2ooXOzP3qoHm1vZRaVqqeqS+lcYv1pjAeBzrf++wdH
 ORfjeH6y2MaWsrZG5ALKfoo3mTfQdXZNfN4HL/QZl6BkjgDaSW7Qosm9DsXgY6au+BOe
 h4Svsmtz8r5F89cIMEQCzZyFMKEs5SlYsZHb3ZBaG9lR1pEiUDMFoa7sPkY36NEw9/Pb
 qx72KbEsEcYWNmrmv0OwxVUdARp0ZesNVsxaVreqmnb/nm2dJ0phxxB+HRPuoqUZDFpH
 NdQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x/71QkziMyjUFnEb9c1WNa159pw3wyZpqixpDJ2yx00=;
 b=LbJ0ffVdQacWr5Srova8oYoGVXfG4UmWNOfNm2tu1B7+7u7LsO6VvB7seKGoCC4wmG
 B9kJ+/NzDvC/JfOgwi6VJMVR6BHIjTs72lLKl55FMol01DUjyNIbHMn1LWs7pnQL2mZ5
 XBvfXFKpZexAuBoguMBmHd22JRP1G0vYc7/wI3nmXRG+UDBEcV7Tyce2LXdxKJsomsmM
 IbRogp0dDgJOyJR25FSZ6AuE/KrryB0mGu3lPlMDomBuZK6vZL1HuyjxmThjZTziuM8c
 sCSfmcKW2yVn2LZq0/WxEpX3bLMlh01HJCp5Atx4aM9WVgIFTfFupR3QY2xOZlF5BxH+
 H1sQ==
X-Gm-Message-State: AOAM533CDDrV1mRW3uCqnKQhyS4af5lPzVTQZzFyn9RIB3AsAH+CTB2z
 /HKi4COyuX2WOQ8vUxBIOHFlyfJVybzsMbBPVA0=
X-Google-Smtp-Source: ABdhPJx5RnVN1RRUI+NkuhHs7H/GKqe3ICrOSC1hph8ClgZ/nt9RpgpSKsxlacc0/S33kKn0jZQ6Br+mBw4282D9FD4=
X-Received: by 2002:a1f:e885:: with SMTP id f127mr287276vkh.8.1612313821034;
 Tue, 02 Feb 2021 16:57:01 -0800 (PST)
MIME-Version: 1.0
References: <20210202224704.2794318-1-emil.l.velikov@gmail.com>
 <CABjik9dde-HCWBsfwxjD+jTKaoy-YxDeSObmH7X5rSzNHoA_qA@mail.gmail.com>
In-Reply-To: <CABjik9dde-HCWBsfwxjD+jTKaoy-YxDeSObmH7X5rSzNHoA_qA@mail.gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 3 Feb 2021 00:56:49 +0000
Message-ID: <CACvgo53wJ2XrLRBy4ysOBfU5TFo7nBwDS_CyrPkB1rotJXW5Nw@mail.gmail.com>
Subject: Re: [PATCH] drm/fourcc: introduce DRM_FOURCC_STANDALONE guard
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

On Tue, 2 Feb 2021 at 23:25, James Park <james.park@lagfreegames.com> wrote:
>
> On Tue, Feb 2, 2021 at 2:47 PM Emil Velikov <emil.l.velikov@gmail.com> wrote:
> >
> > Currently, the drm_fourcc.h header depends on drm.h for __u32 and __u64.
> > At the same time drm.h pulls a lot of unneeded symbols.
> >
> > Add new guard DRM_FOURCC_STANDALONE, which when set will use local
> > declaration of said symbols.
> >
> > When used on linux - this is a trivial but only when building in strict c99
> > mode. One is welcome to ignore the warning, silence it or use c11. If neither
> > of the three is an option, then do _not_  set the new guard.
> >
> > Cc: James Park <james.park@lagfreegames.com>
> > Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> > Cc: Simon Ser <contact@emersion.fr>
> > Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
> > ---
> > As mentioned before - there's little point in having yet another header
> > since keeping those in sync has been a PITA in the past.
> > ---
> >  include/uapi/drm/drm_fourcc.h | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> > index 6f0628eb13a6..c1522902f6c9 100644
> > --- a/include/uapi/drm/drm_fourcc.h
> > +++ b/include/uapi/drm/drm_fourcc.h
> > @@ -24,7 +24,26 @@
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
> > +typedef uint32_t __u32;
> > +typedef uint64_t __u64;
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
> One of my earlier solutions similarly would have forced people to deal
> with duplicate typedefs, and we arrived at the current solution
> because we didn't want to burden anyone with that.

As summed in the commit message the burden is only applicable when all
of the following are set:
 - non-linux
 - force DRM_FOURCC_STANDALONE
 - c99 -pedantic

Even then, we're talking about a compilation warning. So yeah - let's
keep things short and sweet.

Side note: AFAICT MSVC will not trigger a warning so your logs should be clean.

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
