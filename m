Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90776B3AE43
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 01:11:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99C2B10EAF3;
	Thu, 28 Aug 2025 23:11:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="d43CzfJk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10D7C10EAF3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 23:11:26 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SLWcKh024959
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 23:11:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=CcwPb98D2xg5sUyCBoeco6KS
 Je0ON7jV0q8gk3wftUg=; b=d43CzfJkVtNCcnXvTigbg9V2wZhs9tPvt3pGpY48
 UMtN7J9Z3LNjTXjydLSp1gFM3mmRW+FKQverrMHoObEWbtNKOvpPVszoUy5kwjnE
 lj+5+S4hExYK8MW+4ruwCCFZ5j6rwtDoIYG6zNKtleyYQuNot14ymqJexK20uWqw
 x3jJt1zKSPb9tHFJMl0Ss2O0/KZ59UAiw8mwK8Ax52G9Me0Tigz4ERp/IKiJsrWW
 RowNZtFJeEf1klzJSd9G+DJtizvZ+VxTpdrD5/Z7v975jxRM9zQjyioumPbd7tq7
 QQlofmvZrRGQbzU2a0hX11We+jnezP+nFvJDwGXCgwgjeA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5w327re-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 23:11:25 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-70de47323ddso43071396d6.3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 16:11:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756422684; x=1757027484;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CcwPb98D2xg5sUyCBoeco6KSJe0ON7jV0q8gk3wftUg=;
 b=F3QhF/IYrKZM9XN5DEWZ8XbvRE+ubmkTG//QHA9iGAgEE201R4PelVKX+ntCd68Gzk
 JpQuPzHhyT2Nw+mUAS0kpkM5RVHia1PaT9DzHlWl/Xg15eh219XU6jlBiAaIr+fUtbUj
 ibWnwVU2kRbL/NmLUgbjfVJ19UWqd4Wm9N51SLW+rwqEVhqmvwVYBQRtTubFGXb1BSc4
 ffRV7K3t6NkZgBx/Fuq/Ewl1HSAKL6ujGS8t5VEh7If/6kK3b0s1KUlGhMG96KCajpJ4
 3XZ/P3CI4fC4DCoZEIFxuZUah+DU7iYVg4yn2K3kLEKRRWfXUWM7nIajz0v3ZZ8h9aXZ
 ZNQQ==
X-Gm-Message-State: AOJu0YzZ4b+2XHRiMaOHTJ0j8znEv9jcJHjwKeA+n4Dw3xuA6liXRf8w
 jg7PMIsy0N/H3pBzeGy+Df43ZZGofYl7z0tgtYpDjHpwpVh1X7hmezjx1B6aAjRTrQxyVLICSqV
 0CczQG/rHkN0bAqQ7uzf7uotqpHas/HewquIrNpcvrhh+SdnUQluiilBT11vJqBYPTeAKpYI=
X-Gm-Gg: ASbGnctvwRG3CLLPeOuiRUWjd+hHc4OGwW0MUzFW8zYiHEHJbxudrrblxxr2IpGtgL6
 j4wKI4h3rh9da7rtrkq4sh/2X8u5W/EFGvv2IdJIjan0sgQCy/eIpBpqKEj3WwusNgIwg+q63gA
 DfL7JuwdNPz3WClcVXVISlS7iHZ+mdIFNLc9m1dlfIPM/ms+mp9StFT8tZi1gFNPtoQWwNXTubW
 N2vCTZnUKJUCr0hH86yYVMrbkqmlfyrfSzNiZ9N+qIFarIsUP48z1KZP1ajSlb5TJXISGN17+4o
 ijDYQrv/anVOx6o55lME2IMjDr8rxN1iTxSzCOYxpSA32X+MjVM7AkLFTr/JgNnvrzltSj49PAM
 Uqi3tZJOniqdJK7KYMW+c/LsAt4LoAF3AtjFKC2FJCHrlFS3s0xw3
X-Received: by 2002:a05:622a:5793:b0:4b3:4d9:1a20 with SMTP id
 d75a77b69052e-4b304d91c8fmr37454661cf.46.1756422684211; 
 Thu, 28 Aug 2025 16:11:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhgdun2fn1jFqmiQbfyBvO+zPjYV9lB5FdqpEXRjyP1PtkoydoYjW2c/bS7zgz7W252CkZPg==
X-Received: by 2002:a05:622a:5793:b0:4b3:4d9:1a20 with SMTP id
 d75a77b69052e-4b304d91c8fmr37454411cf.46.1756422683667; 
 Thu, 28 Aug 2025 16:11:23 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-336b4613c10sm1461051fa.1.2025.08.28.16.11.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 16:11:21 -0700 (PDT)
Date: Fri, 29 Aug 2025 02:11:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Dan Carpenter <dan.carpenter@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm: Drop unneeded NULL check
Message-ID: <l5t72pobsea2mcsulxsomrqpbeezj22vdtp7gqg6zjlqwzkjgk@p624paf4vhn3>
References: <20250717151202.7987-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717151202.7987-1-robin.clark@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Z/vsHGRA c=1 sm=1 tr=0 ts=68b0e21d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=-2mmMjQWwNZ6YRhNbUMA:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX0FF3NEWFCd4i
 yUlSoVxvwC3z1ck887dGAJnDvY+auNQVW/Gtgd6agoN8lLRwNkrpfPTvAxK/DOSXyN9DDanQzEM
 hSuNyTJv/8Qn+cm4D/WrpNvS/Ps6ngXUnW7MRnKxOlxT6h+aoUMYnaTtkDMSxJbEpvHo/idTJHT
 gOeqvl2bHsFQhFdPPxMnqZ+u7y7wuBociV2c1SqLxZiPcPtEB1u7iFKZvLdObkrP60Dc3/nILqZ
 T8hV0iSXbs7uWucSR/0aMvRo2cBICQu7M/99AuyNjcfzMTDstAIV2MRy9XGXmVIP1+0kvxsu8n5
 8DaFpLgQ0aisFUDQDbpAte2AOX0PPj0erRu/+ssx/7Z3r/t3UxNyB0LEBkk9/svOdXZiHPjgSLd
 Lpj1xVch
X-Proofpoint-GUID: Ui3PWQH0nNecVoRZoTbbTKDKKvXis7kl
X-Proofpoint-ORIG-GUID: Ui3PWQH0nNecVoRZoTbbTKDKKvXis7kl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
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

On Thu, Jul 17, 2025 at 08:12:01AM -0700, Rob Clark wrote:
> This is always set in msm_gpu_init(), and can never be NULL.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
