Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA476F518A
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 09:30:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23D6210E1BC;
	Wed,  3 May 2023 07:30:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE93510E373;
 Tue,  2 May 2023 15:22:51 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2a8aea2a654so38537381fa.1; 
 Tue, 02 May 2023 08:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683040970; x=1685632970;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=fPK0QjUxHX3a6I/jaRNvVSBSf3l6DRXHloilqaGemEk=;
 b=gXT3z0mL4BcBfHS+MMvmBznO2GyQc6ucwsF15zrxc4N0gh+SZ2q1d4tEES4uwUwvGH
 MzRvNfA9B0yzfEzxlm+aSMjh391/xbx7C1gBzcqIXKuP48+zPW0NRtbLQSyjC2C+G+dv
 V4HSTMB/iG9jq+9YVM1b+GCzcmVv52ydR7jEtNpJvLsvt5rC41cxwcB6QV4qkCqrYg3j
 y9vwSiB5RkpOys0/5t11tzrjOqAw0bGdN5OuTeQbIwFENA+tqeo78VHAwU6Xd1RKRNLF
 9cWQmpRT4jNoCOaPygd0H1qlSiPy3h5NR/8Z9dq4NEHgbGCk/OguHs+j7Be0y5RZcetI
 Mc2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683040970; x=1685632970;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fPK0QjUxHX3a6I/jaRNvVSBSf3l6DRXHloilqaGemEk=;
 b=VRPs4uBvnIlLJUnn0T97cBk+V1ombjFeDI7dMk0QUS9zbrpK0hzlVvMKB+Yjtd0RL6
 8nyCR4TQbu46L/ZbVT3Bi4AJPJX2syfL+GVwgQVn+3nPTViGnzwNonVCkhYzyjTy1U2G
 BRKev8FoOH3fu/+JcGrzs92pAi8DseyQ+fbqMfAxRKYdthZY2VDmodiPpzFALyQ0mZCA
 aSg9pFJjRRpks/gWqlaWL2PiE8/O4ddSFr2A2uHCRtc91uhfpXCDurECSSsbF6rhhVn4
 9Omo3OkicxlJusB1JY5nK+gXETyzIajLEmrjY63a1Vv24RhZ8YEoTDaqbg08PN0Gvq13
 rmXQ==
X-Gm-Message-State: AC+VfDwLHFr/BHT3REMdiHRXj4g0VnsnWFD+v6w+H5Z5+0Z+ETG7AaMo
 R2jg3CfHkyce2IE2A3vSzUU=
X-Google-Smtp-Source: ACHHUZ5NKlETULJWN9Uqbjy1tAPW4/+WZBAbCJu0M2sfzSCehvg3akwUcIMvmFKMcpFfSsuiIy2B6g==
X-Received: by 2002:a19:f502:0:b0:4e8:3d24:de6f with SMTP id
 j2-20020a19f502000000b004e83d24de6fmr91127lfb.14.1683040969517; 
 Tue, 02 May 2023 08:22:49 -0700 (PDT)
Received: from [192.168.0.131] (catv-89-134-213-173.catv.fixed.vodafone.hu.
 [89.134.213.173]) by smtp.gmail.com with ESMTPSA id
 p5-20020ac246c5000000b004eafabb4dc1sm5430672lfo.250.2023.05.02.08.22.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 08:22:48 -0700 (PDT)
Message-ID: <c54414482b685af0991a6b095cbfb7534d998afc.camel@gmail.com>
Subject: Re: [RFC PATCH 0/1] Add AMDGPU_INFO_GUILTY_APP ioctl
From: Timur =?ISO-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>
To: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 02 May 2023 17:22:46 +0200
In-Reply-To: <CADnq5_NHtFbwT=x8u7GYc4ESL_HVFzjgtOd3AnVFBYMrjZq55w@mail.gmail.com>
References: <20230501185747.33519-1-andrealmeid@igalia.com>
 <CADnq5_NXj4W44F_etRQ7HWdVTnf5zARCM3Y_o3EiwWiHj8QMpA@mail.gmail.com>
 <6ab2ff76-4518-6fac-071e-5d0d5adc4fcd@igalia.com>
 <cb3d2590-a1f8-fe7e-0bba-638ee80719af@amd.com>
 <CAFF-SiV0=WNmRW-D9uYUuj68Zq0APxtGLya9KR6FfZ7v0Zf2RQ@mail.gmail.com>
 <fcca2934-a556-797c-535d-a66fc67bbe30@amd.com>
 <85c538b01efb6f3fa6ff05ed1a0bc3ff87df7a61.camel@gmail.com>
 <CADnq5_NHtFbwT=x8u7GYc4ESL_HVFzjgtOd3AnVFBYMrjZq55w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1 (3.48.1-1.fc38) 
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 03 May 2023 07:30:49 +0000
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
 =?ISO-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 Marek =?UTF-8?Q?Ol=C5=A1=C3=A1k?= <maraeo@gmail.com>,
 michel.daenzer@mailbox.org, linux-kernel@vger.kernel.org,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, kernel-dev@igalia.com, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2023-05-02 at 09:45 -0400, Alex Deucher wrote:
> On Tue, May 2, 2023 at 9:35=E2=80=AFAM Timur Krist=C3=B3f
> <timur.kristof@gmail.com> wrote:
> >=20
> > Hi,
> >=20
> > On Tue, 2023-05-02 at 13:14 +0200, Christian K=C3=B6nig wrote:
> > > >=20
> > > > Christian K=C3=B6nig <christian.koenig@amd.com> ezt =C3=ADrta (id=
=C5=91pont:
> > > > 2023.
> > > > m=C3=A1j. 2., Ke 9:59):
> > > >=20
> > > > > Am 02.05.23 um 03:26 schrieb Andr=C3=A9 Almeida:
> > > > > =C2=A0> Em 01/05/2023 16:24, Alex Deucher escreveu:
> > > > > =C2=A0>> On Mon, May 1, 2023 at 2:58=E2=80=AFPM Andr=C3=A9 Almeid=
a
> > > > > <andrealmeid@igalia.com>
> > > > > =C2=A0>> wrote:
> > > > > =C2=A0>>>
> > > > > =C2=A0>>> I know that devcoredump is also used for this kind of
> > > > > information,
> > > > > =C2=A0>>> but I believe
> > > > > =C2=A0>>> that using an IOCTL is better for interfacing Mesa +
> > > > > Linux
> > > > > rather
> > > > > =C2=A0>>> than parsing
> > > > > =C2=A0>>> a file that its contents are subjected to be changed.
> > > > > =C2=A0>>
> > > > > =C2=A0>> Can you elaborate a bit on that?=C2=A0 Isn't the whole p=
oint
> > > > > of
> > > > > devcoredump
> > > > > =C2=A0>> to store this sort of information?
> > > > > =C2=A0>>
> > > > > =C2=A0>
> > > > > =C2=A0> I think that devcoredump is something that you could use
> > > > > to
> > > > > submit to
> > > > > =C2=A0> a bug report as it is, and then people can read/parse as
> > > > > they
> > > > > want,
> > > > > =C2=A0> not as an interface to be read by Mesa... I'm not sure
> > > > > that
> > > > > it's
> > > > > =C2=A0> something that I would call an API. But I might be wrong,
> > > > > if
> > > > > you know
> > > > > =C2=A0> something that uses that as an API please share.
> > > > > =C2=A0>
> > > > > =C2=A0> Anyway, relying on that for Mesa would mean that we would
> > > > > need
> > > > > to
> > > > > =C2=A0> ensure stability for the file content and format, making
> > > > > it
> > > > > less
> > > > > =C2=A0> flexible to modify in the future and probe to bugs, while
> > > > > the
> > > > > IOCTL is
> > > > > =C2=A0> well defined and extensible. Maybe the dump from Mesa +
> > > > > devcoredump
> > > > > =C2=A0> could be complementary information to a bug report.
> > > > >=20
> > > > > =C2=A0Neither using an IOCTL nor devcoredump is a good approach
> > > > > for
> > > > > this since
> > > > > =C2=A0the values read from the hw register are completely
> > > > > unreliable.
> > > > > They
> > > > > =C2=A0could not be available because of GFXOFF or they could be
> > > > > overwritten or
> > > > > =C2=A0not even updated by the CP in the first place because of a
> > > > > hang
> > > > > etc....
> > > > >=20
> > > > > =C2=A0If you want to track progress inside an IB what you do
> > > > > instead
> > > > > is to
> > > > > =C2=A0insert intermediate fence write commands into the IB. E.g.
> > > > > something
> > > > > =C2=A0like write value X to location Y when this executes.
> > > > >=20
> > > > > =C2=A0This way you can not only track how far the IB processed,
> > > > > but
> > > > > also in
> > > > > =C2=A0which stages of processing we where when the hang occurred.
> > > > > E.g.
> > > > > End of
> > > > > =C2=A0Pipe, End of Shaders, specific shader stages etc...
> > > > >=20
> > > > >=20
> > > >=20
> > > > Currently our biggest challenge in the userspace driver is
> > > > debugging "random" GPU hangs. We have many dozens of bug
> > > > reports
> > > > from users which are like: "play the game for X hours and it
> > > > will
> > > > eventually hang the GPU". With the currently available tools,
> > > > it is
> > > > impossible for us to tackle these issues. Andr=C3=A9's proposal
> > > > would be
> > > > a step in improving this situation.
> > > >=20
> > > > We already do something like what you suggest, but there are
> > > > multiple problems with that approach:
> > > >=20
> > > > 1. we can only submit 1 command buffer at a time because we
> > > > won't
> > > > know which IB hanged
> > > > 2. we can't use chaining because we don't know where in the IB
> > > > it
> > > > hanged
> > > > 3. it needs userspace to insert (a lot of) extra commands such
> > > > as
> > > > extra synchronization and memory writes
> > > > 4. It doesn't work when GPU recovery is enabled because the
> > > > information is already gone when we detect the hang
> > > >=20
> > > =C2=A0You can still submit multiple IBs and even chain them. All you
> > > need
> > > to do is to insert into each IB commands which write to an extra
> > > memory location with the IB executed and the position inside the
> > > IB.
> > >=20
> > > =C2=A0The write data command allows to write as many dw as you want
> > > (up to
> > > multiple kb). The only potential problem is when you submit the
> > > same
> > > IB multiple times.
> > >=20
> > > =C2=A0And yes that is of course quite some extra overhead, but I thin=
k
> > > that should be manageable.
> >=20
> > Thanks, this sounds doable and would solve the limitation of how
> > many
> > IBs are submitted at a time. However it doesn't address the problem
> > that enabling this sort of debugging will still have extra
> > overhead.
> >=20
> > I don't mean the overhead from writing a couple of dwords for the
> > trace, but rather, the overhead from needing to emit flushes or top
> > of
> > pipe events or whatever else we need so that we can tell which
> > command
> > hung the GPU.
> >=20
> > >=20
> > > > In my opinion, the correct solution to those problems would be
> > > > if
> > > > the kernel could give userspace the necessary information about
> > > > a
> > > > GPU hang before a GPU reset.
> > > >=20
> > > =C2=A0The fundamental problem here is that the kernel doesn't have
> > > that
> > > information either. We know which IB timed out and can
> > > potentially do
> > > a devcoredump when that happens, but that's it.
> >=20
> >=20
> > Is it really not possible to know such a fundamental thing as what
> > the
> > GPU was doing when it hung? How are we supposed to do any kind of
> > debugging without knowing that?
> >=20
> > I wonder what AMD's Windows driver team is doing with this problem,
> > surely they must have better tools to deal with GPU hangs?
>=20
> For better or worse, most teams internally rely on scan dumps via
> JTAG
> which sort of limits the usefulness outside of AMD, but also gives
> you
> the exact state of the hardware when it's hung so the hardware teams
> prefer it.
>=20

How does this approach scale? It's not something we can ask users to
do, and even if all of us in the radv team had a JTAG device, we
wouldn't be able to play every game that users experience random hangs
with.



