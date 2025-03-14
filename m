Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 141FFA61DA8
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 22:09:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B07F10E287;
	Fri, 14 Mar 2025 21:09:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ag0u55K+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D89E510E052;
 Fri, 14 Mar 2025 21:08:59 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id
 e9e14a558f8ab-3ce868498d3so10095865ab.3; 
 Fri, 14 Mar 2025 14:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741986539; x=1742591339; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BkRLpqMUrdRcSP/upvwA3EN8NMAu0/tqM1GHILgEdFw=;
 b=ag0u55K+T7JqFkkozhTtSucFNBSM12G49XH+oX8NwF64W+3aiM/FCM+1lNld5hMeFj
 DsyP2CKVa5gaxJFoYyh6ajSbQ7W2ktM+NmC/P27UaFtPbHFyeRSs1zwFvwV+q+yULAa5
 kQr7PInugaDvqn9fbFhvZ3kqPMj1++BH1vMz6M3Fm/kMZvD0UABkLVAG2clYVn8J80ZB
 BTjKHeiqIyXYlPkjeFN9Qr3qbY1ELmypKdnWUgO4IL/NWzhYQSdAyNMc0Zfl8QjNidQM
 tXMhhbO9wYfS6eA1VW7Bsp673/4wkkmr/S634YYBDBXXkKODKt6PQedCuGc4WR8SNOC8
 E/EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741986539; x=1742591339;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BkRLpqMUrdRcSP/upvwA3EN8NMAu0/tqM1GHILgEdFw=;
 b=l867azfPK5YKT6qQOfs95QLRpTc1S1o8jB4UX8IqqaeO1bqIoRVvY5MfyL2mRqCt7y
 /qsWvuqzaz3ktXk9S8ivJT8eiK63ovl6hBj/L7meBdBaDqb9EL0FpdPzhkpGe8nHd7PD
 FMwnJyCOsV7QpDD2QRrRWKiTFa7nh5rZBm6exPSXL7Fh3D74gtOYfdqDzhv9FZ906jKc
 VaA/1fF5BVdpX+8gSS6fh+Cg/IK87YPgt1mqbasKNnycjhe4889i2ZZdWyremtj9ApHZ
 8TuVz05W3zGbQYc/MQ/p0I6u7g5/UgIZYjHOKZIcSQHB3UVvn7mILiKY+2XsuV1ssyD1
 MtQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIhYVvsxkOkkIu+nVgSDm4flsedTS92JyfuymPkEMeRt+uKtrOm87ITUI2aHT6uZc+rwoCC0Bu1ZE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwbdOxLGq/gtgze33vHLahGs5h2cGvSkVHodX6C9Ui1wZM4uIRi
 NFhxSLNobxSy/heR7CYP5+wXk5Ck4grgHfNC9Qi+tOE0sh1eFr8YMiU9Ae1zEmHSTv4+Xx6Yxf2
 wrvnxfy2dp3bnKO3n35jWnBTDCyI=
X-Gm-Gg: ASbGncu3Rb4iv7uk3Tk+gaj6cM5c7d/9lOWj2tsqXiqeX4rNYOSyjhZNzO1DS7RmYmY
 IIEYfPntM8Jo0o5410pLmhfaQwt7CdWg9nAouMaQnHjlNrzsqeXDsieDO9EpJDYE/CqEpBGlxFH
 +HG3rmDxsd/V3CgAXOuZE4RyE825b/1RYU3jKAy7kdr5LFHz/XFdcjZQyP
X-Google-Smtp-Source: AGHT+IHnRUSdUAiE6xSCF7qK008yqz2CYgd4uPUsSUYmFzhuSr+lKmrz+rNzsxjiPE7EHSpTAr2kzC8PGntP7byzmIU=
X-Received: by 2002:a05:6e02:20c8:b0:3d3:db70:b585 with SMTP id
 e9e14a558f8ab-3d483a803femr39260345ab.21.1741986538694; Fri, 14 Mar 2025
 14:08:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250314183455.120824-1-robdclark@gmail.com>
 <4525d045-745a-4d8b-987e-45d3fa9917b5@quicinc.com>
In-Reply-To: <4525d045-745a-4d8b-987e-45d3fa9917b5@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 14 Mar 2025 14:08:46 -0700
X-Gm-Features: AQ5f1Joqit6DTlPsGxZi33_LsW2JIVjOxNSfy35r8VHQ4UBkw--tifeiumMS4JI
Message-ID: <CAF6AEGuneF8Yi0ViA4ActvmGL7aOFT75jNBN=YZf37YyoBkCFA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/a6xx+: Don't let IB_SIZE overflow
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>, 
 Connor Abbott <cwabbott0@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jordan Crouse <jordan@cosmicpenguin.net>, Jonathan Marek <jonathan@marek.ca>, 
 open list <linux-kernel@vger.kernel.org>
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

On Fri, Mar 14, 2025 at 1:07=E2=80=AFPM Akhil P Oommen <quic_akhilpo@quicin=
c.com> wrote:
>
> On 3/15/2025 12:04 AM, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > IB_SIZE is only b0..b19.  Starting with a6xx gen3, additional fields
> > were added above the IB_SIZE.  Accidentially setting them can cause
> > badness.  Fix this by properly defining the CP_INDIRECT_BUFFER packet
> > and using the generated builder macro to ensure unintended bits are not
> > set.
> >
> > v2: add missing type attribute for IB_BASE
> >
> > Reported-by: Connor Abbott <cwabbott0@gmail.com>
> > Fixes: a83366ef19ea ("drm/msm/a6xx: add A640/A650 to gpulist")
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> > Backport notes, prior to commit ae22a94997b8 ("drm/msm: import A2xx-A4x=
x
> > XML display registers database"), just open code, ie:
> >
> >    OUT_RING(ring, submit->cmd[i].size & 0xfffff);
> >
> > Prior to commit af66706accdf ("drm/msm/a6xx: Add skeleton A7xx
> > support"), a7xx_submit() did not exist so that hunk can be dropped.
> >
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c               | 8 ++++----
> >  drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml | 7 +++++++
> >  2 files changed, 11 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/ms=
m/adreno/a6xx_gpu.c
> > index d3978cfa3f20..ea52b7d0b212 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -245,10 +245,10 @@ static void a6xx_submit(struct msm_gpu *gpu, stru=
ct msm_gem_submit *submit)
> >                               break;
> >                       fallthrough;
> >               case MSM_SUBMIT_CMD_BUF:
> > -                     OUT_PKT7(ring, CP_INDIRECT_BUFFER_PFE, 3);
> > +                     OUT_PKT7(ring, CP_INDIRECT_BUFFER, 3);
> >                       OUT_RING(ring, lower_32_bits(submit->cmd[i].iova)=
);
> >                       OUT_RING(ring, upper_32_bits(submit->cmd[i].iova)=
);
> > -                     OUT_RING(ring, submit->cmd[i].size);
> > +                     OUT_RING(ring, A5XX_CP_INDIRECT_BUFFER_3_IB_SIZE(=
submit->cmd[i].size));
> >                       ibs++;
> >                       break;
> >               }
> > @@ -382,10 +382,10 @@ static void a7xx_submit(struct msm_gpu *gpu, stru=
ct msm_gem_submit *submit)
> >                               break;
> >                       fallthrough;
> >               case MSM_SUBMIT_CMD_BUF:
> > -                     OUT_PKT7(ring, CP_INDIRECT_BUFFER_PFE, 3);
> > +                     OUT_PKT7(ring, CP_INDIRECT_BUFFER, 3);
> >                       OUT_RING(ring, lower_32_bits(submit->cmd[i].iova)=
);
> >                       OUT_RING(ring, upper_32_bits(submit->cmd[i].iova)=
);
> > -                     OUT_RING(ring, submit->cmd[i].size);
> > +                     OUT_RING(ring, A5XX_CP_INDIRECT_BUFFER_3_IB_SIZE(=
submit->cmd[i].size));
> >                       ibs++;
> >                       break;
> >               }
> > diff --git a/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml b/driv=
ers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
> > index 55a35182858c..a71bc6f16cbf 100644
> > --- a/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
> > +++ b/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
> > @@ -2259,5 +2259,12 @@ opcode: CP_LOAD_STATE4 (30) (4 dwords)
> >       </reg32>
> >  </domain>
> >
> > +<domain name=3D"CP_INDIRECT_BUFFER" width=3D"32" varset=3D"chip" prefi=
x=3D"chip" variants=3D"A5XX-">
> > +     <reg64 offset=3D"0" name=3D"IB_BASE" type=3D"address"/>
> > +     <reg32 offset=3D"3" name=3D"3">
>
> Why is the offset 3 here? It looks to me that it doesn't match the code
> above.

oh, bad copy/pasta.. it should be 2 (dword offset)

BR,
-R

> -Akhil.
>
> > +             <bitfield name=3D"IB_SIZE" low=3D"0" high=3D"19"/>
> > +     </reg32>
> > +</domain>
> > +
> >  </database>
> >
>
