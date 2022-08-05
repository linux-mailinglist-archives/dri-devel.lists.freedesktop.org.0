Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BA658AF7D
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 20:02:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7393611B38C;
	Fri,  5 Aug 2022 18:02:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AEB1A550C;
 Fri,  5 Aug 2022 18:02:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 72BDD618F8;
 Fri,  5 Aug 2022 18:02:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3219C433B5;
 Fri,  5 Aug 2022 18:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659722548;
 bh=rRUlRaiUztKc643nF1+XWdvVWIm0tYOtfCYBEqXC3qA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VSjFINmEU8bV2I20CL8Uyv/675fqSmotq82k4waVZ65fWg7SEmFFu7tnltqYgnxd6
 fI9PvRGYji7+oKI1UrEkRI5xmD15tM02CwGdYvyWbvpvltCJXv+LFaGeAnWguCPV5F
 H9RgpGmntExvAbgC7kjBj3P1e9YDZpD+1rQAbmNlHyAz6PaXgIqV8FHIRB39GubREB
 YJWXzESrhM/r/kPh3MftfQIk9yYdL3fXP8gOZPSOLIZWl2w4ubQs8RMNWDiiYqubab
 dMkObG53B9hjpPxkvYQsi3aucuu5eWtncyhuKL3zv69YjSFdKUzhyl0U+Sr77pw4JL
 7F52QDE0MBEgw==
Date: Fri, 5 Aug 2022 11:02:26 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: mainline build failure for x86_64 allmodconfig with clang
Message-ID: <Yu1bMqL5tsbq1ojj@dev-arch.thelio-3990X>
References: <YuwRyQYPCb1FD+mr@debian>
 <CAHk-=whptVSSZL=wSUQJdRBeVfS+Xy_K4anQ7eQOky7XUrXhUQ@mail.gmail.com>
 <CAK8P3a2bEaExue0OtNeLa2CVzBx-1dE9w2HZ2PAV5N8Ct9G=JQ@mail.gmail.com>
 <YuwvfsztWaHvquwC@dev-arch.thelio-3990X>
 <9fb73284-7572-5703-93d3-f83a43535baf@amd.com>
 <CAK8P3a3Fv=_+GV9r=k4jP72zZOjJowL-GOue-51EhyVDBaEfEw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a3Fv=_+GV9r=k4jP72zZOjJowL-GOue-51EhyVDBaEfEw@mail.gmail.com>
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 clang-built-linux <llvm@lists.linux.dev>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "Sudip Mukherjee \(Codethink\)" <sudipm.mukherjee@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 05, 2022 at 06:16:45PM +0200, Arnd Bergmann wrote:
> On Fri, Aug 5, 2022 at 5:32 PM Harry Wentland <harry.wentland@amd.com> wrote:
> > > I do notice that these files build with a non-configurable
> > > -Wframe-large-than value:
> > >
> > > $ rg frame_warn_flag drivers/gpu/drm/amd/display/dc/dml/Makefile
> > > 54:frame_warn_flag := -Wframe-larger-than=2048
> >
> > Tbh, I was looking at the history and I can't find a good reason this
> > was added. It should be safe to drop this. I would much rather use
> > the CONFIG_FRAME_WARN value than override it.
> >
> > AFAIK most builds use 2048 by default anyways.
> 
> I'm fairly sure this was done for 32-bit builds, which default to a lower
> warning limit of 1024 bytes and would otherwise run into this
> problem when 64-bit platforms don't. With the default warning limit,
> clang warns even more about an i386 build:
> 
> display/dc/dml/dcn20/display_rq_dlg_calc_20.c:1549:6: error: stack
> frame size (1324) exceeds limit (1024) in 'dml20_rq_dlg_get_dlg_reg'
> display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:1550:6: error: stack
> frame size (1324) exceeds limit (1024) in 'dml20v2_rq_dlg_get_dlg_reg'
> display/dc/dml/dcn30/display_rq_dlg_calc_30.c:1742:6: error: stack
> frame size (1484) exceeds limit (1024) in 'dml30_rq_dlg_get_dlg_reg'
> display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1571:6: error: stack
> frame size (1548) exceeds limit (1024) in 'dml31_rq_dlg_get_dlg_reg'
> display/dc/dml/dcn21/display_rq_dlg_calc_21.c:1657:6: error: stack
> frame size (1388) exceeds limit (1024) in 'dml21_rq_dlg_get_dlg_reg'
> display/dc/dml/dcn32/display_rq_dlg_calc_32.c:206:6: error: stack
> frame size (1276) exceeds limit (1024) in 'dml32_rq_dlg_get_dlg_reg'
> display/dc/dml/dcn31/display_mode_vba_31.c:2049:13: error: stack frame
> size (1468) exceeds limit (1024) in
> 'DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation'
> display/dc/dml/dcn20/display_mode_vba_20v2.c:1145:13: error: stack
> frame size (1228) exceeds limit (1024) in
> 'dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation'
> display/dc/dml/dcn20/display_mode_vba_20.c:1085:13: error: stack frame
> size (1340) exceeds limit (1024) in
> 'dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation'
> display/dc/dml/dcn31/display_mode_vba_31.c:3908:6: error: stack frame
> size (1996) exceeds limit (1024) in
> 'dml31_ModeSupportAndSystemConfigurationFull'
> display/dc/dml/dcn21/display_mode_vba_21.c:1466:13: error: stack frame
> size (1308) exceeds limit (1024) in
> 'DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation'
> display/dc/dml/dcn20/display_mode_vba_20v2.c:3393:6: error: stack
> frame size (1356) exceeds limit (1024) in
> 'dml20v2_ModeSupportAndSystemConfigurationFull'
> display/dc/dml/dcn20/display_mode_vba_20.c:3286:6: error: stack frame
> size (1468) exceeds limit (1024) in
> 'dml20_ModeSupportAndSystemConfigurationFull'
> display/dc/dml/dcn21/display_mode_vba_21.c:3518:6: error: stack frame
> size (1228) exceeds limit (1024) in
> 'dml21_ModeSupportAndSystemConfigurationFull'
> display/dc/dml/dcn30/display_mode_vba_30.c:1906:13: error: stack frame
> size (1436) exceeds limit (1024) in
> 'DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation'
> display/dc/dml/dcn30/display_mode_vba_30.c:3596:6: error: stack frame
> size (2092) exceeds limit (1024) in
> 'dml30_ModeSupportAndSystemConfigurationFull'
> > > I do note that commit 1b54a0121dba ("drm/amd/display: Reduce stack size
> > > in the mode support function") did have a workaround for GCC. It appears
> > > clang will still inline mode_support_configuration(). If I mark it as
> > > 'noinline', the warning disappears in that file.
> >
> > That'd be the best quick fix. I guess if we split out functions to fix
> > stack usage we should mark them as 'noinline' in the future to avoid
> > agressive compiler optimizations.
> 
> While splitting out sub-functions can help reduce the maximum stack
> usage, it seems that in this case it makes the actual problem worse:
> I see 2168 bytes for the combined
> dml32_ModeSupportAndSystemConfigurationFull(), but marking
> mode_support_configuration() as noinline gives me 1992 bytes
> for the outer function plus 384 bytes for the inner one. So it does
> avoid the warning (barely), but not the problem that the warning tries
> to point out.

I haven't had a chance to take a look at splitting things up yet, would
you recommend a different approach?

Cheers,
Nathan
