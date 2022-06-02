Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2326D53C05C
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 23:30:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99840113565;
	Thu,  2 Jun 2022 21:30:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1F2F1135F7
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 21:30:30 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id g25so6548075ljm.2
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 14:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=XzPSZDkHqlfhXXNElxfL2tzko5P7SZop+8kxOD3fOXc=;
 b=nB7UbuH4mmQHiE+0EIKbQv5WhULrT7aFENXAZoBtooEo2FhwYRU8nFWiTfwQk2SWu8
 oPW7aCCOHP33+JRtrc9KEC4ezZ54Th4d4vr9J/SaohgpHs2t3ToogHX2pfNiBLpY78ZU
 ixWXVrdBm2fD3AHGO3VcQZGemV91KuseNzvSlPM8QgezQfmAgeWhKpmf8JoUoSYqPSOl
 rFQ4CE8uyuUZkuTFaA+DE4xD4NZWQ6dKsg7aESBj//bZhgTJY6OR4Fm5B/fI1KUAuL9i
 ozg5Sy5jwLf5Pav8BNtsYe8740H2f3zWD6PkYSkr8wEvxYPmUzmHZ7Rw6h24gamKQ/VN
 3lcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XzPSZDkHqlfhXXNElxfL2tzko5P7SZop+8kxOD3fOXc=;
 b=kZyh5+exlIyTHAwkCp9hiYxX2pN6usTcKjV0fjTEkdvdcsoe52unWmBRokCS9jQ97C
 lNaTMfh88fDWUAM1sYcU6OcIgFHzsXE5dqD17MKNHUTULDPLSJj0sVvQLKuIkRHhLK5A
 QlvW1YqLiv34esgGxVo9Sul09lrkaGtItECO3nTDIGEKfHMWZJ/DV4DTp5meQmYYfmrs
 WM8f9aEQhmfqFuK4BYTU4loTDXNs8QbuB8uMo1W59tweJkWm6DOWBwZ80pxjSFBA9azN
 dZJ3Yt/Z11E4almeSD3+imzvxzqzMj3Ajq3AHbVPkeXwQzv1eaNmd+bqoeKGft8cr6/t
 BiDQ==
X-Gm-Message-State: AOAM530TI0mjhmhZMRKSRICOihJn4Du+Msz3vU97zxWy+8kseQ5HEaSP
 8h8BYeN3SYFxxKC0YZ8f2MnULQ==
X-Google-Smtp-Source: ABdhPJz4BAmKowdTjBR4WRTsxlt2gWIgsTgak+woebkooU0PA8SO0VLTygNBbGBWyRrot+wZDst0Dw==
X-Received: by 2002:a05:651c:893:b0:249:4023:3818 with SMTP id
 d19-20020a05651c089300b0024940233818mr44377790ljq.44.1654205428972; 
 Thu, 02 Jun 2022 14:30:28 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 w41-20020a0565120b2900b00477a51842aasm1214248lfu.211.2022.06.02.14.30.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jun 2022 14:30:28 -0700 (PDT)
Message-ID: <fb8f2f80-e016-80d4-cf30-0b1df5bde261@linaro.org>
Date: Fri, 3 Jun 2022 00:30:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 0/7] drm/msm: clean up the hw catalog init
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20220602202207.1754351-1-dmitry.baryshkov@linaro.org>
 <cb7e2c75-286a-2b74-7e21-bee90a83a91d@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <cb7e2c75-286a-2b74-7e21-bee90a83a91d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/06/2022 23:24, Abhinav Kumar wrote:
> 
> 
> On 6/2/2022 1:22 PM, Dmitry Baryshkov wrote:
>> Replace superfluous cfg_init functions, which just assign a static
>> config to the struct dpu_mdss_cfg, with static instances of struct
>> dpu_mdss_cfg.
>>
>> Changes since v2:
>>   - Add DPU_MIXER_COMBINED_ALPHA to sc7180's mixer features mask (noted
>>     by Abhinav).
>>
>> Changes since v1:
>>   - Turn catalog->perf and catalog->dma_cfg to be pointers, otherwise
>>     clang complains that they are not constant.
>>
> 
> I see you have dropped the R-bs from all the changes in V2.
> Can you please add them back?

Yes, I missed that in v3. Should be fixed in v4.

> 
>> Dmitry Baryshkov (7):
>>    drm/msm/dpu: use feature bit for LM combined alpha check
>>    drm/msm/dpu: move VBIF_XINL_QOS_LVL_REMAP size to hw_catalog
>>    drm/msm/dpu: remove hwversion field from data structures
>>    drm/msm/dpu: change catalog->perf to be a const pointer
>>    drm/msm/dpu: change catalog->dma_cfg to be a const pointer
>>    drm/msm/dpu: constify struct dpu_mdss_cfg
>>    drm/msm/dpu: make dpu hardware catalog static const
>>
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c |  24 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |   4 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |   4 +-
>>   .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  12 +-
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 502 ++++++++----------
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  20 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    |   1 -
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c    |   5 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h    |   2 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c   |   1 -
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c |   5 +-
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |   2 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   |   1 -
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c     |   7 +-
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c    |   1 -
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   |   1 -
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |   5 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |   4 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c    |   1 -
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   2 -
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c   |   5 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     |   1 -
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   6 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |   2 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |  20 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |   2 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        |   2 +-
>>   27 files changed, 283 insertions(+), 359 deletions(-)
>>


-- 
With best wishes
Dmitry
