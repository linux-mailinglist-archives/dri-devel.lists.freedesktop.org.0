Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC00D9ECC90
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 13:50:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2255C10EB2B;
	Wed, 11 Dec 2024 12:50:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="bKHlB12J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7692810EB24;
 Wed, 11 Dec 2024 12:50:23 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BBAokM2006981;
 Wed, 11 Dec 2024 12:50:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zk4s7vhB2asnvEBnYuTFCimLlmm/nGDu1HLQOKCWzJw=; b=bKHlB12Jc8cR9Zp4
 /EF33Rrz2D9AwqIyHOV5F1upJtrVWdK1NJn3tfowkFdhpPIj7/wGLCiGjgx7KchR
 tHdxHg8Vt/dadt2UERt8XsQ1wpOEudK1WorLRGBu2l6EQb4U8avn0yxwThtrA+eN
 XeNR8i2DeyOjPcQ8t1vNVl925MX25zjNjb/pVjitF8WQNyOaWQ12CobMMICCWgCT
 OQIgvGu9ppiUGoMr9H/8nv26lrxm0qUYRME+Irxx0dpEEZSArssg0mSygxrYgdfT
 DJkBAyM0Gh2mVkb2C6i51qmsUBHECMAlhZyGC8qOi4dHLo3SyAQYzQZXnlXt/i2s
 RKsFhw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43f0r9swvp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Dec 2024 12:50:13 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
 by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BBCoCuX026022
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Dec 2024 12:50:12 GMT
Received: from [10.64.16.135] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 11 Dec
 2024 04:50:05 -0800
Message-ID: <d5151b82-5f05-4826-99b4-e925c20550b4@quicinc.com>
Date: Wed, 11 Dec 2024 20:50:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] phy: qcom: qmp-usbc: Add DP phy mode support on QCS615
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, "Kuogee
 Hsieh" <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>, "Kishon
 Vijay Abraham I" <kishon@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, <quic_lliu6@quicinc.com>,
 <quic_fangez@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-phy@lists.infradead.org>, <linux-gpio@vger.kernel.org>
References: <20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com>
 <20241129-add-displayport-support-for-qcs615-platform-v1-3-09a4338d93ef@quicinc.com>
 <CAA8EJppOR_UXoVpMt-dhfWdCz3UNfsXGdz8X9NqpaSmYj3AZDg@mail.gmail.com>
 <5ea14162-567b-462d-be02-b73b954b7507@quicinc.com>
 <5whv4z7u6fkfwlv5muox5dmv6fow4mga76ammapw7wph7vwv3f@xibcjdfqorgf>
 <iqcofcntirmlwcpyfr4yabymqfcgyrij57bibf337tmxpa73t6@npkt6wquenf6>
 <527baded-f348-48a8-81cd-3f84c0ff1077@quicinc.com>
 <t5vcjlf44fhae4f2h75cfs3f7r6tdstw4ysmkapvvawj6xp23x@xnxqnxvyhshe>
From: Xiangxu Yin <quic_xiangxuy@quicinc.com>
In-Reply-To: <t5vcjlf44fhae4f2h75cfs3f7r6tdstw4ysmkapvvawj6xp23x@xnxqnxvyhshe>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: YEcBUSMTawlFVl6QGG7shl_PtInvRli7
X-Proofpoint-GUID: YEcBUSMTawlFVl6QGG7shl_PtInvRli7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 mlxlogscore=999
 malwarescore=0 lowpriorityscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412110093
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



On 12/11/2024 5:46 PM, Dmitry Baryshkov wrote:
> On Wed, Dec 11, 2024 at 08:46:16AM +0800, Xiangxu Yin wrote:
>>
>>
>> On 12/10/2024 11:09 PM, Dmitry Baryshkov wrote:
>>> On Thu, Dec 05, 2024 at 08:31:24PM +0200, Dmitry Baryshkov wrote:
>>>> On Thu, Dec 05, 2024 at 09:26:47PM +0800, Xiangxu Yin wrote:
>>>>>
>>>>>
>>>>> On 11/29/2024 10:33 PM, Dmitry Baryshkov wrote:
>>>>>> On Fri, 29 Nov 2024 at 09:59, Xiangxu Yin <quic_xiangxuy@quicinc.com> wrote:
>>>>>>>
>>>>>>> Extended DP support for QCS615 USB or DP phy. Differentiated between
>>>>>>> USBC and DP PHY using the match table’s type, dynamically generating
>>>>>>> different types of cfg and layout attributes during initialization based
>>>>>>> on this type. Static variables are stored in cfg, while parsed values
>>>>>>> are organized into the layout structure.
>>>>>>
>>>>>> We didn't have an understanding / conclusion whether
>>>>>> qcom,usb-ssphy-qmp-usb3-or-dp PHYs are actually a single device / PHY
>>>>>> or two PHYs being placed next to each other. Could you please start
>>>>>> your commit message by explaining it? Or even better, make that a part
>>>>>> of the cover letter for a new series touching just the USBC PHY
>>>>>> driver. DP changes don't have anything in common with the PHY changes,
>>>>>> so you can split the series into two.
>>>>>>
>>>>> Before implement DP extension, we have discussed with abhinav and krishna about whether use combo, usbc or separate phy.
>>>>
>>>> What is "DP extension"?
>>>>
>> I'm sorry confusion casued by my description. It's means extend DP implemnt for USBC phy driver.
>>>>>
>>>>> We identified that DP and USB share some common controls for phy_mode and orientation.
>>>>> Specifically, 'TCSR_USB3_0_DP_PHYMODE' controls who must use the lanes - USB or DP,
>>>>> while PERIPH_SS_USB0_USB3PHY_PCS_MISC_TYPEC_CTRL controls the orientation.
>>>>> It would be more efficient for a single driver to manage these controls. 
>>>>
>>>> The question is about the hardware, not about the driver.
>>>>
>>>>> Additionally, this PHY does not support Alt Mode, and the two control registers are located in separate address spaces. 
>>>>> Therefore, even though the orientation for DP on this platform is always normal and connected to the video output board, 
>>>>> we still decided to base it on the USBC extension.
>>>>
>>>> Could you please clarify, do usb3-or-dp PHYs support DP-over-USB-C? I
>>>> thought that usbc-or-dp platforms support that, but they don't
>>>> support DP+USB pin configuration. Note, the question is broader than
>>>> just QCS615, it covers the PHY type itself.
>>>>
>>>> Also, is TCSR configuration read/write or read-only? Are we supposed to
>>>> set the register from OS or are we supposed to read it and thus detemine
>>>> the PHY mode?
>>>
>>> Any updates on these two topics?
>>>
>> Still confirming detail info with HW & design team.
>> I’ll update the information that has been confirmed so far.
>> This phy support DP-over-USB-C,but it's not support alt-mode which 2 lane work for DP, other 2 lane work for USB.
>> TCSR phy mode is read/write reg and we can read for determine phy mode.
> 
> Ok, thanks for the explanation. From my point of view:
> 
> - Implement the DP PHY to be a part of the same driver. Each device
>   supported by the usbc driver should get both PHYs.
> 
> - Make sure not to break the ABI: #phy-cells = <0> should still work and
>   return USB PHY, keeping backwards compatibility. Newer devices or
>   upgraded DT for old devices should return USB PHY for <... 0> and DP
>   PHY for <... 1>.
> 
Yes, currently we have implemented like your description,
Each deivce shoud get both PHYs, DP PHY for <... 1> and USB PHY for <... 0>.
> - I'm not shure how to handle the USB and DP coexistence, especially in
>   your case of the USB-or-DP PHY.
> 
For coexistence process:

When we start implement DP part, usb driver team said only need config TCSR phy mode and orientation during switch in USB-C port.
Based on your previous comments avout SW_PWRDN, I'm confirming with the USB team whether SW_REST/SWPWRDN/START_CTRL registers might affect DP.

Anyway, even though the original SoC design supports DP or USB over Type-C，
but on QCS615 ADP AIR platform, there are only four USB-A port which works with 'qcs615-qmp-usb3-phy' driver, and no USB-C port.
DP port is mappped from usb pin to the video out sub-board.
so we are unable to verify the switching case between DP and USB devices under USB-C.

However, I'm also confirming whether anything other will affect USB and DP each other.


