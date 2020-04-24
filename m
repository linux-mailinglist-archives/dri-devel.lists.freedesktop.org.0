Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C23821B762E
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 15:06:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A07C989762;
	Fri, 24 Apr 2020 13:06:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49FEA88549;
 Fri, 24 Apr 2020 13:06:21 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id g12so10608423wmh.3;
 Fri, 24 Apr 2020 06:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d9H6SVnUustAB+24ThW45WU1OXmFA2JTHai2UM+Ye14=;
 b=TPssdYPWYXJCNCFTuKfc5TcYoDA5ekdvN0oWSz/KqYwyJYddjKLv0QdJ0JCmfr2fH4
 Eml4DAfPWPXCivQ1iI5ujaZb+anm9Ihx9WaQVmPoAuoZQ0NEXcYZ1bde5PJ1nG3rWIxL
 mMrmfOu0ekShIm+x3EdWOtTzFY1JArMnyIWGu3h1Uij2yKsyDGMlD4HihKJ/cpUh2hFl
 ekwSDbvVZ2PbIoYcaXhWkZPNlfXhZR0KWsAxExsha4XGBxeRd3rxUB54HuTxgJe6z22D
 AgJorrNLM7H+WYeBSqO8akqpYBax/HU4KKVEisfDupMRvFsrR1eCfJUplHadTGlDJWnG
 t2TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d9H6SVnUustAB+24ThW45WU1OXmFA2JTHai2UM+Ye14=;
 b=CIxtCskMAclTKADn4N3pSpXRf2f1laRzYd74ZbNkRBHFQB5NRdnz9f4jUhaX7wuBEv
 aTKZ/Kb/rgjPLL7+yjOzbxVzr4DhIufKBYbBXGTxwxoEZJh7S8+4ohZP7I3hRgiLaXz3
 UdU4plU2iZ2JUu9I5JmE3ao8ueAhZIf9RREVbBZz8jwhiHrUbVfzV/DVP4o/PEbney6d
 pHjhUeafOLKXKJhcS9AyuQyuMhT45ksvPj2hknCJcro9t3xCX2LDBkjFgtMxrD3sjNjB
 /Amh/j7jF3bW79l3P44zA7tqOb7tmV/9LI27wnkrMoRCTfiprWn4Ixj60SG6oHET/4rH
 Bxcg==
X-Gm-Message-State: AGi0PuYFF8E/m2hx439Ium9TCQzPmcY/YReSU+60bY+YfRdCCahHWdh0
 Ir3KvmsbDwm2NgJx8RcTcFNs6uJ6rpAqul/SnbABTyDI
X-Google-Smtp-Source: APiQypIOnmfRtU4D5T3VDy0CTgAQx0Zn4cI38tMGJ6LOud+JZkLu5D1FTOz9mSrc34V/vlRdZYWm/pryKWqqJmoIIGw=
X-Received: by 2002:a7b:c190:: with SMTP id y16mr10646001wmi.50.1587733579940; 
 Fri, 24 Apr 2020 06:06:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200421133551.31481-1-yuq825@gmail.com>
 <CA+E=qVeokdECv-bmw1Nsne88xV53W-xGzL22mRs2zy301is77g@mail.gmail.com>
In-Reply-To: <CA+E=qVeokdECv-bmw1Nsne88xV53W-xGzL22mRs2zy301is77g@mail.gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Fri, 24 Apr 2020 21:06:08 +0800
Message-ID: <CAKGbVbvVw1Zr7r8GU3Lff8L+cBAyNgGaHwzVSJfUHKshU=NJ+w@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] drm/lima: add suspend/resume support
To: Vasily Khoruzhick <anarsoul@gmail.com>
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
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Bhushan Shah <bshah@kde.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Andreas Baierl <ichgeh@imkreisrum.de>, Erico Nunes <nunes.erico@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks, fix and applied to drm-misc-next.

Regards,
Qiang

On Wed, Apr 22, 2020 at 1:51 PM Vasily Khoruzhick <anarsoul@gmail.com> wrote:
>
> On Tue, Apr 21, 2020 at 6:37 AM Qiang Yu <yuq825@gmail.com> wrote:
> >
> > Suspend need to wait running jobs finish and put hardware in
> > poweroff state. Resume need to re-init hardware.
> >
> > v2:
> > 1. add misc patches to prepare enable runtime pm
> > 2. fix pmu command wait time out on mali400 gpu
> > 3. do power and clock gating when suspend
> > 4. do runtime pm
> >
> > Qiang Yu (10):
> >   drm/lima: use module_platform_driver helper
> >   drm/lima: print process name and pid when task error
> >   drm/lima: check vm != NULL in lima_vm_put
> >   drm/lima: always set page directory when switch vm
> >   drm/lima: add lima_devfreq_resume/suspend
> >   drm/lima: power down ip blocks when pmu exit
> >   drm/lima: add resume/suspend callback for each ip
> >   drm/lima: seperate clk/regulator enable/disable function
>
> s/seperate/separate
>
> I guess you can fix it before merging into drm-misc-next, no need to
> respin whole patchset
>
> >   drm/lima: add pm resume/suspend ops
> >   drm/lima: enable runtime pm
>
> Besides that, series is:
>
> Reviewed-by: Vasily Khoruzhick <anarsoul@gmail.com>
>
> >  drivers/gpu/drm/lima/lima_bcast.c    |  25 +++-
> >  drivers/gpu/drm/lima/lima_bcast.h    |   2 +
> >  drivers/gpu/drm/lima/lima_devfreq.c  |  24 ++++
> >  drivers/gpu/drm/lima/lima_devfreq.h  |   3 +
> >  drivers/gpu/drm/lima/lima_device.c   | 199 ++++++++++++++++++++++-----
> >  drivers/gpu/drm/lima/lima_device.h   |   5 +
> >  drivers/gpu/drm/lima/lima_dlbu.c     |  17 ++-
> >  drivers/gpu/drm/lima/lima_dlbu.h     |   2 +
> >  drivers/gpu/drm/lima/lima_drv.c      |  40 +++---
> >  drivers/gpu/drm/lima/lima_gp.c       |  21 ++-
> >  drivers/gpu/drm/lima/lima_gp.h       |   2 +
> >  drivers/gpu/drm/lima/lima_l2_cache.c |  37 +++--
> >  drivers/gpu/drm/lima/lima_l2_cache.h |   2 +
> >  drivers/gpu/drm/lima/lima_mmu.c      |  48 +++++--
> >  drivers/gpu/drm/lima/lima_mmu.h      |   2 +
> >  drivers/gpu/drm/lima/lima_pmu.c      |  77 ++++++++++-
> >  drivers/gpu/drm/lima/lima_pmu.h      |   2 +
> >  drivers/gpu/drm/lima/lima_pp.c       |  31 ++++-
> >  drivers/gpu/drm/lima/lima_pp.h       |   4 +
> >  drivers/gpu/drm/lima/lima_sched.c    |  63 ++++++---
> >  drivers/gpu/drm/lima/lima_vm.h       |   3 +-
> >  21 files changed, 496 insertions(+), 113 deletions(-)
> >
> > --
> > 2.17.1
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
