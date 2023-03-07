Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D35036AEF26
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 19:21:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5D0210E535;
	Tue,  7 Mar 2023 18:20:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D230A10E52C;
 Tue,  7 Mar 2023 18:20:56 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 327DD7Ss024942; Tue, 7 Mar 2023 18:20:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=OBZ2dH5PXkoRA9viv95Gfz8S76KN1CxMxK2pe/vAuNM=;
 b=AiY/53wGX4LCaK8aQUA0Kzed63sy99rA6SVw2qeB24zRK/wBgPBsMuqZEEhyplRq0QFt
 OStNRtwUb65kSK2FH45YDaSJKwyFYosVN0kSaUnLFg/SFinWayTl88RFyAebZ/Lsf6Ho
 f20ugwtNCJ1GOCuGWYxtMdrpIjiUJQxa8RXFhQgdymjO5WpMF1ebwCJ7Qdv30SUDEVmn
 IzmyG/Js80rXGQX5Qhm3vm2V975sThvxhEyDOsu9lsfl6W0CzA8TprnCuMn5N9FYe7mr
 I5rYa1AGR3m1nwvbWzaui1jp7FvvYSMhYoWfCjHLNbHKyvO0T5hiHhh9zMZW9eWxFBkr cg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p5x5ca2jh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 18:20:50 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 327IKn1M010109
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 7 Mar 2023 18:20:49 GMT
Received: from [10.110.28.207] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 7 Mar 2023
 10:20:48 -0800
Message-ID: <5d2c1a44-7e07-ea12-e828-3b4f3c2d1009@quicinc.com>
Date: Tue, 7 Mar 2023 10:20:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [PATCH v2 00/50] drm/msm/dpu: rework HW catalog
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
 <dff314d3-782e-1550-394e-5f86b1de6a95@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <dff314d3-782e-1550-394e-5f86b1de6a95@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: CYd80B7o7IA8u5M6Aq0Xtf2UCgu_iHHn
X-Proofpoint-GUID: CYd80B7o7IA8u5M6Aq0Xtf2UCgu_iHHn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-07_14,2023-03-07_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303070162
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry

On 3/7/2023 10:02 AM, Dmitry Baryshkov wrote:
> On 12/02/2023 01:12, Dmitry Baryshkov wrote:
>> This huge series attempts to restructure the DPU HW catalog into a
>> manageable and reviewable data set. In order to ease review and testing
>> I merged all the necessary fixes into this series. Also I cherry-picked
>> & slightly fixed Konrad's patch adding size to the SSPP and INTF macros.
>>
>> First 12 patches are catalog fixes, which can be probably picked into
>> the msm-fixes.
>>
>> Next 5 patches clean up the catalog a bit in order to make it more
>> suitable for refactoring.
>>
>> Then the next batch of 13 + 5 patches split the hw catalog entries into
>> per-SoC files.
>>
>> Next 8 patches rework catalog entries, mostly targeting QSEED cleanup
>> and deduplication of data used by several platforms. At this moment only
>> three pairs (out of 13 devices supported by DPU) are merged. However
>> this part lays out the ground to ease adding support for new platforms,
>> some of which use the same configuration as the existing platforms
>>
>> Last batch of 7 patches renames existing macros to ease using them while
>> adding support for new devices.
>>
>> This pile of patches is submitted in a sinle batch to allow one to
>> observe the final goal of the cleanup which otherwise might be hard to
>> assess.
>>
>> Changes since v1:
>> - Picked up Konrad's patch
>> - Picked up dependencies into the main series
>> - Moved qseed3lite vs qseed4 patches into the fixes part
>> - Fixed sm6115 in a similar manner.
> 
> Colleagues, could please take a look at this patchset? If nobody 
> objects, I'd like to pick it after Rob merges Abhinav's msm-fixes pull 
> request. Patches 1-13 are going through msm-fixes, patches 14-50 are 
> pending.
> 

I will take a look at patches 14-50 by Friday or worst case early next 
week. This week, I plan to finish validating the wide planes on sc7280 
and give my Tested-by, hence cant get to this before that.

Thanks

Abhinav

>>
>> Dmitry Baryshkov (49):
>>    drm/msm/dpu: set DPU_MDP_PERIPH_0_REMOVED for sc8280xp
>>    drm/msm/dpu: disable features unsupported by QCM2290
>>    drm/msm/dpu: fix typo in in sm8550's dma_sblk_5
>>    drm/msm/dpu: fix len of sc7180 ctl blocks
>>    drm/msm/dpu: fix sm6115 and qcm2290 mixer width limits
>>    drm/msm/dpu: correct sm8550 scaler
>>    drm/msm/dpu: correct sc8280xp scaler
>>    drm/msm/dpu: correct sm8450 scaler
>>    drm/msm/dpu: correct sm8250 and sm8350 scaler
>>    drm/msm/dpu: correct sm6115 scaler
>>    drm/msm/dpu: drop DPU_DIM_LAYER from MIXER_MSM8998_MASK
>>    drm/msm/dpu: fix clocks settings for msm8998 SSPP blocks
>>    drm/msm/dpu: don't use DPU_CLK_CTRL_CURSORn for DMA SSPP clocks
>>    drm/msm/dpu: constify DSC data structures
>>    drm/msm/dpu: mark remaining pp data as const
>>    drm/msm/dpu: move UBWC/memory configuration to separate struct
>>    drm/msm/dpu: split SM8550 catalog entry to the separate file
>>    drm/msm/dpu: split SM8450 catalog entry to the separate file
>>    drm/msm/dpu: split SC8280XP catalog entry to the separate file
>>    drm/msm/dpu: split SC7280 catalog entry to the separate file
>>    drm/msm/dpu: split SM8350 catalog entry to the separate file
>>    drm/msm/dpu: split SM6115 catalog entry to the separate file
>>    drm/msm/dpu: split QCM2290 catalog entry to the separate file
>>    drm/msm/dpu: split SC7180 catalog entry to the separate file
>>    drm/msm/dpu: split SM8250 catalog entry to the separate file
>>    drm/msm/dpu: split SC8180X catalog entry to the separate file
>>    drm/msm/dpu: split SM8150 catalog entry to the separate file
>>    drm/msm/dpu: split MSM8998 catalog entry to the separate file
>>    drm/msm/dpu: split SDM845 catalog entry to the separate file
>>    drm/msm/dpu: duplicate sdm845 catalog entries
>>    drm/msm/dpu: duplicate sc7180 catalog entries
>>    drm/msm/dpu: duplicate sm8150 catalog entries
>>    drm/msm/dpu: duplicate sm8250 catalog entries
>>    drm/msm/dpu: duplicate sm8350 catalog entries
>>    drm/msm/dpu: use defined symbol for sc8280xp's maxwidth
>>    drm/msm/dpu: enable DPU_CTL_SPLIT_DISPLAY for sc8280xp
>>    drm/msm/dpu: enable DSPP_2/3 for LM_2/3 on sm8450
>>    drm/msm/dpu: drop duplicate vig_sblk instances
>>    drm/msm/dpu: enable DSPP on sc8180x
>>    drm/msm/dpu: deduplicate sc8180x with sm8150
>>    drm/msm/dpu: deduplicate sm6115 with qcm2290
>>    drm/msm/dpu: deduplicate sc8280xp with sm8450
>>    drm/msm/dpu: drop unused macros from hw catalog
>>    drm/msm/dpu: inline IRQ_n_MASK defines
>>    drm/msm/dpu: rename INTF_foo_MASK to contain major DPU version
>>    drm/msm/dpu: rename CTL_foo_MASK to contain major DPU version
>>    drm/msm/dpu: rename VIG and DMA_foo_MASK to contain major DPU version
>>    drm/msm/dpu: rename MIXER_foo_MASK to contain major DPU version
>>    drm/msm/dpu: rename MERGE_3D_foo_MASK to contain major DPU version
>>
>> Konrad Dybcio (1):
>>    drm/msm/dpu: Allow variable SSPP/INTF_BLK size
>>
>>   .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  211 ++
>>   .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  211 ++
>>   .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |   97 +
>>   .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |   91 +
>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h |  152 ++
>>   .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  244 ++
>>   .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  152 ++
>>   .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |   92 +
>>   .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |   84 +
>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h |   54 +
>>   .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  226 ++
>>   .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  159 ++
>>   .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  117 +
>>   .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  123 +
>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h |  118 +
>>   .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  209 ++
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 2193 +----------------
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   39 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c    |    4 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |   18 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |    4 +-
>>   21 files changed, 2434 insertions(+), 2164 deletions(-)
>>   create mode 100644 
>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>>   create mode 100644 
>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
>>   create mode 100644 
>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
>>   create mode 100644 
>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
>>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h
>>   create mode 100644 
>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
>>   create mode 100644 
>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
>>   create mode 100644 
>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
>>   create mode 100644 
>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
>>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h
>>   create mode 100644 
>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
>>   create mode 100644 
>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>>   create mode 100644 
>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
>>   create mode 100644 
>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
>>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h
>>   create mode 100644 
>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>>
> 
