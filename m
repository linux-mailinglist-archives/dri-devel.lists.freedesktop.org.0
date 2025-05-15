Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D498AB7A99
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 02:32:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E1EF10E0BF;
	Thu, 15 May 2025 00:32:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mykXdNsl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC57010E0B6
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 00:32:30 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EK7uWV004836
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 00:32:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=7wCujduK3vbMXq78OiNobIBg
 xC9SjRSYXxxSDTrP8aQ=; b=mykXdNsli6DB1Z/HAfYnvDzduCMYjw0RYMQ96WUm
 fCqJQFsoEqTBOkSeT+gyw4xS13xzuEhXgKTyIJvcwG31dtwfKIf+fNfplr53o7fP
 Z0U69kpxlca7C4UB6uTmryTmvXIfMjt8oKV2CPvMKbQWfs8iKjf+fnK/atbixxAA
 V2zbvYjW0fjx4PCMowInXehOQrIPbRVGy7lKgxRW1o5WCUKLfwXAA7SjlqVlsFSZ
 7wK+VoE1rdCMI3E3lb7j/pVNNRWpuy390U/TQTij6ghjGBA7DSmywWIV5/dK/hZ6
 X/bz+0clRAHqgRTfbrY7n0RnhaMSgCDCMjW1KDa/q1djkA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnven9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 00:32:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c5e28d0cc0so62296585a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 17:32:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747269149; x=1747873949;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7wCujduK3vbMXq78OiNobIBgxC9SjRSYXxxSDTrP8aQ=;
 b=J8RzhYjXXQwpcJhvv0PN93INHFqkl3EsjD4LdkJLoCId9hJqTNGPMmawMkjh/VUV2P
 mOA3MeIWXRDZAlPW1HisLE8k5cPJ+jH/ea09oJe6GpxH6/JEaItBHNKG4g+NAXNKbsCW
 MYrgn21FaO41dyxf4VGH9RsqTwzCcPHgbHLaoWwaFgiaV/e1c3FUM7XXCh6ZzJC4y1Tt
 F7gEIhoWqKsC90gDOqrmA7yKSyWjyc1NFs03GV/s6fj9vHop9QFdYr6QnK4rS4YXx1Mc
 65adn4I9vBW0NzjeuUkLGqY79ap3SLq2cS4Caxu9WIBE5SW0Asy2v0v5/uhitvs0wcY8
 8wug==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhRfWkgYdQf8OQ3mH8VjEVAyu7fr+SmZY7St9OnIGRZi/i4zEXMkOoYuFpagAfVpdy440KWoQsLgE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YylbrGDdd1yL7WireVNy9RQO3jVhdco1IGJoxW2lhE4rQHQJzzw
 C/efhAKYOE7S2EQfgQrRE3KzJ4/oxJmMkzH9TNSexRKGPvHZogW650skKHWXacq30MTmuQU3qz7
 V33PvWpbYDCk8OcUqYSJLMOdzNZTd5u++wwheskO78KaptLah+gPsDI2QWmrfG5NXIrs=
X-Gm-Gg: ASbGncvKQ8ZMHZdr/7zGaKRdDgQOwgrSZ41PA1E7t2WAe5Q+1h5OvSkuHy23PWqfpiw
 VkURv/egTQeL+Zetwmg8lpxHLO5BnlDcsIpa98HqNMR6N2rP2BpJUU4evijQFbZc1GauwmlYsK5
 I1uVqBn3EZP6Wk+rzZxTKUwV5ZFB44vBVXCtso3h+8mBoTuWKtPlgmMO6Px+pdEBxqjQO1UPXDZ
 P1ySzY6M7Bvzs6eokwEpzMC5WX6Nyzds2hpq16KcKLbxt/zINHJI598b/MR521aBPxnhWUkp3YM
 i89pJgHrV55tI+s4qGSRPff/3ZlIVwNL9sRqnWGFwLZ1L2L6bj7bGjrGGzOGxuIX0YpXR7xB5Ig
 =
X-Received: by 2002:a05:620a:468e:b0:7c7:a5e1:f204 with SMTP id
 af79cd13be357-7cd2885d1camr804936685a.56.1747269148586; 
 Wed, 14 May 2025 17:32:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFLy/qxzAK6/2dzjOlUxFMW7+rsjpErZR6f687TEG75VgVdyNraMDrOlRULwKla6JyuE365g==
X-Received: by 2002:a05:620a:468e:b0:7c7:a5e1:f204 with SMTP id
 af79cd13be357-7cd2885d1camr804933585a.56.1747269148227; 
 Wed, 14 May 2025 17:32:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54fc645cdb5sm2435228e87.57.2025.05.14.17.32.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 17:32:27 -0700 (PDT)
Date: Thu, 15 May 2025 03:32:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] drm/msm/dpu: Remove max_mixer_width from catalog
Message-ID: <zymzf7cfy22kdlh7iyirzfrcmovaogkjtfatzt7lcaldymm7za@ppde2klezccn>
References: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
 <20250514-max-mixer-width-v1-5-c8ba0d9bb858@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-max-mixer-width-v1-5-c8ba0d9bb858@oss.qualcomm.com>
X-Proofpoint-GUID: 6QM6qDE8PYostNqpvjgJQCG7I8M3X0Hh
X-Proofpoint-ORIG-GUID: 6QM6qDE8PYostNqpvjgJQCG7I8M3X0Hh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDAwMyBTYWx0ZWRfX3TGGY4fhrr3a
 mVxoaSUlizQqtEQyXPX8akj4DBDNuxBtixR+nIbOjjRRbG7wJzc/sw/riiHrSaBn+AVwRjFlirp
 98CwNW1O0J+EjQk/l6fBJ3ZmCwYRWtcoMR4dV/AKqYvhOexSG2qwjAsiq5pdCpIYKAkW5sieD9N
 s18Rgg5MGhYpeTXbXgi6TM/cxExnxo49Pm7DHmKIMl+AsY66kGMtd+E2QWPtwDzr1skesiPwqUp
 e49idRjiNnqGWTqQesVdcKEhFxYPpOSSvRD4JpFMMMBVULVaWqP3mmp/AfgbLndNMd/AV5KGA10
 hq9AotivFeQHrs6iOvwsXy0ZpW5vw0K89Uot5gV+oyIGm/4ji4TOZTZyhUJpOlwvBQkztLI2E2o
 1zRkzpDNkPCLHZiFMG5E1YLRXRuh5K8ykPcNdZC5hJ0/swEkE8rlqOwfKq5UKrfKjQv8rCS3
X-Authority-Analysis: v=2.4 cv=Gp9C+l1C c=1 sm=1 tr=0 ts=6825361d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=uPaXGRBW1wo5ZQqY0uYA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_05,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 mlxlogscore=923 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150003
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

On Wed, May 14, 2025 at 04:52:33PM -0700, Jessica Zhang wrote:
> Remove the now-unused max_mixer_width field from the HW catalog
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h   | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h   | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h   | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h   | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h   | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h  | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h   | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           | 2 --
>  28 files changed, 29 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
