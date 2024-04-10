Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1FF89F3DA
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 15:18:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 508D011337E;
	Wed, 10 Apr 2024 13:17:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WDlmmzeA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA0D8113382
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 13:17:52 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-dbed179f0faso5567603276.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 06:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712755071; x=1713359871; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aaut2pBnJQwsZ84leifBiD3Jd/zh/CW3q55Aw0Cq/FM=;
 b=WDlmmzeAipZw3rzuEAAvYN5Rhc1x5xsMHJ80h7+joBYNour5XQaKq1yvolGO8EkpG1
 0e8arROZCm+6pbZcXGFaRToVDi0p64yJBg6IT2WIccOpPjF0DSy4xKv6/I+TDm/T1m10
 l1aGtckNOmiWLnk1J7TSYr1u3TFZVPJLbsEIQOVMuPC+u+MSYrnJtdfWuq93PUEULOIp
 6MSb9QKe1mYxkWN5yWYL8FhcIibsrMU2S44KlI5+cqC4h1xsGSKWgPES7rw/+kU4wy5u
 qMUEKyoIn1gGwZ6gk32iCT6mpa5/pTvL7XPGO5Qbl474CxBDEzlVCDq21LNWKG24MT9A
 SxOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712755071; x=1713359871;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aaut2pBnJQwsZ84leifBiD3Jd/zh/CW3q55Aw0Cq/FM=;
 b=a4NOCqFbMbkUq0e/wwTMa/xE7gMAVd7C4Y8By2UMOH1KOe6H/R0urhYYhVSKXXqNZJ
 +0EfD6/hSEWZ95uycMI55zq92IOkkR4H3bKSAFXl+tV4QDi6JJFrrYfl8VVBvMAdzlcg
 2k5pUHWa21fg+kyOAUTmn1wR0GI9yN7U4/gOvrdPO9tNos4CF2nyzswEhBcAxVI7GfpP
 uSts5y2v7CrtrD52c0zvReVU2H1D9yEJzoNQlaI8gzMjBxypxBpjKMA7hJmuTO47ElFx
 dD8wn1YB+bjTZuXgPWpr8Qly2t9PzUDJsokSzcEZ018b79TXrvMw1JK/R5fPCva+I48r
 6fOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXimQcVIOZip0WFwx2p+uevaPUaXLTux/LtOu7R974/9s96atG4s8K9f9vjaEFvqjAVVvz85Cj3ia8lo2vQ7CJGCfaVJBT7bxWC2WnB7e9V
X-Gm-Message-State: AOJu0YzGN0nRI4AuakIT9KLGJYeeH2RhcD4pxHTMpv8oTSKCJcFTzPaV
 BNNWaZkEbrj48NmcTn/4D86bnsEMsztVKcbgRQ0Z7K8SJyk0ChJWyW28GCZX8z2eeee7XWQZhfH
 1DA8mUAIgFA6QojijVTP7fPFpfP+8tEzi1qtvgQ==
X-Google-Smtp-Source: AGHT+IFmS5w8AhK8kbcytc2bVAvW9AcSbo4jeQurDEFNC0cSxmV8ZNFN2AK5/kDoM6WitX7Tu3IUL/kE2njb2JKBLgs=
X-Received: by 2002:a25:8b08:0:b0:dcc:623e:1b5d with SMTP id
 i8-20020a258b08000000b00dcc623e1b5dmr1525941ybl.31.1712755070932; Wed, 10 Apr
 2024 06:17:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240408085523.12231-1-amishin@t-argos.ru>
 <CAA8EJppTM4tpsFaZKupPe=0Oc9qDp7dBqHyHGP4E5bTHKT=hSw@mail.gmail.com>
 <2b06e6b2-6fa0-48fa-800b-7aad6735daa6@t-argos.ru>
In-Reply-To: <2b06e6b2-6fa0-48fa-800b-7aad6735daa6@t-argos.ru>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 10 Apr 2024 16:17:39 +0300
Message-ID: <CAA8EJpq2=wFEY6GnKBHqnXPdrMs-g-iNuT=DaJddKbFCyBb=Sg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: Add callback function pointer check before
 its call
To: Aleksandr Mishin <amishin@t-argos.ru>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 lvc-project@linuxtesting.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 10 Apr 2024 at 14:53, Aleksandr Mishin <amishin@t-argos.ru> wrote:
> On 08.04.2024 12:03, Dmitry Baryshkov wrote:
> > On Mon, 8 Apr 2024 at 11:57, Aleksandr Mishin <amishin@t-argos.ru> wrote:
> >>
> >> In dpu_core_irq_callback_handler() callback function pointer is compared to NULL,
> >> but then callback function is unconditionally called by this pointer.
> >> Fix this bug by adding conditional return.
> >>
> >> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> >
> > This should be converted to a proper Reported-by: trailer.
> >
>
> It is an established practice for our project, you can find 700+ applied
> patches with similar line:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/?qt=grep&q=linuxtesting.org

Is there any reason why your project doesn't follow established
guidelines? Compare this to other robots.

Anyway:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>
> >>
> >> Fixes: c929ac60b3ed ("drm/msm/dpu: allow just single IRQ callback")
> >> Signed-off-by: Aleksandr Mishin <amishin@t-argos.ru>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 4 +++-
> >>   1 file changed, 3 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> >> index 946dd0135dff..03a16fbd4c99 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> >> @@ -223,9 +223,11 @@ static void dpu_core_irq_callback_handler(struct dpu_kms *dpu_kms, unsigned int
> >>
> >>          VERB("IRQ=[%d, %d]\n", DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
> >>
> >> -       if (!irq_entry->cb)
> >> +       if (!irq_entry->cb) {
> >>                  DRM_ERROR("no registered cb, IRQ=[%d, %d]\n",
> >>                            DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
> >> +               return;
> >> +       }
> >>
> >>          atomic_inc(&irq_entry->count);
> >>
> >> --
> >> 2.30.2
> >>
> >>
> >
> >
>
> --
> Kind regards
> Aleksandr



-- 
With best wishes
Dmitry
