Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB494B9555
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 02:19:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4851610E6DE;
	Thu, 17 Feb 2022 01:19:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FD0210E6DE
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 01:19:20 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id u16so6010428ljk.2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 17:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=kMKPhd0npteRtxVZwKfbcEl24HZLUAKelJIe2aka2pM=;
 b=RwgjYHlL8W6BhynFFkJdVdN61lp0QOzzW4MA/4PRxpytoGAmx1ougIAkLmtFqLtVvu
 jNh2JRC/F8VPala0iyOhHWHRW2SQ1oSVautONKoWf/ZPSF8yv+a1byQ+lTsmLpDXDI7p
 Wl9aI57y9xyD1JAhjM2TWuzsBOZ+spU0us1CekG8JtaPra5BstyD+CdILMdPjz1Mo3c2
 wf0Th94Dsead5lWNKp5QpwT58dnmCp5wEMsEpuYV+HVeOhPbxDFX3dyOzU6oF2mfgs/z
 3sLRl0eP9g06bkqJMGiKbZBaYOKRyC697BUgMc41uG4APIyZquAHtSlHfVRYc1DfPQ9S
 B0YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kMKPhd0npteRtxVZwKfbcEl24HZLUAKelJIe2aka2pM=;
 b=cWUyRUrzDGyivlh9Puz5jlJSG7HPtp9SyIdl96F3uUXXUoXBN0Tw9HpKxbJS3hry6g
 1EhihJFoD5CQ6n9/QfLPwqsvskyvwlG7PWIcDXnmlkQ3bTt/Y5zyD4AArkIY32hI2hE2
 eVA/mTDSrfIEpZRr0QUVmDNDhkc+hvpgxktsIvA0sAMua6gi5hipd4p+tZLJrRJuKk12
 DDv88vj4gOjj0KA2wT29REbE5WRdftRdAiaT0wotndIy5eHV6qH2fv14WsVTTtfEemKF
 7SIH65vIRWQqi3Z42bNuYwCp7h+SWtlw8TXalJKOZ5+gt7r3atDgOzTEjAgqsMF+0jXl
 ZSfA==
X-Gm-Message-State: AOAM531ol/z7ANnJPPTVW6L2EkgKa4L50Zd16fb/Teb5vS1LBDHuzZto
 1nZdNdXe1aBww3Da6bXrwcgXrxJGt1OM9w==
X-Google-Smtp-Source: ABdhPJz8y34JTSGKQBsk0X7QOYfnpLq+Ms9tNqiaoYMjtBQwRXrHujmunH33fJl5BYPlwEa4GF/ONg==
X-Received: by 2002:a2e:3808:0:b0:232:f354:e625 with SMTP id
 f8-20020a2e3808000000b00232f354e625mr517419lja.278.1645060758955; 
 Wed, 16 Feb 2022 17:19:18 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id l12sm3301904lfg.32.2022.02.16.17.19.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 17:19:18 -0800 (PST)
Message-ID: <7a8a8fbd-c20d-7831-a35d-ddbe0e0ad1e3@linaro.org>
Date: Thu, 17 Feb 2022 04:19:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 5/6] drm/msm/dpu: remove struct dpu_encoder_irq
Content-Language: en-GB
To: Stephen Boyd <swboyd@chromium.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20220201151056.2480055-1-dmitry.baryshkov@linaro.org>
 <20220201151056.2480055-6-dmitry.baryshkov@linaro.org>
 <CAE-0n50p7nxqger_9i22TnWACNM4SM5OP+f9mS7wUZwi1dP1Ag@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAE-0n50p7nxqger_9i22TnWACNM4SM5OP+f9mS7wUZwi1dP1Ag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/02/2022 05:22, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2022-02-01 07:10:55)
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>> index ff2218155b44..803fd6f25da1 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>> @@ -231,7 +216,7 @@ struct dpu_encoder_phys {
>>          atomic_t pending_ctlstart_cnt;
>>          atomic_t pending_kickoff_cnt;
>>          wait_queue_head_t pending_kickoff_wq;
>> -       struct dpu_encoder_irq irq[INTR_IDX_MAX];
>> +       int irq[INTR_IDX_MAX];
>>   };
>>
>>   static inline int dpu_encoder_phys_inc_pending(struct dpu_encoder_phys *phys)
>> @@ -729,20 +727,8 @@ struct dpu_encoder_phys *dpu_encoder_phys_vid_init(
>>          phys_enc->split_role = p->split_role;
>>          phys_enc->intf_mode = INTF_MODE_VIDEO;
>>          phys_enc->enc_spinlock = p->enc_spinlock;
>> -       for (i = 0; i < INTR_IDX_MAX; i++) {
>> -               irq = &phys_enc->irq[i];
>> -               irq->irq_idx = -EINVAL;
>> -       }
>> -
>> -       irq = &phys_enc->irq[INTR_IDX_VSYNC];
>> -       irq->name = "vsync_irq";
>> -       irq->intr_idx = INTR_IDX_VSYNC;
>> -       irq->func = dpu_encoder_phys_vid_vblank_irq;
>> -
>> -       irq = &phys_enc->irq[INTR_IDX_UNDERRUN];
>> -       irq->name = "underrun";
>> -       irq->intr_idx = INTR_IDX_UNDERRUN;
>> -       irq->func = dpu_encoder_phys_vid_underrun_irq;
>> +       for (i = 0; i < INTR_IDX_MAX; i++)
> 
> Can this use ARRAY_SIZE(phys_enc->irq)? Safer that way.

Ack

> 
>> +               phys_enc->irq[i] = -EINVAL;
>>
>>          atomic_set(&phys_enc->vblank_refcount, 0);
>>          atomic_set(&phys_enc->pending_kickoff_cnt, 0);


-- 
With best wishes
Dmitry
