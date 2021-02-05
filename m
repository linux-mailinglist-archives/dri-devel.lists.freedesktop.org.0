Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A1A3107CF
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 10:27:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A56806EF3F;
	Fri,  5 Feb 2021 09:27:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B6A96EF33
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 09:27:14 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id n7so6762888oic.11
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Feb 2021 01:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bC/3x6xZEQEo7Rsd9WsSYs1ThpFMpsu6DZqs3xi1V9Y=;
 b=d+s/ttLBBPSulMIDf3H7fLuKrz6HNnnlqIVrjMKrOE1Gj9yFAiwXDEvH71ecmVGbJ4
 w0jRvHgwJ7m5m6tcBDKmicFBM7CrDMNRc5wATCbKjuhp/KHxpKfntMMYVPGwiltIeH+E
 gVRO0sj2Ec2BkChi9BgIwoVkJmwbJAoLDUQmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bC/3x6xZEQEo7Rsd9WsSYs1ThpFMpsu6DZqs3xi1V9Y=;
 b=L0ZSHSaN9pNNbukX16chkTJgA5wY2GWhZCv0FICT4e/Vt4FqxVsacEWIjXjv6XBulN
 WdFhietNjYkzu7Ym2t+7dn0PgCbJMeRgxHaiVvcIE1oBqn62vXn04UeCHZMQr8WnnKWb
 kotjL/9+qMs3EHv0h4PGfK66fM7LHAY80mSSH+IU8deGC8VAtp9uInwRW6boq0GOHRHs
 ibNf6ymAIyxewkIOwoStxptww/PtA5VrQ1aLi1k5f0ofRaBN7bMlgB4Dyo7tHoE2TEcI
 FgbrCLJ+lIZ3jxTe9PMs7uy6tmfbHTUYJHVqcOoiiQMlqb9OD5x+BR/AcME6UB683ZaP
 4tvw==
X-Gm-Message-State: AOAM530NFzx5ywmyahkOaNHz/mkgPcAzBQF0me4oZM/1m7av5PQqta6z
 mgKR/BAX3xE6jzfRU+oXG8zqX76F857LdbC6eBZIMg==
X-Google-Smtp-Source: ABdhPJzv8GE0uwZQUhy9jqVDIt8IvNcyHBE1WLfaB0ey4yuYQ/4vwsGVMsyTskHNVChYgwUcm3guoxdIO+ZIU7ZOcrI=
X-Received: by 2002:aca:df42:: with SMTP id w63mr2496478oig.128.1612517233942; 
 Fri, 05 Feb 2021 01:27:13 -0800 (PST)
MIME-Version: 1.0
References: <20210204045717.3823-1-alexander.deucher@amd.com>
 <CAPM=9tzKzgOTQd4zorqn8LP2QJhSLuD_xJhm5saSH2uUJE7_+w@mail.gmail.com>
 <CADnq5_MjZrt4EQt8UhszT-_UcuSY_j7Ezk__TmTr+NhBuWw=3A@mail.gmail.com>
In-Reply-To: <CADnq5_MjZrt4EQt8UhszT-_UcuSY_j7Ezk__TmTr+NhBuWw=3A@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 5 Feb 2021 10:27:03 +0100
Message-ID: <CAKMK7uEqqEBHFm369oP-nFntUq-tN-bFRyR92M0UUyLbarqzfQ@mail.gmail.com>
Subject: Re: [pull] amdgpu, amdkfd drm-next-5.12
To: Alex Deucher <alexdeucher@gmail.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 5, 2021 at 5:33 AM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Thu, Feb 4, 2021 at 6:52 PM Dave Airlie <airlied@gmail.com> wrote:
> >
> > On Thu, 4 Feb 2021 at 14:57, Alex Deucher <alexdeucher@gmail.com> wrote:
> > >
> > > Hi Dave, Daniel,
> > >
> > > More fixes for 5.12.  Same PR from last week with the issue Felix reported
> > > fixed and a few more additional fixes on top.
> > >
> > > The following changes since commit a6b8720c2f85143561c3453e1cf928a2f8586ac0:
> > >
> > >   Merge tag 'amd-drm-next-5.12-2021-01-20' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2021-01-20 13:08:18 +0100)
> > >
> > This brought an arm32 warning with it, I've applied Arnd's patch to
> > drm-next to fix it.
> >
> > https://patchwork.freedesktop.org/patch/msgid/20210125124849.102037-1-arnd@kernel.org
> >
> > However that function has an ifdef around an ifdef that probably could
> > do with cleaning up.
>
> Sorry about that.  Bhawan fixed that up at the time:
> https://patchwork.freedesktop.org/patch/415092/
> Daniel said he picked that up last week:
> https://lists.freedesktop.org/archives/dri-devel/2021-January/294941.html
> but I guess it never landed, otherwise I would have included it in my PR.

Oops sorry, I somehow failed to push that one out :-/

I kinda liked the patch from Bhawan more, since less #ifdef.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
