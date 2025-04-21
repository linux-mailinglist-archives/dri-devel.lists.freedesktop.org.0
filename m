Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0E5A956A5
	for <lists+dri-devel@lfdr.de>; Mon, 21 Apr 2025 21:19:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7467D10E488;
	Mon, 21 Apr 2025 19:19:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jaA+ZPS+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 587BD10E489
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 19:19:38 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LIgHmc028531
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 19:19:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=66he8wJaUK0BXjdYpq1b9tsi
 ThpKqiKwEnfuTBsAXos=; b=jaA+ZPS+WTAxCgmecMnXi8Ldi6FLV2+h0D8aiAQS
 8gaITNe1Jn6ylZzPjgPANg7opH3kcSXclq1+KcTwyZ9Ao9Yi8PohC338Kx7TcT7p
 6dfForP/CTruw6rrPlwxSm349cUVPUhCQnmbbPstDohSVDMl2QMRnu2dWaz4ND4L
 bXLxxFDiBlesIUbcUFgRzGjY15idzzSy0G3c3YaZWFxZNhg+A/UCUDnQhdzQJmnM
 4DWQRcLTsNyRUG3ZmoRlsWxhJNb6MPxHY8oeQsKZe6zNhkE3+qSgiWRkEMbD7E17
 ggx98fVkz6lZPt/ElRJ0UzOCEugO4K0DWMHKJgYMohxPJQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4643e1d3br-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 19:19:37 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6ecfbdaaee3so78557796d6.3
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 12:19:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745263176; x=1745867976;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=66he8wJaUK0BXjdYpq1b9tsiThpKqiKwEnfuTBsAXos=;
 b=W80fbE7KWkZplWuW+IJmzWgi0kbQzHNMaD6eejmUMVD25XOnWp/TkLpitsCSmA8tOj
 NCa4ywmhITqTsScZmBIX6r85x/CT9pa4ovi8/Y35OE6NGa3mODSezz5xdiBa6ob0xwzT
 yow60KBkWBg8l1eQW6jcT91dFvUYS5TzZklOHMxbZ3KhjXbJjUwVVX8FdNgZMEWxTXVP
 KIsV62l+DH/2r9KslT+ctdcrDKoxbb35lsdgJfJixIMTxPVvak8VPWbE5t6FZbveelGM
 fE3FZ5Y53qKA+Xp+1z0CZu1qhfJlyW7WLUuwlGDmgHd3hK1uxIMDWM+BLoNO/Cdi63TV
 /X/A==
X-Gm-Message-State: AOJu0Yyit9H6kuVGdsgnoKPGoz0Y95PKeVS3tEkhECHvWpTm6WzpnA3O
 QXBJku9Rxyz5/jCGKin+n/AYn4O4ZVpfS5dJpPCak2amDYjNBr24i9G995wbQ1cjEgmvBFHOWz2
 Dt2QirhBY2ZviyKEG3fxB5jXBWWCRHrLDLC4Gu6oAoHGZcTEC1eGkoaT+Orcx+morBsk=
X-Gm-Gg: ASbGncsfebI0rD36gnndtcB5q0y/M3qtKcK7yAaeguyelVBfw1aaAmQi0WRMwemQIR9
 xHV8wOzkqepnFlYpL6lAmDpvfH2NuboVONEMckP0kSaGqL7FWMtWm7OLda7KsjdN0q15McIkZFu
 YbKtwQh3dLsqK3wnR/7jhTt8CdgftXZRMoyeP/gUTPATkShlDWfczlIBG9ERzocsx+KXxVJ4c4G
 KQX98NL8F2rExxWop4n7rDBlGKuJbtG9rvWN1gdI3jXehJTqetL1t33bwohWANIJD4+9fHeZPDI
 UDneSihnWKpmLQTuqgCVQQt41DLIjYkB6S1+EtNsgjZfB7Xsi7wYuRlDsU5PfEoROoOYQFgMeUs
 =
X-Received: by 2002:a05:6214:5081:b0:6e8:9170:9d06 with SMTP id
 6a1803df08f44-6f2c4687a66mr208576666d6.37.1745263176483; 
 Mon, 21 Apr 2025 12:19:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAH//LryHJxNVjS/IO9xATu109Vj5+FzfGQDOXYk6kqWt7voiXhfMu7uNgM4ct3GZlNBErgA==
X-Received: by 2002:a05:6214:5081:b0:6e8:9170:9d06 with SMTP id
 6a1803df08f44-6f2c4687a66mr208576246d6.37.1745263176063; 
 Mon, 21 Apr 2025 12:19:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54d70a20c36sm928895e87.225.2025.04.21.12.19.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Apr 2025 12:19:35 -0700 (PDT)
Date: Mon, 21 Apr 2025 22:19:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Jani Nikula <jani.nikula@intel.com>,
 =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 Arnd Bergmann <arnd@arndb.de>,
 =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
 Christopher Snowhill <chris@kode54.net>,
 Jonathan Marek <jonathan@marek.ca>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Eugene Lepshy <fekz115@gmail.com>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 07/34] drm/msm: Rename msm_gem_address_space ->
 msm_gem_vm
Message-ID: <4kpzu2pjg4wahdv74kf6bpwmrgzsikkwlzwzqyko6ylt5m5fob@bhvg5s5ky6tj>
References: <20250319145425.51935-1-robdclark@gmail.com>
 <20250319145425.51935-8-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319145425.51935-8-robdclark@gmail.com>
X-Authority-Analysis: v=2.4 cv=ZOrXmW7b c=1 sm=1 tr=0 ts=68069a49 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=bbRKhBg7HBMvg3avrSYA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: Hcqd8-bFuGy-i3lmpPTmxOyxE1pVLsbB
X-Proofpoint-ORIG-GUID: Hcqd8-bFuGy-i3lmpPTmxOyxE1pVLsbB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_09,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 suspectscore=0 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210150
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

On Wed, Mar 19, 2025 at 07:52:19AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Re-aligning naming to better match drm_gpuvm terminology will make
> things less confusing at the end of the drm_gpuvm conversion.
> 
> This is just rename churn, no functional change.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/a2xx_gpu.c         | 18 ++--
>  drivers/gpu/drm/msm/adreno/a3xx_gpu.c         |  4 +-
>  drivers/gpu/drm/msm/adreno/a4xx_gpu.c         |  4 +-
>  drivers/gpu/drm/msm/adreno/a5xx_debugfs.c     |  4 +-
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c         | 22 ++---
>  drivers/gpu/drm/msm/adreno/a5xx_power.c       |  2 +-
>  drivers/gpu/drm/msm/adreno/a5xx_preempt.c     | 10 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c         | 26 +++---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h         |  2 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c         | 45 +++++----
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c   |  6 +-
>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c     | 10 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c       | 47 +++++-----
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h       | 18 ++--
>  .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 14 +--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c   | 18 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h   |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 18 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 14 +--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h     |  4 +-
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c     |  6 +-
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c      | 24 ++---
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c    | 12 +--
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c     |  4 +-
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c      | 18 ++--
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c    | 12 +--
>  drivers/gpu/drm/msm/dsi/dsi_host.c            | 14 +--
>  drivers/gpu/drm/msm/msm_drv.c                 |  8 +-
>  drivers/gpu/drm/msm/msm_drv.h                 | 10 +-
>  drivers/gpu/drm/msm/msm_fb.c                  | 10 +-
>  drivers/gpu/drm/msm/msm_fbdev.c               |  2 +-
>  drivers/gpu/drm/msm/msm_gem.c                 | 74 +++++++--------
>  drivers/gpu/drm/msm/msm_gem.h                 | 34 +++----
>  drivers/gpu/drm/msm/msm_gem_submit.c          |  6 +-
>  drivers/gpu/drm/msm/msm_gem_vma.c             | 93 +++++++++----------
>  drivers/gpu/drm/msm/msm_gpu.c                 | 48 +++++-----
>  drivers/gpu/drm/msm/msm_gpu.h                 | 16 ++--
>  drivers/gpu/drm/msm/msm_kms.c                 | 16 ++--
>  drivers/gpu/drm/msm/msm_kms.h                 |  2 +-
>  drivers/gpu/drm/msm/msm_ringbuffer.c          |  4 +-
>  drivers/gpu/drm/msm/msm_submitqueue.c         |  2 +-
>  41 files changed, 349 insertions(+), 354 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
