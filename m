Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AF8B92A56
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 20:49:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C0910E30D;
	Mon, 22 Sep 2025 18:49:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bEQniNzZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0A1F10E30D
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 18:49:42 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-62fd0d29e2bso4875596a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 11:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758566981; x=1759171781; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=V0Xo4OfJDsJ2tCQThJXl8urjBhN3ZJWclDiVLqpDNZM=;
 b=bEQniNzZoAgOQ4MFZ/d2ipMdQeUOMWhF4kRnPAxmoXVBBtiwZYAjm5rKaKY3XTN3rm
 JOs/TGPLGty29ns1ryvVYAKOgBu98vGqFv6S6fFzh+oyKeZMulASsFeUkXFvVpN/bQTI
 Lj28yS3ELk0h5LLxlW4FnMP/kcZrN8BwP0dRc9N1uo/PYmDzTK1+/mUMjfCZo9xxOd7f
 CYjK23QkSNpAxFi4jKbz3hjusNs2iv7goMBl0FGC5EUjuAM7Sg8cLZg/9+fSuiF3tloO
 mVDArAor70Iy1gIEOQZ9EmxkJ4xWodPJw5pwBvJDar23mILKcxhpTRx5wVJ8QZ4tPlL/
 MmoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758566981; x=1759171781;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V0Xo4OfJDsJ2tCQThJXl8urjBhN3ZJWclDiVLqpDNZM=;
 b=I8AYTcAQK/BSX0JBF5dMnCtIqZa1B1LVnnDAARdE4BC6MfGRZTbJz7tRzlqqqhqFBN
 FxVe9N6Hc/AbIx91A+mRBsvMrjBySSQScsDSBJzDWi5d88xfnuScfb1Z1qMCocI9pT73
 SoJb0p73GC9EsQgDEKkYOteH9JmZgYnqq6d+lVg/RGWmGU59nTbIBeVAEioCunYma43A
 MLLjlo+7zLXp4Zbcf8wyj/RGzvxCgD7eL7eCG7t/OvKb93mD+yzbaUnzMHU270zanMbD
 h+APTNpLA9zeYZhag+hGrWtbLrYbaa7LD1iv61A8ojUuocgmcNbp+S2czLVuNsLuj50m
 waxQ==
X-Gm-Message-State: AOJu0YwJi1bwBD6OHSxIrngvIS4yeQ75sNTGjAwUgfdlWPfL9RxtVYsv
 OQpJ+tm3LNogpUUi3PKoDkOteFTBCktY9ESm6WPN00ACaM1aD3GRue/lT07KLpf06wM=
X-Gm-Gg: ASbGncv2Xb6e3Fuv1s0EhTWzDTTRZeEqjoZhWV3RV7EbDmWfHeSE+48nV6JjxBNVgjL
 q5ffcRxEYAwIp/hqJ8+y8PAGPq6iFflhBtKw6eLq8wOLUQ1bZ4TR2EEfUDLPFO8fArm8WVqPLGN
 AcrFe+x/ki38CNBq09PSvFDBCESuFNOvu9eVRCN81mmZD1Qq+Kqp5kYI+11/kLi6QqAyk4nfAVc
 LkahMcLdLxhaVIm1Ps+fnB1ruPJGL0VoSH1EsUFrIGmcfsERhPvd34yi+Qi/7uSlfOB+4I2mDQT
 6tNd3TKyZB0BN2O8it8vIVG33AmYJyKKiHjp+iYLIkhj9ZE7Y8jrHP4wT0uDHd4XsCMBeWgV/Lu
 eTGkm8Z8UQZq5waHIlNrAdr7cxB7WmDNs
X-Google-Smtp-Source: AGHT+IEOSfm52Z4OtaffuSqqXC5cdTELTowYo46bMLRhUhciT+GTZfk4E0MhVzGKb69LqaJiHUqYiQ==
X-Received: by 2002:a05:6402:a0cb:b0:62f:67bb:d399 with SMTP id
 4fb4d7f45d1cf-62fc0a6c2a6mr11919155a12.29.1758566981201; 
 Mon, 22 Sep 2025 11:49:41 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:30:ea75:1d3c:40d3:4271])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62fb10537d1sm8410113a12.24.2025.09.22.11.49.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 11:49:40 -0700 (PDT)
Date: Mon, 22 Sep 2025 20:49:36 +0200
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
Message-ID: <aNGaQI1Z4ZvLr17u@linaro.org>
References: <20250723190852.18394-1-robin.clark@oss.qualcomm.com>
 <20250723190852.18394-2-robin.clark@oss.qualcomm.com>
 <aNF6N8u1VIFSTaRM@linaro.org>
 <CACSVV033oJodLUS2cwTVeMc9Y3o4np3UgDyX=T8caspRk3--4g@mail.gmail.com>
 <aNF9TGkEfYqfegrR@linaro.org>
 <CACSVV015U3=KpZqxzH7ySO=ok8k-0ff_-Yzc33SK_Smj1c-4-A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV015U3=KpZqxzH7ySO=ok8k-0ff_-Yzc33SK_Smj1c-4-A@mail.gmail.com>
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

On Mon, Sep 22, 2025 at 10:42:52AM -0700, Rob Clark wrote:
> On Mon, Sep 22, 2025 at 9:46 AM Stephan Gerhold
> <stephan.gerhold@linaro.org> wrote:
> >
> > On Mon, Sep 22, 2025 at 09:41:07AM -0700, Rob Clark wrote:
> > > On Mon, Sep 22, 2025 at 9:33 AM Stephan Gerhold
> > > <stephan.gerhold@linaro.org> wrote:
> > > > On Wed, Jul 23, 2025 at 12:08:49PM -0700, Rob Clark wrote:
> > > > > If we hit an error path in GEM obj creation before msm_gem_new_handle()
> > > > > updates obj->resv to point to the gpuvm resv object, then obj->resv
> > > > > still points to &obj->_resv.  In this case we don't want to decrement
> > > > > the refcount of the object being freed (since the refcnt is already
> > > > > zero).  This fixes the following splat:
> > > > >
> > > > >    ------------[ cut here ]------------
> > > > >    refcount_t: underflow; use-after-free.
> > > > >    WARNING: CPU: 9 PID: 7013 at lib/refcount.c:28 refcount_warn_saturate+0xf4/0x148
> > > > >    Modules linked in: uinput snd_seq_dummy snd_hrtimer aes_ce_ccm snd_soc_wsa884x regmap_sdw q6prm_clocks q6apm_lpass_da>
> > > > >     qcom_pil_info i2c_hid drm_kms_helper qcom_common qcom_q6v5 phy_snps_eusb2 qcom_geni_serial drm qcom_sysmon pinctrl_s>
> > > > >    CPU: 9 UID: 1000 PID: 7013 Comm: deqp-vk Not tainted 6.16.0-rc4-debug+ #25 PREEMPT(voluntary)
> > > > >    Hardware name: LENOVO 83ED/LNVNB161216, BIOS NHCN53WW 08/02/2024
> > > > >    pstate: 61400005 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
> > > > >    pc : refcount_warn_saturate+0xf4/0x148
> > > > >    lr : refcount_warn_saturate+0xf4/0x148
> > > > >    sp : ffff8000a2073920
> > > > >    x29: ffff8000a2073920 x28: 0000000000000010 x27: 0000000000000010
> > > > >    x26: 0000000000000042 x25: ffff000810e09800 x24: 0000000000000010
> > > > >    x23: ffff8000a2073b94 x22: ffff000ddb22de00 x21: ffff000ddb22dc00
> > > > >    x20: ffff000ddb22ddf8 x19: ffff0008024934e0 x18: 000000000000000a
> > > > >    x17: 0000000000000000 x16: ffff9f8c67d77340 x15: 0000000000000000
> > > > >    x14: 00000000ffffffff x13: 2e656572662d7265 x12: 7466612d65737520
> > > > >    x11: 3b776f6c66726564 x10: 00000000ffff7fff x9 : ffff9f8c67506c70
> > > > >    x8 : ffff9f8c69fa26f0 x7 : 00000000000bffe8 x6 : c0000000ffff7fff
> > > > >    x5 : ffff000f53e14548 x4 : ffff6082ea2b2000 x3 : ffff0008b86ab080
> > > > >    x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0008b86ab080
> > > > >    Call trace:
> > > > >     refcount_warn_saturate+0xf4/0x148 (P)
> > > > >     msm_gem_free_object+0x248/0x260 [msm]
> > > > >     drm_gem_object_free+0x24/0x40 [drm]
> > > > >     msm_gem_new+0x1c4/0x1e0 [msm]
> > > > >     msm_gem_new_handle+0x3c/0x1a0 [msm]
> > > > >     msm_ioctl_gem_new+0x38/0x70 [msm]
> > > > >     drm_ioctl_kernel+0xc8/0x138 [drm]
> > > > >     drm_ioctl+0x2c8/0x618 [drm]
> > > > >     __arm64_sys_ioctl+0xac/0x108
> > > > >     invoke_syscall.constprop.0+0x64/0xe8
> > > > >     el0_svc_common.constprop.0+0x40/0xe8
> > > > >     do_el0_svc+0x24/0x38
> > > > >     el0_svc+0x54/0x1d8
> > > > >     el0t_64_sync_handler+0x10c/0x138
> > > > >     el0t_64_sync+0x19c/0x1a0
> > > > >    irq event stamp: 3698694
> > > > >    hardirqs last  enabled at (3698693): [<ffff9f8c675021dc>] __up_console_sem+0x74/0x90
> > > > >    hardirqs last disabled at (3698694): [<ffff9f8c68ce8164>] el1_dbg+0x24/0x90
> > > > >    softirqs last  enabled at (3697578): [<ffff9f8c6744ec5c>] handle_softirqs+0x454/0x4b0
> > > > >    softirqs last disabled at (3697567): [<ffff9f8c67360244>] __do_softirq+0x1c/0x28
> > > > >    ---[ end trace 0000000000000000 ]---
> > > > >
> > > > > Fixes: b58e12a66e47 ("drm/msm: Add _NO_SHARE flag")
> > > > > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > > > > ---
> > > > >  drivers/gpu/drm/msm/msm_gem.c | 4 +++-
> > > > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> > > > > index 33d3354c6102..958bac4e2768 100644
> > > > > --- a/drivers/gpu/drm/msm/msm_gem.c
> > > > > +++ b/drivers/gpu/drm/msm/msm_gem.c
> > > > > @@ -1114,10 +1114,12 @@ static void msm_gem_free_object(struct drm_gem_object *obj)
> > > > >               put_pages(obj);
> > > > >       }
> > > > >
> > > > > -     if (msm_obj->flags & MSM_BO_NO_SHARE) {
> > > > > +     if (obj->resv != &obj->_resv) {
> > > > >               struct drm_gem_object *r_obj =
> > > > >                       container_of(obj->resv, struct drm_gem_object, _resv);
> > > > >
> > > > > +             WARN_ON(!(msm_obj->flags & MSM_BO_NO_SHARE));
> > > > > +
> > > > >               /* Drop reference we hold to shared resv obj: */
> > > > >               drm_gem_object_put(r_obj);
> > > > >       }
> > > >
> > > > This patch seems to break something for direct IRIS/video playback using
> > > > dmabuf. I use a simple GStreamer test pipeline for testing IRIS on X1E
> > > > (on GNOME, in case that matters):
> > > >
> > > >  $ gst-launch-1.0 filesrc location=bbb_sunflower_2160p_60fps_normal.mp4 \
> > > >    ! qtdemux name=d d.video_0 ! h264parse ! v4l2h264dec \
> > > >    ! capture-io-mode=dmabuf ! waylandsink
> > > >
> > > > The video plays fine, but if I try to exit (CTRL+C) the display hangs
> > > > for a few seconds and then the console is spammed with pretty much
> > > > exactly the messages that you tried to fix here. If I revert this patch,
> > > > everything is fine again. It feels like your patch does exactly the
> > > > opposite for this use case. :-)
> > > >
> > > > It seems to run into the WARN_ON you added.
> > >
> > > Hmm, are we allocating from drm and importing into v4l2, or the other direction?
> > >
> >
> > Is there an easy way to check?
> 
> Maybe strace?  But, I think this would help, at least if v4l2 is allocating:
> 

I would indeed guess that v4l2 is allocating in this case. I didn't end
up checking with strace, because your proposed change

> - if (obj->resv != &obj->_resv) {
> + if ((msm_obj->flags & MSM_BO_NO_SHARE) && (obj->resv != &obj->_resv)) {
> 

fixes the issue. Thanks! If this makes sense to you, could you submit a
patch?

Thanks,
Stephan
