Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 072D5CC9F39
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 02:13:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60A0410E330;
	Thu, 18 Dec 2025 01:13:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JnwbxRkw";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JUHgsnrX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C08310E330
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 01:13:15 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BHJAvXl2927132
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 01:13:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ODx0DDClD7oE2D8NZwf9qUCT4cF6yooKb905lWB79gk=; b=JnwbxRkwH3ltLFpg
 x5yfuTcWFS7O6EcGPG9iw2y6huWAY/NfOCbddXTUzRtHjbR3dWprW6Bu17VVa2+b
 JWKSxRLi6YAuuoWhaD6jRJ9GoM35uVqOkWmrsITx+TvqDzYNKbRQqDZXo3XG8dS1
 /KCXBveqK9N9ysd5g+QxkQ5RuF05eyB05Syef/6xLbln2kd95tFbuJ9w2Xwo5Ox/
 nlbTN0Lp5mLMEyHOKnnBWGbz95Vj1n9HXdv7mEueqDMV5X9OWNq2Q1p1NybbEhc5
 NQuyqRWJgOlYL3vBKMM3pyhPwGuLS0czyKILYomkdSBvZJuH+DakUQfYAdTYDISC
 4Q/Nzw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b40n797xe-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 01:13:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ee3dfe072dso2384631cf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 17:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766020393; x=1766625193;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ODx0DDClD7oE2D8NZwf9qUCT4cF6yooKb905lWB79gk=;
 b=JUHgsnrXL1qnMh+msHN41Tm8V5/hUqofpeq3bxVuYNd/cQmfN8jLx5qH9MlDwcMDWY
 seRguSm453Ws+pdA+tTMjB4EgWj/E5AUlTgdmsEYrJEB2Oi4+SJ2TPVXtHs8lJmDk5mh
 JHclsDfXvqRFMxtopzQjBKOXIM49vAbJBfAOGwO/ulHBorT3j3LyeCwnYsuwKQ+3A0WL
 D3ZIgSlHBI6kEs6jFH0yL5FTEmhxNWRiMRo8S5TDk5W+PCUKubdatl8zNmtLia/83IkW
 F+fqOk0bMj7QPG33gZe7ovtyffVKGZUvedcj9KB+hQx2CB7Pic6IiKuV+b8k85b5xl5Y
 l5Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766020393; x=1766625193;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ODx0DDClD7oE2D8NZwf9qUCT4cF6yooKb905lWB79gk=;
 b=InrZbc6zEfMFipQMraaUcZp90i6WtGSCrTjs9FL/9AvgQfxNr//6e+GapH0e0SKX5k
 fXd1HhrkffMF4IAV8M0IxgBpB0rTDG/dAaEyI1aflFa2BhaWEBDV54wa0peF+Jm2Rhyq
 xJYhy188kFjyo/ZNkieB6a+i7zK9DRr9IuoFtwZqhH5XtIiD+NE4Hns6VkPjjnyGVkfi
 9cbeIcW8aH2iMm3SmsgU0pHvm6gXsCGTzGWbSNukOvFyDD7a8M4E0q8Fp8IeT6C96zyz
 ZX6kgVnezPydHCiTJ+GWMxaoLRV/9dlx15C1hTh0wkn7TdFkUYh18cVIYzn5fNg0ktZs
 7Bxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/ik/5odaWTDC5xmRt7OD+lnj15uevCjiJaMsfdXdIH2ieg11YXsbGorAItbxM5QDgoSokllyHAn8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyaUwXL5/36V56FYH8YGqDzKp+jFkZs6neypHFoVEbPOBE7kT7a
 ioGl+/qRKKw1gMfqRkS/OSPI/n8V1BFlzPRS6N0Y4kpqNedsbIOlJuvvU4h+JVKFJgBs+p12Kq4
 PCXXzBRMGhIdmJ9wGsjdsb+h9VTjI5Ch0FMHtysdBR/fiaWlsTewCIK34mipIrXYsr4LEgDo=
X-Gm-Gg: AY/fxX4bFnW3+zHHvLCh0n0hKxUYjDBr1mL+E9K89UskiwWT86bGPsaME1Q5Hc+8kb8
 9foZSY3uLyt08KzRDO7Gs9odODIwarKGbCNSGoK4AJjyfp6ZjUWMiioW15nmfXePNun1dVF/mFe
 IXrP0VM5p3NNIebyQ+rTE+pys1sJCxYCiId4pWUHB2a7xiHuQvSk887+44CyVFAzqJ0SiAJGnRf
 lkXNqHhSXmG+gExkCNih+EYYQzVcIUJHnJcl8q4BSve+qR2cxBHclltWl6x/nS+IxWz1fOgpz/2
 FWx2/yWlE6PEL8p7IiTrO5LQ3KMRcZDTwn4opWlmDrc5Yhkg7gvDj9Y/Yz0hR7K1AKF9JGC0dUM
 fhokGjliqtfmwG3PUnw2WkNkS5lCLn/IkwfFJ2n0f0A4I/sGQihM71j95wOSPK/fRqO7F3kxLNf
 /3C/xiKRqfHJ0yRIJ6HvE5rNs=
X-Received: by 2002:a05:622a:5c16:b0:4f1:8458:2679 with SMTP id
 d75a77b69052e-4f1d062a568mr320752741cf.60.1766020393147; 
 Wed, 17 Dec 2025 17:13:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH8kzKjigPADnhYvAQQ3ZNwWnZ7myCpFKgi4W4FArGCcVgc7WHrYz7CkY/anZJ2ACGtwLCPUQ==
X-Received: by 2002:a05:622a:5c16:b0:4f1:8458:2679 with SMTP id
 d75a77b69052e-4f1d062a568mr320752251cf.60.1766020392613; 
 Wed, 17 Dec 2025 17:13:12 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3811374eaf3sm4082291fa.47.2025.12.17.17.13.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Dec 2025 17:13:10 -0800 (PST)
Date: Thu, 18 Dec 2025 03:13:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dale Whinham <daleyo@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?utf-8?B?SsOpcsO0bWU=?= de Bretagne <jerome.debretagne@gmail.com>,
 Steev Klimaszewski <threeway@gmail.com>
Subject: Re: [PATCH v2] drm/msm/dp: Enable support for eDP v1.4+ link rates
 table
Message-ID: <chu5gqcvhqpeve7coitjo5iqf5n5cqipfyxpu2w5dm5tcjp66j@n3fg2qrgkara>
References: <20251218-drm-msm-edp14-v2-1-2e56c2338ab1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251218-drm-msm-edp14-v2-1-2e56c2338ab1@gmail.com>
X-Proofpoint-GUID: qEUhWwSOUa0lngmTf-mSXmh82180LskS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDAwNyBTYWx0ZWRfX2sNlXYK712q3
 lRDWQ/hKhRCbsGaA3Oiiu1mOlUUDP+lf/G1GAWMk+kCS4vl8NO252pGdsBNwM1Y/KetOCWBgVA9
 sSke/nR767ghN58hPdQ7ipEM+dI65rNeee911N1sR5tJ+2aYAN0VEh2hOxJ5d81xcuKA8WOVzO6
 TItZNh2ZOkf3Pp/iplsfrH99jhTjWS3IW8ZXooiC3XhAehhOl4ZfO8oG6lYJNpJY4pD+AeKTbaC
 SRdTSTJ5nWLLF98eCS3kUsjCP4aryzAlZesL3ymbYRjG7I11z1mSL0xighsqrZa8zMw3ndPNpNW
 +LBwpa+kya2V95fcUj1nWJYJqfzDGXW3AeNnVlBc6ErHF8bcYKS5v1zXsH+VEvoOlsI5KV20awQ
 ph78DwNZwmcK596cUMqlMZpm+pTLnA==
X-Authority-Analysis: v=2.4 cv=TZebdBQh c=1 sm=1 tr=0 ts=6943552a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=5AQg0nHepjwah1_JwOEA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: qEUhWwSOUa0lngmTf-mSXmh82180LskS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180007
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

On Thu, Dec 18, 2025 at 12:19:32AM +0000, Dale Whinham wrote:
> The MSM DRM driver currently does not support panels which report their
> supported link rates via the SUPPORTED_LINK_RATES table.
> 
> For panels which do not offer the optional eDP v1.3 fallback via
> MAX_LINK_RATE, this will cause a panel probe failure (e.g. Samsung
> ATNA30DW01-1 as found in Microsoft Surface Pro 11).
> 
> Detect eDP v1.4 panels and parse the SUPPORTED_LINK_RATES table when
> present.
> 
> Additionally, set the rate using LINK_RATE_SET instead of LINK_BW_SET,
> but only if LINK_BW_SET hasn't already been written to.
> 
> Signed-off-by: Dale Whinham <daleyo@gmail.com>
> Tested-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> Tested-by: Steev Klimaszewski <threeway@gmail.com>
> ---
> Changes in v2:
> - Re-ordered writing of LANE_COUNT_SET/LINK_BW_SET registers to match i915 [Dmitry]
> - Fix detection of eDP by reading EDP_CONFIGURATION_CAP and EDP_REV (in v1 we were mistakenly checking DPCD_REV) [Dmitry]
> - Link to v1: https://lore.kernel.org/r/20251214-drm-msm-edp14-v1-1-45de8c168cec@gmail.com
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c  | 56 ++++++++++++++---------
>  drivers/gpu/drm/msm/dp/dp_link.h  |  3 ++
>  drivers/gpu/drm/msm/dp/dp_panel.c | 93 ++++++++++++++++++++++++++++++++++-----
>  3 files changed, 120 insertions(+), 32 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
