Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE4380AAF7
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 18:40:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A9E210E144;
	Fri,  8 Dec 2023 17:40:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF9FD10E12D;
 Fri,  8 Dec 2023 17:40:08 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B8GuWqA026085; Fri, 8 Dec 2023 17:40:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=oiOSwf0oN1TmSP4hoIsh/zUg6yZW44SAGrB2CRfoEqs=;
 b=FgE5hVygGmN5unecWSeGGKHIREGmLp7khM2th9NV6yrVTVld81wdEfNkjskkfLk5CN6+
 GIngvG1tfn70iHjWoyIRYcLs9jB+q6lsH33K1TvAOBwtcpstGjtX95N9yhUHH8U6QYtQ
 4S4gjXFfP/GEBfDF0R6Pg70NmSTf61wkeovmX9EImMN+bzgkw3fTA4EmwzLBWZzvvY/U
 1EMW1MsdCO6aNZaJab7DKF9SHdV0hRRzazptWhGpzGSH9NsfUHiSUd9JfzXULfkqhmCW
 J1vfZvWCmwWBax6aCrzPTaiLGsod/i5lbXh/sTqkpZ2jokT51GzTZ9am1oqIDWPzZKI3 NA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uuu209mqd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Dec 2023 17:40:06 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B8He5xb013272
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 8 Dec 2023 17:40:05 GMT
Received: from [10.110.30.94] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 8 Dec
 2023 09:40:04 -0800
Message-ID: <68685494-b45c-9065-19d4-0084eb481352@quicinc.com>
Date: Fri, 8 Dec 2023 09:40:02 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 00/16] Add CDM support for MSM writeback
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20231208050641.32582-1-quic_abhinavk@quicinc.com>
 <CAA8EJpp_ck5HuXYNAY2xdag2D-XODdOhZjA7XQA8PZs7qds_UQ@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpp_ck5HuXYNAY2xdag2D-XODdOhZjA7XQA8PZs7qds_UQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: LvFr9abCPzpjF_BCdWb-2yhqgag_HtU5
X-Proofpoint-ORIG-GUID: LvFr9abCPzpjF_BCdWb-2yhqgag_HtU5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-08_11,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=668
 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312080146
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
Cc: quic_jesszhan@quicinc.com, freedreno@lists.freedesktop.org,
 quic_parellan@quicinc.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/8/2023 4:14 AM, Dmitry Baryshkov wrote:
> On Fri, 8 Dec 2023 at 07:06, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>> Chroma Down Sampling (CDM) block is a hardware block in the DPU pipeline
>> which among other things has a CSC block that can convert RGB input
>> from the DPU to YUV data.
> 
> This block is more or less standard between all hw versions. I do not
> expect any faults and/or issues with any of the platforms.
>  From what I can see, from the platforms that we do not support, it is
> not available only on sm6115/qcs4290, qcm2290 and sm6375. Can we
> please enable it for all the other platforms?
> 

Its just a validation criteria. I have only enabled it on devices which 
I have tested on and do not want to take responsibilty of the bugs 
reported on untested chipsets.

I am open to the approach of publishing a follow-up RFT for the other 
devices like you did for WB on some of the chipsets.

>>
>> This block can be used with either HDMI, DP or writeback interface.
>>
>> In this series, lets first add the support for CDM block to be used
>> with writeback and then follow-up with support for other interfaces such
>> as DP.
>>
>> This was validated by adding support to pass custom output format to the
>> IGT's kms_writeback test-case, specifically only for the output dump
>> test-case [1].
>>
>> The usage for this is:
>>
>> ./kms_writeback -d -f <name of the DRM YUV fmt from igt_fb>
>>
>> So for NV12, this can be verified with the below command:
>>
>> ./kms_writeback -d -f NV12
>>
>> [1] : https://patchwork.freedesktop.org/series/122125/
>>
>> changes in v2:
>>          - rebased on top of current msm-next-lumag
>>          - fix commit text of some of the patches
>>          - move csc matrices to dpu_hw_util as they span across DPU
>>          - move cdm blk define to dpu_hw_catalog as its common across chipsets
>>          - remove bit magic in dpu_hw_cdm with relevant defines
>>          - use drmm_kzalloc instead of kzalloc/free
>>          - protect bind_pingpong_blk with core_rev check
>>          - drop setup_csc_data() and setup_cdwn() ops as they
>>            are merged into enable()
>>          - protect bind_pingpong_blk with core_rev check
>>          - drop setup_csc_data() and setup_cdwn() ops as they
>>            are merged into enable()
>>          - move needs_cdm to topology struct
>>          - call update_pending_flush_cdm even when bind_pingpong_blk
>>            is not present
>>          - drop usage of setup_csc_data() and setup_cdwn() cdm ops
>>            as they both have been merged into enable()
>>          - drop reduntant hw_cdm and hw_pp checks
>>          - drop fb related checks from dpu_encoder::atomic_mode_set()
>>          - introduce separate wb2_format arrays for rgb and yuv
>>
>> Abhinav Kumar (16):
>>    drm/msm/dpu: add formats check for writeback encoder
>>    drm/msm/dpu: rename dpu_encoder_phys_wb_setup_cdp to match its
>>      functionality
>>    drm/msm/dpu: fix writeback programming for YUV cases
>>    drm/msm/dpu: move csc matrices to dpu_hw_util
>>    drm/msm/dpu: add cdm blocks to sc7280 dpu_hw_catalog
>>    drm/msm/dpu: add cdm blocks to sm8250 dpu_hw_catalog
>>    drm/msm/dpu: add dpu_hw_cdm abstraction for CDM block
>>    drm/msm/dpu: add cdm blocks to RM
>>    drm/msm/dpu: add support to allocate CDM from RM
>>    drm/msm/dpu: add CDM related logic to dpu_hw_ctl layer
>>    drm/msm/dpu: add support to disable CDM block during encoder cleanup
>>    drm/msm/dpu: add an API to setup the CDM block for writeback
>>    drm/msm/dpu: plug-in the cdm related bits to writeback setup
>>    drm/msm/dpu: reserve cdm blocks for writeback in case of YUV output
>>    drm/msm/dpu: introduce separate wb2_format arrays for rgb and yuv
>>    drm/msm/dpu: add cdm blocks to dpu snapshot
>>
>>   drivers/gpu/drm/msm/Makefile                  |   1 +
>>   .../msm/disp/dpu1/catalog/dpu_10_0_sm8650.h   |   4 +-
>>   .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |   5 +-
>>   .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |   4 +-
>>   .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |   5 +-
>>   .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |   4 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  37 +++
>>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |   5 +
>>   .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 117 +++++++-
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  47 ++-
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  13 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c    | 276 ++++++++++++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h    | 114 ++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    |  35 +++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h    |  12 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |   7 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  71 +++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   8 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     |   3 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   4 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |   1 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |  39 +--
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |  51 +++-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        |   2 +
>>   drivers/gpu/drm/msm/msm_drv.h                 |   2 +
>>   25 files changed, 815 insertions(+), 52 deletions(-)
>>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
>>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h
>>
>> --
>> 2.40.1
>>
> 
> 
