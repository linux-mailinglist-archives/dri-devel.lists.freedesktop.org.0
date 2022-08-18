Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC10559882A
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 18:00:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6F78BCC2B;
	Thu, 18 Aug 2022 15:59:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01335BCB4F;
 Thu, 18 Aug 2022 15:59:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id E0266CE20F3;
 Thu, 18 Aug 2022 15:59:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57958C43141;
 Thu, 18 Aug 2022 15:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660838357;
 bh=VwfywNBogEgNBL548YTvIonbldoqaV9nff30UIs5UcE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zjg4SBnyuzkiVAS8tD3R1cwnMMY3bdJ9yy7NlSCYtXAYayzgsPrbIQ840N0Ks3zzO
 BmkKu4UomZo+NjkPeyIl2eR9usZQ/imOdzRiSjXOb4NQLmWLuCGwbD8HCnSGjKWZ54
 DAr75X809c1O82jiAhtAQwD7QNuaaapH/koNIqCYA/BSQlmuvkwMzBr6TlJnnJeFDb
 5q+hZD7x09Lu31QsZ+wuS0t8nxDfNiPAyWdcy0rnz2sn/gDI8MGkXL6twDuKJ7zV26
 1nQoYXLP9LGoeCrweNaeImSTD2AmRIwF5/9rmRUgETb7uABhBZLDou+T6ro9k3iAxY
 4up+JBxgf/J4A==
Date: Thu, 18 Aug 2022 08:59:14 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>, Harry Wentland <harry.wentland@amd.com>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: Re: mainline build failure for x86_64 allmodconfig with clang
Message-ID: <Yv5h0rb3AgTZLVJv@dev-arch.thelio-3990X>
References: <YuwRyQYPCb1FD+mr@debian>
 <CAHk-=whptVSSZL=wSUQJdRBeVfS+Xy_K4anQ7eQOky7XUrXhUQ@mail.gmail.com>
 <CAK8P3a2bEaExue0OtNeLa2CVzBx-1dE9w2HZ2PAV5N8Ct9G=JQ@mail.gmail.com>
 <YuwvfsztWaHvquwC@dev-arch.thelio-3990X>
 <9fb73284-7572-5703-93d3-f83a43535baf@amd.com>
 <CAK8P3a3Fv=_+GV9r=k4jP72zZOjJowL-GOue-51EhyVDBaEfEw@mail.gmail.com>
 <Yu1bMqL5tsbq1ojj@dev-arch.thelio-3990X>
 <CAK8P3a3PAxkctN6AXOsoTBTFgwHhk7_OSYwJ4Rgk7Dbs+bc0Qw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="Uxb+/5nyZd8fyOJL"
Content-Disposition: inline
In-Reply-To: <CAK8P3a3PAxkctN6AXOsoTBTFgwHhk7_OSYwJ4Rgk7Dbs+bc0Qw@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, clang-built-linux <llvm@lists.linux.dev>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "Sudip Mukherjee \(Codethink\)" <sudipm.mukherjee@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--Uxb+/5nyZd8fyOJL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd,

Doubling back around to this now since I think this is the only thing
breaking x86_64 allmodconfig with clang 11 through 15.

On Fri, Aug 05, 2022 at 09:32:13PM +0200, Arnd Bergmann wrote:
> On Fri, Aug 5, 2022 at 8:02 PM Nathan Chancellor <nathan@kernel.org> wrote:
> > On Fri, Aug 05, 2022 at 06:16:45PM +0200, Arnd Bergmann wrote:
> > > On Fri, Aug 5, 2022 at 5:32 PM Harry Wentland <harry.wentland@amd.com> wrote:
> > > While splitting out sub-functions can help reduce the maximum stack
> > > usage, it seems that in this case it makes the actual problem worse:
> > > I see 2168 bytes for the combined
> > > dml32_ModeSupportAndSystemConfigurationFull(), but marking
> > > mode_support_configuration() as noinline gives me 1992 bytes
> > > for the outer function plus 384 bytes for the inner one. So it does
> > > avoid the warning (barely), but not the problem that the warning tries
> > > to point out.
> >
> > I haven't had a chance to take a look at splitting things up yet, would
> > you recommend a different approach?
> 
> Splitting up large functions can help when you have large local variables
> that are used in different parts of the function, and the split gets the
> compiler to reuse stack locations.
> 
> I think in this particular function, the problem isn't actually local variables
> but either pushing variables on the stack for argument passing,
> or something that causes the compiler to run out of registers so it
> has to spill registers to the stack.
> 
> In either case, one has to actually look at the generated output
> and then try to rearrange the codes so this does not happen.
> 
> One thing to try would be to condense a function call like
> 
>                 dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
> 
> &v->dummy_vars.dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport,
>                         mode_lib->vba.USRRetrainingRequiredFinal,
>                         mode_lib->vba.UsesMALLForPStateChange,
> 
> mode_lib->vba.PrefetchModePerState[mode_lib->vba.VoltageLevel][mode_lib->vba.maxMpcComb],
>                         mode_lib->vba.NumberOfActiveSurfaces,
>                         mode_lib->vba.MaxLineBufferLines,
>                         mode_lib->vba.LineBufferSizeFinal,
>                         mode_lib->vba.WritebackInterfaceBufferSize,
>                         mode_lib->vba.DCFCLK,
>                         mode_lib->vba.ReturnBW,
>                         mode_lib->vba.SynchronizeTimingsFinal,
> 
> mode_lib->vba.SynchronizeDRRDisplaysForUCLKPStateChangeFinal,
>                         mode_lib->vba.DRRDisplay,
>                         v->dpte_group_bytes,
>                         v->meta_row_height,
>                         v->meta_row_height_chroma,
> 
> v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.mmSOCParameters,
>                         mode_lib->vba.WritebackChunkSize,
>                         mode_lib->vba.SOCCLK,
>                         v->DCFCLKDeepSleep,
>                         mode_lib->vba.DETBufferSizeY,
>                         mode_lib->vba.DETBufferSizeC,
>                         mode_lib->vba.SwathHeightY,
>                         mode_lib->vba.SwathHeightC,
>                         mode_lib->vba.LBBitPerPixel,
>                         v->SwathWidthY,
>                         v->SwathWidthC,
>                         mode_lib->vba.HRatio,
>                         mode_lib->vba.HRatioChroma,
>                         mode_lib->vba.vtaps,
>                         mode_lib->vba.VTAPsChroma,
>                         mode_lib->vba.VRatio,
>                         mode_lib->vba.VRatioChroma,
>                         mode_lib->vba.HTotal,
>                         mode_lib->vba.VTotal,
>                         mode_lib->vba.VActive,
>                         mode_lib->vba.PixelClock,
>                         mode_lib->vba.BlendingAndTiming,
>                         .... /* more arguments */);
> 
> into calling conventions that take a pointer to 'mode_lib->vba' and another
> one to 'v', so these are no longer passed on the stack individually.

So I took a whack at reducing this function's number of parameters and
ended up with the attached patch. I basically just removed any
parameters that were identical between the two call sites and access them
through the vba pointer, as you suggested.

AMD folks, is this an acceptable approach? It didn't take a trivial
amount of time so I want to make sure this is okay before I do it to
more functions/files.

Due to the potential size of these changes, I am a little weary of them
going into 6.0; even though they should be a simple search and replace
for the most part, it might be nice for them to have some decent soak
time in -next. One solution would be to raise the warning limit for
these files on 6.0 so that allmodconfig does not ship broken then reduce
the limit for 6.1 once these patches have been applied.

Additionally, I took a look at the stack usage across all compilers that
the kernel supports and I thought it was kind of interesting that the
usage really jumps from GCC 7 to 8, which I am guessing is a result of
commit e8a170ff9a35 ("drm/amdgpu: enable -msse2 for GCC 7.1+ users").
GCC 8 allmodconfig actually errors now too:

https://lore.kernel.org/alpine.DEB.2.22.394.2208152006320.289321@ramsan.of.borg/

          |-----------------------------------------------|-----------------------------------------------|-----------------------------------------------|
          | dml30_ModeSupportAndSystemConfigurationFull() | dml31_ModeSupportAndSystemConfigurationFull() | dml32_ModeSupportAndSystemConfigurationFull() |
|---------|-----------------------------------------------|-----------------------------------------------|-----------------------------------------------|
| GCC 5   |                  1056 bytes                   |                   656 bytes                   |                  1040 bytes                   |
| GCC 6   |                  1024 bytes                   |                   672 bytes                   |                  1056 bytes                   |
| GCC 7   |                  1040 bytes                   |                   664 bytes                   |                  1056 bytes                   |
| GCC 8   |                  1760 bytes                   |                  1608 bytes                   |                  2144 bytes                   |
| GCC 9   |                  1664 bytes                   |                  1392 bytes                   |                  1960 bytes                   |
| GCC 10  |                  1648 bytes                   |                  1368 bytes                   |                  1952 bytes                   |
| GCC 11  |                  1680 bytes                   |                  1400 bytes                   |                  1952 bytes                   |
| GCC 12  |                  1680 bytes                   |                  1400 bytes                   |                  1984 bytes                   |
|---------|-----------------------------------------------|-----------------------------------------------|-----------------------------------------------|
| LLVM 11 |                  2104 bytes                   |                  2056 bytes                   |                  2120 bytes                   |
| LLVM 12 |                  2152 bytes                   |                  2200 bytes                   |                  2152 bytes                   |
| LLVM 13 |                  2216 bytes                   |                  2248 bytes                   |                  2168 bytes                   |
| LLVM 14 |                  2168 bytes                   |                  2184 bytes                   |                  2160 bytes                   |
| LLVM 15 |                  2216 bytes                   |                  2184 bytes                   |                  2160 bytes                   |
| LLVM 16 |                  2232 bytes                   |                  2216 bytes                   |                  2176 bytes                   |
|---------|-----------------------------------------------|-----------------------------------------------|-----------------------------------------------|

With the patch I have attached,
dml32_ModeSupportAndSystemConfigurationFull() drops from 2176 to 1944
for LLVM 16, which is obviously still not great but it at least avoids
the warning.

Cheers,
Nathan

--Uxb+/5nyZd8fyOJL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-drm-amd-display-Reduce-number-of-arguments-to-dml32_.patch"

From 193f6f6f708df6949b0c4df9fe99903e1252211a Mon Sep 17 00:00:00 2001
From: Nathan Chancellor <nathan@kernel.org>
Date: Thu, 18 Aug 2022 08:36:51 -0700
Subject: [PATCH] drm/amd/display: Reduce number of arguments to
 dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport()

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 .../dc/dml/dcn32/display_mode_vba_32.c        |  72 +----
 .../dc/dml/dcn32/display_mode_vba_util_32.c   | 259 ++++++++----------
 .../dc/dml/dcn32/display_mode_vba_util_32.h   |  36 +--
 3 files changed, 120 insertions(+), 247 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
index 890612db08dc..58d4bc5ebcd5 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
@@ -1167,66 +1167,34 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.mmSOCParameters.SMNLatency = mode_lib->vba.SMNLatency;
 
 		dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
-			&v->dummy_vars.dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport,
-			mode_lib->vba.USRRetrainingRequiredFinal,
-			mode_lib->vba.UsesMALLForPStateChange,
+			v,
 			mode_lib->vba.PrefetchModePerState[mode_lib->vba.VoltageLevel][mode_lib->vba.maxMpcComb],
-			mode_lib->vba.NumberOfActiveSurfaces,
-			mode_lib->vba.MaxLineBufferLines,
-			mode_lib->vba.LineBufferSizeFinal,
-			mode_lib->vba.WritebackInterfaceBufferSize,
 			mode_lib->vba.DCFCLK,
 			mode_lib->vba.ReturnBW,
-			mode_lib->vba.SynchronizeTimingsFinal,
-			mode_lib->vba.SynchronizeDRRDisplaysForUCLKPStateChangeFinal,
-			mode_lib->vba.DRRDisplay,
-			v->dpte_group_bytes,
-			v->meta_row_height,
-			v->meta_row_height_chroma,
 			v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.mmSOCParameters,
-			mode_lib->vba.WritebackChunkSize,
 			mode_lib->vba.SOCCLK,
 			v->DCFCLKDeepSleep,
 			mode_lib->vba.DETBufferSizeY,
 			mode_lib->vba.DETBufferSizeC,
 			mode_lib->vba.SwathHeightY,
 			mode_lib->vba.SwathHeightC,
-			mode_lib->vba.LBBitPerPixel,
 			v->SwathWidthY,
 			v->SwathWidthC,
-			mode_lib->vba.HRatio,
-			mode_lib->vba.HRatioChroma,
-			mode_lib->vba.vtaps,
-			mode_lib->vba.VTAPsChroma,
-			mode_lib->vba.VRatio,
-			mode_lib->vba.VRatioChroma,
-			mode_lib->vba.HTotal,
-			mode_lib->vba.VTotal,
-			mode_lib->vba.VActive,
-			mode_lib->vba.PixelClock,
-			mode_lib->vba.BlendingAndTiming,
 			mode_lib->vba.DPPPerPlane,
 			v->BytePerPixelDETY,
 			v->BytePerPixelDETC,
 			v->DSTXAfterScaler,
 			v->DSTYAfterScaler,
-			mode_lib->vba.WritebackEnable,
-			mode_lib->vba.WritebackPixelFormat,
-			mode_lib->vba.WritebackDestinationWidth,
-			mode_lib->vba.WritebackDestinationHeight,
-			mode_lib->vba.WritebackSourceHeight,
 			v->UnboundedRequestEnabled,
 			v->CompressedBufferSizeInkByte,
 
 			/* Output */
-			&v->Watermark,
 			&v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.dummy_dramchange_support,
 			v->MaxActiveDRAMClockChangeLatencySupported,
 			v->SubViewportLinesNeededInMALL,
 			&v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.dummy_fclkchange_support,
 			&v->MinActiveFCLKChangeLatencySupported,
-			&v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.dummy_USRRetrainingSupport,
-			mode_lib->vba.ActiveDRAMClockChangeLatencyMargin);
+			&v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.dummy_USRRetrainingSupport);
 
 		/* DCN32 has a new struct Watermarks (typedef) which is used to store
 		 * calculated WM values. Copy over values from struct to vba varaibles
@@ -3566,66 +3534,34 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 
 			{
 				dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
-						&v->dummy_vars.dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport,
-						mode_lib->vba.USRRetrainingRequiredFinal,
-						mode_lib->vba.UsesMALLForPStateChange,
+						v,
 						mode_lib->vba.PrefetchModePerState[i][j],
-						mode_lib->vba.NumberOfActiveSurfaces,
-						mode_lib->vba.MaxLineBufferLines,
-						mode_lib->vba.LineBufferSizeFinal,
-						mode_lib->vba.WritebackInterfaceBufferSize,
 						mode_lib->vba.DCFCLKState[i][j],
 						mode_lib->vba.ReturnBWPerState[i][j],
-						mode_lib->vba.SynchronizeTimingsFinal,
-						mode_lib->vba.SynchronizeDRRDisplaysForUCLKPStateChangeFinal,
-						mode_lib->vba.DRRDisplay,
-						mode_lib->vba.dpte_group_bytes,
-						mode_lib->vba.meta_row_height,
-						mode_lib->vba.meta_row_height_chroma,
 						v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.mSOCParameters,
-						mode_lib->vba.WritebackChunkSize,
 						mode_lib->vba.SOCCLKPerState[i],
 						mode_lib->vba.ProjectedDCFCLKDeepSleep[i][j],
 						mode_lib->vba.DETBufferSizeYThisState,
 						mode_lib->vba.DETBufferSizeCThisState,
 						mode_lib->vba.SwathHeightYThisState,
 						mode_lib->vba.SwathHeightCThisState,
-						mode_lib->vba.LBBitPerPixel,
 						mode_lib->vba.SwathWidthYThisState, // 24
 						mode_lib->vba.SwathWidthCThisState,
-						mode_lib->vba.HRatio,
-						mode_lib->vba.HRatioChroma,
-						mode_lib->vba.vtaps,
-						mode_lib->vba.VTAPsChroma,
-						mode_lib->vba.VRatio,
-						mode_lib->vba.VRatioChroma,
-						mode_lib->vba.HTotal,
-						mode_lib->vba.VTotal,
-						mode_lib->vba.VActive,
-						mode_lib->vba.PixelClock,
-						mode_lib->vba.BlendingAndTiming,
 						mode_lib->vba.NoOfDPPThisState,
 						mode_lib->vba.BytePerPixelInDETY,
 						mode_lib->vba.BytePerPixelInDETC,
 						v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.DSTXAfterScaler,
 						v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.DSTYAfterScaler,
-						mode_lib->vba.WritebackEnable,
-						mode_lib->vba.WritebackPixelFormat,
-						mode_lib->vba.WritebackDestinationWidth,
-						mode_lib->vba.WritebackDestinationHeight,
-						mode_lib->vba.WritebackSourceHeight,
 						mode_lib->vba.UnboundedRequestEnabledThisState,
 						mode_lib->vba.CompressedBufferSizeInkByteThisState,
 
 						/* Output */
-						&mode_lib->vba.Watermark, // Store the values in vba
 						&mode_lib->vba.DRAMClockChangeSupport[i][j],
 						&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_single2[0], // double *MaxActiveDRAMClockChangeLatencySupported
 						&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_integer[0], // Long SubViewportLinesNeededInMALL[]
 						&mode_lib->vba.FCLKChangeSupport[i][j],
 						&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_single2[1], // double *MinActiveFCLKChangeLatencySupported
-						&mode_lib->vba.USRRetrainingSupport[i][j],
-						mode_lib->vba.ActiveDRAMClockChangeLatencyMargin);
+						&mode_lib->vba.USRRetrainingSupport[i][j]);
 			}
 		}
 	} // End of Prefetch Check
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
index 07f8f3b8626b..d4917761f3ea 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
@@ -4159,67 +4159,36 @@ void dml32_CalculateFlipSchedule(
 } // CalculateFlipSchedule
 
 void dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
-		struct dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport *st_vars,
-		bool USRRetrainingRequiredFinal,
-		enum dm_use_mall_for_pstate_change_mode UseMALLForPStateChange[],
+		struct vba_vars_st *v,
 		unsigned int PrefetchMode,
-		unsigned int NumberOfActiveSurfaces,
-		unsigned int MaxLineBufferLines,
-		unsigned int LineBufferSize,
-		unsigned int WritebackInterfaceBufferSize,
 		double DCFCLK,
 		double ReturnBW,
-		bool SynchronizeTimingsFinal,
-		bool SynchronizeDRRDisplaysForUCLKPStateChangeFinal,
-		bool DRRDisplay[],
-		unsigned int dpte_group_bytes[],
-		unsigned int meta_row_height[],
-		unsigned int meta_row_height_chroma[],
 		SOCParametersList mmSOCParameters,
-		unsigned int WritebackChunkSize,
 		double SOCCLK,
 		double DCFClkDeepSleep,
 		unsigned int DETBufferSizeY[],
 		unsigned int DETBufferSizeC[],
 		unsigned int SwathHeightY[],
 		unsigned int SwathHeightC[],
-		unsigned int LBBitPerPixel[],
 		double SwathWidthY[],
 		double SwathWidthC[],
-		double HRatio[],
-		double HRatioChroma[],
-		unsigned int VTaps[],
-		unsigned int VTapsChroma[],
-		double VRatio[],
-		double VRatioChroma[],
-		unsigned int HTotal[],
-		unsigned int VTotal[],
-		unsigned int VActive[],
-		double PixelClock[],
-		unsigned int BlendingAndTiming[],
 		unsigned int DPPPerSurface[],
 		double BytePerPixelDETY[],
 		double BytePerPixelDETC[],
 		double DSTXAfterScaler[],
 		double DSTYAfterScaler[],
-		bool WritebackEnable[],
-		enum source_format_class WritebackPixelFormat[],
-		double WritebackDestinationWidth[],
-		double WritebackDestinationHeight[],
-		double WritebackSourceHeight[],
 		bool UnboundedRequestEnabled,
 		unsigned int CompressedBufferSizeInkByte,
 
 		/* Output */
-		Watermarks *Watermark,
 		enum clock_change_support *DRAMClockChangeSupport,
 		double MaxActiveDRAMClockChangeLatencySupported[],
 		unsigned int SubViewportLinesNeededInMALL[],
 		enum dm_fclock_change_support *FCLKChangeSupport,
 		double *MinActiveFCLKChangeLatencySupported,
-		bool *USRRetrainingSupport,
-		double ActiveDRAMClockChangeLatencyMargin[])
+		bool *USRRetrainingSupport)
 {
+	struct dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport *st_vars = &v->dummy_vars.dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport;
 	unsigned int i, j, k;
 
 	st_vars->SurfaceWithMinActiveFCLKChangeMargin = 0;
@@ -4231,136 +4200,136 @@ void dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
 	st_vars->TotalPixelBW = 0.0;
 	st_vars->TotalActiveWriteback = 0;
 
-	Watermark->UrgentWatermark = mmSOCParameters.UrgentLatency + mmSOCParameters.ExtraLatency;
-	Watermark->USRRetrainingWatermark = mmSOCParameters.UrgentLatency + mmSOCParameters.ExtraLatency
+	v->Watermark->UrgentWatermark = mmSOCParameters.UrgentLatency + mmSOCParameters.ExtraLatency;
+	v->Watermark->USRRetrainingWatermark = mmSOCParameters.UrgentLatency + mmSOCParameters.ExtraLatency
 			+ mmSOCParameters.USRRetrainingLatency + mmSOCParameters.SMNLatency;
-	Watermark->DRAMClockChangeWatermark = mmSOCParameters.DRAMClockChangeLatency + Watermark->UrgentWatermark;
-	Watermark->FCLKChangeWatermark = mmSOCParameters.FCLKChangeLatency + Watermark->UrgentWatermark;
-	Watermark->StutterExitWatermark = mmSOCParameters.SRExitTime + mmSOCParameters.ExtraLatency
+	v->Watermark->DRAMClockChangeWatermark = mmSOCParameters.DRAMClockChangeLatency + v->Watermark->UrgentWatermark;
+	v->Watermark->FCLKChangeWatermark = mmSOCParameters.FCLKChangeLatency + v->Watermark->UrgentWatermark;
+	v->Watermark->StutterExitWatermark = mmSOCParameters.SRExitTime + mmSOCParameters.ExtraLatency
 			+ 10 / DCFClkDeepSleep;
-	Watermark->StutterEnterPlusExitWatermark = mmSOCParameters.SREnterPlusExitTime + mmSOCParameters.ExtraLatency
+	v->Watermark->StutterEnterPlusExitWatermark = mmSOCParameters.SREnterPlusExitTime + mmSOCParameters.ExtraLatency
 			+ 10 / DCFClkDeepSleep;
-	Watermark->Z8StutterExitWatermark = mmSOCParameters.SRExitZ8Time + mmSOCParameters.ExtraLatency
+	v->Watermark->Z8StutterExitWatermark = mmSOCParameters.SRExitZ8Time + mmSOCParameters.ExtraLatency
 			+ 10 / DCFClkDeepSleep;
-	Watermark->Z8StutterEnterPlusExitWatermark = mmSOCParameters.SREnterPlusExitZ8Time
+	v->Watermark->Z8StutterEnterPlusExitWatermark = mmSOCParameters.SREnterPlusExitZ8Time
 			+ mmSOCParameters.ExtraLatency + 10 / DCFClkDeepSleep;
 
 #ifdef __DML_VBA_DEBUG__
 	dml_print("DML::%s: UrgentLatency = %f\n", __func__, mmSOCParameters.UrgentLatency);
 	dml_print("DML::%s: ExtraLatency = %f\n", __func__, mmSOCParameters.ExtraLatency);
 	dml_print("DML::%s: DRAMClockChangeLatency = %f\n", __func__, mmSOCParameters.DRAMClockChangeLatency);
-	dml_print("DML::%s: UrgentWatermark = %f\n", __func__, Watermark->UrgentWatermark);
-	dml_print("DML::%s: USRRetrainingWatermark = %f\n", __func__, Watermark->USRRetrainingWatermark);
-	dml_print("DML::%s: DRAMClockChangeWatermark = %f\n", __func__, Watermark->DRAMClockChangeWatermark);
-	dml_print("DML::%s: FCLKChangeWatermark = %f\n", __func__, Watermark->FCLKChangeWatermark);
-	dml_print("DML::%s: StutterExitWatermark = %f\n", __func__, Watermark->StutterExitWatermark);
-	dml_print("DML::%s: StutterEnterPlusExitWatermark = %f\n", __func__, Watermark->StutterEnterPlusExitWatermark);
-	dml_print("DML::%s: Z8StutterExitWatermark = %f\n", __func__, Watermark->Z8StutterExitWatermark);
+	dml_print("DML::%s: UrgentWatermark = %f\n", __func__, v->Watermark->UrgentWatermark);
+	dml_print("DML::%s: USRRetrainingWatermark = %f\n", __func__, v->Watermark->USRRetrainingWatermark);
+	dml_print("DML::%s: DRAMClockChangeWatermark = %f\n", __func__, v->Watermark->DRAMClockChangeWatermark);
+	dml_print("DML::%s: FCLKChangeWatermark = %f\n", __func__, v->Watermark->FCLKChangeWatermark);
+	dml_print("DML::%s: StutterExitWatermark = %f\n", __func__, v->Watermark->StutterExitWatermark);
+	dml_print("DML::%s: StutterEnterPlusExitWatermark = %f\n", __func__, v->Watermark->StutterEnterPlusExitWatermark);
+	dml_print("DML::%s: Z8StutterExitWatermark = %f\n", __func__, v->Watermark->Z8StutterExitWatermark);
 	dml_print("DML::%s: Z8StutterEnterPlusExitWatermark = %f\n",
-			__func__, Watermark->Z8StutterEnterPlusExitWatermark);
+			__func__, v->Watermark->Z8StutterEnterPlusExitWatermark);
 #endif
 
 
 	st_vars->TotalActiveWriteback = 0;
-	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
-		if (WritebackEnable[k] == true)
+	for (k = 0; k < v->NumberOfActiveSurfaces; ++k) {
+		if (v->WritebackEnable[k] == true)
 			st_vars->TotalActiveWriteback = st_vars->TotalActiveWriteback + 1;
 	}
 
 	if (st_vars->TotalActiveWriteback <= 1) {
-		Watermark->WritebackUrgentWatermark = mmSOCParameters.WritebackLatency;
+		v->Watermark->WritebackUrgentWatermark = mmSOCParameters.WritebackLatency;
 	} else {
-		Watermark->WritebackUrgentWatermark = mmSOCParameters.WritebackLatency
-				+ WritebackChunkSize * 1024.0 / 32.0 / SOCCLK;
+		v->Watermark->WritebackUrgentWatermark = mmSOCParameters.WritebackLatency
+				+ v->WritebackChunkSize * 1024.0 / 32.0 / SOCCLK;
 	}
-	if (USRRetrainingRequiredFinal)
-		Watermark->WritebackUrgentWatermark = Watermark->WritebackUrgentWatermark
+	if (v->USRRetrainingRequiredFinal)
+		v->Watermark->WritebackUrgentWatermark = v->Watermark->WritebackUrgentWatermark
 				+ mmSOCParameters.USRRetrainingLatency;
 
 	if (st_vars->TotalActiveWriteback <= 1) {
-		Watermark->WritebackDRAMClockChangeWatermark = mmSOCParameters.DRAMClockChangeLatency
+		v->Watermark->WritebackDRAMClockChangeWatermark = mmSOCParameters.DRAMClockChangeLatency
 				+ mmSOCParameters.WritebackLatency;
-		Watermark->WritebackFCLKChangeWatermark = mmSOCParameters.FCLKChangeLatency
+		v->Watermark->WritebackFCLKChangeWatermark = mmSOCParameters.FCLKChangeLatency
 				+ mmSOCParameters.WritebackLatency;
 	} else {
-		Watermark->WritebackDRAMClockChangeWatermark = mmSOCParameters.DRAMClockChangeLatency
-				+ mmSOCParameters.WritebackLatency + WritebackChunkSize * 1024.0 / 32.0 / SOCCLK;
-		Watermark->WritebackFCLKChangeWatermark = mmSOCParameters.FCLKChangeLatency
-				+ mmSOCParameters.WritebackLatency + WritebackChunkSize * 1024 / 32 / SOCCLK;
+		v->Watermark->WritebackDRAMClockChangeWatermark = mmSOCParameters.DRAMClockChangeLatency
+				+ mmSOCParameters.WritebackLatency + v->WritebackChunkSize * 1024.0 / 32.0 / SOCCLK;
+		v->Watermark->WritebackFCLKChangeWatermark = mmSOCParameters.FCLKChangeLatency
+				+ mmSOCParameters.WritebackLatency + v->WritebackChunkSize * 1024 / 32 / SOCCLK;
 	}
 
-	if (USRRetrainingRequiredFinal)
-		Watermark->WritebackDRAMClockChangeWatermark = Watermark->WritebackDRAMClockChangeWatermark
+	if (v->USRRetrainingRequiredFinal)
+		v->Watermark->WritebackDRAMClockChangeWatermark = v->Watermark->WritebackDRAMClockChangeWatermark
 				+ mmSOCParameters.USRRetrainingLatency;
 
-	if (USRRetrainingRequiredFinal)
-		Watermark->WritebackFCLKChangeWatermark = Watermark->WritebackFCLKChangeWatermark
+	if (v->USRRetrainingRequiredFinal)
+		v->Watermark->WritebackFCLKChangeWatermark = v->Watermark->WritebackFCLKChangeWatermark
 				+ mmSOCParameters.USRRetrainingLatency;
 
 #ifdef __DML_VBA_DEBUG__
 	dml_print("DML::%s: WritebackDRAMClockChangeWatermark = %f\n",
-			__func__, Watermark->WritebackDRAMClockChangeWatermark);
-	dml_print("DML::%s: WritebackFCLKChangeWatermark = %f\n", __func__, Watermark->WritebackFCLKChangeWatermark);
-	dml_print("DML::%s: WritebackUrgentWatermark = %f\n", __func__, Watermark->WritebackUrgentWatermark);
-	dml_print("DML::%s: USRRetrainingRequiredFinal = %d\n", __func__, USRRetrainingRequiredFinal);
+			__func__, v->Watermark->WritebackDRAMClockChangeWatermark);
+	dml_print("DML::%s: WritebackFCLKChangeWatermark = %f\n", __func__, v->Watermark->WritebackFCLKChangeWatermark);
+	dml_print("DML::%s: WritebackUrgentWatermark = %f\n", __func__, v->Watermark->WritebackUrgentWatermark);
+	dml_print("DML::%s: v->USRRetrainingRequiredFinal = %d\n", __func__, v->USRRetrainingRequiredFinal);
 	dml_print("DML::%s: USRRetrainingLatency = %f\n", __func__, mmSOCParameters.USRRetrainingLatency);
 #endif
 
-	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
-		st_vars->TotalPixelBW = st_vars->TotalPixelBW + DPPPerSurface[k] * (SwathWidthY[k] * BytePerPixelDETY[k] * VRatio[k] +
-				SwathWidthC[k] * BytePerPixelDETC[k] * VRatioChroma[k]) / (HTotal[k] / PixelClock[k]);
+	for (k = 0; k < v->NumberOfActiveSurfaces; ++k) {
+		st_vars->TotalPixelBW = st_vars->TotalPixelBW + DPPPerSurface[k] * (SwathWidthY[k] * BytePerPixelDETY[k] * v->VRatio[k] +
+				SwathWidthC[k] * BytePerPixelDETC[k] * v->VRatioChroma[k]) / (v->HTotal[k] / v->PixelClock[k]);
 	}
 
-	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
+	for (k = 0; k < v->NumberOfActiveSurfaces; ++k) {
 
-		st_vars->LBLatencyHidingSourceLinesY[k] = dml_min((double) MaxLineBufferLines, dml_floor(LineBufferSize / LBBitPerPixel[k] / (SwathWidthY[k] / dml_max(HRatio[k], 1.0)), 1)) - (VTaps[k] - 1);
-		st_vars->LBLatencyHidingSourceLinesC[k] = dml_min((double) MaxLineBufferLines, dml_floor(LineBufferSize / LBBitPerPixel[k] / (SwathWidthC[k] / dml_max(HRatioChroma[k], 1.0)), 1)) - (VTapsChroma[k] - 1);
+		st_vars->LBLatencyHidingSourceLinesY[k] = dml_min((double) v->MaxLineBufferLines, dml_floor(v->LineBufferSizeFinal / v->LBBitPerPixel[k] / (SwathWidthY[k] / dml_max(v->HRatio[k], 1.0)), 1)) - (v->vtaps[k] - 1);
+		st_vars->LBLatencyHidingSourceLinesC[k] = dml_min((double) v->MaxLineBufferLines, dml_floor(v->LineBufferSizeFinal / v->LBBitPerPixel[k] / (SwathWidthC[k] / dml_max(v->HRatioChroma[k], 1.0)), 1)) - (v->VTAPsChroma[k] - 1);
 
 
 #ifdef __DML_VBA_DEBUG__
-		dml_print("DML::%s: k=%d, MaxLineBufferLines = %d\n", __func__, k, MaxLineBufferLines);
-		dml_print("DML::%s: k=%d, LineBufferSize     = %d\n", __func__, k, LineBufferSize);
-		dml_print("DML::%s: k=%d, LBBitPerPixel      = %d\n", __func__, k, LBBitPerPixel[k]);
-		dml_print("DML::%s: k=%d, HRatio             = %f\n", __func__, k, HRatio[k]);
-		dml_print("DML::%s: k=%d, VTaps              = %d\n", __func__, k, VTaps[k]);
+		dml_print("DML::%s: k=%d, v->MaxLineBufferLines = %d\n", __func__, k, v->MaxLineBufferLines);
+		dml_print("DML::%s: k=%d, v->LineBufferSizeFinal     = %d\n", __func__, k, v->LineBufferSizeFinal);
+		dml_print("DML::%s: k=%d, v->LBBitPerPixel      = %d\n", __func__, k, v->LBBitPerPixel[k]);
+		dml_print("DML::%s: k=%d, v->HRatio             = %f\n", __func__, k, v->HRatio[k]);
+		dml_print("DML::%s: k=%d, v->vtaps              = %d\n", __func__, k, v->vtaps[k]);
 #endif
 
-		st_vars->EffectiveLBLatencyHidingY = st_vars->LBLatencyHidingSourceLinesY[k] / VRatio[k] * (HTotal[k] / PixelClock[k]);
-		st_vars->EffectiveLBLatencyHidingC = st_vars->LBLatencyHidingSourceLinesC[k] / VRatioChroma[k] * (HTotal[k] / PixelClock[k]);
+		st_vars->EffectiveLBLatencyHidingY = st_vars->LBLatencyHidingSourceLinesY[k] / v->VRatio[k] * (v->HTotal[k] / v->PixelClock[k]);
+		st_vars->EffectiveLBLatencyHidingC = st_vars->LBLatencyHidingSourceLinesC[k] / v->VRatioChroma[k] * (v->HTotal[k] / v->PixelClock[k]);
 		st_vars->EffectiveDETBufferSizeY = DETBufferSizeY[k];
 
 		if (UnboundedRequestEnabled) {
 			st_vars->EffectiveDETBufferSizeY = st_vars->EffectiveDETBufferSizeY
 					+ CompressedBufferSizeInkByte * 1024
-							* (SwathWidthY[k] * BytePerPixelDETY[k] * VRatio[k])
-							/ (HTotal[k] / PixelClock[k]) / st_vars->TotalPixelBW;
+							* (SwathWidthY[k] * BytePerPixelDETY[k] * v->VRatio[k])
+							/ (v->HTotal[k] / v->PixelClock[k]) / st_vars->TotalPixelBW;
 		}
 
 		st_vars->LinesInDETY[k] = (double) st_vars->EffectiveDETBufferSizeY / BytePerPixelDETY[k] / SwathWidthY[k];
 		st_vars->LinesInDETYRoundedDownToSwath[k] = dml_floor(st_vars->LinesInDETY[k], SwathHeightY[k]);
-		st_vars->FullDETBufferingTimeY = st_vars->LinesInDETYRoundedDownToSwath[k] * (HTotal[k] / PixelClock[k]) / VRatio[k];
+		st_vars->FullDETBufferingTimeY = st_vars->LinesInDETYRoundedDownToSwath[k] * (v->HTotal[k] / v->PixelClock[k]) / v->VRatio[k];
 
 		st_vars->ActiveClockChangeLatencyHidingY = st_vars->EffectiveLBLatencyHidingY + st_vars->FullDETBufferingTimeY
-				- (DSTXAfterScaler[k] / HTotal[k] + DSTYAfterScaler[k]) * HTotal[k] / PixelClock[k];
+				- (DSTXAfterScaler[k] / v->HTotal[k] + DSTYAfterScaler[k]) * v->HTotal[k] / v->PixelClock[k];
 
-		if (NumberOfActiveSurfaces > 1) {
+		if (v->NumberOfActiveSurfaces > 1) {
 			st_vars->ActiveClockChangeLatencyHidingY = st_vars->ActiveClockChangeLatencyHidingY
-					- (1 - 1 / NumberOfActiveSurfaces) * SwathHeightY[k] * HTotal[k]
-							/ PixelClock[k] / VRatio[k];
+					- (1 - 1 / v->NumberOfActiveSurfaces) * SwathHeightY[k] * v->HTotal[k]
+							/ v->PixelClock[k] / v->VRatio[k];
 		}
 
 		if (BytePerPixelDETC[k] > 0) {
 			st_vars->LinesInDETC[k] = DETBufferSizeC[k] / BytePerPixelDETC[k] / SwathWidthC[k];
 			st_vars->LinesInDETCRoundedDownToSwath[k] = dml_floor(st_vars->LinesInDETC[k], SwathHeightC[k]);
-			st_vars->FullDETBufferingTimeC = st_vars->LinesInDETCRoundedDownToSwath[k] * (HTotal[k] / PixelClock[k])
-					/ VRatioChroma[k];
+			st_vars->FullDETBufferingTimeC = st_vars->LinesInDETCRoundedDownToSwath[k] * (v->HTotal[k] / v->PixelClock[k])
+					/ v->VRatioChroma[k];
 			st_vars->ActiveClockChangeLatencyHidingC = st_vars->EffectiveLBLatencyHidingC + st_vars->FullDETBufferingTimeC
-					- (DSTXAfterScaler[k] / HTotal[k] + DSTYAfterScaler[k]) * HTotal[k]
-							/ PixelClock[k];
-			if (NumberOfActiveSurfaces > 1) {
+					- (DSTXAfterScaler[k] / v->HTotal[k] + DSTYAfterScaler[k]) * v->HTotal[k]
+							/ v->PixelClock[k];
+			if (v->NumberOfActiveSurfaces > 1) {
 				st_vars->ActiveClockChangeLatencyHidingC = st_vars->ActiveClockChangeLatencyHidingC
-						- (1 - 1 / NumberOfActiveSurfaces) * SwathHeightC[k] * HTotal[k]
-								/ PixelClock[k] / VRatioChroma[k];
+						- (1 - 1 / v->NumberOfActiveSurfaces) * SwathHeightC[k] * v->HTotal[k]
+								/ v->PixelClock[k] / v->VRatioChroma[k];
 			}
 			st_vars->ActiveClockChangeLatencyHiding = dml_min(st_vars->ActiveClockChangeLatencyHidingY,
 					st_vars->ActiveClockChangeLatencyHidingC);
@@ -4368,47 +4337,47 @@ void dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
 			st_vars->ActiveClockChangeLatencyHiding = st_vars->ActiveClockChangeLatencyHidingY;
 		}
 
-		ActiveDRAMClockChangeLatencyMargin[k] = st_vars->ActiveClockChangeLatencyHiding - Watermark->UrgentWatermark
-				- Watermark->DRAMClockChangeWatermark;
-		st_vars->ActiveFCLKChangeLatencyMargin[k] = st_vars->ActiveClockChangeLatencyHiding - Watermark->UrgentWatermark
-				- Watermark->FCLKChangeWatermark;
-		st_vars->USRRetrainingLatencyMargin[k] = st_vars->ActiveClockChangeLatencyHiding - Watermark->USRRetrainingWatermark;
-
-		if (WritebackEnable[k]) {
-			st_vars->WritebackLatencyHiding = WritebackInterfaceBufferSize * 1024
-					/ (WritebackDestinationWidth[k] * WritebackDestinationHeight[k]
-							/ (WritebackSourceHeight[k] * HTotal[k] / PixelClock[k]) * 4);
-			if (WritebackPixelFormat[k] == dm_444_64)
+		v->ActiveDRAMClockChangeLatencyMargin[k] = st_vars->ActiveClockChangeLatencyHiding - v->Watermark->UrgentWatermark
+				- v->Watermark->DRAMClockChangeWatermark;
+		st_vars->ActiveFCLKChangeLatencyMargin[k] = st_vars->ActiveClockChangeLatencyHiding - v->Watermark->UrgentWatermark
+				- v->Watermark->FCLKChangeWatermark;
+		st_vars->USRRetrainingLatencyMargin[k] = st_vars->ActiveClockChangeLatencyHiding - v->Watermark->USRRetrainingWatermark;
+
+		if (v->WritebackEnable[k]) {
+			st_vars->WritebackLatencyHiding = v->WritebackInterfaceBufferSize * 1024
+					/ (v->WritebackDestinationWidth[k] * v->WritebackDestinationHeight[k]
+							/ (v->WritebackSourceHeight[k] * v->HTotal[k] / v->PixelClock[k]) * 4);
+			if (v->WritebackPixelFormat[k] == dm_444_64)
 				st_vars->WritebackLatencyHiding = st_vars->WritebackLatencyHiding / 2;
 
 			st_vars->WritebackDRAMClockChangeLatencyMargin = st_vars->WritebackLatencyHiding
-					- Watermark->WritebackDRAMClockChangeWatermark;
+					- v->Watermark->WritebackDRAMClockChangeWatermark;
 
 			st_vars->WritebackFCLKChangeLatencyMargin = st_vars->WritebackLatencyHiding
-					- Watermark->WritebackFCLKChangeWatermark;
+					- v->Watermark->WritebackFCLKChangeWatermark;
 
-			ActiveDRAMClockChangeLatencyMargin[k] = dml_min(ActiveDRAMClockChangeLatencyMargin[k],
+			v->ActiveDRAMClockChangeLatencyMargin[k] = dml_min(v->ActiveDRAMClockChangeLatencyMargin[k],
 					st_vars->WritebackFCLKChangeLatencyMargin);
 			st_vars->ActiveFCLKChangeLatencyMargin[k] = dml_min(st_vars->ActiveFCLKChangeLatencyMargin[k],
 					st_vars->WritebackDRAMClockChangeLatencyMargin);
 		}
 		MaxActiveDRAMClockChangeLatencySupported[k] =
-				(UseMALLForPStateChange[k] == dm_use_mall_pstate_change_phantom_pipe) ?
+				(v->UseMALLForPStateChange[k] == dm_use_mall_pstate_change_phantom_pipe) ?
 						0 :
-						(ActiveDRAMClockChangeLatencyMargin[k]
+						(v->ActiveDRAMClockChangeLatencyMargin[k]
 								+ mmSOCParameters.DRAMClockChangeLatency);
 	}
 
-	for (i = 0; i < NumberOfActiveSurfaces; ++i) {
-		for (j = 0; j < NumberOfActiveSurfaces; ++j) {
+	for (i = 0; i < v->NumberOfActiveSurfaces; ++i) {
+		for (j = 0; j < v->NumberOfActiveSurfaces; ++j) {
 			if (i == j ||
-					(BlendingAndTiming[i] == i && BlendingAndTiming[j] == i) ||
-					(BlendingAndTiming[j] == j && BlendingAndTiming[i] == j) ||
-					(BlendingAndTiming[i] == BlendingAndTiming[j] && BlendingAndTiming[i] != i) ||
-					(SynchronizeTimingsFinal && PixelClock[i] == PixelClock[j] &&
-					HTotal[i] == HTotal[j] && VTotal[i] == VTotal[j] &&
-					VActive[i] == VActive[j]) || (SynchronizeDRRDisplaysForUCLKPStateChangeFinal &&
-					(DRRDisplay[i] || DRRDisplay[j]))) {
+					(v->BlendingAndTiming[i] == i && v->BlendingAndTiming[j] == i) ||
+					(v->BlendingAndTiming[j] == j && v->BlendingAndTiming[i] == j) ||
+					(v->BlendingAndTiming[i] == v->BlendingAndTiming[j] && v->BlendingAndTiming[i] != i) ||
+					(v->SynchronizeTimingsFinal && v->PixelClock[i] == v->PixelClock[j] &&
+					v->HTotal[i] == v->HTotal[j] && v->VTotal[i] == v->VTotal[j] &&
+					v->VActive[i] == v->VActive[j]) || (v->SynchronizeRRDisplaysForUCLKPStateChangeFinal &&
+					(v->DRRDisplay[i] || v->DRRDisplay[j]))) {
 				st_vars->SynchronizedSurfaces[i][j] = true;
 			} else {
 				st_vars->SynchronizedSurfaces[i][j] = false;
@@ -4416,8 +4385,8 @@ void dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
 		}
 	}
 
-	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
-		if ((UseMALLForPStateChange[k] != dm_use_mall_pstate_change_phantom_pipe) &&
+	for (k = 0; k < v->NumberOfActiveSurfaces; ++k) {
+		if ((v->UseMALLForPStateChange[k] != dm_use_mall_pstate_change_phantom_pipe) &&
 				(!st_vars->FoundFirstSurfaceWithMinActiveFCLKChangeMargin ||
 				st_vars->ActiveFCLKChangeLatencyMargin[k] < st_vars->MinActiveFCLKChangeMargin)) {
 			st_vars->FoundFirstSurfaceWithMinActiveFCLKChangeMargin = true;
@@ -4429,9 +4398,9 @@ void dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
 	*MinActiveFCLKChangeLatencySupported = st_vars->MinActiveFCLKChangeMargin + mmSOCParameters.FCLKChangeLatency;
 
 	st_vars->SameTimingForFCLKChange = true;
-	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
+	for (k = 0; k < v->NumberOfActiveSurfaces; ++k) {
 		if (!st_vars->SynchronizedSurfaces[k][st_vars->SurfaceWithMinActiveFCLKChangeMargin]) {
-			if ((UseMALLForPStateChange[k] != dm_use_mall_pstate_change_phantom_pipe) &&
+			if ((v->UseMALLForPStateChange[k] != dm_use_mall_pstate_change_phantom_pipe) &&
 					(st_vars->SameTimingForFCLKChange ||
 					st_vars->ActiveFCLKChangeLatencyMargin[k] <
 					st_vars->SecondMinActiveFCLKChangeMarginOneDisplayInVBLank)) {
@@ -4451,18 +4420,18 @@ void dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
 	}
 
 	*USRRetrainingSupport = true;
-	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
-		if ((UseMALLForPStateChange[k] != dm_use_mall_pstate_change_phantom_pipe) &&
+	for (k = 0; k < v->NumberOfActiveSurfaces; ++k) {
+		if ((v->UseMALLForPStateChange[k] != dm_use_mall_pstate_change_phantom_pipe) &&
 				(st_vars->USRRetrainingLatencyMargin[k] < 0)) {
 			*USRRetrainingSupport = false;
 		}
 	}
 
-	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
-		if (UseMALLForPStateChange[k] != dm_use_mall_pstate_change_full_frame &&
-				UseMALLForPStateChange[k] != dm_use_mall_pstate_change_sub_viewport &&
-				UseMALLForPStateChange[k] != dm_use_mall_pstate_change_phantom_pipe &&
-				ActiveDRAMClockChangeLatencyMargin[k] < 0) {
+	for (k = 0; k < v->NumberOfActiveSurfaces; ++k) {
+		if (v->UseMALLForPStateChange[k] != dm_use_mall_pstate_change_full_frame &&
+				v->UseMALLForPStateChange[k] != dm_use_mall_pstate_change_sub_viewport &&
+				v->UseMALLForPStateChange[k] != dm_use_mall_pstate_change_phantom_pipe &&
+				v->ActiveDRAMClockChangeLatencyMargin[k] < 0) {
 			if (PrefetchMode > 0) {
 				st_vars->DRAMClockChangeSupportNumber = 2;
 			} else if (st_vars->DRAMClockChangeSupportNumber == 0) {
@@ -4475,10 +4444,10 @@ void dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
 		}
 	}
 
-	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
-		if (UseMALLForPStateChange[k] == dm_use_mall_pstate_change_full_frame)
+	for (k = 0; k < v->NumberOfActiveSurfaces; ++k) {
+		if (v->UseMALLForPStateChange[k] == dm_use_mall_pstate_change_full_frame)
 			st_vars->DRAMClockChangeMethod = 1;
-		else if (UseMALLForPStateChange[k] == dm_use_mall_pstate_change_sub_viewport)
+		else if (v->UseMALLForPStateChange[k] == dm_use_mall_pstate_change_sub_viewport)
 			st_vars->DRAMClockChangeMethod = 2;
 	}
 
@@ -4505,16 +4474,16 @@ void dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
 			*DRAMClockChangeSupport = dm_dram_clock_change_unsupported;
 	}
 
-	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
+	for (k = 0; k < v->NumberOfActiveSurfaces; ++k) {
 		unsigned int dst_y_pstate;
 		unsigned int src_y_pstate_l;
 		unsigned int src_y_pstate_c;
 		unsigned int src_y_ahead_l, src_y_ahead_c, sub_vp_lines_l, sub_vp_lines_c;
 
-		dst_y_pstate = dml_ceil((mmSOCParameters.DRAMClockChangeLatency + mmSOCParameters.UrgentLatency) / (HTotal[k] / PixelClock[k]), 1);
-		src_y_pstate_l = dml_ceil(dst_y_pstate * VRatio[k], SwathHeightY[k]);
+		dst_y_pstate = dml_ceil((mmSOCParameters.DRAMClockChangeLatency + mmSOCParameters.UrgentLatency) / (v->HTotal[k] / v->PixelClock[k]), 1);
+		src_y_pstate_l = dml_ceil(dst_y_pstate * v->VRatio[k], SwathHeightY[k]);
 		src_y_ahead_l = dml_floor(DETBufferSizeY[k] / BytePerPixelDETY[k] / SwathWidthY[k], SwathHeightY[k]) + st_vars->LBLatencyHidingSourceLinesY[k];
-		sub_vp_lines_l = src_y_pstate_l + src_y_ahead_l + meta_row_height[k];
+		sub_vp_lines_l = src_y_pstate_l + src_y_ahead_l + v->meta_row_height[k];
 
 #ifdef __DML_VBA_DEBUG__
 dml_print("DML::%s: k=%d, DETBufferSizeY               = %d\n", __func__, k, DETBufferSizeY[k]);
@@ -4525,21 +4494,21 @@ dml_print("DML::%s: k=%d, LBLatencyHidingSourceLinesY  = %d\n", __func__, k, st_
 dml_print("DML::%s: k=%d, dst_y_pstate      = %d\n", __func__, k, dst_y_pstate);
 dml_print("DML::%s: k=%d, src_y_pstate_l    = %d\n", __func__, k, src_y_pstate_l);
 dml_print("DML::%s: k=%d, src_y_ahead_l     = %d\n", __func__, k, src_y_ahead_l);
-dml_print("DML::%s: k=%d, meta_row_height   = %d\n", __func__, k, meta_row_height[k]);
+dml_print("DML::%s: k=%d, v->meta_row_height   = %d\n", __func__, k, v->meta_row_height[k]);
 dml_print("DML::%s: k=%d, sub_vp_lines_l    = %d\n", __func__, k, sub_vp_lines_l);
 #endif
 		SubViewportLinesNeededInMALL[k] = sub_vp_lines_l;
 
 		if (BytePerPixelDETC[k] > 0) {
-			src_y_pstate_c = dml_ceil(dst_y_pstate * VRatioChroma[k], SwathHeightC[k]);
+			src_y_pstate_c = dml_ceil(dst_y_pstate * v->VRatioChroma[k], SwathHeightC[k]);
 			src_y_ahead_c = dml_floor(DETBufferSizeC[k] / BytePerPixelDETC[k] / SwathWidthC[k], SwathHeightC[k]) + st_vars->LBLatencyHidingSourceLinesC[k];
-			sub_vp_lines_c = src_y_pstate_c + src_y_ahead_c + meta_row_height_chroma[k];
+			sub_vp_lines_c = src_y_pstate_c + src_y_ahead_c + v->meta_row_height_chroma[k];
 			SubViewportLinesNeededInMALL[k] = dml_max(sub_vp_lines_l, sub_vp_lines_c);
 
 #ifdef __DML_VBA_DEBUG__
 dml_print("DML::%s: k=%d, src_y_pstate_c            = %d\n", __func__, k, src_y_pstate_c);
 dml_print("DML::%s: k=%d, src_y_ahead_c             = %d\n", __func__, k, src_y_ahead_c);
-dml_print("DML::%s: k=%d, meta_row_height_chroma    = %d\n", __func__, k, meta_row_height_chroma[k]);
+dml_print("DML::%s: k=%d, v->meta_row_height_chroma    = %d\n", __func__, k, v->meta_row_height_chroma[k]);
 dml_print("DML::%s: k=%d, sub_vp_lines_c            = %d\n", __func__, k, sub_vp_lines_c);
 #endif
 		}
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.h b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.h
index 37a314ce284b..8515a65c61da 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.h
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.h
@@ -811,66 +811,34 @@ void dml32_CalculateFlipSchedule(
 		bool *ImmediateFlipSupportedForPipe);
 
 void dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
-		struct dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport *st_vars,
-		bool USRRetrainingRequiredFinal,
-		enum dm_use_mall_for_pstate_change_mode UseMALLForPStateChange[],
+		struct vba_vars_st *v,
 		unsigned int PrefetchMode,
-		unsigned int NumberOfActiveSurfaces,
-		unsigned int MaxLineBufferLines,
-		unsigned int LineBufferSize,
-		unsigned int WritebackInterfaceBufferSize,
 		double DCFCLK,
 		double ReturnBW,
-		bool SynchronizeTimingsFinal,
-		bool SynchronizeDRRDisplaysForUCLKPStateChangeFinal,
-		bool DRRDisplay[],
-		unsigned int dpte_group_bytes[],
-		unsigned int meta_row_height[],
-		unsigned int meta_row_height_chroma[],
 		SOCParametersList mmSOCParameters,
-		unsigned int WritebackChunkSize,
 		double SOCCLK,
 		double DCFClkDeepSleep,
 		unsigned int DETBufferSizeY[],
 		unsigned int DETBufferSizeC[],
 		unsigned int SwathHeightY[],
 		unsigned int SwathHeightC[],
-		unsigned int LBBitPerPixel[],
 		double SwathWidthY[],
 		double SwathWidthC[],
-		double HRatio[],
-		double HRatioChroma[],
-		unsigned int VTaps[],
-		unsigned int VTapsChroma[],
-		double VRatio[],
-		double VRatioChroma[],
-		unsigned int HTotal[],
-		unsigned int VTotal[],
-		unsigned int VActive[],
-		double PixelClock[],
-		unsigned int BlendingAndTiming[],
 		unsigned int DPPPerSurface[],
 		double BytePerPixelDETY[],
 		double BytePerPixelDETC[],
 		double DSTXAfterScaler[],
 		double DSTYAfterScaler[],
-		bool WritebackEnable[],
-		enum source_format_class WritebackPixelFormat[],
-		double WritebackDestinationWidth[],
-		double WritebackDestinationHeight[],
-		double WritebackSourceHeight[],
 		bool UnboundedRequestEnabled,
 		unsigned int CompressedBufferSizeInkByte,
 
 		/* Output */
-		Watermarks *Watermark,
 		enum clock_change_support *DRAMClockChangeSupport,
 		double MaxActiveDRAMClockChangeLatencySupported[],
 		unsigned int SubViewportLinesNeededInMALL[],
 		enum dm_fclock_change_support *FCLKChangeSupport,
 		double *MinActiveFCLKChangeLatencySupported,
-		bool *USRRetrainingSupport,
-		double ActiveDRAMClockChangeLatencyMargin[]);
+		bool *USRRetrainingSupport);
 
 double dml32_CalculateWriteBackDISPCLK(
 		enum source_format_class WritebackPixelFormat,
-- 
2.37.2


--Uxb+/5nyZd8fyOJL--
