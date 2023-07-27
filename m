Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1DA76576C
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 17:25:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BD4910E5BE;
	Thu, 27 Jul 2023 15:25:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 615E488C3D;
 Thu, 27 Jul 2023 15:25:04 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36RALGJX028510; Thu, 27 Jul 2023 15:24:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=wZaekKMTkgKORg4Tx+PPIrEOIHP99e1UGD4VTCRvtvQ=;
 b=YSyIlnx0/DcD9tVQZhwj3hdxW7tOJc/yZov52yBOx/Fl1R4eGxe8mLojKm7HV5jT6Jdc
 pC4MxZyMSTaFIBTh2Pp8XLfsMojHY3JubBrKFvg5VoD4qv2t9U3jBSTGliQ5vIoTyc35
 ceu6W7aCozQx9lZC/qtgIyByCrU4H475D3s7yLZyMZFIwnxxwdeV/aSv+/a8kdg+bhJX
 ffQc8Amtg8FV6ophakeTt9zk9QJYJ48xu2L34uu27rMVVdBs0Q3dl4jQJMyOTvsWt41x
 SlBCpD9YsB1fYGMF2q+bqsrgVBKkhovTPCEv1PB0fD24GtQV4OfFJRASbjFeHoqveoee Xg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s3f581pgk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jul 2023 15:24:49 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36RFOeOj012071
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jul 2023 15:24:40 GMT
Received: from [10.110.29.149] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Thu, 27 Jul
 2023 08:24:39 -0700
Message-ID: <81e527a4-f394-1bb5-769f-8b1f3eb01f40@quicinc.com>
Date: Thu, 27 Jul 2023 08:24:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 5/6] drm/msm/dpu: use MDSS data for programming SSPP
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230521171026.4159495-1-dmitry.baryshkov@linaro.org>
 <20230521171026.4159495-6-dmitry.baryshkov@linaro.org>
 <4e35dabb-640e-8de6-d98a-619b2f80cfb6@quicinc.com>
 <CAA8EJpoYc5M7GpTAUggjDhs+UQ8GcFcW7Y7xNs_zrNNN3Th-7A@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpoYc5M7GpTAUggjDhs+UQ8GcFcW7Y7xNs_zrNNN3Th-7A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: XOULTEKqDG9CpqdTHAHVOdcZXDCGcsbp
X-Proofpoint-ORIG-GUID: XOULTEKqDG9CpqdTHAHVOdcZXDCGcsbp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_07,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 mlxscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 clxscore=1015 adultscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307270139
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
Cc: freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/27/2023 1:39 AM, Dmitry Baryshkov wrote:
> On Thu, 27 Jul 2023 at 02:20, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 5/21/2023 10:10 AM, Dmitry Baryshkov wrote:
>>> Switch to using data from MDSS driver to program the SSPP fetch and UBWC
>>> configuration.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 18 +++++++++++-------
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  7 +++++--
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 16 +++++++++++++++-
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  1 +
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      |  3 ++-
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |  2 ++
>>>    6 files changed, 36 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>>> index cf70a9bd1034..bfd82c2921af 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>>> @@ -8,6 +8,8 @@
>>>    #include "dpu_hw_sspp.h"
>>>    #include "dpu_kms.h"
>>>
>>> +#include "msm_mdss.h"
>>> +
>>>    #include <drm/drm_file.h>
>>>
>>>    #define DPU_FETCH_CONFIG_RESET_VALUE   0x00000087
>>> @@ -308,26 +310,26 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
>>>                DPU_REG_WRITE(c, SSPP_FETCH_CONFIG,
>>>                        DPU_FETCH_CONFIG_RESET_VALUE |
>>>                        ctx->ubwc->highest_bank_bit << 18);
>>
>> Does this needs to be protected with if ctx->ubwc check?
> 
> Yes... And it should have been already.
> 
>>
>>> -             switch (ctx->ubwc->ubwc_version) {
>>> -             case DPU_HW_UBWC_VER_10:
>>> +             switch (ctx->ubwc->ubwc_enc_version) {
>>> +             case UBWC_1_0:
>>
>> The values of UBWC_x_x dont match the values of DPU_HW_UBWC_VER_xx.
>> What was the reason for the catalog to go with DPU_HW_UBWC_VER_xx in the
>> catalog for the encoder version in the first place? Because looking at
>> the registers UBWC_x_x is the correct value.
>>
>> If we cannot find the reason why, it should be noted in the commit text
>> that the values we are using did change.
> 
> Huh? This is just an enum. It isn't a part of uABI, nor it is written
> to the hardware.
> 

The reason is that, this switch case is moving from comparing one set of 
values to totally different ones. So atleast that should be noted.

First thing that struck me was this point because the enums UBWC_x_x and 
DPU_HW_UBWC_VER_xx dont match.

>>
>>>                        fast_clear = fmt->alpha_enable ? BIT(31) : 0;
>>>                        DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
>>>                                        fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
>>>                                        BIT(8) |
>>>                                        (ctx->ubwc->highest_bank_bit << 4));
>>>                        break;
>>> -             case DPU_HW_UBWC_VER_20:
>>> +             case UBWC_2_0:
>>>                        fast_clear = fmt->alpha_enable ? BIT(31) : 0;
>>>                        DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
>>>                                        fast_clear | (ctx->ubwc->ubwc_swizzle) |
>>>                                        (ctx->ubwc->highest_bank_bit << 4));
>>>                        break;
>>> -             case DPU_HW_UBWC_VER_30:
>>> +             case UBWC_3_0:
>>>                        DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
>>>                                        BIT(30) | (ctx->ubwc->ubwc_swizzle) |
>>>                                        (ctx->ubwc->highest_bank_bit << 4));
>>>                        break;
>>> -             case DPU_HW_UBWC_VER_40:
>>> +             case UBWC_4_0:
>>>                        DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
>>>                                        DPU_FORMAT_IS_YUV(fmt) ? 0 : BIT(30));
>>>                        break;
>>> @@ -793,7 +795,9 @@ static const struct dpu_sspp_cfg *_sspp_offset(enum dpu_sspp sspp,
>>>    }
>>>
>>>    struct dpu_hw_sspp *dpu_hw_sspp_init(enum dpu_sspp idx,
>>> -             void __iomem *addr, const struct dpu_mdss_cfg *catalog)
>>> +                                  void __iomem *addr,
>>> +                                  const struct dpu_mdss_cfg *catalog,
>>> +                                  const struct msm_mdss_data *mdss_data)
>>>    {
>>>        struct dpu_hw_sspp *hw_pipe;
>>>        const struct dpu_sspp_cfg *cfg;
>>> @@ -813,7 +817,7 @@ struct dpu_hw_sspp *dpu_hw_sspp_init(enum dpu_sspp idx,
>>>
>>>        /* Assign ops */
>>>        hw_pipe->catalog = catalog;
>>> -     hw_pipe->ubwc = catalog->ubwc;
>>> +     hw_pipe->ubwc = mdss_data;
>>>        hw_pipe->idx = idx;
>>>        hw_pipe->cap = cfg;
>>>        _setup_layer_ops(hw_pipe, hw_pipe->cap->features);
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
>>> index 74b98b6b3bc3..8d4ae9d24674 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
>>> @@ -351,7 +351,7 @@ struct dpu_hw_sspp {
>>>        struct dpu_hw_blk base;
>>>        struct dpu_hw_blk_reg_map hw;
>>>        const struct dpu_mdss_cfg *catalog;
>>> -     const struct dpu_ubwc_cfg *ubwc;
>>> +     const struct msm_mdss_data *ubwc;
>>>
>>>        /* Pipe */
>>>        enum dpu_sspp idx;
>>> @@ -368,9 +368,12 @@ struct dpu_kms;
>>>     * @idx:  Pipe index for which driver object is required
>>>     * @addr: Mapped register io address of MDP
>>>     * @catalog : Pointer to mdss catalog data
>>> + * @mdss_data: UBWC / MDSS configuration data
>>>     */
>>>    struct dpu_hw_sspp *dpu_hw_sspp_init(enum dpu_sspp idx,
>>> -             void __iomem *addr, const struct dpu_mdss_cfg *catalog);
>>> +                                  void __iomem *addr,
>>> +                                  const struct dpu_mdss_cfg *catalog,
>>> +                                  const struct msm_mdss_data *mdss_data);
>>>
>>>    /**
>>>     * dpu_hw_sspp_destroy(): Destroys SSPP driver context
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> index 0e7a68714e9e..a4293dc0b61b 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> @@ -22,6 +22,7 @@
>>>
>>>    #include "msm_drv.h"
>>>    #include "msm_mmu.h"
>>> +#include "msm_mdss.h"
>>>    #include "msm_gem.h"
>>>    #include "disp/msm_disp_snapshot.h"
>>>
>>> @@ -1066,7 +1067,20 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>>>                goto power_error;
>>>        }
>>>
>>> -     rc = dpu_rm_init(&dpu_kms->rm, dpu_kms->catalog, dpu_kms->mmio);
>>> +     dpu_kms->mdss = msm_mdss_get_mdss_data(dpu_kms->pdev->dev.parent);
>>> +     if (IS_ERR(dpu_kms->mdss)) {
>>> +             rc = PTR_ERR(dpu_kms->mdss);
>>> +             DPU_ERROR("failed to get MDSS data: %d\n", rc);
>>> +             goto power_error;
>>> +     }
>>> +
>>> +     if (!dpu_kms->mdss) {
>>> +             rc = -EINVAL;
>>> +             DPU_ERROR("NULL MDSS data\n");
>>> +             goto power_error;
>>> +     }
>>> +
>>> +     rc = dpu_rm_init(&dpu_kms->rm, dpu_kms->catalog, dpu_kms->mdss, dpu_kms->mmio);
>>>        if (rc) {
>>>                DPU_ERROR("rm init failed: %d\n", rc);
>>>                goto power_error;
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>>> index aca39a4689f4..797b4ff3e806 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>>> @@ -69,6 +69,7 @@ struct dpu_kms {
>>>        struct msm_kms base;
>>>        struct drm_device *dev;
>>>        const struct dpu_mdss_cfg *catalog;
>>> +     const struct msm_mdss_data *mdss;
>>>
>>>        /* io/register spaces: */
>>>        void __iomem *mmio, *vbif[VBIF_MAX], *reg_dma;
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>> index f4dda88a73f7..9ee493465c4b 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>> @@ -100,6 +100,7 @@ int dpu_rm_destroy(struct dpu_rm *rm)
>>>
>>>    int dpu_rm_init(struct dpu_rm *rm,
>>>                const struct dpu_mdss_cfg *cat,
>>> +             const struct msm_mdss_data *mdss_data,
>>>                void __iomem *mmio)
>>>    {
>>>        int rc, i;
>>> @@ -268,7 +269,7 @@ int dpu_rm_init(struct dpu_rm *rm,
>>>                        continue;
>>>                }
>>>
>>> -             hw = dpu_hw_sspp_init(sspp->id, mmio, cat);
>>> +             hw = dpu_hw_sspp_init(sspp->id, mmio, cat, mdss_data);
>>>                if (IS_ERR(hw)) {
>>>                        rc = PTR_ERR(hw);
>>>                        DPU_ERROR("failed sspp object creation: err %d\n", rc);
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
>>> index d62c2edb2460..2b551566cbf4 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
>>> @@ -40,11 +40,13 @@ struct dpu_rm {
>>>     *  for all HW blocks.
>>>     * @rm: DPU Resource Manager handle
>>>     * @cat: Pointer to hardware catalog
>>> + * @mdss_data: Pointer to MDSS / UBWC configuration
>>>     * @mmio: mapped register io address of MDP
>>>     * @Return: 0 on Success otherwise -ERROR
>>>     */
>>>    int dpu_rm_init(struct dpu_rm *rm,
>>>                const struct dpu_mdss_cfg *cat,
>>> +             const struct msm_mdss_data *mdss_data,
>>>                void __iomem *mmio);
>>>
>>>    /**
> 
> 
> 
