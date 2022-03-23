Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B67AE4E4A92
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 02:39:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82BDB10E02D;
	Wed, 23 Mar 2022 01:39:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 080F910E02D
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 01:39:26 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 mz9-20020a17090b378900b001c657559290so4990962pjb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 18:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ieZ1YNZMdPMDle0nXlJhObnK0W4J43jf9cWsuNGkhUY=;
 b=iDjGY+J/5JvZcOb7jtGwUMPA86RmY+2Kd08u46Z4q1s0ZgozamxL6GZnVxGe4jiQ9B
 Ror0YmrKSXvrr2/xyj9TCPLtJkG0912nL9Ie7pcefbtt+N+D9r41oMa33PsswaGOxZp8
 rux8O2+CS76kYQHT92Uh9EP/edacCSVf3VpbIHSVcftb00FUq5DbEnC+k2vyEc3Qh3+9
 IDdiy0OzGMngKa9GfKlpTf23aNO5KBf3MVs56/ELlfGOCUc960xE47idnHnTTZRUd2dE
 lYRybJS3nHsAG/4MoztI28+HVklC3EkNVZh0JVVGKx31vedl5klbnmrcqcxntEchTSCa
 LfjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ieZ1YNZMdPMDle0nXlJhObnK0W4J43jf9cWsuNGkhUY=;
 b=hRTqUN9aCnW2QTW3AajyhuOSrju92vyD3OYax1d7MMQKWJT97VZBaqntHaowBnFDVE
 dQbYoMP2NU70x6p4zelxN9yl74WXqmwGD6UCG3UUtbJ+Ebw77/M8rA3I7Mx0GMLVloWv
 9TI2tMoI02gl+yt1Um2voUAtM1A8gLcGIN2lz7J5Z3+6FQIKU2acgFyyvNkAmrng3VGp
 Xtx+FuTLQ4IYu33FjsCREOrI1tFABedRwT0I+j6HBaG/tpUKq+geGMNn4QyVAFb5BNQO
 C76Esm8lmXpH1xmlP0/+oNJNlQecVwYUx89RZS4YK1ZunUOqUcYCt5H0x7zStHDP8iwH
 e2xw==
X-Gm-Message-State: AOAM530FIuga4TNvN9zOM9ogx7747hi6uzj5hUSmyzelkqTrwTVCi87R
 oCOG21dN7nJhhCU8itOFSqPPbkfZP1ITOtkBBg==
X-Google-Smtp-Source: ABdhPJykxCUGEMdCG/iVtspeqcFCatcsR4M7mlCCgk2FUckmO7eqpB1Pl7YNEqGaJ18raP5HtezEbI/KGXBVxP4V/j8=
X-Received: by 2002:a17:90b:1803:b0:1c7:24c4:ab52 with SMTP id
 lw3-20020a17090b180300b001c724c4ab52mr8404054pjb.240.1647999565452; Tue, 22
 Mar 2022 18:39:25 -0700 (PDT)
MIME-Version: 1.0
References: <1646983382-30036-1-git-send-email-zheyuma97@gmail.com>
 <YjMSMIrbsVZjEw8W@phenom.ffwll.local>
 <CAMhUBjkohp=-4YZ7x6Yyf4tQr_2zCoR+RVmEZPGLoXTEhNoPFA@mail.gmail.com>
 <Yjnc1A2heVopcyXh@phenom.ffwll.local>
In-Reply-To: <Yjnc1A2heVopcyXh@phenom.ffwll.local>
From: Zheyu Ma <zheyuma97@gmail.com>
Date: Wed, 23 Mar 2022 09:39:14 +0800
Message-ID: <CAMhUBjnRP+Jb8MY9T02hVH=rQ-hdKxb9UDYpN4twHUywiBoVDQ@mail.gmail.com>
Subject: Re: [PATCH] drm: drm_bufs: Error out if 'dev->agp' is a null pointer
To: Zheyu Ma <zheyuma97@gmail.com>, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@linux.ie, 
 dri-devel@lists.freedesktop.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

On Tue, Mar 22, 2022 at 10:27 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, Mar 21, 2022 at 09:02:47PM +0800, Zheyu Ma wrote:
> > On Thu, Mar 17, 2022 at 6:49 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Fri, Mar 11, 2022 at 07:23:02AM +0000, Zheyu Ma wrote:
> > > > The user program can control the 'drm_buf_desc::flags' via ioctl system
> > > > call and enter the function drm_legacy_addbufs_agp(). If the driver
> > > > doesn't initialize the agp resources, the driver will cause a null
> > > > pointer dereference.
> > > >
> > > > The following log reveals it:
> > > >     general protection fault, probably for non-canonical address
> > > >     0xdffffc000000000f: 0000 [#1] PREEMPT SMP KASAN PTI
> > > >     KASAN: null-ptr-deref in range [0x0000000000000078-0x000000000000007f]
> > > >     Call Trace:
> > > >      <TASK>
> > > >      drm_ioctl_kernel+0x342/0x450 drivers/gpu/drm/drm_ioctl.c:785
> > > >      drm_ioctl+0x592/0x940 drivers/gpu/drm/drm_ioctl.c:885
> > > >      vfs_ioctl fs/ioctl.c:51 [inline]
> > > >      __do_sys_ioctl fs/ioctl.c:874 [inline]
> > > >      __se_sys_ioctl+0xaa/0xf0 fs/ioctl.c:860
> > > >      do_syscall_x64 arch/x86/entry/common.c:50 [inline]
> > > >      do_syscall_64+0x43/0x90 arch/x86/entry/common.c:80
> > > >      entry_SYSCALL_64_after_hwframe+0x44/0xae
> > > >
> > > > Fix this bug by adding a check.
> > > >
> > > > Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
> > >
> > > You can only hit this if you enabled a DRIVER_LEGACY drm driver, which
> > > opens you up to tons of other CVEs and issues. What's your .config?
> >
> > Yes, I enable the DRM_LEGACY option in the config.
> > I think you mean this is not a normal configuration file? Do you have
> > a recommended configuration option for when I want to test the GPU
> > driver?
>
> Yeah DRM_LEGACY gives you all kinds of horrible and known-broken
> interfaces. Don't enable that :-)
>
> You have a bunch of other drivers enable which require DRM_LEGACY, so
> those will disable too. Anything else I think would be an upstream bug and
> we'd need to adjust Kconfig (or fix the code).

Thanks for your explanation! I will pay attention next time.

Regards,
Zheyu Ma
