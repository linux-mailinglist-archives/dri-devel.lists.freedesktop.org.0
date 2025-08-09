Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7746FB1F1B9
	for <lists+dri-devel@lfdr.de>; Sat,  9 Aug 2025 02:45:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7CF910E0D2;
	Sat,  9 Aug 2025 00:45:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bBvuEjws";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBEC210E07C
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Aug 2025 00:45:29 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 578ElV6V022646
 for <dri-devel@lists.freedesktop.org>; Sat, 9 Aug 2025 00:45:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +SdmD8y1mIxLj5DFoiniCJvWmuKL4tKZkoBsj7bVLx4=; b=bBvuEjwsd1/kxE2D
 ZDXgvJfxNQCPttMaRWVcjiODIqCxZdVCSSpeaPAL5y3oE/RF5yYvvLIBa4nE7ZDO
 o6s8aRij5d3v9ZeXxITxp2fjw62faOGIiDjghxKg6GRUQcNKT8qf/ZGzKf0iC9zX
 mAw/g+nQX6nCJcHmJYEQYiq8sem9vb1zoPkFtzH9RFYgUxqPgTR9BeqR8CpgVQc9
 pjU2ZXAHpJVB2tDAcp2K5aO+bBA3EpMb9O+nbANZHwtetKBcc3GznisbOvqGHPcC
 6JsWYTFOMjSS7HnlltjidLxb4dTuTLxVsGBOcIG/3ktdGD9fW8+KAO6fFHPlMoNI
 50leHQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48cs5nduf2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Aug 2025 00:45:29 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4af199d0facso76718701cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Aug 2025 17:45:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754700328; x=1755305128;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+SdmD8y1mIxLj5DFoiniCJvWmuKL4tKZkoBsj7bVLx4=;
 b=pqy4neEes0kGNs8u3LxkyZU846lzLtzPvoZ0VfPbjxLkqC/wehVHX6fzc5eNdsY3dD
 QIpvbZIWkHZKs0GWMACQWsRVXnplLqosuGoWI5FR3KYHtZeLe5W0A8i1r7RmQrmVfvli
 n9rnlLMsBphISDugDyvIs2H638jFRVLEdb4JA6ImhDovYzr25lwmJSrh8cR7CdSs/nc4
 ld2ogdv14YA+RR2rIEhUOYhiZ2MtcTB+oE4G9hilisqOSve6H/jgLk9tRPldF5UN7X16
 z6BlCEdPmdgeJvRqxBxdxvOE3GzadFw0CPf4YgK9fsaWc0LlWfrB91ByUovjyf7DrwZU
 ZNWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqWUjXGYsW4yraa0GkGBkVRj7zlqNILWnM7sQiSr1RIm0U0NZPyeJcCWPkfaHRvZRmECbQSbn9jT4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSykV7XqIR7V1Ncp1lWeaL/HRjCgvhnVU8egTJ34dAN5pRr7z1
 5GJ0pWA7TGNXhh/lQYDZ8BQ/DPAWqFm1wkXmhsVgeKxjgH5DWLWhRkLXLAV6LPF8kSMOZS6SScT
 sLMCQU7mTp2vrd1vYh/oUwFpR7MAZvHwBNq0AUIaKg9W4EGGZJtV62giRS/m9lqP0O4h0Lbw=
X-Gm-Gg: ASbGncvgaiKW5/3Idh1/LgW01xCifgByePV0dQ7XbZ1wkeFc+EOJ2MSGC+Js1XhZAFI
 li+LsUYbD0CIKlA6YZh8Qe+p5IfurEPLthSTlvrZwsZ/ziXVl9o+243jtFwIxHnNB4/ESA5RCZF
 66Xy7EuIVleBmkI3fI+c7+42O0avyZMT3VArttB3lOiFpD2VnYbY8idTU5UgJNyda2/qhP6Ovm1
 eDsbXY7vzfnv6XteD5oQM7UYkAj5gC93Jy70BB+JElZp1dFPkknXVrbHkbInfADN3EV9sBNiEwk
 3eKVA8i1hum/LehzpL3jJepMUtt9eu37xAY/yn9bLASPm3KWJNEpxWZbEbkXk12ee1NMdr6X6J2
 a1lycJXkQlBQjlSZHLQAmWwxgMhHJAsSps+iy0JNQgsg=
X-Received: by 2002:a05:622a:115:b0:4af:21a0:c65b with SMTP id
 d75a77b69052e-4b0a074ef32mr134768271cf.13.1754700327995; 
 Fri, 08 Aug 2025 17:45:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfQjmXMV853672JK0fEpKkYRjhS8uwOvkShC3Xw9ZNKFNAKoVWBbGdYfzTQ4X2DquHWVzT1A==
X-Received: by 2002:a05:622a:115:b0:4af:21a0:c65b with SMTP id
 d75a77b69052e-4b0a074ef32mr134767951cf.13.1754700327474; 
 Fri, 08 Aug 2025 17:45:27 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9?
 (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-33238271bdfsm31713131fa.6.2025.08.08.17.45.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Aug 2025 17:45:25 -0700 (PDT)
Message-ID: <e217fb72-36e4-4222-b5da-9608af57c665@oss.qualcomm.com>
Date: Sat, 9 Aug 2025 03:45:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/12] drm/msm/dp: Move link training to atomic_enable()
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Dmitry Baryshkov
 <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <quic_yongmou@quicinc.com>
References: <20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com>
 <20250808-hpd-refactor-v2-4-7f4e1e741aa3@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250808-hpd-refactor-v2-4-7f4e1e741aa3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Q+XS452a c=1 sm=1 tr=0 ts=68969a29 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=tir8h9pnGiVj9xZly-MA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: WTfKvciVMveEAvlyPdmTl2V4__ZA2jEQ
X-Proofpoint-ORIG-GUID: WTfKvciVMveEAvlyPdmTl2V4__ZA2jEQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA3MDA2OSBTYWx0ZWRfXwJNzHnmEEzi0
 tF7tIG1yuZiPbp6JAY0CYz1u1RBSxDMbtO4kTy6QbXE5qBharfMwpLX7EAMVHOPi7M3zbACJa5v
 Ka5u+d6mWCPNnJA51EOiKi4PJ1IIEHJz7lok/G4yfrw4ZQULxBgN/qcPEv91xuQYxIyF+XnpBzQ
 Q+U4xXc9brmnMbrpUvaLUIZdtS665hSa2/hQJrQtaS1ZEnmGVCoYZotXcIAQZ5LRcNZfCWyimJk
 rqkIbH+yWoW9a7mvu7renuDC9bVl80xQl1I4pikT1EZql5+4f3EDq3q9Q+ilLZkwysLfYZ7eOnK
 pDnyg2A74cWMfHY8xV4xsULuX6ioLWIJ8RBU9mQigphP7hp1nsQX3SLFLL5WLIqbqiHvJEnNLjF
 8rhmjaj3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_08,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508070069
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

On 09/08/2025 03:35, Jessica Zhang wrote:
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

This feels like two unrelated changes.

> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 15 ++++++++-------
>   1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index e2556de99894..c849befe58f0 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -427,11 +427,6 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>   	msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
>   
>   	msm_dp_link_reset_phy_params_vx_px(dp->link);
> -	rc = msm_dp_ctrl_on_link(dp->ctrl);
> -	if (rc) {
> -		DRM_ERROR("failed to complete DP link training\n");
> -		goto end;
> -	}
>   
>   	msm_dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
>   
> @@ -1680,6 +1675,12 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>   		force_link_train = true;
>   	}
>   
> +	rc = msm_dp_ctrl_on_link(msm_dp_display->ctrl);
> +	if (rc) {
> +		DRM_ERROR("Failed link training (rc=%d)\n", rc);
> +		dp->connector->state->link_status = DRM_LINK_STATUS_BAD;
> +	}
> +
>   	msm_dp_display_enable(msm_dp_display, force_link_train);
>   
>   	rc = msm_dp_display_post_enable(dp);
> @@ -1839,7 +1840,7 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
>   		return;
>   
>   	if (!msm_dp_display->link_ready && status == connector_status_connected)
> -		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
> +		msm_dp_hpd_plug_handle(dp, 0);
>   	else if (msm_dp_display->link_ready && status == connector_status_disconnected)
> -		msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
> +		msm_dp_hpd_unplug_handle(dp, 0);
>   }
> 


-- 
With best wishes
Dmitry
