Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A13C84CC7C8
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 22:17:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61CD610ECCE;
	Thu,  3 Mar 2022 21:16:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 261BE10ED19;
 Thu,  3 Mar 2022 21:16:54 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 7-20020a05600c228700b00385fd860f49so3157759wmf.0; 
 Thu, 03 Mar 2022 13:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l3qmkkje0cVWH6MFI3VHClM1bFsyW82VNALPE7/dweA=;
 b=md9Z0gIn1/qwklw+eS9LcPeNITwhy7ew4+7YsoGOzhs4ZtKY5DVkGyrpquvvfr6Pix
 d0MswLPm3oPbafQen6cTJ1B3gtHfw6U+AJyxRfAAxTcctb55UgUfOUIJdVV556A4K6sB
 OAFCbaPBirlmDJru7xdsZD9hRhwftxrRw1/Fy+fGRRNOJzbJHIF4YoLMSbSw/lV4I9VI
 HdP/7vCMcPWlNHXAZtg55MIlgkXpVR7eJ6hMN0Ilndj0Ln6nWC0nyHTm1Ph1x7al6FV3
 fmpvbQb8HlcqgvwGtO6iHWC+qYHNjkOgDrr5Hi/IZWqk20tF9uzL9bht5ac6+nY+/0E9
 aN4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l3qmkkje0cVWH6MFI3VHClM1bFsyW82VNALPE7/dweA=;
 b=6O3l3pJiseOCxecbwQCecG+EN6xgC7Xv1Mfi5kpBPY7NHTLB4TTOHoM2BY2xo57nLP
 9+yDhoyfZ9iMcs7Wv6r73zPQ+1mrVU92C2v2wOI81860hjUHnqCYqwBeqkwWmxyJCYH3
 96K3Mr0DVgijiQ4emuesCAsMYXm2HLR60Z30y3rcTCckfclHPEsflu5S33dRetZzCj3j
 8gO0neIkrffgVrIyAu1WNjXcdABHBCzch+i0NHcBG+9dO3Y1wzZYff+sTItC+MR2odn+
 RT8w9wfD9RzaheaxFhCPdZN+6ekHXFe/96PuRtbpMaxTREhQJ6YS4bZO6kF20Hw+irVL
 TTtw==
X-Gm-Message-State: AOAM532KSFUKVZOHkYz2x0fqFSCIFkwD9kKpZcK2A1E9ucJkngouNo+u
 rAnzCHVLXM+C4SXycB97n8bE5KCTmJU7FwzKY2c=
X-Google-Smtp-Source: ABdhPJz3S/4vOjZfTiBAT5OCzG9I0JxE5mXa2XLfGzGKorHTlTtryDDoXU2qdnGYzj1iEBUMbDro79YHtjv+uAjMTiw=
X-Received: by 2002:a05:600c:35cc:b0:382:441f:897e with SMTP id
 r12-20020a05600c35cc00b00382441f897emr5345910wmq.127.1646342212637; Thu, 03
 Mar 2022 13:16:52 -0800 (PST)
MIME-Version: 1.0
References: <20220303194758.710358-1-robdclark@gmail.com>
 <20220303194758.710358-4-robdclark@gmail.com>
 <CAE-0n532ZX=qXTBKSFyRYAmkqFN7oqKyPvJHBuVMmr2eHY+O4A@mail.gmail.com>
In-Reply-To: <CAE-0n532ZX=qXTBKSFyRYAmkqFN7oqKyPvJHBuVMmr2eHY+O4A@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 3 Mar 2022 13:17:20 -0800
Message-ID: <CAF6AEGstzPaLFf-9z9Gf+S4G8n6twxExLvKaqLZk9ML2tUWiLw@mail.gmail.com>
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

On Thu, Mar 3, 2022 at 12:47 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Rob Clark (2022-03-03 11:46:47)
> > diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> > index fde9a29f884e..0ba1dbd4e50f 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu.h
> > +++ b/drivers/gpu/drm/msm/msm_gpu.h
> > @@ -330,6 +337,24 @@ struct msm_file_private {
> >         struct kref ref;
> >         int seqno;
> >
> > +       /**
> > +        * sysprof:
> > +        *
> > +        * The value of MSM_PARAM_SYSPROF set by userspace.  This is
> > +        * intended to be used by system profiling tools like Mesa's
> > +        * pps-producer (perfetto), and restricted to CAP_SYS_ADMIN.
> > +        *
> > +        * Setting a value of 1 will preserve performance counters across
> > +        * context switches.  Setting a value of 2 will in addition
> > +        * suppress suspend.  (Performance counters loose  state across
>
> s/loose  /lose/

fixed locally

> > +        * power collapse, which is undesirable for profiling in some
> > +        * cases.)
> > +        *
> > +        * The value automatically reverts to zero when the drm device
> > +        * file is closed.
> > +        */
> > +       int sysprof;
> > +
> >         /**
> >          * elapsed:
> >          *
> > diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
> > index 7cb158bcbcf6..4179db54ac93 100644
> > --- a/drivers/gpu/drm/msm/msm_submitqueue.c
> > +++ b/drivers/gpu/drm/msm/msm_submitqueue.c
> > @@ -7,6 +7,40 @@
> >
> >  #include "msm_gpu.h"
> >
> > +int msm_file_private_set_sysprof(struct msm_file_private *ctx,
> > +                                struct msm_gpu *gpu, int sysprof)
> > +{
> > +       /* unwind old value first: */
> > +       switch (ctx->sysprof) {
> > +       case 2:
> > +               pm_runtime_put_autosuspend(&gpu->pdev->dev);
> > +               fallthrough;
> > +       case 1:
> > +               refcount_dec(&gpu->sysprof_active);
> > +               fallthrough;
> > +       case 0:
> > +               break;
> > +       }
> > +
> > +       /* then apply new value: */
>
> It would be safer to swap this. Otherwise a set when the values are at
> "1" would drop to "zero" here and potentially trigger some glitch,
> whereas incrementing one more time and then dropping the previous state
> would avoid that short blip.
>
> > +       switch (sysprof) {
> > +       default:
> > +               return -EINVAL;
>
> This will become more complicated though.

Right, that is why I took the "unwind first and then re-apply"
approach.. in practice I expect userspace to set the value before it
starts sampling counter values, so I wasn't too concerned about this
racing with a submit and clearing the counters.  (Plus any glitch if
userspace did decide to change it dynamically would just be transient
and not really a big deal.)

BR,
-R

> > +       case 2:
> > +               pm_runtime_get_sync(&gpu->pdev->dev);
> > +               fallthrough;
> > +       case 1:
> > +               refcount_inc(&gpu->sysprof_active);
> > +               fallthrough;
> > +       case 0:
> > +               break;
> > +       }
> > +
> > +       ctx->sysprof = sysprof;
> > +
> > +       return 0;
> > +}
