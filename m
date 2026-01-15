Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63169D2389D
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 10:30:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE0710E71E;
	Thu, 15 Jan 2026 09:30:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XwRmoqbs";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D/Pqis3j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9A4410E71E
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 09:30:54 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60F6fjGT1850838
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 09:30:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6UFfVn4U9hhL7GUJ/TzKS7TheZ9cYLz0xB+kdpbIWKA=; b=XwRmoqbs/d+v5A/t
 JklcSpWok4LGHzCBTmDNS1eA5Y/xK7NQmGNfdxzyTkDDsM8Yn0SBmar9vQX04GhP
 CwZ0uLlKHBpPj3dAKZGq8fYjZUxXa1aN7roM8ebZWk0tTyXJbL8WbM9Yj8ZdhJdp
 rnKWNMefi9FZZnR1sxNJCHGTbD/a0lToh2ikzH6KgrrvY7A2r/Tt+hM1NxT1B8yU
 gKhTFenDzFV/ffLKlPIzw2CAh1Blqh5s1ptLfNEGQbmREOUHhRDo9h/OOi8XOeVD
 nzqwXClqqn/fHaFkQoo/dZavxuQKN6Nf3GYM6hZTi2kZKjPjKP4hvgC1XKhoaLL5
 +1i5Fg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bprej0wj7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 09:30:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-50298ec536bso1063721cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 01:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768469453; x=1769074253;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6UFfVn4U9hhL7GUJ/TzKS7TheZ9cYLz0xB+kdpbIWKA=;
 b=D/Pqis3jPpli9KPDy7H5xG/tBNEGzrbuyi8otV5bc2o/zypjwybqMg5fYnSydRjTcC
 /1PNqSvQEOHjfi8ywANerf3BsG0e3oCNLzj/ChbZd48fpuGQ3nnHgwKEl6ijMl4DFKIM
 6x+FC5Qna7G4VgjPrkQjuMSV/zN0YMP7m+7DzW4kfZnyeC2tKNJFuTitzZs0QHTW1F3o
 D+ZvvorMf/QJSdwFZCkYyJnPE0Zq6bDttwZlz32KqgH2B7otG6EP/bjBeUaXcHBTfwb5
 WL+XjhAHfDcv/FdtvF5B8wP/Cj9jgUZz6yNq4K/fHWOG2Dx+fhAFtwluq8rweGxCf0Ds
 w6CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768469453; x=1769074253;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6UFfVn4U9hhL7GUJ/TzKS7TheZ9cYLz0xB+kdpbIWKA=;
 b=RSTVBVRR61XeOqSScxtsNs4NQFiQFEsHO7dPcbJXarLsip+q3otX1SdWAiG8Me0IzY
 6WzbsQr2e4aYID2XWF2RLSmMb1G9poXafuKcWHJPwsCE2/yFONtaAW9LgSN9eNxFf6y2
 pzyUwjjGIMJqTaWl8Gl+sk0MgUl9HXrHCZuplcTa5lMEbtBCgubtIcRMioq7juVgJyNS
 +p7aIju2sVQDSnwpUkODhHwOsK+BTy21AIYYUePLcaU/VSz3x/r2VNw/HkDoICQ+8ILk
 l8m7flhZPJTn/glmsN+cXFSwsEZsO097FGLZ+uRK+htif21xD+MWEHvER64mvwqAsCAX
 a14Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgkaHSMOnuEIVm+PMPziuE2XB4+3gzrbKTsa0TI9bcXPtDgFFz1iotgzW34a3QFkEViEVZi7YoUEI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzv4ESWFMrXHNGC74T2aC2ZkxWasD6L+e1S9gvWn65gkbA9dyxI
 impf+I+por2/V6B2ouhNE8fPUHrdOiTpELZx7gQux83Qo0uucIV14j+ueE31lV9idXxS7YhYGda
 aQS5vxRob+3chNhtT/Efy1R8z5S6i+oLnB5jyvLPsuVho7WA7/ZWKsg0ybNjEUIKSRSP3qMM=
X-Gm-Gg: AY/fxX5sZSiKyvE71FhhJa6UnbsQuBXheVCRYe8NJXI65cXqlb5c0eRJcvYtOoOxwkA
 JiBD1f7BqZQgWCv5QWZr0M6xhuilQkkebyqnFebFaE7k+mTpam2e+RbGuhzPKB4IjkXSihWAc6/
 sIS94AwQ+2t4ac+2bRE+7pRpMzySqe4yDRd3rfQmgSs7i8QSsnBPS62NfbV1SMNeSq6SOJPWDBw
 5JOqJLIewUOJjkVzeomrMNHCDMSCwE3Hz/QCDg2nZ6shJFgO7/8LgxTqaoJ5NY1gwsApGpnLiKK
 UrlLco/42rEcC623iIyYpqFRiPimBa3i7s1B957y5Fk4pAgQpgDTsD2oMUSxaZxKpgxVi3bT4gj
 M0w9h/N8/YxNvc6X1kCejuli2aeJ7LcflbeBTmzy/ECoU5Mq0e7uSR60a/OrMqAr8Wog=
X-Received: by 2002:ac8:5a0e:0:b0:4ff:b757:1210 with SMTP id
 d75a77b69052e-5014811e52amr57935601cf.0.1768469452982; 
 Thu, 15 Jan 2026 01:30:52 -0800 (PST)
X-Received: by 2002:ac8:5a0e:0:b0:4ff:b757:1210 with SMTP id
 d75a77b69052e-5014811e52amr57935311cf.0.1768469452547; 
 Thu, 15 Jan 2026 01:30:52 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65411877707sm1934109a12.1.2026.01.15.01.30.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 01:30:52 -0800 (PST)
Message-ID: <5b4870fc-911d-4574-a0ce-59428cbdf103@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 10:30:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] drm/msm/dp: Move link training to atomic_enable()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
References: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
 <20260115-hpd-refactor-v3-4-08e2f3bcd2e0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260115-hpd-refactor-v3-4-08e2f3bcd2e0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA2NSBTYWx0ZWRfX6Xsv5EY2wdR/
 DIyvnphp1aDmt5srKOpJ/jlPHXkSflDQkBkAyQSbI7ckFUXYgw4eT7BHN5ex0j35Z3WqhS02bYS
 RlFZW+N746nguJjPVgxwZQocvjrfo4R93ASGjp4Ts4V4ogx61ADdHdzRhMNPpRaDXaqGBDcIfg9
 bJA2sbxO196+7nqJoVkIro9U5EjA/2EuM92ciukdThNEAYMHVEKzPJWEilMca2+qBPh7G58pL+i
 Agaf51p3mRJIjTI+gwElrfjHgsSx5XqZVqNFpNWy9eNBZyVbDrCeJTj8Vw/MyxBWja+10T/nLUp
 G/zN+Rh8/RtA87soaxb8Vh0dS6EexqBP4i4Lz0IrW1k4jcBlyc6UdcvILwjtAyuKywBwckQdQue
 hJtvuqePl+gX8Gk3WC47MffDHgeyqujJEm4DEQkvLp32zJQzl1ndMBvP029cKwYoHtP88ZvxPeP
 Yd19JlKTnA3+YNbesdg==
X-Proofpoint-ORIG-GUID: K4ij9dOcaJkRdd-X-lHno5nZEDl4mzhw
X-Authority-Analysis: v=2.4 cv=Rc+dyltv c=1 sm=1 tr=0 ts=6968b3ce cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=tir8h9pnGiVj9xZly-MA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: K4ij9dOcaJkRdd-X-lHno5nZEDl4mzhw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150065
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

On 1/15/26 8:29 AM, Dmitry Baryshkov wrote:
> From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> 
> Currently, the DP link training is being done during HPD. Move
> link training to atomic_enable() in accordance with the atomic_enable()
> documentation.
> 
> Link disabling is already done in atomic_post_disable() (as part of the
> dp_ctrl_off_link_stream() helper).
> 
> Finally, call the plug/unplug handlers directly in hpd_notify() instead
> of queueing them in the event thread so that they aren't preempted by
> other events.

I think this part of the commit message no longer applies 

> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index a05144de3b93..3184066adb15 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -436,11 +436,6 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>  	msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
>  
>  	msm_dp_link_reset_phy_params_vx_px(dp->link);
> -	rc = msm_dp_ctrl_on_link(dp->ctrl);
> -	if (rc) {
> -		DRM_ERROR("failed to complete DP link training\n");
> -		goto end;
> -	}
>  
>  	msm_dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
>  
> @@ -1695,6 +1690,12 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>  		force_link_train = true;
>  	}
>  
> +	rc = msm_dp_ctrl_on_link(msm_dp_display->ctrl);
> +	if (rc) {
> +		DRM_ERROR("Failed link training (rc=%d)\n", rc);
> +		drm_connector_set_link_status_property(dp->connector, DRM_LINK_STATUS_BAD);
> +	}

Previously failure in this call would have propagated an error

msm_dp_ctrl_on_link() enables mainlink clocks, so 

> +
>  	msm_dp_display_enable(msm_dp_display, force_link_train);

IIUC this will crash the machine if the above fails

Konrad
