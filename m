Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DABD8830C11
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 18:36:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3600410E75C;
	Wed, 17 Jan 2024 17:36:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26E9010E75C
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 17:36:28 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40HFwijT032492; Wed, 17 Jan 2024 17:36:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=LfSiUZ91Q3oeiJCjZK72KIEvO+FfTlzQ2mey/Qz8L70=; b=Tn
 GjItSjdlYa8IWAMFNVbzF/Q61nfeay+RorCY/meHv4TAvJ5r4AQczrDAeWXo5Ts/
 umuR3HVUL3ooWZGfqc4EYAt2CeYrKdppthfEFT9wDx+/GxNJj3odjiXR5j07f/p2
 ABdrz27jmFav3JVhTkh8vmYApWV9LjSewBJAJXXAyaRMtNYXRFb7CQqW36k0CKrC
 EXR9dI58bF3P3gQV7s6bbYOaZpipk4WVkQdl7mEZTgfmADkj8GqSe6B1dLI4bybR
 j949/xQHmJKiSywPJrnTJ+BO5nM+aNvWvB78r6oguSA7149VrRJJsSUGy0dcQ+Zg
 Q7MbGzNEBiFLui2R79Ww==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vp6p3srrd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Jan 2024 17:36:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40HHaLfw016379
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Jan 2024 17:36:21 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 17 Jan
 2024 09:36:20 -0800
Message-ID: <e1f10583-1d5b-fdac-24bf-098a0ba06241@quicinc.com>
Date: Wed, 17 Jan 2024 09:36:20 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH RFC 0/4] Support for Simulated Panels
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Jessica Zhang <quic_jesszhan@quicinc.com>
References: <20240116-jz-test-sim-panel-v1-0-f9511f46c9c7@quicinc.com>
 <x6wi5xnihnbpqsujjfjfw3ft6njncruta5l3xa44pds5oxmdkw@mmvv4bciy65s>
 <87cyu0qn81.fsf@intel.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <87cyu0qn81.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: IWY0whpyQ5J1YLHYPDDvzS96nfSpzFIq
X-Proofpoint-ORIG-GUID: IWY0whpyQ5J1YLHYPDDvzS96nfSpzFIq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-17_10,2024-01-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 phishscore=0 clxscore=1011 priorityscore=1501 bulkscore=0 impostorscore=0
 adultscore=0 mlxlogscore=999 lowpriorityscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401170127
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Daniel
 Vetter <daniel@ffwll.ch>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani and Maxime

On 1/17/2024 2:16 AM, Jani Nikula wrote:
> On Wed, 17 Jan 2024, Maxime Ripard <mripard@kernel.org> wrote:
>> Hi,
>>
>> On Tue, Jan 16, 2024 at 02:22:03PM -0800, Jessica Zhang wrote:
>>> This series introduces a simulated MIPI DSI panel.
>>>
>>> Currently, the only way to validate DSI connectors is with a physical
>>> panel. Since obtaining physical panels for all possible DSI configurations
>>> is logistically infeasible, introduce a way for DSI drivers to simulate a
>>> panel.
>>>
>>> This will be helpful in catching DSI misconfiguration bugs and catching
>>> performance issues for high FPS panels that might not be easily
>>> obtainable.
>>>
>>> For now, the simulated panel driver only supports setting customized
>>> modes via the panel_simlation.mode modparam. Eventually, we would like
>>> to add more customizations (such as configuring DSC, dual DSI, etc.).
>>
>> I think that it's more complicated than it needs to be.
> 
> Both too complicated and not complicated enough! :p
> 

The end goal is to have a framework to be able to validate the display 
pipeline with MIPI panels of any resolution , DSC/non-DSC, different 
MIPI flags etc.

Historically, QC has been having an in-house framework to validate the 
panels in a simulated way as its logistically not possible to procure 
every panel from every vendor. This has been working pretty well but its 
not upstream yet. So we would like to work with the community to work on 
a model which works for everyone and this RFC was initiated with that in 
mind.

There is simulation infrastructure in place in upstream for HDMI/DP in 
the form of chamelium based testing in IGT but no such fwk exists for 
DSI displays.

Different MIPI panels and resolutions test out not only the DSI 
controller but the entire display pipeline as based on resolution, 
compression and MIPI mode flags different parts of the pipeline can get 
exercised.

>> Why do we need to support (and switch to) both the actual and
>> "simulated" panel?
>>

As per my discussion on IRC with the panel/bridge maintainers and DT 
maintainers, a simulation panel does not qualify for its own devicetree 
as its not a real hardware so we needed to come up with a way to have a 
module which can be attached to the encoder without its own bindings and 
devicetree. Thats what led to this RFC.

>> Wouldn't it be simpler if we had a vkms-like panel that we could either
>> configure from DT or from debugfs that would just be registered the
>> usual way and would be the only panel we register?
> 

No, we need to have validate actual hardware pipeline with the simulated 
panel. With vkms, actual display pipeline will not be validated. With 
incorrect display pipeline misconfigurations arising from different 
panel combinations, this can easily be caught with any existing IGT CRC 
testing. In addition, all performance related bugs can also be easily 
caught by simulating high resolution displays.

> I get the idea of trying to test DSI code without panels, and looking at
> the goals above, I think your vkms suggestion is going to fall short of
> those goals.
> 
> However, my gut feeling is that creating a simulated panel to catch DSI
> misconfiguration etc. is going to be insanely complicated, and this
> series doesn't even scratch the surface.
> 
> I guess my questions are, what's the scope here really, are those goals
> realistic, does more code already exist beyond this skeleton?
> 


This series is only a starting RFC to be able to validate any display 
mode. This would have to be extended to be able to customize different 
pieces of the panel. Lets talk about the customizable pieces:

1) Display resolution with timings (drm_display_mode)
2) Compression/non-compression
3) Command mode/Video mode
4) MIPI mode flags
5) DCS commands for panel enable/disable and other panel sequences
6) Power-up/Power-down sequence for the panel

Without a physical panel, yes its hard to validate if anything is wrong 
with (4) OR (5), the display might not come up at all visually. But from 
our experience, thats only a small portion and the real benefit of this 
framework will actually be from the validation failures we will catch 
from (1) to (4).

This RFC only provides a way to customize (1) at the moment as we wanted 
to get some feedback from the community about the best way which will 
work for everyone to customize all these parameters.

We are willing to expand this series based on the generic way we agree 
on to customize other params.

Yes, debugfs is an option too. But typically MIPI displays need some 
parameters configured to attach the panel to the encoder. So perhaps we 
can boot the simulation panel with a default resolution passed through 
command line and then across a modeset switch (1) to (4).

Thanks

Abhinav
> BR,
> Jani.
> 
> 
> 
