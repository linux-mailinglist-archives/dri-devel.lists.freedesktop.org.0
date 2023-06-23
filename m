Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9C873BFDB
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 22:34:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05FDE10E6B5;
	Fri, 23 Jun 2023 20:34:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9077510E6B1;
 Fri, 23 Jun 2023 20:34:12 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35NK17Qa010999; Fri, 23 Jun 2023 20:34:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=9UDnCFpdM4OwJ1V1McJjMa8iTd+WLOlQ/OmL9IFPRLY=;
 b=pGAH6lfF3IeRGi9uK7xgNzIG4pqhl33RqehFTvNfooKAVpEUo3dIAIu2lfyjsfaZw19Z
 T1RJrStH/PPjjsgQj49S53C88keChqfuYbg/ZstleRrtFMAAAppAL3BY2k2QMmV4PSBT
 hw30XqToQpvrlAqhSNEYS8hCLTB8/Z7NiMtVc3EmLaj2+E06FeEwoMA0q/ZqezhNOAnm
 6GQAAan5GhMiQmcBlgihXK+TfAK8UFOHkUiEVcZ0JaQBZr+nqljFlWgPS6yn/ppHBEP2
 mkkAxfY5rx3eVcMf5rJ856J6y83ykHXYADblqF0Zgp5YTsacCZCIkNEt63jsAsei5MEK jA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rdcuurw2f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Jun 2023 20:34:10 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35NKY9X0004373
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Jun 2023 20:34:09 GMT
Received: from [10.110.61.170] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 23 Jun
 2023 13:34:07 -0700
Message-ID: <117d21da-aa44-9439-5d5b-9a9144b53979@quicinc.com>
Date: Fri, 23 Jun 2023 13:34:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Freedreno] [PATCH 3/3] drm/msm/dsi: Enable DATABUS_WIDEN for DSI
 command mode
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230525-add-widebus-support-v1-0-c7069f2efca1@quicinc.com>
 <20230525-add-widebus-support-v1-3-c7069f2efca1@quicinc.com>
 <ky7sgsaohak2pcdf6pbhedfyrwk4ea7y3ekfqlw7rn6cpk4rhe@rjuhb23n37oz>
 <cf968ab4-e4c4-dcad-f7d1-4edff6f08147@quicinc.com>
 <xrqiat4otnfwtss6zwubh77qx3frdyi77flna2xljzycvr6r2v@riimvmhoondt>
 <654ccc4c-40c2-bef6-9f47-847216e16cb0@quicinc.com>
 <daqhyz4rtgdxthsezmgk6t2egbdsvzsdy3cihrqrhyveoqbizi@etq2tafkucg2>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <daqhyz4rtgdxthsezmgk6t2egbdsvzsdy3cihrqrhyveoqbizi@etq2tafkucg2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 44jk4GD9bYKowD1H7qB85hyaMzvQxOu_
X-Proofpoint-ORIG-GUID: 44jk4GD9bYKowD1H7qB85hyaMzvQxOu_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-23_12,2023-06-22_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=718
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306230184
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
Cc: freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/23/2023 1:14 PM, Marijn Suijten wrote:
> On 2023-06-23 10:29:51, Abhinav Kumar wrote:
> <snip>
>> The concept is quite simple
>>
>> one pixel per clock for uncompresssed without widebubus
>>
>> 2 pixels per clock for uncompressed with widebus (only enabled for DP
>> not DSI)
>>
>> 3 bytes worth of data for compressed without widebus
>>
>> 6 bytes worth of data for compressed with widebus
>>
>> When compression happens, we cannot quantify with pixels as the boundary
>> is not defined with respect to bytes.
>>
>> You brought up uncompressed in your below comment so I assumed your
>> question of /2 was about uncompressed too.
> 
> No clue where things are going wrong, but you either avoid or
> misunderstand the question.
> 
> (Talking exclusively about compressed data here!)
> 
> pclk is determined based on the number of bytes.
> 
> When widebus is enabled, we transfer twice as many bytes per pclk cycle.
> 
> Can pclk be reduced by a factor two, as that should still be enough to
> transfer the same amount of bytes when widebus is enabled?
> 

I dont know where the misunderstanding is too.

I already did answer that pclk can be /2 for uncompressed.

But for compressed it will be divided by the compression ration.

What is still missing here. Please clarify.

>>>> We tried our best to respond and explain to all your queries both on the
>>>> bug and the patch but i guess it just kept coming :)
>>>
>>> Then send less patches!  As long as there is activity on the mailing
>>> list there'll always be questions going back and forth, and I don't
>>> think that's unreasonable.
>>>
>>> Unless you want to push patches into mainline without questioning.
>>>
>>
>> the comments were bordering the line of becoming irrelevant to the
>> patches like discussing video mode on a command mode patch when we had
>> explained many many times that we did not validate them.
> 
> You(r team) came up with irrelevant video-mode checks in these patches,
> and you keep bringing up topics that I did not mention (such as
> suddently talking about uncompressed formats above).  Stop pretending
> there's any nefarious intent here unless you intend to push external
> contributors away.
> 

There is no nefarious intent. If it was there we would not have spent 2 
weeks to answer every question on the bug and explaining every math 
about it despite calling our patches hacks.

So either something is still missing in our answers or the questions.

So please ask the question whatever has not been answered one more time.

>> I dont want to add more comments to this. Lets stop discussing this and
>> focus more on this patch.
> 
> Perhaps if you answer the question?
> 
> - Marijn
