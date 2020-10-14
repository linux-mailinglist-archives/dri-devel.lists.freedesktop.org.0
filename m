Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3883028D7D3
	for <lists+dri-devel@lfdr.de>; Wed, 14 Oct 2020 03:09:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 305A289F38;
	Wed, 14 Oct 2020 01:09:35 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E0C289F38
 for <dri-devel@freedesktop.org>; Wed, 14 Oct 2020 01:09:34 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id x13so952845pfa.9
 for <dri-devel@freedesktop.org>; Tue, 13 Oct 2020 18:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9cE95zlPZsaKlXQNDZXYurcJdISmy8f/niOuyr/FKyg=;
 b=KXNX/y4LRCP8H6b2wmZx5z4YDWt5lN1teIf4OdNO8UaNZNun4W0t8NUt5DcHYoYO3t
 6+1+2qGFuZyYhq5qRrDGRrT7lpNBJi2Tn5rOsH6Gqck/KZYiv0CX9qSISRHuFU9uK3DP
 kUhvKkwc30JsaxgTXOOqCzA1oGA4n0Bu6vzpk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9cE95zlPZsaKlXQNDZXYurcJdISmy8f/niOuyr/FKyg=;
 b=a0y+FgkqPOr+G2FYuwSgEbwtLkqYz7VTJLpwVcNc2GBLnbE30f4vd+FZREChfnsKhe
 SWgqeu/J1IGpXCvr+fYipMZ1e97KAk8oQWPEDf1WHGidlFAIlLtGyqyS88WyMj0qZBDk
 QXNRQBb4qKQp9mkbWh9HioyDSKMA9ddrri8x6rc5ZVjgVz93jQDO27QjTAOJXZGCsJqR
 L+BdJ5ameG1ES5JNmmE2PyUbTomRiDkgbbZ+gxx6ZP0u0QlD0Y4jx2ZGJHf0FaqQZQHF
 X9GitO0NjXsByrU8+BeVmKnaQTzSJMeIr4RrlAbXDMgPCYVHOAiMkA8mnoX+56f5usb9
 gf6w==
X-Gm-Message-State: AOAM530jepNT48vk03CBqxn8AmZR6IAQA29+E2fv7cXFGeCMIc3q2mpX
 gGyP9XdafLTiNuOjI+t0QgXMaw==
X-Google-Smtp-Source: ABdhPJwsN1RpUizGjqjRP1QS1UdkTWH3aernthupnXlHlvZ9H/ZfUDdui6dOjwurwybPLRUx43YySQ==
X-Received: by 2002:aa7:9884:0:b029:156:5806:b47f with SMTP id
 r4-20020aa798840000b02901565806b47fmr2232761pfl.4.1602637773656; 
 Tue, 13 Oct 2020 18:09:33 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
 by smtp.gmail.com with ESMTPSA id q8sm955717pfg.118.2020.10.13.18.09.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2020 18:09:33 -0700 (PDT)
Date: Tue, 13 Oct 2020 18:09:31 -0700
From: mka@chromium.org
To: Akhil P Oommen <akhilpo@codeaurora.org>
Subject: Re: [2/2] drm/msm: Add support for GPU cooling
Message-ID: <20201014010931.GB424420@google.com>
References: <1602176947-17385-2-git-send-email-akhilpo@codeaurora.org>
 <20201009183640.GB1292413@google.com>
 <cab2105e-7a8c-988f-dcc1-056692a94e8b@codeaurora.org>
 <20201012174035.GA44627@google.com>
 <80ded484-a058-70fc-be9d-045be2933563@codeaurora.org>
 <20201013174038.GA424420@google.com>
 <ae3ca3c7-fb80-e9fc-a76b-2add8969a178@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ae3ca3c7-fb80-e9fc-a76b-2add8969a178@codeaurora.org>
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

On Wed, Oct 14, 2020 at 12:51:55AM +0530, Akhil P Oommen wrote:
> On 10/13/2020 11:10 PM, mka@chromium.org wrote:
> > On Tue, Oct 13, 2020 at 07:23:34PM +0530, Akhil P Oommen wrote:
> > > On 10/12/2020 11:10 PM, mka@chromium.org wrote:
> > > > On Mon, Oct 12, 2020 at 07:03:51PM +0530, Akhil P Oommen wrote:
> > > > > On 10/10/2020 12:06 AM, mka@chromium.org wrote:
> > > > > > Hi Akhil,
> > > > > > 
> > > > > > On Thu, Oct 08, 2020 at 10:39:07PM +0530, Akhil P Oommen wrote:
> > > > > > > Register GPU as a devfreq cooling device so that it can be passively
> > > > > > > cooled by the thermal framework.
> > > > > > > 
> > > > > > > Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> > > > > > > ---
> > > > > > >     drivers/gpu/drm/msm/msm_gpu.c | 13 ++++++++++++-
> > > > > > >     drivers/gpu/drm/msm/msm_gpu.h |  2 ++
> > > > > > >     2 files changed, 14 insertions(+), 1 deletion(-)
> > > > > > > 
> > > > > > > diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> > > > > > > index 55d1648..93ffd66 100644
> > > > > > > --- a/drivers/gpu/drm/msm/msm_gpu.c
> > > > > > > +++ b/drivers/gpu/drm/msm/msm_gpu.c
> > > > > > > @@ -14,6 +14,7 @@
> > > > > > >     #include <generated/utsrelease.h>
> > > > > > >     #include <linux/string_helpers.h>
> > > > > > >     #include <linux/devfreq.h>
> > > > > > > +#include <linux/devfreq_cooling.h>
> > > > > > >     #include <linux/devcoredump.h>
> > > > > > >     #include <linux/sched/task.h>
> > > > > > > @@ -107,9 +108,18 @@ static void msm_devfreq_init(struct msm_gpu *gpu)
> > > > > > >     	if (IS_ERR(gpu->devfreq.devfreq)) {
> > > > > > >     		DRM_DEV_ERROR(&gpu->pdev->dev, "Couldn't initialize GPU devfreq\n");
> > > > > > >     		gpu->devfreq.devfreq = NULL;
> > > > > > > +		return;
> > > > > > >     	}
> > > > > > >     	devfreq_suspend_device(gpu->devfreq.devfreq);
> > > > > > > +
> > > > > > > +	gpu->cooling = of_devfreq_cooling_register(gpu->pdev->dev.of_node,
> > > > > > > +			gpu->devfreq.devfreq);
> > > > > > > +	if (IS_ERR(gpu->cooling)) {
> > > > > > > +		DRM_DEV_ERROR(&gpu->pdev->dev,
> > > > > > > +				"Couldn't register GPU cooling device\n");
> > > > > > > +		gpu->cooling = NULL;
> > > > > > > +	}
> > > > > > >     }
> > > > > > >     static int enable_pwrrail(struct msm_gpu *gpu)
> > > > > > > @@ -926,7 +936,6 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
> > > > > > >     	msm_devfreq_init(gpu);
> > > > > > > -
> > > Will remove this unintended change.
> > > > > > >     	gpu->aspace = gpu->funcs->create_address_space(gpu, pdev);
> > > > > > >     	if (gpu->aspace == NULL)
> > > > > > > @@ -1005,4 +1014,6 @@ void msm_gpu_cleanup(struct msm_gpu *gpu)
> > > > > > >     		gpu->aspace->mmu->funcs->detach(gpu->aspace->mmu);
> > > > > > >     		msm_gem_address_space_put(gpu->aspace);
> > > > > > >     	}
> > > > > > > +
> > > > > > > +	devfreq_cooling_unregister(gpu->cooling);
> > > > > > 
> > > > > > Resources should be released in reverse order, otherwise the cooling device
> > > > > > could use resources that have already been freed.
> > > > > > Why do you think this is not the correct order? If you are thinking
> > > > > about devfreq struct, it is managed device resource.
> > > > 
> > > > I did not check specifically if changing the frequency really uses any of the
> > > > resources that are released previously, In any case it's not a good idea to
> > > > allow other parts of the kernel to use a half initialized/torn down device.
> > > > Even if it isn't a problem today someone could change the driver to use any
> > > > of these resources (or add a new one) in a frequency change, without even
> > > > thinking about the cooling device, just (rightfully) asuming that things are
> > > > set up and torn down in a sane order.
> > > 'sane order' relative to what specifically here? Should we worry about freq
> > > change at this point because we have already disabled gpu runtime pm and
> > > devfreq?
> > 
> > GPU runtime PM and the devfreq being disabled is not evident from the context
> > of the function. You are probably right that it's not a problem in practice,
> > but why give reason for doubts in the first place if this could be avoided
> > by following a common practice?
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > 
> Other option I see is to create a managed device resource (devm) version of
> the devfreq_cooling_register API and use that. Is that what you are trying
> to suggest?

No, I was not thinking about a devm version, just manual reverse removal.

Actually you can even argue the you are using the right order, I saw the
ring buffer and the address space are actually initialized after
msm_devfreq_init(). That strikes me a bit odd, I guess the
devfreq_suspend_device() in msm_devfreq_init() is supposed to prevent the
devfreq from being active, however that is potentially racy, it could become
active right after being created. I would have expected the devfreq to be
created when everything else is ready, but I don't know this driver well,
nor am I a devfreq expert, maybe there is a good reason for it ...

In summary, the order you are using is consistent with the what the driver
currently does, which might not be entirely correct, but that is beyond the
scope of this patch.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
