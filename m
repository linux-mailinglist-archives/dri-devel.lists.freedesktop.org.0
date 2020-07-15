Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0579220FBF
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jul 2020 16:46:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0FB26EB76;
	Wed, 15 Jul 2020 14:46:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8679A6EB76
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jul 2020 14:46:21 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id j11so2359977oiw.12
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jul 2020 07:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CagZzgMrU4eCZIriE5QO01v+DjsMk01y7RGm/HUhEd0=;
 b=MQF1ph7cNa7whGx+wTgkb3HICiePnbOJBnNb6phhgza8AmnLi2VLmKpKwskIXzV4R5
 JPjHAGDozZxBNxgoIPNWWxS+pG6oesOWcpAYvSufpGKzWGIfOofP3C9hQeS1XrKk5jvO
 MjfH/Ti1LU9oiFqjhIupEaqOATfgSUY92AR8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CagZzgMrU4eCZIriE5QO01v+DjsMk01y7RGm/HUhEd0=;
 b=BgOoYJSq83rGNuAfWVIV5cpIvui+35APvoYSOvCejzC94LjaoWwO3970dlCWHZIGGB
 G5Zw65P8NQGViAE4Pqb8OnbNPN06wYujkPqee6nsP1VJGFkeHvx+ExdTDef0XwldhcX6
 2KmZU9ZDPXXRNigrbuhZy2qAjMxxBkCGvBQuHihvV6xdwTuSuBXtzBelX+AQm22hBmVC
 r+bkPrlDWgTxilQhAnk6JR1AYYeGVOhBivtJwb+EB2hSMo6Mb1h+0ygTJ07mVPvcDp3q
 JsyMQtIiHHmSyUvw2V58p8nHKVvQTnCNMGzN1ddHkjybK7OWGtzQjg9NyFtxyPgiQjWU
 JTHA==
X-Gm-Message-State: AOAM530PeI7zQTbMacBcHfVhMqO4TF4YUSFEqvQDfpPsUqguG1ZnlH8F
 SLNZfEkEka77g2Xe9DwDYv94IwubruvCeVO0etiqiQ==
X-Google-Smtp-Source: ABdhPJwrHCH3VMAzjfmjULjN/sMVoDywmNXdrYOtDdbIgNi7to3qvY54405EIQrUkD89Ng3Y4lHUJQMjmYD75lQ7tZg=
X-Received: by 2002:aca:da03:: with SMTP id r3mr91545oig.14.1594824380757;
 Wed, 15 Jul 2020 07:46:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200715104905.11006-1-chris@chris-wilson.co.uk>
 <20200715104905.11006-2-chris@chris-wilson.co.uk>
 <20200715121022.GK3278063@phenom.ffwll.local>
 <159481570397.13728.7155187046112827709@build.alporthouse.com>
 <159481680826.13728.12654400528941223194@build.alporthouse.com>
 <CAKMK7uGtGkYnq+Fe1jD7t315OOgRCiZhqvpTjoOLuYhuV3Qy3A@mail.gmail.com>
 <159482387319.13728.9618623288194653161@build.alporthouse.com>
In-Reply-To: <159482387319.13728.9618623288194653161@build.alporthouse.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 15 Jul 2020 16:46:09 +0200
Message-ID: <CAKMK7uEPZDjZGe_5prz+6my8vzTMK1yLzD-VYHS0ri576tfsDw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 2/2] dma-buf/dma-fence: Add quick tests before
 dma_fence_remove_callback
To: Chris Wilson <chris@chris-wilson.co.uk>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 15, 2020 at 4:37 PM Chris Wilson <chris@chris-wilson.co.uk> wrote:
>
> Quoting Daniel Vetter (2020-07-15 15:03:34)
> > On Wed, Jul 15, 2020 at 2:40 PM Chris Wilson <chris@chris-wilson.co.uk> wrote:
> > > There's a further problem in that we call INIT_LIST_HEAD on the
> > > dma_fence_cb before the signal callback. So even if list_empty_careful()
> > > confirms the dma_fence_cb to be completely decoupled, the containing
> > > struct may still be inuse.
> >
> > The kerneldoc of dma_fence_remove_callback() already has a very stern
> > warning that this will blow up if you don't hold a full reference or
> > otherwise control the lifetime of this stuff. So I don't think we have
> > to worry about any of that. Or do you mean something else?
>
> It's the struct dma_fence_cb itself that may be freed/reused. Consider
> dma_fence_default_wait(). That uses struct default_wait_cb on the stack,
> so in order to ensure that the callback is completed the list_empty
> check has to remain under the spinlock, or else
> dma_fence_default_wait_cb() can still be dereferencing wait->task as the
> function returns.

The current implementation of remove_callback doesn't work if you
don't own the callback structure. Or control its lifetime through some
other means.

So if we have callers removing other callback structures, that just
doesn't work, you can only remove your own.

From a quick spot check across a few callers we don't seem to have a
problem here, all current callers for this function are in various
wait functions (driver specific, or multi fence waits, stuff like
that).
-Daniel

> So currently it is:
>
> signed long
> dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
> {
>         struct default_wait_cb cb;
>         unsigned long flags;
>         signed long ret = timeout ? timeout : 1;
>
>         spin_lock_irqsave(fence->lock, flags);
>
>         if (intr && signal_pending(current)) {
>                 ret = -ERESTARTSYS;
>                 goto out;
>         }
>
>         if (!__dma_fence_enable_signaling(fence))
>                 goto out;
>
>         if (!timeout) {
>                 ret = 0;
>                 goto out;
>         }
>
>         cb.base.func = dma_fence_default_wait_cb;
>         cb.task = current;
>         list_add(&cb.base.node, &fence->cb_list);
>
>         while (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags) && ret > 0) {
>                 if (intr)
>                         __set_current_state(TASK_INTERRUPTIBLE);
>                 else
>                         __set_current_state(TASK_UNINTERRUPTIBLE);
>                 spin_unlock_irqrestore(fence->lock, flags);
>
>                 ret = schedule_timeout(ret);
>
>                 spin_lock_irqsave(fence->lock, flags);
>                 if (ret > 0 && intr && signal_pending(current))
>                         ret = -ERESTARTSYS;
>         }
>
>         if (!list_empty(&cb.base.node))
>                 list_del(&cb.base.node);
>         __set_current_state(TASK_RUNNING);
>
> out:
>         spin_unlock_irqrestore(fence->lock, flags);
>         return ret;
> }
>
> but it could be written as:
>
> signed long
> dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
> {
>         struct default_wait_cb cb;
>         int state = intr ? TASK_INTERRUPTIBLE : TASK_UNINTERRUPTIBLE;
>
>         cb.task = current;
>         if (dma_fence_add_callback(fence, &cb.base, dma_fence_default_wait_cb))
>                 return timeout ? timeout : 1;
>
>         for (;;) {
>                 set_current_state(state);
>
>                 if (dma_fence_is_signaled(fence)) {
>                         timeout = timeout ? timeout : 1;
>                         break;
>                 }
>
>                 if (signal_pending_state(state, current)) {
>                         timeout = -ERESTARTSYS;
>                         break;
>                 }
>
>                 if (!timeout)
>                         break;
>
>                 timeout = schedule_timeout(timeout);
>         }
>         __set_current_state(TASK_RUNNING);
>
>         dma_fence_remove_callback(fence, &cb.base);
>
>         return timeout;
> }
> -Chris



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
