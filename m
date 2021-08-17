Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6F43EF0D3
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 19:22:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 385796E209;
	Tue, 17 Aug 2021 17:22:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 162EE6E214
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 17:22:02 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id m193so40782604ybf.9
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 10:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MK/QxqfBnnzR5w4gzxaF3A7eJ7fYnfOVQef0Qv4vMFM=;
 b=K85KiW1DrgkfU8+N446cJ576SVCUdPYLdz+bHcQi0aWZNPtd4OHZfJBX75qapTzLFc
 j+3x5L+lWL9lojf/RPEkU/66IRavAlVEIkZHSpHaQ8ylgc0eZM/LyI0iXbHuNY47Eh/Z
 qCA/kNs3Ykw7EGhROB2v63WtT+tZofMw4fbxLh+f6PIWkFMDRYIaFVqDTxObXqgLI5M0
 XW4FhgR6vBumklQIDUGFBlZpSBDvC+sKTN1kDwkqW9yREGxfHzD0l+r00GouW+pikcio
 7qJThrFtLJZhdso6T6TLX/jjTUJP1CKbh/7/dOvYQkJCJ1B/pNZlbXHAKTVhe8pT9kRc
 +rMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MK/QxqfBnnzR5w4gzxaF3A7eJ7fYnfOVQef0Qv4vMFM=;
 b=K+GC+IGkPAPB6WchywqEgl6PLXKmzOENzRCnf5BzUTODxuD+nlLsvYnbiaff1BCgSb
 yKY44mY8toNnVolx5xREJHf9Z8KgUAANQPgDlox0Kf/Y4ZKjzDUhR+azqYBxgva2g5nQ
 ji5mFAF3NINFIeaWLh/CPyVgMi4zbrCOahDzITRqCvaVohZGCOa1iljf2tPw9k/Z5T/D
 0m/FDgxGEsbWtlWxv5XV6mB4xSF0b4BcoyXHHhCYGN+cv6UrqNJ5udmv1S6369UE5tLX
 UhxmsNgLxos3TGJTHgna+JxxyD5SLh1aNVHzWNkchHNwoAn/ReA7qdXDJSd3r5grzizr
 Iptw==
X-Gm-Message-State: AOAM531/nPBzCd4GOVB5LTWjRaAZfFlk8/ab3vITDNxXG9PBNL7uF0/H
 qUGmZYnDdH8VxrVcc5hCf7A4265SujdxJxtsOK/D0A==
X-Google-Smtp-Source: ABdhPJwQ2inSYxJnZmFCYOoajSdCi3/qKrJ1/PX8OepwsrwyPBEppjmE00Jf3Nvg4+dSwM5BioczpZXhjNbB/pahTfM=
X-Received: by 2002:a25:ce01:: with SMTP id x1mr5944223ybe.432.1629220921071; 
 Tue, 17 Aug 2021 10:22:01 -0700 (PDT)
MIME-Version: 1.0
References: <1606816916-3724-1-git-send-email-jpark37@lagfreegames.com>
 <CAKMK7uHi+y-=4BeVxt6362Fu79mBsB7LzmVqCqax_-JO0rUQCg@mail.gmail.com>
 <CABjik9dirbf13ZiVBvufitGJXja6Xvn=EqTG_VtvBHjaAwJATg@mail.gmail.com>
 <20201207105109.599273be@eldfell>
 <CABjik9c+TVMK3685bkYp43PbqxoAosTxXEeQvH6hmfBD0YSz6A@mail.gmail.com>
 <20201207123514.65e4b868@eldfell> <20201207124454.42b87186@eldfell>
 <EdWYHKD3WXh4_hWSW633I_O9leJ7ib3vLux7KuDhdcl-3vhSphWQnDALaATh_HVU97nzVuDWf5j4pp1d9tnHCelC7ogUjBcqxzW7Z_erfIs=@emersion.fr>
 <CABjik9cd_NWOSH79Y1x7Hj5iW6nqoP44XrNSDr+o5am07Suzbg@mail.gmail.com>
 <CE57r-xvcKbKT0LCtCjasef7m8hy4jgYOsQ5_ntH16VGrzEFksPwVs2wL-gBdWHAhYrIDhXF2WmNIHvGd3bWhkqtUJvAakLI7vcgForuxM4=@emersion.fr>
 <20201207131401.3cf41501@eldfell>
 <CABjik9fzC1gapjz7usrBM0jR0KDq_7wpMxMAvEm1OtmpjYO93g@mail.gmail.com>
In-Reply-To: <CABjik9fzC1gapjz7usrBM0jR0KDq_7wpMxMAvEm1OtmpjYO93g@mail.gmail.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Tue, 17 Aug 2021 12:21:50 -0500
Message-ID: <CAOFGe97YiQkr5ss2TL1rz_AJ37ag27Hj9Yo+aBT4L-GDC2tEiA@mail.gmail.com>
Subject: Re: [PATCH] drm: Fix drm.h uapi header for Windows
To: James Park <james.park@lagfreegames.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>, 
 James Park <jpark37@lagfreegames.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I'd really like this for Mesa so we can pull drm_fourcc.h into common
WSI code.  Why has it stalled?

--Jason

On Tue, Dec 8, 2020 at 2:33 AM James Park <james.park@lagfreegames.com> wrote:
>
> I updated the patch earlier today incorporating the suggestions. I also had to bring back "#include <linux/types.h>" to drm.h because there's some sanity check that fails, as if it doesn't scan past the first level of #includes..
>
> - James
>
> On Mon, Dec 7, 2020 at 3:14 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>>
>> On Mon, 07 Dec 2020 10:53:49 +0000
>> Simon Ser <contact@emersion.fr> wrote:
>>
>> > On Monday, December 7th, 2020 at 11:49 AM, James Park <james.park@lagfreegames.com> wrote:
>> >
>> > > That would work, but that's kind of an annoying requirement. I would
>> > > prefer the header to be self-sufficient.
>> >
>> > I don't want to make it more confusing than before, but here Pekka (I
>> > think) suggests to replace this:
>> >
>> > diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
>> > index 82f3278..5eb07a5 100644
>> > --- a/include/uapi/drm/drm_fourcc.h
>> > +++ b/include/uapi/drm/drm_fourcc.h
>> > @@ -24,7 +24,11 @@
>> >  #ifndef DRM_FOURCC_H
>> >  #define DRM_FOURCC_H
>> >
>> > +#ifdef DRM_FOURCC_STANDALONE
>> > +#include "drm_basic_types.h"
>> > +#else
>> >  #include "drm.h"
>> > +#endif
>> >
>> >  #if defined(__cplusplus)
>> >  extern "C" {
>> >
>> > With this:
>> >
>> > diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
>> > index 82f3278..5eb07a5 100644
>> > --- a/include/uapi/drm/drm_fourcc.h
>> > +++ b/include/uapi/drm/drm_fourcc.h
>> > @@ -24,7 +24,11 @@
>> >  #ifndef DRM_FOURCC_H
>> >  #define DRM_FOURCC_H
>> >
>> > +#include "drm_basic_types.h"
>> > +
>> > +#ifndef DRM_FOURCC_STANDALONE
>> >  #include "drm.h"
>> > +#endif
>> >
>> >  #if defined(__cplusplus)
>> >  extern "C" {
>> >
>> > That wouldn't change whether the header is self-sufficient or not,
>> > would it?
>>
>> Exactly this.
>>
>> This communicates properly that DRM_FOURCC_STANDALONE only affects
>> whether drm.h gets pulled in or not, and there are no other effects.
>>
>> This also makes testing better: when you unconditionally include
>> drm_basic_types.h, you are more likely to catch breakage there.
>>
>> For functionality, it makes no difference. Whether userspace does
>>
>> #include "drm.h"
>> #define DRM_FOURCC_STANDALONE
>> #include "drm_fourcc.h"
>>
>> or
>>
>> #define DRM_FOURCC_STANDALONE
>> #include "drm_fourcc.h"
>> #include "drm.h"
>>
>> the result must always be good.
>>
>>
>> Thanks,
>> pq
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
