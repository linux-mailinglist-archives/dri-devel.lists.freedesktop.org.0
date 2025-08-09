Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DCCB1F1C7
	for <lists+dri-devel@lfdr.de>; Sat,  9 Aug 2025 02:53:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7548D10E99C;
	Sat,  9 Aug 2025 00:53:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HLXlz1SE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 350CB10E99B
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Aug 2025 00:53:49 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5790LoNg001047
 for <dri-devel@lists.freedesktop.org>; Sat, 9 Aug 2025 00:53:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WJPnKcSRwQJ8Ja2LLFPMkF9M1PcIo3OLlDB6PIjUtdc=; b=HLXlz1SEAR4T5o9c
 Ili+g7sGiDniKXSyg/oaYrmFhcSPXFQqQGxqHTKJN6IVXAv7PndcOuZVdl/r3k8J
 M3LH88+1PoUQbDulBWiVRDJdRbQ0gtEhKvNViEQ+FChBiIS3fCQ6MpdhYbW7MIvI
 1wxnR164tQ5GRjFYzK1XbiU98MRMo+St8/GYU89q2PdKpBCDz23T94P055R8ee82
 E7jfOKKCfVQXSGnRf8MqRVm6Drcn9P3kY9mJn7mixYyHx+UCfK6O+3r5YFiepTiC
 XXaJjHmfZaP3qQD0ze0j12LINEF11qCgYgS5doLFpVkotUHHa+A42uxAyEsF04gg
 UUixvg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dupmg1gs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Aug 2025 00:53:48 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b321087b1cdso4059901a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Aug 2025 17:53:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754700827; x=1755305627;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WJPnKcSRwQJ8Ja2LLFPMkF9M1PcIo3OLlDB6PIjUtdc=;
 b=rppwj3In9vpTtLPH89liZeqE6l/MJceJFIjGShgF3qIYl+EB2OLtAv2Pqf//e2OBsK
 YFA507m3CKy1amN1n4XhZZRkQav2eAOrqe14aeBuxYwLZDei/djYN+0CpJm1G/HJJkj1
 ddB1M6/lSi2XtbnK8juPRILu9mcsUJVNFpDn7E+yPgaUnOFiR69rTcnaXg1buD+s1mKa
 XJBt33CEy13gUxXPzdDuqDfkiZtTfHOjUKaUsmNDaDgQDIgzs+ZPBQPcdHVGiKqy+Nz2
 wYFTpLzn/IKlUUp3JBVVyj5rC5XZ8vAuJZLIhhixkk1Q2a8XzGx8e1KUO+5V5PAy/bJu
 mZmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV27kIfWjY7vg8lJehimhS6uYpN5vSfxXwpQqpMe99+1xdFnPhV7BilxC2hK94MHqaHV2xZmEtaaAA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzweOCSq4H+g1eMSh17zNV282N87Hk6p7dhxstcUNpz46dUdLt9
 wyP/ryYWBAB+CfBUfhuqh8A4uYOAX3aKlh5gZeZJYSTDmyqTnyME55P+BLNq6TzQnhiw/wQWtx8
 WWSsVloL0vzkLYhfb4nIbWjiakeBlpgsmUOvoPwwlIcvfNngjlpSJ2EKvE4THEOISQOoIJK0=
X-Gm-Gg: ASbGncshhrbFcn7OSa6DxPVsJn96CkF5O54OZjzhA1igDnOeW2qeAsIK7D5kU6Y9Prm
 LenldmGw7D22jrYV8beoGQKzuZ3RUObOm9ZwTsqydts9gMZ05rI/2nsjzwD1v4sRES0vtyy6Z1G
 UVGJ1eTc+8a4/UJ0BR9ffo9dxdWUSJfsPg0+eKBgSRW7iZ6asKik9I0tLWjEozJBlb7IbdF6jBT
 seibNTL2Sli6Ab+GtYg3wLMozLhf5c8SxW3gknqB700SZj3IE16KW1jZHWDBCbEoho/0xq0toi1
 PBiO3g8B1dy4Kh/GY6/6QK9KJc1whu6Tu/bg37aVPZMCPckYUb7V0MZGMfmm4cL50RhF0rsIu9Y
 AN6Y59v0s5h8Z71njcVZE4A==
X-Received: by 2002:a17:90b:1fcc:b0:31f:762c:bc40 with SMTP id
 98e67ed59e1d1-32183e33936mr8167795a91.16.1754700827118; 
 Fri, 08 Aug 2025 17:53:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXRItAF80pITRrQiGf1tG4sDOi7TzqLz8/4xo7Al3rN4HvKGf5QUP1Fab2OCCqbCNxWsx8ag==
X-Received: by 2002:a17:90b:1fcc:b0:31f:762c:bc40 with SMTP id
 98e67ed59e1d1-32183e33936mr8167763a91.16.1754700826572; 
 Fri, 08 Aug 2025 17:53:46 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-32102a77576sm13938214a91.2.2025.08.08.17.53.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Aug 2025 17:53:46 -0700 (PDT)
Message-ID: <4941c486-ccff-40bd-9b4b-9b84a0c028e4@oss.qualcomm.com>
Date: Fri, 8 Aug 2025 17:53:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/12] drm/msm/dp: Move link training to atomic_enable()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
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
 <e217fb72-36e4-4222-b5da-9608af57c665@oss.qualcomm.com>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <e217fb72-36e4-4222-b5da-9608af57c665@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bY5rUPPB c=1 sm=1 tr=0 ts=68969c1c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=YAZOsL1__VChtR82wIAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: aDnNm-4SRthPsqCMFeg9qlumCmUTqNwW
X-Proofpoint-ORIG-GUID: aDnNm-4SRthPsqCMFeg9qlumCmUTqNwW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAwMCBTYWx0ZWRfX4iCLz/hAmUTp
 xk36rZedURRF+ac9/fullW8oBk6mmoBNgUKKfPLQVnFvo1+hbBBf+j81qLY0bALA9dKprs7xjDB
 KbCMdGxKsdveb+lCnF1CmKi4BoESlJyei10Or7GWaobt/oG7y2t+wN6mHHPYJH1yg0QQzs/J9IG
 AXd61kk22ic9pRzdzGdXRLJxufHSJrgFs6WUE1nltt5wknNJyXsxxQS2QSCfNtMpFMlC9fcrscc
 TzpSbgggaRIJQpeBOMi2wvWNgMyriSYhGEIoppalO+UrzHFg2PDWlJovshGlD5VYZf00A6xuhfk
 ncrjN906HLQKgJX2XZDC4+C/6q5g4S5x1/LcgOLTmTqZhQ6u2dLVZdQ2xAD0dS9EatKV/rz5Wy4
 zRXeZzsD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_08,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 clxscore=1015 phishscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090000
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



On 8/8/2025 5:45 PM, Dmitry Baryshkov wrote:
> On 09/08/2025 03:35, Jessica Zhang wrote:
>> Currently, the DP link training is being done during HPD. Move
>> link training to atomic_enable() in accordance with the atomic_enable()
>> documentation.
>>
>> Link disabling is already done in atomic_post_disable() (as part of the
>> dp_ctrl_off_link_stream() helper).
>>
>> Finally, call the plug/unplug handlers directly in hpd_notify() instead
>> of queueing them in the event thread so that they aren't preempted by
>> other events.
> 
> This feels like two unrelated changes.

Hi Dmitry,

Ack. Would it make more sense to squash the hpd_notify part with the IRQ 
thread change?

Thanks,

Jessica Zhang

> 
>>
>> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 15 ++++++++-------
>>   1 file changed, 8 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/ 
>> msm/dp/dp_display.c
>> index e2556de99894..c849befe58f0 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -427,11 +427,6 @@ static int msm_dp_display_process_hpd_high(struct 
>> msm_dp_display_private *dp)
>>       msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
>>       msm_dp_link_reset_phy_params_vx_px(dp->link);
>> -    rc = msm_dp_ctrl_on_link(dp->ctrl);
>> -    if (rc) {
>> -        DRM_ERROR("failed to complete DP link training\n");
>> -        goto end;
>> -    }
>>       msm_dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
>> @@ -1680,6 +1675,12 @@ void msm_dp_bridge_atomic_enable(struct 
>> drm_bridge *drm_bridge,
>>           force_link_train = true;
>>       }
>> +    rc = msm_dp_ctrl_on_link(msm_dp_display->ctrl);
>> +    if (rc) {
>> +        DRM_ERROR("Failed link training (rc=%d)\n", rc);
>> +        dp->connector->state->link_status = DRM_LINK_STATUS_BAD;
>> +    }
>> +
>>       msm_dp_display_enable(msm_dp_display, force_link_train);
>>       rc = msm_dp_display_post_enable(dp);
>> @@ -1839,7 +1840,7 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge 
>> *bridge,
>>           return;
>>       if (!msm_dp_display->link_ready && status == 
>> connector_status_connected)
>> -        msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
>> +        msm_dp_hpd_plug_handle(dp, 0);
>>       else if (msm_dp_display->link_ready && status == 
>> connector_status_disconnected)
>> -        msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
>> +        msm_dp_hpd_unplug_handle(dp, 0);
>>   }
>>
> 
> 

