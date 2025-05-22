Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 583B0AC105D
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 17:53:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A656310E18A;
	Thu, 22 May 2025 15:53:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BwFSXU7G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3E9D10E169;
 Thu, 22 May 2025 15:53:46 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-30eccc61eacso653912a91.3; 
 Thu, 22 May 2025 08:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747929226; x=1748534026; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zyjwD9WxvfAztnJW6BdDFn9aSoJOsoOwl9SlivsMP8E=;
 b=BwFSXU7GS5HOhf1EZWujabkHTs1b2VTTPw/udEPaRw+GNpOnBQZLZdKxou+GTs6gSN
 S/0iKR/Md2CjZVJ47otPnchbX5fjrylc8/b3z3H6koHe6K834zbkXQXBIQa1xRTmYkWd
 IrHsCvSkQFARMX/8Ayy2UrtxkkoIZiXHK5NuHOWArKpKcijDqdL2RBn4lZqee4Xs3sV+
 IUjVc1UKF71ahsqUp3AzCFrPqf1RvRJqHJ9f2kOXx4Fq35qI/LrV+QPmuMqfd/R3LDv0
 gyV73EtugaSnWdakJUpY0jACA2ZbTBlyJgVV/UBbqjXrPSGf/j38looIOzpiKW3dELYu
 LYLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747929226; x=1748534026;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zyjwD9WxvfAztnJW6BdDFn9aSoJOsoOwl9SlivsMP8E=;
 b=ant4pt17egWq4ZYWZSIrFgJT7BzpRGFxRF5DAHvahj8cPS1afu4ZII0ghvZK0OHP5z
 xOJeP9LQA8TGFkzGaBnz/VIsv9HomwRdXkr8A1Ah7JK8gZ7TNHi6Vw1SocxI4N9ZaFto
 WR8Jh5XSQNNpa9GC6z9GHR2KJ6KOilonPBBsqgHrpnMkgyUZ49FU48uzC+tzvC3oR771
 keAbqDn6RTVRt/+m+P3OzkNaHDARbFtQfQXI8Lb8bPJjfRBBzftgYuiJg2j2+lIpVA03
 uiba4RhMXC89fU8nGGpb1OQURmIQ7S898WFXqS7er02Ib5Diyonc1yKTcMQrIkrwqVCY
 dA8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxR/CUtJXnoZgMfgxkTbG6dvxQ781VUi7R1QTDhBJ04krFk4WQoVU0CjxO8B9NZoRZmiX5NohuhYk=@lists.freedesktop.org,
 AJvYcCXNSEq7FmORn5WYEahSIQkoFTaTV/9sq4EGGvMOUJwtklnbl3dZr0detiARfnv7sdTDkoaQVD8vE3Rv@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJH9ZOLLa8WDA9UxZ8Gaw7r1zhAAEU8Tt5Bg7r9PbFuBvpYUBM
 bOpPuURxy7mxjkP3s8VXqddYouK6hPGaOSg0w/A97vfj8m6JA3AN8SdzbcXlMWc3KFXErlbMrZR
 XQqWOOz7t7gB8Gbtb7sbnmLawss91HW4=
X-Gm-Gg: ASbGncuXFTY8l52+4F0QHgc8sPVLaIOWekq/rVINznbQlNIJ3XQzlVCtZ5TTg+OT+Ye
 7DuCTjcj402kBHKgIjz8qg1L8CUi/4Xlo2ycNIEOHtcTVchwyQtFiZGCO1Q51vnynSseq3wjRvj
 xXcxsCQGk51WVQL4iFq3eLv1WZEEnqHUB6
X-Google-Smtp-Source: AGHT+IGqpNwpo6t50ABPvARiR7Fav0e+v5y+U9NbZpvFNzFafggGWHSUUGlJMuVUvL72bltSz+/95O2W5z7oOWlw/9w=
X-Received: by 2002:a17:90b:1648:b0:2fe:b972:a2c3 with SMTP id
 98e67ed59e1d1-30e7d2f7897mr14780675a91.0.1747929226047; Thu, 22 May 2025
 08:53:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250520-msm-reset-context-state-v1-0-b738c8b7d0b8@gmail.com>
 <20250520-msm-reset-context-state-v1-2-b738c8b7d0b8@gmail.com>
 <1d615331-2d60-415b-8f53-0d3a7b5d5fe4@oss.qualcomm.com>
In-Reply-To: <1d615331-2d60-415b-8f53-0d3a7b5d5fe4@oss.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 22 May 2025 11:53:32 -0400
X-Gm-Features: AX0GCFtHldEUu2aNcjsdF8YTSF7emekKEp5F-5LgRGYvNhd2Y4t9DQNGuVnPHow
Message-ID: <CACu1E7G2sYoGZcFG8YTHp+UXk1fLFTAG=uX+mdU==SxwPntmAQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/msm/a7xx: Call CP_RESET_CONTEXT_STATE
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
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

On Thu, May 22, 2025 at 11:46=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 5/21/25 12:28 AM, Connor Abbott wrote:
> > Calling this packet is necessary when we switch contexts because there
> > are various pieces of state used by userspace to synchronize between BR
> > and BV that are persistent across submits and we need to make sure that
> > they are in a "safe" state when switching contexts. Otherwise a
> > userspace submission in one context could cause another context to
> > function incorrectly and hang, effectively a denial of service (althoug=
h
> > without leaking data). This was missed during initial a7xx bringup.
> >
> > Fixes: af66706accdf ("drm/msm/a6xx: Add skeleton A7xx support")
> > Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/ms=
m/adreno/a6xx_gpu.c
> > index 06465bc2d0b4b128cddfcfcaf1fe4252632b6777..f776e9ce43a7cdbb4ef7696=
06ec851909b0c4cdd 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -130,6 +130,20 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6=
xx_gpu,
> >               OUT_RING(ring, lower_32_bits(rbmemptr(ring, fence)));
> >               OUT_RING(ring, upper_32_bits(rbmemptr(ring, fence)));
> >               OUT_RING(ring, submit->seqno - 1);
> > +
> > +             OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
> > +             OUT_RING(ring, CP_SET_THREAD_BOTH);
>
> Downstream does CP_SYNC_THREADS | CP_SET_THREAD_BOTH, fwiw
>
> Konrad

Unfortunately the rest of the sequence downstream is slightly
different so I had to adapt this somewhat. Downstream does this as the
very first thing whereas we have a CP_SYNC_THREADS | CP_SET_THREAD_BR
beforehand so the threads are already synced, and there were a few
other minor differences iirc.

Connor

>
> > +
> > +             /* Reset state used to synchronize BR and BV */
> > +             OUT_PKT7(ring, CP_RESET_CONTEXT_STATE, 1);
> > +             OUT_RING(ring,
> > +                      CP_RESET_CONTEXT_STATE_0_CLEAR_ON_CHIP_TS |
> > +                      CP_RESET_CONTEXT_STATE_0_CLEAR_RESOURCE_TABLE |
> > +                      CP_RESET_CONTEXT_STATE_0_CLEAR_BV_BR_COUNTER |
> > +                      CP_RESET_CONTEXT_STATE_0_RESET_GLOBAL_LOCAL_TS);
> > +
> > +             OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
> > +             OUT_RING(ring, CP_SET_THREAD_BR);
> >       }
> >
> >       if (!sysprof) {
> >
