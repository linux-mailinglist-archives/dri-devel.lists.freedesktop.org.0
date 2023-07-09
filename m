Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AAB74C03D
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jul 2023 03:04:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05FAC10E0DF;
	Sun,  9 Jul 2023 01:04:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ABAF10E094;
 Sun,  9 Jul 2023 01:04:12 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36910Dvl009532; Sun, 9 Jul 2023 01:03:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=iQXB7TR04UyGGj4mBOEpT+1563r66btmPpPOk9MO784=;
 b=VWbuUjSSCpWeLSF0AkQ3yDlfcxTgBuAMz0vsHyOOyXAdqVB2KIxB/ywyI5dCumbOHR4B
 IS9832qiPSzBWiZ/0lTzp8Tv2B0UYLiM8qo6yayuFW6UO6fo0H+COyLQxfWhj14AFyz9
 RofDuWWL1ZkXakl98b3jq2hJY/A4kAhssbyQB7r0qgmEaXLLxBtYbdk94unJY9yozKRF
 Tr/Z1ovXF27UXvU8aWHcp8IKxBOE3L0cjm9GljsjBse0/vMBSIjif0bZLlPRL5ZO95b9
 z+HakZFU2xfY9UK5/sfkZS7F3UoQ8WY2N6Anjg8fD3cVFsN/BfcGylsp9jhEwsKokqYD Jw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rpxry15jc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 09 Jul 2023 01:03:51 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36913nnO005397
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 9 Jul 2023 01:03:50 GMT
Received: from [10.110.47.185] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Sat, 8 Jul
 2023 18:03:48 -0700
Message-ID: <4396d197-f16f-92bd-727c-eb8c78016198@quicinc.com>
Date: Sat, 8 Jul 2023 18:03:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/2] drm/bridge: lt9611: Do not generate HFP/HBP/HSA and
 EOT packet
Content-Language: en-US
To: <neil.armstrong@linaro.org>, Amit Pundir <amit.pundir@linaro.org>, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230403221233.500485-1-marex@denx.de>
 <20230403221233.500485-2-marex@denx.de>
 <CAMi1Hd0TD=2z_=bcDrht3H_wiLvAFcv8Z-U_r_KUOoeMc6UMjw@mail.gmail.com>
 <CAMty3ZBNFu=f-FS4YFN4wfmiTuk=48nna-vub1eMYwidDt+msg@mail.gmail.com>
 <CAA8EJppbdiUz5m+9EAPnFb916DaS_VKWd30c7_EPWjuid8rtqQ@mail.gmail.com>
 <CAMi1Hd2G5PJmz4wpO1wbdqKd0FA8LBgvRDv2u5ZYAMb5s6Kt0A@mail.gmail.com>
 <d5fb8106-b8f3-0acf-1267-d4d6d0860e25@linaro.org>
 <d28b0090-bd1e-6737-d92b-348dc6c30750@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <d28b0090-bd1e-6737-d92b-348dc6c30750@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: uokp6R2nLoOmnVSUOKGhziKeZtBK6Flg
X-Proofpoint-GUID: uokp6R2nLoOmnVSUOKGhziKeZtBK6Flg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-08_16,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 priorityscore=1501 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1011
 suspectscore=0 impostorscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2307090007
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
Cc: Marek Vasut <marex@denx.de>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Robert Foss <rfoss@kernel.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Michael Walle <michael@walle.cc>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/7/2023 1:47 AM, Neil Armstrong wrote:
> On 07/07/2023 09:18, Neil Armstrong wrote:
>> Hi,
>>
>> On 06/07/2023 11:20, Amit Pundir wrote:
>>> On Wed, 5 Jul 2023 at 11:09, Dmitry Baryshkov
>>> <dmitry.baryshkov@linaro.org> wrote:
>>>>
>>>> [Adding freedreno@ to cc list]
>>>>
>>>> On Wed, 5 Jul 2023 at 08:31, Jagan Teki <jagan@amarulasolutions.com> 
>>>> wrote:
>>>>>
>>>>> Hi Amit,
>>>>>
>>>>> On Wed, Jul 5, 2023 at 10:15 AM Amit Pundir 
>>>>> <amit.pundir@linaro.org> wrote:
>>>>>>
>>>>>> Hi Marek,
>>>>>>
>>>>>> On Wed, 5 Jul 2023 at 01:48, Marek Vasut <marex@denx.de> wrote:
>>>>>>>
>>>>>>> Do not generate the HS front and back porch gaps, the HSA gap and
>>>>>>> EOT packet, as these packets are not required. This makes the bridge
>>>>>>> work with Samsung DSIM on i.MX8MM and i.MX8MP.
>>>>>>
>>>>>> This patch broke display on Dragonboard 845c (SDM845) devboard 
>>>>>> running
>>>>>> AOSP. This is what I see
>>>>>> https://people.linaro.org/~amit.pundir/db845c-userdebug/v6.5-broken-display/PXL_20230704_150156326.jpg.
>>>>>> Reverting this patch fixes this regression for me.
>>>>>
>>>>> Might be msm dsi host require proper handling on these updated
>>>>> mode_flags? did they?
>>>>
>>>> The msm DSI host supports those flags. Also, I'd like to point out
>>>> that the patch didn't change the rest of the driver code. So even if
>>>> drm/msm ignored some of the flags, it should not have caused the
>>>> issue. Most likely the issue is on the lt9611 side. I's suspect that
>>>> additional programming is required to make it work with these flags.
>>>
>>> I spent some time today on smoke testing these flags (individually and
>>> in limited combination) on DB845c, to narrow down this breakage to one
>>> or more flag(s) triggering it. Here are my observations in limited
>>> testing done so far.
>>>
>>> There is no regression with MIPI_DSI_MODE_NO_EOT_PACKET when enabled
>>> alone and system boots to UI as usual.
>>>
>>> MIPI_DSI_MODE_VIDEO_NO_HFP always trigger the broken display as in the
>>> screenshot[1] shared earlier as well.
>>>
>>> Adding either of MIPI_DSI_MODE_VIDEO_NO_HSA and
>>> MIPI_DSI_MODE_VIDEO_NO_HBP always result in no display, unless paired
>>> with MIPI_DSI_MODE_VIDEO_NO_HFP and in that case we get the broken
>>> display as reported.
>>>
>>> In short other than MIPI_DSI_MODE_NO_EOT_PACKET flag, all other flags
>>> added in this commit break the display on DB845c one way or another.
>>
>> I think the investigation would be to understand why samsung-dsim 
>> requires
>> such flags and/or what are the difference in behavior between MSM DSI 
>> and samsung DSIM
>> for those flags ?
>>
>> If someone has access to the lt9611 datasheet, so it requires 
>> HSA/HFP/HBP to be
>> skipped ? and does MSM DSI and samsung DSIM skip them in the same way ?
> 
> I think there's a mismatch, where on one side this flags sets the link 
> in LP-11 while
> in HSA/HFP/HPB while on the other it completely removes those blanking 
> packets.
> 
> The name MIPI_DSI_MODE_VIDEO_NO_HBP suggests removal of HPB, not LP-11 
> while HPB.
> the registers used in both controllers are different:
> - samsung-dsim: DSIM_HBP_DISABLE_MODE
> - msm dsi: DSI_VID_CFG0_HBP_POWER_STOP
> 
> The first one suggest removing the packet, while the second one suggests 
> powering
> off the line while in the blanking packet period.
> 
> @Abhinav, can you comment on that ?
> 

I dont get what it means by completely removes blanking packets in DSIM.

It should be replacing those periods with LP11 too.

The traffic mode being used on this bridge is 
MIPI_DSI_MODE_VIDEO_SYNC_PULSE which is "Non-Burst Mode with Sync Pulses".

As per this traffic mode in the DSI spec,

"Normally, periods shown as HSA (Horizontal Sync Active), HBP 
(Horizontal Back Porch) and HFP (Horizontal Front Porch) are filled by 
Blanking Packets, with lengths (including packet overhead)  calculated 
to match the period specified by the peripheral’s data sheet. 
Alternatively, if there is sufficient time to transition from HS to LP 
mode and back again, a timed interval in LP mode may substitute for a 
Blanking Packet, thus saving power. During HSA, HBP and HFP periods, the 
bus should stay in the LP-11 state."

So we can either send the blanking packets or transition to LP state and 
those 3 flags are controlling exactly that during those periods for MSM 
driver.

If you stop sending the blanking packets, you need to replace that gap 
with LP.

One reason I can think of why this could break with MSM is perhaps we do 
not have sufficient time in those periods for the LP-HS transition like 
the spec has written.

1) What is the resolution which is getting broken on db845c with this? I 
would like to know the full drm_display_mode for it to see how much time 
we have in those periods. Is any resolution working or all are broken.

2) I also do not completely get the last line of the DSI spec on this 
traffic mode. Is it suggesting that we *must* use only LP11 for those 
periods in this traffic mode? I need to check little more on that. 
Because if thats the case the change is doing just that and we need to 
investigate the MSM failure little more. If not and its indeed optional 
to save power like the DSI spec says, then its weird why DSIM should be 
blank without that too.


> @Jagan, Andrezej So you have any documentation on what 
> DSIM_xxx_DISABLE_MODE does ?
> 
> @Dmitry, so you have access to the lt9611 datasheet to know what's 
> needed here ?
> 
> Neil
> 
>>
>> Neil
>>
>>>
>>> Regards,
>>> Amit Pundir
>>> [1] 
>>> https://people.linaro.org/~amit.pundir/db845c-userdebug/v6.5-broken-display/PXL_20230704_150156326.jpg
>>>
>>>>
>>>> -- 
>>>> With best wishes
>>>> Dmitry
>>
> 
