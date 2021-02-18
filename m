Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B827A31EC4F
	for <lists+dri-devel@lfdr.de>; Thu, 18 Feb 2021 17:38:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A45C6E828;
	Thu, 18 Feb 2021 16:38:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EB436E828
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Feb 2021 16:38:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 73EC864DFF
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Feb 2021 16:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613666294;
 bh=PSRyDfO1sPUsZs3TyDBusLq3NyWBpdZQUfWv06NR2jQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=QYBB6cWN8ikXT1Ayga9/KGOrBIKIqHiH5ofV39M9MJ5FwMcgbtoIKb9mJNkKR5cOB
 zqSWIaZPB3BPvr5IY10Yr72Ahv5Zq2kuY6nKHIQ8YPu203fgoSgLe3mprcb1AaS0bL
 CIb5Y7dcDxNkAqfnpnIk3Vb8dcmDVLm/osREWNRrCtmdBJNAOcHN6X1sIXLaZ7qiIk
 LsvxoEda0/8lrd7Ky1ubuIiA0lH0Us+DygkQunvaCgZnNiDxvgcSzQAG7h5GUS4PVx
 ftUxLZARSrmdfAi7h+a1inRZ4MhSYNchpUDSw9Sfp+DJuslZVZoFYscKM5utnJARSz
 gzdOiDEt4Sx9A==
Received: by mail-ej1-f54.google.com with SMTP id t11so6677277ejx.6
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Feb 2021 08:38:14 -0800 (PST)
X-Gm-Message-State: AOAM533r4d5w9lFvkk4mPUqVslKHwtZJF2/Ib7Ghj/jfj0MchBIBpm9y
 0Tn/QjINVw8z7KC8zwPYsrIzqzBKg4Hwfsf4ew==
X-Google-Smtp-Source: ABdhPJxhlzOwcJ6PrKTRgyNiPyOLEByGLljYILHgM7PiWKz8nHmAdNtlcOPmwgvtIRJSGNIi+IbXIVeSXQ5rTHKLYJQ=
X-Received: by 2002:a17:906:fad4:: with SMTP id
 lu20mr4832535ejb.341.1613666292898; 
 Thu, 18 Feb 2021 08:38:12 -0800 (PST)
MIME-Version: 1.0
References: <20210217165910.3820374-1-nroberts@igalia.com>
 <7f80b184-7277-0f6c-1108-cf41189626df@arm.com>
 <CAKMK7uHPk1G-S6EMRZ8grZU8W6iij_DJR+V2eBGP+79Te6k76A@mail.gmail.com>
 <20210218154538.GA1483@kevin> <bddce2d0-8f93-9263-0185-97fc848ddda6@arm.com>
In-Reply-To: <bddce2d0-8f93-9263-0185-97fc848ddda6@arm.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 18 Feb 2021 10:38:00 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ1Q+yRTY7+RduWSK4ZWO4v8Dq02xwNdNpNY0uD402M-g@mail.gmail.com>
Message-ID: <CAL_JsqJ1Q+yRTY7+RduWSK4ZWO4v8Dq02xwNdNpNY0uD402M-g@mail.gmail.com>
Subject: Re: [PATCH] drm/shmem-helper: Don't remove the offset in
 vm_area_struct pgoff
To: Steven Price <steven.price@arm.com>
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
Cc: Neil Roberts <nroberts@igalia.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 18, 2021 at 10:15 AM Steven Price <steven.price@arm.com> wrote:
>
> On 18/02/2021 15:45, Alyssa Rosenzweig wrote:
> >> Yeah plus Cc: stable for backporting and I think an igt or similar for
> >> panfrost to check this works correctly would be pretty good too. Since
> >> if it took us over 1 year to notice this bug it's pretty clear that
> >> normal testing doesn't catch this. So very likely we'll break this
> >> again.
> >
> > Unfortunately there are a lot of kernel bugs which are noticed during actual
> > use (but not CI runs), some of which have never been fixed. I do know
> > the shrinker impl is buggy for us, if this is the fix I'm very happy.
>
> I doubt this will actually "fix" anything - if I understand correctly
> then the sequence which is broken is:
>
>   * allocate BO, mmap to CPU
>   * madvise(DONTNEED)
>   * trigger purge
>   * try to access the BO memory
>
> which is an invalid sequence for user space - the attempt to access
> memory should cause a SIGSEGV. However because drm_vma_node_unmap() is
> unable to find the mappings there may still be page table entries
> present which would provide access to memory the kernel has freed. Which
> is of course a big security hole and so this fix is needed.
>
> In what way do you find the shrinker impl buggy? I'm aware there's some
> dodgy locking (although I haven't worked out how to fix it) - but AFAICT
> it's more deadlock territory rather than lacking in locks. Are there
> correctness issues?

What's there was largely a result of getting lockdep happy.

> >> btw for testing shrinkers recommended way is to have a debugfs file
> >> that just force-shrinks everything. That way you avoid all the trouble
> >> that tend to happen when you drive a system close to OOM on linux, and
> >> it's also much faster.
> >
> > 2nding this as a good idea.
> >
>
> Sounds like a good idea to me too. But equally I'm wondering whether the
> best (short term) solution is to actually disable the shrinker. I'm
> somewhat surprised that nobody has got fed up with the "Purging xxx
> bytes" message spam - which makes me think that most people are not
> hitting memory pressure to trigger the shrinker.

If the shrinker is dodgy, then it's probably good to have the messages
to know if it ran.

> The shrinker on kbase caused a lot of grief - and the only way I managed
> to get that under control was by writing a static analysis tool for the
> locking, and by upsetting people by enforcing the (rather dumb) rules of
> the tool on the code base. I've been meaning to look at whether sparse
> can do a similar check of locks.

Lockdep doesn't cover it?

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
