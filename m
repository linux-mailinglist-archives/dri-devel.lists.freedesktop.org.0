Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFDE19D22E
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 10:29:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8120A6E209;
	Fri,  3 Apr 2020 08:29:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FE126E1D5
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 08:29:04 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id x11so6453239otp.6
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 01:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=02Izn5NIEOgQ17Wwu9B2nDjWYnskhkbWYrLbCws9cys=;
 b=AePlV6cvRFaia2Flr22OaglBCSan4Fn1fu1TjdH+PdqjokxAikNigzQZUfp4HAtll6
 YGMdl+BcQ1Graq9IqqFvdG6d375dVL46YFsYvHdO39lzISMurfDlqYGtDvDCsUlXkMqv
 sssHVyogZ9QM32uJngkP6RMbY0sg1Hsp8mtmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=02Izn5NIEOgQ17Wwu9B2nDjWYnskhkbWYrLbCws9cys=;
 b=dSiFKxSok5ApWe7FttJZEez6zxwT2yDyCOeiR5i6gVXAMSTpUijz578IN+LjuVs8q2
 /QRepXxqz53zaRS5mCztHm3q08C/RwjkZKqFiEGGel9i7f+xIVCbOzLMDuxAD+tG9R/Z
 AJK8I76Sj48VfVnjRbRwSdyAAZaNoJUOVTjm4rgAGIV1Qx3J5JzWk9EEFFCMRxSXi0Ge
 1vjuA2DN7lliB+4vRT2bzx3GxfdYCK5Fj7l7outCg9K1/HHzcOHI0jvXxAr3yBXOP7Gn
 OlMgbSL0f31ymhngLqyb3TVQ5i1ZSQwoog+tR35otPNjYBuYNO0PXm8qy4UI1Njh2WO1
 DY6Q==
X-Gm-Message-State: AGi0PuaCxKnOFWPCDXE08l3X40Z4mFK/Em/xpWVxatqNYtRW8fb0v08g
 rn1obmULfOpyqmg1dZ/JygTDbtuBiBfXTXA51CAKnQ==
X-Google-Smtp-Source: APiQypJyeKCFnlQPk1pGtIlyDJ5aPoiQwEGi4t/hFFgGBNvUJhvcbzE54yJz9hoZgKP2mj2jINCfs30xT8u1zpxIb0w=
X-Received: by 2002:a4a:c819:: with SMTP id s25mr5852558ooq.6.1585902543776;
 Fri, 03 Apr 2020 01:29:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200402203317.GA34560@ubuntu-m2-xlarge-x86>
 <20200402215926.30714-1-chris@chris-wilson.co.uk>
 <20200403013420.GA11516@ubuntu-m2-xlarge-x86>
In-Reply-To: <20200403013420.GA11516@ubuntu-m2-xlarge-x86>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 3 Apr 2020 10:28:52 +0200
Message-ID: <CAKMK7uE9pv23edViQBC=Jy5fQV=-NQTNdk1qi91Z8shpeuL7FA@mail.gmail.com>
Subject: Re: [PATCH] drm/legacy: Fix type for drm_local_map.offset
To: Nathan Chancellor <natechancellor@gmail.com>
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 3, 2020 at 8:54 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> On Thu, Apr 02, 2020 at 10:59:26PM +0100, Chris Wilson wrote:
> > drm_local_map.offset is not only used for resource_size_t but also
> > dma_addr_t which may be of different sizes.
> >
> > Reported-by: Nathan Chancellor <natechancellor@gmail.com>
> > Fixes: 8e4ff9b56957 ("drm: Remove the dma_alloc_coherent wrapper for internal usage")
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: Dave Airlie <airlied@gmail.com>
> > Cc: Nathan Chancellor <natechancellor@gmail.com>
> > Cc: Linus Torvalds <torvalds@linux-foundation.org>
> > ---
> >  include/drm/drm_legacy.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/include/drm/drm_legacy.h b/include/drm/drm_legacy.h
> > index dcef3598f49e..aed382c17b26 100644
> > --- a/include/drm/drm_legacy.h
> > +++ b/include/drm/drm_legacy.h
> > @@ -136,7 +136,7 @@ struct drm_sg_mem {
> >   * Kernel side of a mapping
> >   */
> >  struct drm_local_map {
> > -     resource_size_t offset;  /**< Requested physical address (0 for SAREA)*/
> > +     dma_addr_t offset;       /**< Requested physical address (0 for SAREA)*/
> >       unsigned long size;      /**< Requested physical size (bytes) */
> >       enum drm_map_type type;  /**< Type of memory to map */
> >       enum drm_map_flags flags;        /**< Flags */
> > --
> > 2.20.1
> >
>
> Thanks for the quick fix!
>
> I ran it through my set of build tests and nothing else seems to have
> broken (at least not any more than it already is...).
>
> Tested-by: Nathan Chancellor <natechancellor@gmail.com> # build

This works too, missed it when replying to Linus

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Linux I guess this one is better, but like I explained it really
doesn't matter what we do with drm legacy code, it's a horror show
that should be disabled on all modern distros anyway. We just keep it
because of "never break old uapi". Maybe in a few years more ...
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
