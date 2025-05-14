Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92563AB758F
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 21:16:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A74810E6FF;
	Wed, 14 May 2025 19:16:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XWhQUa+V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC2B510E064
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 19:15:58 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAunQI013086
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 19:15:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=CSXJafEBndEZ4eDNGwf9CSLO
 amluuCqjk3lNWaZUCTs=; b=XWhQUa+V6rN2CsgxftM/tNuwyqZIhh8kyre0Sm98
 fmFSfoT33+sOOKx2N1rtffKE450g9zKSMuezD3zxgx9vFLHlUVzwsbR40vxb6CFX
 vXWyEVBhbwIQkVhMmEhjsLFZ2V84ru3hR6v2Wx4Cmx3fOAoOPusOT6mU1r5GwfM9
 3FNRyCQggbDrFHRtbJK5/Tgzz58H7T+j8IMFrgKQx3yIQ4svKaamvPptHW6tYSg/
 YDYxuHqaXYmeoJoexQVRi5cl7uDntwhiyO3MebE47dcw1GpL5FfQevN7oAEhzCyn
 0hMoBRue/7NUAGNZHfHp+jsK6hOIdS+SEm1DdBefDvKgdw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcmkv14-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 19:15:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c5c9abdbd3so10471485a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 12:15:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747250156; x=1747854956;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CSXJafEBndEZ4eDNGwf9CSLOamluuCqjk3lNWaZUCTs=;
 b=xKWNihgcmtPsi9aExowY6drznmPUi60nq3uyKSFW70iDhvBBk6fkSP/MStAVdMNdkH
 uDAll0v1Pxn6wRYW7yqO9RS3I897N3lAF3T31naoMM+Fuz0xIt9BenPzzcROiEOyCwTI
 phy4Vv2TrYmF+DAkUK9jW97F+nBi4Fo7D1wXXTFYeuT2AJgLK0Ir+DTzKvvq9yc9NDBE
 x6sEsJLOWd+OqEQ2LgxWSxxzbD7Y+sgQr+S9uZ4vZzmK0dFtS0f0SGQXj5ueyP92T/J6
 s35YPNywO+mXcVQ79/0PG/acDuX/wtgFb0azyhl+q6N2KFqr+2Xuj3C6WuyB703Z0hqc
 hCZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1uQ9I1tqZn5j2HS6OhT6TaxesnEPQJOa+c0DRi84jeKi07ZDU9APjTuGXX0PHUpsoHdpmExpT8g8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzMBpmS+ocgAbZiGigoRzmzn0Ach1ung+8kONjY+lYH5RGM6cX
 Hhyo+bUJqaRft+htPZGXSNc5JqhwHYsrfW7U1/wWlicBzN0TNKAVSBUl4Guklu8wGLbyn2VEOH7
 K6ytIaLv6olxYbtInPvMuTCanAGd8C3bbexgZ+icGe6Cp3YXbPiDx9/Zhn4NnFgLo8PJ71HnvWL
 U=
X-Gm-Gg: ASbGncuZBgpl1lM7o3+AMWwKM5yM1UFyzZ0ooyIkryf7Q98qcF8EuA7oyPJVPzYq5EG
 8SlCW36lyMwmZvBs4DCHq42ZjlXu05mGqVefNAW9IQlTA3ATrWB+wGkWalhZ2489gTFikKd/h/Y
 mo5jvkDWd1cxw5eZKdhrq5mPttUISOLz2Vs7SfeRhLsc/kPIDosdlan1AJpDC4fe0jxBI+bX+AY
 N8TTX/aZJO0Vo+wpxuBYOXNE82DIfpPXAtCE7LD/WppfBQKcsUuGCaie8wTjeZtzSbkjMdayjI9
 WgvltkXmXpvqIplkPizzBkwecrW16lFSdZpJuVhFgsZ5Kqrlo46XSYlBqAkTrtHFLZKuW5inPQU
 =
X-Received: by 2002:a05:620a:191a:b0:7c5:49ee:86aa with SMTP id
 af79cd13be357-7cd287f8f48mr580084885a.4.1747250155811; 
 Wed, 14 May 2025 12:15:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+lsR3EGAqk/P0sGN2G8T8thDbUtAJQH3vvzCa+2jovpUXOQ2pgDytWPOHkOaAfe49pPOW3A==
X-Received: by 2002:a05:620a:191a:b0:7c5:49ee:86aa with SMTP id
 af79cd13be357-7cd287f8f48mr580080185a.4.1747250155227; 
 Wed, 14 May 2025 12:15:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54fc64ccb9csm2355737e87.234.2025.05.14.12.15.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 12:15:54 -0700 (PDT)
Date: Wed, 14 May 2025 22:15:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFT v2 09/15] drm/msm/a6xx: Resolve the meaning of
 rgb565_predicator
Message-ID: <3btixgw42sg6qm63znc46msxeyzvutitokb6zxbxwftxyyuyw3@22rlivbf4gvn>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-9-09ecbc0a05ce@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-topic-ubwc_central-v2-9-09ecbc0a05ce@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3NSBTYWx0ZWRfX0CuTYpUzyPBl
 g0+W5U/QfD1l/bVFU7EXqfnLAKMwoiNyPX/3RDXJXKO9Jt1xCbpFJFSTHvrsXpBCq9yOXZxcqKG
 EB2EmvUGN4BtxhrSzXGutDrlBGmyYSd62aCWwFE06F+nUZgNyPpcKH5QihhK3paSz1VRgNXAbAz
 6PeHflkS8Cis//vhrMTcG40KXIlBnu2UE/psfg6KteCBN998qQmfRnk3poVU8F+w4W3QBwViF5G
 QJjSJmZQdtxhhNuONKoyVnJhg1HY8ahnCV9iexq8Uw1KFCagVb16tQGW7c3c80cWbVBT4B8M3Ft
 DRp+pF0BHwjCXEJlAshu0ptFP5p9gUS24FofcpaBCQdJ0MT4xRoRJNqwWjKzHX9Mg/wEfhSOAzA
 +Zw//f8M9FBc/KA6MDVchCLNzzR8h5KZzqhkAtZROO1CFDbXNEXiAXpY3gpoID17H0iZRjKE
X-Authority-Analysis: v=2.4 cv=G5scE8k5 c=1 sm=1 tr=0 ts=6824ebed cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=pZ1cKns8_n0M6c_4lVMA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: Cm6WnCqkXPPWv0enMy5PQttciw0hHRNq
X-Proofpoint-ORIG-GUID: Cm6WnCqkXPPWv0enMy5PQttciw0hHRNq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=848 clxscore=1015 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140175
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

On Wed, May 14, 2025 at 05:10:29PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> It's supposed to be on when the UBWC encoder version is >= 4.0.
> Drop the per-GPU assignments.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
