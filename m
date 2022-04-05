Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 922BA4F37B9
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 16:23:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1395B10E8F5;
	Tue,  5 Apr 2022 14:23:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B44BD10E5AA;
 Tue,  5 Apr 2022 14:23:28 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-df02f7e2c9so14515388fac.10; 
 Tue, 05 Apr 2022 07:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3viWxA/JBHdP0TQbOykdsaxa+Gs7txej/lLx0GIvIYg=;
 b=G9QnFQmPtVjj4tVobX1LMic5zPY274r2vdLPAoUHBKEo99rnSV8OgrXJiFUo/7/jTF
 HjRanar2kAcinOYdoYvDGcnYJCuDuEuq0Zai+Uq0v6oNYRccBrMVRMdFmiEV85NERQ9C
 7vO48nBrMzEKZEJVJ8XZajlPZLIjcsxvASt5VlRRUCL1kA3K18vbkH8swg9+yzJ9rGMP
 bFCRoCQAY3/a8STCLM+PzA5oegHvKvG3gC1g6iDc6bi30ZQD9wkIiGfKM1QRvaqcYdSM
 rfBcCGGpw/3xxa0Vz8+ryEQQNncgOdCH6noH47HWTgOvqSb3hQ57Qsfk/RiWmJ24PVYC
 lHBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3viWxA/JBHdP0TQbOykdsaxa+Gs7txej/lLx0GIvIYg=;
 b=wfKydNibFQjpn8ifQw7n1EgqJdp5qvdgvNdrgewc7UDOjTwgr6/1yPu2tl9EKTEib9
 fyODvGAb1yHMf29Y8eRMqEIDl59ldwt7n0wWJurdXsENi+rGI66RbwQ6RyP+HgE879pz
 9Ei0ykuOSw2Hd358vyfg/GdiwqcrOYlOy37g/wXA3NJ5eRxIA9jxdhYlA97AgZXVekxl
 cXjwJ2xcTmybRXSiIG5LcM3i0Acs5TJPAa0n56Pq4L+9ueKiDFI6kARJzZyYQIhOuskk
 fO/qzSpXKPyIFROdE22hFDhCMuax+UViwv4OhjnOvgyzMsIZr5aAFNfUnKFteacw4BlG
 rNBQ==
X-Gm-Message-State: AOAM530S7tQqESj6/txaJ4LJ0HuxMeAaD3hHO4z3oALcZMA1cHtAn6F7
 W5bl+oq6ZLAVPof3zxvLGn/cU1oB9IQXIIuQGWc=
X-Google-Smtp-Source: ABdhPJwwvFJ/nErrBLzLGpycHCVzIhCmGoPUp6o1bgcidxfVOxHS2sTwvSWskrCQURlhd5hQ2zrWnsbBLhhhsqySV8U=
X-Received: by 2002:a05:6870:311d:b0:de:9b6c:362b with SMTP id
 v29-20020a056870311d00b000de9b6c362bmr1567641oaa.200.1649168608008; Tue, 05
 Apr 2022 07:23:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220403132322.51c90903@darkstar.example.org>
 <CADnq5_M+M_iykM0Ag6RF+kxzgpEopUBtp82h7tRM3G+B3AWZ2w@mail.gmail.com>
 <20220404213940.09a56d15@darkstar.example.org>
In-Reply-To: <20220404213940.09a56d15@darkstar.example.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 5 Apr 2022 10:23:16 -0400
Message-ID: <CADnq5_PhaFbVCb=-AUCx4L-sCyPCPOsY3tNpiAg=gfCN7hFcJA@mail.gmail.com>
Subject: Re: AMDGPU: regression on 5.17.1
To: Michele Ballabio <ballabio.m@gmail.com>
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 regressions@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 4, 2022 at 3:39 PM Michele Ballabio <ballabio.m@gmail.com> wrote:
>
> On Mon, 4 Apr 2022 13:03:41 -0400
> Alex Deucher <alexdeucher@gmail.com> wrote:
>
> > On Sun, Apr 3, 2022 at 10:19 AM Michele Ballabio
> > <ballabio.m@gmail.com> wrote:
> > >
> > > Hi,
> > >         I've hit a regression on 5.17.1 (haven't tested 5.17.0, but
> > > 5.16-stable didn't have this problem).
> > >
> > > The machine is a Ryzen 5 1600 with AMD graphics (RX 560).
> > >
> > > The regression I hit seems to trigger when the machine is left
> > > idle at boot (I don't boot straight to X, I boot to a tty, login
> > > and then start X). The machine after a while blanks the screen.
> > > Usually, the screen unblanks as the keyboard is hit or the mouse
> > > moves, but with kernel 5.17.1 the screen does not wake up. The
> > > machine seems to run mostly fine: I can login from ssh, but I
> > > cannot reboot or halt it: a sysrq sequence is needed for that. Note
> > > that if the screen goes blank under X, it wakes up fine.
> > >
> > > Below a dmesg and two traces from syslog (they're quite similar).
> >
> > Can you bisect?  Does setting amdgpu.runpm=0 help?
>
> I can try to bisect, should I narrow the search to drivers/gpu/drm/ ?

I would just do a full bisect if possible in case the change happens
to be outside of drm.

>
> Setting amdgpu.runpm=0 works, the display now unblanks without problems.

Thanks,

Alex


>
> Thanks,
>     Michele Ballabio
