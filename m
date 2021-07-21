Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D36C3D1188
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 16:37:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EFB76E81F;
	Wed, 21 Jul 2021 14:37:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 980DA6E81F
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 14:37:54 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 t4-20020a05683014c4b02904cd671b911bso2266802otq.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 07:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hd6ACahtsvqqaLo5dUxhqjUKzWwJpWcqjDQa5IiaKQc=;
 b=h2F8USXHD2JRB+MsGAbR7FqC/yl2H0onOM/GdSx2Dy/2fx+0yJx/NQcmeXI2f0VTV9
 4jt7BaCxxQX01A82cyi0JqBnSVb4ppS6Mj1turISLjmTZUeMR+KjoJhl7lXWtkiOjHhv
 f6Q9PCGEmuVdqsn/9v5e0Sle8ACdusglWkCyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hd6ACahtsvqqaLo5dUxhqjUKzWwJpWcqjDQa5IiaKQc=;
 b=uLvouW64wCHkGkkvaabxgwjGcjEqGLjkonEeWGaX+73o4Nl6Z98hCjEFypjRB5JyJs
 +xpzt/GKdVHtmBQ2doNZFR51//rCBbgKmgOEan6jERcwYDbE8O68kFPpdyUzk5UBDj7g
 hbZdWXrZpa0ULWLWox5Kvxh01Hes8uU+lQmzZKs5RvWFHN103qyqmdgUKd5+FcJdduyb
 OMMZev/OlWjdPbkzcvwY+ow95AXU2aRFNhWDQ8SnbpiFt5c9vShxJxbKQt72VQtI+Xl4
 ObeHeoi/YpxSXBJuziP0MFYv2U2qZi4OY2N5+sI/s1j8BQinj7qY0uf1IMO44z4/TzpU
 4vXQ==
X-Gm-Message-State: AOAM532IsA+edilLmZ9YdGVb98a+5L1gC8QcgbRUCBQa+Oc2WUSlJwyF
 liPpfhLeBe4VKlf5J+mDim3QN0N4dPJU+Udbb4hOBAe2Qok=
X-Google-Smtp-Source: ABdhPJw4kWNjcjvaMA+iXYElp8MUaABeOJyXeqoyS4cfWy/q4+VRhlVAfNlq9x5YqhubnGJpiUR75TCUkKTgcyavmZs=
X-Received: by 2002:a05:6830:2802:: with SMTP id
 w2mr25127547otu.303.1626878273918; 
 Wed, 21 Jul 2021 07:37:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210721092133.2817-1-christian.koenig@amd.com>
 <20210721092133.2817-2-christian.koenig@amd.com>
 <YPgKbBXpoEZFHcHE@phenom.ffwll.local>
 <a3b4026b-5133-1ed6-91d4-044d4caec604@gmail.com>
 <CAKMK7uFyN8CESxibfyCWqZvi7QHYhXK1-=r9cP82vZAYz7DMOg@mail.gmail.com>
 <0b9d79c9-69e3-1270-11eb-380e5c2f8ff9@gmail.com>
In-Reply-To: <0b9d79c9-69e3-1270-11eb-380e5c2f8ff9@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 21 Jul 2021 16:37:42 +0200
Message-ID: <CAKMK7uGHrZqtfnMBcqvsnXeg=CF=-KQOVTQzXnFLXuGEV6kWVw@mail.gmail.com>
Subject: Re: [PATCH 2/2] dma-buf: clarify dma_fence_add_callback documentation
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 21, 2021 at 3:57 PM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
> Am 21.07.21 um 15:36 schrieb Daniel Vetter:
> > On Wed, Jul 21, 2021 at 3:18 PM Christian K=C3=B6nig
> > <ckoenig.leichtzumerken@gmail.com> wrote:
> >> Am 21.07.21 um 13:52 schrieb Daniel Vetter:
> >>> On Wed, Jul 21, 2021 at 11:21:33AM +0200, Christian K=C3=B6nig wrote:
> >>>> That the caller doesn't need to keep a reference is rather
> >>>> risky and not defensive at all.
> >>>>
> >>>> Especially dma_buf_poll got that horrible wrong, so better
> >>>> remove that sentence and also clarify that the callback
> >>>> might be called in atomic or interrupt context.
> >>>>
> >>>> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >>> I'm very vary of aspirational interface docs for cross-anything, it j=
ust
> >>> means everyone does whatever they feel like. I think I get what you a=
im
> >>> for here, but this needs more careful wording.
> >> Yeah, I'm seeing the problems but I'm not really good at documenting
> >> things either.
> >>
> >>>
> >>>> ---
> >>>>    drivers/dma-buf/dma-fence.c | 13 +++++--------
> >>>>    1 file changed, 5 insertions(+), 8 deletions(-)
> >>>>
> >>>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence=
.c
> >>>> index ce0f5eff575d..1e82ecd443fa 100644
> >>>> --- a/drivers/dma-buf/dma-fence.c
> >>>> +++ b/drivers/dma-buf/dma-fence.c
> >>>> @@ -616,20 +616,17 @@ EXPORT_SYMBOL(dma_fence_enable_sw_signaling);
> >>>>     * @cb: the callback to register
> >>>>     * @func: the function to call
> >>>>     *
> >>>> + * Add a software callback to the fence. The caller should keep a r=
eference to
> >>>> + * the fence.
> >>> Instead of your "The caller should" what about:
> >>>
> >>> It is not required to hold rerence to @fence.
> >> I'm not sure that is a good wording since it can be misinterpreted onc=
e
> >> more.
> >>
> >>>    But since the fence can
> >>> disappear as soon as @cb has returned callers generally must hold the=
ir
> >>> own reference to prevent issues.
> >>>
> >>>
> >>> With that or something similar that explains when we must do what and=
 not
> >>> vague "should" wording.
> >> Ok if you want to avoid "should" then I would rather write:
> >>
> >> The caller must make sure that there is a reference to the fence until
> >> the callback is called or removed.
> > Yeah but is that really the case? If you never remove the callback
> > yourself and instead just wait until the cb is called, then that
> > should be safe? Assuming you don't look at the fence afterwards at
> > all. It's just that in practice there's tons of reasons why you might
> > need to bail out and remove the cb, and at that point you can race and
> > need your own reference, or things go boom.
> >
> > So there's no unconditional requirement to hold a reference.
>
> Yeah and exactly because of this I want to document that you *must* keep
> a reference around because people tend to get this stuff wrong if you
> are not strict about it and it works in some cases but not others.

Well I think docs should explain why/when you must hold a reference,
like "must hold a reference if", but also explain that the call itself
doesn't really require it's own reference that you need to drop in the
callback. Hence the distinction of what's strictly needed, and what's
needed in most practical cases.
-Daniel

> Christian.
>
> > -Daniel
> >
> >> Christian.
> >>
> >>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >>>
> >>>> + *
> >>>>     * @cb will be initialized by dma_fence_add_callback(), no initia=
lization
> >>>>     * by the caller is required. Any number of callbacks can be regi=
stered
> >>>>     * to a fence, but a callback can only be registered to one fence=
 at a time.
> >>>>     *
> >>>> - * Note that the callback can be called from an atomic context.  If
> >>>> - * fence is already signaled, this function will return -ENOENT (an=
d
> >>>> + * If fence is already signaled, this function will return -ENOENT =
(and
> >>>>     * *not* call the callback).
> >>>>     *
> >>>> - * Add a software callback to the fence. Same restrictions apply to
> >>>> - * refcount as it does to dma_fence_wait(), however the caller does=
n't need to
> >>>> - * keep a refcount to fence afterward dma_fence_add_callback() has =
returned:
> >>>> - * when software access is enabled, the creator of the fence is req=
uired to keep
> >>>> - * the fence alive until after it signals with dma_fence_signal(). =
The callback
> >>>> - * itself can be called from irq context.
> >>>> + * Note that the callback can be called from an atomic context or i=
rq context.
> >>>>     *
> >>>>     * Returns 0 in case of success, -ENOENT if the fence is already =
signaled
> >>>>     * and -EINVAL in case of error.
> >>>> --
> >>>> 2.25.1
> >>>>
> >
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
