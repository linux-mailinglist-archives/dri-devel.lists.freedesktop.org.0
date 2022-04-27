Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3308D5118DD
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 16:41:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04E8010E1B4;
	Wed, 27 Apr 2022 14:41:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3377810E93D;
 Wed, 27 Apr 2022 14:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651070495; x=1682606495;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=chW8rJzR1VAM7oNMSeS/OvPjzKydGU7NEGgWJb9XMDI=;
 b=a+bKgGK3ImOLGYJ+YQRKYSzEY17nQaEIniiGhY84IITpa9JXMeNCUVuH
 CWjTiOWAceF8VbtRAsR4lJjIT8OUEFXPAQ/cZ2C0Miz/t54/ZuPxgA8FU
 KLGh26FAy9hY7TwdjumEh11ekUVTKQEYcPq7bQp03WlcaYF2dD33XHscG k=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 27 Apr 2022 07:41:34 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 07:41:34 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 27 Apr 2022 07:41:33 -0700
Received: from [10.111.160.161] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 27 Apr
 2022 07:41:31 -0700
Message-ID: <89d01a02-c267-b264-4a28-eed3385a0729@quicinc.com>
Date: Wed, 27 Apr 2022 07:41:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v6 19/19] drm/msm/dpu: add wb_idx to DRM traces in
 dpu_encoder
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <freedreno@lists.freedesktop.org>
References: <1650984096-9964-1-git-send-email-quic_abhinavk@quicinc.com>
 <1650984096-9964-20-git-send-email-quic_abhinavk@quicinc.com>
 <2a12a6c7-aff2-b364-a653-80630e4710e5@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <2a12a6c7-aff2-b364-a653-80630e4710e5@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: markyacoub@chromium.org, liviu.dudau@arm.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 laurent.pinchart@ideasonboard.com, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry

Thanks for fixing it up.

I agree about the indentation issue.

And yes even wb_idx missing in TP_ARGS seems like a geniune miss.

But the weird part is it did not break my compilation. I tested even now 
without your fix.

Am I missing something to be enabled in my config to replicate the error 
for future reference?

Thanks

Abhinav
On 4/27/2022 3:43 AM, Dmitry Baryshkov wrote:
> On 26/04/2022 17:41, Abhinav Kumar wrote:
>> Change the DRM traces to include both the intf_mode
>> and wb_idx similar to the DRM prints in the previous change.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> This commit got traces broken. I'm going to apply a fix.
> 
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 13 ++++++++-----
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h   | 26 
>> ++++++++++++++++++--------
>>   2 files changed, 26 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index 35080c4..52516eb 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -1354,8 +1354,9 @@ static void dpu_encoder_frame_done_callback(
>>                * suppress frame_done without waiter,
>>                * likely autorefresh
>>                */
>> -            trace_dpu_enc_frame_done_cb_not_busy(DRMID(drm_enc),
>> -                    event, ready_phys->intf_idx);
>> +            trace_dpu_enc_frame_done_cb_not_busy(DRMID(drm_enc), event,
>> +                    
>> dpu_encoder_helper_get_intf_type(ready_phys->intf_mode),
>> +                    ready_phys->intf_idx, ready_phys->wb_idx);
>>               return;
>>           }
>> @@ -1433,9 +1434,11 @@ static void _dpu_encoder_trigger_flush(struct 
>> drm_encoder *drm_enc,
>>       if (ctl->ops.get_pending_flush)
>>           ret = ctl->ops.get_pending_flush(ctl);
>> -    trace_dpu_enc_trigger_flush(DRMID(drm_enc), phys->intf_idx,
>> -                    pending_kickoff_cnt, ctl->idx,
>> -                    extra_flush_bits, ret);
>> +    trace_dpu_enc_trigger_flush(DRMID(drm_enc),
>> +            dpu_encoder_helper_get_intf_type(phys->intf_mode),
>> +            phys->intf_idx, phys->wb_idx,
>> +            pending_kickoff_cnt, ctl->idx,
>> +            extra_flush_bits, ret);
>>   }
>>   /**
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
>> index 58b411f..1106d44 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
>> @@ -380,20 +380,26 @@ TRACE_EVENT(dpu_enc_rc,
>>   );
>>   TRACE_EVENT(dpu_enc_frame_done_cb_not_busy,
>> -    TP_PROTO(uint32_t drm_id, u32 event, enum dpu_intf intf_idx),
>> -    TP_ARGS(drm_id, event, intf_idx),
>> +    TP_PROTO(uint32_t drm_id, u32 event, char *intf_mode, enum 
>> dpu_intf intf_idx,
>> +            enum dpu_wb wb_idx),
>> +    TP_ARGS(drm_id, event, intf_mode, intf_idx, wb_idx),
>>       TP_STRUCT__entry(
>>           __field(    uint32_t,    drm_id        )
>>           __field(    u32,        event        )
>> +        __string(    intf_mode_str,        intf_mode    )
>>           __field(    enum dpu_intf,    intf_idx    )
>> +        __field(    enum dpu_wb,  wb_idx    )
> 
> Nit: indentation broken. Please use tabs.
> 
>>       ),
>>       TP_fast_assign(
>>           __entry->drm_id = drm_id;
>>           __entry->event = event;
>> +        __assign_str(intf_mode_str, intf_mode);
>>           __entry->intf_idx = intf_idx;
>> +        __entry->wb_idx = wb_idx;
>>       ),
>> -    TP_printk("id=%u, event=%u, intf=%d", __entry->drm_id, 
>> __entry->event,
>> -          __entry->intf_idx)
>> +    TP_printk("id=%u, event=%u, intf_mode=%s intf=%d wb=%d", 
>> __entry->drm_id,
>> +            __entry->event, __get_str(intf_mode_str),
>> +            __entry->intf_idx, __entry->wb_idx)
>>   );
>>   TRACE_EVENT(dpu_enc_frame_done_cb,
>> @@ -415,14 +421,16 @@ TRACE_EVENT(dpu_enc_frame_done_cb,
>>   );
>>   TRACE_EVENT(dpu_enc_trigger_flush,
>> -    TP_PROTO(uint32_t drm_id, enum dpu_intf intf_idx,
>> +    TP_PROTO(uint32_t drm_id, char *intf_mode, enum dpu_intf 
>> intf_idx, enum dpu_wb wb_idx,
>>            int pending_kickoff_cnt, int ctl_idx, u32 extra_flush_bits,
>>            u32 pending_flush_ret),
>> -    TP_ARGS(drm_id, intf_idx, pending_kickoff_cnt, ctl_idx,
>> +    TP_ARGS(drm_id, intf_mode, intf_idx, pending_kickoff_cnt, ctl_idx,
>>           extra_flush_bits, pending_flush_ret),
> 
> wb_idx is missing from the TP_ARGS, so compilation fails.
> 
>>       TP_STRUCT__entry(
>>           __field(    uint32_t,    drm_id            )
>> +        __string(    intf_mode_str,    intf_mode    )
>>           __field(    enum dpu_intf,    intf_idx        )
>> +        __field(    enum dpu_wb,  wb_idx        )
> 
> Nit: indentation broken. Please use tabs.
> 
>>           __field(    int,        pending_kickoff_cnt    )
>>           __field(    int,        ctl_idx            )
>>           __field(    u32,        extra_flush_bits    )
>> @@ -430,15 +438,17 @@ TRACE_EVENT(dpu_enc_trigger_flush,
>>       ),
>>       TP_fast_assign(
>>           __entry->drm_id = drm_id;
>> +        __assign_str(intf_mode_str, intf_mode);
>>           __entry->intf_idx = intf_idx;
>> +        __entry->wb_idx = wb_idx;
>>           __entry->pending_kickoff_cnt = pending_kickoff_cnt;
>>           __entry->ctl_idx = ctl_idx;
>>           __entry->extra_flush_bits = extra_flush_bits;
>>           __entry->pending_flush_ret = pending_flush_ret;
>>       ),
>> -    TP_printk("id=%u, intf_idx=%d, pending_kickoff_cnt=%d ctl_idx=%d "
>> +    TP_printk("id=%u, intf_mode=%s, intf_idx=%d, wb_idx=%d, 
>> pending_kickoff_cnt=%d ctl_idx=%d "
>>             "extra_flush_bits=0x%x pending_flush_ret=0x%x",
>> -          __entry->drm_id, __entry->intf_idx,
>> +          __entry->drm_id, __get_str(intf_mode_str), 
>> __entry->intf_idx, __entry->wb_idx,
>>             __entry->pending_kickoff_cnt, __entry->ctl_idx,
>>             __entry->extra_flush_bits, __entry->pending_flush_ret)
>>   );
> 
> 
