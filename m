Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D42B0E49D
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 22:14:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6208010E270;
	Tue, 22 Jul 2025 20:14:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="abEMxOQl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E37310E709
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 20:14:06 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MGKOYi012550
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 20:14:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=8stxXKOwM0cdX2+Hk7JZb+wP6e0PjVEkB1BIKQ6OkUU=; b=ab
 EMxOQlbIye5IyDYIVRYHKHyrh7d0fIUPvDupUlUSzKRJqQ2pKh0IUoYZw8fAqN9R
 fwF0uvNqCOMHssewh0YxGnzxy+OvtAVvj+oUwlCTSJzlhKdJCS1Ms+9a2XcQLOd7
 mK5vW7Qnk5gsXqP1tQJy2tNFbOQCQhh5Fmyl8D89I97h3f5eA7+M7ecwqO89uAJJ
 AzUHah4KylF1a9SUW4aVd2D5Pp/xvDzhdPt6dAU15H7coBQUwNpR7QFrNRJwNA2H
 7WwFz8y0FFW6VNfy7sBxpc7yDStp7Efj2eHzhtve0odiSO0VtVGDjh4nawq4EKnQ
 PYH9N43+QAjpYovmPXFg==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481qh6n16y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 20:14:05 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id
 006d021491bc7-615bb7de238so3211616eaf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 13:14:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753215244; x=1753820044;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8stxXKOwM0cdX2+Hk7JZb+wP6e0PjVEkB1BIKQ6OkUU=;
 b=FB3ZynVxmLoe1Vq76HyJzCZCMRFsIJ/G/ea5Y9xKLwGXNxVfriVCTUnZDKKemhmMe5
 ZoTFVIwtyz9lgiJYUR9bJvzervnHPCOUM4dS3+BO9nfK33yvgpbsRLcmz9iK8FwEQnE0
 /iEjFMzbtUkWnIM+/S5yqoxzgFywvm+hKfnqFsrOiM4m05ydfqnBr3ow4S/Ykuhz7uVe
 UgHpAih7hepe+HamUrI8ljLizkOS/Xv63hzRxl1h8J07EAtTA4WiRHNEXnygk7uR272F
 Y+yykvJDeG7fCJnMpq85CKKSM9d3V1ZMfVvrg10NyCDjPkL94/TnH5UFd7EfdKKAe52d
 hJoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbCyNhJ693SbgoKbi92cVdby8Le8nqIhzEdNJtk3SxNNjfrRIhMWYFoTGz9d7EH7W0p7w3q+QHFsw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0g7XjBVY35jf/HN4ATe2OAw9K7qCZiOC8pRmZOKZYX7yQm24P
 aDbsDYEwltGJBO3aIp8T1PnUBhlOaxBwZh6YCUmCXr23FyQxCvlXxiW5R/XMZvmNCkxuh4CzewF
 C1g8iELjZb86iTniVAQ+HKXBtytyAJ6qG62E/F7hSuiket+YtwohL63gw8p4zS+izbM3rK3T8zf
 8zZcOvBXQqxPwlec4NMmdsDzt7XiNJYrgumytCYGIvDoDOtw==
X-Gm-Gg: ASbGncsvSxoIYX3OLe6Rd+olMnXW7sSxXDXAftzUE0Fsog8kU3UUCGA8doRNxopTNG7
 N2We3/I0dzwPI6puEhHRoYhlOY9Y1BNXIZVU7S+UVTL+Ae1x1QHdimwQMFiBPfKNGrmygqYsGMP
 lI83O8tqed+iPfjqUalYtgJJ4ToBEi4ahHF2UJs2lwyqfuXdIiWfsu
X-Received: by 2002:a05:6820:a0b:b0:615:ac59:7613 with SMTP id
 006d021491bc7-6187d8bb150mr216587eaf.5.1753215244317; 
 Tue, 22 Jul 2025 13:14:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRLfuP1mZvVGnFE90xA1qN98KJGEEZE/W+UJS6YZQ2+JoDxvhTQ5iyKIyEb8QPf1XuzCh9CdlUZbBrwge/XuA=
X-Received: by 2002:a05:6820:a0b:b0:615:ac59:7613 with SMTP id
 006d021491bc7-6187d8bb150mr216565eaf.5.1753215243967; Tue, 22 Jul 2025
 13:14:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-12-9347aa5bcbd6@oss.qualcomm.com>
 <vng6tut4sv3zfbwogsb74omqsbqutpeskqdnezbs4ftsanqyb4@nv35r7mqmcva>
 <CACSVV01EhWWohUDQ8n=FQeDuaDcgmYnMBJDMJ8D1Gist1NR4QQ@mail.gmail.com>
 <800f8c9d-5586-46a7-aa83-dfb3b97633e0@oss.qualcomm.com>
In-Reply-To: <800f8c9d-5586-46a7-aa83-dfb3b97633e0@oss.qualcomm.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 13:13:53 -0700
X-Gm-Features: Ac12FXxPdajDniaWioq_6FbnrOl577Rcgtye0_PYpxo5MDWq0dAn_9MbJWgKs3E
Message-ID: <CACSVV00d4rbNDOLVZJTBNRmUsGyY6Tkwzv0cHRomeYyMXWHZVA@mail.gmail.com>
Subject: Re: [PATCH 12/17] drm/msm: Skip devfreq IDLE when possible
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=CZ4I5Krl c=1 sm=1 tr=0 ts=687ff10d cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=DNA1iQAdpGljtBPL7O4A:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-ORIG-GUID: CUtxIw8EgSsg8z-Nm638hejan1d127Hf
X-Proofpoint-GUID: CUtxIw8EgSsg8z-Nm638hejan1d127Hf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDE3NCBTYWx0ZWRfX95ginmLoZvxg
 cVhyzxELmPtocgffrySWmrvlBZ3+udo+VCFNck/muhxFAJfJnZuIW5hvmAjZ83cGFAp04sWRItJ
 LBPrtlMtMvl8POWjjOv2WsaF+dju5u2E2kOESiGj6XhMMsHm7j6yemdP+aHwDnoSnGBzDhtX/VQ
 IZVIe+uF4bhSPDpxlJc+Q1X0tuhZWrDZ2lB6DBL1XImPeAAmPVgyvzXlA/XgenMhwhrhoCGEh6o
 PFmx8/xaZXRGZteAnBm1fDcZ/QcGlI5M5uhD+qVr6qT0u1TO9r+CJQA234UIEh8i1Ol5cjaeX9o
 sYMBzS+aEEqbO3JjQklOWgdtLaAIBYOgAhOChba1aZlYMkMPDvWLd0V6EIi19dZ3c/Od08Apm1N
 8kKO6dNtmD50TfclQ0HgmL7GBSgI9rRNK7kMJTO3tFI0LLT67E6Aa1p9aSxn43lfe3NadInU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 impostorscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 bulkscore=0 spamscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220174
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

On Tue, Jul 22, 2025 at 12:23=E2=80=AFPM Akhil P Oommen
<akhilpo@oss.qualcomm.com> wrote:
>
> On 7/22/2025 9:08 PM, Rob Clark wrote:
> > On Tue, Jul 22, 2025 at 6:50=E2=80=AFAM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >>
> >> On Sun, Jul 20, 2025 at 05:46:13PM +0530, Akhil P Oommen wrote:
> >>> When IFPC is supported, devfreq idling is redundant and adds
> >>> unnecessary pm suspend/wake latency. So skip it when IFPC is
> >>> supported.
> >>
> >> With this in place we have a dummy devfreq instance which does nothing=
.
> >> Wouldn't it be better to skip registering devfreq if IFPC is supported
> >> on the platform?
> >
> > devfreq is still scaling the freq.  What is being bypassed is
> > essentially a CPU based version of IFPC (because on sc7180 we didn't
> > have IFPC
> >
> > Currently only a618 and 7c3 enable gpu_clamp_to_idle.. if at some
> > point those grew IFPC support we could remove the trickery to drop GPU
> > to min freq when it is idle altogether.
>
> There are 2 functionalities here:
> 1. Clamp-to-idle: enabled only on a618/7c3
> 2. boost-after-idle: Enabled for all GPUs.
>
> With this patch, we are skipping both when IFPC is supported. In the
> absence of latency due to clamp-to-idle, do you think a618 (relatively
> weaker GPU) would require boost-after-idle to keep with the
> UI/composition workload for its typical configuration (1080p@60hz)? If
> yes, I should probably create a quirk to disable boost-after-idle for
> premium tier GPUs, instead of tying it to IFPC feature.

Hmm, yeah.. I suppose _this_ patch should only skip clamp-to-idle.  It
is a different topic, boost-after-idle.

BR,
-R

> -Akhil.
>
> >
> > BR,
> > -R
> >
> >>>
> >>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >>> ---
> >>>  drivers/gpu/drm/msm/msm_gpu_devfreq.c | 6 ++++++
> >>>  1 file changed, 6 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/=
msm/msm_gpu_devfreq.c
> >>> index 2e1d5c3432728cde15d91f69da22bb915588fe86..53ef2add5047e7d6b6371=
af949cab36ce8409372 100644
> >>> --- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> >>> +++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> >>> @@ -4,6 +4,7 @@
> >>>   * Author: Rob Clark <robdclark@gmail.com>
> >>>   */
> >>>
> >>> +#include "adreno/adreno_gpu.h"
> >>>  #include "msm_gpu.h"
> >>>  #include "msm_gpu_trace.h"
> >>>
> >>> @@ -300,6 +301,8 @@ void msm_devfreq_active(struct msm_gpu *gpu)
> >>>       if (!has_devfreq(gpu))
> >>>               return;
> >>>
> >>> +     if (to_adreno_gpu(gpu)->info->quirks & ADRENO_QUIRK_IFPC)
> >>> +             return;
> >>>       /*
> >>>        * Cancel any pending transition to idle frequency:
> >>>        */
> >>> @@ -370,6 +373,9 @@ void msm_devfreq_idle(struct msm_gpu *gpu)
> >>>       if (!has_devfreq(gpu))
> >>>               return;
> >>>
> >>> +     if (to_adreno_gpu(gpu)->info->quirks & ADRENO_QUIRK_IFPC)
> >>> +             return;
> >>> +
> >>>       msm_hrtimer_queue_work(&df->idle_work, ms_to_ktime(1),
> >>>                              HRTIMER_MODE_REL);
> >>>  }
> >>>
> >>> --
> >>> 2.50.1
> >>>
> >>
> >> --
> >> With best wishes
> >> Dmitry
>
