Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 587277E316D
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 00:30:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B008A10E45A;
	Mon,  6 Nov 2023 23:30:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D44310E45A;
 Mon,  6 Nov 2023 23:30:44 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3A6MoOYV017430; Mon, 6 Nov 2023 23:30:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=U3BLYVg6YGzPgy81lm70PTAfKjhyhUwPRKtpLLoAX9c=;
 b=d6GsPHr7nnSmO4FR23UQfYarJWVuaV4527kDAc095lHFmZ/yHUoAMIzpayZWW8RT5VNa
 rjZWndWPp+Ku7jPRyo3hH3KXYZUlSdTReLoy36vkGXhPyHlfxYQ4W1q9xwpEXcALjR3/
 5ltSq9NquK3lb2rOLxJVc7GU04IAfGGZVi4Up3WWL4dyq6UjI3rwZDXQ0NUgpcLR2uNB
 OAHFHVKd/hrg/NfbfhOW7N0h1ZfPjDv3fyouLgxs85LlXSXMiE71uYkSC+TfoMtAoVTi
 YibUB+9IZUoxZO0nkh3rrnNQoTyHD6LlqrzfaB4JjeaC0t71mjmspWuukMXV4T0mfq86 Xw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u72avs3eb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Nov 2023 23:30:38 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3A6NUaks030710
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 6 Nov 2023 23:30:36 GMT
Received: from [10.71.109.77] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Mon, 6 Nov
 2023 15:30:34 -0800
Message-ID: <1ac30bfd-86d9-8186-1aee-f201b8ff4370@quicinc.com>
Date: Mon, 6 Nov 2023 15:30:32 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/msm/dpu: correct clk bit for WB2 block
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20231009171139.2691218-1-dmitry.baryshkov@linaro.org>
 <e4c94f9d-773a-e894-d655-41afeb01dae1@quicinc.com>
 <CAA8EJprpBy6UhtScRkFS24TgKevBOb9nVBFCqPhEof=-k58Mwg@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJprpBy6UhtScRkFS24TgKevBOb9nVBFCqPhEof=-k58Mwg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: iXL6pwzsvqF2z-i7nHQLeFT1K8mrHSxP
X-Proofpoint-GUID: iXL6pwzsvqF2z-i7nHQLeFT1K8mrHSxP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-06_15,2023-11-02_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 mlxlogscore=999 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2311060192
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



On 11/6/2023 2:11 PM, Dmitry Baryshkov wrote:
> On Mon, 6 Nov 2023 at 20:39, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>> Sorry for the delay in getting back on this. There was quite a bit of
>> history digging I had to do myself to give a certain response.
>>
>>
>> On 10/9/2023 10:11 AM, Dmitry Baryshkov wrote:
>>> On sc7280 there are two clk bits for WB2: control and status. While
>>> programming the VBIF params of WB, the driver should be toggling the
>>> former bit, while the sc7280_mdp struct lists the latter one.
>>>
>>
>> No, this is not correct. Both are control bits. But for the context of
>> where this is being used today, that is setting the VBIF OT limit, we
>> should be using the VBIF_CLI one. So the below change itself is correct
>> but not the commit text.
> 
> Maybe you can update dt bindings for the SDE driver? Because they
> clearly speak about the control and status bits.
> 

There is nothing to update here if we both are referring to the same 
entries in the dt bindings.

qcom,sde-wb-clk-status = <0x3bc 20>;

the clk status is indeed bit 20 of 0x3bc.

What we have before your patch was bit 24 of 0x3b8 which was indeed 
clk_ctl bit for wb2. But the only issue was it was not the vbif_cli one.

So we are talking about two different registers?

>>
>> We need to make the same change on sm8250 WB2 as well as this register
>> is present there too. In fact, anything >=msm8994 for setting VBIF OT
>> for WB2 we should be using VBIF_CLI bits of register MDP_CLK_CTRL2
>> (offset 0x2bc).
>>
>> For anything >=sm8550, we need to use WB_2_CLK_CTRL present within the
>> WB block and not the one in the top.
>>
>> Hence for this change, we can do below:
>>
>> -> update the commit text to indicate both are control bits but for the
>> vbif ot context we should using the corrected one
>> -> if you can also add sm8250 in the same change i can ack it and pick it up
>>
>> Have you re-validated WB with this change? If not, let me know I shall
>> while picking this up for -fixes.
> 
> No, I haven't validated this on sc7280. I'll try this on sm8250 and
> then I'll send v2.
> 
>>
>>> Correct that to ensure proper programming sequence for WB2 on sc7280.
>>>
>>> Fixes: 3ce166380567 ("drm/msm/dpu: add writeback support for sc7280")
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>>> index 3b5061c4402a..9195cb996f44 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>>> @@ -25,7 +25,7 @@ static const struct dpu_mdp_cfg sc7280_mdp = {
>>>                [DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
>>>                [DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
>>>                [DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2c4, .bit_off = 8 },
>>> -             [DPU_CLK_CTRL_WB2] = { .reg_off = 0x3b8, .bit_off = 24 },
>>> +             [DPU_CLK_CTRL_WB2] = { .reg_off = 0x2bc, .bit_off = 16 },
>>>        },
>>>    };
>>>
> 
> 
> 
