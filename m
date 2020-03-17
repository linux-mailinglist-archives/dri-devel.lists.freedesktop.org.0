Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 288E9188CB5
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 19:00:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF6276E7DD;
	Tue, 17 Mar 2020 18:00:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70DBC6E248;
 Tue, 17 Mar 2020 18:00:04 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id r7so461021wmg.0;
 Tue, 17 Mar 2020 11:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=slGl/R7byfWGMBVfvYdzgflVP89pwccF4w3qibXt4fI=;
 b=Cw2za/4YphQmbHc3nT7FsBbfO952/9Vrw1WR5nKMsQGJvZqmFoLKLGfwRJNc1MGwhZ
 0OGRaViVvd7xLchAwxAI/rKJ/kUZJNiL92QwT92Gpu+s88ilS0lCdnhOkzH7TrkOnEEZ
 CQ+1dDPmvJbJM2WLxk59Ayvx0fFwAtuH+fP3uK/TQw+s3PkLr9nI5Ps01m7OMzYm1ZEv
 uo3FlArAqec+tRfIJz837N2gZtanfR/iOzOBTfqcsSCE/xSQngGA6xtfXI5dJXeJMy4/
 +jw7IC2Tc7L9JS+iGcrxT6CVocwQo2DTlr9sDAGj3ugE8I5HB0j6tBeuJUvAfQzv/K00
 U0dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=slGl/R7byfWGMBVfvYdzgflVP89pwccF4w3qibXt4fI=;
 b=rFubJw6zRj0q29b6Cul/iuQfgSi9VCYKHtR2q2wa7wPaRQfy3CwdUA2wBENa9DN6fV
 5ndVAREyFwvUd/YXkd5QxIfU+1XQjM10vm8Y75EOZcN27vSNSj7naaFNlLpzk92CtaSi
 DzDNZFb6BxjpjNlIcPAP1EyutsaGEOlanLQ7PLirmO4YY7yXItLg8S/5dMUBJXi8/ozS
 kgjQKw1+q5OL00f2OyrZ6us0KYuqUjuSNelyrbjey4UOAnpNmFqCaJ0z4+s2GjZCANF6
 e8iQIXBBdk3hUP4oZ5CJQndquf8uCaNrU3rCVJrqGNswPnl8grQxtBfKmIndQ124P2e1
 j1wQ==
X-Gm-Message-State: ANhLgQ3C5fEu0R8OhJXy6Z/WfegAApScQLNtNgyp58In5pN9Q4jM5og3
 YwuOu/AIZqV801NZ/WJ5M2OlXYn3mvVWs3TjpUs=
X-Google-Smtp-Source: ADFU+vvmq+uCRHAJfS6et01/Ll+XBwfayr+YxuSaUfbmc2SIWBTLKB1ufxJkQMj1XAPaSGLdKB9HOVk2Dw8qXFrXQL8=
X-Received: by 2002:a7b:c153:: with SMTP id z19mr198525wmi.37.1584468003095;
 Tue, 17 Mar 2020 11:00:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
 <CAOFGe97LnmEHVoitgKdo+hbw9rYacofkzkt3pPcQSaw9BaKyaA@mail.gmail.com>
 <33d1749d876a83416c44671efcb37c74f87d1bd4.camel@ndufresne.ca>
 <20200316102034.GA30883@pendragon.ideasonboard.com>
 <CAOFGe95JUUBCuE=dWKtZVXjTLqxyf2oybpqAZ7hZhpBEKQ=Y-Q@mail.gmail.com>
 <20200316211502.GW4732@pendragon.ideasonboard.com>
 <74477a20fa78758dd6cf8c32d7a77d1cccf2646f.camel@ndufresne.ca>
 <CAOFGe963WUB+rkA=FURuXEk6BVjsP18yk4sJ3y_7VxKmscShrA@mail.gmail.com>
 <CAC2bXD5qJgT9sWJgL_ej5OY42a-xzYaeLrwioKUreQuPJ1idpg@mail.gmail.com>
 <3e522876ec0287b69483c65aa1e7ba1ded536ec6.camel@lynxeye.de>
In-Reply-To: <3e522876ec0287b69483c65aa1e7ba1ded536ec6.camel@lynxeye.de>
From: Jacob Lifshay <programmerjake@gmail.com>
Date: Tue, 17 Mar 2020 10:59:50 -0700
Message-ID: <CAC2bXD6f2LiJ9_S0V8gZdrczRzH8oNqyLprzzFnGYTMzGe5gUQ@mail.gmail.com>
Subject: Re: [Mesa-dev] Plumbing explicit synchronization through the Linux
 ecosystem
To: Lucas Stach <dev@lynxeye.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, xorg-devel <xorg-devel@lists.x.org>,
 linux-media@vger.kernel.org,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "wayland-devel @ lists . freedesktop . org"
 <wayland-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jason Ekstrand <jason@jlekstrand.net>,
 ML mesa-dev <mesa-dev@lists.freedesktop.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 Discussion of the development of and with GStreamer
 <gstreamer-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 17, 2020 at 10:21 AM Lucas Stach <dev@lynxeye.de> wrote:
>
> Am Dienstag, den 17.03.2020, 10:12 -0700 schrieb Jacob Lifshay:
> > One related issue with explicit sync using sync_file is that combined
> > CPUs/GPUs (the CPU cores *are* the GPU cores) that do all the
> > rendering in userspace (like llvmpipe but for Vulkan and with extra
> > instructions for GPU tasks) but need to synchronize with other
> > drivers/processes is that there should be some way to create an
> > explicit fence/semaphore from userspace and later signal it. This
> > seems to conflict with the requirement for a sync_file to complete in
> > finite time, since the user process could be stopped or killed.
> >
> > Any ideas?
>
> Finite just means "not infinite". If you stop the process that's doing
> part of the pipeline processing you block the pipeline, you get to keep
> the pieces in that case.

Seems reasonable.

> That's one of the issues with implicit sync
> that explicit may solve: a single client taking way too much time to
> render something can block the whole pipeline up until the display
> flip. With explicit sync the compositor can just decide to use the last
> client buffer if the latest buffer isn't ready by some deadline.
>
> With regard to the process getting killed: whatever you sync primitive
> is, you need to make sure to signal the fence (possibly with an error
> condition set) when you are not going to make progress anymore. So
> whatever your means to creating the sync_fd from your software renderer
> is, it needs to signal any outstanding fences on the sync_fd when the
> fd is closed.

I think I found a userspace-accessible way to create sync_files and
dma_fences that would fulfill the requirements:
https://github.com/torvalds/linux/blob/master/drivers/dma-buf/sw_sync.c

I'm just not sure if that's a good interface to use, since it appears
to be designed only for debugging. Will have to check for additional
requirements of signalling an error when the process that created the
fence is killed.

Jacob

>
> Regards,
> Lucas
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
