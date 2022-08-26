Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A8D5A298D
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 16:31:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0396410E943;
	Fri, 26 Aug 2022 14:31:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C61C10E93F;
 Fri, 26 Aug 2022 14:31:46 +0000 (UTC)
Received: by mail-oo1-xc2f.google.com with SMTP id
 u3-20020a4ab5c3000000b0044b125e5d9eso301232ooo.12; 
 Fri, 26 Aug 2022 07:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=ozDTceTfUzqIFpyT0YcSUK9TplSXxX9G3oavml2m3j4=;
 b=MlmxpO+iBvw0GkojD3IajC7FwAea3Z4+dChqSX7MMC1gPHSTDD3uDn2GDhz4XmISOK
 3z0cXkAX0N93LG91xvrnQMJAug891CRdWbwFEeQi/1R3fBtAMfbd5GH05QdURjj9ZGrH
 K3QivdQF9NBwEwus7jQmYS2KUjl97h6BJfQ9U8GCydz5QD1LQC+l6tAtc24HB0QK9bq6
 1XkDfj81aa80ybSjCdaajXwr6gPgNpEwCGy81wJg8FiBkQq5PO6KhjFGEvHZmFQpeTvI
 M71BdGp0dqtziYGJVlzEwDYQR30M61M598G6QhX4GwYhYsSQbxsHbOv8cuy0S/lk+Yqq
 Farg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=ozDTceTfUzqIFpyT0YcSUK9TplSXxX9G3oavml2m3j4=;
 b=vKct0Ua9YX2EqL+z2Y9GtNv64GdfiL1XAA4eDTNY3rqZRbTWNFFGQE2teNak7kpWTn
 HnfDcG1P6WxuTrHK34ORo13BzhxOLZfLL2d8+h/upBqM9p3rrIQmRQx8qybqx5vumtVt
 EnopTdXF+VrgcWqUj+z2kb0UmfBbfc2AzNL2Url9AJv8Ka8OPXim3huPYwb3UlrbFh/Y
 1UX/xvOUFmoGGfRaW5DCs6AlYAiSLzbKhfTu9bj39txtK8aIIx1Sh8jF4GeedcKpClSl
 tgrw//JOiWcQ8z7lsw+iZ7MIX+xF1d/JQKnw0Mr9FzqI4IdIzFk2QxfWuL+bQOhqVkS4
 vmDA==
X-Gm-Message-State: ACgBeo1a1h1bdW0bYATf6wfM18aoQ94OQm/mZc4U10kcxtsA2Ll8fUUy
 22nUZxcjjR6Uqro7FUukV+JdbHU8MR5QQcjsy84=
X-Google-Smtp-Source: AA6agR6OTc8Q6hLSMcU85KNwKBqdNmESy8A+oSktMGR+afdi+apNZb18+AtL2ToJQ6vJJnhB63SgwQBw3XBFL3bEgNE=
X-Received: by 2002:a4a:aa81:0:b0:44a:da30:274e with SMTP id
 d1-20020a4aaa81000000b0044ada30274emr1330760oon.97.1661524305634; Fri, 26 Aug
 2022 07:31:45 -0700 (PDT)
MIME-Version: 1.0
References: <YuwRyQYPCb1FD+mr@debian>
 <CAHk-=whptVSSZL=wSUQJdRBeVfS+Xy_K4anQ7eQOky7XUrXhUQ@mail.gmail.com>
 <CAK8P3a2bEaExue0OtNeLa2CVzBx-1dE9w2HZ2PAV5N8Ct9G=JQ@mail.gmail.com>
 <YuwvfsztWaHvquwC@dev-arch.thelio-3990X>
 <9fb73284-7572-5703-93d3-f83a43535baf@amd.com>
 <CAK8P3a3Fv=_+GV9r=k4jP72zZOjJowL-GOue-51EhyVDBaEfEw@mail.gmail.com>
 <Yu1bMqL5tsbq1ojj@dev-arch.thelio-3990X>
 <CAK8P3a3PAxkctN6AXOsoTBTFgwHhk7_OSYwJ4Rgk7Dbs+bc0Qw@mail.gmail.com>
 <Yv5h0rb3AgTZLVJv@dev-arch.thelio-3990X>
 <Ywf5ATPG7a/I0SLu@dev-arch.thelio-3990X>
In-Reply-To: <Ywf5ATPG7a/I0SLu@dev-arch.thelio-3990X>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 26 Aug 2022 10:31:34 -0400
Message-ID: <CADnq5_NmsnsoJqB8HZ-JQ9B4B+5ZBQ0hM+T-NDSu8xyp5tUVcw@mail.gmail.com>
Subject: Re: mainline build failure for x86_64 allmodconfig with clang
To: Nathan Chancellor <nathan@kernel.org>
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
Cc: Arnd Bergmann <arnd@kernel.org>, clang-built-linux <llvm@lists.linux.dev>,
 David Airlie <airlied@linux.ie>,
 Linus Torvalds <torvalds@linux-foundation.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "Sudip Mukherjee \(Codethink\)" <sudipm.mukherjee@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 25, 2022 at 6:34 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> Hi AMD folks,
>
> Top posting because it might not have been obvious but I was looking for
> your feedback on this message (which can be viewed on lore.kernel.org if
> you do not have the original [1]) so that we can try to get this fixed
> in some way for 6.0/6.1. If my approach is not welcome, please consider
> suggesting another one or looking to see if this is something you all
> could look into.

The patch looks good to me.  I was hoping Harry or Rodrigo could
comment more since they are more familiar with this code and trying to
keep it in sync with what we get from the hardware teams.

Alex


>
> [1]: https://lore.kernel.org/Yv5h0rb3AgTZLVJv@dev-arch.thelio-3990X/
>
> Cheers,
> Nathan
>
> On Thu, Aug 18, 2022 at 08:59:14AM -0700, Nathan Chancellor wrote:
> > Hi Arnd,
> >
> > Doubling back around to this now since I think this is the only thing
> > breaking x86_64 allmodconfig with clang 11 through 15.
> >
> > On Fri, Aug 05, 2022 at 09:32:13PM +0200, Arnd Bergmann wrote:
> > > On Fri, Aug 5, 2022 at 8:02 PM Nathan Chancellor <nathan@kernel.org> wrote:
> > > > On Fri, Aug 05, 2022 at 06:16:45PM +0200, Arnd Bergmann wrote:
> > > > > On Fri, Aug 5, 2022 at 5:32 PM Harry Wentland <harry.wentland@amd.com> wrote:
> > > > > While splitting out sub-functions can help reduce the maximum stack
> > > > > usage, it seems that in this case it makes the actual problem worse:
> > > > > I see 2168 bytes for the combined
> > > > > dml32_ModeSupportAndSystemConfigurationFull(), but marking
> > > > > mode_support_configuration() as noinline gives me 1992 bytes
> > > > > for the outer function plus 384 bytes for the inner one. So it does
> > > > > avoid the warning (barely), but not the problem that the warning tries
> > > > > to point out.
> > > >
> > > > I haven't had a chance to take a look at splitting things up yet, would
> > > > you recommend a different approach?
> > >
> > > Splitting up large functions can help when you have large local variables
> > > that are used in different parts of the function, and the split gets the
> > > compiler to reuse stack locations.
> > >
> > > I think in this particular function, the problem isn't actually local variables
> > > but either pushing variables on the stack for argument passing,
> > > or something that causes the compiler to run out of registers so it
> > > has to spill registers to the stack.
> > >
> > > In either case, one has to actually look at the generated output
> > > and then try to rearrange the codes so this does not happen.
> > >
> > > One thing to try would be to condense a function call like
> > >
> > >                 dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
> > >
> > > &v->dummy_vars.dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport,
> > >                         mode_lib->vba.USRRetrainingRequiredFinal,
> > >                         mode_lib->vba.UsesMALLForPStateChange,
> > >
> > > mode_lib->vba.PrefetchModePerState[mode_lib->vba.VoltageLevel][mode_lib->vba.maxMpcComb],
> > >                         mode_lib->vba.NumberOfActiveSurfaces,
> > >                         mode_lib->vba.MaxLineBufferLines,
> > >                         mode_lib->vba.LineBufferSizeFinal,
> > >                         mode_lib->vba.WritebackInterfaceBufferSize,
> > >                         mode_lib->vba.DCFCLK,
> > >                         mode_lib->vba.ReturnBW,
> > >                         mode_lib->vba.SynchronizeTimingsFinal,
> > >
> > > mode_lib->vba.SynchronizeDRRDisplaysForUCLKPStateChangeFinal,
> > >                         mode_lib->vba.DRRDisplay,
> > >                         v->dpte_group_bytes,
> > >                         v->meta_row_height,
> > >                         v->meta_row_height_chroma,
> > >
> > > v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.mmSOCParameters,
> > >                         mode_lib->vba.WritebackChunkSize,
> > >                         mode_lib->vba.SOCCLK,
> > >                         v->DCFCLKDeepSleep,
> > >                         mode_lib->vba.DETBufferSizeY,
> > >                         mode_lib->vba.DETBufferSizeC,
> > >                         mode_lib->vba.SwathHeightY,
> > >                         mode_lib->vba.SwathHeightC,
> > >                         mode_lib->vba.LBBitPerPixel,
> > >                         v->SwathWidthY,
> > >                         v->SwathWidthC,
> > >                         mode_lib->vba.HRatio,
> > >                         mode_lib->vba.HRatioChroma,
> > >                         mode_lib->vba.vtaps,
> > >                         mode_lib->vba.VTAPsChroma,
> > >                         mode_lib->vba.VRatio,
> > >                         mode_lib->vba.VRatioChroma,
> > >                         mode_lib->vba.HTotal,
> > >                         mode_lib->vba.VTotal,
> > >                         mode_lib->vba.VActive,
> > >                         mode_lib->vba.PixelClock,
> > >                         mode_lib->vba.BlendingAndTiming,
> > >                         .... /* more arguments */);
> > >
> > > into calling conventions that take a pointer to 'mode_lib->vba' and another
> > > one to 'v', so these are no longer passed on the stack individually.
> >
> > So I took a whack at reducing this function's number of parameters and
> > ended up with the attached patch. I basically just removed any
> > parameters that were identical between the two call sites and access them
> > through the vba pointer, as you suggested.
> >
> > AMD folks, is this an acceptable approach? It didn't take a trivial
> > amount of time so I want to make sure this is okay before I do it to
> > more functions/files.
> >
> > Due to the potential size of these changes, I am a little weary of them
> > going into 6.0; even though they should be a simple search and replace
> > for the most part, it might be nice for them to have some decent soak
> > time in -next. One solution would be to raise the warning limit for
> > these files on 6.0 so that allmodconfig does not ship broken then reduce
> > the limit for 6.1 once these patches have been applied.
> >
> > Additionally, I took a look at the stack usage across all compilers that
> > the kernel supports and I thought it was kind of interesting that the
> > usage really jumps from GCC 7 to 8, which I am guessing is a result of
> > commit e8a170ff9a35 ("drm/amdgpu: enable -msse2 for GCC 7.1+ users").
> > GCC 8 allmodconfig actually errors now too:
> >
> > https://lore.kernel.org/alpine.DEB.2.22.394.2208152006320.289321@ramsan.of.borg/
> >
> >           |-----------------------------------------------|-----------------------------------------------|-----------------------------------------------|
> >           | dml30_ModeSupportAndSystemConfigurationFull() | dml31_ModeSupportAndSystemConfigurationFull() | dml32_ModeSupportAndSystemConfigurationFull() |
> > |---------|-----------------------------------------------|-----------------------------------------------|-----------------------------------------------|
> > | GCC 5   |                  1056 bytes                   |                   656 bytes                   |                  1040 bytes                   |
> > | GCC 6   |                  1024 bytes                   |                   672 bytes                   |                  1056 bytes                   |
> > | GCC 7   |                  1040 bytes                   |                   664 bytes                   |                  1056 bytes                   |
> > | GCC 8   |                  1760 bytes                   |                  1608 bytes                   |                  2144 bytes                   |
> > | GCC 9   |                  1664 bytes                   |                  1392 bytes                   |                  1960 bytes                   |
> > | GCC 10  |                  1648 bytes                   |                  1368 bytes                   |                  1952 bytes                   |
> > | GCC 11  |                  1680 bytes                   |                  1400 bytes                   |                  1952 bytes                   |
> > | GCC 12  |                  1680 bytes                   |                  1400 bytes                   |                  1984 bytes                   |
> > |---------|-----------------------------------------------|-----------------------------------------------|-----------------------------------------------|
> > | LLVM 11 |                  2104 bytes                   |                  2056 bytes                   |                  2120 bytes                   |
> > | LLVM 12 |                  2152 bytes                   |                  2200 bytes                   |                  2152 bytes                   |
> > | LLVM 13 |                  2216 bytes                   |                  2248 bytes                   |                  2168 bytes                   |
> > | LLVM 14 |                  2168 bytes                   |                  2184 bytes                   |                  2160 bytes                   |
> > | LLVM 15 |                  2216 bytes                   |                  2184 bytes                   |                  2160 bytes                   |
> > | LLVM 16 |                  2232 bytes                   |                  2216 bytes                   |                  2176 bytes                   |
> > |---------|-----------------------------------------------|-----------------------------------------------|-----------------------------------------------|
> >
> > With the patch I have attached,
> > dml32_ModeSupportAndSystemConfigurationFull() drops from 2176 to 1944
> > for LLVM 16, which is obviously still not great but it at least avoids
> > the warning.
> >
> > Cheers,
> > Nathan
