Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E2C64F158
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 20:03:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5639210E61C;
	Fri, 16 Dec 2022 19:03:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB5D310E0E1;
 Fri, 16 Dec 2022 19:03:30 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BGGltkJ015933; Fri, 16 Dec 2022 19:03:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=vW0vZJBTn0bsMVcvNWIMjMwOPKd4Tcr/VYfysdsd4kQ=;
 b=VfkXBkd2mD+VVPNMZK3ePzjsVRYe9RWxrh4uUjawftJaVfM7tcBCDb4oGgO3mlmjTFBq
 8uMdFz1goBq1o8UJPNWkPI85YqU9qrDJ0xIgCKLZ1iwfe4hgMPDHWsNU/852nKEkIeXe
 e0X5mZOYxQC/i92o9qyNBt4bMv3Vqs7vPs/+2IV7+hwBf8vHfdKZPWJZULVN6w9XZl4o
 ayiU+50327Td5X9CsSORU1fg+jjJxNbLWCTdcRZ8Q0HSNetTiBlR4h4TMJrH9MVr9ru/
 udwMlTc4Z3jo6ucEFF1z++i2mW7yqskesg43oDuxIF3DzjInDPLvOToEPlhA/g5j/FhK Pg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mg2vwd060-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Dec 2022 19:03:20 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BGJ3KFH013400
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Dec 2022 19:03:20 GMT
Received: from [10.110.47.220] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 16 Dec
 2022 11:03:18 -0800
Message-ID: <880fd46c-3578-a49d-6b1c-93e1b9128cf5@quicinc.com>
Date: Fri, 16 Dec 2022 11:03:10 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v12 2/5] dt-bindings: msm/dp: add data-lanes and
 link-frequencies property
To: Stephen Boyd <swboyd@chromium.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, <agross@kernel.org>,
 <airlied@gmail.com>, <andersson@kernel.org>, <daniel@ffwll.ch>,
 <devicetree@vger.kernel.org>, <dianders@chromium.org>,
 <dri-devel@lists.freedesktop.org>, <konrad.dybcio@somainline.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <robdclark@gmail.com>,
 <robh+dt@kernel.org>, <sean@poorly.run>, <vkoul@kernel.org>
References: <1670967848-31475-1-git-send-email-quic_khsieh@quicinc.com>
 <1670967848-31475-3-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n52eHYCqxUJqQXoaQ8vyqCk-QfouSun+zUp3yo5DufWbwg@mail.gmail.com>
 <b38af164-08bc-07e7-dfaf-fb4d6d89d7db@quicinc.com>
 <CAE-0n53Cb6TFGfM6AYup5aP4=24j0ujVPi463oVqmzfNV2B4RA@mail.gmail.com>
 <011c1ce3-605a-1ad5-d7df-b91e8c6808bc@linaro.org>
 <CAE-0n51fxiNX6N2WvXrXXjmGtiDk-SwnyikRnDEKaK-rug2-Ew@mail.gmail.com>
Content-Language: en-US
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAE-0n51fxiNX6N2WvXrXXjmGtiDk-SwnyikRnDEKaK-rug2-Ew@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 2DRg-2XAdd3yUNbd9yzq25xpq6JZL-H9
X-Proofpoint-ORIG-GUID: 2DRg-2XAdd3yUNbd9yzq25xpq6JZL-H9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-16_12,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 clxscore=1015 phishscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212160166
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


On 12/15/2022 6:16 PM, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2022-12-15 13:12:49)
>> On 15/12/2022 02:38, Stephen Boyd wrote:
>>> Quoting Kuogee Hsieh (2022-12-14 14:56:23)
>>>> Once link training start, then there are no any interactions between
>>>> controller and phy during link training session.
>>> What do you mean? The DP controller calls phy_configure() and changes
>>> the link rate. The return value from phy_configure() should be checked
>>> and link training should skip link rates that aren't supported and/or
>>> number of lanes that aren't supported.
>> I'd toss another coin into the argument. We have previously discussed
>> using the link-frequencies property in the context of limiting link
>> speeds for the DSI. There we have both hardware (SoC) limitations and
>> the board limitations as in some cases the DSI lanes can not sustain
>> some high rate. I still hope for these patches to materialize at some point.
>>
>> For the DP this is more or less the same story. We have the hardware
>> (SoC, PHY, etc) limitations, but also we have the board/device
>> limitations. For example some of the board might not be able to support
>> HBR3 e.g. because of the PCB design. And while it might be logical to
>> also add the 'max bit rate' support to the eDP & combo PHYs, it
>> definitely makes sense to be able to limit the rate on the DP <->
>> `something' link.
> Honestly I don't think the PHY even makes sense to put the link rate
> property. In the case of Trogdor, the DP controller and DP PHY both
> support all DP link frequencies. The limiting factor is the TCPC
> redriver that is only rated to support HBR2. We don't describe the TCPC
> in DT because the EC controls it. This means we have to put the limit
> *somewhere*, and putting it in the DP output node is the only place we
> have right now. I would really prefer we put it wherever the limit is,
> in this case either in the EC node or on the type-c ports.
>
> Another nice to have feature would be to support different TCPCs connected
> to the same DP port. We were considering doing this on Trogdor, where we
> would have a TCPC rated for HBR2 and another TCPC rated for HBR3 and
> then detect which TCPC was in use to adjust the supported link rates.
> We didn't do this though, so the idea got back-burnered.
>
> When the SoC is directly wired to a DP connector, I'd expect the
> connector to have the link rate property. That's because the connector
> or the traces outside of the SoC will be the part that's limiting the
> supported frequencies, not the SoC. The graph would need to be walked to
> find the link rate of course. The PHY could do this just as much as the
> DP controller could.
>
>> Now, for all the practical purposes this `something' for the DP is the
>> DP connector, the eDP panel or the USB-C mux (with the possible
>> redrivers in the middle).
>>
>> Thus I'd support Kuogee's proposal to have link-frequencies in the DP's
>> outbound endpoint. This is the link which will be driven by the data
>> stream from the Linux point of view. The PHY is linked through the
>> 'phys' property, but it doesn't participate in the USB-C (or in the
>> connector/panel) graph.
> Why doesn't the PHY participate in the graph? The eDP panel could just
> as easily be connected to the eDP PHY if the PHY participated in the
> graph.
>
>> Now let's discuss the data lanes. Currently we have them in the DP
>> property itself. Please correct me if I'm wrong, but I think that we can
>> drop it for all the practical purposes.
> I vaguely recall that the driver was checking data-lanes to figure out
> how many lanes are usable. This is another shortcut taken on Trogdor to
> work around a lack of complete DP bindings. We only support two lanes of
> DP on Trogdor.
>
>> Judging by the DP compat string
>> the driver can determine if it uses 2 lanes (eDP) or 4 lanes
>> (full-featured DP). In case of USB-C when the altmode dictates whether
>> to use 2 or 4 lanes, the TCPM (Type-C Port Manager) will negotiate the
>> mode and pin configuration, then inform the DP controller about the
>> selected amount of lanes. Then DP informs the PHY about the selection
>> (note, PHY doesn't have control at all in this scenario).
>>
>> The only problematic case is the mixed mode ports, which if I understand
>> correctly, can be configured either to eDP or DP modes. I'm not sure who
>> specifies and limits the amount of lanes available to the DP controller.
>>
> This would depend on where we send the type-c message in the kernel. It
> really gets to the heart of the question too. Should the PHY be "dumb"
> and do whatever the controller tells it to do? Or should the PHY be
> aware of what's going on and take action itself? Note that the
> data-lanes property is also used to remap lanes. On sc7180 the lane
> remapping happens in the DP PHY, and then the type-c PHY can flip that
> too, so if we don't involve the PHY(s) in the graph we'll have to
> express this information in the DP controller graph and then pass it to
> the PHY from the controller. Similarly, when we have more dynamic
> configuration of the type-c PHY, where USB may or may not be used
> because the TCPM has decided to use 2 or 4 lanes of DP, the data-lanes
> property will only indicate lane mappings and not the number of lanes
> supported. We'll again have to express the number of lanes to the PHY by
> parsing the type-c messages.
>
> It looks simpler to me if the PHY APIs push errors up to the caller for
> unsupported configurations. This will hopefully make it easier for the
> DP controller when the DP lanes are muxed onto a type-c port so that the
> controller doesn't have to parse type-c messages. Instead, the PHY will
> get the type-c message, stash away supported number of lanes and link
> rates and then notify the DP controller to retrain the link with the
> link training algorithm. A few steps of the link training may be
> skipped, but the type-c message parsing won't need to be part of the DP
> controller code. Said another way, the DP controller can stay focused on
> DP instead of navigating type-c in addition to DP.
>
>  From a binding perspective, data-lanes/link-frequencies are part of the
> graph binding. Having a graph port without a remote-endpoint doesn't
> really make any sense. Therefore we should decide to either connect the
> PHY into the graph and constrain it via graph properties like
> data-lanes, or leave it disconnected and have the controller drive the
> PHY (or PHYs when we have type-c). The type-c framework will want the
> orientation control (the type-c PHY) to be part of the graph from the
> usb-c-connector. That way we can properly map the PHY pins to the
> flipped or not-flipped state of the cable. Maybe we don't need to
> connect the PHY to the DP graph? Instead there can be a type-c graph for
> the PHY, TCPM, etc. and a display graph for the display chain. It feels
> like that must not work somehow.
>
> Either way, I don't see how or why these properties should be part of
> the DP controller. The controller isn't the limiting part, it's the
> redriver or the board/connector/panel that's the limiting factor. Walk
> the graph to find the lowest common denominator of link-frequencies and
> handle data-lanes either statically in the PHY or dynamically by parsing
> type-c messages. How does the eDP panel indicate only two lanes are
> supported when all four lanes are wired? I thought that link training
> just fails but I don't know.

According to  DP specification, link policy and stream policy is happen 
at link layer which is dp controller in our case.

Also DP CTS (compliance Test) is also happen at link layer.

I think intelligence should be placed at link layer.

I will submit v14 patch and we can discuss more.


