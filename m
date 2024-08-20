Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF78958509
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 12:45:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35C3C10E720;
	Tue, 20 Aug 2024 10:45:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Umw+A8Lx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66A8010E720;
 Tue, 20 Aug 2024 10:45:26 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-70d1c655141so3406171b3a.1; 
 Tue, 20 Aug 2024 03:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724150726; x=1724755526; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bWFJvtWInxnxyNJboaGFr0YAa5APJgiKfOf6l3379ZM=;
 b=Umw+A8LxzKSEDLqR6bUveHYnleAF+1yw0sxJs5APT9tDf+zz7coAQitfe7CuXdBqSK
 EXTWYoaX4lLVCnh72Hlb8Xv7Tj0vdiyzQBLlSuYCST53NFvdmzSMJ0XQWPA4QBRFGXMT
 TSNjvXWFmcZg0mdXX5Vl90BWQzjTjrZQlEHutQ3OJz1Nq9Cr6ehd6GQ23qXB4AnCpHTw
 bkGPCh1kh2xNpmTTJUZHeLD8Ov58zndpc9WsRk2lfflx45rb56yBKnDYBhkDqNTUd5/c
 C52hrjCiibFwduKoHlLowbrQMC20TvPI6MVodH9qvCzSO6wiAfuUDNi2wq5A6tKOcHVa
 tjkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724150726; x=1724755526;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bWFJvtWInxnxyNJboaGFr0YAa5APJgiKfOf6l3379ZM=;
 b=SjicM3ofUc8+7rY2Jw7ObWYwFvwJJrsTnXro9bsVNWUr4Gg0U4DgSkV7eXeIE8lsKY
 A0Lu50dIPDN2z4AwINWZjsHpdOzNwR8AoZ3U/c5xB6JH2DKMrNwd9cJlUjBtvRUNnoSJ
 cXhn9/H2Bw8uYyyjjvpYn9yTtXoK6pMav6bxoU/OIyf+9/Cfvnpo72lBFI0e3iFK8X6+
 bFbkP4sDIjW/I9XnADiJi/kZcYMbAinlukQQeyBexCFEmTdbrcYjGVWEBUfJLmz4o1N0
 k4VJZJ0aONOgSKFqQUOrjQYWScz6X6VA+V/YCBu3j/8VIZEBakqk0NjLAREoDRvmQwCa
 qbrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXggz+1LdrsM7CPXKw4c1yX5ABZXZrtQ7RpquVp7wJ1aTLIbvAd1QwOy3IVPI06PLPpwspOPHCQeOK@lists.freedesktop.org,
 AJvYcCWYkV5nAkcxnHl3pOsjTXeFTKaepNX7X3GIIIXuzZtVBs7XcAIsV/FCUXTUXYnU7Xiun6B1bykgRak=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5s5ziW4nK4LEk9l5pmPPVzysWLJbYPZ6Ed6PE7hLYWCecZcwR
 f+yUC9IAXS1gP9Ks+H51+IiyMW2HaYGWxF0W6Q0pJzP9VfoTTlkzDvdbYhhYGk1F+GrmuRULvNg
 VC2B/aL88MCaIvnlpechCoZstLFs=
X-Google-Smtp-Source: AGHT+IHXJqBpUvGqz6cLbeSh5gliW9v4Gc9+lLcMoERdeOVY2p8XziUqREqZ/yR8nbpXuDBu+sJGK7UroUDTKYw4pFk=
X-Received: by 2002:a05:6a20:c909:b0:1c8:b145:29c6 with SMTP id
 adf61e73a8af0-1c904f6b85dmr13953977637.8.1724150725740; Tue, 20 Aug 2024
 03:45:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
 <20240815-preemption-a750-t-v1-1-7bda26c34037@gmail.com>
 <e8d1534b-d592-43c4-8a34-4c7c4a04181a@kernel.org>
In-Reply-To: <e8d1534b-d592-43c4-8a34-4c7c4a04181a@kernel.org>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 20 Aug 2024 11:45:13 +0100
Message-ID: <CACu1E7H6g=8thZfoRh8-svjqhdTOPg5diKoj+ENa4F5==d5RxA@mail.gmail.com>
Subject: Re: [PATCH 1/7] drm/msm: Fix bv_fence being used as bv_rptr
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Antonino Maniscalco <antomani103@gmail.com>,
 Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Tue, Aug 20, 2024 at 11:15=E2=80=AFAM Konrad Dybcio <konradybcio@kernel.=
org> wrote:
>
> On 15.08.2024 8:26 PM, Antonino Maniscalco wrote:
> > The bv_fence field of rbmemptrs was being used incorrectly as the BV
> > rptr shadow pointer in some places.
> >
> > Add a bv_rptr field and change the code to use that instead.
> >
> > Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
> >  drivers/gpu/drm/msm/msm_ringbuffer.h  | 1 +
> >  2 files changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/ms=
m/adreno/a6xx_gpu.c
> > index bcaec86ac67a..32a4faa93d7f 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -1132,7 +1132,7 @@ static int hw_init(struct msm_gpu *gpu)
> >       /* ..which means "always" on A7xx, also for BV shadow */
> >       if (adreno_is_a7xx(adreno_gpu)) {
> >               gpu_write64(gpu, REG_A7XX_CP_BV_RB_RPTR_ADDR,
> > -                         rbmemptr(gpu->rb[0], bv_fence));
> > +                         rbmemptr(gpu->rb[0], bv_rptr));
> >       }
> >
> >       /* Always come up on rb 0 */
> > diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.h b/drivers/gpu/drm/msm=
/msm_ringbuffer.h
> > index 0d6beb8cd39a..40791b2ade46 100644
> > --- a/drivers/gpu/drm/msm/msm_ringbuffer.h
> > +++ b/drivers/gpu/drm/msm/msm_ringbuffer.h
> > @@ -31,6 +31,7 @@ struct msm_rbmemptrs {
> >       volatile uint32_t rptr;
> >       volatile uint32_t fence;
> >       /* Introduced on A7xx */
> > +     volatile uint32_t bv_rptr;
>
> This is never initialized or assigned any value, no?
>
> Konrad

Neither is the original (retroactively BR) shadow RPTR, except
apparently on suspend (no idea why). It's written by the GPU as it
reads the ringbuffer, because CP_BV_RPTR_ADDR is set to its address.
For the BV shadow RPTR, we aren't really using it for anything (and
neither is kgsl) so we just need to point the register to a valid
"dummy" address that isn't used by anything else.

Connor
