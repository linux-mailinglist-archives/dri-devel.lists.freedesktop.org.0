Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DDDA90F79
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 01:20:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5E4210E086;
	Wed, 16 Apr 2025 23:20:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CsqrQAXT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 108F510E086
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 23:20:56 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GKxwYJ003628
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 23:20:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=O+bay3u8UkUVUh3z4kt+jJUd
 J2Y3Kg04YyWU0gm+6Mc=; b=CsqrQAXTNSS7hFeXDgqLDm2NwS456itAL6Lf+0FU
 H1+oESwd+4CmlAEVCkNpbdgtB1Qmr9ndpC/wx0H+sw49/ak4SN9ISyPwTy9JyQei
 ToVBZqQoqvnS+MIvLrxETEiNhtSCjw+ZqnnNWxfM9u2w6d2Y34uRC5h0BL4Ru8zV
 a0549cC8O3REmpKAFZspuvMBEEMoUk8x61DFoHXMk11Sbp2iwohsxpchydXxp/DO
 u3xnw+9mhp1rgscNr5z1KMXoY7CNcbGxyh0b59xGgbILfvIfSDbthbmTAxlGRMKy
 usikbt+TUAW3gmO94+t2jRNYfK/MXKm7YzSSb4S8LkpScg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4628rva9y0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 23:20:55 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6e916df0d5dso4499036d6.2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 16:20:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744845654; x=1745450454;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O+bay3u8UkUVUh3z4kt+jJUdJ2Y3Kg04YyWU0gm+6Mc=;
 b=ND6MMyINf7YoZ+mnChIdaxpW2m8v/bO3fIGrhnbWtYuTWXQrN4SXfHqIvviLP7KUEN
 dFJYrYCoya2q8U8ZPyDbzK9Bzfv4gWjYUdI5AS/f05zf+1ZsfTR1eByJAZJGRozEmMzN
 fHM+3e7YVtPI/vULozVEEOpJG7D8/RNe0bLkHes/r5lfWye6ubV/nPcZVAQ6T1drYsC1
 9O/F/SHO+BpicnXxgt58CwVHB9ZJqNKutwB5m/RsCSXs4sAEWBD1ZB5ERs6fZEQ7E0Nt
 s6kuDXqAAHMzAKFcbdJJoRxwawY+4AKOziiNCpWmRNMuzfRGIfRZ8Lwe+zxtFqV+97xW
 Vu+w==
X-Gm-Message-State: AOJu0Yy3rtA+ieephTE8pfweBpGmPkkBGEdkSdjwNghQe2/tIZo+BL8+
 Sw2cZdcie1OqAuZ0GKd9vZnPLgaRQ4LfQgM1EVzqQR+3TG6x/S08KOAmH1ZaSv1Cjic83PMEjhe
 WpnaarD5L4HhxDzUfTmR1z59p8hhqvzFDCvCcikYI+MktnX6Ei4RMEdhZnokpCoqUvIo=
X-Gm-Gg: ASbGncvnjWv4ParUxi4xA9cEA9M1MxNOnoHaxNR14/WBHJcrFA0ZVcVaeAbQDkLa7nH
 isIUpOVctYuWXdHWoi3rqhyqeWgzCwYZRKJVX7JNxGdNHMI0POq6sXFa6bzsM9TUCW0InONDeSp
 GVnCN4/4HP97XqwgfOg+JVse4lEseVfYBDFS1ASSJTPra04BL0y2HGDc89aTtnu2hzjwP8oFN2C
 O29ZqgmBu781768jz2UgcjaRMJibfkoD1+BbDBoK1sxfJgaD9h+rzcC+cUL8b3TR4fHx1r4Nsb0
 7Bd7WktJqBH+peECnk9yF5u8iT8ZMpK5sSYohut+1ywV6wWFUbhV61tFg2yJsPhxDNenFBbS7sM
 =
X-Received: by 2002:a05:6214:20a2:b0:6e8:f65a:67bd with SMTP id
 6a1803df08f44-6f2b2f3e4ffmr54592276d6.11.1744845654042; 
 Wed, 16 Apr 2025 16:20:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBAA9vrfbsRJNy3z4MIqCYUoUGx8TD8fWhZnK3l2Nt2B+kFTS0IhIbhX4Oxt4YB0i74q0tEA==
X-Received: by 2002:a05:6214:20a2:b0:6e8:f65a:67bd with SMTP id
 6a1803df08f44-6f2b2f3e4ffmr54591936d6.11.1744845653574; 
 Wed, 16 Apr 2025 16:20:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54d3d520389sm1784976e87.251.2025.04.16.16.20.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Apr 2025 16:20:51 -0700 (PDT)
Date: Thu, 17 Apr 2025 02:20:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 08/34] drm/msm: Remove vram carveout support
Message-ID: <q2tzc2cvzfu7hirxcd6l6vi7veynqdopdg2myjbjkzbslcu5bi@52pmnd3thdil>
References: <20250319145425.51935-1-robdclark@gmail.com>
 <20250319145425.51935-9-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319145425.51935-9-robdclark@gmail.com>
X-Proofpoint-ORIG-GUID: mv_n5I8n3Q1Ixz_mUJMgRu2312FJYx8X
X-Authority-Analysis: v=2.4 cv=RbSQC0tv c=1 sm=1 tr=0 ts=68003b57 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=cm27Pg_UAAAA:8 a=9D-VRocS9j12M_ZVpNYA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: mv_n5I8n3Q1Ixz_mUJMgRu2312FJYx8X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_09,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 suspectscore=0 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160187
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

On Wed, Mar 19, 2025 at 07:52:20AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> It is standing in the way of drm_gpuvm / VM_BIND support.  Not to
> mention frequently broken and rarely tested.  And I think only needed
> for a 10yr old not quite upstream SoC (msm8974).

Well... MSM8974 is quite upstream, but anyway, let's drop it. Maybe
somebody will write an IOMMU driver.

> 
> Maybe we can add support back in later, but I'm doubtful.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/a2xx_gpu.c      |   6 +-
>  drivers/gpu/drm/msm/adreno/a3xx_gpu.c      |  13 +-
>  drivers/gpu/drm/msm/adreno/a4xx_gpu.c      |  13 +-
>  drivers/gpu/drm/msm/adreno/adreno_device.c |   4 -
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |   1 -
>  drivers/gpu/drm/msm/msm_drv.c              | 117 +-----------------
>  drivers/gpu/drm/msm/msm_drv.h              |  11 --
>  drivers/gpu/drm/msm/msm_gem.c              | 131 ++-------------------
>  drivers/gpu/drm/msm/msm_gem.h              |   5 -
>  drivers/gpu/drm/msm/msm_gem_submit.c       |   5 -
>  10 files changed, 19 insertions(+), 287 deletions(-)

-- 
With best wishes
Dmitry
