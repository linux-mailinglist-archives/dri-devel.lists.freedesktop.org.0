Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EB2B3490C
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 19:39:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01F6610E51D;
	Mon, 25 Aug 2025 17:39:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z1DJUYCy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E5AC10E51C
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 17:39:37 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PHC6lf003654
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 17:39:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=oIsZvuj3zyqTv/yqZeIFq35X
 0m+hZSGafrokoFxwjBg=; b=Z1DJUYCywhGvuKF3VHAarB4nGAQo5JCQzmdMIk/w
 jgNGeZU+w5q1LRcxOYUCeBj+Xk4EdY+Tho9QH5/c4gthlFqDk8H2tvsEQMLHTxjG
 u8XnK4Wp7JmR8QD7UBM3abGObz3CrfE6i7qvKAnSVhD4ZF07U3dHVIDN2u0qy4DY
 TBJy51dxvM3G2yF+9hWy/upcNPXZvzlSxlJ8DxY3nQZD+6Y3aIIhG1LnVEUNq2Vi
 KK1eNBpBNG+HakaUvpCpp24OF/SDtck/B7EhzJGBRxV4KmFQIeOgGBMoSBnDieFq
 8YUTzpqXQ7MW/1uy8g6Z8qyAUdm3uQfiU4z84yzbVc3rzQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5y5duhj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 17:39:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b109bd3fa0so46818131cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 10:39:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756143576; x=1756748376;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oIsZvuj3zyqTv/yqZeIFq35X0m+hZSGafrokoFxwjBg=;
 b=wnHypRkAcBooIUkDuExVly8bvQ2Zla7NP7BkkpFczzrCPX5XLI5AzoxcVqFlz4kjhO
 vO/Eh0tbdykukrqQHmXEsF7kGzCVSWUcOxRmcTSxZB4Pvnl3EitiBoQZ+SFnntyiPT9b
 vFAITqSX3vhtlvfwS+WUmD7cDyAk+UYPh2WWpuMmSAU9mxoZUy0V+WYF7oJrXrYMsvZi
 Gk1EBgnDKE45ZxGoxvkPvNvN9NEA3DNXSxDZYTGOUTmhe/4iPZ6I84hn1Hrwl/rJY30T
 attsv2FcKZWdpkmHjLIgiChHehvxZ+1iUmpNA1YOMGbw3NAYF1V/ixCbE1mYX5ZA0sYA
 L/uw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsUU1diHGSGgouKglRGRabA93JVZ46izD++aI+VK7gsMEUlfShKVaRiLyX2dYNdVPo3o17eQns1Ik=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwiuN9F3OeOGSSRqn8EDHS7ZKG1GsS25OEO3ReiUToBO+KAtzvb
 pDYD+6qt8BFtqX7x1oFNRNoVE5dN3flI1Dvpqsxkb6gN8YkuAJ3bYh1z6f+6s8uddAe6/kofTqG
 Y8a9i9g52PTSPHzqc01V2hafaFvh5DLe5uMbPAwisUBxoO78LyVES0bwxHjxfML2PaiEVzFg=
X-Gm-Gg: ASbGncvHnA9of3iD4H7p5ghnP1+zRPDxHZUnUDuqs72ePq0+AjlRrtSPFWAB3nHaYK5
 7WKCsmHL96gY3YCo6b0vBDsS9l1YbDk5BeOTsKUYbM2Xi4HAmzCIeBr7X6qB41jfZf6K1Hu+Dsx
 Ou4ma3mnIShuxFTHGWE72b6ulj4DPmqWau636T54405yjDEuckrfpZSztoKKvXJf0CH3iQlJfGq
 sWCa5b0zgDb6ScV3BccYkz/HLfwbpA7mUG0gXAOUHW1PsofLKAi0MZuKeU+V41MRrPVfLUcJFHT
 AUIXKJf27OAZeWa05AcmxEyjxA1Ojieh0sUoniFXYw6pdzk9v82E4suOn88u+VzaYMHgMQ8CSkW
 XaLYRCmnYNCvOjhKp4IdkhPgp9ky1ol0jyhdsstLmbXey7cQrvurp
X-Received: by 2002:ac8:5e14:0:b0:4b0:67c9:fd3f with SMTP id
 d75a77b69052e-4b2aab20a48mr171262881cf.51.1756143576165; 
 Mon, 25 Aug 2025 10:39:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEu9ExTFKxMITOA8Nf6hgeYhq40ePHq4NgYZNNSuNB7d0GTcBRxbB53k6tbpruIYLU+/S4KMQ==
X-Received: by 2002:ac8:5e14:0:b0:4b0:67c9:fd3f with SMTP id
 d75a77b69052e-4b2aab20a48mr171262501cf.51.1756143575665; 
 Mon, 25 Aug 2025 10:39:35 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3365e5fc0c4sm17741041fa.70.2025.08.25.10.39.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 10:39:35 -0700 (PDT)
Date: Mon, 25 Aug 2025 20:39:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v3 11/38] drm/msm/dp: separate dp_display_prepare() into
 its own API
Message-ID: <rsywfefrwv67umbi6xeybelsu5u6xqyklvtarnoluu5mzz5u5k@bkexqpdd47ew>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-11-01faacfcdedd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-11-01faacfcdedd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfXy2gTXrDdXfrd
 MGbhjQwPAubPeMAI8YE53Bw+/7WZBmKNN/5xgXyitzPhEDcz9AdYffSm4wbDnyNHHEkmuzR6SYL
 YsPxUjlWvahesN7JwrX+tq1wOMDmAXMh2DWoicE5uWAB1YyJKWZhnUkX84dMmWk6CIp8IeOUqyQ
 QbKFiCCmLRwQK1oTIIfF5+UqjYR1YEfwLm4f7Ox1QpGgA+++T/kqx4f1fAdqZfYTBpeNVEehFsC
 JTpM3QiP6Df3jMoMwJiiAig6gfs2LhQyee1fOrQv1lAC2Mc2prJ9REmH7I41FmHl3P2R1+YXJxc
 o9kbk9xjwNWXrpO6aCJKM8/dqWjeeHk5904D3Ou1mCwxvq/zUJPS9hdboxLYGW59V1xfnFTjYCQ
 6ccFJjrU
X-Authority-Analysis: v=2.4 cv=Lco86ifi c=1 sm=1 tr=0 ts=68ac9fd9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=oD_kwPJ1Vc7tpeseQ3MA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: LX16IePdqa1dHOx1g3tpO-u886Hh3YC_
X-Proofpoint-ORIG-GUID: LX16IePdqa1dHOx1g3tpO-u886Hh3YC_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_08,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
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

On Mon, Aug 25, 2025 at 10:15:57PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> dp_display_prepare() only prepares the link in case its not
> already ready before dp_display_enable(). Hence separate it into
> its own API.

Why?

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 16 ++++++++++++----
>  drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>  drivers/gpu/drm/msm/dp/dp_drm.c     |  2 ++
>  3 files changed, 15 insertions(+), 4 deletions(-)
> 

-- 
With best wishes
Dmitry
