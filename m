Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 503A79A1411
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 22:33:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C91810E76D;
	Wed, 16 Oct 2024 20:33:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VSHPwuT+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
 [209.85.166.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B519610E76D;
 Wed, 16 Oct 2024 20:33:32 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id
 e9e14a558f8ab-3a3aeb19ea2so1427355ab.0; 
 Wed, 16 Oct 2024 13:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729110812; x=1729715612; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wP6r2on2k3XrO8K/OQAeP7D2aIemt713ceP9vvL21IA=;
 b=VSHPwuT+RfvkvYDrucKnrUb471p4uB0xALZ1jan5u8bAYO8tNO4rU2dfm/caimzGWU
 Pt4ZLwYBpf3VJ4K7m0ZfE+dhsY2o9npbPyNWhOw3b2zoILPi291btxAE4hfOn+qcpmAG
 rlpQvEGL5VllPP0jIvYd9/He+Wm744c1gHgOnAqa5WXVZ7fMCpxv6Cn+UhjN72fazNUX
 jbQhB50gcra8QPbUC/kAG6bwA3CBr6tefWxXqidlRRsboNR5/Nhhm+EBb4QuGHp2I/lf
 i6SxiuuYyXs1Q8aFGXRZ8o4JRXSPrmrpEgn4pC62/OwuzYBQkShJviSZzIq1yF0PX83R
 st2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729110812; x=1729715612;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wP6r2on2k3XrO8K/OQAeP7D2aIemt713ceP9vvL21IA=;
 b=VKsRwDYKbhigAsutGaErvMQkyCpo3YsQSA+Fnfg9TgMbJ3j84sfwtXYBoBOXWdD1SR
 ceEpjNI6+AzydvF42JlnXTjK3nUcJam0PAxapWU+jAc8Kd1CTcqw8ku4BqhMSnCGs+9S
 7cJ+1uGyhf2w0Hpjr6W+SKK5rP89WD+2iHty9mLSIHR620SHDsycn4QK4crW6L33gXDO
 eVY6KDsphS81ux5ihXSPCDw1wPVkr+Evq3sfjq+RG1tB0E8m7nKUBMPbsNjiOM137Ll7
 xXW9neianOkhMylVPfkAgrsdoAlYCwXYrJZEpdrhbS7JGqyXGQJB9liR6shdfyll79SS
 RX+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBQQreWwA5FZ7ZtuBvSyt/GoAeDqK/y4tYRPVRWwTAlBspkERthB4QGH+X4QS6TpQDYXmmdFdfbf8=@lists.freedesktop.org,
 AJvYcCVSlY5l0qep8u7Rn6fS8FuELycqBkQ0pnfBKrwxJVIafikAgmYb1Eje8XNcayM7UVqecdCe8T59Lguw@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyxN4TgoKCjZR+IZIEgp5gLyuoJAgF0HaCM2Xb0O4xNw3wR06Is
 u1xPwqBmJyMkjWg1FTDCXkhJCEbct9Lupq2qcJ5uQcqr/whXYfZai6rYtAtJCDGe2ZYvo2I57bO
 O1AXutcExtzCV/3+kao2cKvPBkxs=
X-Google-Smtp-Source: AGHT+IH3xCk9u44gOw9v8dKsI1AMSxBA8nW1s888n3tjRKc0mXRfRjyO5wN4OTPcGiZDDRx7udSNwtsTYIBC/FapsdE=
X-Received: by 2002:a05:6e02:1a66:b0:3a3:b1c4:8198 with SMTP id
 e9e14a558f8ab-3a3dc4f5fdemr55708805ab.20.1729110811783; Wed, 16 Oct 2024
 13:33:31 -0700 (PDT)
MIME-Version: 1.0
References: <20241003-preemption-a750-t-v8-9-5c6cb9f256e0@gmail.com>
 <1b9afb20-d608-464c-ae6b-c535564b7e5a@ijzerbout.nl>
 <eb1a0381-05c3-4ef8-b6de-96824d587a7d@gmail.com>
In-Reply-To: <eb1a0381-05c3-4ef8-b6de-96824d587a7d@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 16 Oct 2024 13:33:19 -0700
Message-ID: <CAF6AEGu0b5EXjvjDn1DTy2zCSDp7yFpGvGoAb3Kc91Y9HK+=pg@mail.gmail.com>
Subject: Re: [v8,09/12] drm/msm/a6xx: Add traces for preemption
To: Antonino Maniscalco <antomani103@gmail.com>
Cc: Kees Bakker <kees@ijzerbout.nl>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Oct 16, 2024 at 5:13=E2=80=AFAM Antonino Maniscalco
<antomani103@gmail.com> wrote:
>
> On 10/8/24 11:10 PM, Kees Bakker wrote:
> > Op 03-10-2024 om 18:12 schreef Antonino Maniscalco:
> >> Add trace points corresponding to preemption being triggered and being
> >> completed for latency measurement purposes.
> >>
> >> Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> >> Tested-by: Rob Clark <robdclark@gmail.com>
> >> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
> >> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
> >> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
> >> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> >> ---
> >>   drivers/gpu/drm/msm/adreno/a6xx_preempt.c |  6 ++++++
> >>   drivers/gpu/drm/msm/msm_gpu_trace.h       | 28 +++++++++++++++++++++
> >> +++++++
> >>   2 files changed, 34 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/
> >> drm/msm/adreno/a6xx_preempt.c
> >> index
> >> 21e333cb6342d33425eb96f97bcc853e9b041b36..6803d5af60cc8fb0f2a52ee160ff=
dbf0e8ef0209 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> >> @@ -7,6 +7,7 @@
> >>   #include "a6xx_gpu.h"
> >>   #include "a6xx_gmu.xml.h"
> >>   #include "msm_mmu.h"
> >> +#include "msm_gpu_trace.h"
> >>   /*
> >>    * Try to transition the preemption state from old to new. Return
> >> @@ -174,6 +175,8 @@ void a6xx_preempt_irq(struct msm_gpu *gpu)
> >>       set_preempt_state(a6xx_gpu, PREEMPT_NONE);
> >> +    trace_msm_gpu_preemption_irq(a6xx_gpu->cur_ring->id);
> >> +
> >>       /*
> >>        * Retrigger preemption to avoid a deadlock that might occur
> >> when preemption
> >>        * is skipped due to it being already in flight when requested.
> >> @@ -294,6 +297,9 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
> >>        */
> >>       ring->restore_wptr =3D false;
> >> +    trace_msm_gpu_preemption_trigger(a6xx_gpu->cur_ring->id,
> >> +        ring ? ring->id : -1);
> >> +
> > There is no need for the ternary operator. "ring" should be non-NULL,
> > otherwise the code would have already crashed.
> > So the change can just be
> >      trace_msm_gpu_preemption_trigger(a6xx_gpu->cur_ring->id, ring->id)=
;
>
> You are right, we had a similar cleanup but I missed this particular
> one, thanks for pointing me at it! I apologize for the late response but
> I've been at XDC and therefore unable to look at my email. I will point
> this out to Rob since this series is in msm-next to see if I need to
> send a separate patch to clean this.

Yes, please send a new commit, I don't want to re-write history on msm-next

BR,
-R

> Best regards,
> --
> Antonino Maniscalco <antomani103@gmail.com>
