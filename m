Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 559E9B0E0B3
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 17:38:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D177810E132;
	Tue, 22 Jul 2025 15:38:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DWBVwOIA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62B3910E294
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 15:38:29 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MFJasV008178
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 15:38:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=5v7ZQEbIAiB0+2jIBiZJ/zlAz5qzyamJW6N+8IwXK2g=; b=DW
 BVwOIAfZamAYOhpztOGGNnXgLreZMfJCH5mBPagIOcmoQtv0nLI8Pa0HO0quJCLN
 6Wi5edUrWF31LX6kjoCOtQuQhE43+E0HUqaXGGKjot+d3RpcjeDgjnf4lxKYGK/J
 MlP643aCQbvi0Adpa3rW9FFu9ZiNWV06gvJGXWAwV96fJ65UGvl8y6WxC/IKl38u
 JDbG08GBvw5qD1ohkOR1YoJVUFd6qD9vS0dlCal0awFo4rMqfifnEVS9g45Gfbq3
 tpjwgde6iVAr6OIro43Q73w/4iatt9HgaWmod/QXC7tPo3x1ua6DEDlDm201eHMm
 OfX1PfU/HsHKvQzByM/w==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48045w0bwn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 15:38:28 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id
 5614622812f47-4139102c793so4706612b6e.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 08:38:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753198707; x=1753803507;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5v7ZQEbIAiB0+2jIBiZJ/zlAz5qzyamJW6N+8IwXK2g=;
 b=qhlCv3nC7yb0SMFCDZtCagaGlMkecYJncc7CxjmJtbjeT85D8vI19dSlI+e2IxRAiu
 VYa6xJDR508EuBMMRlkkMkW0WPUw/lsYlTlZf04bWcwk+Ofv6tBQTVZy8KyOEZ9zE1Zp
 nKhKSPZw/9zhIHJZB5cqu+xScsdEwRgMO+81seE4WbPsnUSzNxxmRRFQ2iXMD7JkKcIj
 54J9tCxFEl9yzu7e766sfJ5wxwzQs4GNQD/JpMDuu2+hl0AmAI84XEJ4mJVNBcAV/XdC
 OWQL13igJ6Ln2ZWQCPDmxfZ35dpZGq9elmYJDPyggFtnQ+wIdTQKmJrjKuFvS8l0rGah
 0ztA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7jvcHhhRk0/agrDIs19bdDiLwe1rriWsxzK/4vE4tTVpIA+DLt7kVaECHaLnH9LEhB5KCiCmAxFs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNQMf/GbAZ2EaY2cEBr0dkxjpU+tLPtP7Tz3xLNN25b46Kh04N
 998w//Au6harUtCo04yyGYQbFZ/0IxAxGN2wBCPDHaBX/tgNTLSwZ6qHoQF5X0875UFwVD+1gyD
 0Utl18601Cc0sJeQ+eu8XVv4o/lOl4blMNjLBEwvRhVbCdCO9L03NcjBN3Ue3JcpdMr0J+y5I40
 A0PivgxpWWRWN4XWgtYleEo3DQOTUysM8JNJQH7lrCDb+n2Q==
X-Gm-Gg: ASbGnct5LK9BqhEf0GT1JcW26JFqFc0oBwzDRPU+MO+dBghLjRjPAqFD2d3G2hqg0YA
 Q/N4IwvZA8RAu4NOzhJQf76aDk1IFmR7C4YlxrtQcJejJy59zSPm1Bhahr95pkyX2RjZyrkEfOE
 +O1HSskuxTzp2CNuGAmmFuTB8kPj3oB33O9gevw/fFvUTWjz4zxmu0
X-Received: by 2002:a05:6808:680a:b0:40b:2566:9569 with SMTP id
 5614622812f47-41d04c92c9cmr13430194b6e.24.1753198707606; 
 Tue, 22 Jul 2025 08:38:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1GJFYfKEf/2vfcM24SVmmRuQ+5KIZBxPBd7aDQfDJlhTZLhTkv+JowWe/tlkItYgNDaaLaguNHER2f1sJAMA=
X-Received: by 2002:a05:6808:680a:b0:40b:2566:9569 with SMTP id
 5614622812f47-41d04c92c9cmr13430177b6e.24.1753198707155; Tue, 22 Jul 2025
 08:38:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-12-9347aa5bcbd6@oss.qualcomm.com>
 <vng6tut4sv3zfbwogsb74omqsbqutpeskqdnezbs4ftsanqyb4@nv35r7mqmcva>
In-Reply-To: <vng6tut4sv3zfbwogsb74omqsbqutpeskqdnezbs4ftsanqyb4@nv35r7mqmcva>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 08:38:16 -0700
X-Gm-Features: Ac12FXyqViKjRhthyqXadlDIINRduJGIQgMSW9SK6xnSnnCzfXGivfqsWQaTERE
Message-ID: <CACSVV01EhWWohUDQ8n=FQeDuaDcgmYnMBJDMJ8D1Gist1NR4QQ@mail.gmail.com>
Subject: Re: [PATCH 12/17] drm/msm: Skip devfreq IDLE when possible
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=LL1mQIW9 c=1 sm=1 tr=0 ts=687fb074 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=19W1w_CfSDR24Ta8X3MA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-GUID: 8maGPDtbfQbo-P8dw3H7Kd1zp2QKpqbd
X-Proofpoint-ORIG-GUID: 8maGPDtbfQbo-P8dw3H7Kd1zp2QKpqbd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDEzMSBTYWx0ZWRfXxE6baAWtT3mO
 hHYW/nJhYuUvBKxnXSkRchHpq7qYL0Zm7TlJlhNqQVoOBiXtDRjc5/e8cQ6ofpbvhUd9F70jjVO
 j8fi7PuJF5zCQNeG6ow5frZnUOrlafgEC0kXaO7a65LvPhkZ5+gnq+p1evqIsYLyW/YgVlECDeC
 2BfLxdsXOhZ1xqUP9f2r4SQNQ8FaNKzhhszj7zCRAKcSHzxCZdat+wiyZBNjwZPlgs+a6t0TL3Z
 E0pNirALfRBMPskgLuqGBiOxYd7OdVMnOBke65usm27Mz8KQSx+wZyN+zFmaAP4Ndpl52uh/86c
 nTkD1gxpFELOSEn3j983a1+a6ZeXFsvjo/0FvFxmCORRFI90nn2CuyOfhMHoTCyQ16/lxXBFlPi
 2OVTCx2MY8b5g3lp26vb5QQk29A5blxmmi53AzSa2dukfjAcCXIn6vONjup2vyPjZAAMk//S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 mlxscore=0 adultscore=0
 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220131
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

On Tue, Jul 22, 2025 at 6:50=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sun, Jul 20, 2025 at 05:46:13PM +0530, Akhil P Oommen wrote:
> > When IFPC is supported, devfreq idling is redundant and adds
> > unnecessary pm suspend/wake latency. So skip it when IFPC is
> > supported.
>
> With this in place we have a dummy devfreq instance which does nothing.
> Wouldn't it be better to skip registering devfreq if IFPC is supported
> on the platform?

devfreq is still scaling the freq.  What is being bypassed is
essentially a CPU based version of IFPC (because on sc7180 we didn't
have IFPC

Currently only a618 and 7c3 enable gpu_clamp_to_idle.. if at some
point those grew IFPC support we could remove the trickery to drop GPU
to min freq when it is idle altogether.

BR,
-R

> >
> > Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/msm_gpu_devfreq.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/ms=
m/msm_gpu_devfreq.c
> > index 2e1d5c3432728cde15d91f69da22bb915588fe86..53ef2add5047e7d6b6371af=
949cab36ce8409372 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> > +++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> > @@ -4,6 +4,7 @@
> >   * Author: Rob Clark <robdclark@gmail.com>
> >   */
> >
> > +#include "adreno/adreno_gpu.h"
> >  #include "msm_gpu.h"
> >  #include "msm_gpu_trace.h"
> >
> > @@ -300,6 +301,8 @@ void msm_devfreq_active(struct msm_gpu *gpu)
> >       if (!has_devfreq(gpu))
> >               return;
> >
> > +     if (to_adreno_gpu(gpu)->info->quirks & ADRENO_QUIRK_IFPC)
> > +             return;
> >       /*
> >        * Cancel any pending transition to idle frequency:
> >        */
> > @@ -370,6 +373,9 @@ void msm_devfreq_idle(struct msm_gpu *gpu)
> >       if (!has_devfreq(gpu))
> >               return;
> >
> > +     if (to_adreno_gpu(gpu)->info->quirks & ADRENO_QUIRK_IFPC)
> > +             return;
> > +
> >       msm_hrtimer_queue_work(&df->idle_work, ms_to_ktime(1),
> >                              HRTIMER_MODE_REL);
> >  }
> >
> > --
> > 2.50.1
> >
>
> --
> With best wishes
> Dmitry
