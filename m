Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A61656237AC
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 00:47:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BEE510E62E;
	Wed,  9 Nov 2022 23:47:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A5AA10E62E;
 Wed,  9 Nov 2022 23:47:28 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A9Nfg0Q003561; Wed, 9 Nov 2022 23:47:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=8z6ePNURMRjxd7MtLxb/FSdAdPRY7ppEWaO03gWnvWM=;
 b=Se7hIpnxcGbp6o55s/JLIRA9pg+PEqh3p8zKhi8C4xZANxY1PzjbXpVXk38f9rlPvn7H
 AR+zzhW2FK1o7DB66itmsZW2B5hQrhH3RPJAopmYSTWOzbV9Mbth0lvKRj6E6PWCc3QP
 eJG4/U4AhZ10DwBm0lEzyuCve/6SF2Ix5/FoTKYy9MXfUnjBbaokDREZAETggZFEBjM/
 8565RLbxAQ9FJnh/fV9MmYXU1bB5F/N/aziEtLqVQp9xwVERI3ZeZ1M0OaXRDIWGPmWC
 g8GhBwGIjjybLUdt3Ardhlb7J5eg5D+vVnOJ5HlHYy72g6slGWEHSJ/pC8+7v5+g8Ng9 8Q== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3krg2q900b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Nov 2022 23:47:21 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2A9NlKvC023503
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 9 Nov 2022 23:47:20 GMT
Received: from [10.110.62.155] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Wed, 9 Nov 2022
 15:47:19 -0800
Message-ID: <a4127ba2-5968-e8a9-da63-fd709aa01e7f@quicinc.com>
Date: Wed, 9 Nov 2022 15:47:18 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] drm/msm/dp: remove limitation of link rate at 5.4G to
 support HBR3
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Doug Anderson
 <dianders@chromium.org>
References: <1667237245-24988-1-git-send-email-quic_khsieh@quicinc.com>
 <94b507e8-5b94-12ae-4c81-95f5d36279d5@linaro.org>
 <deb60200-5a37-ec77-9515-0c0c89022174@quicinc.com>
 <CAD=FV=X_fs_4JYcRvAwkU9mAafOten9WdyzPfSVWdAU=ZMo8zg@mail.gmail.com>
 <155e4171-187c-4ecf-5a9b-12f0c2207524@linaro.org>
 <CAD=FV=Wk5rBSq9Mx1GCO0QFYckKV9KUFKL36Ld7dQX1ypHVcYw@mail.gmail.com>
 <CAD=FV=XTOUjVAGFWZ6xTkcNOrCT1p73aU-=KJNYUOxsS-BQsyA@mail.gmail.com>
 <c5aedb31-3881-50e7-f747-e75b18c3f4b8@linaro.org>
 <CAD=FV=WPde5wVOGCKQYGuGwgCwRebox4FF0MgV_2pPCTsfo_UA@mail.gmail.com>
 <60643572-4148-cea5-e64d-ec6534b0c407@linaro.org>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <60643572-4148-cea5-e64d-ec6534b0c407@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: HutC2z3yT8RN_6bXhyEjUefMrOqIVQEo
X-Proofpoint-GUID: HutC2z3yT8RN_6bXhyEjUefMrOqIVQEo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-09_06,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 priorityscore=1501 mlxscore=0 clxscore=1011 phishscore=0
 adultscore=0 spamscore=0 bulkscore=0 mlxlogscore=891 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211090179
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
Cc: quic_sbillaka@quicinc.com, quic_abhinavk@quicinc.com, airlied@linux.ie,
 freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>,
 vkoul@kernel.org, dri-devel@lists.freedesktop.org, swboyd@chromium.org,
 agross@kernel.org, linux-arm-msm@vger.kernel.org, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 11/2/2022 11:04 AM, Dmitry Baryshkov wrote:
> On 02/11/2022 20:28, Doug Anderson wrote:
>> Hi,
>>
>> On Wed, Nov 2, 2022 at 10:23 AM Dmitry Baryshkov
>> <dmitry.baryshkov@linaro.org> wrote:
>>>
>>>> 1. Someone figures out how to model this with the bridge chain and
>>>> then we only allow HBR3 if we detect we've got a TCPC that supports
>>>> it. This seems like the cleanest / best but feels like a long pole.
>>>> Not only have we been trying to get the TCPC-modeled-as-a-bridge stuff
>>>> landed for a long time but even when we do it we still don't have a
>>>> solution for how to communicate the number of lanes and other stuff
>>>> between the TCPC and the DP controller so we have to enrich the bridge
>>>> interface.
>>>
>>> I think we'd need some OOB interface. For example for DSI interfaces we
>>> have mipi_dsi_device struct to communicate such OOB data.
>>>
>>> Also take a note regarding data-lanes from my previous email.
>>
>> Right, we can somehow communicate the max link rate through the bridge
>> chain to the DP controller in an OOB manner that would work.
>
> I'd note that our dp_panel has some notion of such OOB data. So do AUX 
> drivers including the panel-edp. My suggestion would be to consider 
> both of them while modelling the OOB data.
>
>>
>>
>>>> 2. We add in a DT property to the display controller node that says
>>>> the max link rate for use on this board. This feels like a hack, but
>>>> maybe it's not too bad. Certainly it would be incredibly simple to
>>>> implement. Actually... ...one could argue that even if we later model
>>>> the TCPC as a bridge that this property would still be valid / useful!
>>>> You could certainly imagine that the SoC supports HBR3 and the TCPC
>>>> supports HBR3 but that the board routing between the SoC and the TCPC
>>>> is bad and only supports HBR2. In this case the only way out is
>>>> essentially a "board constraint" AKA a DT property in the DP
>>>> controller.
>>>
>>> We have been discussing similar topics with Abhinav. Krzysztof 
>>> suggested
>>> using link-frequencies property to provide max and min values.

questions,

1)is Krzysztof suggested had been implemented?

2) where is link property i can add link-frequencies?


>>
>> This sounds good to me and seems worth doing even if we eventually do 
>> #1.
>
> And the bonus point is that it can be done easily.
>
