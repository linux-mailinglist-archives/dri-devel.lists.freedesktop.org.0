Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6223D0F99
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 15:36:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6FDC6EB59;
	Wed, 21 Jul 2021 13:36:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB7F46EB52
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 13:36:50 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id t6so2930985oic.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 06:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5aqtbD9FuJivGbs33TkxySBJRzBoG1BJBI4J4xEyucc=;
 b=G3UoEFuIblazyrF5o2yFYsqiyF3RJ06wFJaOGgeVx5i81Gdt5CFOJFsLj5Yd5wesnJ
 wXdDdoDlb2Ep5FFJwXvLZziAuNslWbYnAJwqkYJxVipSC94Gx/o1vv9YCm8GbkO1FYEa
 7dB9+ENlNsj9/uy4DZNkJfXgIUL1bC2Da/WzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5aqtbD9FuJivGbs33TkxySBJRzBoG1BJBI4J4xEyucc=;
 b=o7I+rdO/ciu2ocils2pO19kxIfSIy3e3mb1RgUnn906NWiM83v8wg3J58BHkKqYsff
 jj36iUArFxk99qWs065oykpk8zJ6bzRtBws26md8j6AnHcHsp35pBNUtTfOKBw53AhUJ
 nk2fJ/OaMzBGi6iLOR5vclre255foYd7osPOpvzWqP2RaUAGpYKUQ4in7Bnx9Tm96h5w
 7JRdA6n5YP6q+Y1oir98sutNZiGf5sSU8T/pdGB40xCLNqpyH0yYYXgH2OQPdOrDRyBU
 lR8FXMBwvLfTXeISlIal9yY//vWDBTUAorX8NliaQFUY8V1QZuPGksaIwY54Qx7XA34/
 L9XQ==
X-Gm-Message-State: AOAM532yIcD/xXo5KksBfvziBnEXES/OxUu6UmNetzCoTTCsabeR8tjV
 cg/CQ7rBSuaUUoOs6EDRGegy6MxxVmjQo6fRTaANig==
X-Google-Smtp-Source: ABdhPJw0XLyQGaKbAgt3m4CtXAKbGv8rlRmY38KQqj2cbZCqL8DTqpdI8s5ZVkoe+gWKzR5hummVq7cEBu+d69D49Hc=
X-Received: by 2002:aca:3085:: with SMTP id w127mr2522234oiw.101.1626874609935; 
 Wed, 21 Jul 2021 06:36:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210721092133.2817-1-christian.koenig@amd.com>
 <20210721092133.2817-2-christian.koenig@amd.com>
 <YPgKbBXpoEZFHcHE@phenom.ffwll.local>
 <a3b4026b-5133-1ed6-91d4-044d4caec604@gmail.com>
In-Reply-To: <a3b4026b-5133-1ed6-91d4-044d4caec604@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 21 Jul 2021 15:36:38 +0200
Message-ID: <CAKMK7uFyN8CESxibfyCWqZvi7QHYhXK1-=r9cP82vZAYz7DMOg@mail.gmail.com>
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

On Wed, Jul 21, 2021 at 3:18 PM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
> Am 21.07.21 um 13:52 schrieb Daniel Vetter:
> > On Wed, Jul 21, 2021 at 11:21:33AM +0200, Christian K=C3=B6nig wrote:
> >> That the caller doesn't need to keep a reference is rather
> >> risky and not defensive at all.
> >>
> >> Especially dma_buf_poll got that horrible wrong, so better
> >> remove that sentence and also clarify that the callback
> >> might be called in atomic or interrupt context.
> >>
> >> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > I'm very vary of aspirational interface docs for cross-anything, it jus=
t
> > means everyone does whatever they feel like. I think I get what you aim
> > for here, but this needs more careful wording.
>
> Yeah, I'm seeing the problems but I'm not really good at documenting
> things either.
>
> >
> >
> >> ---
> >>   drivers/dma-buf/dma-fence.c | 13 +++++--------
> >>   1 file changed, 5 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> >> index ce0f5eff575d..1e82ecd443fa 100644
> >> --- a/drivers/dma-buf/dma-fence.c
> >> +++ b/drivers/dma-buf/dma-fence.c
> >> @@ -616,20 +616,17 @@ EXPORT_SYMBOL(dma_fence_enable_sw_signaling);
> >>    * @cb: the callback to register
> >>    * @func: the function to call
> >>    *
> >> + * Add a software callback to the fence. The caller should keep a ref=
erence to
> >> + * the fence.
> > Instead of your "The caller should" what about:
> >
> > It is not required to hold rerence to @fence.
>
> I'm not sure that is a good wording since it can be misinterpreted once
> more.
>
> >   But since the fence can
> > disappear as soon as @cb has returned callers generally must hold their
> > own reference to prevent issues.
> >
> >
> > With that or something similar that explains when we must do what and n=
ot
> > vague "should" wording.
>
> Ok if you want to avoid "should" then I would rather write:
>
> The caller must make sure that there is a reference to the fence until
> the callback is called or removed.

Yeah but is that really the case? If you never remove the callback
yourself and instead just wait until the cb is called, then that
should be safe? Assuming you don't look at the fence afterwards at
all. It's just that in practice there's tons of reasons why you might
need to bail out and remove the cb, and at that point you can race and
need your own reference, or things go boom.

So there's no unconditional requirement to hold a reference.
-Daniel

> Christian.
>
> >
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >
> >> + *
> >>    * @cb will be initialized by dma_fence_add_callback(), no initializ=
ation
> >>    * by the caller is required. Any number of callbacks can be registe=
red
> >>    * to a fence, but a callback can only be registered to one fence at=
 a time.
> >>    *
> >> - * Note that the callback can be called from an atomic context.  If
> >> - * fence is already signaled, this function will return -ENOENT (and
> >> + * If fence is already signaled, this function will return -ENOENT (a=
nd
> >>    * *not* call the callback).
> >>    *
> >> - * Add a software callback to the fence. Same restrictions apply to
> >> - * refcount as it does to dma_fence_wait(), however the caller doesn'=
t need to
> >> - * keep a refcount to fence afterward dma_fence_add_callback() has re=
turned:
> >> - * when software access is enabled, the creator of the fence is requi=
red to keep
> >> - * the fence alive until after it signals with dma_fence_signal(). Th=
e callback
> >> - * itself can be called from irq context.
> >> + * Note that the callback can be called from an atomic context or irq=
 context.
> >>    *
> >>    * Returns 0 in case of success, -ENOENT if the fence is already sig=
naled
> >>    * and -EINVAL in case of error.
> >> --
> >> 2.25.1
> >>
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
