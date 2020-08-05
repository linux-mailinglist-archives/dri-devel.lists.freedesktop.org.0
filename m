Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BD723D78B
	for <lists+dri-devel@lfdr.de>; Thu,  6 Aug 2020 09:40:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83CCF6E888;
	Thu,  6 Aug 2020 07:39:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26E9F6E0E8
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 23:12:06 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id s9so25175473lfs.4
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Aug 2020 16:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6IlcwXkggZXwjeO2xqgnX1jj+o1HeBSCySeOIdu+S3I=;
 b=HMEleZyh/Q1Vsjl3q61IxBgncon+zWbzemqEDPCDO1KvVMulMo/KrqaD7d7uEtUjiL
 1zzwcY5/D8pJkeDUPT2Bq4UhFfNwQd/FS5ziDzjAOuw1awYbidF7p9WHj5Azd9nJUyDj
 +ZaXV+1SgZR3FZfG2nLQsPNLSiWCz2PrccUFjD+4PHA1j/QiXn1eLMLxcpzsjK2NgrUG
 EETP5H8c/wjdNhlffYPvy4cf4eM7CliB6m63zqgovdbbdEEyuTFg14896TISeebwtL9G
 4lnMhdNBPeh7bgktGgQZ9nf/i0T/0PCi0LulwytJo523SGHNeD4pTvJu3p5NxLmD5AYR
 bkMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6IlcwXkggZXwjeO2xqgnX1jj+o1HeBSCySeOIdu+S3I=;
 b=IYrmMREbAkB1mUDlgCynlgNVl1ap9SaGNIxFmyG8ZoGUmj9Ju1N52ktd1U2hAKmD5f
 RYll/ZP2WrLfigF2mfbBd+NyOb7RSOY0jfKeX1rLE/rnVGyOh1Cvfvx5iSjIbFEf2rgV
 vchI5vFziCKbJY7IQZitX/Ga3+aLFY0xnEKgmgwwRjksAq4biZtrG1zgOqHjsXJ1sITk
 U6yWysMrYOah3JI+2OUakazdJrKk3p/bqnYNOPRZa0buaxVxXNUj7337zmfmNdWMZbi8
 hlAnisfeYc0RfjGESIZ7xmC6FjGv0nE6XH8Hm8GKhYgGiar7Keur847fwQGe7Sk1DJYe
 VATA==
X-Gm-Message-State: AOAM532zJXqzKA5aA2wwEV3jWguwXWNfwTfcuHVs+llW7YAv29ooMLOo
 oA970UNN5KVSni35VrvXTSIOagvgHQFH91F+DX7jqrSb5g==
X-Google-Smtp-Source: ABdhPJywx/HZa7uWQ2cegLqkLKUTJuF/TXzF6DKh23zSMZGx0I6lkO6msIxJ/Lh0drdG20cTOma2QOaKn8Pt+268mzA=
X-Received: by 2002:a19:f105:: with SMTP id p5mr2581781lfh.118.1596669123916; 
 Wed, 05 Aug 2020 16:12:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAKT=dD=_8daRz2h9pCvRQV4bvM6Wu6QGsBu7676-Jujfaf-Tuw@mail.gmail.com>
 <CAP+8YyEn-+gq_RiM0sOmPagD46eGPT7wzAS9y_j52Or6ETBx2A@mail.gmail.com>
 <CAKT=dDneYRs+ZEJmwP=_wmz+dodpk6Gp7j=eX4EA=b9vGYmkoA@mail.gmail.com>
In-Reply-To: <CAKT=dDneYRs+ZEJmwP=_wmz+dodpk6Gp7j=eX4EA=b9vGYmkoA@mail.gmail.com>
From: Yiwei Zhang <zzyiwei@google.com>
Date: Wed, 5 Aug 2020 16:11:52 -0700
Message-ID: <CAKT=dD=zG-zGD=gZz1KErFYh-R7pr2xh6F5+vawAS-3tdiP1Gg@mail.gmail.com>
Subject: Re: Question about per process GPU context global priority enforcement
To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
X-Mailman-Approved-At: Thu, 06 Aug 2020 07:39:21 +0000
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
Cc: Peiyong Lin <lpy@google.com>, Prahlad Kilambi <prahladk@google.com>,
 Android Kernel Team <kernel-team@android.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of reusing CAP_SYS_NICE. Is there any on-going efforts to
unify this inside the drm cgroup controller? The controller I'm
referring to is this one currently used for setting gem buffer limits:
https://lists.freedesktop.org/archives/amd-gfx/2019-June/036026.html

Is it possible that a new controller can be introduced for this purpose?

On Wed, Aug 5, 2020 at 12:26 PM Yiwei Zhang <zzyiwei@google.com> wrote:
>
> Let me add more context. On Android, systemui and launcher should be
> allowed to create high priority gpu contexts while the normal random
> applications must be ceiled to default priority. However, systemui and
> launcher are not allowed to create realtime threads so we can't grant
> them CAP_SYS_NICE. Thus either a new cgroup is needed in this case or
> we add sysui/launcher into some other present cgroup for the gfx
> kernel driver to distinguish.
>
> On Wed, Aug 5, 2020 at 4:47 AM Bas Nieuwenhuizen
> <bas@basnieuwenhuizen.nl> wrote:
> >
> > I don't think we have a uniform mechanism, currently each driver
> > decides on their own.
> >
> > For the amdgpu driver we check that the process either has
> > CAP_SYS_NICE or is the DRM master.
> >
> > On Wed, Aug 5, 2020 at 9:14 AM Yiwei Zhang <zzyiwei@google.com> wrote:
> > >
> > > Hi friends,
> > >
> > > For Vulkan/EGL, upon creating gpu contexts, applications can ask for a
> > > system-wide higher priority levels via VK_EXT_global_priority or
> > > EGL_IMG_context_priority extensions.
> > >
> > > I'm curious if we have certain rules(some form of process privilege
> > > check) in the kernel to limit non-privileged ones to never go beyond
> > > default system-wide gpu scheduling priority. (e.g. not allow random
> > > app processes to contend the GPU queues repeatedly/infinitely with
> > > high/realtime priorities)
> > >
> > > Many thanks,
> > > Yiwei - from Android Platform Graphics Team
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
