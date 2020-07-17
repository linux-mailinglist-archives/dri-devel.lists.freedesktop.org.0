Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42675223796
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 11:04:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F17536ED62;
	Fri, 17 Jul 2020 09:04:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0321E6ED63
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 09:04:11 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id o11so10186520wrv.9
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 02:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+qY1vzz0jfL/xHFr7/Mlaa3qFN7LIc2BfAF0WedfrRs=;
 b=c2v4/TlrVJtXZ1GhfMU+z6gOHbF3u9W2LLJY/QFjGy60Dh/BMFc5SmID+sPRe4/umh
 A6QVPZL8bByXumcHJPp9WCPYbN085UrAAi6yruYkIl9iMoEzyIgVnxyZhH7p65paQ9Ni
 8osVXD7noP4JEiJx6ji7LfEtCtCEjfbRTHef0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+qY1vzz0jfL/xHFr7/Mlaa3qFN7LIc2BfAF0WedfrRs=;
 b=pDeo1WCXYmjy8Of5qk8UhkUTtpyRk9yTXrNAvPolz4rW9E+/4Ja6j4/PXIgjdyvfBc
 Ic5r/79hVJ/YDZw5bz+JmzewniJqsCRG0GQiZaM36opQGmP1adDIFGJLA7C+DzqQK2sJ
 XeIwlhQODubkZgrYzcx6eUCDs6rKhmnidNhmR5omVQ15nmXSBeMUEDKmHD0iGsgGr1yP
 tvEnwjIRCyI6+ciYwgnjXzupUXqaxb7ti9T0PpM+6is5NwjJe9jGhgEvzwHuHYmu4/Fo
 qosDnH6KTI0ci9IVeGTMDyc+FVuQTjU8T544t1EUjFVXFEW4hmiMNnlu3Dnz5mDP5wcC
 RiNg==
X-Gm-Message-State: AOAM531k8lAoTgkRnSEBaEzu2LhWkWE+F4r2i3+wsPbgYO/Yq7Tsu7fc
 R+T0VNbtukhNR+gdnQ0AVISN8w==
X-Google-Smtp-Source: ABdhPJxkJdUdrU0XzwTdHddwboUXZb3j6X0rgvuvdW0lflA1XyeDWsU0disXHZDUktkUD9m/ftb2AA==
X-Received: by 2002:a5d:69c8:: with SMTP id s8mr9061368wrw.405.1594976650541; 
 Fri, 17 Jul 2020 02:04:10 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l14sm836047wrg.43.2020.07.17.02.04.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 02:04:09 -0700 (PDT)
Date: Fri, 17 Jul 2020 11:04:07 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Subject: Re: [PATCH 53/59] drm/arc: Move to drm/tiny
Message-ID: <20200717090407.GP3278063@phenom.ffwll.local>
References: <20200428140842.GL3456981@phenom.ffwll.local>
 <CH2PR12MB3894B40C6D71435D3E759A34A1A20@CH2PR12MB3894.namprd12.prod.outlook.com>
 <CAKMK7uFRt14m24ajYygdRZz=fUMhA9u6=590R2jjhXGq=VtwNA@mail.gmail.com>
 <20200604080507.GT20149@phenom.ffwll.local>
 <CY4PR1201MB01363EB95985A2C64ADA6841DE890@CY4PR1201MB0136.namprd12.prod.outlook.com>
 <CAKMK7uFLvV3=uhfnf=MreKBM==-gzXqx3NrV8KDA2D5sTAn2SQ@mail.gmail.com>
 <CY4PR1201MB013642EB94E07AED91813A5FDE890@CY4PR1201MB0136.namprd12.prod.outlook.com>
 <CAKMK7uESUnLR1N07T513RjGUAp8FA6oHaO1Y+uvTKpFuM_8+gQ@mail.gmail.com>
 <CY4PR1201MB013654230A216EE7EB3C0E9BDE820@CY4PR1201MB0136.namprd12.prod.outlook.com>
 <CAKMK7uFHCTkqoMGBW3QMjhJZaaakC_zYxxVW_C-LYRj0Yjt2gg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uFHCTkqoMGBW3QMjhJZaaakC_zYxxVW_C-LYRj0Yjt2gg@mail.gmail.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 "snps-arc@lists.infradead.org" <snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 09, 2020 at 03:02:14PM +0200, Daniel Vetter wrote:
> Hi Eugeniy,
> 
> Very much appreciated, and kinda expected. That 2nd backtrace really
> confuses me, so "something strange is going on" and the bisect looks
> funny is within expectations. Hopefully we can track down what's going
> on.

I'm going to resend the entire pile with the bugfix below and all rebased,
I think retesting it all is probably a good idea now, since quite some
time passed.

Cheers, Daniel

> 
> Thanks, Daniel
> 
> On Tue, Jun 9, 2020 at 2:08 PM Eugeniy Paltsev
> <Eugeniy.Paltsev@synopsys.com> wrote:
> >
> > Hi Daniel,
> >
> > I've got pretty strange results so I need some time to investigate it and probably retest.
> > I'll send you update in a few days.
> >
> > ---
> >  Eugeniy Paltsev
> >
> >
> > ________________________________________
> > From: Daniel Vetter <daniel@ffwll.ch>
> > Sent: Friday, June 5, 2020 22:55
> > To: Eugeniy Paltsev
> > Cc: Intel Graphics Development; DRI Development; Daniel Vetter; Sam Ravnborg; Alexey Brodkin; snps-arc@lists.infradead.org
> > Subject: Re: [PATCH 53/59] drm/arc: Move to drm/tiny
> >
> > Hi Eugeniy,
> >
> > Thanks for testing. I looked at the second one (I hoped it would just
> > magically disappear) and I still don't understand what's going on
> > there. My patch series isn't touching that area at all, so really
> > confused.
> >
> > I squashed in the bugfix from the previous round into the right
> > patches, and pushed a branch with just the arcpgu changes here:
> > https://urldefense.com/v3/__https://cgit.freedesktop.org/*danvet/drm/log/?h=for-eugeniy__;fg!!A4F2R9G_pg!IJ1o4XiXVdStPu--Q-SCTUpRbsbqrjX255R34nuD7L7ptPywOy4SKr21dwSpfOkXIVqH5pM$
> >
> > Maybe it's something in my pile of not-so-tested stuff :-)
> >
> > Can you pls test this? And if it still fails, try to bisect where it breaks?
> >
> > Thanks, Daniel
> >
> > On Thu, Jun 4, 2020 at 9:00 PM Eugeniy Paltsev
> > <Eugeniy.Paltsev@synopsys.com> wrote:
> > >
> > > I've tested your change and one issue gone.
> > >
> > > However I still see kernel crash (due to invalid read in kernel mode by 0x0 address) on weston stop:
> > > ----------------------------------->8-------------------------------------------
> > > Oops
> > > Path: (null)
> > > CPU: 0 PID: 12 Comm: kworker/0:1 Not tainted 5.7.0-rc6-01594-g4ceda91a4176-dirty #6
> > > Workqueue: events drm_mode_rmfb_work_fn
> > > Invalid Read @ 0x00000000 by insn @ drm_gem_fb_destroy+0x32/0x130
> > > ECR: 0x00050100 EFA: 0x00000000 ERET: 0x813b9a76
> > > STAT32: 0x80080602 [IE K     ]  BTA: 0x813b9a72
> > > BLK: drm_gem_fb_destroy+0xc0/0x130
> > >  SP: 0x9f055ea4  FP: 0x00000000
> > > LPS: 0x813560ec LPE: 0x813560f0 LPC: 0x00000000
> > > r00: 0x00000000 r01: 0x9f6a6100 r02: 0x00000001
> > > r03: 0x9fd5dde8 r04: 0x810f5de8 r05: 0x00000000
> > > r06: 0x00000000 r07: 0x00000000 r08: 0x000000e1
> > > r09: 0x00000000 r10: 0x00000000 r11: 0x000000e1
> > > r12: 0x813b9b04
> > >
> > > Stack Trace:
> > >   drm_gem_fb_destroy+0x32/0x130
> > >   drm_framebuffer_remove+0x1d2/0x358
> > >   drm_mode_rmfb_work_fn+0x28/0x38
> > >   process_one_work+0x19a/0x358
> > >   worker_thread+0x2c4/0x494
> > >   kthread+0xec/0x100
> > >   ret_from_fork+0x18/0x1c
> > > ----------------------------------->8-------------------------------------------
> > >
> > >
> > > The stack traces may vary but always end in drm_gem_fb_destroy:
> > > ----------------------------------->8-------------------------------------------
> > > Stack Trace:
> > >   drm_gem_fb_destroy+0x32/0x130
> > >   drm_mode_rmfb+0x10e/0x148
> > >   drm_ioctl_kernel+0x70/0xa0
> > >   drm_ioctl+0x284/0x410
> > >   ksys_ioctl+0xea/0xa3c
> > >   EV_Trap+0xcc/0xd0
> > > ----------------------------------->8-------------------------------------------
> > > Stack Trace:
> > >   drm_gem_fb_destroy+0x32/0x130
> > >   drm_fb_release+0x66/0xb0
> > >   drm_file_free.part.11+0x112/0x1bc
> > >   drm_release+0x80/0x120
> > >   __fput+0x98/0x1bc
> > >   task_work_run+0x6e/0xa8
> > >   do_exit+0x2b4/0x7fc
> > >   do_group_exit+0x2a/0x8c
> > >   get_signal+0x9a/0x5f0
> > >   do_signal+0x86/0x23c
> > >   resume_user_mode_begin+0x88/0xd0
> > > ----------------------------------->8-------------------------------------------
> > >
> > >
> > > ---
> > >  Eugeniy Paltsev
> > >
> > >
> > > ________________________________________
> > > From: Daniel Vetter <daniel@ffwll.ch>
> > > Sent: Thursday, June 4, 2020 14:19
> > > To: Eugeniy Paltsev
> > > Cc: Intel Graphics Development; DRI Development; Daniel Vetter; Sam Ravnborg; Alexey Brodkin
> > > Subject: Re: [PATCH 53/59] drm/arc: Move to drm/tiny
> > >
> > > Hi Eugeniy,
> > >
> > > Apologies, somehow I missed your mail. I looked at the code again, and I
> > > think I fumbled something. Does the below diff help to prevent the issues?
> > >
> > > Thanks, Daniel
> > >
> > >
> > > diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
> > > index 857812f25bec..33d812a5ad7f 100644
> > > --- a/drivers/gpu/drm/tiny/arcpgu.c
> > > +++ b/drivers/gpu/drm/tiny/arcpgu.c
> > > @@ -228,6 +228,9 @@ static void arc_pgu_update(struct drm_simple_display_pipe *pipe,
> > >         struct arcpgu_drm_private *arcpgu;
> > >         struct drm_gem_cma_object *gem;
> > >
> > > +       if (!pipe->plane.state->fb)
> > > +               return;
> > > +
> > >         arcpgu = pipe_to_arcpgu_priv(pipe);
> > >         gem = drm_fb_cma_get_gem_obj(pipe->plane.state->fb, 0);
> > >         arc_pgu_write(arcpgu, ARCPGU_REG_BUF0_ADDR, gem->paddr);
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > +41 (0) 79 365 57 48 - https://urldefense.com/v3/__http://blog.ffwll.ch__;!!A4F2R9G_pg!P0EvyJfMuDwqbeZmHZM5S9po30QWr4KgGrggRirNfgo7wrRXfnUO-8iq0AA4fQCW2WGPlDc$
> >
> >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > +41 (0) 79 365 57 48 - https://urldefense.com/v3/__http://blog.ffwll.ch__;!!A4F2R9G_pg!IJ1o4XiXVdStPu--Q-SCTUpRbsbqrjX255R34nuD7L7ptPywOy4SKr21dwSpfOkXpn86Q20$
> 
> 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
