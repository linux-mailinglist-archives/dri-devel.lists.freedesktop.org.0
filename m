Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 712C56F518E
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 09:31:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BE0A10E1C5;
	Wed,  3 May 2023 07:30:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 203A310E54F;
 Tue,  2 May 2023 13:35:03 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-94f4b911570so636866866b.0; 
 Tue, 02 May 2023 06:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683034501; x=1685626501;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=JVH5AJjja3pPY3sWXOLr3HAvkOpaT8bDdz1vHu3io70=;
 b=smnsIa775JInjUyX4bAQxoeEaKr4Z+jyqv9zS2Vp25Hy6Fuus5FfvGg6XbFOMvT+g9
 iofyrIhCMZIZy3YxCfQxlqPadJWmw6OjmMMcQ+lIuC2+0SvTXwpuvDVcEhUrWfKVYl2v
 wUzeIwoj01OBSN0S7QA2lWEUIUWNBF6iqaWgbdAL707A9ZOQXig6+BUdKj6O9at9Bgpf
 vauwzJVif5VcrSC1B4f4rpj+4ukF0GvwG2mcW/IzsLjS7Kyh+YDMzSngsV3jLT6iDUc1
 Ttbyn0hMq8qT0gT+l1XovH0J1N4viM/pBSzw8COx08wv0W3fHql3VmyIOB5cV7zghjw1
 tOPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683034501; x=1685626501;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JVH5AJjja3pPY3sWXOLr3HAvkOpaT8bDdz1vHu3io70=;
 b=IA6wjEFP4uUQXMf12pzKXxIC4wCk2JueY8w64LQTGcJVeF2VL3+wWooJGHxTJJR3qm
 oyfyoYLg/jL5XbMA/OK4kbSkgxlbj9OfZ8p48nbWuFodx7LjCX62B1I92yjaDsqX/hhP
 30l8XTTN0BR50upSO0cPRhfeCh+Ar0MFg6gMxMDD4T5y0RAoPbc4CfhsVc/AkuG7kcY+
 fnKUUwkc3EyEdrt3bmfHnaAP/040ydhKX021Xfj9kQYnw04p+4cJG+aINNSLNSkRwp9L
 cUYZiCDKB6wi1cWBzKe6i6ShXIqk6c5lkQYi5/bdip2dqUEZ5AGMM6ZadLAED6m9e9/Z
 CrDQ==
X-Gm-Message-State: AC+VfDyX56OzGaKdm/UyV2Lw116xsBTaOqgFWNL09IBn7dcv0nG7NMr/
 x6KEQcm683Fl7N4RfecIAGE=
X-Google-Smtp-Source: ACHHUZ71Nwj8YIRowvMB6/x0odouahdD2qJnabwkYp1IHKOoTqDiDWl1wL087moMnxiNSTgyxN4DQw==
X-Received: by 2002:a17:906:d54c:b0:95f:a89d:efb7 with SMTP id
 cr12-20020a170906d54c00b0095fa89defb7mr20039783ejc.69.1683034501103; 
 Tue, 02 May 2023 06:35:01 -0700 (PDT)
Received: from [192.168.0.131] (catv-89-134-213-173.catv.fixed.vodafone.hu.
 [89.134.213.173]) by smtp.gmail.com with ESMTPSA id
 k18-20020a1709060cb200b0094ed72b6552sm16158174ejh.98.2023.05.02.06.34.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 06:35:00 -0700 (PDT)
Message-ID: <85c538b01efb6f3fa6ff05ed1a0bc3ff87df7a61.camel@gmail.com>
Subject: Re: [RFC PATCH 0/1] Add AMDGPU_INFO_GUILTY_APP ioctl
From: Timur =?ISO-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Date: Tue, 02 May 2023 15:34:59 +0200
In-Reply-To: <fcca2934-a556-797c-535d-a66fc67bbe30@amd.com>
References: <20230501185747.33519-1-andrealmeid@igalia.com>
 <CADnq5_NXj4W44F_etRQ7HWdVTnf5zARCM3Y_o3EiwWiHj8QMpA@mail.gmail.com>
 <6ab2ff76-4518-6fac-071e-5d0d5adc4fcd@igalia.com>
 <cb3d2590-a1f8-fe7e-0bba-638ee80719af@amd.com>
 <CAFF-SiV0=WNmRW-D9uYUuj68Zq0APxtGLya9KR6FfZ7v0Zf2RQ@mail.gmail.com>
 <fcca2934-a556-797c-535d-a66fc67bbe30@amd.com>
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
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, kernel-dev@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, 2023-05-02 at 13:14 +0200, Christian K=C3=B6nig wrote:
> >=20
> > Christian K=C3=B6nig <christian.koenig@amd.com> ezt =C3=ADrta (id=C5=91=
pont: 2023.
> > m=C3=A1j. 2., Ke 9:59):
> > =C2=A0
> > > Am 02.05.23 um 03:26 schrieb Andr=C3=A9 Almeida:
> > > =C2=A0> Em 01/05/2023 16:24, Alex Deucher escreveu:
> > > =C2=A0>> On Mon, May 1, 2023 at 2:58=E2=80=AFPM Andr=C3=A9 Almeida
> > > <andrealmeid@igalia.com>=20
> > > =C2=A0>> wrote:
> > > =C2=A0>>>
> > > =C2=A0>>> I know that devcoredump is also used for this kind of
> > > information,=20
> > > =C2=A0>>> but I believe
> > > =C2=A0>>> that using an IOCTL is better for interfacing Mesa + Linux
> > > rather=20
> > > =C2=A0>>> than parsing
> > > =C2=A0>>> a file that its contents are subjected to be changed.
> > > =C2=A0>>
> > > =C2=A0>> Can you elaborate a bit on that?=C2=A0 Isn't the whole point=
 of
> > > devcoredump
> > > =C2=A0>> to store this sort of information?
> > > =C2=A0>>
> > > =C2=A0>
> > > =C2=A0> I think that devcoredump is something that you could use to
> > > submit to=20
> > > =C2=A0> a bug report as it is, and then people can read/parse as they
> > > want,=20
> > > =C2=A0> not as an interface to be read by Mesa... I'm not sure that
> > > it's=20
> > > =C2=A0> something that I would call an API. But I might be wrong, if
> > > you know=20
> > > =C2=A0> something that uses that as an API please share.
> > > =C2=A0>
> > > =C2=A0> Anyway, relying on that for Mesa would mean that we would nee=
d
> > > to=20
> > > =C2=A0> ensure stability for the file content and format, making it
> > > less=20
> > > =C2=A0> flexible to modify in the future and probe to bugs, while the
> > > IOCTL is=20
> > > =C2=A0> well defined and extensible. Maybe the dump from Mesa +
> > > devcoredump=20
> > > =C2=A0> could be complementary information to a bug report.
> > > =C2=A0
> > > =C2=A0Neither using an IOCTL nor devcoredump is a good approach for
> > > this since=20
> > > =C2=A0the values read from the hw register are completely unreliable.
> > > They=20
> > > =C2=A0could not be available because of GFXOFF or they could be
> > > overwritten or=20
> > > =C2=A0not even updated by the CP in the first place because of a hang
> > > etc....
> > > =C2=A0
> > > =C2=A0If you want to track progress inside an IB what you do instead
> > > is to=20
> > > =C2=A0insert intermediate fence write commands into the IB. E.g.
> > > something=20
> > > =C2=A0like write value X to location Y when this executes.
> > > =C2=A0
> > > =C2=A0This way you can not only track how far the IB processed, but
> > > also in=20
> > > =C2=A0which stages of processing we where when the hang occurred. E.g=
.
> > > End of=20
> > > =C2=A0Pipe, End of Shaders, specific shader stages etc...
> > > =C2=A0
> > >=20
> > =C2=A0
> > Currently our biggest challenge in the userspace driver is
> > debugging "random" GPU hangs. We have many dozens of bug reports
> > from users which are like: "play the game for X hours and it will
> > eventually hang the GPU". With the currently available tools, it is
> > impossible for us to tackle these issues. Andr=C3=A9's proposal would b=
e
> > a step in improving this situation.
> >=20
> > We already do something like what you suggest, but there are
> > multiple problems with that approach:
> > =C2=A0
> > 1. we can only submit 1 command buffer at a time because we won't
> > know which IB hanged
> > 2. we can't use chaining because we don't know where in the IB it
> > hanged
> > 3. it needs userspace to insert (a lot of) extra commands such as
> > extra synchronization and memory writes
> > 4. It doesn't work when GPU recovery is enabled because the
> > information is already gone when we detect the hang
> >=20
> =C2=A0You can still submit multiple IBs and even chain them. All you need
> to do is to insert into each IB commands which write to an extra
> memory location with the IB executed and the position inside the IB.
>=20
> =C2=A0The write data command allows to write as many dw as you want (up t=
o
> multiple kb). The only potential problem is when you submit the same
> IB multiple times.
>=20
> =C2=A0And yes that is of course quite some extra overhead, but I think
> that should be manageable.

Thanks, this sounds doable and would solve the limitation of how many
IBs are submitted at a time. However it doesn't address the problem
that enabling this sort of debugging will still have extra overhead.

I don't mean the overhead from writing a couple of dwords for the
trace, but rather, the overhead from needing to emit flushes or top of
pipe events or whatever else we need so that we can tell which command
hung the GPU.

> =C2=A0
> > In my opinion, the correct solution to those problems would be if
> > the kernel could give userspace the necessary information about a
> > GPU hang before a GPU reset.
> > =C2=A0=C2=A0
> =C2=A0The fundamental problem here is that the kernel doesn't have that
> information either. We know which IB timed out and can potentially do
> a devcoredump when that happens, but that's it.


Is it really not possible to know such a fundamental thing as what the
GPU was doing when it hung? How are we supposed to do any kind of
debugging without knowing that?

I wonder what AMD's Windows driver team is doing with this problem,
surely they must have better tools to deal with GPU hangs?

Best regards,
Timur



