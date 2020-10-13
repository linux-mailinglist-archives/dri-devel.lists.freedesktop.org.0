Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0248D28D336
	for <lists+dri-devel@lfdr.de>; Tue, 13 Oct 2020 19:40:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 955F16E3EC;
	Tue, 13 Oct 2020 17:40:42 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF34E6E3EC
 for <dri-devel@freedesktop.org>; Tue, 13 Oct 2020 17:40:41 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id b19so245220pld.0
 for <dri-devel@freedesktop.org>; Tue, 13 Oct 2020 10:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BgqdPWs6k36v3EWHSCP5rIGkH3M8a7CT3H5KDtj6quk=;
 b=D1gwXHACQsx2PqfeXXFocSDuvYv2+rCbN8y3GlauYrnpzYBaqeF6LlMSWiWsI7DhEw
 AHI7yLk23HAdzbup0c3EEgCntoVKaVXrspt86RkLh+rNrAJuCLAs7eyjaUsTcE0u7VxG
 Fq09OAfg/M9T/nMBxrTXXKJ3uXfFx3z58onpU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BgqdPWs6k36v3EWHSCP5rIGkH3M8a7CT3H5KDtj6quk=;
 b=ByKm4GZGkEbeun4d/rBLLJDG3TAX6VaRPdaoDjlXu29XTz/1AKlyGZOT7m/7tYT+Ip
 FnlT37z3szpGRI6F4dWDJ9sMWM9s65dM5Wk9ExtfB1G7rQXz/hGWbNNO6+CdcZ1FWpJg
 4rveMLXGsZqY3dn2JxsbhQgcqBT5cswDzno/mcfRz1pXLi2aj8oRZhCCkV9XZCxLyRS9
 DcqqKhDDweBXCIYhsMdxmGCQxDXjeU3GUFTns8QyqFDXsfUXHSa/onJZTnABKpIbKe6l
 V2KCo0bqljSJczJ6rkRT/ffZR2g8JIK8Dr3i+nJ/UhyqbAFBV9BaHPRc+RIDXV8p32qZ
 TLyA==
X-Gm-Message-State: AOAM530DiqY7HdRoL202cR0cfpv96uRlH/Tw2F3YlXg9WuUcVA1aVFOT
 SC6d1FdVvTf4GLwVnME+BLih2g==
X-Google-Smtp-Source: ABdhPJxcQDym/jLS7CXIRriJ6p5w8ir5pH5scUs0e3tlaC0hn8R/ZsAouQVQx9h4pitkUsStjIXxvw==
X-Received: by 2002:a17:90b:1b03:: with SMTP id
 nu3mr863981pjb.64.1602610841134; 
 Tue, 13 Oct 2020 10:40:41 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
 by smtp.gmail.com with ESMTPSA id n3sm265870pgf.11.2020.10.13.10.40.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2020 10:40:40 -0700 (PDT)
Date: Tue, 13 Oct 2020 10:40:38 -0700
From: mka@chromium.org
To: Akhil P Oommen <akhilpo@codeaurora.org>
Subject: Re: [2/2] drm/msm: Add support for GPU cooling
Message-ID: <20201013174038.GA424420@google.com>
References: <1602176947-17385-2-git-send-email-akhilpo@codeaurora.org>
 <20201009183640.GB1292413@google.com>
 <cab2105e-7a8c-988f-dcc1-056692a94e8b@codeaurora.org>
 <20201012174035.GA44627@google.com>
 <80ded484-a058-70fc-be9d-045be2933563@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <80ded484-a058-70fc-be9d-045be2933563@codeaurora.org>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 13, 2020 at 07:23:34PM +0530, Akhil P Oommen wrote:
> On 10/12/2020 11:10 PM, mka@chromium.org wrote:
> > On Mon, Oct 12, 2020 at 07:03:51PM +0530, Akhil P Oommen wrote:
> > > On 10/10/2020 12:06 AM, mka@chromium.org wrote:
> > > > Hi Akhil,
> > > > 
> > > > On Thu, Oct 08, 2020 at 10:39:07PM +0530, Akhil P Oommen wrote:
> > > > > Register GPU as a devfreq cooling device so that it can be passively
> > > > > cooled by the thermal framework.
> > > > > 
> > > > > Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> > > > > ---
> > > > >    drivers/gpu/drm/msm/msm_gpu.c | 13 ++++++++++++-
> > > > >    drivers/gpu/drm/msm/msm_gpu.h |  2 ++
> > > > >    2 files changed, 14 insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> > > > > index 55d1648..93ffd66 100644
> > > > > --- a/drivers/gpu/drm/msm/msm_gpu.c
> > > > > +++ b/drivers/gpu/drm/msm/msm_gpu.c
> > > > > @@ -14,6 +14,7 @@
> > > > >    #include <generated/utsrelease.h>
> > > > >    #include <linux/string_helpers.h>
> > > > >    #include <linux/devfreq.h>
> > > > > +#include <linux/devfreq_cooling.h>
> > > > >    #include <linux/devcoredump.h>
> > > > >    #include <linux/sched/task.h>
> > > > > @@ -107,9 +108,18 @@ static void msm_devfreq_init(struct msm_gpu *gpu)
> > > > >    	if (IS_ERR(gpu->devfreq.devfreq)) {
> > > > >    		DRM_DEV_ERROR(&gpu->pdev->dev, "Couldn't initialize GPU devfreq\n");
> > > > >    		gpu->devfreq.devfreq = NULL;
> > > > > +		return;
> > > > >    	}
> > > > >    	devfreq_suspend_device(gpu->devfreq.devfreq);
> > > > > +
> > > > > +	gpu->cooling = of_devfreq_cooling_register(gpu->pdev->dev.of_node,
> > > > > +			gpu->devfreq.devfreq);
> > > > > +	if (IS_ERR(gpu->cooling)) {
> > > > > +		DRM_DEV_ERROR(&gpu->pdev->dev,
> > > > > +				"Couldn't register GPU cooling device\n");
> > > > > +		gpu->cooling = NULL;
> > > > > +	}
> > > > >    }
> > > > >    static int enable_pwrrail(struct msm_gpu *gpu)
> > > > > @@ -926,7 +936,6 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
> > > > >    	msm_devfreq_init(gpu);
> > > > > -
> Will remove this unintended change.
> > > > >    	gpu->aspace = gpu->funcs->create_address_space(gpu, pdev);
> > > > >    	if (gpu->aspace == NULL)
> > > > > @@ -1005,4 +1014,6 @@ void msm_gpu_cleanup(struct msm_gpu *gpu)
> > > > >    		gpu->aspace->mmu->funcs->detach(gpu->aspace->mmu);
> > > > >    		msm_gem_address_space_put(gpu->aspace);
> > > > >    	}
> > > > > +
> > > > > +	devfreq_cooling_unregister(gpu->cooling);
> > > > 
> > > > Resources should be released in reverse order, otherwise the cooling device
> > > > could use resources that have already been freed.
> > > > Why do you think this is not the correct order? If you are thinking
> > > about devfreq struct, it is managed device resource.
> > 
> > I did not check specifically if changing the frequency really uses any of the
> > resources that are released previously, In any case it's not a good idea to
> > allow other parts of the kernel to use a half initialized/torn down device.
> > Even if it isn't a problem today someone could change the driver to use any
> > of these resources (or add a new one) in a frequency change, without even
> > thinking about the cooling device, just (rightfully) asuming that things are
> > set up and torn down in a sane order.
> 'sane order' relative to what specifically here? Should we worry about freq
> change at this point because we have already disabled gpu runtime pm and
> devfreq?

GPU runtime PM and the devfreq being disabled is not evident from the context
of the function. You are probably right that it's not a problem in practice,
but why give reason for doubts in the first place if this could be avoided
by following a common practice?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
