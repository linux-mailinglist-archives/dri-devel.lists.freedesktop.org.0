Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7211A2E7192
	for <lists+dri-devel@lfdr.de>; Tue, 29 Dec 2020 16:07:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A19189211;
	Tue, 29 Dec 2020 15:07:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC3B489211
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Dec 2020 15:07:38 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id 15so14865625oix.8
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Dec 2020 07:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QqvfcvBB/yuJN88cknZSgA0GC7ju7WQsqKbZVnzon9A=;
 b=rcYdCtotJM+LpY7Zu7AX9yGCRCcl+q2r5SXVbMFfkoXpoZ8WDV/Hc7fHIijlA5hicY
 uOcqjg0wmvJsVzeQMwHLisl9uzMf3YRVSE+lgPeihRVUNVxzJYwLD/GsvmzkmcCLRPRJ
 6+ffFonT6L/DPJVdkI//S/yINgTmuXTZtY31pR4M3j6rZOniXPHroG6ivM11QsBSmwKu
 Ksi31p54tgkrUqUOTqtLp+++7PjXKKpF7TDIoQKncd1Ht3YrSkXUiKeAHsJwDgY7Tq4L
 4Ws0lRjBLS6vJ1ifUOveTlj7BVwWJatShcc2qlHOyxGoKsyBabt6p/wN48L7o5rtOM2K
 yb0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QqvfcvBB/yuJN88cknZSgA0GC7ju7WQsqKbZVnzon9A=;
 b=TM9/6AlQ3W4fu65XSvE5nyRsTlnw03NP7bSYRkLR5HzmeJobLlNNxzZWbg1ddaW6lU
 SBWh7mE8OhZ6RcnDW7f5+L4chPmHZ5whaKCqZOFWhIjtRhVq3p1h4d9b+0yVooilMbAg
 1r83icLzLAc9JdzTDXODbdEKgE6c3bEN4RpyQk3ap5ybRD9Qt8Wgj15cZGT2eT0Xjzzv
 V+dGrlKroaUA9hOPiF6oVxIWGPAouqwNNuOd15sWxO7T8j9D5Rl0ePFSYu6KFTnOWUbA
 ewKKwrDQX4rgV1zBgZnbvz3W1WSuCTqfe2QD868HcgvMui4CnjJUwFugWYkZmcf2zZsz
 UmcQ==
X-Gm-Message-State: AOAM533UWoNDSNxI43ZBgE1OgWPi7FHfLtthHdJuvJxvA7SC1T8OiGDG
 m127hXtPxiA8fkShbLZUilQIQMevuun3ymzrQs8=
X-Google-Smtp-Source: ABdhPJzC2MH8SjmAcuJHIWCLv3XOp2I/AEt3ZNbGPd3fKXcTSy+TUAWZJnrJznG1ESwJk4StebJOioPc98JbCD+BjVQ=
X-Received: by 2002:a54:4083:: with SMTP id i3mr2552418oii.120.1609254458047; 
 Tue, 29 Dec 2020 07:07:38 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9twrkJdUqTLXXsNygtzkrc4P2iyw4kwU1T83D4_+-gdpDA@mail.gmail.com>
 <CAHk-=whf+kw=YSDbmvgiSvNL9ckHc8EpkTgZzMXu-bMw941GYQ@mail.gmail.com>
In-Reply-To: <CAHk-=whf+kw=YSDbmvgiSvNL9ckHc8EpkTgZzMXu-bMw941GYQ@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 29 Dec 2020 10:07:27 -0500
Message-ID: <CADnq5_N_2iYnh13p-z5vrvNK9rzKV-5TYtCC-FiEYjvi--_org@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 5.11-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Harry Wentland <hwentlan@amd.com>, 
 "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>,
 Hersen Wu <hersenxs.wu@amd.com>
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>, Josip Pavic <Josip.Pavic@amd.com>,
 Bindu Ramamurthy <bindu.r@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 24, 2020 at 5:28 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, Dec 23, 2020 at 6:29 PM Dave Airlie <airlied@gmail.com> wrote:
> >
> > Xmas eve pull request present. Just some fixes that trickled in this
> > past week. Mostly amdgpu fixes, with a dma-buf/mips build fix and some
> > misc komeda fixes.
>
> Well, I already pulled and pushed out my merge, but only noticed
> afterwards that clang complains about this, and I think it's a real
> bug:
>
>   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_mpc.c:475:6: warning:
>      variable 'val' is used uninitialized whenever 'if' condition is
> false [-Wsometimes-uninitialized]
>
> and it sure is true: the code literally does
>
>         uint32_t val;
>
>         if (opp_id < MAX_OPP && REG(MUX[opp_id]))
>                 REG_GET(MUX[opp_id], MPC_OUT_MUX, &val);
>
>         return val;
>
> so clearly 'val' isn't initialized if that if-statement isn't true.
>
> I assume 'opp_id' is always presumed to be valid, but that code really
> is disgusting.
>
> Just make it return 0 (or whatever) for invalid, possibly together
> with a WARN_ON_ONCE(). Ok?

Harry, Nick, Hersen,

Can you take a look?

Thanks,

Alex

>
>              Linus
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
