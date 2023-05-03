Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C91CA6F5E9A
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 20:54:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDA9110E343;
	Wed,  3 May 2023 18:53:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F66C10E338;
 Wed,  3 May 2023 18:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TnXjnnNQEk7mmdMdN6pT1sGeZZpZvUmTNyQAUJg2clA=; b=RwTswZytXM9X3cYvWRDXL1/DkF
 k6tC+BF75STo4V3FjSisvAo03/+AywzrVRubmScryfqzUjn8obo1t4q2BjxGENK7HgUldhBAXIwGM
 h+YcyVCG9ZW8K3GYUhw+NWmll/W99ZigZFA848qVikWueyMhF1x/VSFpKt54BUKbikAEZcj9joVAS
 cXllL2ZT+SvdkMkFRYOwDRUXDdk1vydmspFUsn0a1tyLSPJHhbErEMoDPzkyB914MTHuXK4bgSZ2B
 j/3c9FPWmJp6jJexSrlocdlz1okV3RUHytILnDwP0JIjW1vV7y7I0SydzWSjAP0OxiQ6kMtswW7OK
 2V9mikyw==;
Received: from [179.113.250.147] (helo=[192.168.1.111])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1puHbo-000df5-1a; Wed, 03 May 2023 20:53:48 +0200
Message-ID: <4c0ed590-4237-435d-40b3-21dffa9f9f00@igalia.com>
Date: Wed, 3 May 2023 15:52:58 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [RFC PATCH 0/1] Add AMDGPU_INFO_GUILTY_APP ioctl
Content-Language: en-US
To: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
References: <20230501185747.33519-1-andrealmeid@igalia.com>
 <CADnq5_NXj4W44F_etRQ7HWdVTnf5zARCM3Y_o3EiwWiHj8QMpA@mail.gmail.com>
 <6ab2ff76-4518-6fac-071e-5d0d5adc4fcd@igalia.com>
 <cb3d2590-a1f8-fe7e-0bba-638ee80719af@amd.com>
 <CAFF-SiV0=WNmRW-D9uYUuj68Zq0APxtGLya9KR6FfZ7v0Zf2RQ@mail.gmail.com>
 <fcca2934-a556-797c-535d-a66fc67bbe30@amd.com>
 <85c538b01efb6f3fa6ff05ed1a0bc3ff87df7a61.camel@gmail.com>
 <CADnq5_NHtFbwT=x8u7GYc4ESL_HVFzjgtOd3AnVFBYMrjZq55w@mail.gmail.com>
 <c54414482b685af0991a6b095cbfb7534d998afc.camel@gmail.com>
 <CADnq5_MSY=j9AobDk7ACevur4Hwvw_ub7g16Mfm7ymMJqwVNfQ@mail.gmail.com>
 <57fa0ee4-de4f-3797-f817-d05f72541d0e@gmail.com>
 <2bf162d0-6112-8370-8828-0e0b21ac22ba@amd.com>
 <76bd16ac-9251-c71f-8da3-4c4c14d3bdcf@gmail.com>
 <CAAxE2A7wzrt9m0LifB=vPFr7aEtwyh9zzDDh9DkZJux2A4kKqw@mail.gmail.com>
From: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <CAAxE2A7wzrt9m0LifB=vPFr7aEtwyh9zzDDh9DkZJux2A4kKqw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
 amd-gfx list <amd-gfx@lists.freedesktop.org>, michel.daenzer@mailbox.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Felix Kuehling <felix.kuehling@amd.com>,
 =?UTF-8?Q?Timur_Krist=c3=b3f?= <timur.kristof@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>, kernel-dev@igalia.com,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Em 03/05/2023 14:08, Marek Olšák escreveu:
> GPU hangs are pretty common post-bringup. They are not common per user, 
> but if we gather all hangs from all users, we can have lots and lots of 
> them.
> 
> GPU hangs are indeed not very debuggable. There are however some things 
> we can do:
> - Identify the hanging IB by its VA (the kernel should know it)

How can the kernel tell which VA range is being executed? I only found 
that information at mmCP_IB1_BASE_ regs, but as stated in this thread by 
Christian this is not reliable to be read.

> - Read and parse the IB to detect memory corruption.
> - Print active waves with shader disassembly if SQ isn't hung (often 
> it's not).
> 
> Determining which packet the CP is stuck on is tricky. The CP has 2 
> engines (one frontend and one backend) that work on the same command 
> buffer. The frontend engine runs ahead, executes some packets and 
> forwards others to the backend engine. Only the frontend engine has the 
> command buffer VA somewhere. The backend engine only receives packets 
> from the frontend engine via a FIFO, so it might not be possible to tell 
> where it's stuck if it's stuck.

Do they run at the same asynchronously or does the front end waits the 
back end to execute?

> 
> When the gfx pipeline hangs outside of shaders, making a scandump seems 
> to be the only way to have a chance at finding out what's going wrong, 
> and only AMD-internal versions of hw can be scanned.
> 
> Marek
> 
> On Wed, May 3, 2023 at 11:23 AM Christian König 
> <ckoenig.leichtzumerken@gmail.com 
> <mailto:ckoenig.leichtzumerken@gmail.com>> wrote:
> 
>     Am 03.05.23 um 17:08 schrieb Felix Kuehling:
>      > Am 2023-05-03 um 03:59 schrieb Christian König:
>      >> Am 02.05.23 um 20:41 schrieb Alex Deucher:
>      >>> On Tue, May 2, 2023 at 11:22 AM Timur Kristóf
>      >>> <timur.kristof@gmail.com <mailto:timur.kristof@gmail.com>> wrote:
>      >>>> [SNIP]
>      >>>>>>>> In my opinion, the correct solution to those problems would be
>      >>>>>>>> if
>      >>>>>>>> the kernel could give userspace the necessary information
>     about
>      >>>>>>>> a
>      >>>>>>>> GPU hang before a GPU reset.
>      >>>>>>>>
>      >>>>>>>   The fundamental problem here is that the kernel doesn't have
>      >>>>>>> that
>      >>>>>>> information either. We know which IB timed out and can
>      >>>>>>> potentially do
>      >>>>>>> a devcoredump when that happens, but that's it.
>      >>>>>>
>      >>>>>> Is it really not possible to know such a fundamental thing
>     as what
>      >>>>>> the
>      >>>>>> GPU was doing when it hung? How are we supposed to do any
>     kind of
>      >>>>>> debugging without knowing that?
>      >>
>      >> Yes, that's indeed something at least I try to figure out for years
>      >> as well.
>      >>
>      >> Basically there are two major problems:
>      >> 1. When the ASIC is hung you can't talk to the firmware engines any
>      >> more and most state is not exposed directly, but just through some
>      >> fw/hw interface.
>      >>     Just take a look at how umr reads the shader state from the SQ.
>      >> When that block is hung you can't do that any more and basically
>     have
>      >> no chance at all to figure out why it's hung.
>      >>
>      >>     Same for other engines, I remember once spending a week
>     figuring
>      >> out why the UVD block is hung during suspend. Turned out to be a
>      >> debugging nightmare because any time you touch any register of that
>      >> block the whole system would hang.
>      >>
>      >> 2. There are tons of things going on in a pipeline fashion or even
>      >> completely in parallel. For example the CP is just the beginning
>     of a
>      >> rather long pipeline which at the end produces a bunch of pixels.
>      >>     In almost all cases I've seen you ran into a problem somewhere
>      >> deep in the pipeline and only very rarely at the beginning.
>      >>
>      >>>>>>
>      >>>>>> I wonder what AMD's Windows driver team is doing with this
>     problem,
>      >>>>>> surely they must have better tools to deal with GPU hangs?
>      >>>>> For better or worse, most teams internally rely on scan dumps via
>      >>>>> JTAG
>      >>>>> which sort of limits the usefulness outside of AMD, but also
>     gives
>      >>>>> you
>      >>>>> the exact state of the hardware when it's hung so the
>     hardware teams
>      >>>>> prefer it.
>      >>>>>
>      >>>> How does this approach scale? It's not something we can ask
>     users to
>      >>>> do, and even if all of us in the radv team had a JTAG device, we
>      >>>> wouldn't be able to play every game that users experience
>     random hangs
>      >>>> with.
>      >>> It doesn't scale or lend itself particularly well to external
>      >>> development, but that's the current state of affairs.
>      >>
>      >> The usual approach seems to be to reproduce a problem in a lab and
>      >> have a JTAG attached to give the hw guys a scan dump and they can
>      >> then tell you why something didn't worked as expected.
>      >
>      > That's the worst-case scenario where you're debugging HW or FW
>     issues.
>      > Those should be pretty rare post-bringup. But are there hangs caused
>      > by user mode driver or application bugs that are easier to debug and
>      > probably don't even require a GPU reset? For example most VM faults
>      > can be handled without hanging the GPU. Similarly, a shader in an
>      > endless loop should not require a full GPU reset. In the KFD compute
>      > case, that's still preemptible and the offending process can be
>     killed
>      > with Ctrl-C or debugged with rocm-gdb.
> 
>     We also have infinite loop in shader abort for gfx and page faults are
>     pretty rare with OpenGL (a bit more often with Vulkan) and can be
>     handled gracefully on modern hw (they just spam the logs).
> 
>     The majority of the problems is unfortunately that we really get hard
>     hangs because of some hw issues. That can be caused by unlucky timing,
>     power management or doing things in an order the hw doesn't expected.
> 
>     Regards,
>     Christian.
> 
>      >
>      > It's more complicated for graphics because of the more complex
>      > pipeline and the lack of CWSR. But it should still be possible to do
>      > some debugging without JTAG if the problem is in SW and not HW or
>     FW.
>      > It's probably worth improving that debugability without getting
>      > hung-up on the worst case.
>      >
>      > Maybe user mode graphics queues will offer a better way of
>     recovering
>      > from these kinds of bugs, if the graphics pipeline can be unstuck
>      > without a GPU reset, just by killing the offending user mode queue.
>      >
>      > Regards,
>      >   Felix
>      >
>      >
>      >>
>      >> And yes that absolutely doesn't scale.
>      >>
>      >> Christian.
>      >>
>      >>>
>      >>> Alex
>      >>
> 
