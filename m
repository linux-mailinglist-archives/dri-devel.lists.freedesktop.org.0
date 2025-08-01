Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E41B189AD
	for <lists+dri-devel@lfdr.de>; Sat,  2 Aug 2025 01:59:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C264510E322;
	Fri,  1 Aug 2025 23:59:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="o07yc4Li";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05A3C10E321
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 23:58:59 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 571Lg02k029247
 for <dri-devel@lists.freedesktop.org>; Fri, 1 Aug 2025 23:58:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sJil9fuANTIpmKQE7cP4cPGJ+csBLlaXLdFVNl5IgEY=; b=o07yc4LiXSNMEQ0m
 tPDQtTL9RKOocu7P/FqueYPSICyprAmwRxEO1PpDp3wZBie5R28tFQA/JcOhmbDi
 Fl1a5SRYUKy8/7LKsBp35BZISo7WN7qQHh68eCQmOx/v9FDCf3uo8lhxObDy9spF
 hMBTocTUEY4TIfIhvBayY9jAa/oHlow2IGFHABxhTWIl2/EfDVrOOXR9dzu2VUVf
 /a+JfVVphcxWsIwUuSr577sD+CQthPSeXG1UdkYl/SrwMLzTEW79t7gHcnaK7hee
 yPvuiWwmhH+qxzdU8kfDV4AVa2B2NFqZDB8f2cXIhAnRMpyrCU4/NdOvFUT8+Nmy
 DAp7Pg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484p1aw7xk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 23:58:58 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-76bca6c73f3so3747485b3a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 16:58:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754092737; x=1754697537;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sJil9fuANTIpmKQE7cP4cPGJ+csBLlaXLdFVNl5IgEY=;
 b=rpQv1Z7KsU9P4WHQ1ncPgcWJkSvPr0VoVp6QFwB0joBFCjE0fRmvrzJEvIbEQ+xAte
 u2I71f9fvvYn0Qgnvgj+MGh01Zj/z4p6faQdV1OOcD85cZ/2MpVdmn5PqCCr/4fm8R91
 VE22bOqX3vs5Kiv/a0H+Io7YYwBi2vB/P3rObF8E+gncHXecoNv100dSKIg47U465lbb
 u3P+6nvsFP2FOf/O6a+bKrRYT9IkQ6pbCHcdyKKPYJqINKf3vosDiu42gqsLoFrDXqkz
 NNOfYWhDK3GjSVzYZIAVWbI6/RzFyMiiU0WcAEXkFw7qFEPCDX2fJNAXketrvTYxg+9d
 iTtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZt96j2blr569ZLcVPK5z7pBmL8AeqZmy5XILGOWLI9Axa+JqJ3W3YtpnZR3iuxxL3UIpYhuPNKvU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCQqw2WiF5n9MxI+VYCi+K4UehhIrfEYGZtvwYzjUzHoM3oYQh
 qT+q/bDEuiUdlxNN+AT/Y7Y1Kvethvw+qz9NfJHZ2vIJDo7n3LUyTBih/Q0i4LEnkFNIKKmYHBL
 bwjtqLBPG08RGoQk4O3FXTgNztY2mKRSAOhl7GOJazt/Wn98dRt/q6U4FPNLfJxFrsk6Wrko=
X-Gm-Gg: ASbGncvscfXa6TANb43L+IXn8+9tLavTk5ZkTeVTqa5/hwF0r/IfD5kFqEC6/y4r/yG
 lX+NJh8uTSBKOIW6mAN+WgrdyqbShcbTTnh459VflDoIhvUmBm1C+FYjv2asKOUARXijJCPRKER
 4AM4JZT0Msz875t+hhC7VGCOYIj5QWNBKhpsrL4j6Mj+mMPSWqsCMtmZ3yMam+fVQ07qw75ULxV
 eKaaZdtv477Vj+3pQH2ny+ttM1WutdppBNhYmdsY2o4Cc3BycZos/jXhwEbtr2jaci6REs0tcPy
 EBjXv10rJxFwhb2WrT4W39Y3mK/FYVFOiWFWbA2ZemcFx/Dpm2e9wAaHzHCvubmQsAThF0S9tA0
 gYq9c5FXzm6foqMYlO81HKQ==
X-Received: by 2002:a05:6a00:2ea4:b0:76a:d724:d712 with SMTP id
 d2e1a72fcca58-76bec302327mr1652002b3a.3.1754092737426; 
 Fri, 01 Aug 2025 16:58:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTfKbPm8IV20xoihIcyGu1iRejGkZ8MwdHaIanUdy4YR9la0eA1aJYMT5RSic/HhKvru8Tzg==
X-Received: by 2002:a05:6a00:2ea4:b0:76a:d724:d712 with SMTP id
 d2e1a72fcca58-76bec302327mr1651981b3a.3.1754092736990; 
 Fri, 01 Aug 2025 16:58:56 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bccfbd02csm4934867b3a.62.2025.08.01.16.58.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Aug 2025 16:58:56 -0700 (PDT)
Message-ID: <a085fb45-91e2-4827-b8e9-8af90796cc49@oss.qualcomm.com>
Date: Fri, 1 Aug 2025 16:58:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/19] drm/msm/dp: Move link training to atomic_enable()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Dmitry Baryshkov
 <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <quic_yongmou@quicinc.com>
References: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
 <20250711-hpd-refactor-v1-18-33cbac823f34@oss.qualcomm.com>
 <cofa377vptj7on637u3c3mnxndplcmaegsb5h6idinz5wrvm6s@toylno4uapq4>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <cofa377vptj7on637u3c3mnxndplcmaegsb5h6idinz5wrvm6s@toylno4uapq4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QcUZamhCQaLI_a2QxxXvozLd4O_4Y9rz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDE5NCBTYWx0ZWRfX9+ZkZ3WkjLRZ
 XiHUDQoduA/rXtgqgZKYKj3p/BEJa83p66kX7lBWvBoUezM7PxHVxLrhMxfah24KbQ86HgrfVK5
 eQgu198kLNCDnRuqXncMLBD1cmyN4x5GfYCXiIDHho9s3/z2M7mv4tVY65XCCp8GO8OPZgXc1Vs
 pP6S8GUUb9fZrTfdSwwf5LO7I91ud88TB5FGoBlwQaQPgY9f1cTvsBl4v1T4xzhWvnW+I+k65Tg
 paMkmQ+9/8Gsn2N85tBooF7nK38WO85wqn9/sk0L3FCTZKuQ2IicXoSzY8+qR3sbNapEPxgni7h
 z9IF+myc4WEc8O3EwaCQZmGUNMYXSj34wM4guHvjrUQN+wL5Jp/V4ZGMoGOlRL1s5dtdUf9aGTU
 gT5zRln1BHFLk0yIJHj2p8Oe+y0JNsWsxIjv5xjcvMKDZLYKY7aIVw2vVBTHiNvd6qHTJHLi
X-Proofpoint-GUID: QcUZamhCQaLI_a2QxxXvozLd4O_4Y9rz
X-Authority-Analysis: v=2.4 cv=KtNN2XWN c=1 sm=1 tr=0 ts=688d54c2 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=yJ1ceeCYH-zBWwCu-X0A:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_08,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508010194
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



On 7/14/2025 4:54 AM, Dmitry Baryshkov wrote:
> On Fri, Jul 11, 2025 at 05:58:23PM -0700, Jessica Zhang wrote:
>> Currently, the DP link training is being done during HPD. Move
>> link training to atomic_enable() in accordance with the atomic_enable()
>> documentation.
>>
>> In addition, don't disable the link until atomic_post_disable() (as part
>> of the dp_ctrl_off[_link_stream]() helpers).
>>
>> Since the link training is moved to a later part of the enable sequence,
>> change the bridge detect() to return true when the display is physically
>> connected instead of when the link is ready.
> 
> These two parts should be patch #2 in the series.
> 
>>
>> Finally, call the plug/unplug handlers directly in hpd_notify() instead
>> of queueing them in the event thread so that they aren't preempted by
>> other events.
>>
>> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 15 ++++++++-------
>>   drivers/gpu/drm/msm/dp/dp_drm.c     |  6 +++---
>>   2 files changed, 11 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 87f2750a99ca..32e1ee40c2c3 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -410,11 +410,6 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>>   	msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
>>   
>>   	msm_dp_link_reset_phy_params_vx_px(dp->link);
>> -	rc = msm_dp_ctrl_on_link(dp->ctrl);
>> -	if (rc) {
>> -		DRM_ERROR("failed to complete DP link training\n");
>> -		goto end;
>> -	}
>>   
>>   	msm_dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
>>   
>> @@ -1561,6 +1556,12 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>>   		force_link_train = true;
>>   	}
>>   
>> +	rc = msm_dp_ctrl_on_link(msm_dp_display->ctrl);
>> +	if (rc) {
>> +		DRM_ERROR("Failed link training (rc=%d)\n", rc);
>> +		dp->connector->state->link_status = DRM_LINK_STATUS_BAD;
>> +	}
>> +
>>   	msm_dp_display_enable(msm_dp_display, force_link_train);
>>   
>>   	rc = msm_dp_display_post_enable(dp);
>> @@ -1706,7 +1707,7 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
>>   		return;
>>   
>>   	if (!msm_dp_display->link_ready && status == connector_status_connected)
>> -		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
>> +		msm_dp_hpd_plug_handle(dp, 0);
>>   	else if (msm_dp_display->link_ready && status == connector_status_disconnected)
>> -		msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
>> +		msm_dp_hpd_unplug_handle(dp, 0);
> 
> This chunk should be separated from this patch. I'd ask to drop
> EV_HPD_PLUG_INT / EV_HPD_UNPLUG_INT completely and call DRM functions
> all over the place instead. You can do it in a single patch, which comes
> after this one.

Hi Dmitry,

Sure I can split this into a separate patch.

Is the goal here to remove the event queue entirely?

I can drop EV_USER_NOTIFICATION, but I'm not sure if I can completely 
drop EV_HPD_[UN]PLUG_INT entirely without major refactor of the 
plug/unplug handlers since they are used for the HPD IRQ handling.

Thanks,

Jessica Zhang

> 
>>   }
> 

