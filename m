Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F047C145835
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 15:51:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB1DF6F572;
	Wed, 22 Jan 2020 14:51:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 796246F571
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 14:51:36 +0000 (UTC)
Received: by mail-yb1-xb43.google.com with SMTP id k15so3172824ybd.10
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 06:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=fveU8EOWENTOIlJDWHzaJyN7cfNvTvL2hq5jeLxwyeQ=;
 b=KtaCiRoAUXS+O9M1OH4bpeDZ/bPmiQoscZyKsbINYEhE+b/rEc5/h/oURTs//fXBIP
 I/SwHK0m8OAvr/bPjru3GLfSOpIaDe5hvSMAhKcI4l/0OTKKREVj4Ik6NtG7zaWZEj/F
 IgIMnHQDllIJWlFko/+TOqDHIqw6qovvpbX9bXezTmVhOGXxOVttfT7fVQfDtQODOTIA
 QltjKCsY6rUPzDM6XIJ4CQjAgv8jQXsL4fee+Wj7o1LWGQDq0QaGfV8YUubh4wMrLhtP
 ET/4QDdYt8rP6oj72AEBcskkYLFBCOAggKENfP4J7Y+YnE0bKL30AOvHNe78SfxtGEvw
 vSaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=fveU8EOWENTOIlJDWHzaJyN7cfNvTvL2hq5jeLxwyeQ=;
 b=Jtysqj50AQxYQlzmJQDiA7FWVUFQuArG/s1PfLZMNsyn3PWV2W4Bfo85DfaA+0B/IK
 Q7+DhboT1c8FcfV9gNzeiFVzMZTtlcu9pHMyLTuQx0rHg0l3CPZQYMxUuAwrzwjmsRWL
 HGNQmf6axFInBU0boN2lk5iTXjvIAKu0OKpeTj8LBBRFN6CNPtGOyz1vGYXedQo4chR2
 EVwtB9Jv39lAWsv9O3IVH0hwBl+JloJn17hSzq0+LTu3Xag/ZvADtMyKbGxjCEx/3zLR
 y3TGAg6qDZCX9pM626vpRDdpkc5mrzc9FDerguypetYhU9og7K572lAE0mQXNvwyvXlI
 wQDw==
X-Gm-Message-State: APjAAAWTTOLC+5qvKdaNwmz2l3dZhHQO7oTu+GIizLcICZXvgKolQtiU
 rqAgRU8DadNJi/Eo3WEQhNXhvw==
X-Google-Smtp-Source: APXvYqznJPeV4ICEskj7iCVKIHfDLxCvVMF/+ukjFaC7ER7hGUT9t7+CLa6Ex7abmyNKGqBp3xmXMw==
X-Received: by 2002:a25:24f:: with SMTP id 76mr8127777ybc.330.1579704695653;
 Wed, 22 Jan 2020 06:51:35 -0800 (PST)
Received: from localhost ([2620:0:1013:11:1e1:4760:6ce4:fc64])
 by smtp.gmail.com with ESMTPSA id o205sm18516575ywb.58.2020.01.22.06.51.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2020 06:51:35 -0800 (PST)
Date: Wed, 22 Jan 2020 09:51:34 -0500
From: Sean Paul <sean@poorly.run>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [REPOST PATCH] drm/msm: Set dma maximum segment size for mdss
Message-ID: <20200122145134.GG25564@art_vandelay>
References: <20200121111813.REPOST.1.I92c66a35fb13f368095b05287bdabdbe88ca6922@changeid>
 <CAF6AEGtBwcFqe9nfohz8D5mo_V1mfR84bBtEUPmnkO2cjeDrfw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGtBwcFqe9nfohz8D5mo_V1mfR84bBtEUPmnkO2cjeDrfw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 saiprakash.ranjan@codeaurora.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Matthias Kaehlcke <mka@chromium.org>,
 Sean Paul <seanpaul@chromium.org>, Sean Paul <sean@poorly.run>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 21, 2020 at 11:26:05AM -0800, Rob Clark wrote:
> On Tue, Jan 21, 2020 at 11:19 AM Douglas Anderson <dianders@chromium.org> wrote:
> >
> > From: Sean Paul <seanpaul@chromium.org>
> >
> > Turning on CONFIG_DMA_API_DEBUG_SG results in the following error:
> >
> > [   12.078665] msm ae00000.mdss: DMA-API: mapping sg segment longer than device claims to support [len=3526656] [max=65536]
> > [   12.089870] WARNING: CPU: 6 PID: 334 at /mnt/host/source/src/third_party/kernel/v4.19/kernel/dma/debug.c:1301 debug_dma_map_sg+0x1dc/0x318
> > [   12.102655] Modules linked in: joydev
> > [   12.106442] CPU: 6 PID: 334 Comm: frecon Not tainted 4.19.0 #2
> > [   12.112450] Hardware name: Google Cheza (rev3+) (DT)
> > [   12.117566] pstate: 60400009 (nZCv daif +PAN -UAO)
> > [   12.122506] pc : debug_dma_map_sg+0x1dc/0x318
> > [   12.126995] lr : debug_dma_map_sg+0x1dc/0x318
> > [   12.131487] sp : ffffff800cc3ba80
> > [   12.134913] x29: ffffff800cc3ba80 x28: 0000000000000000
> > [   12.140395] x27: 0000000000000004 x26: 0000000000000004
> > [   12.145868] x25: ffffff8008e55b18 x24: 0000000000000000
> > [   12.151337] x23: 00000000ffffffff x22: ffffff800921c000
> > [   12.156809] x21: ffffffc0fa75b080 x20: ffffffc0f7195090
> > [   12.162280] x19: ffffffc0f1c53280 x18: 0000000000000000
> > [   12.167749] x17: 0000000000000000 x16: 0000000000000000
> > [   12.173218] x15: 0000000000000000 x14: 0720072007200720
> > [   12.178689] x13: 0720072007200720 x12: 0720072007200720
> > [   12.184161] x11: 0720072007200720 x10: 0720072007200720
> > [   12.189641] x9 : ffffffc0f1fc6b60 x8 : 0000000000000000
> > [   12.195110] x7 : ffffff8008132ce0 x6 : 0000000000000000
> > [   12.200585] x5 : 0000000000000000 x4 : ffffff8008134734
> > [   12.206058] x3 : ffffff800cc3b830 x2 : ffffffc0f1fc6240
> > [   12.211532] x1 : 25045a74f48a7400 x0 : 25045a74f48a7400
> > [   12.217006] Call trace:
> > [   12.219535]  debug_dma_map_sg+0x1dc/0x318
> > [   12.223671]  get_pages+0x19c/0x20c
> > [   12.227177]  msm_gem_fault+0x64/0xfc
> > [   12.230874]  __do_fault+0x3c/0x140
> > [   12.234383]  __handle_mm_fault+0x70c/0xdb8
> > [   12.238603]  handle_mm_fault+0xac/0xc4
> > [   12.242473]  do_page_fault+0x1bc/0x3d4
> > [   12.246342]  do_translation_fault+0x54/0x88
> > [   12.250652]  do_mem_abort+0x60/0xf0
> > [   12.254250]  el0_da+0x20/0x24
> > [   12.257317] irq event stamp: 67260
> > [   12.260828] hardirqs last  enabled at (67259): [<ffffff8008132d0c>] console_unlock+0x214/0x608
> > [   12.269693] hardirqs last disabled at (67260): [<ffffff8008080e0c>] do_debug_exception+0x5c/0x178
> > [   12.278820] softirqs last  enabled at (67256): [<ffffff8008081664>] __do_softirq+0x4d4/0x520
> > [   12.287510] softirqs last disabled at (67249): [<ffffff80080be574>] irq_exit+0xa8/0x100
> > [   12.295742] ---[ end trace e63cfc40c313ffab ]---
> >
> > The root of the problem is that the default segment size for sgt is
> > (UINT_MAX & PAGE_MASK), and the default segment size for device dma is
> > 64K. As such, if you compare the 2, you would deduce that the sg segment
> > will overflow the device's capacity. In reality, the hardware can
> > accommodate the larger sg segments, it's just not initializing its max
> > segment properly. This patch initializes the max segment size for the
> > mdss device, which gets rid of that pesky warning.
> >
> > Reported-by: Stephen Boyd <swboyd@chromium.org>
> > Signed-off-by: Sean Paul <seanpaul@chromium.org>
> > Tested-by: Stephen Boyd <swboyd@chromium.org>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > This patch has been floating in the ether for over a year [1].  I know
> > next to nothing about it, but I'm told it's still useful so I'm
> > helpfully reposting it.  Please enjoy.
> 
> This looks like the right thing to do.. sorry I overlooked the patch
> first time around
> 
> Reviewed-by: Rob Clark <robdclark@gmail.com>
> 
> (since I've already sent PR for msm-next, could we pick this up via drm-misc?)

You got it, pushed to drm-misc-next-fixes.

Thanks

Sean

> 
> BR,
> -R
> 
> 
> >
> > [1] https://lore.kernel.org/r/20181106213239.52133-1-sean@poorly.run
> >
> >  drivers/gpu/drm/msm/msm_drv.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> > index c26219c7a49f..e4b750b0c2d3 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -441,6 +441,14 @@ static int msm_drm_init(struct device *dev, struct drm_driver *drv)
> >         if (ret)
> >                 goto err_msm_uninit;
> >
> > +       if (!dev->dma_parms) {
> > +               dev->dma_parms = devm_kzalloc(dev, sizeof(*dev->dma_parms),
> > +                                             GFP_KERNEL);
> > +               if (!dev->dma_parms)
> > +                       return -ENOMEM;
> > +       }
> > +       dma_set_max_seg_size(dev, DMA_BIT_MASK(32));
> > +
> >         msm_gem_shrinker_init(ddev);
> >
> >         switch (get_mdp_ver(pdev)) {
> > --
> > 2.25.0.341.g760bfbb309-goog
> >

-- 
Sean Paul, Software Engineer, Google / Chromium OS
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
