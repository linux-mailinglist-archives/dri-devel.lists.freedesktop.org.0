Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA5D5A1C76
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 00:35:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B12410E461;
	Thu, 25 Aug 2022 22:34:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 401F210E461;
 Thu, 25 Aug 2022 22:34:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 037C7B82B2A;
 Thu, 25 Aug 2022 22:34:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E303DC433C1;
 Thu, 25 Aug 2022 22:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661466883;
 bh=9MvW1+ds+HiEDTMo8oSecKFR7fbv9XBzO14GO+DL/w0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L+3k+Rr+gqFEuwpCpD5J9g7cWojXI6SNtH3GE0/cjZr93xjYYs4xoEsCjTr8tcwuI
 YJcg7gwIfkVmPglt+LB5IOSJN0dHDgH3eWRKAEzueq3nPYdJFEc4Ig+ru9UgEJDjFB
 n2DuNgIFAf7+KKwNLMOwtRklRBm6CQUaNdCNyr+koLZdv3FGNYbGn5aQD6BT6RzHho
 rSSh4k+TEgSoLKwTrVfKUu/iVU82FVM5loh/uRYFDM237M0jBCodHYrF9W2JcCHDhV
 au8CSYCJZZFwBP7W66PvRw1xb2RzcVzoz9rsEHf8eKsA4UK35zqqX5Gr/gBddngSPj
 ONgzRBCIya6Lg==
Date: Thu, 25 Aug 2022 15:34:41 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Harry Wentland <harry.wentland@amd.com>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: Re: mainline build failure for x86_64 allmodconfig with clang
Message-ID: <Ywf5ATPG7a/I0SLu@dev-arch.thelio-3990X>
References: <YuwRyQYPCb1FD+mr@debian>
 <CAHk-=whptVSSZL=wSUQJdRBeVfS+Xy_K4anQ7eQOky7XUrXhUQ@mail.gmail.com>
 <CAK8P3a2bEaExue0OtNeLa2CVzBx-1dE9w2HZ2PAV5N8Ct9G=JQ@mail.gmail.com>
 <YuwvfsztWaHvquwC@dev-arch.thelio-3990X>
 <9fb73284-7572-5703-93d3-f83a43535baf@amd.com>
 <CAK8P3a3Fv=_+GV9r=k4jP72zZOjJowL-GOue-51EhyVDBaEfEw@mail.gmail.com>
 <Yu1bMqL5tsbq1ojj@dev-arch.thelio-3990X>
 <CAK8P3a3PAxkctN6AXOsoTBTFgwHhk7_OSYwJ4Rgk7Dbs+bc0Qw@mail.gmail.com>
 <Yv5h0rb3AgTZLVJv@dev-arch.thelio-3990X>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yv5h0rb3AgTZLVJv@dev-arch.thelio-3990X>
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
Cc: Arnd Bergmann <arnd@kernel.org>, David Airlie <airlied@linux.ie>,
 clang-built-linux <llvm@lists.linux.dev>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "Sudip Mukherjee \(Codethink\)" <sudipm.mukherjee@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi AMD folks,

Top posting because it might not have been obvious but I was looking for
your feedback on this message (which can be viewed on lore.kernel.org if
you do not have the original [1]) so that we can try to get this fixed
in some way for 6.0/6.1. If my approach is not welcome, please consider
suggesting another one or looking to see if this is something you all
could look into.

[1]: https://lore.kernel.org/Yv5h0rb3AgTZLVJv@dev-arch.thelio-3990X/

Cheers,
Nathan

On Thu, Aug 18, 2022 at 08:59:14AM -0700, Nathan Chancellor wrote:
> Hi Arnd,
> 
> Doubling back around to this now since I think this is the only thing
> breaking x86_64 allmodconfig with clang 11 through 15.
> 
> On Fri, Aug 05, 2022 at 09:32:13PM +0200, Arnd Bergmann wrote:
> > On Fri, Aug 5, 2022 at 8:02 PM Nathan Chancellor <nathan@kernel.org> wrote:
> > > On Fri, Aug 05, 2022 at 06:16:45PM +0200, Arnd Bergmann wrote:
> > > > On Fri, Aug 5, 2022 at 5:32 PM Harry Wentland <harry.wentland@amd.com> wrote:
> > > > While splitting out sub-functions can help reduce the maximum stack
> > > > usage, it seems that in this case it makes the actual problem worse:
> > > > I see 2168 bytes for the combined
> > > > dml32_ModeSupportAndSystemConfigurationFull(), but marking
> > > > mode_support_configuration() as noinline gives me 1992 bytes
> > > > for the outer function plus 384 bytes for the inner one. So it does
> > > > avoid the warning (barely), but not the problem that the warning tries
> > > > to point out.
> > >
> > > I haven't had a chance to take a look at splitting things up yet, would
> > > you recommend a different approach?
> > 
> > Splitting up large functions can help when you have large local variables
> > that are used in different parts of the function, and the split gets the
> > compiler to reuse stack locations.
> > 
> > I think in this particular function, the problem isn't actually local variables
> > but either pushing variables on the stack for argument passing,
> > or something that causes the compiler to run out of registers so it
> > has to spill registers to the stack.
> > 
> > In either case, one has to actually look at the generated output
> > and then try to rearrange the codes so this does not happen.
> > 
> > One thing to try would be to condense a function call like
> > 
> >                 dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
> > 
> > &v->dummy_vars.dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport,
> >                         mode_lib->vba.USRRetrainingRequiredFinal,
> >                         mode_lib->vba.UsesMALLForPStateChange,
> > 
> > mode_lib->vba.PrefetchModePerState[mode_lib->vba.VoltageLevel][mode_lib->vba.maxMpcComb],
> >                         mode_lib->vba.NumberOfActiveSurfaces,
> >                         mode_lib->vba.MaxLineBufferLines,
> >                         mode_lib->vba.LineBufferSizeFinal,
> >                         mode_lib->vba.WritebackInterfaceBufferSize,
> >                         mode_lib->vba.DCFCLK,
> >                         mode_lib->vba.ReturnBW,
> >                         mode_lib->vba.SynchronizeTimingsFinal,
> > 
> > mode_lib->vba.SynchronizeDRRDisplaysForUCLKPStateChangeFinal,
> >                         mode_lib->vba.DRRDisplay,
> >                         v->dpte_group_bytes,
> >                         v->meta_row_height,
> >                         v->meta_row_height_chroma,
> > 
> > v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.mmSOCParameters,
> >                         mode_lib->vba.WritebackChunkSize,
> >                         mode_lib->vba.SOCCLK,
> >                         v->DCFCLKDeepSleep,
> >                         mode_lib->vba.DETBufferSizeY,
> >                         mode_lib->vba.DETBufferSizeC,
> >                         mode_lib->vba.SwathHeightY,
> >                         mode_lib->vba.SwathHeightC,
> >                         mode_lib->vba.LBBitPerPixel,
> >                         v->SwathWidthY,
> >                         v->SwathWidthC,
> >                         mode_lib->vba.HRatio,
> >                         mode_lib->vba.HRatioChroma,
> >                         mode_lib->vba.vtaps,
> >                         mode_lib->vba.VTAPsChroma,
> >                         mode_lib->vba.VRatio,
> >                         mode_lib->vba.VRatioChroma,
> >                         mode_lib->vba.HTotal,
> >                         mode_lib->vba.VTotal,
> >                         mode_lib->vba.VActive,
> >                         mode_lib->vba.PixelClock,
> >                         mode_lib->vba.BlendingAndTiming,
> >                         .... /* more arguments */);
> > 
> > into calling conventions that take a pointer to 'mode_lib->vba' and another
> > one to 'v', so these are no longer passed on the stack individually.
> 
> So I took a whack at reducing this function's number of parameters and
> ended up with the attached patch. I basically just removed any
> parameters that were identical between the two call sites and access them
> through the vba pointer, as you suggested.
> 
> AMD folks, is this an acceptable approach? It didn't take a trivial
> amount of time so I want to make sure this is okay before I do it to
> more functions/files.
> 
> Due to the potential size of these changes, I am a little weary of them
> going into 6.0; even though they should be a simple search and replace
> for the most part, it might be nice for them to have some decent soak
> time in -next. One solution would be to raise the warning limit for
> these files on 6.0 so that allmodconfig does not ship broken then reduce
> the limit for 6.1 once these patches have been applied.
> 
> Additionally, I took a look at the stack usage across all compilers that
> the kernel supports and I thought it was kind of interesting that the
> usage really jumps from GCC 7 to 8, which I am guessing is a result of
> commit e8a170ff9a35 ("drm/amdgpu: enable -msse2 for GCC 7.1+ users").
> GCC 8 allmodconfig actually errors now too:
> 
> https://lore.kernel.org/alpine.DEB.2.22.394.2208152006320.289321@ramsan.of.borg/
> 
>           |-----------------------------------------------|-----------------------------------------------|-----------------------------------------------|
>           | dml30_ModeSupportAndSystemConfigurationFull() | dml31_ModeSupportAndSystemConfigurationFull() | dml32_ModeSupportAndSystemConfigurationFull() |
> |---------|-----------------------------------------------|-----------------------------------------------|-----------------------------------------------|
> | GCC 5   |                  1056 bytes                   |                   656 bytes                   |                  1040 bytes                   |
> | GCC 6   |                  1024 bytes                   |                   672 bytes                   |                  1056 bytes                   |
> | GCC 7   |                  1040 bytes                   |                   664 bytes                   |                  1056 bytes                   |
> | GCC 8   |                  1760 bytes                   |                  1608 bytes                   |                  2144 bytes                   |
> | GCC 9   |                  1664 bytes                   |                  1392 bytes                   |                  1960 bytes                   |
> | GCC 10  |                  1648 bytes                   |                  1368 bytes                   |                  1952 bytes                   |
> | GCC 11  |                  1680 bytes                   |                  1400 bytes                   |                  1952 bytes                   |
> | GCC 12  |                  1680 bytes                   |                  1400 bytes                   |                  1984 bytes                   |
> |---------|-----------------------------------------------|-----------------------------------------------|-----------------------------------------------|
> | LLVM 11 |                  2104 bytes                   |                  2056 bytes                   |                  2120 bytes                   |
> | LLVM 12 |                  2152 bytes                   |                  2200 bytes                   |                  2152 bytes                   |
> | LLVM 13 |                  2216 bytes                   |                  2248 bytes                   |                  2168 bytes                   |
> | LLVM 14 |                  2168 bytes                   |                  2184 bytes                   |                  2160 bytes                   |
> | LLVM 15 |                  2216 bytes                   |                  2184 bytes                   |                  2160 bytes                   |
> | LLVM 16 |                  2232 bytes                   |                  2216 bytes                   |                  2176 bytes                   |
> |---------|-----------------------------------------------|-----------------------------------------------|-----------------------------------------------|
> 
> With the patch I have attached,
> dml32_ModeSupportAndSystemConfigurationFull() drops from 2176 to 1944
> for LLVM 16, which is obviously still not great but it at least avoids
> the warning.
> 
> Cheers,
> Nathan
