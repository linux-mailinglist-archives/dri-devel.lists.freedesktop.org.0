Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E7674BE47
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jul 2023 17:41:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB1010E0F0;
	Sat,  8 Jul 2023 15:41:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3276610E0F0
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jul 2023 15:41:02 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id EA723861A1;
 Sat,  8 Jul 2023 17:40:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1688830859;
 bh=Q93i6ZFRqe4Xj0HAnyap24yrBfko+wDS3oDw9gziADI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=AoxxnN9gAF/E0MPV2SZ98pF9jl2blfheyvL0SrwtciUDuiWUhQB1hcIR6xKli+nDh
 4DCobKt7lHfSUD31ywWXjsE59C04dOK7Y6wgAfSUcHnYYSzLEgjqXqOckt0BPZDHIu
 YeIRpP01OLLHFYW0X7PGPn4YYkuOPKz+r3zsalpWjrJtB1JD/dSDrFQnnuQRMcodBR
 P82AQ3szcuGc2mcyy63YvWowQ8GqbignYB8aUxxAVtjTwyCzL7+B0JS7kdDtpcFLhJ
 V783SidDBsWMFtIftrOi2FD9Uwtf1p0qXJXTuTBYsaQDNXLy68r8ylDbCDjVhFe+6h
 8odn5AxmJ+nAg==
Message-ID: <800f9e1a-cb66-5bf5-d225-ef338c1c1584@denx.de>
Date: Sat, 8 Jul 2023 17:40:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/2] drm/bridge: lt9611: Do not generate HFP/HBP/HSA and
 EOT packet
To: neil.armstrong@linaro.org, Amit Pundir <amit.pundir@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230403221233.500485-1-marex@denx.de>
 <20230403221233.500485-2-marex@denx.de>
 <CAMi1Hd0TD=2z_=bcDrht3H_wiLvAFcv8Z-U_r_KUOoeMc6UMjw@mail.gmail.com>
 <CAMty3ZBNFu=f-FS4YFN4wfmiTuk=48nna-vub1eMYwidDt+msg@mail.gmail.com>
 <CAA8EJppbdiUz5m+9EAPnFb916DaS_VKWd30c7_EPWjuid8rtqQ@mail.gmail.com>
 <CAMi1Hd2G5PJmz4wpO1wbdqKd0FA8LBgvRDv2u5ZYAMb5s6Kt0A@mail.gmail.com>
 <d5fb8106-b8f3-0acf-1267-d4d6d0860e25@linaro.org>
 <d28b0090-bd1e-6737-d92b-348dc6c30750@linaro.org>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <d28b0090-bd1e-6737-d92b-348dc6c30750@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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

On 7/7/23 10:47, Neil Armstrong wrote:
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

I don't have the LT9611 datasheet, no.

The MX8M DSI (samsung-dsim) skips the HSA/HFP/HBP completely (see 
i.MX8MP RM 13.6.2.7.2 RGB Interface , there is infographics on the 
following pages).

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
> @Jagan, Andrezej So you have any documentation on what 
> DSIM_xxx_DISABLE_MODE does ?

See above, i.MX8M M/N/P uses the samsung-dsim block .

> @Dmitry, so you have access to the lt9611 datasheet to know what's 
> needed here ?

[...]
