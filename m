Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8167B50ED85
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 02:20:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78D1E10EF10;
	Tue, 26 Apr 2022 00:20:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5A7E10EF02
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 00:20:08 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id 17so19916335lji.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 17:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=57bQ4tbDtrBsm9JA8qbG1UId0HN6kcUhI2t0zn8mFdI=;
 b=l4bljSrE7nSWQ8sv1wwHLb2bmAUO2MLoIF4nzXQTKpKZJEYjAnab6rrZlaSm57E0BK
 rUNmAutpYK4w+fT5CYN1ruOPVBTv1yW/2pgNr8VEmCZ+zLUxjDDNd7P75b99TKf0xyDq
 mx0oPgI7OW88rAno4b2rZtvu0wlxFBd/N92W10DiHE6vhQ35wTceRX/X9GtayF/pW/Ak
 WMnTyMkEFbJvMnUCvkindVpNRYzNCMy7EFuESINj3TgCOyzCgv/YgWXJ+kSlV//mOPv3
 GcWskDWHMAQx0x1wx9T3kvWAuRUG4zZwKjHBSiLXcTVDjeD94BR5QIC6JuzkHCZHXKmU
 7PXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=57bQ4tbDtrBsm9JA8qbG1UId0HN6kcUhI2t0zn8mFdI=;
 b=0ZGXAG/O7guEfjVzdfan5wqFPY8vtpvI/CgJs0RQDPrmBmML/T4nSycQoysPzeDidl
 1SfoZNa6nGItTmIcHtQO13ab7cClBJjYuGd2aZGFw2zXZVg/bGLRjGQA0qaFrQgfou7H
 p72Ffb+BAbTTmXkHpFdZJd/FGphlp3RHxxXSseLwTAPMaZCmuxxLfGaEQ0zweKaq8bwS
 nrUD+qyXZtZrI6OfVYBL2WAtsOfA9RM5BSNjSctU0UvXPm31+Eg0hRwRyxI0nU2FhWue
 Fm2acK2VdWEYmsGHDuYcyn2YZIod/u9tGSEdURt/X0UJV7RJN+ikEHgqm0j9GQkVN1gq
 GABQ==
X-Gm-Message-State: AOAM531/PULvj5RPbdZPEVdLfTQkRmy2EhZtM6jbHl9EZ5UohZz/VR3i
 MWdoeHgNBIubc+SdgnCZVji2CQ==
X-Google-Smtp-Source: ABdhPJzH7GfvcPfVU4Jc8k/dJyqKslOgVlVEOo7WVhX2E/b8pEahHX7aAn2j28gi1wtHihnoamJrdA==
X-Received: by 2002:a2e:b5ba:0:b0:24d:d4ce:e120 with SMTP id
 f26-20020a2eb5ba000000b0024dd4cee120mr12655216ljn.60.1650932406815; 
 Mon, 25 Apr 2022 17:20:06 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 n10-20020a196f4a000000b0047209a58a56sm483726lfk.104.2022.04.25.17.20.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 17:20:06 -0700 (PDT)
Message-ID: <9aaf3335-158d-71f9-32f4-426debba96e8@linaro.org>
Date: Tue, 26 Apr 2022 03:20:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v5 14/19] drm/msm/dpu: add the writeback connector layer
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org
References: <1650846730-19226-1-git-send-email-quic_abhinavk@quicinc.com>
 <1650846730-19226-15-git-send-email-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1650846730-19226-15-git-send-email-quic_abhinavk@quicinc.com>
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

On 25/04/2022 03:32, Abhinav Kumar wrote:
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
> changes in v3:
> 	- none
> 
> changes in v4:
> 	- none
> 
> changes in v5:
> 	- store the drm_enc in the dpu_wb_conn to be used while
> 	  using dpu_encoder APIs
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/Makefile                  |  1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 76 +++++++++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h | 31 +++++++++++
>   3 files changed, 108 insertions(+)
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
> index 0000000..7620ffe
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> @@ -0,0 +1,76 @@
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
> +
> +	struct dpu_wb_connector *dpu_wb_conn = to_dpu_wb_conn(connector);
> +
> +	if (!job->fb)
> +		return 0;
> +
> +	dpu_encoder_prepare_wb_job(dpu_wb_conn->wb_enc, job);
> +
> +	return 0;
> +}
> +
> +static void dpu_wb_conn_cleanup_job(struct drm_writeback_connector *connector,
> +		struct drm_writeback_job *job)
> +{
> +	struct dpu_wb_connector *dpu_wb_conn = to_dpu_wb_conn(connector);
> +
> +	if (!job->fb)
> +		return;
> +
> +	dpu_encoder_cleanup_wb_job(dpu_wb_conn->wb_enc, job);
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
> +	if (!rc)
> +		dpu_wb_conn->wb_enc = enc;
> +
> +	return rc;
> +}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h
> new file mode 100644
> index 0000000..5a75ea9
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h
> @@ -0,0 +1,31 @@
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
> +	struct drm_encoder *wb_enc;
> +};
> +
> +static inline struct dpu_wb_connector *to_dpu_wb_conn(struct drm_writeback_connector *conn)
> +{
> +	return container_of(conn, struct dpu_wb_connector, base);
> +}
> +
> +int dpu_writeback_init(struct drm_device *dev, struct drm_encoder *enc,
> +		const u32 *format_list, u32 num_formats);
> +
> +#endif /*_DPU_WRITEBACK_H */


-- 
With best wishes
Dmitry
