Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00ACB65DBF9
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 19:15:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6465310E46C;
	Wed,  4 Jan 2023 18:15:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E61610E45C;
 Wed,  4 Jan 2023 18:15:45 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-12c8312131fso40724356fac.4; 
 Wed, 04 Jan 2023 10:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HyIkpauZKTPmczbPiJe25KjukXJKPWz4lx8J7k0wqLg=;
 b=B1OIGpHAIBq66tSi3o/ydgsdgU0Nw9DIKnsPNFPFburz6PZ6iU1wP5BVvx6ZA3Pr4F
 yo/QULWRGTeQ238ssSchSSDqI1E9MwNX1V+q3eQi4LBFi2QblDYuZURw6KgZd8lbm26J
 BNeJUbndWVmo9wHR9mErmQXroIYIF0o98fhzOlfwP6KoGgvDmfpBGSuKKHF4xJmH+zNA
 Mp4ie99cEySje00muexXV+dfM+Pat086sWTZYxY0AhrfOg+085bbfu4H2aB+4Tq1SH70
 lj1oUo+xK0FRvZwZ9rK9H+W2aop1RE/9iJHBaorUfx628bZ3/QisnT73p/elCR3GrmFo
 CadQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HyIkpauZKTPmczbPiJe25KjukXJKPWz4lx8J7k0wqLg=;
 b=gvsDvwDyIwcVGDU0pWVcgo7sjIPpx9ifliv3XvMro6E47RCIAT3gBX8IhFNgTMUkez
 fO1JtBZ1hjpVUp0klOUo3z3b4l8QK8tuyxYG11xICxZhb95cI1zbMzRrQ2wAfVEYbjQ0
 hh3VIXpBl7kuop/HEOx4ZH++wxe1C6S2PhTM2UAcVRPCkj8y4NWcn36FiLyTdv0qwxKS
 O6CWk+nTjWAgAjJnURn7PGnFJCKxh6n3bvMqMat2pJ/lklQndvrQL15mRKRVDzzEGahH
 NU0Yg8dvlkOrEGhjzBWuP3VD6si9LbwNZi46zEhd7RnMPpQVM+z6+e3tYt1LN/eOnkXj
 nALA==
X-Gm-Message-State: AFqh2koVPMLzopLPpWb5bxeRqET03/gj/PzWK1fNPiLB8jrjrxKYyVf+
 ouHHjCtguDJln/iexaPoulAKIvbpzhZvquhgg5E=
X-Google-Smtp-Source: AMrXdXviJLkKrf6VD0qTPGMIX9nLRZKBabViahE/tZMOxAF/6P1SxuZiilBBLbF1Qbp1lz8JxLAb2qUuEnm/H39UHng=
X-Received: by 2002:a05:6870:4d14:b0:144:5f0d:9fcb with SMTP id
 pn20-20020a0568704d1400b001445f0d9fcbmr2649579oab.38.1672856144370; Wed, 04
 Jan 2023 10:15:44 -0800 (PST)
MIME-Version: 1.0
References: <20230103155122.1170930-1-dmitry.baryshkov@linaro.org>
 <6c058038-130c-6de6-3554-053f7d94f732@quicinc.com>
In-Reply-To: <6c058038-130c-6de6-3554-053f7d94f732@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 4 Jan 2023 10:15:44 -0800
Message-ID: <CAF6AEGujbM-LYme4LYmGk_xV8-AUoEkPNvk1cTAg9jUoLUOVOg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm: another fix for the headless Adreno GPU
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, kernel test robot <lkp@intel.com>,
 Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 4, 2023 at 10:09 AM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 1/3/2023 7:51 AM, Dmitry Baryshkov wrote:
> > Fix another oops reproducible when rebooting the board with the Adreno
> > GPU wokring in the headless mode (e.g. iMX platforms).
> wokring ---> working
> >
> > Unable to handle kernel NULL pointer dereference at virtual address 00000000 when read
> > [00000000] *pgd=74936831, *pte=00000000, *ppte=00000000
> > Internal error: Oops: 17 [#1] ARM
> > CPU: 0 PID: 51 Comm: reboot Not tainted 6.2.0-rc1-dirty #11
> > Hardware name: Freescale i.MX53 (Device Tree Support)
> > PC is at msm_atomic_commit_tail+0x50/0x970
> > LR is at commit_tail+0x9c/0x188
> > pc : [<c06aa430>]    lr : [<c067a214>]    psr: 600e0013
> > sp : e0851d30  ip : ee4eb7eb  fp : 00090acc
> > r10: 00000058  r9 : c2193014  r8 : c4310000
> > r7 : c4759380  r6 : 07bef61d  r5 : 00000000  r4 : 00000000
> > r3 : c44cc440  r2 : 00000000  r1 : 00000000  r0 : 00000000
> > Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
> > Control: 10c5387d  Table: 74910019  DAC: 00000051
> > Register r0 information: NULL pointer
> > Register r1 information: NULL pointer
> > Register r2 information: NULL pointer
> > Register r3 information: slab kmalloc-1k start c44cc400 pointer offset 64 size 1024
> > Register r4 information: NULL pointer
> > Register r5 information: NULL pointer
> > Register r6 information: non-paged memory
> > Register r7 information: slab kmalloc-128 start c4759380 pointer offset 0 size 128
> > Register r8 information: slab kmalloc-2k start c4310000 pointer offset 0 size 2048
> > Register r9 information: non-slab/vmalloc memory
> > Register r10 information: non-paged memory
> > Register r11 information: non-paged memory
> > Register r12 information: non-paged memory
> > Process reboot (pid: 51, stack limit = 0xc80046d9)
> > Stack: (0xe0851d30 to 0xe0852000)
> > 1d20:                                     c4759380 fbd77200 000005ff 002b9c70
> > 1d40: c4759380 c4759380 00000000 07bef61d 00000600 c0d6fe7c c2193014 00000058
> > 1d60: 00090acc c067a214 00000000 c4759380 c4310000 00000000 c44cc854 c067a89c
> > 1d80: 00000000 00000000 00000000 c4310468 00000000 c4759380 c4310000 c4310468
> > 1da0: c4310470 c0643258 c4759380 00000000 00000000 c0c4ee24 00000000 c44cc810
> > 1dc0: 00000000 c0c4ee24 00000000 c44cc810 00000000 0347d2a8 e0851e00 e0851e00
> > 1de0: c4759380 c067ad20 c4310000 00000000 c44cc810 c27f8718 c44cc854 c067adb8
> > 1e00: c4933000 00000002 00000001 00000000 00000000 c2130850 00000000 c2130854
> > 1e20: c25fc488 00000000 c0ff162c 00000000 00000001 00000002 00000000 00000000
> > 1e40: c43102c0 c43102c0 00000000 0347d2a8 c44cc810 c44cc814 c2133da8 c06d1a60
> > 1e60: 00000000 00000000 00079028 c2012f24 fee1dead c4933000 00000058 c01431e4
> > 1e80: 01234567 c0143a20 00000000 00000000 00000000 00000000 00000000 00000000
> > 1ea0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> > 1ec0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> > 1ee0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> > 1f00: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> > 1f20: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> > 1f40: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> > 1f60: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> > 1f80: 00000000 00000000 00000000 0347d2a8 00000002 00000004 00000078 00000058
> > 1fa0: c010028c c0100060 00000002 00000004 fee1dead 28121969 01234567 00079028
> > 1fc0: 00000002 00000004 00000078 00000058 0002fdc5 00000000 00000000 00090acc
> > 1fe0: 00000058 becc9c64 b6e97e05 b6e0e5f6 600e0030 fee1dead 00000000 00000000
> >   msm_atomic_commit_tail from commit_tail+0x9c/0x188
> >   commit_tail from drm_atomic_helper_commit+0x160/0x188
> >   drm_atomic_helper_commit from drm_atomic_commit+0xac/0xe0
> >   drm_atomic_commit from drm_atomic_helper_disable_all+0x1b0/0x1c0
> >   drm_atomic_helper_disable_all from drm_atomic_helper_shutdown+0x88/0x140
> >   drm_atomic_helper_shutdown from device_shutdown+0x16c/0x240
> >   device_shutdown from kernel_restart+0x38/0x90
> >   kernel_restart from __do_sys_reboot+0x174/0x224
> >   __do_sys_reboot from ret_fast_syscall+0x0/0x1c
> > Exception stack(0xe0851fa8 to 0xe0851ff0)
> > 1fa0:                   00000002 00000004 fee1dead 28121969 01234567 00079028
> > 1fc0: 00000002 00000004 00000078 00000058 0002fdc5 00000000 00000000 00090acc
> > 1fe0: 00000058 becc9c64 b6e97e05 b6e0e5f6
> > Code: 15922088 1184421c e1500003 1afffff8 (e5953000)
> > ---[ end trace 0000000000000000 ]---
> >
> > Fixes: 0a58d2ae572a ("drm/msm: Make .remove and .shutdown HW shutdown consistent")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> How is this null pointer hitting?
>
> priv->kms is assigned in the msm_drm_init() which happens in the bind.

I think we want to solve this higher up.. hitting atomic commit path
on a device which has no kms resources (planes, CRTCs, etc) seems
pretty wrong

BR,
-R

> Only then we register the dri card for the commit which means commit
> cannot come before that.
>
> So, how can this sequence be possible?
>
> > ---
> >
> > Changes since v1:
> > - Moved setting of `async' before the call to trace to fix the
> >    uninitialized variable warning
> >
> > ---
> >   drivers/gpu/drm/msm/msm_atomic.c | 7 ++++++-
> >   1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
> > index 1686fbb611fd..d8cded52cabf 100644
> > --- a/drivers/gpu/drm/msm/msm_atomic.c
> > +++ b/drivers/gpu/drm/msm/msm_atomic.c
> > @@ -186,7 +186,12 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
> >       struct msm_kms *kms = priv->kms;
> >       struct drm_crtc *async_crtc = NULL;
> >       unsigned crtc_mask = get_crtc_mask(state);
> > -     bool async = kms->funcs->vsync_time &&
> > +     bool async;
> > +
> > +     if (!kms)
> > +             return;
> > +
> > +     async = kms->funcs->vsync_time &&
> >                       can_do_async(state, &async_crtc);
> >
> >       trace_msm_atomic_commit_tail_start(async, crtc_mask);
