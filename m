Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD2A5082D4
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 09:52:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9557110F19E;
	Wed, 20 Apr 2022 07:52:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4369810F19E
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 07:52:37 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id q14so927345ljc.12
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 00:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=lxzMm7rYm7zxqRf8ZKbJvA6/fm07pE7yKmoCAAdvLHI=;
 b=x67P9BnQubNvDK4onzeaGqQGwTZXXPffPFoKnOV2xIXTivToPl/9ZYLEzsnUBmhLfe
 +/5s0aA9xGHbgGkvLVLUq0oXeJ4fYy2mT2t6JB7ltDMc1/dJnoXHoIm2TChfQ0RyD95M
 +v+jsW27raHq46kAjfSavi7d1fIPeGLig8iAsOIIMqy1ddLyfwB6EyGiNueD37L5WZPw
 ZDeAbfCDgmjs9su4OtWMwz5KSm4oJVzAhUrpGrmulyaPQG2nq8MAO+Rez/zue4O52LYq
 TBmWLKT2MRDPDzh/VdD9OpqY4zvH0Zz7KqT1ofHUwm9OwmBT/2G4JgRINpvdowPgZWvx
 ltMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lxzMm7rYm7zxqRf8ZKbJvA6/fm07pE7yKmoCAAdvLHI=;
 b=e+ChDORWYQ1q3xCvy2cTpvSVpaThpFkgtiBWwXTu4l9zIeuD3N0278uEvHqmlrBJZw
 d2xeAF9Kj0bfVryQGSALQDk6Uwdx3apG16IOMJQh/OY8LfQd94Uqzv0qoyRZ6R0yee0w
 mG9ihgxNDx+1oegrVHZ8bNTqd+pHpTj48ib3282S5YwvKSIaGrnXgiQcm3TgOcFbnyd2
 agrrTs//s4q4Hjgt0NLCZT5FOXWttFRUYJli9/bUnJo4CfMAeGz8neDosmYpCFQMim02
 WTfE0OdMID1HTMq4GGnJ+t+hJs8SxCkTxkzbzpG4kOevBdgTnXRxM6z5DZ4TaFC2A7Mw
 pDIQ==
X-Gm-Message-State: AOAM533qcaMpOeewR5lLVgN6FxJnDXg41bGij8HmUFEConMpSJbBh2ZU
 sy1MX2Sy/3/gFx/p2lIZssIRbg==
X-Google-Smtp-Source: ABdhPJxnGtS83Dh5yOfyJg3oko4rDeQ8TYhFKJEEAoRP0kVPuFyqZCgMwmCLXgInOV9JL5cY/EQdOQ==
X-Received: by 2002:a2e:9d46:0:b0:24c:7f32:869e with SMTP id
 y6-20020a2e9d46000000b0024c7f32869emr12370342ljj.348.1650441155564; 
 Wed, 20 Apr 2022 00:52:35 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 d28-20020a056512321c00b00470d2987b50sm1188304lfe.137.2022.04.20.00.52.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 00:52:35 -0700 (PDT)
Message-ID: <e889b486-4325-2831-9e8b-8bc63e33ac0a@linaro.org>
Date: Wed, 20 Apr 2022 10:52:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 14/17] drm/msm/dpu: add the writeback connector layer
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org
References: <1650419169-13760-1-git-send-email-quic_abhinavk@quicinc.com>
 <1650419169-13760-15-git-send-email-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1650419169-13760-15-git-send-email-quic_abhinavk@quicinc.com>
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
Cc: markyacoub@chromium.org, liviu.dudau@arm.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 laurent.pinchart@ideasonboard.com, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/04/2022 04:46, Abhinav Kumar wrote:
> Introduce the dpu_writeback module which serves as the
> interface between dpu operations and the drm_writeback.
> 
> This module manages the connector related operations for
> dpu writeback.
> 
> changes in v2:
> 	- start using drm_writeback_connector_init_with_encoder()
> 	- drop unnecessary arguments from dpu_writeback_init()
> 	- rebase on msm-next tip and remove usage of priv->connectors
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/Makefile                  |  1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 68 +++++++++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h | 25 ++++++++++
>   3 files changed, 94 insertions(+)
>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h
> 
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index 0387f22..66395ee 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -80,6 +80,7 @@ msm-$(CONFIG_DRM_MSM_DPU) += \
>   	disp/dpu1/dpu_plane.o \
>   	disp/dpu1/dpu_rm.o \
>   	disp/dpu1/dpu_vbif.o \
> +	disp/dpu1/dpu_writeback.o
>   
>   msm-$(CONFIG_DRM_MSM_MDSS) += \
>   	msm_mdss.o \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> new file mode 100644
> index 0000000..526d884
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> @@ -0,0 +1,68 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include "dpu_writeback.h"
> +
> +static int dpu_wb_conn_get_modes(struct drm_connector *connector)
> +{
> +	struct drm_device *dev = connector->dev;
> +
> +	return drm_add_modes_noedid(connector, dev->mode_config.max_width,
> +			dev->mode_config.max_height);
> +}
> +
> +static const struct drm_connector_funcs dpu_wb_conn_funcs = {
> +	.reset = drm_atomic_helper_connector_reset,
> +	.fill_modes = drm_helper_probe_single_connector_modes,
> +	.destroy = drm_connector_cleanup,
> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +};
> +
> +static int dpu_wb_conn_prepare_job(struct drm_writeback_connector *connector,
> +		struct drm_writeback_job *job)
> +{
> +	if (!job->fb)
> +		return 0;
> +
> +	dpu_encoder_prepare_wb_job(connector->encoder, job);
> +
> +	return 0;
> +}
> +
> +static void dpu_wb_conn_cleanup_job(struct drm_writeback_connector *connector,
> +		struct drm_writeback_job *job)
> +{
> +	if (!job->fb)
> +		return;
> +
> +	dpu_encoder_cleanup_wb_job(connector->encoder, job);
> +}
> +
> +static const struct drm_connector_helper_funcs dpu_wb_conn_helper_funcs = {
> +	.get_modes = dpu_wb_conn_get_modes,
> +	.prepare_writeback_job = dpu_wb_conn_prepare_job,
> +	.cleanup_writeback_job = dpu_wb_conn_cleanup_job,
> +};
> +
> +int dpu_writeback_init(struct drm_device *dev, struct drm_encoder *enc,
> +		const u32 *format_list, u32 num_formats)
> +{
> +	struct dpu_wb_connector *dpu_wb_conn;
> +	int rc = 0;
> +
> +	dpu_wb_conn = devm_kzalloc(dev->dev, sizeof(*dpu_wb_conn), GFP_KERNEL);
> +
> +	drm_connector_helper_add(&dpu_wb_conn->base.base, &dpu_wb_conn_helper_funcs);
> +
> +	/* DPU initializes the encoder and sets it up completely for writeback
> +	 * cases and hence should use the new API drm_writeback_connector_init_with_encoder
> +	 * to initialize the writeback connector
> +	 */
> +	rc = drm_writeback_connector_init_with_encoder(dev, &dpu_wb_conn->base, enc,
> +			&dpu_wb_conn_funcs, format_list, num_formats);
> +
> +	return rc;
> +}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h
> new file mode 100644
> index 0000000..05aff05
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef _DPU_WRITEBACK_H
> +#define _DPU_WRITEBACK_H
> +
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_file.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_writeback.h>
> +
> +#include "msm_drv.h"
> +#include "dpu_kms.h"
> +#include "dpu_encoder_phys.h"
> +
> +struct dpu_wb_connector {
> +	struct drm_writeback_connector base;
> +};

Do you plan to add more fields to this struct? If not, we can probably 
drop it and use struct drm_writeback_connector directly.

> +
> +int dpu_writeback_init(struct drm_device *dev, struct drm_encoder *enc,
> +		const u32 *format_list, u32 num_formats);
> +
> +#endif /*_DPU_WRITEBACK_H */


-- 
With best wishes
Dmitry
