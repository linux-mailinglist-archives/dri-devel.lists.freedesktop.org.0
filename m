Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C088D58B06D
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 21:38:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4FEDA5722;
	Fri,  5 Aug 2022 19:32:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE669A3E57;
 Fri,  5 Aug 2022 19:32:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1359C61A36;
 Fri,  5 Aug 2022 19:32:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6385CC4347C;
 Fri,  5 Aug 2022 19:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659727953;
 bh=mfEh6ybw6rE7/YvSjSNtL1TZqU0Vwg2ccAlpa8gmxCw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=LX1rWOzm68paQ6IF/V/Z7Jyc4mrDJMxk18613pIutd20SJHjYfs8ZhEb+NcRWW05d
 MXovB+DdlRSYT/gY3UIS7oUWTnQ6Ma47JwlMLJ2KnAmdSKv5rbgaSpS2BtD2/28tq4
 rB1JGnZgbQBUwc6ohYPWw+vYSmCvEqBTbnujzgvplYHbExArH2u2i3DUWOv8LBCE7g
 ScShm5/Xl1O0DZjH6hn6562iDgdMKwrr3b80zPM5FwwhwBnYEAnjLxH5S+is3Jhp9p
 plohILwpbGdi9lOPyJmrVHVYDzrzbXoMNGgzVr7pUDH3A3H1U39o2wxM/bwqRJexqt
 3iAmOBvR3Rk3A==
Received: by mail-ej1-f49.google.com with SMTP id uj29so6791385ejc.0;
 Fri, 05 Aug 2022 12:32:33 -0700 (PDT)
X-Gm-Message-State: ACgBeo2SDrsheGYsVpMR6LOJNzThoYtSo5rwGfGHekf1AleUYyVx80bF
 Oo5VBb1wvpLuB0JSKjOLa+dUiaQXlV9HRCZhfa0=
X-Google-Smtp-Source: AA6agR6sufpPn7fKAXba69irZ//FbrrVb5P7LMB5EmBMDbLarfIv7nL6lJv4uXFV2w0bUTCcP1jOVQ494qKG5VTQJm8=
X-Received: by 2002:a17:907:28d6:b0:731:5d0:4401 with SMTP id
 en22-20020a17090728d600b0073105d04401mr2212923ejc.765.1659727951560; Fri, 05
 Aug 2022 12:32:31 -0700 (PDT)
MIME-Version: 1.0
References: <YuwRyQYPCb1FD+mr@debian>
 <CAHk-=whptVSSZL=wSUQJdRBeVfS+Xy_K4anQ7eQOky7XUrXhUQ@mail.gmail.com>
 <CAK8P3a2bEaExue0OtNeLa2CVzBx-1dE9w2HZ2PAV5N8Ct9G=JQ@mail.gmail.com>
 <YuwvfsztWaHvquwC@dev-arch.thelio-3990X>
 <9fb73284-7572-5703-93d3-f83a43535baf@amd.com>
 <CAK8P3a3Fv=_+GV9r=k4jP72zZOjJowL-GOue-51EhyVDBaEfEw@mail.gmail.com>
 <Yu1bMqL5tsbq1ojj@dev-arch.thelio-3990X>
In-Reply-To: <Yu1bMqL5tsbq1ojj@dev-arch.thelio-3990X>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 5 Aug 2022 21:32:13 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3PAxkctN6AXOsoTBTFgwHhk7_OSYwJ4Rgk7Dbs+bc0Qw@mail.gmail.com>
Message-ID: <CAK8P3a3PAxkctN6AXOsoTBTFgwHhk7_OSYwJ4Rgk7Dbs+bc0Qw@mail.gmail.com>
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 clang-built-linux <llvm@lists.linux.dev>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "Sudip Mukherjee \(Codethink\)" <sudipm.mukherjee@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 5, 2022 at 8:02 PM Nathan Chancellor <nathan@kernel.org> wrote:
> On Fri, Aug 05, 2022 at 06:16:45PM +0200, Arnd Bergmann wrote:
> > On Fri, Aug 5, 2022 at 5:32 PM Harry Wentland <harry.wentland@amd.com> wrote:
> > While splitting out sub-functions can help reduce the maximum stack
> > usage, it seems that in this case it makes the actual problem worse:
> > I see 2168 bytes for the combined
> > dml32_ModeSupportAndSystemConfigurationFull(), but marking
> > mode_support_configuration() as noinline gives me 1992 bytes
> > for the outer function plus 384 bytes for the inner one. So it does
> > avoid the warning (barely), but not the problem that the warning tries
> > to point out.
>
> I haven't had a chance to take a look at splitting things up yet, would
> you recommend a different approach?

Splitting up large functions can help when you have large local variables
that are used in different parts of the function, and the split gets the
compiler to reuse stack locations.

I think in this particular function, the problem isn't actually local variables
but either pushing variables on the stack for argument passing,
or something that causes the compiler to run out of registers so it
has to spill registers to the stack.

In either case, one has to actually look at the generated output
and then try to rearrange the codes so this does not happen.

One thing to try would be to condense a function call like

                dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(

&v->dummy_vars.dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport,
                        mode_lib->vba.USRRetrainingRequiredFinal,
                        mode_lib->vba.UsesMALLForPStateChange,

mode_lib->vba.PrefetchModePerState[mode_lib->vba.VoltageLevel][mode_lib->vba.maxMpcComb],
                        mode_lib->vba.NumberOfActiveSurfaces,
                        mode_lib->vba.MaxLineBufferLines,
                        mode_lib->vba.LineBufferSizeFinal,
                        mode_lib->vba.WritebackInterfaceBufferSize,
                        mode_lib->vba.DCFCLK,
                        mode_lib->vba.ReturnBW,
                        mode_lib->vba.SynchronizeTimingsFinal,

mode_lib->vba.SynchronizeDRRDisplaysForUCLKPStateChangeFinal,
                        mode_lib->vba.DRRDisplay,
                        v->dpte_group_bytes,
                        v->meta_row_height,
                        v->meta_row_height_chroma,

v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.mmSOCParameters,
                        mode_lib->vba.WritebackChunkSize,
                        mode_lib->vba.SOCCLK,
                        v->DCFCLKDeepSleep,
                        mode_lib->vba.DETBufferSizeY,
                        mode_lib->vba.DETBufferSizeC,
                        mode_lib->vba.SwathHeightY,
                        mode_lib->vba.SwathHeightC,
                        mode_lib->vba.LBBitPerPixel,
                        v->SwathWidthY,
                        v->SwathWidthC,
                        mode_lib->vba.HRatio,
                        mode_lib->vba.HRatioChroma,
                        mode_lib->vba.vtaps,
                        mode_lib->vba.VTAPsChroma,
                        mode_lib->vba.VRatio,
                        mode_lib->vba.VRatioChroma,
                        mode_lib->vba.HTotal,
                        mode_lib->vba.VTotal,
                        mode_lib->vba.VActive,
                        mode_lib->vba.PixelClock,
                        mode_lib->vba.BlendingAndTiming,
                        .... /* more arguments */);

into calling conventions that take a pointer to 'mode_lib->vba' and another
one to 'v', so these are no longer passed on the stack individually.

       Arnd
