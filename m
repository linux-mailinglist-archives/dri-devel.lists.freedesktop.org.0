Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2844F80AA24
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 18:09:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71B7E10E29C;
	Fri,  8 Dec 2023 17:09:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3708A10EAEF;
 Fri,  8 Dec 2023 17:09:24 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B8GkCk1012806; Fri, 8 Dec 2023 17:09:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=4qAJyucwuxVOycOHhfj6e18l+tG1SKnYxjp8VXqMeME=;
 b=lu1RO99vudvfRhqdc+BFEWdjJArIt/HjBsnXKq2/DcPUO+0YTYc+SbR3MHdOnSd3xjzR
 9lSUK7Qw75ORu2aUtHdLSnQ4gE7RiKRx0W52AKmth7FX/CuQx+lscKIBvH5Pz5IpDO2o
 128ay+W1Ct/ZnjYBFsugF7VrOGw2/XVWpeHFlFGps2OfisdatVWI+hQeptSwSNe4KxLi
 QKFE3MINSU4D5fUBYe9IEecC+6mjpprsFvrClFXqkllPQ8ScQxulp3MgSx9e2UEinOLa
 gG1zhu6QXra2r//8mk+Wq5oxvTqVezD80j/0IaQG0c/NnHEokoZm1CE3P+gLflx7f/w3 iA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uv5wpg8bv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Dec 2023 17:09:20 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B8H90ua014825
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 8 Dec 2023 17:09:00 GMT
Received: from [10.110.30.94] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 8 Dec
 2023 09:08:57 -0800
Message-ID: <36c86e28-b1ee-045b-487c-4d3c9b4849cb@quicinc.com>
Date: Fri, 8 Dec 2023 09:08:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 07/16] drm/msm/dpu: add dpu_hw_cdm abstraction for CDM
 block
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20231208050641.32582-1-quic_abhinavk@quicinc.com>
 <20231208050641.32582-8-quic_abhinavk@quicinc.com>
 <CAA8EJpp_9ForVxyQLOaeL3qbPcpEq8fkVR0FmZD+RDhn-quLEA@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpp_9ForVxyQLOaeL3qbPcpEq8fkVR0FmZD+RDhn-quLEA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: CBWA6gmsh63IeCIB1Aojd42725LGUH7J
X-Proofpoint-ORIG-GUID: CBWA6gmsh63IeCIB1Aojd42725LGUH7J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-08_11,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 adultscore=0 priorityscore=1501 mlxscore=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312080142
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_parellan@quicinc.com, quic_jesszhan@quicinc.com,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/8/2023 4:06 AM, Dmitry Baryshkov wrote:
> On Fri, 8 Dec 2023 at 07:07, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>> CDM block comes with its own set of registers and operations
>> which can be done. In-line with other hardware sub-blocks, this
> 
> I always thought that sub-blocks refer to the dpu_foo_sub_blks data,
> which CDM doesn't have.
> 

All of these are DPU-sub blks in some sense. If this is confusing to 
you, I will just say "in-line with other DPU hardware blocks".

> 
>> change adds the dpu_hw_cdm abstraction for the CDM block.
>>
>> changes in v2:
>>          - replace bit magic with relevant defines
>>          - use drmm_kzalloc instead of kzalloc/free
>>          - some formatting fixes
>>          - inline _setup_cdm_ops()
>>          - protect bind_pingpong_blk with core_rev check
>>          - drop setup_csc_data() and setup_cdwn() ops as they
>>            are merged into enable()
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/Makefile                |   1 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c  | 276 ++++++++++++++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h  | 114 ++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |   1 +
>>   4 files changed, 392 insertions(+)
>>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
>>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h
>>
>> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
>> index 49671364fdcf..b1173128b5b9 100644
>> --- a/drivers/gpu/drm/msm/Makefile
>> +++ b/drivers/gpu/drm/msm/Makefile
>> @@ -63,6 +63,7 @@ msm-$(CONFIG_DRM_MSM_DPU) += \
>>          disp/dpu1/dpu_encoder_phys_wb.o \
>>          disp/dpu1/dpu_formats.o \
>>          disp/dpu1/dpu_hw_catalog.o \
>> +       disp/dpu1/dpu_hw_cdm.o \
>>          disp/dpu1/dpu_hw_ctl.o \
>>          disp/dpu1/dpu_hw_dsc.o \
>>          disp/dpu1/dpu_hw_dsc_1_2.o \
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
>> new file mode 100644
>> index 000000000000..0dbe2df56cc8
>> --- /dev/null
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
>> @@ -0,0 +1,276 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2023, The Linux Foundation. All rights reserved.
>> + */
>> +
>> +#include <drm/drm_managed.h>
>> +
>> +#include "dpu_hw_mdss.h"
>> +#include "dpu_hw_util.h"
>> +#include "dpu_hw_catalog.h"
>> +#include "dpu_hw_cdm.h"
>> +#include "dpu_kms.h"
>> +
>> +#define CDM_CSC_10_OPMODE                  0x000
>> +#define CDM_CSC_10_BASE                    0x004
>> +
>> +#define CDM_CDWN2_OP_MODE                  0x100
>> +#define CDM_CDWN2_CLAMP_OUT                0x104
>> +#define CDM_CDWN2_PARAMS_3D_0              0x108
>> +#define CDM_CDWN2_PARAMS_3D_1              0x10C
>> +#define CDM_CDWN2_COEFF_COSITE_H_0         0x110
>> +#define CDM_CDWN2_COEFF_COSITE_H_1         0x114
>> +#define CDM_CDWN2_COEFF_COSITE_H_2         0x118
>> +#define CDM_CDWN2_COEFF_OFFSITE_H_0        0x11C
>> +#define CDM_CDWN2_COEFF_OFFSITE_H_1        0x120
>> +#define CDM_CDWN2_COEFF_OFFSITE_H_2        0x124
>> +#define CDM_CDWN2_COEFF_COSITE_V           0x128
>> +#define CDM_CDWN2_COEFF_OFFSITE_V          0x12C
>> +#define CDM_CDWN2_OUT_SIZE                 0x130
>> +
>> +#define CDM_HDMI_PACK_OP_MODE              0x200
>> +#define CDM_CSC_10_MATRIX_COEFF_0          0x004
>> +
>> +#define CDM_MUX                            0x224
>> +
>> +/* CDM CDWN2 sub-block bit definitions */
>> +#define CDM_CDWN2_OP_MODE_EN                  BIT(0)
>> +#define CDM_CDWN2_OP_MODE_ENABLE_H            BIT(1)
>> +#define CDM_CDWN2_OP_MODE_ENABLE_V            BIT(2)
>> +#define CDM_CDWN2_OP_MODE_METHOD_H_AVG        BIT(3)
>> +#define CDM_CDWN2_OP_MODE_METHOD_H_COSITE     BIT(4)
>> +#define CDM_CDWN2_OP_MODE_METHOD_V_AVG        BIT(5)
>> +#define CDM_CDWN2_OP_MODE_METHOD_V_COSITE     BIT(6)
>> +#define CDM_CDWN2_OP_MODE_BITS_OUT_8BIT       BIT(7)
>> +#define CDM_CDWN2_OP_MODE_METHOD_H_OFFSITE    GENMASK(4, 3)
>> +#define CDM_CDWN2_OP_MODE_METHOD_V_OFFSITE    GENMASK(6, 5)
>> +#define CDM_CDWN2_V_PIXEL_DROP_MASK           GENMASK(6, 5)
>> +#define CDM_CDWN2_H_PIXEL_DROP_MASK           GENMASK(4, 3)
>> +
>> +/* CDM CSC10 sub-block bit definitions */
>> +#define CDM_CSC10_OP_MODE_EN               BIT(0)
>> +#define CDM_CSC10_OP_MODE_SRC_FMT_YUV      BIT(1)
>> +#define CDM_CSC10_OP_MODE_DST_FMT_YUV      BIT(2)
>> +
>> +/* CDM HDMI pack sub-block bit definitions */
>> +#define CDM_HDMI_PACK_OP_MODE_EN           BIT(0)
>> +
>> +/**
>> + * Horizontal coefficients for cosite chroma downscale
>> + * s13 representation of coefficients
>> + */
>> +static u32 cosite_h_coeff[] = {0x00000016, 0x000001cc, 0x0100009e};
>> +
>> +/**
>> + * Horizontal coefficients for offsite chroma downscale
>> + */
>> +static u32 offsite_h_coeff[] = {0x000b0005, 0x01db01eb, 0x00e40046};
>> +
>> +/**
>> + * Vertical coefficients for cosite chroma downscale
>> + */
>> +static u32 cosite_v_coeff[] = {0x00080004};
>> +/**
>> + * Vertical coefficients for offsite chroma downscale
>> + */
>> +static u32 offsite_v_coeff[] = {0x00060002};
>> +
>> +static int dpu_hw_cdm_setup_cdwn(struct dpu_hw_cdm *ctx, struct dpu_hw_cdm_cfg *cfg)
>> +{
>> +       struct dpu_hw_blk_reg_map *c = &ctx->hw;
>> +       u32 opmode = 0;
>> +       u32 out_size = 0;
>> +
>> +       if (cfg->output_bit_depth == CDM_CDWN_OUTPUT_10BIT)
>> +               opmode &= ~CDM_CDWN2_OP_MODE_BITS_OUT_8BIT;
> 
> We start from opmode = 0. Does it really make sense to mask bits from
> the zero opmode?
> 

Ack, We can drop the ~ and just keep the | below.

>> +       else
>> +               opmode |= CDM_CDWN2_OP_MODE_BITS_OUT_8BIT;
>> +
>> +       /* ENABLE DWNS_H bit */
>> +       opmode |= CDM_CDWN2_OP_MODE_ENABLE_H;
>> +
>> +       switch (cfg->h_cdwn_type) {
>> +       case CDM_CDWN_DISABLE:
>> +               /* CLEAR METHOD_H field */
>> +               opmode &= ~CDM_CDWN2_H_PIXEL_DROP_MASK;
>> +               /* CLEAR DWNS_H bit */
>> +               opmode &= ~CDM_CDWN2_OP_MODE_ENABLE_H;
>> +               break;
>> +       case CDM_CDWN_PIXEL_DROP:
>> +               /* Clear METHOD_H field (pixel drop is 0) */
>> +               opmode &= ~CDM_CDWN2_H_PIXEL_DROP_MASK;
>> +               break;
>> +       case CDM_CDWN_AVG:
>> +               /* Clear METHOD_H field (Average is 0x1) */
>> +               opmode &= ~CDM_CDWN2_H_PIXEL_DROP_MASK;
>> +               opmode |= CDM_CDWN2_OP_MODE_METHOD_H_AVG;
>> +               break;
>> +       case CDM_CDWN_COSITE:
>> +               /* Clear METHOD_H field (Average is 0x2) */
>> +               opmode &= ~CDM_CDWN2_H_PIXEL_DROP_MASK;
>> +               opmode |= CDM_CDWN2_OP_MODE_METHOD_H_COSITE;
>> +               /* Co-site horizontal coefficients */
>> +               DPU_REG_WRITE(c, CDM_CDWN2_COEFF_COSITE_H_0,
>> +                               cosite_h_coeff[0]);
>> +               DPU_REG_WRITE(c, CDM_CDWN2_COEFF_COSITE_H_1,
>> +                               cosite_h_coeff[1]);
>> +               DPU_REG_WRITE(c, CDM_CDWN2_COEFF_COSITE_H_2,
>> +                               cosite_h_coeff[2]);
>> +               break;
>> +       case CDM_CDWN_OFFSITE:
>> +               /* Clear METHOD_H field (Average is 0x3) */
>> +               opmode &= ~CDM_CDWN2_H_PIXEL_DROP_MASK;
>> +               opmode |= CDM_CDWN2_OP_MODE_METHOD_H_OFFSITE;
>> +
>> +               /* Off-site horizontal coefficients */
>> +               DPU_REG_WRITE(c, CDM_CDWN2_COEFF_OFFSITE_H_0,
>> +                               offsite_h_coeff[0]);
>> +               DPU_REG_WRITE(c, CDM_CDWN2_COEFF_OFFSITE_H_1,
>> +                               offsite_h_coeff[1]);
>> +               DPU_REG_WRITE(c, CDM_CDWN2_COEFF_OFFSITE_H_2,
>> +                               offsite_h_coeff[2]);
>> +               break;
>> +       default:
>> +               pr_err("%s invalid horz down sampling type\n", __func__);
> 
> DPU_ERROR or drm_err
> 

Ack.

>> +               return -EINVAL;
>> +       }
>> +
>> +       /* ENABLE DWNS_V bit */
>> +       opmode |= CDM_CDWN2_OP_MODE_ENABLE_V;
>> +
>> +       switch (cfg->v_cdwn_type) {
>> +       case CDM_CDWN_DISABLE:
>> +               /* CLEAR METHOD_V field */
>> +               opmode &= ~CDM_CDWN2_V_PIXEL_DROP_MASK;
>> +               /* CLEAR DWNS_V bit */
>> +               opmode &= ~CDM_CDWN2_OP_MODE_ENABLE_V;
>> +               break;
>> +       case CDM_CDWN_PIXEL_DROP:
>> +               /* Clear METHOD_V field (pixel drop is 0) */
>> +               opmode &= ~CDM_CDWN2_V_PIXEL_DROP_MASK;
>> +               break;
>> +       case CDM_CDWN_AVG:
>> +               /* Clear METHOD_V field (Average is 0x1) */
>> +               opmode &= ~CDM_CDWN2_V_PIXEL_DROP_MASK;
>> +               opmode |= CDM_CDWN2_OP_MODE_METHOD_V_AVG;
>> +               break;
>> +       case CDM_CDWN_COSITE:
>> +               /* Clear METHOD_V field (Average is 0x2) */
>> +               opmode &= ~CDM_CDWN2_V_PIXEL_DROP_MASK;
>> +               opmode |= CDM_CDWN2_OP_MODE_METHOD_V_COSITE;
>> +               /* Co-site vertical coefficients */
>> +               DPU_REG_WRITE(c,
>> +                             CDM_CDWN2_COEFF_COSITE_V,
>> +                             cosite_v_coeff[0]);
>> +               break;
>> +       case CDM_CDWN_OFFSITE:
>> +               /* Clear METHOD_V field (Average is 0x3) */
>> +               opmode &= ~CDM_CDWN2_V_PIXEL_DROP_MASK;
>> +               opmode |= CDM_CDWN2_OP_MODE_METHOD_V_OFFSITE;
>> +
>> +               /* Off-site vertical coefficients */
>> +               DPU_REG_WRITE(c,
>> +                             CDM_CDWN2_COEFF_OFFSITE_V,
>> +                             offsite_v_coeff[0]);
>> +               break;
>> +       default:
>> +               return -EINVAL;
>> +       }
>> +
>> +       if (cfg->v_cdwn_type || cfg->h_cdwn_type)
>> +               opmode |= CDM_CDWN2_OP_MODE_EN; /* EN CDWN module */
>> +       else
>> +               opmode &= ~CDM_CDWN2_OP_MODE_EN;
>> +
>> +       out_size = (cfg->output_width & 0xFFFF) | ((cfg->output_height & 0xFFFF) << 16);
>> +       DPU_REG_WRITE(c, CDM_CDWN2_OUT_SIZE, out_size);
>> +       DPU_REG_WRITE(c, CDM_CDWN2_OP_MODE, opmode);
>> +       DPU_REG_WRITE(c, CDM_CDWN2_CLAMP_OUT, ((0x3FF << 16) | 0x0));
>> +
>> +       return 0;
>> +}
>> +
>> +int dpu_hw_cdm_enable(struct dpu_hw_cdm *ctx, struct dpu_hw_cdm_cfg *cdm)
>> +{
>> +       struct dpu_hw_blk_reg_map *c = &ctx->hw;
>> +       const struct dpu_format *fmt;
>> +       u32 opmode = 0;
>> +       u32 csc = 0;
>> +
>> +       if (!ctx || !cdm)
>> +               return -EINVAL;
>> +
>> +       fmt = cdm->output_fmt;
>> +
>> +       if (!DPU_FORMAT_IS_YUV(fmt))
>> +               return -EINVAL;
>> +
>> +       dpu_hw_csc_setup(&ctx->hw, CDM_CSC_10_MATRIX_COEFF_0, cdm->csc_cfg, true);
>> +       dpu_hw_cdm_setup_cdwn(ctx, cdm);
>> +
>> +       if (cdm->output_type == CDM_CDWN_OUTPUT_HDMI) {
>> +               if (fmt->chroma_sample != DPU_CHROMA_H1V2)
>> +                       return -EINVAL; /*unsupported format */
>> +               opmode = CDM_HDMI_PACK_OP_MODE_EN;
>> +               opmode |= (fmt->chroma_sample << 1);
>> +       }
>> +
>> +       csc |= CDM_CSC10_OP_MODE_DST_FMT_YUV;
>> +       csc &= ~CDM_CSC10_OP_MODE_SRC_FMT_YUV;
>> +       csc |= CDM_CSC10_OP_MODE_EN;
>> +
>> +       if (ctx && ctx->ops.bind_pingpong_blk)
>> +               ctx->ops.bind_pingpong_blk(ctx, true, cdm->pp_id);
>> +
>> +       DPU_REG_WRITE(c, CDM_CSC_10_OPMODE, csc);
>> +       DPU_REG_WRITE(c, CDM_HDMI_PACK_OP_MODE, opmode);
>> +       return 0;
>> +}
>> +
>> +void dpu_hw_cdm_disable(struct dpu_hw_cdm *ctx)
>> +{
>> +       if (!ctx)
>> +               return;
>> +
>> +       if (ctx && ctx->ops.bind_pingpong_blk)
>> +               ctx->ops.bind_pingpong_blk(ctx, false, PINGPONG_NONE);
> 
> So the bind/un_pingpong_block gets hidden here. Why do we need to
> unbind it manually in the dpu_encoder then?
> 

hmm .... I think we can drop the disable op and just call 
bind_pingpong_blk directly.

>> +}
>> +
>> +static void dpu_hw_cdm_bind_pingpong_blk(struct dpu_hw_cdm *ctx, bool enable,
>> +                                        const enum dpu_pingpong pp)
> 
> I think we settled on the PINGPONG_NONE for removing the binding
> 

Ah okay. i probably missed this. so just drop "enable" and use pp val.

>> +{
>> +       struct dpu_hw_blk_reg_map *c;
>> +       int mux_cfg = 0xF;
>> +
>> +       c = &ctx->hw;
>> +
>> +       if (enable)
>> +               mux_cfg = (pp - PINGPONG_0) & 0x7;
>> +
>> +       DPU_REG_WRITE(c, CDM_MUX, mux_cfg);
>> +}
>> +
>> +struct dpu_hw_cdm *dpu_hw_cdm_init(struct drm_device *dev,
>> +                                  const struct dpu_cdm_cfg *cfg, void __iomem *addr,
>> +                                  const struct dpu_mdss_version *mdss_rev)
>> +{
>> +       struct dpu_hw_cdm *c;
>> +
>> +       c = drmm_kzalloc(dev, sizeof(*c), GFP_KERNEL);
>> +       if (!c)
>> +               return ERR_PTR(-ENOMEM);
>> +
>> +       c->hw.blk_addr = addr + cfg->base;
>> +       c->hw.log_mask = DPU_DBG_MASK_CDM;
>> +
>> +       /* Assign ops */
>> +       c->idx = cfg->id;
>> +       c->caps = cfg;
>> +
>> +       c->ops.enable = dpu_hw_cdm_enable;
>> +       c->ops.disable = dpu_hw_cdm_disable;
>> +       if (mdss_rev->core_major_ver >= 5)
>> +               c->ops.bind_pingpong_blk = dpu_hw_cdm_bind_pingpong_blk;
>> +
>> +       return c;
>> +}
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h
>> new file mode 100644
>> index 000000000000..1ca806f9d18d
>> --- /dev/null
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h
>> @@ -0,0 +1,114 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2023, The Linux Foundation. All rights reserved.
>> + */
>> +
>> +#ifndef _DPU_HW_CDM_H
>> +#define _DPU_HW_CDM_H
>> +
>> +#include "dpu_hw_mdss.h"
>> +#include "dpu_hw_top.h"
>> +
>> +struct dpu_hw_cdm;
>> +
>> +struct dpu_hw_cdm_cfg {
>> +       u32 output_width;
>> +       u32 output_height;
>> +       u32 output_bit_depth;
>> +       u32 h_cdwn_type;
>> +       u32 v_cdwn_type;
>> +       const struct dpu_format *output_fmt;
>> +       const struct dpu_csc_cfg *csc_cfg;
>> +       u32 output_type;
>> +       int pp_id;
>> +};
>> +
>> +enum dpu_hw_cdwn_type {
>> +       CDM_CDWN_DISABLE,
>> +       CDM_CDWN_PIXEL_DROP,
>> +       CDM_CDWN_AVG,
>> +       CDM_CDWN_COSITE,
>> +       CDM_CDWN_OFFSITE,
>> +};
>> +
>> +enum dpu_hw_cdwn_output_type {
>> +       CDM_CDWN_OUTPUT_HDMI,
>> +       CDM_CDWN_OUTPUT_WB,
>> +};
>> +
>> +enum dpu_hw_cdwn_output_bit_depth {
>> +       CDM_CDWN_OUTPUT_8BIT,
>> +       CDM_CDWN_OUTPUT_10BIT,
>> +};
> 
> Can we please get some documentation for these enums?
> 

Ack.

>> +
>> +/**
>> + * struct dpu_hw_cdm_ops : Interface to the chroma down Hw driver functions
>> + *                         Assumption is these functions will be called after
>> + *                         clocks are enabled
>> + *  @enable:               Enables the output to interface and programs the
>> + *                         output packer
>> + *  @disable:              Puts the cdm in bypass mode
>> + *  @bind_pingpong_blk:    enable/disable the connection with pingpong which
>> + *                         will feed pixels to this cdm
>> + */
>> +struct dpu_hw_cdm_ops {
>> +       /**
>> +        * Enable the CDM module
>> +        * @cdm         Pointer to chroma down context
>> +        */
>> +       int (*enable)(struct dpu_hw_cdm *cdm, struct dpu_hw_cdm_cfg *cfg);
>> +
>> +       /**
>> +        * Disable the CDM module
>> +        * @cdm         Pointer to chroma down context
>> +        */
>> +       void (*disable)(struct dpu_hw_cdm *cdm);
>> +
>> +       /**
>> +        * Enable/disable the connection with pingpong
>> +        * @cdm         Pointer to chroma down context
>> +        * @enable      Enable/disable control
>> +        * @pp          pingpong block id.
>> +        */
>> +       void (*bind_pingpong_blk)(struct dpu_hw_cdm *cdm, bool enable,
>> +                                 const enum dpu_pingpong pp);
>> +};
>> +
>> +/**
>> + * struct dpu_hw_cdm - cdm description
>> + * @base: Hardware block base structure
>> + * @hw: Block hardware details
>> + * @idx: CDM index
>> + * @caps: Pointer to cdm_cfg
>> + * @ops: handle to operations possible for this CDM
>> + */
>> +struct dpu_hw_cdm {
>> +       struct dpu_hw_blk base;
>> +       struct dpu_hw_blk_reg_map hw;
>> +
>> +       /* chroma down */
>> +       const struct dpu_cdm_cfg *caps;
>> +       enum  dpu_cdm  idx;
>> +
>> +       /* ops */
>> +       struct dpu_hw_cdm_ops ops;
>> +};
>> +
>> +/**
>> + * dpu_hw_cdm_init - initializes the cdm hw driver object.
>> + * should be called once before accessing every cdm.
>> + * @dev: DRM device handle
>> + * @cdm: CDM catalog entry for which driver object is required
>> + * @addr :   mapped register io address of MDSS
>> + * @mdss_rev: mdss hw core revision
>> + */
>> +struct dpu_hw_cdm *dpu_hw_cdm_init(struct drm_device *dev,
>> +                                  const struct dpu_cdm_cfg *cdm, void __iomem *addr,
>> +                                  const struct dpu_mdss_version *mdss_rev);
>> +
>> +static inline struct dpu_hw_cdm *to_dpu_hw_cdm(struct dpu_hw_blk *hw)
>> +{
>> +       return container_of(hw, struct dpu_hw_cdm, base);
>> +}
>> +
>> +#endif /*_DPU_HW_CDM_H */
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
>> index f319c8232ea5..9db4cf61bd29 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
>> @@ -466,6 +466,7 @@ struct dpu_mdss_color {
>>   #define DPU_DBG_MASK_ROT      (1 << 9)
>>   #define DPU_DBG_MASK_DSPP     (1 << 10)
>>   #define DPU_DBG_MASK_DSC      (1 << 11)
>> +#define DPU_DBG_MASK_CDM      (1 << 12)
>>
>>   /**
>>    * struct dpu_hw_tear_check - Struct contains parameters to configure
>> --
>> 2.40.1
>>
> 
> 
> --
> With best wishes
> 
> Dmitry
