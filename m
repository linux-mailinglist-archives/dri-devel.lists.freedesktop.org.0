Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A73B1DBC8
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 18:34:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 402F210E87D;
	Thu,  7 Aug 2025 16:34:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kQisyQxg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6671010E0E9
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Aug 2025 16:34:24 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5779D3I4003563
 for <dri-devel@lists.freedesktop.org>; Thu, 7 Aug 2025 16:34:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=20XGyfXXNdGC7HQWVvn1/217ySdGWAG+LZsLEYNzAEc=; b=kQ
 isyQxgZ6iPc3Dqkz5PhDNE/kGLpDsQ1ExaMUJT8FuqRF88ggtnaVwPqFhtVZbLI1
 AVFcjII7mpAI2W74c7NZIgVunInTO6+H4l/3PPcbGd1zdz3+PjlV/nA9UhSC5Mfn
 K66TfR6SpTM4hMitkVKpZfTd5Z+z3qyQRfLDVSwYHmhLTIKrZ8aMHXXHhvzJdYeg
 nkGYgGCGfyMH7LIfj4GlSieIQ55NtSGy/+hdAdMUY/D6O44xp+jJMRhAoe7+4YQU
 r3gOOygXgCN6ziP3huRubTzWKdhWF8AQ9EAiGs34kSrN7CTFbkZ0/WnH7EIJNKzf
 IUEEUB+S4GlObvJ7EJ1Q==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpvyy3tb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Aug 2025 16:34:22 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id
 5614622812f47-43589745296so1095323b6e.2
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Aug 2025 09:34:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754584462; x=1755189262;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=20XGyfXXNdGC7HQWVvn1/217ySdGWAG+LZsLEYNzAEc=;
 b=P0zZ7E1mwSchaWOPMwaNafUGSrkcG1M8jqLdRRXeY8ZLJc29rfIA86oEc/trm1NE2i
 PQf3JARYXk4YmopUtaBBqeWvSZWQPMo1E4df43ciZwIc1anxWdN4TkVl+qhVisoo6cPR
 6j59aZ7eVC2dwN5dJe9b5/+NcGS9l05jethjiyYtZkjXYvdGE5kn2iggbSKl3T18knvN
 anXLU+i+nUO7M4u4yFUe1iQRjj7bDnzqalUZRTgdB1n6jEFkrLXZq7nAzl9Ac76SQej+
 V9QqiGeg1y/FnCE/bb7bkEKJhtDQiPREl+ebeBsEavJjtA0th/iFDnRTQwswGChWXNJs
 9/kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxPyVgTNuGI717RYHoO2w9ivkmnawOoAdK7koAvk4K5LuczOHJxWc+XMsXz5cdVu3aOlTlfdS2++c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwNEJ8CzNjFibkZwIcOnbjhJRmw1+xHUvrAaS+fjB/EiTrgSON
 /Sgbs9sZiQuIKFkWNVZ56L3DJuR6Xc+PvBmbUq4L2hwiFKx7H1bgVoQSNTA4To3sORHtxzL1CTT
 YxyYKSLjV/oIohTVZDOwl2ceE67kIIINqQjSZGH5g+eklW5B3Z0/rHw8kaZnM8GuB2B+Lu+0jWm
 IgZGCpFjNs4lXfvne8bsJzu+yO3+ij1g6IP9FgkatMJZr+2Q==
X-Gm-Gg: ASbGncsJ6M/DukthcIRebG0bCUnR5/Artv+KRQbWVkQPsELR5bnJ1mzzZUmbeBb6V1o
 EOFpE2y9iDxiWhuZ1NovqzsyUcMY0Nt5VH5rBLpm5OgXb6TlNr6NOFBVbViGF+GB4YGrf6Huup1
 g5rUmG3PraQ7kVy5fGNyT6IZfuDJuLlEd3kZCNGuFTJUNEfw8a/bic
X-Received: by 2002:a05:6808:4f62:b0:435:51e3:4c32 with SMTP id
 5614622812f47-435949944cbmr412535b6e.22.1754584461696; 
 Thu, 07 Aug 2025 09:34:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyYDpEiutargwcHztd1uMH+An3wIVt+BWQAJA5PusdGM4Ay+XwJsJLRnHeGzu24XnAc+azltF8a3XWtp0hOuI=
X-Received: by 2002:a05:6808:4f62:b0:435:51e3:4c32 with SMTP id
 5614622812f47-435949944cbmr412515b6e.22.1754584461239; Thu, 07 Aug 2025
 09:34:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250807131058.1013858-1-sashal@kernel.org>
In-Reply-To: <20250807131058.1013858-1-sashal@kernel.org>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 7 Aug 2025 09:34:09 -0700
X-Gm-Features: Ac12FXxMSsMGvIgYDAvLfpHDoBnkFhjLk_774zLTck_kXTKHSm6n5z-AQjQuJmY
Message-ID: <CACSVV03b+tAN4o9kFFaNVJrcO6OgaCSmajL-LpvCd_wDzWPSBQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm: Fix objtool warning in submit_lock_objects()
To: Sasha Levin <sashal@kernel.org>
Cc: lumag@kernel.org, abhinav.kumar@linux.dev, jessica.zhang@oss.qualcomm.com, 
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, antomani103@gmail.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: F5lLTOdtnFf--PGFJfKatqWVWcCR_YuC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX2deIBsjN8JSe
 98NXAS5TBrY0tlI1fEnMNaIla4Ql1rY7B5RvFHwKYET2AUXWHlS87VuffTrb1eHM5p7BdLFZ2yi
 LqtL19uMYD3NzUGPRG+YCfN/bnCTNF/RzXD+CnmRVpQZhgQxat40oN8exMfyzweh9WhfI9Z62Is
 H3Pdwtqc5GdAe4ZuMlLJRTS+B4ZEEbznU/GmF77i7ZcpBQac5cBeSOVSdzK5eVhQ7nuAvUplcRc
 RrzNvsSG0OSFgyVH58rIo0EEr/xt/F+teS/vhMAOSXU+qanp5CdFJTiMZzkRfLZUCeu0UqHiadT
 Ffkb/nwv8IOdjjDkcxscENJRTvewB4WmRv5GOweJRK6QOC4h9+dHp0NfUeiVk5/FL3icz+ct4PS
 rzJNtfMc
X-Proofpoint-ORIG-GUID: F5lLTOdtnFf--PGFJfKatqWVWcCR_YuC
X-Authority-Analysis: v=2.4 cv=NsLRc9dJ c=1 sm=1 tr=0 ts=6894d58e cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=VwQbUJbxAAAA:8 a=J1DvxoY-jygCTqRSKsMA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_03,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009
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
Reply-To: rob.clark@oss.qualcomm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 7, 2025 at 6:11=E2=80=AFAM Sasha Levin <sashal@kernel.org> wrot=
e:
>
> Split the vmbind case into a separate helper function
> submit_lock_objects_vmbind() to fix objtool warning:
>
>   drivers/gpu/drm/msm/msm.o: warning: objtool: submit_lock_objects+0x451:
>   sibling call from callable instruction with modified stack frame
>
> The drm_exec_until_all_locked() macro uses computed gotos internally
> for its retry loop. Having return statements inside this macro, or
> immediately after it in certain code paths, confuses objtool's static
> analysis of stack frames, causing it to incorrectly flag tail call
> optimizations.
>
> Fixes: 92395af63a99 ("drm/msm: Add VM_BIND submitqueue")
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Thanks, I've pushed this to my staging branch for msm-fixes

BR,
-R

> ---
>
> Changes since v1:
>  - Extract helper submit_lock_objects_vmbind() instead of refactoring
>    single loop
>
>  drivers/gpu/drm/msm/msm_gem_submit.c | 49 +++++++++++++++-------------
>  1 file changed, 27 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/m=
sm_gem_submit.c
> index 5f8e939a5906..1ce90e351b7a 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -271,32 +271,37 @@ static int submit_lookup_cmds(struct msm_gem_submit=
 *submit,
>         return ret;
>  }
>
> -/* This is where we make sure all the bo's are reserved and pin'd: */
> -static int submit_lock_objects(struct msm_gem_submit *submit)
> +static int submit_lock_objects_vmbind(struct msm_gem_submit *submit)
>  {
> -       unsigned flags =3D DRM_EXEC_INTERRUPTIBLE_WAIT;
> +       unsigned flags =3D DRM_EXEC_INTERRUPTIBLE_WAIT | DRM_EXEC_IGNORE_=
DUPLICATES;
>         struct drm_exec *exec =3D &submit->exec;
> -       int ret;
> +       int ret =3D 0;
>
> -       if (msm_context_is_vmbind(submit->queue->ctx)) {
> -               flags |=3D DRM_EXEC_IGNORE_DUPLICATES;
> +       drm_exec_init(&submit->exec, flags, submit->nr_bos);
>
> -               drm_exec_init(&submit->exec, flags, submit->nr_bos);
> +       drm_exec_until_all_locked (&submit->exec) {
> +               ret =3D drm_gpuvm_prepare_vm(submit->vm, exec, 1);
> +               drm_exec_retry_on_contention(exec);
> +               if (ret)
> +                       break;
>
> -               drm_exec_until_all_locked (&submit->exec) {
> -                       ret =3D drm_gpuvm_prepare_vm(submit->vm, exec, 1)=
;
> -                       drm_exec_retry_on_contention(exec);
> -                       if (ret)
> -                               return ret;
> +               ret =3D drm_gpuvm_prepare_objects(submit->vm, exec, 1);
> +               drm_exec_retry_on_contention(exec);
> +               if (ret)
> +                       break;
> +       }
>
> -                       ret =3D drm_gpuvm_prepare_objects(submit->vm, exe=
c, 1);
> -                       drm_exec_retry_on_contention(exec);
> -                       if (ret)
> -                               return ret;
> -               }
> +       return ret;
> +}
>
> -               return 0;
> -       }
> +/* This is where we make sure all the bo's are reserved and pin'd: */
> +static int submit_lock_objects(struct msm_gem_submit *submit)
> +{
> +       unsigned flags =3D DRM_EXEC_INTERRUPTIBLE_WAIT;
> +       int ret =3D 0;
> +
> +       if (msm_context_is_vmbind(submit->queue->ctx))
> +               return submit_lock_objects_vmbind(submit);
>
>         drm_exec_init(&submit->exec, flags, submit->nr_bos);
>
> @@ -305,17 +310,17 @@ static int submit_lock_objects(struct msm_gem_submi=
t *submit)
>                                         drm_gpuvm_resv_obj(submit->vm));
>                 drm_exec_retry_on_contention(&submit->exec);
>                 if (ret)
> -                       return ret;
> +                       break;
>                 for (unsigned i =3D 0; i < submit->nr_bos; i++) {
>                         struct drm_gem_object *obj =3D submit->bos[i].obj=
;
>                         ret =3D drm_exec_prepare_obj(&submit->exec, obj, =
1);
>                         drm_exec_retry_on_contention(&submit->exec);
>                         if (ret)
> -                               return ret;
> +                               break;
>                 }
>         }
>
> -       return 0;
> +       return ret;
>  }
>
>  static int submit_fence_sync(struct msm_gem_submit *submit)
> --
> 2.39.5
>
