Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7AC3992F4
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 20:57:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17DDE6EDF6;
	Wed,  2 Jun 2021 18:57:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CE6A6EDF4
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 18:57:14 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 c31-20020a056830349fb02903a5bfa6138bso3390553otu.7
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 11:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DUMfivhVs39RWD9wbM4YeN4uJSv83VCUPBJGHjzj9MA=;
 b=cD19riI7ex0LEM/TS2fNESRC6SoVoIiB7zjRq660rtF2/uO8+upcuq2WOQgb0khrbU
 O3GBnKFe/sUP5hXxdfjMrBuaXb7HBsnbQ+pB9zjcjikNzgd925qELN9bErGpmtPgxywf
 OICGwI6NKg1tfFMSYwANFRpeVMKuxx1KJJyAQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DUMfivhVs39RWD9wbM4YeN4uJSv83VCUPBJGHjzj9MA=;
 b=DIP/830tC7Xm1rXwDqPi0Z6OpQRwoz15Ue1Grv8aZe8cC4LAc6oIYkDKeHcnJmtPSE
 624LwPRcLmtCJPFsv3aZ90XMVEqLMfC7HILC3qxZXB5ZR8i2jK4Pp+5GkBZyCy1fbnsg
 O+9hE8oKAM4AK9F3Esl6lD5ykzZLPhdubK0yQav26z+mgRfhyRcon9OFsDdhAqGKkef6
 8l/xOu0nsVKx/V18C8nY6aDv8cO21LUkncjdqelSIodYY2GtWi4f4GGiUj2r0KRDnWIT
 m3oBB55XWvqOjyYuZpFHdhrebPjAbWtoWJTgTc/Qr45BF+33CJs7KlHziJPNWicbhhv/
 b3ZQ==
X-Gm-Message-State: AOAM530WTC6aXDBK5ARNu5SeEPP1/NMMJ8DqgE67onhnuVrWKEVXvua1
 h7zeQd/BvW1n3JxpJYPZ36Dtgp/oYElvDdi9usx1I1bm4s4=
X-Google-Smtp-Source: ABdhPJwZ+ppkfviLb32tBhF+dK1B80dh3UYuX6QSc9NHT+jWfkZpImuNXGhgUqUHqDcPkpXAW32TZ4efxYaCAuyd9uI=
X-Received: by 2002:a9d:27a4:: with SMTP id c33mr26320854otb.281.1622660233643; 
 Wed, 02 Jun 2021 11:57:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <de3965d8-d997-5685-0399-646d8823a27f@linux.intel.com>
 <20210525164504.GA9971@sdutt-i7>
 <d76ab0ec-4f0c-19ed-adaa-ed227af63c0e@linux.intel.com>
In-Reply-To: <d76ab0ec-4f0c-19ed-adaa-ed227af63c0e@linux.intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 2 Jun 2021 20:57:02 +0200
Message-ID: <CAKMK7uHT2mPTyX9QiTBFP2Lt28vV3JcJLPAx_hMdTtyLJ=DZ2g@mail.gmail.com>
Subject: Re: [Intel-gfx] [RFC PATCH 00/97] Basic GuC submission support in the
 i915
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Jason Ekstrand <jason.ekstrand@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 2, 2021 at 5:27 PM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
> On 25/05/2021 17:45, Matthew Brost wrote:
> > On Tue, May 25, 2021 at 11:32:26AM +0100, Tvrtko Ursulin wrote:
> >>   * Context pinning code with it's magical two adds, subtract and cmpxchg is
> >> dodgy as well.
> >
> > Daniele tried to remove this and it proved quite difficult + created
> > even more races in the backend code. This was prior to the pre-pin and
> > post-unpin code which makes this even more difficult to fix as I believe
> > these functions would need to be removed first. Not saying we can't
> > revisit this someday but I personally really like it - it is a clever
> > way to avoid reentering the pin / unpin code while asynchronous things
> > are happening rather than some complex locking scheme. Lastly, this code
> > has proved incredibly stable as I don't think we've had to fix a single
> > thing in this area since we've been using this code internally.
>
> Pretty much same as above. The code like:
>
> static inline void __intel_context_unpin(struct intel_context *ce)
> {
>         if (!ce->ops->sched_disable) {
>                 __intel_context_do_unpin(ce, 1);
>         } else {
>                 while (!atomic_add_unless(&ce->pin_count, -1, 1)) {
>                         if (atomic_cmpxchg(&ce->pin_count, 1, 2) == 1) {
>                                 ce->ops->sched_disable(ce);
>                                 break;
>                         }
>                 }
>         }
> }
>
> That's pretty much impenetrable for me and the only thing I can think of
> here is **ALARM** must be broken! See what others think..

pin_count is a hand-rolled mutex, except not actually a real one, and
it's absolutely hiliarous in it's various incarnations (there's one
each on i915_vm, vma, obj and probably a few more).

Not the worst one I've seen by far in the code we've merged already.
Minimally this needs a comment here and in the struct next to
@pin_count to explain where all this is abused, which would already
make it better than most of the in-tree ones.

As part of the ttm conversion we have a plan to sunset the "pin_count
as a lock" stuff, depending how bad that goes we might need to split
up the task for each struct that has such a pin_count.

-Daniel
--
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
