Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA62086BA2E
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 22:49:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC90510E050;
	Wed, 28 Feb 2024 21:49:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="O0EgQD+6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C637C10E031
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 21:49:43 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41SJnTpX017138; Wed, 28 Feb 2024 21:49:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=QVXUnd4fEQs7WnsKDeEjm15pi3EzyqRuIaFQJZzbhDM=; b=O0
 EgQD+6vir+QcEB0tBCVv28I+iZhzG/Q6MLZ83Wx3DHs3EeCcVBsjadsrufwksFaU
 2X1fspS59rVSCsBEMDWXHrI2vhERsKwAqwV8suGuJTCHxbXWICt26DyK0oUaZQY6
 Okv8HbBNX+KkgDubAtEWifjetwfK/xNmvenj2lR36JSIz2ab8GaNM+7TlhNxFff7
 FuX8LucmuDAjTNz0QxRPk9DtszrIEvGkMf3YoU0aTFcpUiJUiEjiOF5ZowPYO+S8
 Q9WcrHIGaQnAdqIWjjDRzQWGCi3oLJB9yg3QdShb3YLlkYtpfU9JfO2XYjv7bSx5
 CrG9L+yXKx3ReOzrnmDw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wj458hjpp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Feb 2024 21:49:36 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41SLnZCq008734
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Feb 2024 21:49:35 GMT
Received: from [10.71.111.207] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 28 Feb
 2024 13:49:35 -0800
Message-ID: <6470960a-dbe8-43ca-889a-b5a7cc934569@quicinc.com>
Date: Wed, 28 Feb 2024 13:49:34 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/4] Support for Simulated Panels
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>, Thomas Zimmermann
 <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, "David Airlie" <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 "open list:OPEN FIRMWARE AND
 FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
References: <20240116-jz-test-sim-panel-v1-0-f9511f46c9c7@quicinc.com>
 <x6wi5xnihnbpqsujjfjfw3ft6njncruta5l3xa44pds5oxmdkw@mmvv4bciy65s>
 <87cyu0qn81.fsf@intel.com> <e1f10583-1d5b-fdac-24bf-098a0ba06241@quicinc.com>
 <hhmbghooegclx3jbsx2neryligk3mj77lq7gns5xegags5ltoz@acdu6hssqwlw>
 <99705d73-abcf-6d41-3d50-757e706cf1fc@quicinc.com>
 <Zbi4-S49CWlUkO__@phenom.ffwll.local>
 <gs634bhdctmpxhhdjw3bddirvc6ex7fwdmy4xr4pygyibvmp5g@zfouf76tmti2>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <gs634bhdctmpxhhdjw3bddirvc6ex7fwdmy4xr4pygyibvmp5g@zfouf76tmti2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 4vNwddsN7ybfojmIkMJj-oI8WVkddllE
X-Proofpoint-ORIG-GUID: 4vNwddsN7ybfojmIkMJj-oI8WVkddllE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-28_08,2024-02-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011
 phishscore=0 mlxlogscore=999 mlxscore=0 spamscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402280173
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



On 2/2/2024 2:15 AM, Maxime Ripard wrote:
> On Tue, Jan 30, 2024 at 09:53:13AM +0100, Daniel Vetter wrote:
>>>>>>> Wouldn't it be simpler if we had a vkms-like panel that we could either
>>>>>>> configure from DT or from debugfs that would just be registered the
>>>>>>> usual way and would be the only panel we register?
>>>>>>
>>>>>
>>>>> No, we need to have validate actual hardware pipeline with the simulated
>>>>> panel. With vkms, actual display pipeline will not be validated. With
>>>>> incorrect display pipeline misconfigurations arising from different panel
>>>>> combinations, this can easily be caught with any existing IGT CRC testing.
>>>>> In addition, all performance related bugs can also be easily caught by
>>>>> simulating high resolution displays.
>>>>
>>>> That's not what I meant. What I meant was that something like a
>>>> user-configurable, generic, panel driver would be a good idea. Just like
>>>> vkms (with the debugfs patches) is for a full blown KMS device.
>>>>
>>>
>>> Let me respond for both this question and the one below from you/Jani.
>>>
>>> Certainly having user-configurable information is a goal here. The end-goal
>>> is to make everything there in the existing panels such as below like I
>>> wrote:
>>>
>>> 1) Display resolution with timings (drm_display_mode)
>>> 2) Compression/non-compression
>>> 3) Command mode/Video mode
>>> 4) MIPI mode flags
>>> 5) DCS commands for panel enable/disable and other panel sequences
>>> 6) Power-up/Power-down sequence for the panel
>>>
>>> But, we also have to see what all is feasible today from the DRM fwk
>>> standpoint. There are some limitations about what is boot-time configurable
>>> using bootparams and what is runtime configurable (across a modeset) using
>>> debugfs.
>>>
>>> 1) Today, everything part of struct mipi_dsi_device needs to be available at
>>> boot time from what I can see as we need that while calling
>>> mipi_dsi_attach(). So for that we went with boot-params.
>>>
>>> 2) For the list of modes, we can move this to a debugfs like
>>> "populate_modes" which the client using a sim panel can call before picking
>>> a mode and triggering a commit.
>>>
>>> But we need to have some default mode and configuration.
>>
>> Uh, at the risk of sounding a bit like I'm just chasing the latest
>> buzzwords, but this sounds like something that's screaming for ebpf.
> 
> I make a half-joke to Jani on IRC about it, but I was also being
> half-serious. If the goal we want to have is to fully emulate any panel
> variation, ebpf really looks like the best and most flexible way
> forward.

Hi Maxime and Daniel,

For our current sim panel requirements, we can go with implementing the 
configfs first then add ebpf if requirements get more complex.

Thanks,

Jessica Zhang

> 
> Maxime
