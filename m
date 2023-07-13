Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E54752A34
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 20:10:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B88AC10E758;
	Thu, 13 Jul 2023 18:10:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97F4610E756;
 Thu, 13 Jul 2023 18:10:21 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36DGrI7i022861; Thu, 13 Jul 2023 18:09:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=VVwtP+sN3pVEnerppyj2oLXPfmdP9jZwoti5GY8/GZ0=;
 b=GXmCW/HkrPYoZDhBBmp0EieYWOpU5QwLycU+Ffp28rm1zyHJX63vSDlJclWf9Lt721Vw
 DKnw0fxdclbf82qavU+dQLlxuWvNqdFgFNKzWSyTd8AF2DnV95KeaTGS8ReAHvw2y73a
 suBLhvWABxE2TuMlcm2gTNOSH+DBd+x2wsSzDqFxabiz1hOgx8HOzZkgAX99LcK2D4CI
 tGxWWlhuhn58lJtPpzEaJRTNMSf0A3r4CWD56EBJ4pCzZlPaAdU7RpE00cKUL2oBdHiZ
 /Htn6tDvqmsKE72vVfNf5No/QZ6i/I6vspx4ADTcTi0bA3b4L4FDRwS1lkTAw8TpDbmz NQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rtk1qrjbx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Jul 2023 18:09:48 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36DI9alw028005
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Jul 2023 18:09:36 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Thu, 13 Jul
 2023 11:09:35 -0700
Message-ID: <64c3352f-c2aa-5260-c6ff-4a607ce219a2@quicinc.com>
Date: Thu, 13 Jul 2023 11:09:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/2] drm/bridge: lt9611: Do not generate HFP/HBP/HSA and
 EOT packet
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <neil.armstrong@linaro.org>, Amit Pundir
 <amit.pundir@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230403221233.500485-1-marex@denx.de>
 <20230403221233.500485-2-marex@denx.de>
 <CAMi1Hd0TD=2z_=bcDrht3H_wiLvAFcv8Z-U_r_KUOoeMc6UMjw@mail.gmail.com>
 <CAMty3ZBNFu=f-FS4YFN4wfmiTuk=48nna-vub1eMYwidDt+msg@mail.gmail.com>
 <CAA8EJppbdiUz5m+9EAPnFb916DaS_VKWd30c7_EPWjuid8rtqQ@mail.gmail.com>
 <CAMi1Hd2G5PJmz4wpO1wbdqKd0FA8LBgvRDv2u5ZYAMb5s6Kt0A@mail.gmail.com>
 <d5fb8106-b8f3-0acf-1267-d4d6d0860e25@linaro.org>
 <d28b0090-bd1e-6737-d92b-348dc6c30750@linaro.org>
 <4396d197-f16f-92bd-727c-eb8c78016198@quicinc.com>
 <961b4747-c9f1-a31c-c33c-475b4803f832@denx.de>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <961b4747-c9f1-a31c-c33c-475b4803f832@denx.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: sOhumH6p46MHSPyChdtDC7eyiPNUtFNx
X-Proofpoint-GUID: sOhumH6p46MHSPyChdtDC7eyiPNUtFNx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-13_06,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2307130161
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
Cc: Robert Foss <rfoss@kernel.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Michael Walle <michael@walle.cc>, Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/12/2023 10:41 AM, Marek Vasut wrote:
> On 7/9/23 03:03, Abhinav Kumar wrote:
>>
>>
>> On 7/7/2023 1:47 AM, Neil Armstrong wrote:
>>> On 07/07/2023 09:18, Neil Armstrong wrote:
>>>> Hi,
>>>>
>>>> On 06/07/2023 11:20, Amit Pundir wrote:
>>>>> On Wed, 5 Jul 2023 at 11:09, Dmitry Baryshkov
>>>>> <dmitry.baryshkov@linaro.org> wrote:
>>>>>>
>>>>>> [Adding freedreno@ to cc list]
>>>>>>
>>>>>> On Wed, 5 Jul 2023 at 08:31, Jagan Teki 
>>>>>> <jagan@amarulasolutions.com> wrote:
>>>>>>>
>>>>>>> Hi Amit,
>>>>>>>
>>>>>>> On Wed, Jul 5, 2023 at 10:15 AM Amit Pundir 
>>>>>>> <amit.pundir@linaro.org> wrote:
>>>>>>>>
>>>>>>>> Hi Marek,
>>>>>>>>
>>>>>>>> On Wed, 5 Jul 2023 at 01:48, Marek Vasut <marex@denx.de> wrote:
>>>>>>>>>
>>>>>>>>> Do not generate the HS front and back porch gaps, the HSA gap and
>>>>>>>>> EOT packet, as these packets are not required. This makes the 
>>>>>>>>> bridge
>>>>>>>>> work with Samsung DSIM on i.MX8MM and i.MX8MP.
>>>>>>>>
>>>>>>>> This patch broke display on Dragonboard 845c (SDM845) devboard 
>>>>>>>> running
>>>>>>>> AOSP. This is what I see
>>>>>>>> https://people.linaro.org/~amit.pundir/db845c-userdebug/v6.5-broken-display/PXL_20230704_150156326.jpg.
>>>>>>>> Reverting this patch fixes this regression for me.
>>>>>>>
>>>>>>> Might be msm dsi host require proper handling on these updated
>>>>>>> mode_flags? did they?
>>>>>>
>>>>>> The msm DSI host supports those flags. Also, I'd like to point out
>>>>>> that the patch didn't change the rest of the driver code. So even if
>>>>>> drm/msm ignored some of the flags, it should not have caused the
>>>>>> issue. Most likely the issue is on the lt9611 side. I's suspect that
>>>>>> additional programming is required to make it work with these flags.
>>>>>
>>>>> I spent some time today on smoke testing these flags (individually and
>>>>> in limited combination) on DB845c, to narrow down this breakage to one
>>>>> or more flag(s) triggering it. Here are my observations in limited
>>>>> testing done so far.
>>>>>
>>>>> There is no regression with MIPI_DSI_MODE_NO_EOT_PACKET when enabled
>>>>> alone and system boots to UI as usual.
>>>>>
>>>>> MIPI_DSI_MODE_VIDEO_NO_HFP always trigger the broken display as in the
>>>>> screenshot[1] shared earlier as well.
>>>>>
>>>>> Adding either of MIPI_DSI_MODE_VIDEO_NO_HSA and
>>>>> MIPI_DSI_MODE_VIDEO_NO_HBP always result in no display, unless paired
>>>>> with MIPI_DSI_MODE_VIDEO_NO_HFP and in that case we get the broken
>>>>> display as reported.
>>>>>
>>>>> In short other than MIPI_DSI_MODE_NO_EOT_PACKET flag, all other flags
>>>>> added in this commit break the display on DB845c one way or another.
>>>>
>>>> I think the investigation would be to understand why samsung-dsim 
>>>> requires
>>>> such flags and/or what are the difference in behavior between MSM 
>>>> DSI and samsung DSIM
>>>> for those flags ?
>>>>
>>>> If someone has access to the lt9611 datasheet, so it requires 
>>>> HSA/HFP/HBP to be
>>>> skipped ? and does MSM DSI and samsung DSIM skip them in the same way ?
>>>
>>> I think there's a mismatch, where on one side this flags sets the 
>>> link in LP-11 while
>>> in HSA/HFP/HPB while on the other it completely removes those 
>>> blanking packets.
>>>
>>> The name MIPI_DSI_MODE_VIDEO_NO_HBP suggests removal of HPB, not 
>>> LP-11 while HPB.
>>> the registers used in both controllers are different:
>>> - samsung-dsim: DSIM_HBP_DISABLE_MODE
>>> - msm dsi: DSI_VID_CFG0_HBP_POWER_STOP
>>>
>>> The first one suggest removing the packet, while the second one 
>>> suggests powering
>>> off the line while in the blanking packet period.
>>>
>>> @Abhinav, can you comment on that ?
>>>
>>
>> I dont get what it means by completely removes blanking packets in DSIM.
> 
> MIPI_DSI_MODE_VIDEO_NO_HFP means the HBP period is just skipped by DSIM.
> 
> Maybe there is a need for new set of flags which differentiate between 
> HBP skipped (i.e. NO HBP) and HBP LP11 ?
>

No, the section of the MIPI DSI spec I posted below clearly states there 
are two options:

1) send blanking packets during those periods
2) transition to LP11 during those periods

There is no 3rd option in the spec of not doing both like what you are 
suggesting. So DSIM should also be only transitioning to LP11 during 
those periods if its not sending the blanking packets with those flags set.

So, there is no need for any new set of flags to differentiate.

The flags and their interpretation is correct in MSM driver. I cannot 
comment on what exactly DSIM does with those flags.


>> It should be replacing those periods with LP11 too.
>>
>> The traffic mode being used on this bridge is 
>> MIPI_DSI_MODE_VIDEO_SYNC_PULSE which is "Non-Burst Mode with Sync 
>> Pulses".
>>
>> As per this traffic mode in the DSI spec,
>>
>> "Normally, periods shown as HSA (Horizontal Sync Active), HBP 
>> (Horizontal Back Porch) and HFP (Horizontal Front Porch) are filled by 
>> Blanking Packets, with lengths (including packet overhead)  calculated 
>> to match the period specified by the peripheral’s data sheet. 
>> Alternatively, if there is sufficient time to transition from HS to LP 
>> mode and back again, a timed interval in LP mode may substitute for a 
>> Blanking Packet, thus saving power. During HSA, HBP and HFP periods, 
>> the bus should stay in the LP-11 state."
>>
>> So we can either send the blanking packets or transition to LP state 
>> and those 3 flags are controlling exactly that during those periods 
>> for MSM driver.
>>
>> If you stop sending the blanking packets, you need to replace that gap 
>> with LP.
> 
> I don't think that's what MIPI_DSI_MODE_VIDEO_NO_HBP means, the way I 
> understand MIPI_DSI_MODE_VIDEO_NO_HBP is that it skips the HBP 
> completely. So if you want HBP, then do not set 
> MIPI_DSI_MODE_VIDEO_NO_HBP . And if you want LP11 during HBP, that is I 
> think up to the controller (or maybe another new flag?).
> 

No, there is no need of another new flag. There are only two options as 
per the spec.

In fact, as per my checking with more folks, requiring LP11 during those 
periods is something very rare.

Because usually horizontal period is usually a very short period, most 
of the time we do not use the LP11 option and send the blanking packets 
instead.

So its something very unusual for DSIM.

That being said, I still think my previous question is important.

1) What is the difference between the resolution you are trying Vs what 
Amit is trying?

2) Are you both using just standard HDMI monitors?

Standard HDMI monitors follow VESA or CEA which usually have pretty low 
hblank so its not surprising that the LP11 option does not work as the 
blanking time is not sufficient for this LP<->HS transition.

>> One reason I can think of why this could break with MSM is perhaps we 
>> do not have sufficient time in those periods for the LP-HS transition 
>> like the spec has written.
>>
>> 1) What is the resolution which is getting broken on db845c with this? 
>> I would like to know the full drm_display_mode for it to see how much 
>> time we have in those periods. Is any resolution working or all are 
>> broken.
>>
>> 2) I also do not completely get the last line of the DSI spec on this 
>> traffic mode. Is it suggesting that we *must* use only LP11 for those 
>> periods in this traffic mode? I need to check little more on that. 
>> Because if thats the case the change is doing just that and we need to 
>> investigate the MSM failure little more. If not and its indeed 
>> optional to save power like the DSI spec says, then its weird why DSIM 
>> should be blank without that too.
> 
> [...]
