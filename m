Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9774CC856
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 22:47:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59D8A10EAC3;
	Thu,  3 Mar 2022 21:47:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A00E310E9A6;
 Thu,  3 Mar 2022 21:47:28 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 bi14-20020a05600c3d8e00b00386f2897400so354243wmb.5; 
 Thu, 03 Mar 2022 13:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XY3rEMgnaHo7kvIwqwRgN3QxydUq02k88+0c5ZSrCNI=;
 b=qTU8k58q4Oxz+S1GlKmr+UZf0k57Rmc2UWQTTJowUvKPv28CY8skoOIvw55GfUqvGk
 zg4DZtHFs4I+Z5owPyK/q3U0wVF5x+2FpOxaVanwt3k3BRXovLqNgEAJBoaE8k3QNkOJ
 OfO1JeMOhFvCSTVeeaWErSrakxpVBUtuji3W6y8PwZ1ZVIcO+opE5P8NRxDn6AOZRP0B
 Ofz0e2UaFGQMauBj7XJROWpOA/z4PGb6BbWE9Sh6jeaZwxbPzJVwbC+o7B1D5C6lq1rf
 5GazNKcUTsLKGURYh1RAKhvmBPXEr/K/tMrOBqkIcq5e89o/q5rTW7670WCE0yB4wSg8
 Fc8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XY3rEMgnaHo7kvIwqwRgN3QxydUq02k88+0c5ZSrCNI=;
 b=XLjcrA9fUKWB6ML6pRafX7n5h5eWH3/mVmd8QrKKPOjEVSyCu4Q2PfVQyX80ap73HQ
 D1pthdGs4amy5UjpIlIfYtNG5qP9HHUgAYkpVTvsPuM2k+diRU6n5EvUkSQdB2SyJL2N
 IFRIcpXiOQSmtkirDkA9ZC1KMKm4hEssu9K5lNSodJRPz/45uFOJlTyK6luA0tlAsPOP
 tTYgSkn3dKAzoLUz3rmG+MgNh/bPTX+q7WIrsscxfjbKC1bg2KendV8P+8uUCXKeJYyG
 FDrMz+vOcnzaKn5tCYNxNFnLWSudcjj5jF9joRzrh9X4dxV4d9aSKPEgRhBfxPREGttg
 Niqg==
X-Gm-Message-State: AOAM532d7KseXcuqDUV3A97Zl54YmJ/jkqsw7NbJdknA7AhoX7aGQGHa
 gB17pk9u4BH/AzFIaZPiKwG6vJ7Vbcr+rn3O4VI=
X-Google-Smtp-Source: ABdhPJyjiLusxqxe19OkyKf3cnF+lFS2omHJmBV1wzLbSnMFtR61PhGiM2IabT8BUEIcrcD5a//etCtAJehiSxHBpV0=
X-Received: by 2002:a05:600c:25cd:b0:381:4f09:a4b6 with SMTP id
 13-20020a05600c25cd00b003814f09a4b6mr5405089wml.44.1646344047011; Thu, 03 Mar
 2022 13:47:27 -0800 (PST)
MIME-Version: 1.0
References: <20220303194758.710358-1-robdclark@gmail.com>
 <20220303194758.710358-4-robdclark@gmail.com>
 <CAE-0n532ZX=qXTBKSFyRYAmkqFN7oqKyPvJHBuVMmr2eHY+O4A@mail.gmail.com>
 <CAF6AEGstzPaLFf-9z9Gf+S4G8n6twxExLvKaqLZk9ML2tUWiLw@mail.gmail.com>
In-Reply-To: <CAF6AEGstzPaLFf-9z9Gf+S4G8n6twxExLvKaqLZk9ML2tUWiLw@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 3 Mar 2022 13:47:14 -0800
Message-ID: <CAF6AEGuaYEC2rYxi1uU0S_Hkx-DbjT6wO4zz6sKSRON=eX10ng@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm/msm: Add SYSPROF param
To: Stephen Boyd <swboyd@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Yangtao Li <tiny.windzz@gmail.com>,
 Emma Anholt <emma@anholt.net>, Jonathan Marek <jonathan@marek.ca>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 freedreno <freedreno@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 3, 2022 at 1:17 PM Rob Clark <robdclark@gmail.com> wrote:
>
> On Thu, Mar 3, 2022 at 12:47 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Quoting Rob Clark (2022-03-03 11:46:47)
> > > diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> > > index fde9a29f884e..0ba1dbd4e50f 100644
> > > --- a/drivers/gpu/drm/msm/msm_gpu.h
> > > +++ b/drivers/gpu/drm/msm/msm_gpu.h
> > > @@ -330,6 +337,24 @@ struct msm_file_private {
> > >         struct kref ref;
> > >         int seqno;
> > >
> > > +       /**
> > > +        * sysprof:
> > > +        *
> > > +        * The value of MSM_PARAM_SYSPROF set by userspace.  This is
> > > +        * intended to be used by system profiling tools like Mesa's
> > > +        * pps-producer (perfetto), and restricted to CAP_SYS_ADMIN.
> > > +        *
> > > +        * Setting a value of 1 will preserve performance counters across
> > > +        * context switches.  Setting a value of 2 will in addition
> > > +        * suppress suspend.  (Performance counters loose  state across
> >
> > s/loose  /lose/
>
> fixed locally
>
> > > +        * power collapse, which is undesirable for profiling in some
> > > +        * cases.)
> > > +        *
> > > +        * The value automatically reverts to zero when the drm device
> > > +        * file is closed.
> > > +        */
> > > +       int sysprof;
> > > +
> > >         /**
> > >          * elapsed:
> > >          *
> > > diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
> > > index 7cb158bcbcf6..4179db54ac93 100644
> > > --- a/drivers/gpu/drm/msm/msm_submitqueue.c
> > > +++ b/drivers/gpu/drm/msm/msm_submitqueue.c
> > > @@ -7,6 +7,40 @@
> > >
> > >  #include "msm_gpu.h"
> > >
> > > +int msm_file_private_set_sysprof(struct msm_file_private *ctx,
> > > +                                struct msm_gpu *gpu, int sysprof)
> > > +{
> > > +       /* unwind old value first: */
> > > +       switch (ctx->sysprof) {
> > > +       case 2:
> > > +               pm_runtime_put_autosuspend(&gpu->pdev->dev);
> > > +               fallthrough;
> > > +       case 1:
> > > +               refcount_dec(&gpu->sysprof_active);
> > > +               fallthrough;
> > > +       case 0:
> > > +               break;
> > > +       }
> > > +
> > > +       /* then apply new value: */
> >
> > It would be safer to swap this. Otherwise a set when the values are at
> > "1" would drop to "zero" here and potentially trigger some glitch,
> > whereas incrementing one more time and then dropping the previous state
> > would avoid that short blip.
> >
> > > +       switch (sysprof) {
> > > +       default:
> > > +               return -EINVAL;
> >
> > This will become more complicated though.
>
> Right, that is why I took the "unwind first and then re-apply"
> approach.. in practice I expect userspace to set the value before it
> starts sampling counter values, so I wasn't too concerned about this
> racing with a submit and clearing the counters.  (Plus any glitch if
> userspace did decide to change it dynamically would just be transient
> and not really a big deal.)

Actually I could just swap the two switch's.. the result would be that
an EINVAL would not change the state instead of dropping the state to
zero.  Maybe that is better anyways

BR,
-R


> BR,
> -R
>
> > > +       case 2:
> > > +               pm_runtime_get_sync(&gpu->pdev->dev);
> > > +               fallthrough;
> > > +       case 1:
> > > +               refcount_inc(&gpu->sysprof_active);
> > > +               fallthrough;
> > > +       case 0:
> > > +               break;
> > > +       }
> > > +
> > > +       ctx->sysprof = sysprof;
> > > +
> > > +       return 0;
> > > +}
