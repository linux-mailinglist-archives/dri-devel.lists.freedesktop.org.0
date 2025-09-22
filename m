Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 720C7B9249E
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 18:46:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1B1C10E4A1;
	Mon, 22 Sep 2025 16:46:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="oU7hJRsU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3783510E4A5
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 16:46:11 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-45f2b062b86so30812205e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 09:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758559570; x=1759164370; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=DmEFxgmAVEtk875jgss2XO8XYozo00AgTRJPnU2LJXM=;
 b=oU7hJRsU5xwr2ucwKg5gqOheZ5WjXrl5n3XecVRyTgj+Bnqh1CcjkhoUiRcxAyIEbD
 +SnFcagClCRisEQY27HHJTf7n+uTc4mOulrqJLmX8SFJXtg3ay4+CNUartzveeP9pSov
 /+Dt8igQxUHo7zOHavuQEqTp/BRU1tf1v9KlxyPeuzQPXNDt0fVD7C+4ne7LaSewCx1W
 Cq/C2o/aChTJgR8n0DHEtTWd+NKpsQGFYaEVn40pLDEmIV90+3yiD0bgASj3QHQBmyEU
 leDAfK+3sH6KgB/ypAcM5MvS719TekN7JCn5ilID/AB+TGTH6120WxjcC+kl2MBSGPwQ
 ycPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758559570; x=1759164370;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DmEFxgmAVEtk875jgss2XO8XYozo00AgTRJPnU2LJXM=;
 b=Vc2iRbgTFSfxDvUlzb8NbSaESf1VqnamlCXKmm4oizYfywOlAtpwCay3+dWYKLunoo
 w6QUIZ/cmAZXEIx2R6MKj/rLNbMY90uwT3JLr/iuFXH6BdJDDimggLU7bjguDOAKGKPE
 R96bMVHXptvKP5SwXeGH1f9rwuQD6Rv2jL6mM0rHcukVnt/oB6AJPZsSvwZg51dL1xBR
 tfIXZ65jbna4frU6T9Epod3OYIXe1+KkB7f3+KYaHPOfMwgmQIHR2q6wgMC8HJFNjgDs
 p2yyis8oc7T4v31y2pgl+82iw/9zWZxw86rHiNZD/CbcOMJT60CvArVegk6HL/2KjQaq
 jk1g==
X-Gm-Message-State: AOJu0Yys/527075YyNcFVb1bQo10QdjP8oB+DwXrNLW07RsvoS6zgw3P
 jVQn4w/XLlTXb6qFlJ8gsln6enNR/kYtQG5C69l5O9+4EldqrOY+Nd8vMw4LhaOWDxs=
X-Gm-Gg: ASbGncsJYbEPjLvyIXvCeuTWpzBll9higA/CRqQsAyOis6Nw5AAvZ8jce4P6ubLmMwY
 r8DQSOASuBDLsKUBCoa1lrUKLXloqQa05z8Epyyqz9HXAZJcPKkPokJBIueyUaBvsPn9bAxrqTx
 sZPd+/jVAXvzSfsxbtIrOU7Y8OqV2Q5zoZ84WevUt9oUsPh2sbn+tbjLNrXVEOKEPeIPKavEBm3
 Nd366mD7YhxftIdWeOBJd4JhiFKePyzjYtzdZz/xgI250xpwYpKV51miwgYC2GWnF+AG6NidZpR
 0bXUg5i5rYlHiu5iVibq0IKLEAcDSpU4w4jjGOoYXoGRsgNyDIP3JkWMjVbYrPpmbnTh0/YfK20
 7FneAr6t96pyddlokMPm6rSeC/vNgk8im
X-Google-Smtp-Source: AGHT+IE14D5RfFWl+3oDwrEhrCSGb1LSkUa2XB++wA+FYelbyDuYa/J5IyH+Xp5w/aqOs5vNNITGdw==
X-Received: by 2002:a05:600c:314f:b0:45d:d353:a491 with SMTP id
 5b1f17b1804b1-467ee305903mr111154085e9.1.1758559569503; 
 Mon, 22 Sep 2025 09:46:09 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:30:ae58:9ec8:1ac6:e1a6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45f325cec0fsm145956135e9.4.2025.09.22.09.46.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 09:46:08 -0700 (PDT)
Date: Mon, 22 Sep 2025 18:46:04 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] drm/msm: Fix refcnt underflow in error path
Message-ID: <aNF9TGkEfYqfegrR@linaro.org>
References: <20250723190852.18394-1-robin.clark@oss.qualcomm.com>
 <20250723190852.18394-2-robin.clark@oss.qualcomm.com>
 <aNF6N8u1VIFSTaRM@linaro.org>
 <CACSVV033oJodLUS2cwTVeMc9Y3o4np3UgDyX=T8caspRk3--4g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV033oJodLUS2cwTVeMc9Y3o4np3UgDyX=T8caspRk3--4g@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 22, 2025 at 09:41:07AM -0700, Rob Clark wrote:
> On Mon, Sep 22, 2025 at 9:33 AM Stephan Gerhold
> <stephan.gerhold@linaro.org> wrote:
> > On Wed, Jul 23, 2025 at 12:08:49PM -0700, Rob Clark wrote:
> > > If we hit an error path in GEM obj creation before msm_gem_new_handle()
> > > updates obj->resv to point to the gpuvm resv object, then obj->resv
> > > still points to &obj->_resv.  In this case we don't want to decrement
> > > the refcount of the object being freed (since the refcnt is already
> > > zero).  This fixes the following splat:
> > >
> > >    ------------[ cut here ]------------
> > >    refcount_t: underflow; use-after-free.
> > >    WARNING: CPU: 9 PID: 7013 at lib/refcount.c:28 refcount_warn_saturate+0xf4/0x148
> > >    Modules linked in: uinput snd_seq_dummy snd_hrtimer aes_ce_ccm snd_soc_wsa884x regmap_sdw q6prm_clocks q6apm_lpass_da>
> > >     qcom_pil_info i2c_hid drm_kms_helper qcom_common qcom_q6v5 phy_snps_eusb2 qcom_geni_serial drm qcom_sysmon pinctrl_s>
> > >    CPU: 9 UID: 1000 PID: 7013 Comm: deqp-vk Not tainted 6.16.0-rc4-debug+ #25 PREEMPT(voluntary)
> > >    Hardware name: LENOVO 83ED/LNVNB161216, BIOS NHCN53WW 08/02/2024
> > >    pstate: 61400005 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
> > >    pc : refcount_warn_saturate+0xf4/0x148
> > >    lr : refcount_warn_saturate+0xf4/0x148
> > >    sp : ffff8000a2073920
> > >    x29: ffff8000a2073920 x28: 0000000000000010 x27: 0000000000000010
> > >    x26: 0000000000000042 x25: ffff000810e09800 x24: 0000000000000010
> > >    x23: ffff8000a2073b94 x22: ffff000ddb22de00 x21: ffff000ddb22dc00
> > >    x20: ffff000ddb22ddf8 x19: ffff0008024934e0 x18: 000000000000000a
> > >    x17: 0000000000000000 x16: ffff9f8c67d77340 x15: 0000000000000000
> > >    x14: 00000000ffffffff x13: 2e656572662d7265 x12: 7466612d65737520
> > >    x11: 3b776f6c66726564 x10: 00000000ffff7fff x9 : ffff9f8c67506c70
> > >    x8 : ffff9f8c69fa26f0 x7 : 00000000000bffe8 x6 : c0000000ffff7fff
> > >    x5 : ffff000f53e14548 x4 : ffff6082ea2b2000 x3 : ffff0008b86ab080
> > >    x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0008b86ab080
> > >    Call trace:
> > >     refcount_warn_saturate+0xf4/0x148 (P)
> > >     msm_gem_free_object+0x248/0x260 [msm]
> > >     drm_gem_object_free+0x24/0x40 [drm]
> > >     msm_gem_new+0x1c4/0x1e0 [msm]
> > >     msm_gem_new_handle+0x3c/0x1a0 [msm]
> > >     msm_ioctl_gem_new+0x38/0x70 [msm]
> > >     drm_ioctl_kernel+0xc8/0x138 [drm]
> > >     drm_ioctl+0x2c8/0x618 [drm]
> > >     __arm64_sys_ioctl+0xac/0x108
> > >     invoke_syscall.constprop.0+0x64/0xe8
> > >     el0_svc_common.constprop.0+0x40/0xe8
> > >     do_el0_svc+0x24/0x38
> > >     el0_svc+0x54/0x1d8
> > >     el0t_64_sync_handler+0x10c/0x138
> > >     el0t_64_sync+0x19c/0x1a0
> > >    irq event stamp: 3698694
> > >    hardirqs last  enabled at (3698693): [<ffff9f8c675021dc>] __up_console_sem+0x74/0x90
> > >    hardirqs last disabled at (3698694): [<ffff9f8c68ce8164>] el1_dbg+0x24/0x90
> > >    softirqs last  enabled at (3697578): [<ffff9f8c6744ec5c>] handle_softirqs+0x454/0x4b0
> > >    softirqs last disabled at (3697567): [<ffff9f8c67360244>] __do_softirq+0x1c/0x28
> > >    ---[ end trace 0000000000000000 ]---
> > >
> > > Fixes: b58e12a66e47 ("drm/msm: Add _NO_SHARE flag")
> > > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > > ---
> > >  drivers/gpu/drm/msm/msm_gem.c | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> > > index 33d3354c6102..958bac4e2768 100644
> > > --- a/drivers/gpu/drm/msm/msm_gem.c
> > > +++ b/drivers/gpu/drm/msm/msm_gem.c
> > > @@ -1114,10 +1114,12 @@ static void msm_gem_free_object(struct drm_gem_object *obj)
> > >               put_pages(obj);
> > >       }
> > >
> > > -     if (msm_obj->flags & MSM_BO_NO_SHARE) {
> > > +     if (obj->resv != &obj->_resv) {
> > >               struct drm_gem_object *r_obj =
> > >                       container_of(obj->resv, struct drm_gem_object, _resv);
> > >
> > > +             WARN_ON(!(msm_obj->flags & MSM_BO_NO_SHARE));
> > > +
> > >               /* Drop reference we hold to shared resv obj: */
> > >               drm_gem_object_put(r_obj);
> > >       }
> >
> > This patch seems to break something for direct IRIS/video playback using
> > dmabuf. I use a simple GStreamer test pipeline for testing IRIS on X1E
> > (on GNOME, in case that matters):
> >
> >  $ gst-launch-1.0 filesrc location=bbb_sunflower_2160p_60fps_normal.mp4 \
> >    ! qtdemux name=d d.video_0 ! h264parse ! v4l2h264dec \
> >    ! capture-io-mode=dmabuf ! waylandsink
> >
> > The video plays fine, but if I try to exit (CTRL+C) the display hangs
> > for a few seconds and then the console is spammed with pretty much
> > exactly the messages that you tried to fix here. If I revert this patch,
> > everything is fine again. It feels like your patch does exactly the
> > opposite for this use case. :-)
> >
> > It seems to run into the WARN_ON you added.
> 
> Hmm, are we allocating from drm and importing into v4l2, or the other direction?
> 

Is there an easy way to check?

I would need to study the code to be sure, you probably know more about
this than I do. I just run this command and it always worked so far
somehow. :-)

Thanks,
Stephan
