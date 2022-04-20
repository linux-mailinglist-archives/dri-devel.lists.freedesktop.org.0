Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6690050900E
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 21:10:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9A4810E2BE;
	Wed, 20 Apr 2022 19:10:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C90CD10E2BE;
 Wed, 20 Apr 2022 19:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650481819; x=1682017819;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=xkvJpLtDpxdHJ/a8Eiyst1yZ+HPaIxb+XrMvkvJaNsw=;
 b=BRPleOyll0cUnYhkkvEq5ZjJfoZLQe3dZc0hlZgHxpoUU1OZ9+WkHI8J
 k7GOkTE7ISWzC2ypBZ5XFu4KjFStUdKUEJXPX3b5yRekSy8X5CO11fKFY
 SV0MUGLYklF7ty9gMEy9AhWYKjLFp9hbED/hbHLCYliCBHDV+AWI/sHX0 4=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 20 Apr 2022 12:10:19 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2022 12:10:19 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 20 Apr 2022 12:10:18 -0700
Received: from [10.111.175.210] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 20 Apr
 2022 12:10:16 -0700
Message-ID: <0ed00c12-2225-3ed2-1c5e-0005a8c2a8b0@quicinc.com>
Date: Wed, 20 Apr 2022 12:10:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 14/17] drm/msm/dpu: add the writeback connector layer
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <freedreno@lists.freedesktop.org>
References: <1650419169-13760-1-git-send-email-quic_abhinavk@quicinc.com>
 <1650419169-13760-15-git-send-email-quic_abhinavk@quicinc.com>
 <e889b486-4325-2831-9e8b-8bc63e33ac0a@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <e889b486-4325-2831-9e8b-8bc63e33ac0a@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
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



On 4/20/2022 12:52 AM, Dmitry Baryshkov wrote:
> On 20/04/2022 04:46, Abhinav Kumar wrote:
>> Introduce the dpu_writeback module which serves as the
>> interface between dpu operations and the drm_writeback.
>>
>> This module manages the connector related operations for
>> dpu writeback.
>>
>> changes in v2:
>>     - start using drm_writeback_connector_init_with_encoder()
>>     - drop unnecessary arguments from dpu_writeback_init()
>>     - rebase on msm-next tip and remove usage of priv->connectors
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/Makefile                  |  1 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 68 
>> +++++++++++++++++++++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h | 25 ++++++++++
>>   3 files changed, 94 insertions(+)
>>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
>>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h
>>
>> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
>> index 0387f22..66395ee 100644
>> --- a/drivers/gpu/drm/msm/Makefile
>> +++ b/drivers/gpu/drm/msm/Makefile
>> @@ -80,6 +80,7 @@ msm-$(CONFIG_DRM_MSM_DPU) += \
>>       disp/dpu1/dpu_plane.o \
>>       disp/dpu1/dpu_rm.o \
>>       disp/dpu1/dpu_vbif.o \
>> +    disp/dpu1/dpu_writeback.o
>>   msm-$(CONFIG_DRM_MSM_MDSS) += \
>>       msm_mdss.o \
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
>> new file mode 100644
>> index 0000000..526d884
>> --- /dev/null
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
>> @@ -0,0 +1,68 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights 
>> reserved.
>> + */
>> +
>> +#include "dpu_writeback.h"
>> +
>> +static int dpu_wb_conn_get_modes(struct drm_connector *connector)
>> +{
>> +    struct drm_device *dev = connector->dev;
>> +
>> +    return drm_add_modes_noedid(connector, dev->mode_config.max_width,
>> +            dev->mode_config.max_height);
>> +}
>> +
>> +static const struct drm_connector_funcs dpu_wb_conn_funcs = {
>> +    .reset = drm_atomic_helper_connector_reset,
>> +    .fill_modes = drm_helper_probe_single_connector_modes,
>> +    .destroy = drm_connector_cleanup,
>> +    .atomic_duplicate_state = 
>> drm_atomic_helper_connector_duplicate_state,
>> +    .atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>> +};
>> +
>> +static int dpu_wb_conn_prepare_job(struct drm_writeback_connector 
>> *connector,
>> +        struct drm_writeback_job *job)
>> +{
>> +    if (!job->fb)
>> +        return 0;
>> +
>> +    dpu_encoder_prepare_wb_job(connector->encoder, job);
>> +
>> +    return 0;
>> +}
>> +
>> +static void dpu_wb_conn_cleanup_job(struct drm_writeback_connector 
>> *connector,
>> +        struct drm_writeback_job *job)
>> +{
>> +    if (!job->fb)
>> +        return;
>> +
>> +    dpu_encoder_cleanup_wb_job(connector->encoder, job);
>> +}
>> +
>> +static const struct drm_connector_helper_funcs 
>> dpu_wb_conn_helper_funcs = {
>> +    .get_modes = dpu_wb_conn_get_modes,
>> +    .prepare_writeback_job = dpu_wb_conn_prepare_job,
>> +    .cleanup_writeback_job = dpu_wb_conn_cleanup_job,
>> +};
>> +
>> +int dpu_writeback_init(struct drm_device *dev, struct drm_encoder *enc,
>> +        const u32 *format_list, u32 num_formats)
>> +{
>> +    struct dpu_wb_connector *dpu_wb_conn;
>> +    int rc = 0;
>> +
>> +    dpu_wb_conn = devm_kzalloc(dev->dev, sizeof(*dpu_wb_conn), 
>> GFP_KERNEL);
>> +
>> +    drm_connector_helper_add(&dpu_wb_conn->base.base, 
>> &dpu_wb_conn_helper_funcs);
>> +
>> +    /* DPU initializes the encoder and sets it up completely for 
>> writeback
>> +     * cases and hence should use the new API 
>> drm_writeback_connector_init_with_encoder
>> +     * to initialize the writeback connector
>> +     */
>> +    rc = drm_writeback_connector_init_with_encoder(dev, 
>> &dpu_wb_conn->base, enc,
>> +            &dpu_wb_conn_funcs, format_list, num_formats);
>> +
>> +    return rc;
>> +}
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h
>> new file mode 100644
>> index 0000000..05aff05
>> --- /dev/null
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h
>> @@ -0,0 +1,25 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights 
>> reserved.
>> + */
>> +
>> +#ifndef _DPU_WRITEBACK_H
>> +#define _DPU_WRITEBACK_H
>> +
>> +#include <drm/drm_crtc.h>
>> +#include <drm/drm_file.h>
>> +#include <drm/drm_probe_helper.h>
>> +#include <drm/drm_writeback.h>
>> +
>> +#include "msm_drv.h"
>> +#include "dpu_kms.h"
>> +#include "dpu_encoder_phys.h"
>> +
>> +struct dpu_wb_connector {
>> +    struct drm_writeback_connector base;
>> +};
> 
> Do you plan to add more fields to this struct? If not, we can probably 
> drop it and use struct drm_writeback_connector directly.

Glad you asked about it. I was expecting this question because it looks 
like a very "light" struct.

Yes, we do plan to expand this as we will keep adding writeback features 
sequentially now to make it ready for this to be absorbed downstream 
completely.

> 
>> +
>> +int dpu_writeback_init(struct drm_device *dev, struct drm_encoder *enc,
>> +        const u32 *format_list, u32 num_formats);
>> +
>> +#endif /*_DPU_WRITEBACK_H */
> 
> 
