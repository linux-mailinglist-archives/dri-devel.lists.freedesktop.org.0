Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 469FE6F49D7
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 20:41:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B199410E136;
	Tue,  2 May 2023 18:41:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E160310E199;
 Tue,  2 May 2023 18:41:38 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-1929818d7faso2387313fac.0; 
 Tue, 02 May 2023 11:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683052897; x=1685644897;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hf1nbzeuxmrGxLaFcPyheg0k5dWdb1WOfd2ZRdkYljQ=;
 b=KxeIaJ5ERi3qpXkG7StBVWrCgfKWYGTQEffwvsexwDN6wcdaPQypAcRb/2E1KcFelb
 MFbAvi9kBRKKYqqvfmqSvk8S99xdjVslYe9la0xPVS3BSlTV6Lx9SO7WLCbc8tShBWed
 BqF/ivzqM3oaWdLC0bSJ2AoQ+TPoEOOEsBB9J1JZjXcmXprKd9yrz77PREK4wh3MKmC6
 U+gzhXorbHoLY3HtVpTVqRmnXXWkBCpOni/30+kl98eWeHdUr20pyBNA40FW0kJAPHso
 vtBUx4ZTBGDvvQdUmTl4F4Dn00UfGIl/IJfaxLfkwCTTnZz95uELwo/aJKy+pZ2l/t7l
 D3ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683052897; x=1685644897;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hf1nbzeuxmrGxLaFcPyheg0k5dWdb1WOfd2ZRdkYljQ=;
 b=iEM6KLC6d2XkjJd7WLBZ5qChG6Rrlro3+PXA8JHqKJK/XhruETK1DpAybT8PLMp/cb
 l3DIdA4l/SI2DuaSb3FMDESz06uiu5yjtpje1g7RjZ01XsavaXWOz4PUyXVRFlKWXAlO
 7x1DSig4EYSWGyUIrbntkPFgUQ7dortM15WoZoAryDmdX4qA7JskvJxIxeyGw6Zz4SzP
 BNrERBn5WCVqr4Bg4SrvPx05IMHnxgcTPulLdxHdeFTUJnQCSd8RtFTxJJnR04AkLjzQ
 RcFlOMBzwoDYEH7oLSC3m5XhHFVpB0A5IkHkohLJ3ztmBLXkl/LngTMOlNTKxLKwCBE8
 vt1g==
X-Gm-Message-State: AC+VfDxHXr1pSyyDml0I8bDkzsNJW5CfhZ1Dk0HZf4Y4kB2Y6AQoPzHC
 YUgtHABNyYreEuh7aHuQQ0gi6GtZjVkhsmNei+Y=
X-Google-Smtp-Source: ACHHUZ5X2/HRVRvl4XTgw9Ypc8uxuXeVf2u4SdNBz2aaUltGtzBCGXH7gqJ3Rb96O/BTPxXvRuCT7eNhfQ6bDam+jmY=
X-Received: by 2002:aca:de05:0:b0:38e:c54f:5b55 with SMTP id
 v5-20020acade05000000b0038ec54f5b55mr10037022oig.1.1683052897468; Tue, 02 May
 2023 11:41:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230501185747.33519-1-andrealmeid@igalia.com>
 <CADnq5_NXj4W44F_etRQ7HWdVTnf5zARCM3Y_o3EiwWiHj8QMpA@mail.gmail.com>
 <6ab2ff76-4518-6fac-071e-5d0d5adc4fcd@igalia.com>
 <cb3d2590-a1f8-fe7e-0bba-638ee80719af@amd.com>
 <CAFF-SiV0=WNmRW-D9uYUuj68Zq0APxtGLya9KR6FfZ7v0Zf2RQ@mail.gmail.com>
 <fcca2934-a556-797c-535d-a66fc67bbe30@amd.com>
 <85c538b01efb6f3fa6ff05ed1a0bc3ff87df7a61.camel@gmail.com>
 <CADnq5_NHtFbwT=x8u7GYc4ESL_HVFzjgtOd3AnVFBYMrjZq55w@mail.gmail.com>
 <c54414482b685af0991a6b095cbfb7534d998afc.camel@gmail.com>
In-Reply-To: <c54414482b685af0991a6b095cbfb7534d998afc.camel@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 2 May 2023 14:41:25 -0400
Message-ID: <CADnq5_MSY=j9AobDk7ACevur4Hwvw_ub7g16Mfm7ymMJqwVNfQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] Add AMDGPU_INFO_GUILTY_APP ioctl
To: =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>
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
Cc: "Pelloux-Prayer, Pierre-Eric" <pierre-eric.pelloux-prayer@amd.com>,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 michel.daenzer@mailbox.org, linux-kernel@vger.kernel.org,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, kernel-dev@igalia.com, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 2, 2023 at 11:22=E2=80=AFAM Timur Krist=C3=B3f <timur.kristof@g=
mail.com> wrote:
>
> On Tue, 2023-05-02 at 09:45 -0400, Alex Deucher wrote:
> > On Tue, May 2, 2023 at 9:35=E2=80=AFAM Timur Krist=C3=B3f
> > <timur.kristof@gmail.com> wrote:
> > >
> > > Hi,
> > >
> > > On Tue, 2023-05-02 at 13:14 +0200, Christian K=C3=B6nig wrote:
> > > > >
> > > > > Christian K=C3=B6nig <christian.koenig@amd.com> ezt =C3=ADrta (id=
=C5=91pont:
> > > > > 2023.
> > > > > m=C3=A1j. 2., Ke 9:59):
> > > > >
> > > > > > Am 02.05.23 um 03:26 schrieb Andr=C3=A9 Almeida:
> > > > > >  > Em 01/05/2023 16:24, Alex Deucher escreveu:
> > > > > >  >> On Mon, May 1, 2023 at 2:58=E2=80=AFPM Andr=C3=A9 Almeida
> > > > > > <andrealmeid@igalia.com>
> > > > > >  >> wrote:
> > > > > >  >>>
> > > > > >  >>> I know that devcoredump is also used for this kind of
> > > > > > information,
> > > > > >  >>> but I believe
> > > > > >  >>> that using an IOCTL is better for interfacing Mesa +
> > > > > > Linux
> > > > > > rather
> > > > > >  >>> than parsing
> > > > > >  >>> a file that its contents are subjected to be changed.
> > > > > >  >>
> > > > > >  >> Can you elaborate a bit on that?  Isn't the whole point
> > > > > > of
> > > > > > devcoredump
> > > > > >  >> to store this sort of information?
> > > > > >  >>
> > > > > >  >
> > > > > >  > I think that devcoredump is something that you could use
> > > > > > to
> > > > > > submit to
> > > > > >  > a bug report as it is, and then people can read/parse as
> > > > > > they
> > > > > > want,
> > > > > >  > not as an interface to be read by Mesa... I'm not sure
> > > > > > that
> > > > > > it's
> > > > > >  > something that I would call an API. But I might be wrong,
> > > > > > if
> > > > > > you know
> > > > > >  > something that uses that as an API please share.
> > > > > >  >
> > > > > >  > Anyway, relying on that for Mesa would mean that we would
> > > > > > need
> > > > > > to
> > > > > >  > ensure stability for the file content and format, making
> > > > > > it
> > > > > > less
> > > > > >  > flexible to modify in the future and probe to bugs, while
> > > > > > the
> > > > > > IOCTL is
> > > > > >  > well defined and extensible. Maybe the dump from Mesa +
> > > > > > devcoredump
> > > > > >  > could be complementary information to a bug report.
> > > > > >
> > > > > >  Neither using an IOCTL nor devcoredump is a good approach
> > > > > > for
> > > > > > this since
> > > > > >  the values read from the hw register are completely
> > > > > > unreliable.
> > > > > > They
> > > > > >  could not be available because of GFXOFF or they could be
> > > > > > overwritten or
> > > > > >  not even updated by the CP in the first place because of a
> > > > > > hang
> > > > > > etc....
> > > > > >
> > > > > >  If you want to track progress inside an IB what you do
> > > > > > instead
> > > > > > is to
> > > > > >  insert intermediate fence write commands into the IB. E.g.
> > > > > > something
> > > > > >  like write value X to location Y when this executes.
> > > > > >
> > > > > >  This way you can not only track how far the IB processed,
> > > > > > but
> > > > > > also in
> > > > > >  which stages of processing we where when the hang occurred.
> > > > > > E.g.
> > > > > > End of
> > > > > >  Pipe, End of Shaders, specific shader stages etc...
> > > > > >
> > > > > >
> > > > >
> > > > > Currently our biggest challenge in the userspace driver is
> > > > > debugging "random" GPU hangs. We have many dozens of bug
> > > > > reports
> > > > > from users which are like: "play the game for X hours and it
> > > > > will
> > > > > eventually hang the GPU". With the currently available tools,
> > > > > it is
> > > > > impossible for us to tackle these issues. Andr=C3=A9's proposal
> > > > > would be
> > > > > a step in improving this situation.
> > > > >
> > > > > We already do something like what you suggest, but there are
> > > > > multiple problems with that approach:
> > > > >
> > > > > 1. we can only submit 1 command buffer at a time because we
> > > > > won't
> > > > > know which IB hanged
> > > > > 2. we can't use chaining because we don't know where in the IB
> > > > > it
> > > > > hanged
> > > > > 3. it needs userspace to insert (a lot of) extra commands such
> > > > > as
> > > > > extra synchronization and memory writes
> > > > > 4. It doesn't work when GPU recovery is enabled because the
> > > > > information is already gone when we detect the hang
> > > > >
> > > >  You can still submit multiple IBs and even chain them. All you
> > > > need
> > > > to do is to insert into each IB commands which write to an extra
> > > > memory location with the IB executed and the position inside the
> > > > IB.
> > > >
> > > >  The write data command allows to write as many dw as you want
> > > > (up to
> > > > multiple kb). The only potential problem is when you submit the
> > > > same
> > > > IB multiple times.
> > > >
> > > >  And yes that is of course quite some extra overhead, but I think
> > > > that should be manageable.
> > >
> > > Thanks, this sounds doable and would solve the limitation of how
> > > many
> > > IBs are submitted at a time. However it doesn't address the problem
> > > that enabling this sort of debugging will still have extra
> > > overhead.
> > >
> > > I don't mean the overhead from writing a couple of dwords for the
> > > trace, but rather, the overhead from needing to emit flushes or top
> > > of
> > > pipe events or whatever else we need so that we can tell which
> > > command
> > > hung the GPU.
> > >
> > > >
> > > > > In my opinion, the correct solution to those problems would be
> > > > > if
> > > > > the kernel could give userspace the necessary information about
> > > > > a
> > > > > GPU hang before a GPU reset.
> > > > >
> > > >  The fundamental problem here is that the kernel doesn't have
> > > > that
> > > > information either. We know which IB timed out and can
> > > > potentially do
> > > > a devcoredump when that happens, but that's it.
> > >
> > >
> > > Is it really not possible to know such a fundamental thing as what
> > > the
> > > GPU was doing when it hung? How are we supposed to do any kind of
> > > debugging without knowing that?
> > >
> > > I wonder what AMD's Windows driver team is doing with this problem,
> > > surely they must have better tools to deal with GPU hangs?
> >
> > For better or worse, most teams internally rely on scan dumps via
> > JTAG
> > which sort of limits the usefulness outside of AMD, but also gives
> > you
> > the exact state of the hardware when it's hung so the hardware teams
> > prefer it.
> >
>
> How does this approach scale? It's not something we can ask users to
> do, and even if all of us in the radv team had a JTAG device, we
> wouldn't be able to play every game that users experience random hangs
> with.

It doesn't scale or lend itself particularly well to external
development, but that's the current state of affairs.

Alex
