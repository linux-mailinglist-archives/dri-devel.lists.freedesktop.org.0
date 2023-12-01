Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3059F80008D
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 01:51:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D671310E793;
	Fri,  1 Dec 2023 00:51:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEF7710E790;
 Fri,  1 Dec 2023 00:50:42 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AUN8NfG019022; Fri, 1 Dec 2023 00:50:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=v2bv+KAdIdm9IFWwcr9OUqBoM9HY+CK+i+kY21Cut3Q=;
 b=EzBhfu0+aH2VGLOb0yrbVN5UuhdYTKj+JEUmy7xeu+llFwMj5ng565GtTSXo4sR3H/oh
 Gch+3ouKtiWTbEZWg/R3R09I5bVjbIagT1Hj5PAC2zcFNzjuq9tClKgl5DwRT2yUtwqk
 62QUeEqT6n+dzJu8SjeTxPECuiBxycWm9ukmyFvWh6oC43O9ZyT8PFUiKFGteadMhWJG
 iN9lOD+u81tTjHASEjbDbvlLxR6sAhtvXGBSCFqeEN7qEHvaFSnDIIHrVeu0899WrfMC
 a+4d31l/Vsu+Y009MPWzeLXxZYwBoi8Ke3vBHMN9w9k/8ZsP42HJ8WeGlkkMdZQTiSD9 XQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3upvm1see9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Dec 2023 00:50:40 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B10odWk024718
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 1 Dec 2023 00:50:39 GMT
Received: from [10.71.109.77] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 30 Nov
 2023 16:50:39 -0800
Message-ID: <6ed0c636-c222-36b3-aae9-eb822e088a2c@quicinc.com>
Date: Thu, 30 Nov 2023 16:50:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 14/16] drm/msm/dpu: do not allow YUV formats if no CDM
 block is present
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230830224910.8091-1-quic_abhinavk@quicinc.com>
 <20230830224910.8091-15-quic_abhinavk@quicinc.com>
 <CAA8EJprZma-e=zbtDuGKfcHK7zTaSykACt+=rh7W92iEpif=Ug@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJprZma-e=zbtDuGKfcHK7zTaSykACt+=rh7W92iEpif=Ug@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: GP_k8ApHg65NP_08TXp-Cw7iD8AlHq5I
X-Proofpoint-GUID: GP_k8ApHg65NP_08TXp-Cw7iD8AlHq5I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-30_25,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 bulkscore=0 adultscore=0 clxscore=1015 mlxscore=0 mlxlogscore=749
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312010004
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
 quic_khsieh@quicinc.com, quic_parellan@quicinc.com, quic_jesszhan@quicinc.com,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/30/2023 5:24 PM, Dmitry Baryshkov wrote:
> On Thu, 31 Aug 2023 at 01:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>> On chipsets where CDM block is not available OR where support has
>> not been added yet do not allow YUV formats for writeback block.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>> index 7fc174b33ae2..d8edca9bc964 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>> @@ -406,6 +406,12 @@ static int dpu_encoder_phys_wb_atomic_check(
>>                  return ret;
>>          }
>>
>> +       if (DPU_FORMAT_IS_YUV(to_dpu_format(msm_framebuffer_format(fb))) &&
>> +           !phys_enc->dpu_kms->catalog->cdm) {
>> +               DPU_ERROR("cannot support YUV formats without CDM block\n");
>> +               return -EINVAL;
>> +       }
> 
> Can we have YUV formats in wb_formats if we do not support CDM? That
> would be an error.

I can drop this one once i address the comments on the next patch.

Yeah the reason for this change was we had one formats array for wb and 
were using that for all chipsets. We can have two arrays : one only rgb 
and the other rgb+yuv to address this.

> 
>> +
>>          return 0;
>>   }
>>
>> --
>> 2.40.1
>>
> 
> 
