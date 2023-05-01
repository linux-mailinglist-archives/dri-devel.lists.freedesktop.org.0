Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 364C26F366C
	for <lists+dri-devel@lfdr.de>; Mon,  1 May 2023 20:58:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1F9710E44E;
	Mon,  1 May 2023 18:58:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B381910E43E;
 Mon,  1 May 2023 18:58:47 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 341FhE0A025721; Mon, 1 May 2023 18:58:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=GMHa6OHIeIVoZoQ36I9Et2ADpUxODcVxF5WZ7tZI4ww=;
 b=KdEMSnFXpewbTs1+iEg7N31cuGazszJDqVuGfxAha+pZTAfamsOoNmuddZANmsPtq9hj
 ZmRFE3e0Ulb3OtDxacxSn1Ww/YZ1EPWv+OU0MKFKYGuqDt684hifiP2v5niWwuoK2hm7
 UsG78ZH9i3DTmzMdReygTC5hPKKCn14WBnOSUcQh0yl8DnPVdzIa08kKgzmRJbn/V8lf
 DkjHS2A9ka1wTRYOPEXPQYol5AKDI74RlezRo7xGc3bNCqF6b+uKcICy/y3al4vbWSU0
 P+kgJlycnBzDUA9mJXhlktotcrpf+QDWoYDfcHVgz/o8siKUFtRlldgoLEilN0NLJBkP Wg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qa0a39ytt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 May 2023 18:58:41 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 341Iwfak003771
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 1 May 2023 18:58:41 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 1 May 2023
 11:58:40 -0700
Message-ID: <dfc24f9d-af35-8c42-9c78-7e2f7f81c995@quicinc.com>
Date: Mon, 1 May 2023 11:58:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3] drm/msm/dpu: drop unused SSPP sub-block information
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230429212512.2947245-1-dmitry.baryshkov@linaro.org>
 <61997e7e-1a4f-8b1d-1a7d-a1ed802ae83d@quicinc.com>
 <c2e1a277-4bb7-d437-9748-be6c36e460b4@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <c2e1a277-4bb7-d437-9748-be6c36e460b4@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: BB-8c_WQ0jCN8jAreP31xMCQVc1cINIr
X-Proofpoint-GUID: BB-8c_WQ0jCN8jAreP31xMCQVc1cINIr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-01_11,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 bulkscore=0 impostorscore=0 lowpriorityscore=0
 mlxlogscore=983 mlxscore=0 adultscore=0 phishscore=0 malwarescore=0
 spamscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305010154
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
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/1/2023 11:56 AM, Dmitry Baryshkov wrote:
> On 01/05/2023 21:49, Abhinav Kumar wrote:
>>
>>
>> On 4/29/2023 2:25 PM, Dmitry Baryshkov wrote:
>>> The driver  doesn't support hsic/memcolor and pcc SSPP subblocks.
>>> Drop corresponding definitions.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>
>>> Changes since v2:
>>> - Fixed commit message to remove igc block mention.
>>>
>>> Changes since v1:
>>>   - Rebased on top of 
>>> https://patchwork.freedesktop.org/patch/534725/?series=117130&rev=1
>>>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 6 ------
>>>   1 file changed, 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>> index 69d1f1e59db1..b2831b45ac64 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>> @@ -380,9 +380,6 @@ struct dpu_caps {
>>>    * @qseed_ver: qseed version
>>>    * @scaler_blk:
>>>    * @csc_blk:
>>> - * @hsic:
>>> - * @memcolor:
>>> - * @pcc_blk:
>>
>> pcc_blk is still there. So this should be dropped. Once that is fixed,
> 
> But the pcc_blk is removed in the next chunk. Please take a glance.

Ah yes, correct, my bad, i thought this from the dpu_dspp_sub_blks but 
this is from struct dpu_sspp_sub_blks.

Thanks for clarification. R-b is still good.

> 
>>
>> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>>>    * @format_list: Pointer to list of supported formats
>>>    * @num_formats: Number of supported formats
>>>    * @virt_format_list: Pointer to list of supported formats for 
>>> virtual planes
>>> @@ -399,9 +396,6 @@ struct dpu_sspp_sub_blks {
>>>       u32 qseed_ver;
>>>       struct dpu_scaler_blk scaler_blk;
>>>       struct dpu_pp_blk csc_blk;
>>> -    struct dpu_pp_blk hsic_blk;
>>> -    struct dpu_pp_blk memcolor_blk;
>>> -    struct dpu_pp_blk pcc_blk;
>>>       const u32 *format_list;
>>>       u32 num_formats;
> 
