Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE92552894
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 02:18:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FC8810EC1E;
	Tue, 21 Jun 2022 00:18:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B066310E82D;
 Tue, 21 Jun 2022 00:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655770680; x=1687306680;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9CM761RPUf3H+9foG8Vhn4+yZioOjyJpb6+jXL+c35s=;
 b=D7mhEj3JI1NCcucIszdog25fucY1XB30p00KD7yhl6GUZPrYFdEZhLLY
 FVAyBCSD6sOwMhNmoqo/6uZ9NVH8mNuMxd2LlxhR8CpJUD8PwbqjUO+uU
 OxdFXg9iySJj3ozfCR2yQ9NY41qcyMBU7Xk1xygttMIKnTeRrzP/6PBw9 8=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 20 Jun 2022 17:18:00 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 17:17:59 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 20 Jun 2022 17:17:59 -0700
Received: from [10.111.166.89] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 20 Jun
 2022 17:17:57 -0700
Message-ID: <392c678d-0047-89e0-3400-67aef22076e3@quicinc.com>
Date: Mon, 20 Jun 2022 17:17:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v1 4/4] drm/msm/dpu: move struct dpu_hw_blk definition to
 dpu_hw_utils.h
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20220601161349.1517667-1-dmitry.baryshkov@linaro.org>
 <20220601161349.1517667-5-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220601161349.1517667-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/1/2022 9:13 AM, Dmitry Baryshkov wrote:
> There is little point in having a separate header just for a single
> opaque struct definition. Drop it now and move the struct to the
> dpu_hw_util.h header.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h      |  1 -
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  1 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h    | 25 -------------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h    |  1 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h   |  2 --
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h   |  1 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h     |  1 -
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h    |  1 -
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h   |  1 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |  1 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h    |  1 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |  7 ++++++
>   12 files changed, 7 insertions(+), 36 deletions(-)
>   delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> index b8785c394fcc..da64b0f639a9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> @@ -12,7 +12,6 @@
>   #include <drm/drm_crtc.h>
>   #include "dpu_kms.h"
>   #include "dpu_core_perf.h"
> -#include "dpu_hw_blk.h"
>   
>   #define DPU_CRTC_NAME_SIZE	12
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> index 53bb4639c8e9..1db6b75cd1f6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> @@ -12,7 +12,6 @@
>   #include "dpu_hw_top.h"
>   #include "dpu_hw_wb.h"
>   #include "dpu_hw_lm.h"
> -#include "dpu_hw_blk.h"
>   #include "dpu_hw_merge3d.h"
>   #include "dpu_hw_interrupts.h"
>   #include "dpu_core_irq.h"
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h
> deleted file mode 100644
> index 52e92f37eda4..000000000000
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -/* Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
> - */
> -
> -#ifndef _DPU_HW_BLK_H
> -#define _DPU_HW_BLK_H
> -
> -#include <linux/types.h>
> -#include <linux/list.h>
> -
> -struct dpu_hw_blk;
> -
> -
> -/**
> - * struct dpu_hw_blk - definition of hardware block object
> - * @list: list of hardware blocks
> - * @type: hardware block type
> - * @id: instance id
> - * @refcount: reference/usage count
> - */
> -struct dpu_hw_blk {
> -	/* opaque */
> -};
> -
> -#endif /*_DPU_HW_BLK_H */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> index 5755307089b5..7d9ad6a3f9f6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> @@ -10,7 +10,6 @@
>   #include "dpu_hw_util.h"
>   #include "dpu_hw_catalog.h"
>   #include "dpu_hw_sspp.h"
> -#include "dpu_hw_blk.h"
>   
>   /**
>    * dpu_ctl_mode_sel: Interface mode selection
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h
> index 7fa189cfcb06..05ecfdfac93b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h
> @@ -5,8 +5,6 @@
>   #ifndef _DPU_HW_DSPP_H
>   #define _DPU_HW_DSPP_H
>   
> -#include "dpu_hw_blk.h"
> -
>   struct dpu_hw_dspp;
>   
>   /**
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> index 7b2d96ac61e8..c262430e4dbd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> @@ -8,7 +8,6 @@
>   #include "dpu_hw_catalog.h"
>   #include "dpu_hw_mdss.h"
>   #include "dpu_hw_util.h"
> -#include "dpu_hw_blk.h"
>   
>   struct dpu_hw_intf;
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
> index d8052fb2d5da..652ddfdedec3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
> @@ -8,7 +8,6 @@
>   
>   #include "dpu_hw_mdss.h"
>   #include "dpu_hw_util.h"
> -#include "dpu_hw_blk.h"
>   
>   struct dpu_hw_mixer;
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h
> index 870bdb14613e..81fd1d5f718e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h
> @@ -8,7 +8,6 @@
>   #include "dpu_hw_catalog.h"
>   #include "dpu_hw_mdss.h"
>   #include "dpu_hw_util.h"
> -#include "dpu_hw_blk.h"
>   
>   struct dpu_hw_merge_3d;
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
> index 12758468d9ca..c00223441d99 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
> @@ -8,7 +8,6 @@
>   #include "dpu_hw_catalog.h"
>   #include "dpu_hw_mdss.h"
>   #include "dpu_hw_util.h"
> -#include "dpu_hw_blk.h"
>   
>   #define DITHER_MATRIX_SZ 16
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> index 7f7338fcddeb..78b1bc9e004f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> @@ -8,7 +8,6 @@
>   #include "dpu_hw_catalog.h"
>   #include "dpu_hw_mdss.h"
>   #include "dpu_hw_util.h"
> -#include "dpu_hw_blk.h"
>   #include "dpu_formats.h"
>   
>   struct dpu_hw_pipe;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
> index 3aa10c89ca1b..a1a9e44bed36 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
> @@ -8,7 +8,6 @@
>   #include "dpu_hw_catalog.h"
>   #include "dpu_hw_mdss.h"
>   #include "dpu_hw_util.h"
> -#include "dpu_hw_blk.h"
>   
>   struct dpu_hw_mdp;
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> index d5338701fc2b..49d89d706200 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> @@ -25,6 +25,13 @@ struct dpu_hw_blk_reg_map {
>   	u32 log_mask;
>   };
>   
> +/**
> + * struct dpu_hw_blk - opaque hardware block object
> + */
> +struct dpu_hw_blk {
> +	/* opaque */
> +};
> +
>   /**
>    * struct dpu_hw_scaler3_de_cfg : QSEEDv3 detail enhancer configuration
>    * @enable:         detail enhancer enable/disable
