Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF8A966A6A
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 22:25:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1572C10E718;
	Fri, 30 Aug 2024 20:25:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HvIHpyFF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F9110EB05;
 Fri, 30 Aug 2024 20:25:42 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id
 5614622812f47-3df0519a3ceso1419413b6e.2; 
 Fri, 30 Aug 2024 13:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725049542; x=1725654342; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wmi/pTyUDK+aU0s8E9BEY8Nj85X7ZUgdfvMfSISCftU=;
 b=HvIHpyFFx/FN3/QRpSW7GPJEskZwWSRPwCSndPKo2C9SHDX8dHtyZ6jKv0KIYuWvco
 b6bUXLX7/Zh6CiJ7JxvCI/6DlyVDIc9Hvi0u3t+O8QMTMFSwxeS/jR0uD41FL8ZpLQ/4
 nnd9JTE4LICACYyKRS9Bv8a5dx7/FPk/Y2pOXRVF3X8OvmDBFkoElRom9jwMu8Dge5AH
 7R89VEEcPRReQ4eItDfVB0TIvkDZ/2yDDGiWg8n4vqf84cdu0Rnsk96Z8giHSkyQnlgU
 mdMZVmcxxbW75nsiZQvUr5a5+X8fTkyIdDzpK0rkqv0+vpUO+8IFP6CIyzqzZeGV3SK+
 sCRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725049542; x=1725654342;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wmi/pTyUDK+aU0s8E9BEY8Nj85X7ZUgdfvMfSISCftU=;
 b=pjdrclaP28KklyBWl+r3am6KduvxWPmyXC0Qwapll2xE6G5MkEPRlZuXSAvhVxbA9g
 IrXFd+XVg0I1ZZyIMYYfysLLGQhC0/APBHKFSN0xHjqdmrvEMGXXnp61XLdWrgTJUdt4
 BzfuEBztaOGDsF4YRbcLbtaaKfMqthAUndRuuwY6BYF6lV4tUGuCFHaDvZIsIG0XK8Rj
 Y5m6qDvNonFFzyy7lLqC8h8fBvgXsQ6TbMHNFvY7INa13LGs2+GUbobKk63SimL4HIMM
 abQeKwjok0y7TdoUgoTGFs0ei//6z69eZ04iFdRF2U1iSglyZRlpT+wUBH6y92hI66ma
 RmOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdwpA1g+JEtlGBnWy2Dw7qvxjkXJTTjxrfoL8Lprysx3tnfYyiI57Ge+2goTcwgM/pLrLkcLo7Am8=@lists.freedesktop.org,
 AJvYcCVotFhIojA2Nhk7WFWvgng7g7K15/JcBdUrICKvHmJSn3a6SBzhDIJCJQT4n71qMJi1Gq34uwc7WnJb@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxAmK57N3swrg78OoSFFax2yvnw0DhgCYK9szbjAr67fOMSaLaB
 flZSP97BqMnJiUOBc3KH/uhcZ0k9w18jJuy6sezBw8/aiRu5rYjn5HM2x3kzCZcIDKqKVtmaa0N
 ZC923Dk4qCi79XCwMSaIrj1JBEXg=
X-Google-Smtp-Source: AGHT+IHaFeABA5Vn8ABw7yINmC+Tm9Vy/T6WIGe45B4kDw7kSZ+SHLVnOVzl36EETX7brTAbDLFvYuatHAuUDjNvzwA=
X-Received: by 2002:a05:6808:18a8:b0:3db:3303:834c with SMTP id
 5614622812f47-3df1c18dca3mr526467b6e.39.1725049541577; Fri, 30 Aug 2024
 13:25:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com>
 <20240830-preemption-a750-t-v2-4-86aeead2cd80@gmail.com>
In-Reply-To: <20240830-preemption-a750-t-v2-4-86aeead2cd80@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 30 Aug 2024 13:25:27 -0700
Message-ID: <CAF6AEGuwtgzOZtDKPq+dna-mvv2M193Neow_7ZprxrLV+hf+FA@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] drm/msm/A6xx: Implement preemption for A7XX targets
To: Antonino Maniscalco <antomani103@gmail.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>, 
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

On Fri, Aug 30, 2024 at 8:33=E2=80=AFAM Antonino Maniscalco
<antomani103@gmail.com> wrote:
>
> This patch implements preemption feature for A6xx targets, this allows
> the GPU to switch to a higher priority ringbuffer if one is ready. A6XX
> hardware as such supports multiple levels of preemption granularities,
> ranging from coarse grained(ringbuffer level) to a more fine grained
> such as draw-call level or a bin boundary level preemption. This patch
> enables the basic preemption level, with more fine grained preemption
> support to follow.
>
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
> ---
>  drivers/gpu/drm/msm/Makefile              |   1 +
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 323 +++++++++++++++++++++-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     | 168 ++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 431 ++++++++++++++++++++++++=
++++++
>  drivers/gpu/drm/msm/msm_ringbuffer.h      |   7 +
>  5 files changed, 921 insertions(+), 9 deletions(-)
>

[snip]

> @@ -784,6 +1062,16 @@ static int a6xx_ucode_load(struct msm_gpu *gpu)
>                 msm_gem_object_set_name(a6xx_gpu->shadow_bo, "shadow");
>         }
>
> +       a6xx_gpu->pwrup_reglist_ptr =3D msm_gem_kernel_new(gpu->dev, PAGE=
_SIZE,
> +                                                        MSM_BO_WC  | MSM=
_BO_MAP_PRIV,
> +                                                        gpu->aspace, &a6=
xx_gpu->pwrup_reglist_bo,
> +                                                        &a6xx_gpu->pwrup=
_reglist_iova);

I guess this could also be MSM_BO_GPU_READONLY?

BR,
-R
