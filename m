Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 761BAA9D11B
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 21:06:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CB3E10E99B;
	Fri, 25 Apr 2025 19:05:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="buHlkdeU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 586AE10E99B
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 19:05:58 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJrwd011050
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 19:05:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=LRv92KOIwcjmIzz9Q5TxqXo1
 6+d8D9ntGnUnJ9cFXrw=; b=buHlkdeUCX2IhNHrdS2sz3oiWrOK1CJJhiiCDn07
 fUt8T4w1jDWuxz5UY4UXBWypUlbeIc/b1tvICgWaYNHZBBXoTQH710SjWvxUHs4e
 eyt2LBwVssiGYbKvZJ48NSSOA5fDrKCDm5cqN3SWS3Mc0CsoYZlotSRNfybmXaMy
 pWQkMWSFdXvEK5e+rhIuXaGiYx+S4GsKDPnDO7dz5PCU/55mflf3vJhAuq9s7jDE
 0t8h24AyKNI7XC+7EN+Sf+tSE39282irX6309eWPCJ0tjkg3Qv1S8USTGFEmOvsO
 VkYdWLrjb3f97pdnBXWdR0rJbux0j/ZP+kVNfCWkvnIJwg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0j7ff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 19:05:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c9255d5e8cso456097885a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 12:05:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745607956; x=1746212756;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LRv92KOIwcjmIzz9Q5TxqXo16+d8D9ntGnUnJ9cFXrw=;
 b=pvxpqTs3V8ng0Sp6122DPjsAUoVck6mSmmis8mxld2IpzP69FXlo02LcDJO7jsVOwf
 xPXFVMX7Cl0KztzqfbPM08Piw+crW/WsUNOjvmMgmX54supR8AhLm8nYgYJrNu+xqDUR
 9ZvienE7zvcyuFN6lm1TNT/iap6Jsn3eTO70rtrUo0cc5y3aJ5UkkxGPlqDU+8OvUh1H
 0F0n3aRFIEcTlq+MWcRAiCqpEEAumRWe0LieFwCNDP2w7AAv4MF3/8hQkyXAAcUBIGXx
 tzX7yORAxrUZCu63WFjMpsvUHKd6bDhdT8YxOj56bsHwLhq5PNt2U80byc1P3sojxLyk
 BZaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSCaszBUu2SntWCCZxCRVm6USlF9XHbudIomEdbi4OrgzVKDtn5ABuUsnF3ylXfpn9W2IRJG5LAwQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyFtt7bhCF1qTMtPNR5zP9mz6XX0BbBKzZA4FhcF9zJNHv1ExeO
 wviUc+vbsshIAenzkwSyktDN7mwZNDO9jtfR5rb6BuTGf+CXdFXdBTBwyCf/SiSk5J+s2IHGiW4
 Vag4LFnQG/BUlNavEHwQdlSADvEnOGrZQ2C5MkpaYDin8/hr8rLN2XsJ/xsU8TRWQVXs=
X-Gm-Gg: ASbGncsDq7Pt62WqGveSDzHujFmbHvZQ9M7UhK1Kv6L7xbxHBAU7KIKvEs8XyVARbb5
 Vs/i2eWoBdlwwLOMMkQZEWYc1MQH+y6LjHKTSOWYuEd+4bzJpn0SSrcsyf/9QqIOq+MLQJjrBKl
 spP5Tb5znq8dVkoFEpao7+/2iLFryNiTSQPTdkCO7gEd/9nFNs7lP40EZfcvjysCnRMmzgHPh/5
 Jx6EjNgyDFE5pD5wNUkNqsV/pdY3YKwHt22cwW3VjlmAMdCEXl4iuB557E6oWbiIxjGI7K0seON
 HgXZo+7wjpOGB/xOpGOBQK0YkMscCC5TPMG+c5GH7EV+69+4oXzOVWhTREqHo3pUNo74UKzBoXg
 =
X-Received: by 2002:a05:620a:4103:b0:7c8:b141:29a with SMTP id
 af79cd13be357-7c9607b23d1mr561079485a.53.1745607956408; 
 Fri, 25 Apr 2025 12:05:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSIuxa3fWgHA8r+nKVNS0fd/thKUyHE882nF18+9xWUpORLb5D/kIP8t14NpMUJ3MCW0p8BA==
X-Received: by 2002:a05:620a:4103:b0:7c8:b141:29a with SMTP id
 af79cd13be357-7c9607b23d1mr561076585a.53.1745607956073; 
 Fri, 25 Apr 2025 12:05:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7cb3bf7dsm692860e87.100.2025.04.25.12.05.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 12:05:53 -0700 (PDT)
Date: Fri, 25 Apr 2025 22:05:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 laurentiu.tudor1@dell.com, abel.vesa@linaro.org, johan@kernel.org
Subject: Re: [PATCH v3 3/4] drm/msm/dp: Prepare for link training per-segment
 for LTTPRs
Message-ID: <kawx45acgpl4ywifjnszqhddtq363etjsyo4jomg7mbtqmmtev@nqghr5rtsoen>
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
 <20250417021349.148911-4-alex.vinarskis@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417021349.148911-4-alex.vinarskis@gmail.com>
X-Proofpoint-GUID: 63ZgLjH1hHWMFFB14fmJYbNu0SStYb-o
X-Proofpoint-ORIG-GUID: 63ZgLjH1hHWMFFB14fmJYbNu0SStYb-o
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=680bdd15 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=-fZx5E-Z4OSi-0Z-ZQ4A:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzNSBTYWx0ZWRfXy2hrG5n3PR/z
 fGpoP/Zz9BgTjjx600LsgcZQYCtQG4YHKPiS0MTTHhTdYEpvZ2RoJMl+D0Rw92Ej27EuLiwhPUJ
 gmijqhxGgx1KiqIUN78GRE5Bdshd310WWIR+p+i3KfyLBcWR6wfF6DKr09fLqlAsFKVBUIHbhqX
 rT72TqN420vm0Qrqr2UBQqtanCbrISkfpM98jpbR6u7KjGNL9LbPHMOkNgnWhqGypjY55717Gzv
 a1OWoIoQmua8Y9bzaBvyWONy/LVduxK8Q/897yLBqT30YoYTzx69MYcAGiu5HzXQ/1rEFFD2Qi6
 I7FYTyaW70AlcWDAwhAnrmKAudzddhjrBl2DeaU7Z07Tf1xc770cHcAEyksSAc9s5O8EAVfplH4
 gxeQCvP10NItPS03dorNgsBGUqQkWQkoM8xISIRvK1RC4w/ePoSV0wMkKrAPNieBgbeXr9Sj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=877 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250135
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

On Thu, Apr 17, 2025 at 04:10:34AM +0200, Aleksandrs Vinarskis wrote:
> Per-segment link training requires knowing the number of LTTPRs
> (if any) present. Store the count during LTTPRs' initialization.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 17 +++++++++++------
>  drivers/gpu/drm/msm/dp/dp_link.h    |  1 +
>  2 files changed, 12 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
