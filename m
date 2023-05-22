Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E04D70C4DF
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 20:03:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CFE810E1A4;
	Mon, 22 May 2023 18:03:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 807CF10E1A9;
 Mon, 22 May 2023 18:03:16 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34MHn0rI031791; Mon, 22 May 2023 18:03:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=QUX32dN81y3Wes2y2rrXtFnSbnOnUJfvDgb+UOKq4fw=;
 b=SPVtvfW3+zqKqF/gQIGJUEqWlmvnq9XobTWf6Jztzps9n2VMnfxYSQsKngg/nOicqZDn
 WZkYdWJqTeKJKxymG4sDngMGuCKiurRHQJm+lPOLKMvV252I4DRPoIMaiLbjhXtXJT2E
 4ibEAj5tk29oQ3L7FNf3oKSMRmRRlAjbK1RLDncbvi3FDTOXbFEOf36reRKczw1jflDw
 ZZP/ewlBOpITgKx3F3IQzaLuUReXPhXIh9EuAFl4gVeziSzvyH1EAu1pa0Tj6bTz3PxF
 w2p8C+BeATwq6PT7kk47oqXw25SDMaYOeAJrriyp/ZnOnDx4N55unoXyJ41UPIvCxvny sQ== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qppkdmf9h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 May 2023 18:03:13 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34MI3CRc010928
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 May 2023 18:03:12 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 22 May
 2023 11:03:11 -0700
Message-ID: <7fabb62d-0483-1298-c6ce-1f37313faa67@quicinc.com>
Date: Mon, 22 May 2023 11:03:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 3/5] drm/msm/dpu: Add DPU_INTF_DATA_COMPRESS feature
 flag
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230405-add-dsc-support-v3-0-6e1d35a206b3@quicinc.com>
 <20230405-add-dsc-support-v3-3-6e1d35a206b3@quicinc.com>
 <hvsfhft6ygyfewyjpnqia3ldxlmyrsydl5wt4ahjzsh2k7aom2@xad5edc4wreb>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <hvsfhft6ygyfewyjpnqia3ldxlmyrsydl5wt4ahjzsh2k7aom2@xad5edc4wreb>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: jrr_NFTcF4EkG6O-r8WeSI6saAGRqfLu
X-Proofpoint-GUID: jrr_NFTcF4EkG6O-r8WeSI6saAGRqfLu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-22_12,2023-05-22_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 mlxlogscore=841 suspectscore=0
 adultscore=0 phishscore=0 mlxscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305220152
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/19/2023 2:34 PM, Marijn Suijten wrote:
> On 2023-05-19 14:17:28, Jessica Zhang wrote:
>> Add DATA_COMPRESS feature flag to DPU INTF block.
>>
>> In DPU 7.x and later, DSC/DCE enablement registers have been moved from
>> PINGPONG to INTF.
>>
>> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 ++
>>   2 files changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index 7944481d0a33..c74051906d05 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> @@ -104,7 +104,7 @@
>>   #define INTF_SC7180_MASK \
>>   	(BIT(DPU_INTF_INPUT_CTRL) | BIT(DPU_INTF_TE) | BIT(DPU_INTF_STATUS_SUPPORTED))
>>   
>> -#define INTF_SC7280_MASK INTF_SC7180_MASK | BIT(DPU_DATA_HCTL_EN)
>> +#define INTF_SC7280_MASK INTF_SC7180_MASK | BIT(DPU_DATA_HCTL_EN) | BIT(DPU_INTF_DATA_COMPRESS)
> 
> We should really wrap these in parenthesis at some point.

Hi Marijn,

Acked.

Thanks,

Jessica Zhang

> 
>>   
>>   #define WB_SM8250_MASK (BIT(DPU_WB_LINE_MODE) | \
>>   			 BIT(DPU_WB_UBWC) | \
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> index 4eda2cc847ef..01c65f940f2a 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> @@ -185,6 +185,7 @@ enum {
>>    * @DPU_DATA_HCTL_EN                Allows data to be transferred at different rate
>>    *                                  than video timing
>>    * @DPU_INTF_STATUS_SUPPORTED       INTF block has INTF_STATUS register
>> + * @DPU_INTF_DATA_COMPRESS          INTF block has DATA_COMPRESS register
>>    * @DPU_INTF_MAX
>>    */
>>   enum {
>> @@ -192,6 +193,7 @@ enum {
>>   	DPU_INTF_TE,
>>   	DPU_DATA_HCTL_EN,
>>   	DPU_INTF_STATUS_SUPPORTED,
>> +	DPU_INTF_DATA_COMPRESS,
>>   	DPU_INTF_MAX
>>   };
>>   
>>
>> -- 
>> 2.40.1
>>
