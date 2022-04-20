Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F5A50906F
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 21:26:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFAB810F1AF;
	Wed, 20 Apr 2022 19:26:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F7F10F1AC
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 19:26:42 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id bj36so3063086ljb.13
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 12:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ipwBCjoYth2r8BHt1hdNr0fbbpV2s9e6CidOy5kCnRk=;
 b=G7ntNaISZyJe6C5ktGzRHHp8aPeIrzFL2vBpHai5MV9h88r3nubhwhhqAYC+rB7MUy
 kskLFuCYH5N6VotvBIdRbLVYloK6r8o2nkLXju0eVC21tJe+KS1HSmtsKW0rJPrKgGju
 s/T1Ol7GXAnTRwzP7F6jrWxGTy7NAqZbEoMnRoCc8xA9lZWgJTuBp5zPhcJyy2zeRTuG
 wVlfq9lX0qB8C8XuqxIN5N5vfO0WFEP99mNpc3LrVohGhhxQOUcN7xydMohXb022mW26
 iPJ7D/nw9e/36Vwkm2iuIvAONlfqNwZekT0SHB4FE6R7qBFME1uO34HgtTsMBVTHiE+5
 r16w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ipwBCjoYth2r8BHt1hdNr0fbbpV2s9e6CidOy5kCnRk=;
 b=dmVM63VgC5EH7N8QjuYldrXBYEAhu6mcn2UX+4N8FZgOvA0Ahyx3ZL6Ifen9rZINHV
 kv9ucDkNb9vMso35rmpXK9koAeJlgpYrj1QpptKk3hPA4I8DUK7MkQsym7sgJccFvxNY
 JGguv7myg6P+9OlMUT1tUymFE1UOXHFhTrJQYbvBIYOeAL3jM5aOXyjDEQVx+mmhugb+
 jYtiT/4QIA2VVcREoBCzUdPwvCZdhtWKakqNSdQ6iJ4NrAM1qSvl+fTk0rDdEED3C0Bh
 eMlnMbiULGMTgZahb/rgC9j8AB5S/ET1k78gK5Sn9NyQmiNgkLiCYP6rINiAp+bWSJCX
 bqPg==
X-Gm-Message-State: AOAM533xTMftNj2dV9vA8JaiVO0/UviRV1T+kg3h6hYiL47Ggyo81UNC
 bUzcQOVuCC4y1Z1v1vexKvgwsg==
X-Google-Smtp-Source: ABdhPJxkI9Oh9UnT+kYCXeXTW7wwxMYVaGmG7vG649cOsLS0U7i8qnGaQrvLgvdip5t31tV4vqGv+Q==
X-Received: by 2002:a05:651c:1501:b0:249:8d28:5659 with SMTP id
 e1-20020a05651c150100b002498d285659mr14462626ljf.138.1650482800510; 
 Wed, 20 Apr 2022 12:26:40 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 g21-20020a2e9395000000b0024da326f812sm1785962ljh.118.2022.04.20.12.26.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 12:26:40 -0700 (PDT)
Message-ID: <64ca7ca5-050e-2f36-9d92-605c5a002d46@linaro.org>
Date: Wed, 20 Apr 2022 22:26:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 14/17] drm/msm/dpu: add the writeback connector layer
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org
References: <1650419169-13760-1-git-send-email-quic_abhinavk@quicinc.com>
 <1650419169-13760-15-git-send-email-quic_abhinavk@quicinc.com>
 <e889b486-4325-2831-9e8b-8bc63e33ac0a@linaro.org>
 <0ed00c12-2225-3ed2-1c5e-0005a8c2a8b0@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <0ed00c12-2225-3ed2-1c5e-0005a8c2a8b0@quicinc.com>
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
Cc: markyacoub@chromium.org, liviu.dudau@arm.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 laurent.pinchart@ideasonboard.com, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/04/2022 22:10, Abhinav Kumar wrote:
> 
> 
> On 4/20/2022 12:52 AM, Dmitry Baryshkov wrote:
>> On 20/04/2022 04:46, Abhinav Kumar wrote:
>>> Introduce the dpu_writeback module which serves as the
>>> interface between dpu operations and the drm_writeback.
>>>
>>> This module manages the connector related operations for
>>> dpu writeback.
>>>
>>> changes in v2:
>>>     - start using drm_writeback_connector_init_with_encoder()
>>>     - drop unnecessary arguments from dpu_writeback_init()
>>>     - rebase on msm-next tip and remove usage of priv->connectors
>>>
>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/Makefile                  |  1 +
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 68 
>>> +++++++++++++++++++++++++++
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h | 25 ++++++++++
>>>   3 files changed, 94 insertions(+)
>>>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
>>>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h
>>>
>>> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
>>> index 0387f22..66395ee 100644
>>> --- a/drivers/gpu/drm/msm/Makefile
>>> +++ b/drivers/gpu/drm/msm/Makefile
>>> @@ -80,6 +80,7 @@ msm-$(CONFIG_DRM_MSM_DPU) += \
>>>       disp/dpu1/dpu_plane.o \
>>>       disp/dpu1/dpu_rm.o \
>>>       disp/dpu1/dpu_vbif.o \
>>> +    disp/dpu1/dpu_writeback.o
>>>   msm-$(CONFIG_DRM_MSM_MDSS) += \
>>>       msm_mdss.o \
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
>>> new file mode 100644
>>> index 0000000..526d884
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
>>> @@ -0,0 +1,68 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights 
>>> reserved.
>>> + */
>>> +
>>> +#include "dpu_writeback.h"
>>> +
>>> +static int dpu_wb_conn_get_modes(struct drm_connector *connector)
>>> +{
>>> +    struct drm_device *dev = connector->dev;
>>> +
>>> +    return drm_add_modes_noedid(connector, dev->mode_config.max_width,
>>> +            dev->mode_config.max_height);
>>> +}
>>> +
>>> +static const struct drm_connector_funcs dpu_wb_conn_funcs = {
>>> +    .reset = drm_atomic_helper_connector_reset,
>>> +    .fill_modes = drm_helper_probe_single_connector_modes,
>>> +    .destroy = drm_connector_cleanup,
>>> +    .atomic_duplicate_state = 
>>> drm_atomic_helper_connector_duplicate_state,
>>> +    .atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>>> +};
>>> +
>>> +static int dpu_wb_conn_prepare_job(struct drm_writeback_connector 
>>> *connector,
>>> +        struct drm_writeback_job *job)
>>> +{
>>> +    if (!job->fb)
>>> +        return 0;
>>> +
>>> +    dpu_encoder_prepare_wb_job(connector->encoder, job);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static void dpu_wb_conn_cleanup_job(struct drm_writeback_connector 
>>> *connector,
>>> +        struct drm_writeback_job *job)
>>> +{
>>> +    if (!job->fb)
>>> +        return;
>>> +
>>> +    dpu_encoder_cleanup_wb_job(connector->encoder, job);
>>> +}
>>> +
>>> +static const struct drm_connector_helper_funcs 
>>> dpu_wb_conn_helper_funcs = {
>>> +    .get_modes = dpu_wb_conn_get_modes,
>>> +    .prepare_writeback_job = dpu_wb_conn_prepare_job,
>>> +    .cleanup_writeback_job = dpu_wb_conn_cleanup_job,
>>> +};
>>> +
>>> +int dpu_writeback_init(struct drm_device *dev, struct drm_encoder *enc,
>>> +        const u32 *format_list, u32 num_formats)
>>> +{
>>> +    struct dpu_wb_connector *dpu_wb_conn;
>>> +    int rc = 0;
>>> +
>>> +    dpu_wb_conn = devm_kzalloc(dev->dev, sizeof(*dpu_wb_conn), 
>>> GFP_KERNEL);
>>> +
>>> +    drm_connector_helper_add(&dpu_wb_conn->base.base, 
>>> &dpu_wb_conn_helper_funcs);
>>> +
>>> +    /* DPU initializes the encoder and sets it up completely for 
>>> writeback
>>> +     * cases and hence should use the new API 
>>> drm_writeback_connector_init_with_encoder
>>> +     * to initialize the writeback connector
>>> +     */
>>> +    rc = drm_writeback_connector_init_with_encoder(dev, 
>>> &dpu_wb_conn->base, enc,
>>> +            &dpu_wb_conn_funcs, format_list, num_formats);
>>> +
>>> +    return rc;
>>> +}
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h
>>> new file mode 100644
>>> index 0000000..05aff05
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h
>>> @@ -0,0 +1,25 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +/*
>>> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights 
>>> reserved.
>>> + */
>>> +
>>> +#ifndef _DPU_WRITEBACK_H
>>> +#define _DPU_WRITEBACK_H
>>> +
>>> +#include <drm/drm_crtc.h>
>>> +#include <drm/drm_file.h>
>>> +#include <drm/drm_probe_helper.h>
>>> +#include <drm/drm_writeback.h>
>>> +
>>> +#include "msm_drv.h"
>>> +#include "dpu_kms.h"
>>> +#include "dpu_encoder_phys.h"
>>> +
>>> +struct dpu_wb_connector {
>>> +    struct drm_writeback_connector base;
>>> +};
>>
>> Do you plan to add more fields to this struct? If not, we can probably 
>> drop it and use struct drm_writeback_connector directly.
> 
> Glad you asked about it. I was expecting this question because it looks 
> like a very "light" struct.
> 
> Yes, we do plan to expand this as we will keep adding writeback features 
> sequentially now to make it ready for this to be absorbed downstream 
> completely.

Then a separate struct is fine with me.

> 
>>
>>> +
>>> +int dpu_writeback_init(struct drm_device *dev, struct drm_encoder *enc,
>>> +        const u32 *format_list, u32 num_formats);
>>> +
>>> +#endif /*_DPU_WRITEBACK_H */
>>
>>


-- 
With best wishes
Dmitry
