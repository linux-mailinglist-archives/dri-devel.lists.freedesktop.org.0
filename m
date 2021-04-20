Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AE436601D
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 21:17:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A54416E8A9;
	Tue, 20 Apr 2021 19:17:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E41789F35
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 19:17:05 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id y3so10145462eds.5
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 12:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xafp3zmsnKZutGsv0JZeeGLYaWGlHdTMpSRW+Uun/3Y=;
 b=YavcqiRlukEyQZA3bQP5xjEzij0SBbyxRoXjtM/IndeAoi0HoWNeRvDAUGxuSBqqsT
 /c7MYAytvYM1sPqJ7dArjf1EaTtGGqqCGAIeU/HT2K2uSYiT3vfaa7s0choYbQkuB1mo
 MgYQMWp64BxyMbo1LFdhLMNpPTb/U3ql4taB4cntovte11mQjEjxP19smim7m2YRaRJw
 Vu7sdspWHZemc8cQrf9+8JNCuukewIAXedSAWN+ojT4+0z/5sOHeGCFfwstUyN03cXmd
 EOERS1gkMlUun/bSUNqVo1es0JwubiYhSVQtGKot4j4kkz5LOcSImCv8SVXYATUOt3JY
 edQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xafp3zmsnKZutGsv0JZeeGLYaWGlHdTMpSRW+Uun/3Y=;
 b=YRELj1C29NYB619IuPmdKXPkMZ7RcF8d74jRoUXSMoRSqvs7p/LQiYIyLFxvorKXpm
 5mOEezf0brsJXvzKGJ3U0X4Cqsd5+zr9y8uSH0wixv15uc69FNJjR7PRhrC4351jezTD
 CPgknAxDpjmoVIaq5aF7K03KWpyn/TIvDgmWKe+JIs7XRt8zNAyJZHI7mxIMxEnnslP/
 T/2KeNaIZCg84C3cWzzyB/vHdbRN3pfjLZA5clWJMJs5YeflEZUyGUzQSiVcGW6qBOk9
 bf0RLNON2dT5kqnmlQoP84BTj0KqtwDo++GGtao/s4vTZWve0KaV1Ja8nqaLe8n6xlhe
 1Alw==
X-Gm-Message-State: AOAM532F8I+q6Vuj7t9YWV1QSA6nqa6S/x8xfutAcF1m3LgE1qKsadkK
 JpEwKIDILpAkxa6AI9XH8mEGQUUOa0zbH2WLN2EUTxQhqDNvzg==
X-Google-Smtp-Source: ABdhPJxAQyNNmSdUEVZaLcGt7CSF77GKYg3nQJgvJ+THcJmMOrZy3smeDI7Uph5AFwMVVZXda63yqK2Il4RmPUxy0BY=
X-Received: by 2002:a05:6402:1013:: with SMTP id
 c19mr34356719edu.213.1618946223678; 
 Tue, 20 Apr 2021 12:17:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAAxE2A4mpapnCE7uw8GNWkaRR4jXeoz9qa9j=9XknjR3yeq3YQ@mail.gmail.com>
 <CAPj87rMn_gabTdZpHGQVa16Log8xFe8fvhcL_WSC6tyOMvmY=w@mail.gmail.com>
 <CAOFGe96c1SxHiUBzapbVFx1h0aOwF=X8hcStVZmrw4OjrrG+Zg@mail.gmail.com>
 <CAPj87rPSW13nxz2n5E+n0JYcwGR3mFWJAG2kYaaoav7A-ZVD2g@mail.gmail.com>
 <CAKMK7uHyTiFWwQWdxVk1am+KoFA9DsTnJ658CAhzBYOyg7AdsA@mail.gmail.com>
In-Reply-To: <CAKMK7uHyTiFWwQWdxVk1am+KoFA9DsTnJ658CAhzBYOyg7AdsA@mail.gmail.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Tue, 20 Apr 2021 14:16:51 -0500
Message-ID: <CAOFGe95BDOk2qfU8G_Ye6FOL8-8jH5z5QZG1Yh1+BvPBoYAwfw@mail.gmail.com>
Subject: Re: [Mesa-dev] [RFC] Linux Graphics Next: Explicit fences everywhere
 and no BO fences - initial proposal
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: ML Mesa-dev <mesa-dev@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 20, 2021 at 1:54 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Tue, Apr 20, 2021 at 7:45 PM Daniel Stone <daniel@fooishbar.org> wrote:
>
> > And something more concrete:
> >
> > dma_fence.
> >
> > This already has all of the properties described above. Kernel-wise, it already devolves to CPU-side signaling when it crosses device boundaries. We need to support it roughly forever since it's been plumbed so far and so wide. Any primitive which is acceptable for winsys-like usage which crosses so many device/subsystem/process/security boundaries has to meet the same requirements. So why reinvent something which looks so similar, and has the same requirements of the kernel babysitting completion, providing little to no benefit for that difference?
>
> So I can mostly get behind this, except it's _not_ going to be
> dma_fence. That thing has horrendous internal ordering constraints
> within the kernel, and the one thing that doesn't allow you is to make
> a dma_fence depend upon a userspace fence.

Let me elaborate on this a bit.  One of the problems I mentioned
earlier is the conflation of fence types inside the kernel.  dma_fence
is used for solving two different semi-related but different problems:
client command synchronization and memory residency synchronization.
In the old implicit GL world, we conflated these two and thought we
were providing ourselves a service.  Not so much....

It's all well and good to say that we should turn the memory fence
into a dma_fence and throw a timeout on it.  However, these
window-system sync primitives, as you said, have to be able to be
shared across everything.  In particular, we have to be able to share
them with drivers that don't make a good separation between command
and memory synchronization.

Let's say we're rendering on ANV with memory fences and presenting on
some USB display adapter whose kernel driver is a bit old-school.
When we pass that fence to the other driver via a sync_file or
similar, that driver may shove that dma_fence into the dma_resv on
some buffer somewhere.  Then our client, completely unaware of
internal kernel dependencies, binds that buffer into its address space
and kicks off another command buffer.  So i915 throws in a dependency
on that dma_resv which contains the previously created dma_fence and
refuses to execute any more command buffers until it signals.
Unfortunately, unbeknownst to i915, that command buffer which the
client kicked off after doing that bind was required for signaling the
memory fence on which our first dma_fence depends.  Deadlock.

Sure, we put a timeout on the dma_fence and it will eventually fire
and unblock everything.  However, there's one very important point
that's easy to miss here:  Neither i915 nor the client did anything
wrong in the above scenario.  The Vulkan footgun approach works
because there are a set of rules and, if you follow those rules,
you're guaranteed everything works.  In the above scenario, however,
the client followed all of the rules and got a deadlock anyway.  We
can't have that.


> But what we can do is use the same currently existing container
> objects like drm_syncobj or sync_file (timeline syncobj would fit best
> tbh), and stuff a userspace fence behind it. The only trouble is that
> currently timeline syncobj implement vulkan's spec, which means if you
> build a wait-before-signal deadlock, you'll wait forever. Well until
> the user ragequits and kills your process.

Yeah, it may be that this approach can be made to work.  Instead of
reusing dma_fence, maybe we can reuse syncobj and have another form of
syncobj which is a memory fence, a value to wait on, and a timeout.

--Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
