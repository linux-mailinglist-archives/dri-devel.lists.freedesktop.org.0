Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8E458ADF8
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 18:20:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBC8EB7CB9;
	Fri,  5 Aug 2022 16:18:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED4E7B7D74;
 Fri,  5 Aug 2022 16:17:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 80B5DB80B20;
 Fri,  5 Aug 2022 16:17:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44AC7C43140;
 Fri,  5 Aug 2022 16:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659716223;
 bh=8grFLuwlQy0Ot8AOJ3yQKp3FjPtqCsWnDxEz8xLu22U=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=S1Zay7+AGgZcUCq7wrx5A/C0aep+dKgB5hcEjFtW4tftu/80/B6Q8OcvcwNhq+Otu
 o222N5h+m/UXeaeDBok542Ri8zeZAGBgaLJ+Y31oeXxv6WUrdkg5fE5gyoBtFjQtmk
 slz8VGRuiJsttzZCXh9Z0zJADXe35fRHrOy/k/qhXYgTTneYaN95kk+9Al5yDGJa6w
 7yBzHnwUTcOdXpHxuzYOeTY70INSOjkjzzKg/g7OxKzY1RXLJ0KNZiLIBF+/1WJDjV
 Qyd4zMIPm7hw9L2O/QptByvsMheDELqbCm0et8wP2oNga9unCv5w1R9iOgczug9GBK
 SAZ8bzhOxoZvQ==
Received: by mail-ej1-f54.google.com with SMTP id dc19so5793851ejb.12;
 Fri, 05 Aug 2022 09:17:03 -0700 (PDT)
X-Gm-Message-State: ACgBeo3d0RY/b49gi8gq1I9fYAoyq155L8kPcCu28MtYpw+HuNrgxWKn
 pbFblXG0FXevfeXDY2wi5wKZUN1SFzwA0K4kRdk=
X-Google-Smtp-Source: AA6agR4R1JzUUmCUe4J6toqC9u62zKSlRPtv5bfElt/h5Y16RKiwaSKXI4eB4mnRJZxJJ+hBT4gy7eHrda+QQm1kO9Q=
X-Received: by 2002:a17:907:28d6:b0:731:5d0:4401 with SMTP id
 en22-20020a17090728d600b0073105d04401mr1753624ejc.765.1659716221514; Fri, 05
 Aug 2022 09:17:01 -0700 (PDT)
MIME-Version: 1.0
References: <YuwRyQYPCb1FD+mr@debian>
 <CAHk-=whptVSSZL=wSUQJdRBeVfS+Xy_K4anQ7eQOky7XUrXhUQ@mail.gmail.com>
 <CAK8P3a2bEaExue0OtNeLa2CVzBx-1dE9w2HZ2PAV5N8Ct9G=JQ@mail.gmail.com>
 <YuwvfsztWaHvquwC@dev-arch.thelio-3990X>
 <9fb73284-7572-5703-93d3-f83a43535baf@amd.com>
In-Reply-To: <9fb73284-7572-5703-93d3-f83a43535baf@amd.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 5 Aug 2022 18:16:45 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3Fv=_+GV9r=k4jP72zZOjJowL-GOue-51EhyVDBaEfEw@mail.gmail.com>
Message-ID: <CAK8P3a3Fv=_+GV9r=k4jP72zZOjJowL-GOue-51EhyVDBaEfEw@mail.gmail.com>
Subject: Re: mainline build failure for x86_64 allmodconfig with clang
To: Harry Wentland <harry.wentland@amd.com>
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 clang-built-linux <llvm@lists.linux.dev>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "Sudip Mukherjee \(Codethink\)" <sudipm.mukherjee@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 5, 2022 at 5:32 PM Harry Wentland <harry.wentland@amd.com> wrote:
> > I do notice that these files build with a non-configurable
> > -Wframe-large-than value:
> >
> > $ rg frame_warn_flag drivers/gpu/drm/amd/display/dc/dml/Makefile
> > 54:frame_warn_flag := -Wframe-larger-than=2048
>
> Tbh, I was looking at the history and I can't find a good reason this
> was added. It should be safe to drop this. I would much rather use
> the CONFIG_FRAME_WARN value than override it.
>
> AFAIK most builds use 2048 by default anyways.

I'm fairly sure this was done for 32-bit builds, which default to a lower
warning limit of 1024 bytes and would otherwise run into this
problem when 64-bit platforms don't. With the default warning limit,
clang warns even more about an i386 build:

display/dc/dml/dcn20/display_rq_dlg_calc_20.c:1549:6: error: stack
frame size (1324) exceeds limit (1024) in 'dml20_rq_dlg_get_dlg_reg'
display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:1550:6: error: stack
frame size (1324) exceeds limit (1024) in 'dml20v2_rq_dlg_get_dlg_reg'
display/dc/dml/dcn30/display_rq_dlg_calc_30.c:1742:6: error: stack
frame size (1484) exceeds limit (1024) in 'dml30_rq_dlg_get_dlg_reg'
display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1571:6: error: stack
frame size (1548) exceeds limit (1024) in 'dml31_rq_dlg_get_dlg_reg'
display/dc/dml/dcn21/display_rq_dlg_calc_21.c:1657:6: error: stack
frame size (1388) exceeds limit (1024) in 'dml21_rq_dlg_get_dlg_reg'
display/dc/dml/dcn32/display_rq_dlg_calc_32.c:206:6: error: stack
frame size (1276) exceeds limit (1024) in 'dml32_rq_dlg_get_dlg_reg'
display/dc/dml/dcn31/display_mode_vba_31.c:2049:13: error: stack frame
size (1468) exceeds limit (1024) in
'DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation'
display/dc/dml/dcn20/display_mode_vba_20v2.c:1145:13: error: stack
frame size (1228) exceeds limit (1024) in
'dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation'
display/dc/dml/dcn20/display_mode_vba_20.c:1085:13: error: stack frame
size (1340) exceeds limit (1024) in
'dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation'
display/dc/dml/dcn31/display_mode_vba_31.c:3908:6: error: stack frame
size (1996) exceeds limit (1024) in
'dml31_ModeSupportAndSystemConfigurationFull'
display/dc/dml/dcn21/display_mode_vba_21.c:1466:13: error: stack frame
size (1308) exceeds limit (1024) in
'DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation'
display/dc/dml/dcn20/display_mode_vba_20v2.c:3393:6: error: stack
frame size (1356) exceeds limit (1024) in
'dml20v2_ModeSupportAndSystemConfigurationFull'
display/dc/dml/dcn20/display_mode_vba_20.c:3286:6: error: stack frame
size (1468) exceeds limit (1024) in
'dml20_ModeSupportAndSystemConfigurationFull'
display/dc/dml/dcn21/display_mode_vba_21.c:3518:6: error: stack frame
size (1228) exceeds limit (1024) in
'dml21_ModeSupportAndSystemConfigurationFull'
display/dc/dml/dcn30/display_mode_vba_30.c:1906:13: error: stack frame
size (1436) exceeds limit (1024) in
'DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation'
display/dc/dml/dcn30/display_mode_vba_30.c:3596:6: error: stack frame
size (2092) exceeds limit (1024) in
'dml30_ModeSupportAndSystemConfigurationFull'
> > I do note that commit 1b54a0121dba ("drm/amd/display: Reduce stack size
> > in the mode support function") did have a workaround for GCC. It appears
> > clang will still inline mode_support_configuration(). If I mark it as
> > 'noinline', the warning disappears in that file.
>
> That'd be the best quick fix. I guess if we split out functions to fix
> stack usage we should mark them as 'noinline' in the future to avoid
> agressive compiler optimizations.

While splitting out sub-functions can help reduce the maximum stack
usage, it seems that in this case it makes the actual problem worse:
I see 2168 bytes for the combined
dml32_ModeSupportAndSystemConfigurationFull(), but marking
mode_support_configuration() as noinline gives me 1992 bytes
for the outer function plus 384 bytes for the inner one. So it does
avoid the warning (barely), but not the problem that the warning tries
to point out.

        Arnd
