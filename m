Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A53FB1BF52
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 05:33:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C92F10E2E3;
	Wed,  6 Aug 2025 03:33:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XIDjR8lF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7666910E2E3
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Aug 2025 03:33:05 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5761emw2027531
 for <dri-devel@lists.freedesktop.org>; Wed, 6 Aug 2025 03:33:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=E6ZxrCjqBVtepsO7mQAejcOr
 0b+KcgjVHvwf5asrNsQ=; b=XIDjR8lFhqErTT2U2/ak4Yt42dRDv7vBONTj+97u
 HsrGQ3g4IvW4ZSyI0r23vHX6ok1b67UEs45SnOuTSELlmLEGOJlIc/YMpqHcefsV
 u2z6FgrkxFmC2mdHwESRRX5LNZuZumSWaglAwCSUlYpqrUcMUupwSC/KHz8T2ObT
 6KY2xphjdwjuU6WI9mZBXW4h6Sn5lpuATBOa9WzHNPt0SvqSQqVG8/997ltZ/2ax
 KvYufXxdKxDZ45aZjaIyvBDUHSWB+udPrRWXM5pSrygQJTLJElmqi28jmxwuhDKu
 L6fGrpe+tIkbKAfQhSiUzW0ugDSw/uHyMAzDfWiSkG5DNw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpyb994j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Aug 2025 03:33:04 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4af18aa7af8so80232721cf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Aug 2025 20:33:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754451184; x=1755055984;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E6ZxrCjqBVtepsO7mQAejcOr0b+KcgjVHvwf5asrNsQ=;
 b=D+YWevUUxVqEZX5jMmg71O0oT/ZluaqtHJtN2Iyz1x/9a3CXmD4nc6whS3/pH0HxBV
 NzmB4lHiwtC/5+KChDJtLbyhOpLb0wnTrWnRp/cBXkTsbTyeGV8kiVmzTcPrXIUBMfe8
 cgslfld+59A3fEKCf61HSYcNT5/fM3ozZY4tSAql+AStrl2H17AbEQCCC4UaS0YhGVQQ
 MBELKsxuzway4JUoqRf/TLWB6qWWWAbCT6fFDBmpMllfQPq3lKE9+moQ1pjeRe9qTCK6
 zfKhgmQdCJEeaoRkNKV7eDz46veAJux7F4X0n+1TzZuJB9PMI61jwkWS616lomP6IhmG
 pFFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDNouTxMo+jFwHHo1Xq2Tjcz7x/xncR6YamPqj38IOG5ohPBW4RxeGfuihVWV0PQhA0LTMjChhMzI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxeau0I92ego9iExLJJZEpPujgl+tzUrNqyv7KBqdXlUw6P41Y+
 SUMqf7GXVczRtwgp4ImBHhXng5Ejwb1sSpvtwlgLCc1a8BpqtlEbs8dMKalL9ziLbQmb+GPJQqJ
 7vJtVGnyNWbtzJWGQOpb51YO8O/bp4brY2RQ1q7msf6ojvsAo25AYFzkvfUxMO/w/WvFpXRA=
X-Gm-Gg: ASbGncsB42MzgBmzIHC64HwGF3o2srKLGXjHaY2w8W0BVfbL1BrSvQnFDoJLtykI97m
 pJx8VyX9mTaxYvJZYZb11MC/ZIIxwtBaEzj/5wKPfpnpCqD2ooM29aUvRm7Z6m3EdPpzLse8qY/
 MvqZgCNGokpYai4ypcAe8Nywv2yrOn3LRVkhTmSxgbuMjUUwYWkQ3jfyTGFRLJQI82DobQ0RaH+
 gCPPWEDgXN/h+2vWEhEE2thPpOme5Yc+DMTp4WZAb/fdhpU0RXxHGHewTIHD0fuSio9PNNXs2H0
 UrwfoDlGT+TPbmK4TbIpXXl/Afxfh3h80mBaTuhNPsa42G8NeqKiiitvJARnsGFUDO9Zy5jEyJV
 yh5Bfao6HtTH/JomlrzM87/Sj7FPXJiIRVyDc3Me5JGE7Vmb/wkgr
X-Received: by 2002:a05:622a:11d6:b0:4ae:cc29:82a2 with SMTP id
 d75a77b69052e-4b0916256a9mr15640371cf.59.1754451183438; 
 Tue, 05 Aug 2025 20:33:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIwhF9FkF6BS9ElI024cVRv19Q5ymyMG2vkjQdqC5u3HaOqDL9TDsvnsZAVpO/+YTwS4Uowg==
X-Received: by 2002:a05:622a:11d6:b0:4ae:cc29:82a2 with SMTP id
 d75a77b69052e-4b0916256a9mr15640001cf.59.1754451182812; 
 Tue, 05 Aug 2025 20:33:02 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b8898bdaesm2164581e87.9.2025.08.05.20.33.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 20:33:02 -0700 (PDT)
Date: Wed, 6 Aug 2025 06:33:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 6/6] drm/msm/dp: Add DisplayPort controller for QCS8300
Message-ID: <akeglwafbtldzbqwudwsogrdw6zsxua7ohzkkjxqrw4d5uwhdt@fdbqudkqwpe3>
References: <20250806-mdssdt_qcs8300-v6-0-dbc17a8b86af@quicinc.com>
 <20250806-mdssdt_qcs8300-v6-6-dbc17a8b86af@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806-mdssdt_qcs8300-v6-6-dbc17a8b86af@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX1LXagmTmOorV
 zrFGbwgHNwdGUK8fkjODtHPplhQNDZ8exqikgBEUHuX8iQXaX5m1WO091q+2erqY+wU5pbb8B1V
 Bk1Qh+A7pozsO+fajRF+rGiedyUgS5gNBPStkNQ8FHSgsSDnWdGz42NzFiIb7KAYFUTLY72Pysj
 h/q4qsT6UNLtI49oAClD/eB/yJD52KcZRH4COwPQLUBPQ6C85yO45PlUHfIn3Elemv8cJ/fSURv
 JB95GAurn/JPOaebk9h8EvUcYuaRTKXfbHX1VAuRUxv/yMUHy+RMOQNSWCZb1TF5X8X8hLwM/BN
 69hYQ2LNRBEwsJ3ioV5Kyrrd6qr2a2Gkc4nVEguXKOjTeoOtveSdPahYP9cJZlVbAPNkIRT6crN
 GJXUAsWn
X-Proofpoint-GUID: 2yUuDX0OVx23N6SJ-yLt9kBiprf6Xd3n
X-Authority-Analysis: v=2.4 cv=EavIQOmC c=1 sm=1 tr=0 ts=6892ccf0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=2iKMfItpbZzF_GTDK0UA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 2yUuDX0OVx23N6SJ-yLt9kBiprf6Xd3n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 06, 2025 at 11:16:50AM +0800, Yongxing Mou wrote:
> The Qualcomm QCS8300 platform comes with one DisplayPort controller
> with same base offset as SM8650. But it requires new compatible string
> because QCS8300 controller supports 4 MST streams. 4 MST streams will
> be enabled as part of MST feature support. Currently, using SM8650 as
> fallback to enable SST on QCS8300.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
