Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B561EB3B3
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 05:15:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFB5B6E114;
	Tue,  2 Jun 2020 03:15:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09AC76E114
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jun 2020 03:15:31 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id o15so11236771ejm.12
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jun 2020 20:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1zA7vzfVV7uc5rZLCKmjvmtN9YrzTYU7uysspI8RouA=;
 b=PPzN38p6xS/1rWQfEtCi0O4QOug9WQQjXD1XbMet0iS1e8JQ30GJuGTJXnW5x6FE0H
 DrpcZpa6Ty1PQw9sS88mbWVxJEgW1X29azUSSaTZ3BPOxI/ZHijKeGUnb5z0ZJw0r+BQ
 zO3RIZfWe62ImNCqCKm4XbgkqDkq4IMyF8uCfxM/Mg0BqZUCtlLcfycgbtY9dnp6PPIY
 E0ouKgSPN3+reQ6t9tFW0JLGrh3U7YTEEM5bQ/8wW/AkNmhjG8yg9q9GfB2g2rsZmfa7
 nP2DC9+Lr4olNjir+hBUf6adj7y8PKYt3VIfQHZ1rTY2zZBhCVsZLi4eL1AQqrTCRZ8q
 zLRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1zA7vzfVV7uc5rZLCKmjvmtN9YrzTYU7uysspI8RouA=;
 b=FuLDvyIc55soU+SUBUjG57SrRGuJL53nmWMpdC6hrNB7Yaf+sy6KPRCz4QZ4fafCju
 DXTwDvcnn8f/rpSBFIti9ob/cu+T+bf5S9By7bgMvwqhgduvc8kiQGbbSltlj/cNrx1v
 s+60uakggrN/AjndmoIj0dfQjIpeEiHxdcNhOY5Fj/FCPeSveGAvO/YZ9/tdoZQtzrdL
 lUnxinRv+jfEQU/OZWKdMT+ID0uq+6bnixrnOQA+AZKfPMY4BXAk/XROSFt1PSu9u7IF
 nfmwR1/VJ29ocupZ0riA/w6Qat4dx7VGJXEtn+FG2afDQzGqR2yC2uvmOzEvn3g4JBwX
 tc6w==
X-Gm-Message-State: AOAM530seJYkrzWmAqJgc/N78X4IL7MLuKRCkVLiipqlZjZM11+zK8n7
 vZ7d+OtbQj3plDDuBwUlv/Z0j6/ggWeZpj4yY56XAw==
X-Google-Smtp-Source: ABdhPJyq02skMdvnbFgxH+Z85m5rZGTGbYhnfGy3YwKQggLUpS4n22iGbzy6okTBJstef/6wnAtmGUglzx2G1145j1s=
X-Received: by 2002:a17:906:4d04:: with SMTP id
 r4mr20985523eju.317.1591067730468; 
 Mon, 01 Jun 2020 20:15:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200519150955.1667566a@canb.auug.org.au>
 <20200526140841.0a1d5c7b@canb.auug.org.au>
 <20200529141056.000f78ba@canb.auug.org.au>
 <20200602081532.653091c8@canb.auug.org.au>
In-Reply-To: <20200602081532.653091c8@canb.auug.org.au>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 2 Jun 2020 13:15:19 +1000
Message-ID: <CAPM=9twHZAs+6QXih8W7FrsRJt+mBQ=9qg9SJ9mR-3udSs9pYQ@mail.gmail.com>
Subject: Re: inux-next: build failure after merge of the drm-msm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
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
Cc: Dave Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Sean Paul <seanpaul@chromium.org>, Kalyan Thota <kalyan_t@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2 Jun 2020 at 08:15, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Dave,
>
> On Fri, 29 May 2020 14:10:56 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > On Tue, 26 May 2020 14:08:41 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > On Tue, 19 May 2020 15:09:55 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > >
> > > > After merging the drm-msm tree, today's linux-next build (arm
> > > > multi_v7_defconfig) failed like this:
> > > >
> > > > ERROR: modpost: "__aeabi_ldivmod" [drivers/gpu/drm/msm/msm.ko] undefined!
> > > > ERROR: modpost: "__aeabi_uldivmod" [drivers/gpu/drm/msm/msm.ko] undefined!
> > > >
> > > > Caused by commit
> > > >
> > > >   04d9044f6c57 ("drm/msm/dpu: add support for clk and bw scaling for display")
> > > >
> > > > I applied the following patch for today (this is mechanical, there may
> > > > be a better way):
> > > >
> > > > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > > > Date: Tue, 19 May 2020 14:12:39 +1000
> > > > Subject: [PATCH] drm/msm/dpu: fix up u64/u32 division for 32 bit architectures
> > > >
> > > > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > > > ---
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 23 ++++++++++++++-----
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 15 ++++++++----
> > > >  2 files changed, 28 insertions(+), 10 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > > > index 9697abcbec3f..85c2a4190840 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > > > @@ -10,6 +10,7 @@
> > > >  #include <linux/sort.h>
> > > >  #include <linux/clk.h>
> > > >  #include <linux/bitmap.h>
> > > > +#include <asm/div64.h>
> > > >
> > > >  #include "dpu_kms.h"
> > > >  #include "dpu_trace.h"
> > > > @@ -53,8 +54,11 @@ static u64 _dpu_core_perf_calc_bw(struct dpu_kms *kms,
> > > >   }
> > > >
> > > >   bw_factor = kms->catalog->perf.bw_inefficiency_factor;
> > > > - if (bw_factor)
> > > > -         crtc_plane_bw = mult_frac(crtc_plane_bw, bw_factor, 100);
> > > > + if (bw_factor) {
> > > > +         u64 quot = crtc_plane_bw;
> > > > +         u32 rem = do_div(quot, 100);
> > > > +         crtc_plane_bw = (quot * bw_factor) + ((rem * bw_factor) / 100);
> > > > + }
> > > >
> > > >   return crtc_plane_bw;
> > > >  }
> > > > @@ -89,8 +93,11 @@ static u64 _dpu_core_perf_calc_clk(struct dpu_kms *kms,
> > > >   }
> > > >
> > > >   clk_factor = kms->catalog->perf.clk_inefficiency_factor;
> > > > - if (clk_factor)
> > > > -         crtc_clk = mult_frac(crtc_clk, clk_factor, 100);
> > > > + if (clk_factor) {
> > > > +         u64 quot = crtc_clk;
> > > > +         u32 rem = do_div(quot, 100);
> > > > +         crtc_clk = (quot * clk_factor) + ((rem * clk_factor) / 100);
> > > > + }
> > > >
> > > >   return crtc_clk;
> > > >  }
> > > > @@ -234,8 +241,12 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
> > > >           }
> > > >   }
> > > >
> > > > - avg_bw = kms->num_paths ?
> > > > -                 perf.bw_ctl / kms->num_paths : 0;
> > > > + if (kms->num_paths) {
> > > > +         avg_bw = perf.bw_ctl;
> > > > +         do_div(avg_bw, kms->num_paths);
> > > > + } else {
> > > > +         avg_bw = 0;
> > > > + }
> > > >
> > > >   for (i = 0; i < kms->num_paths; i++)
> > > >           icc_set_bw(kms->path[i],
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > index c2a6e3dacd68..ad95f32eac13 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > @@ -9,6 +9,7 @@
> > > >
> > > >  #include <linux/debugfs.h>
> > > >  #include <linux/dma-buf.h>
> > > > +#include <asm/div64.h>
> > > >
> > > >  #include <drm/drm_atomic_uapi.h>
> > > >  #include <drm/drm_damage_helper.h>
> > > > @@ -174,7 +175,11 @@ static void _dpu_plane_calc_bw(struct drm_plane *plane,
> > > >   plane_prefill_bw =
> > > >           src_width * hw_latency_lines * fps * fmt->bpp * scale_factor;
> > > >
> > > > - plane_prefill_bw = mult_frac(plane_prefill_bw, mode->vtotal, (vbp+vpw));
> > > > + {
> > > > +         u64 quot = plane_prefill_bw;
> > > > +         u32 rem = do_div(plane_prefill_bw, vbp + vpw);
> > > > +         plane_prefill_bw = quot * mode->vtotal + rem * mode->vtotal / (vbp + vpw);
> > > > + }
> > > >
> > > >   pstate->plane_fetch_bw = max(plane_bw, plane_prefill_bw);
> > > >  }
> > > > @@ -204,9 +209,11 @@ static void _dpu_plane_calc_clk(struct drm_plane *plane)
> > > >   pstate->plane_clk =
> > > >           dst_width * mode->vtotal * fps;
> > > >
> > > > - if (src_height > dst_height)
> > > > -         pstate->plane_clk = mult_frac(pstate->plane_clk,
> > > > -                                 src_height, dst_height);
> > > > + if (src_height > dst_height) {
> > > > +         u64 quot = pstate->plane_clk;
> > > > +         u32 rem = do_div(quot, dst_height);
> > > > +         pstate->plane_clk = quot * src_height + rem * src_height / dst_height;
> > > > + }
> > > >  }
> > > >
> > > >  /**
> > > > --
> > > > 2.26.2
> > >
> > > I am still applying the above ...
> >
> > Still applying.
> >
> > Any comment even?
>
> I assume that the drm-msm tree is merged via the drm tree, so just
> letting you know that as far as I can tell the above build failure has
> not yet been addressed.
>
> [Another failure in the same commit (that I did not see) has been fixed]

I haven't merged msm-next to my tree yet, it was based on a newer base
so I held off.

I'm going to sit on it for a few more hours, but I might just leave it
off this week's menu.

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
