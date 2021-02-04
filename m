Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C43E830FCEB
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 20:35:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A66D96EE4D;
	Thu,  4 Feb 2021 19:34:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6439B6EE3F
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 19:34:47 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id r12so7448400ejb.9
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Feb 2021 11:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1vwFktLK1BcFrmZlbW8cu2dcqx2X1gDFYf658N1oFi0=;
 b=NdG9PI+qWOJWQ/wADl1Qgt5nAhqWclk718j3XUb3RvxL/R5XuzWT+2VFLZjy6PGtrH
 cozSa8Dosy66hdst8NGRJ8Stp6JZBID2SXcsaGY7nXwuoAueWARwplqQ8KOxSFYseRV0
 ciNMGnO/ap2W6/C5TH5DkOK+cpY0pbBzf9CHszjXZEMSvR2kJ+jjqws4GNxC60q8JcFY
 CbJyCcqSfyDe8Evk62Cns7aNLN2JJOmQKh47ntIhYUJRcPpkN+D95M+rCNDZInj+NNBN
 HR36lU8Pb9EYHO3jpwiTbTP8MwwLcKKC71gk8rN3lfcboaSMFfoN/IWJ0Pasxlb3/woP
 HVqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1vwFktLK1BcFrmZlbW8cu2dcqx2X1gDFYf658N1oFi0=;
 b=uoZRICDLPFNUVOY3dVofuBjVZi92J7KuWXwwG9Mop3zhtaF9q7rOZyVs8Y1CzSQ13X
 BDRZ0rhDCOTtmvWQuhoFk4V/3KAUykZKh5fmmZf8e8ZP8kx5QWYrnJOiUk5/ascd5Mh1
 fb4HNsIj/+R6O241nBCkOLciibGA5luQxQIzKoj9Wu91rXYzRgjDNt+qsW607OxHKKd2
 /Wiw3pQQHpWivUN1IxPBYYbApHe4QNZ9NsUuDUJGFmbZPm4V7DvFkHzrwaIyj4DfNbij
 Sl/w/TYM6cOL5XNbZMvsOuxo1R4FtRGhYPRwMfXnfeahUG9r2N9RlGPUrOPSGmIKlaiS
 K4Fw==
X-Gm-Message-State: AOAM5327awfJ1t2knIkNCMScaHO58FhMl2iEkrQ726XJy62UCyfn1Rq1
 o7x9QHluH4mSvc7RKTLfZAhU9gFwjSIXRmL5JElax3zDLbb0bQ==
X-Google-Smtp-Source: ABdhPJzemmdWbJUvkKPyjtvCbMK0ECRlEtKB/YnTX3TBtu/ayew+0srGLRoan/BcvpqxClxzClgH5X0zmm5I9xKlsgE=
X-Received: by 2002:a17:906:a20e:: with SMTP id
 r14mr641577ejy.404.1612467285701; 
 Thu, 04 Feb 2021 11:34:45 -0800 (PST)
MIME-Version: 1.0
References: <20200903164821.2879-1-i.can.speak.c.and.basic@gmail.com>
 <20200903164821.2879-4-i.can.speak.c.and.basic@gmail.com>
 <0f552124-ebcf-2f7c-6aa2-9ad84f838717@igalia.com>
In-Reply-To: <0f552124-ebcf-2f7c-6aa2-9ad84f838717@igalia.com>
From: Eric Anholt <eric@anholt.net>
Date: Thu, 4 Feb 2021 11:34:34 -0800
Message-ID: <CADaigPWcU5rB8HJWNtrb7p=icr5jFrqZnAQd-K6tWKvm0Yjr9Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/v3d: Add job timeout module param
To: Chema Casanova <jmcasanova@igalia.com>
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
Cc: David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Yukimasa Sugizaki <ysugi@idein.jp>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 4, 2021 at 10:09 AM Chema Casanova <jmcasanova@igalia.com> wrote:
>
> On 3/9/20 18:48, Yukimasa Sugizaki wrote:
> > From: Yukimasa Sugizaki <ysugi@idein.jp>
> >
> > The default timeout is 500 ms which is too short for some workloads
> > including Piglit.  Adding this parameter will help users to run heavier
> > tasks.
> >
> > Signed-off-by: Yukimasa Sugizaki <ysugi@idein.jp>
> > ---
> >   drivers/gpu/drm/v3d/v3d_sched.c | 24 +++++++++++++-----------
> >   1 file changed, 13 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
> > index feef0c749e68..983efb018560 100644
> > --- a/drivers/gpu/drm/v3d/v3d_sched.c
> > +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> > @@ -19,11 +19,17 @@
> >    */
> >
> >   #include <linux/kthread.h>
> > +#include <linux/moduleparam.h>
> >
> >   #include "v3d_drv.h"
> >   #include "v3d_regs.h"
> >   #include "v3d_trace.h"
> >
> > +static uint timeout = 500;
> > +module_param(timeout, uint, 0444);
> > +MODULE_PARM_DESC(timeout,
> > +     "Timeout for a job in ms (0 means infinity and default is 500 ms)");
> > +
>
> I think that  parameter definition could be included at v3d_drv.c as
> other drivers do. Then we would have all future parameters together. In
> that case we would need also to include the extern definition at
> v3d_drv.h for the driver variable.
>
> The param name could be more descriptive like "sched_timeout_ms" in the
> lima driver.
>
> I wonder if it would make sense to have different timeouts parameters
> for different type of jobs we have. At least this series come from the
> need additional time to complete compute jobs. This is what amdgpu does,
> but we probably don't need something such complex.
>
> I think it would also make sense to increase our default value for the
> compute jobs.
>
> What do you think?
>
> In any case I think that having this general scheduling timeout
> parameter as other drivers do is a good idea.

Having a param for being able to test if the job completes eventually
is a good idea, but if tests are triggering timeouts, then you
probably need to investigate what's going on in the driver -- it's not
like you want .5second unpreemptible jobs to be easy to produce.

Also, for CS, I wonder if we have another reg besides CSD_CURRENT_CFG4
we could be looking at for "we're making progress on the job".  Half a
second with no discernible progress sounds like a bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
