Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E5364DF56
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 18:09:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3B8A10E3C4;
	Thu, 15 Dec 2022 17:08:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0941510E3C4;
 Thu, 15 Dec 2022 17:08:13 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BFAx4PE032127; Thu, 15 Dec 2022 17:08:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=M0OvoBEarEDDSW9TE5oRDZThFsRuINIsSjYUPWCjjWQ=;
 b=FBoFICHuxW+Zy7yyKyJIop8ZZmswoLcurntZVxSbuQSyleesRylbUOCH2Pweeo1v0ZRa
 LwUCO1IK4fYXSKa2/tLJyo4b6WXpUOl1QHWr7E8Y5IjWXPysj0nMK+xGf5kQsq0OIP3Y
 KqcOHYmpfTsj8Za+1VxOh06WnBvte3h4V7swpUZ9vc+HHuIJ313hoEBCaESt9lQ5HCa/
 q49ssUCacIr34aMITCeiTvJVO6474rxbjHRCGk6Pfnge6n73ULk8QTTKhWyz8qfwNESj
 sIl0A+FguAmC9qUuW7hFTPkltVlGd7czn/r4TuRBZYvDK9rvg72yGfl2+sR/TmxBsrq/ Og== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mfxse9svc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Dec 2022 17:08:07 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BFH86JD025829
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Dec 2022 17:08:06 GMT
Received: from [10.110.66.74] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 15 Dec
 2022 09:08:05 -0800
Message-ID: <98cc6d55-f9c7-a369-6004-42b242d01339@quicinc.com>
Date: Thu, 15 Dec 2022 09:08:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v12 2/5] dt-bindings: msm/dp: add data-lanes and
 link-frequencies property
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, <agross@kernel.org>,
 <airlied@gmail.com>, <andersson@kernel.org>, <daniel@ffwll.ch>,
 <devicetree@vger.kernel.org>, <dianders@chromium.org>,
 <dmitry.baryshkov@linaro.org>, <dri-devel@lists.freedesktop.org>,
 <konrad.dybcio@somainline.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <robdclark@gmail.com>, <robh+dt@kernel.org>, <sean@poorly.run>,
 <vkoul@kernel.org>
References: <1670967848-31475-1-git-send-email-quic_khsieh@quicinc.com>
 <1670967848-31475-3-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n52eHYCqxUJqQXoaQ8vyqCk-QfouSun+zUp3yo5DufWbwg@mail.gmail.com>
 <b38af164-08bc-07e7-dfaf-fb4d6d89d7db@quicinc.com>
 <CAE-0n53Cb6TFGfM6AYup5aP4=24j0ujVPi463oVqmzfNV2B4RA@mail.gmail.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAE-0n53Cb6TFGfM6AYup5aP4=24j0ujVPi463oVqmzfNV2B4RA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 5LPWoTS4BoluYneg5ILBA4kZFgz2ChaE
X-Proofpoint-GUID: 5LPWoTS4BoluYneg5ILBA4kZFgz2ChaE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-15_10,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212150141
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
Cc: linux-arm-msm@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/14/2022 4:38 PM, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2022-12-14 14:56:23)
>> On 12/13/2022 3:06 PM, Stephen Boyd wrote:
>>> Quoting Kuogee Hsieh (2022-12-13 13:44:05)
>>>> Add both data-lanes and link-frequencies property into endpoint
>>> Why do we care? Please tell us why it's important.
> Any response?
yes, i did that at my local patch already.
>
>>>> @@ -193,6 +217,8 @@ examples:
>>>>                    reg = <1>;
>>>>                    endpoint {
>>>>                        remote-endpoint = <&typec>;
>>>> +                    data-lanes = <0 1>;
>>>> +                    link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
>>>>                    };
>>> So far we haven't used the output port on the DP controller in DT.
>>>
>>> I'm still not clear on what we should do in general for DP because
>>> there's a PHY that actually controls a lane count and lane mapping. In
>>> my mental model of the SoC, this DP controller's output port is
>>> connected to the DP PHY, which then sends the DP lanes out of the SoC to
>>> the next downstream device (i.e. a DP connector or type-c muxer). Having
>>> a remote-endpoint property with a phandle to typec doesn't fit my mental
>>> model. I'd expect it to be the typec PHY.
>> ack
>>> That brings up the question: when we have 2 lanes vs. 4 lanes will we
>>> duplicate the data-lanes property in the PHY binding? I suspect we'll
>>> have to. Hopefully that sort of duplication is OK?
>> Current we have limitation by reserve 2 data lanes for usb2, i am not
>> sure duplication to 4 lanes will work automatically.
>>> Similarly, we may have a redriver that limits the link-frequencies
>>> property further (e.g. only support <= 2.7GHz). Having multiple
>>> link-frequencies along the graph is OK, right? And isn't the
>>> link-frequencies property known here by fact that the DP controller
>>> tells us which SoC this controller is for, and thus we already know the
>>> supported link frequencies?
>>>
>>> Finally, I wonder if we should put any of this in the DP controller's
>>> output endpoint, or if we can put these sorts of properties in the DP
>>> PHY binding directly? Can't we do that and then when the DP controller
>>> tries to set 4 lanes, the PHY immediately fails the call and the link
>>> training algorithm does its thing and tries fewer lanes? And similarly,
>>> if link-frequencies were in the PHY's binding, the PHY could fail to set
>>> those frequencies during link training, returning an error to the DP
>>> controller, letting the training move on to a lower frequency. If we did
>>> that this patch series would largely be about modifying the PHY binding,
>>> updating the PHY driver to enforce constraints, and handling errors
>>> during link training in the DP controller (which may already be done? I
>>> didn't check).
>>
>> phy/pll have different configuration base on link lanes and rate.
>>
>> it has to be set up before link training can start.
>>
>> Once link training start, then there are no any interactions between
>> controller and phy during link training session.
> What do you mean? The DP controller calls phy_configure() and changes
> the link rate. The return value from phy_configure() should be checked
> and link training should skip link rates that aren't supported and/or
> number of lanes that aren't supported.
>
>> Link training only happen between dp controller and sink since link
>> status is reported by sink (read back from sink's dpcd register directly).
>>
>> T achieve link symbol locked, link training will start from reduce link
>> rate until lowest rate, if it still failed, then it will reduce lanes
>> with highest rate and start training  again.
>>
>> it will repeat same process until lowest lane (one lane), if it still
>> failed, then it will give up and declare link training failed.
> Yes, that describes the link training algorithm. I don't see why
> phy_configure() return value can't be checked and either number of lanes
> or link frequencies be checked. If only two lanes are supported, then
> phy_configure() will fail for the 4 link rates and the algorithm will
> reduce the number of lanes and go back to the highest rate. Then when
> the highest rate isn't supported it will drop link rate until the link
> rate is supported.
>
>> Therefore I think add data-lanes and link-frequencies properties in the
>> DP PHY binding directly will not helps.
>>
> I didn't follow your logic. Sorry.

Sorry, probably i did not understand your proposal clearly.

1) move both data-lanes and link-frequencies property from dp controller 
endpoint to phy

2) phy_configure() return succeed if both data-lanes and link 
frequencies are supported. otherwise return failed.

is above two summary items correct?

Currently phy_configure()  is part of link training process and called 
if link lanes or rate changes.

however, since current phy_configure() implementation always return 0, 
the return value is not checking.

This proposal is new, can we discuss more detail at meeting and decide 
to implement it or not.

Meanwhile can we merge current implementation (both data-lanes and 
link-frequqncies at dp controller end point) first?




