Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A87AF78D1AE
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 03:23:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A559F10E4AA;
	Wed, 30 Aug 2023 01:23:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 545A210E4AA;
 Wed, 30 Aug 2023 01:23:37 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37TNQ6Zt014815; Wed, 30 Aug 2023 01:23:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=MG5bPwsb8mA4cEQB3tMsY3yjc65TWrt89/JLttn37Yw=;
 b=RRmmOjFiw8AV9UsFMQurw6ZKUj7uU5aRw/fX74pSYjBI8EkgNq5A0D5c1/hvTQsW3JDw
 ahoNnnfSjOeCyegFhqD7GVqYu++rKT74tiDCwUNADz6SiJExDxEZfiRycMKfDdHiKNUW
 +7m+OXOgKVQpAI33kIfRmQAPrO+SJrxoMOjCOqJa/XquumKf5DRpbZftBONoj7HvTpQv
 oHBP/fqnOf3jRnn3HkcOXJKZ7nWSlcXYnp9OBON1g+OGPWA6IwOK+AuKBhTxWdjm/X1W
 /YmEgkR1IaRN0Wp9pVDDYRn4C1ZCOpYujD5GWFYvYYwvUKVjlB3smBnr7LC2hAEGaLRY Cg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ss3fr395w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Aug 2023 01:23:23 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37U1NM3u019906
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Aug 2023 01:23:22 GMT
Received: from [10.71.110.104] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Tue, 29 Aug
 2023 18:23:22 -0700
Message-ID: <6df79bbd-729c-6832-a31d-a7fba5c4b6d4@quicinc.com>
Date: Tue, 29 Aug 2023 18:23:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Freedreno] [PATCH 3/3] drm/msm/dpu: drop
 dpu_encoder_phys_ops.atomic_mode_set
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>
References: <20230604144514.949628-1-dmitry.baryshkov@linaro.org>
 <20230604144514.949628-4-dmitry.baryshkov@linaro.org>
 <821d87bd-f428-57d1-ba30-29aed8fcdb65@quicinc.com>
 <93881487-6574-47df-92bc-b5fb4d174d33@linaro.org>
 <9f86ce98-156d-25cb-e35f-6d266d2eac14@quicinc.com>
In-Reply-To: <9f86ce98-156d-25cb-e35f-6d266d2eac14@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: y7pILq3N-tFX6DtamOqscYrpJbboBSlg
X-Proofpoint-ORIG-GUID: y7pILq3N-tFX6DtamOqscYrpJbboBSlg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_16,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 adultscore=0 spamscore=0 phishscore=0 bulkscore=0 mlxlogscore=633
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308300011
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
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/17/2023 12:27 PM, Abhinav Kumar wrote:
> 
> 
> On 8/17/2023 11:50 AM, Dmitry Baryshkov wrote:
>> On 08/08/2023 02:49, Abhinav Kumar wrote:
>>>
>>>
>>> On 6/4/2023 7:45 AM, Dmitry Baryshkov wrote:
>>>> The atomic_mode_set() callback only sets the phys_enc's IRQ data. As 
>>>> the
>>>> INTF and WB are statically allocated to each encoder/phys_enc, drop the
>>>> atomic_mode_set callback and set the IRQs during encoder init.
>>>>
>>>> For the CMD panel usecase some of IRQ indexes depend on the selected
>>>> resources. Move setting them to the irq_enable() callback.
>>>>
>>>
>>> The irq_enable() callback is called from the 
>>> dpu_encoder_virt_atomic_enable() after the phys layer's enable.
>>>
>>> Thats late.
>>>
>>> So lets consider the case where command mode panel's clock is powered 
>>> from bootloader (quite common).
>>>
>>> Now, as soon as the tearcheck is configured and interface is ON from 
>>> the phys's enable(), nothing prevents / should prevent the interrupt 
>>> from firing.
>>
>> Please note that interrupt callbacks are also registered from the 
>> irq_control(). There is no way the interrupt can fire beforehand (and 
>> the call chain is dpu_encoder_virt_atomic_enable() -> 
>> dpu_encoder_resource_control() -> 
>> _dpu_encoder_resource_control_helper() -> _dpu_encoder_irq_control() 
>> -> irq_control().
>>
>> If we ever want to move irq_control() to be called before phys's 
>> enable() callbacks, this will be a separate patchset, involving 
>> refactoring of dpu_encoder_resource_control().
>>
> 
> Ack, I will rebase my patches on top of this and re-test it.
> 
> Then will give my R-b, tested-by tags by Monday.
> 

Sorry for the delay on this.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280

Made sure that sc7280 boots up fine and kms_writeback works
