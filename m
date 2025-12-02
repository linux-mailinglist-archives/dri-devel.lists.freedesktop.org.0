Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1933EC9A14F
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 06:26:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3011B10E50E;
	Tue,  2 Dec 2025 05:26:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="T1vmKpx1";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kOlV1/67";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE4AC10E50E
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 05:26:39 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B1LsJmR1492397
 for <dri-devel@lists.freedesktop.org>; Tue, 2 Dec 2025 05:26:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sXH+FolYz1c3U/F3aqD1ELuv0/0CjC4u/zLs1ktTN6g=; b=T1vmKpx1qt28b7mS
 q1DPM1OTWbvoA0mFF6oGC3Xg/GjbhjTfOhdAOltrK8o2loaxLFhO7ossFlW99Biy
 CEzLwMz1FQ9dWks4nR2+AXt+81641ANw22RQjpLbXxAsBMuDksvcELOebkDLucis
 L/NSFgCdVAs5eA3sBTuIV0Uhlm9NdcBfxMt6JU0UPFXf9KUkcOQ4UpjaYB5QkX/V
 HYcbC5vK0+zunpJXxvJXbwUm1oQHItVDe3ZqVbYEwJRLk+S74E5+drk7m+swgh/J
 lPo19hwtfME66VHZg1GjtrNFk2564U79IXosavvXGoUW5ukFgjUtOPMafAL+eN2L
 2ks14w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4askbd11ae-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Dec 2025 05:26:39 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-7b8b79cbd76so2741124b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Dec 2025 21:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764653198; x=1765257998;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sXH+FolYz1c3U/F3aqD1ELuv0/0CjC4u/zLs1ktTN6g=;
 b=kOlV1/67zJWkxJFhYR1K8K3qNQjaKfdEJg1y+klqAubdxMHQvVKDdzWhppHrWWA45m
 1LOz3ElIVcqXO+Wq1MPecgbym7e6/sNZhQLceind44JXznBCcFPlVIGXiHU/YbaVdg6z
 9RvtIXdttHcEdIAAMeLCnOwbFWZXUrDnbZ37//KRzyj6LtKg8dklvi7/sKgmSwUak/WJ
 +GMlFHvj6f/Lsgb1lntQZx3X+Dovak65wL/2hBt0Bnss7QoXfgd54uZrSaGz7fRb4LQJ
 n29OBQUIWK8dC85hjbuE9kvOcNJ18AdysaJkxXBHO8EGXdijbXDq9eUUm1S6J8WljV0e
 T2gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764653198; x=1765257998;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sXH+FolYz1c3U/F3aqD1ELuv0/0CjC4u/zLs1ktTN6g=;
 b=alH93L/gYPvOJOzbcSupUiojX98vYSTt9o7YjQ0Ny/XlygcQtCIRwdIUeXYIT0xM5X
 n4JmDszOVZvR+YYWgJ+P9+hHehSL/5m0wcj/1JFkhKWx/d1zz+EYs1TsRDc04PmjJang
 atG447Sfvuv2MMyAlAmdsnqeb0qX1olIbM65PUbOKP0+QwMKWtFN8JDqZxQkU8zTxD/o
 bEvkIOXhCM3/JWM+k57Z/RwkLy7BxDgk1XlGC7PD4qGhNQu9pWoiIlPt7NkZ/xvPmYQb
 32T9+uTZbtpu+2tkJxirwItMPSpT/xzr6cVo+37aYzX1q3brjOdRIhiBUMnWnN2/yvWM
 8kBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8vQMxrBqEUB541WjGvvFqZzpmWlbJSIAYRkMwPjAy58Sx5WatKfOzYL+ofN89QnreyV26wb+ZMhY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy32t0KCqhDvBuTl3Nkw/jEn2ikCGclSYvMH4t80aFbGOY9Oioe
 6xFrvBltTm4+SZS+8uKqGZq5RcWp1BdElR6ir6l5t0oxuuZCP8oBO38Q96/E34Us2FnnmrwgBRx
 /ucICATPBtoe6Z0UcGhEFhja+1oI2d2Gd09BXI04C172d/JQ5ZEDbhQMY9Rdp9wfUz7HHhqA=
X-Gm-Gg: ASbGnctfycT4Ff2vwBq9XjhFIs3tgddqNxBmDnuWBRCpDghJ6AQwAxm3AGHtKclBem/
 FxLztkSBy+2aC3FA7lNT3XplFX4moOsn0pMMNZtO8H3i6ASbnIL4AKf3x3oFkBqnS7xqcObwjLb
 Jd/Cgrxv/VDLoxlJXw2Mka4RQpwjVYFsiZ1udJGOtOnCxnoXdV8qsVICLXk9glftyThwxpZR5/S
 M2AFXBr8pNEchWwDnAci7OXxHinCklsX5DdoyocGTiUNFGZ5TGka8cuSFor9wyBMlw6/vrKXe3e
 WYopuCFEz9mQQNMffAp5jNroEryqAgt93soSfCs9f5XHTE6qovvQ4Ej6hnghkFIgcPnHBtfbciy
 Cc7cbZK1wQIX97H6c6mRnnYSHsYumX/dvht+xPJnhIA==
X-Received: by 2002:a05:6a21:99a2:b0:35d:cc9a:8bc1 with SMTP id
 adf61e73a8af0-363e8d51e4amr1374014637.27.1764653198326; 
 Mon, 01 Dec 2025 21:26:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEAWZ7n/BoRt2V1SlXWIuloIGJYsPZ36/Zx7AX6eT+utP2djOCYvtjHBuiLBctSYyTFSDkcpQ==
X-Received: by 2002:a05:6a21:99a2:b0:35d:cc9a:8bc1 with SMTP id
 adf61e73a8af0-363e8d51e4amr1373981637.27.1764653197778; 
 Mon, 01 Dec 2025 21:26:37 -0800 (PST)
Received: from [10.218.35.45] ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-be508a1142esm13403683a12.19.2025.12.01.21.26.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Dec 2025 21:26:37 -0800 (PST)
Message-ID: <8872ac78-38de-4b1d-a0f5-9f171cc9f42c@oss.qualcomm.com>
Date: Tue, 2 Dec 2025 10:56:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] bus: mhi: Fix broken runtime PM design
To: Mayank Rana <mayank.rana@oss.qualcomm.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 ath12k@lists.infradead.org, netdev@vger.kernel.org,
 quic_vbadigan@quicinc.com, vivek.pernamitta@oss.qualcomm.com
References: <20251201-mhi_runtimepm-v1-0-fab94399ca75@oss.qualcomm.com>
 <20251201-mhi_runtimepm-v1-4-fab94399ca75@oss.qualcomm.com>
 <2dc234d3-3bb4-4d6e-810a-e7197174769f@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <2dc234d3-3bb4-4d6e-810a-e7197174769f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 1p5oD7NjE2vPm9l3QMuXXUNeAyVP7S9U
X-Proofpoint-GUID: 1p5oD7NjE2vPm9l3QMuXXUNeAyVP7S9U
X-Authority-Analysis: v=2.4 cv=fLg0HJae c=1 sm=1 tr=0 ts=692e788f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=gkVCCi9o0YoM2wVKOhMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDA0MSBTYWx0ZWRfXwoClRGnSPClS
 MkjhcMBAKNJBxqaLr/U8aFS798hviyJEz5t3d17F5X0G8H/vbU8qCXkpSB3ETYzVKOb8Sh7sBtU
 0ko42QeA9Sfh001pF7934f7o9b8gIjiNSfF76slewRyLYs+bUJMO5suda3tbaUaeI6npuMOCMTs
 SEhaRvvzLG1Fi9AAGcmNSnNPu+1ET6qkAk1tqNxUZypsLzaBYN/cVESezaq6T7+N5xuV7sea8iL
 iI3y3f2lWCZ2ZrBO02twNSA+amDTcTrsWfspRfyak/1Op+eB4c1eXX5vGkF3RKVg56VElKiJknu
 R+KGlnRmlntb3/mqdTb2DYcogNJ8zWkuksVjTLneM/sPHsS+ZtV8GTx76h32N61LM33B35nmjWf
 ktRzi8KP2JN/iNVgsvok8lzP+7lhWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 adultscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512020041
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



On 12/2/2025 12:03 AM, Mayank Rana wrote:
> Hi Krishna
>
> On 12/1/2025 4:43 AM, Krishna Chaitanya Chundru wrote:
>> The current MHI runtime PM design is flawed, as the MHI core attempts to
>> manage power references internally via mhi_queue() and related paths.
>> This is problematic because the controller drivers do not have the
>> knowledge of the client PM status due to the broken PM topology. So when
>> they runtime suspend the controller, the client drivers could no longer
>> function.
>>
>> To address this, in the new design, the client drivers reports their own
>> runtime PM status now and the PM framework makes sure that the parent
>> (controller driver) and other components up in the chain remain active.
>> This leverages the standard parent-child PM relationship.
>>
>> Since MHI creates a mhi_dev device without an associated driver, we
>> explicitly enable runtime PM on it and mark it with
>> pm_runtime_no_callbacks() to indicate the PM core that no callbacks
>> exist for this device. This is only needed for MHI controller, since
>> the controller driver uses the bus device just like PCI device.
>>
>> Also Update the MHI core to explicitly manage runtime PM references in
>> __mhi_device_get_sync() and mhi_device_put() to ensure the controller
>> does not enter suspend while a client device is active.
> Why does this needed here ?
> Isn't it MHI client driver take care of allowing suspend ?
> Do you think we should remove mhi_device_get_sync() and 
> mhi_device_put() API interfaces as well ? And let controller/client 
> driver takes care of calling get/sync directly ?
These API's not only  do runtime_get & put but as also do wake_get & 
wake_put which make sure endpoint also doesn't go M1 state.
>
> How are you handling cases for M0 and M3 suspend ?
> Do we need to tie runtime usage with M0 (pm_runtime_get) and M3 
> (pm_runtime_put) ?
M3 are controlled by the controller driver, they usually do it as part 
of their runtime suspend
and M0 as part of runtime resume.
once the mhi driver gives pm_runtime_put() then only controller can go 
keep MHI in M3.
So we can't tie MHI states pm_runtime_get/put.

- Krishna Chaitanya.
>
> Regards,
> Mayank
>
>> Signed-off-by: Krishna Chaitanya Chundru 
>> <krishna.chundru@oss.qualcomm.com>
>> ---
>>   drivers/bus/mhi/host/internal.h |  6 +++---
>>   drivers/bus/mhi/host/main.c     | 28 ++++------------------------
>>   drivers/bus/mhi/host/pm.c       | 18 ++++++++----------
>>   3 files changed, 15 insertions(+), 37 deletions(-)
>>
>> diff --git a/drivers/bus/mhi/host/internal.h 
>> b/drivers/bus/mhi/host/internal.h
>> index 
>> 61e03298e898e6dd02d2a977cddc4c87b21e3a6c..d6a3168bb3ecc34eab1036c0e74f8d70cf422fed 
>> 100644
>> --- a/drivers/bus/mhi/host/internal.h
>> +++ b/drivers/bus/mhi/host/internal.h
>> @@ -355,9 +355,9 @@ static inline bool mhi_is_active(struct 
>> mhi_controller *mhi_cntrl)
>>   static inline void mhi_trigger_resume(struct mhi_controller 
>> *mhi_cntrl)
>>   {
>>       pm_wakeup_event(&mhi_cntrl->mhi_dev->dev, 0);
>> -    pm_runtime_get(mhi_cntrl->cntrl_dev);
>> -    pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
>> -    pm_runtime_put(mhi_cntrl->cntrl_dev);
>> +    pm_runtime_get(&mhi_cntrl->mhi_dev->dev);
>> + pm_runtime_mark_last_busy(&mhi_cntrl->mhi_dev->dev);
>> +    pm_runtime_put(&mhi_cntrl->mhi_dev->dev);
>>   }
>>     /* Register access methods */
>> diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
>> index 
>> 7ac1162a0a81ae11245a2bbd9bf6fd6c0f86fbc1..85a9a5a62a6d3f92b0e9dc35b13fd867db89dd95 
>> 100644
>> --- a/drivers/bus/mhi/host/main.c
>> +++ b/drivers/bus/mhi/host/main.c
>> @@ -427,6 +427,8 @@ void mhi_create_devices(struct mhi_controller 
>> *mhi_cntrl)
>>           if (ret)
>>               put_device(&mhi_dev->dev);
>>       }
>> + pm_runtime_no_callbacks(&mhi_cntrl->mhi_dev->dev);
>> + devm_pm_runtime_set_active_enabled(&mhi_cntrl->mhi_dev->dev);
>>   }
>>     irqreturn_t mhi_irq_handler(int irq_number, void *dev)
>> @@ -658,12 +660,8 @@ static int parse_xfer_event(struct 
>> mhi_controller *mhi_cntrl,
>>               /* notify client */
>>               mhi_chan->xfer_cb(mhi_chan->mhi_dev, &result);
>>   -            if (mhi_chan->dir == DMA_TO_DEVICE) {
>> +            if (mhi_chan->dir == DMA_TO_DEVICE)
>>                   atomic_dec(&mhi_cntrl->pending_pkts);
>> -                /* Release the reference got from mhi_queue() */
>> - pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
>> -                pm_runtime_put(mhi_cntrl->cntrl_dev);
>> -            }
>>                 /*
>>                * Recycle the buffer if buffer is pre-allocated,
>> @@ -1152,12 +1150,6 @@ static int mhi_queue(struct mhi_device 
>> *mhi_dev, struct mhi_buf_info *buf_info,
>>         read_lock_irqsave(&mhi_cntrl->pm_lock, flags);
>>   -    /* Packet is queued, take a usage ref to exit M3 if necessary
>> -     * for host->device buffer, balanced put is done on buffer 
>> completion
>> -     * for device->host buffer, balanced put is after ringing the DB
>> -     */
>> -    pm_runtime_get(mhi_cntrl->cntrl_dev);
>> -
>>       /* Assert dev_wake (to exit/prevent M1/M2)*/
>>       mhi_cntrl->wake_toggle(mhi_cntrl);
>>   @@ -1167,11 +1159,6 @@ static int mhi_queue(struct mhi_device 
>> *mhi_dev, struct mhi_buf_info *buf_info,
>>       if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl)))
>>           mhi_ring_chan_db(mhi_cntrl, mhi_chan);
>>   -    if (dir == DMA_FROM_DEVICE) {
>> -        pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
>> -        pm_runtime_put(mhi_cntrl->cntrl_dev);
>> -    }
>> -
>>       read_unlock_irqrestore(&mhi_cntrl->pm_lock, flags);
>>         return ret;
>> @@ -1377,7 +1364,6 @@ static int mhi_update_channel_state(struct 
>> mhi_controller *mhi_cntrl,
>>       ret = mhi_device_get_sync(mhi_cntrl->mhi_dev);
>>       if (ret)
>>           return ret;
>> -    pm_runtime_get(mhi_cntrl->cntrl_dev);
>>         reinit_completion(&mhi_chan->completion);
>>       ret = mhi_send_cmd(mhi_cntrl, mhi_chan, cmd);
>> @@ -1408,8 +1394,6 @@ static int mhi_update_channel_state(struct 
>> mhi_controller *mhi_cntrl,
>>         trace_mhi_channel_command_end(mhi_cntrl, mhi_chan, to_state, 
>> TPS("Updated"));
>>   exit_channel_update:
>> -    pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
>> -    pm_runtime_put(mhi_cntrl->cntrl_dev);
>>       mhi_device_put(mhi_cntrl->mhi_dev);
>>         return ret;
>> @@ -1592,12 +1576,8 @@ static void mhi_reset_data_chan(struct 
>> mhi_controller *mhi_cntrl,
>>       while (tre_ring->rp != tre_ring->wp) {
>>           struct mhi_buf_info *buf_info = buf_ring->rp;
>>   -        if (mhi_chan->dir == DMA_TO_DEVICE) {
>> +        if (mhi_chan->dir == DMA_TO_DEVICE)
>>               atomic_dec(&mhi_cntrl->pending_pkts);
>> -            /* Release the reference got from mhi_queue() */
>> -            pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
>> -            pm_runtime_put(mhi_cntrl->cntrl_dev);
>> -        }
>>             if (!buf_info->pre_mapped)
>>               mhi_cntrl->unmap_single(mhi_cntrl, buf_info);
>> diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
>> index 
>> b4ef115189b505c3450ff0949ad2d09f3ed53386..fd690e8af693109ed8c55248db0ea153f9e69423 
>> 100644
>> --- a/drivers/bus/mhi/host/pm.c
>> +++ b/drivers/bus/mhi/host/pm.c
>> @@ -429,6 +429,7 @@ static int mhi_pm_mission_mode_transition(struct 
>> mhi_controller *mhi_cntrl)
>>         if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
>>           ret = -EIO;
>> +        read_unlock_bh(&mhi_cntrl->pm_lock);
>>           goto error_mission_mode;
>>       }
>>   @@ -459,11 +460,9 @@ static int 
>> mhi_pm_mission_mode_transition(struct mhi_controller *mhi_cntrl)
>>        */
>>       mhi_create_devices(mhi_cntrl);
>>   -    read_lock_bh(&mhi_cntrl->pm_lock);
>>     error_mission_mode:
>> -    mhi_cntrl->wake_put(mhi_cntrl, false);
>> -    read_unlock_bh(&mhi_cntrl->pm_lock);
>> +    mhi_device_put(mhi_cntrl->mhi_dev);
>>         return ret;
>>   }
>> @@ -1038,9 +1037,11 @@ int __mhi_device_get_sync(struct 
>> mhi_controller *mhi_cntrl)
>>           read_unlock_bh(&mhi_cntrl->pm_lock);
>>           return -EIO;
>>       }
>> +    read_unlock_bh(&mhi_cntrl->pm_lock);
>> +
>> +    pm_runtime_get_sync(&mhi_cntrl->mhi_dev->dev);
>> +    read_lock_bh(&mhi_cntrl->pm_lock);
>>       mhi_cntrl->wake_get(mhi_cntrl, true);
>> -    if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state))
>> -        mhi_trigger_resume(mhi_cntrl);
>>       read_unlock_bh(&mhi_cntrl->pm_lock);
>>         ret = wait_event_timeout(mhi_cntrl->state_event,
>> @@ -1049,9 +1050,7 @@ int __mhi_device_get_sync(struct mhi_controller 
>> *mhi_cntrl)
>>                    msecs_to_jiffies(mhi_cntrl->timeout_ms));
>>         if (!ret || MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
>> -        read_lock_bh(&mhi_cntrl->pm_lock);
>> -        mhi_cntrl->wake_put(mhi_cntrl, false);
>> -        read_unlock_bh(&mhi_cntrl->pm_lock);
>> +        mhi_device_put(mhi_cntrl->mhi_dev);
>>           return -EIO;
>>       }
>>   @@ -1339,11 +1338,10 @@ void mhi_device_put(struct mhi_device 
>> *mhi_dev)
>>         mhi_dev->dev_wake--;
>>       read_lock_bh(&mhi_cntrl->pm_lock);
>> -    if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state))
>> -        mhi_trigger_resume(mhi_cntrl);
>>         mhi_cntrl->wake_put(mhi_cntrl, false);
>>       read_unlock_bh(&mhi_cntrl->pm_lock);
>> +    pm_runtime_put(&mhi_cntrl->mhi_dev->dev);
>>   }
>>   EXPORT_SYMBOL_GPL(mhi_device_put);
>>
>

