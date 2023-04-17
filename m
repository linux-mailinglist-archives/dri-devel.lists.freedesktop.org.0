Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 391BA6E5150
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 21:59:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8110810E0BF;
	Mon, 17 Apr 2023 19:59:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01EFB10E045;
 Mon, 17 Apr 2023 19:59:41 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33HJfloL017631; Mon, 17 Apr 2023 19:59:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=f0yR2o/2rv6QyvNtJVUHg97aiYmgNcqRPOSUH7dGGmU=;
 b=EqFsb75zaz8dBAigRqnhvz5wkDQjRGTiX5Omc7OaTRioVDp9pukFWYPFp9sRniVr/N2u
 Ndq1jyd26TA6LoiOAQ1z8EmcvtCnFEj28oNv6tg3PXXeSLJ0VY1jpklPAuV6zprqXmgv
 eg1d607y5QetKwTaUTNXYNaNWbenMpTVtBwJ/ZTk5efHmGDcZYbfrK5ILUYsCKRyhWpj
 3hZ9rat1bBKdN5a7/tdDrXOAepIe7QjECsCiIEkZXnsKlImzyCqsbb0DdUGSIu6WI6u0
 NLUiRiAMYuMrkRLpc5uuKbmyDcP147epNkud95wrVu43NAEjYPU1mSOvIRcmpCMlrM1o Vg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q17yhrtcb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Apr 2023 19:59:34 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33HJxXG3018573
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Apr 2023 19:59:33 GMT
Received: from [10.110.98.241] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 17 Apr
 2023 12:59:31 -0700
Message-ID: <9da3676e-d2fb-d25a-f9b9-4c1e6ac8d03c@quicinc.com>
Date: Mon, 17 Apr 2023 12:59:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [RFC PATCH 5/7] drm/msm/dpu: Document and enable TEAR interrupts
 on DSI interfaces
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 <phone-devel@vger.kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@somainline.org>, Konrad Dybcio
 <konrad.dybcio@linaro.org>, Martin Botka <martin.botka@somainline.org>,
 "Jami Kettunen" <jami.kettunen@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Stephen Boyd <swboyd@chromium.org>, Vinod Koul <vkoul@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Kuogee Hsieh
 <quic_khsieh@quicinc.com>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 "Loic Poulain" <loic.poulain@linaro.org>, Vinod Polimera
 <quic_vpolimer@quicinc.com>,
 Adam Skladowski <a39.skl@gmail.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <20221231215006.211860-1-marijn.suijten@somainline.org>
 <20221231215006.211860-6-marijn.suijten@somainline.org>
 <773cd72b-a766-1764-e25f-0af1174f0e51@quicinc.com>
 <1051d6bd-eb3c-6293-0bd2-3f4ea28fa3f8@linaro.org>
 <df059f88-6ff6-5906-58f1-4f6c752c4214@quicinc.com>
 <20230214130636.ldckqgcq6ajph372@SoMainline.org>
 <d514591a-2891-8c2d-2cd4-5af8283748f5@quicinc.com>
 <5tjwn4p3nkpjuczudipkrvhy63kfzos6x7o7aufwdei7auujcz@oba37opujh5r>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <5tjwn4p3nkpjuczudipkrvhy63kfzos6x7o7aufwdei7auujcz@oba37opujh5r>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 7DfvtvYyoPWqKuXJqap4fVNdK2TMiDyu
X-Proofpoint-GUID: 7DfvtvYyoPWqKuXJqap4fVNdK2TMiDyu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-17_13,2023-04-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 clxscore=1011 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304170175
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/17/2023 12:41 PM, Marijn Suijten wrote:
> On 2023-02-14 09:54:57, Abhinav Kumar wrote:
> [..]
>>>>>> Just wondering, how were the lengths calculated for the INTF blocks?
>>>>>> The values in general seem a little off to me.
>>>
>>> These (for MSM8998) have been taken from downstream specifically; my
>>> series starts using INTF_STATUS at 0x26C which conveniently is the
>>> register right after 0x268, matching the fact that INTF TE and these
>>> registers weren't supported/available yet on MSM8998.
>>>
>>>>>> For example, I'm looking downstream and it seems to me that the length
>>>>>> for the INTF_0 on MSM8998 should be 0x280. Similarly for SC7280, I'm
>>>>>> seeing that length for INTF + tearcheck should be 0x2c4.
>>>
>>> There are many different downstream sources and tags with seemingly
>>> conflicting/confusing information.  For v2 [2] I've picked the highest
>>> register used by the driver which is INTF_TEAR_AUTOREFRESH_CONFIG at
>>> 0x2B4 (but there might always be more registers that don't need to be
>>> poked at by the driver, but contain magic debug information and the
>>> like... those would be useful to capture in the dump going forward).
>>>
>>> [2]: https://github.com/SoMainline/linux/commit/2bbc609dd28aa0bd0a2dede20163e521912d0072
>>>
>>
>> Not entirely correct.TEAR_AUTOREFRESH_STATUS is at 0x2c0 for sm8350 and
>> sm8450 as well so 0x2b4 is a bit short. DPU code uses autorefresh status
>> today.Esp after your changes it will use the autorefresh status from
>> intf te which is at offset 0x2c0
> 
> Revisiting this, I don't see current DPU code nor downstream 5.4 / 5.10
> SDE techpack on some of my checkouts use this register, only
> INTF_TEAR_AUTOREFRESH_CONFIG at 0x2b4..0x2b7.  Am I missing something
> critical here?
> 

Wow, I lost context since its been months since your last response.

But, I refreshed some of it. You are right, we use the status bits 
present in the INTF_TEAR_AUTOREFRESH_CONFIG and INTF_TEAR_ 
AUTOREFRESH_STATUS is unused.

I got confused between the status bit present in the two registers as 
both relate to autorefresh.

But, the offset of of INTF_TEAR_ AUTOREFRESH_STATUS is still at 0x2c0 as 
i wrote before so 0x2c4 is the accurate length of this block.

And yes, all the blk lengths should be accurate now in the hw catalog 
after the rework and reviews of that rework.

>>>>> We have discussed INTF lengths in [1]. The current understanding of the
>>>>> block lengths can be found at [2]. Please comment there if any of the
>>>>> fixed lengths sounds incorrect to you.
>>>>>
>>>>> [1] https://patchwork.freedesktop.org/patch/522187/
>>>>> [2] https://patchwork.freedesktop.org/patch/522227/
>>>>>
>>>>> [skipped the rest]
>>>>>
>>>>
>>>> Please correct my understanding here, it was agreed to fix intf blocks
>>>> to 0x2c4 here https://patchwork.freedesktop.org/patch/522227/ but I dont
>>>> see this was merged?
>>>>
>>>> It was agreed to first land INTF_TE and then add the higher addresses
>>>
>>> Seems like it, at least if I interpret [3] correctly.  My series adds a
>>> new define that will hardcode _len to 0x2B8 for now, and Dmitry/Konrad
>>> can later extend it to whatever is stated by the correct downstream
>>> source.
>>>
>>
>> Like mentioned above it should be 0x2c0 for intf block.
>>
>> If you face any conflicting information in downstream code, you can
>> always check with me on IRC.
> 
> Ack, it looks like others landed these changes for me now via the
> catalog rework, so I have just rebased and kept the lengths in.
> 
> - Marijn
