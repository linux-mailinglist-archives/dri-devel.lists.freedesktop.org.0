Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B8C724D86
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 21:50:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD2BC10E3A4;
	Tue,  6 Jun 2023 19:50:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 658C110E3A2;
 Tue,  6 Jun 2023 19:49:59 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 356JfOC6026923; Tue, 6 Jun 2023 19:49:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=D4mgSVI7clYH9JahuYktChslczXFw/lgE+jBrcCNuPc=;
 b=F6Pz9tbdhOv3YzugIu6FoPF5luGwU/hpOypFFNTJNBXQDdLq7sOV3bwHGLdN9ggm1DD6
 OGrfEbs2J6hv55KYQcf4Q6oHEgYgETcXhDq9ntOMjSDvLLgjXw8L9xkTFvkIV3pNapgu
 VNoLx4CNvN6j0/AK8LmM8Mh/pXP9975jG6B/0Bksegkc1ltyM0JTEvTUqrJ1OCaQUOBi
 y/ykzQODgMX59AAxVgDf0x4gSJxZuSDHJBrnP15XUOGDAFCptxRyuWq0eRyT3hr0OLFJ
 yh8rmmwxTJ11Zcv4e5yHLNsZyqigWwDWKNYavAvsh3yEt/y05BwMRlZnkBAnKrHEc8vs Sw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r2a7204c9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Jun 2023 19:49:53 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 356JnrUq016738
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 6 Jun 2023 19:49:53 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 6 Jun 2023
 12:49:50 -0700
Message-ID: <2f66d83c-7585-efb7-55a0-cbdfd325265f@quicinc.com>
Date: Tue, 6 Jun 2023 12:49:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v16] drm/msm/dpu: add DSC blocks to the catalog of MSM8998
 and SC8180X
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>, Kuogee Hsieh
 <quic_khsieh@quicinc.com>
References: <1686076299-11504-1-git-send-email-quic_khsieh@quicinc.com>
 <xf7hp4ywo7cgdvsjhkmtghdmbzhmufyainrfnllelbxx7lz5g4@faamkbvjpjts>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <xf7hp4ywo7cgdvsjhkmtghdmbzhmufyainrfnllelbxx7lz5g4@faamkbvjpjts>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: hBDGBseBfEze9RyJQ__0g4nK8KOxej2e
X-Proofpoint-GUID: hBDGBseBfEze9RyJQ__0g4nK8KOxej2e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-06_14,2023-06-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 clxscore=1015 mlxlogscore=999 impostorscore=0 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306060168
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
Cc: sean@poorly.run, quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, dianders@chromium.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, vkoul@kernel.org, agross@kernel.org,
 dmitry.baryshkov@linaro.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/6/2023 11:57 AM, Marijn Suijten wrote:
> On 2023-06-06 11:31:39, Kuogee Hsieh wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> Some platforms have DSC blocks which have not been declared in the catalog.
>> Complete DSC 1.1 support for all platforms by adding the missing blocks to
>> MSM8998 and SC8180X.
> 
> Still a NACK, as pointed out in v15 both the title and this commit
> description point to SC8180X but that catalog entry is not touched at
> all anymore after rebasing on top of f5abecfe339e4 ("drm/msm/dpu: enable
> DSPP and DSC on sc8180x").
> 
> - Marijn
> 

Yeah we should fix the commit text and the title. Apologies for that.

>>
>> Changes in v9:
>> -- add MSM8998 and SC8180x to commit title
>>
>> Changes in v10:
>> -- fix grammar at commit text
>>
>> Changes in v12:
>> -- fix "titil" with "title" at changes in v9
>>
>> Changes in v14:
>> -- "dsc" tp "DSC" at commit title
>>
>> Changes in v15:
>> -- fix merge conflicts at dpu_5_1_sc8180x.h
>>
>> Changes in v16
>> -- fix cherry-pick error by deleting both redundant .dsc and .dsc_count
>>     assignment from dpu_5_1_sc8180x.h
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>> index 3c732a0..7d0d0e7 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>> @@ -126,6 +126,11 @@ static const struct dpu_pingpong_cfg msm8998_pp[] = {
>>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
>>   };
>>   
>> +static const struct dpu_dsc_cfg msm8998_dsc[] = {
>> +	DSC_BLK("dsc_0", DSC_0, 0x80000, 0),
>> +	DSC_BLK("dsc_1", DSC_1, 0x80400, 0),
>> +};
>> +
>>   static const struct dpu_dspp_cfg msm8998_dspp[] = {
>>   	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
>>   		 &msm8998_dspp_sblk),
>> @@ -199,6 +204,8 @@ const struct dpu_mdss_cfg dpu_msm8998_cfg = {
>>   	.dspp = msm8998_dspp,
>>   	.pingpong_count = ARRAY_SIZE(msm8998_pp),
>>   	.pingpong = msm8998_pp,
>> +	.dsc_count = ARRAY_SIZE(msm8998_dsc),
>> +	.dsc = msm8998_dsc,
>>   	.intf_count = ARRAY_SIZE(msm8998_intf),
>>   	.intf = msm8998_intf,
>>   	.vbif_count = ARRAY_SIZE(msm8998_vbif),
>> -- 
>> 2.7.4
>>
