Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 083DC76D514
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 19:25:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 349EF10E211;
	Wed,  2 Aug 2023 17:25:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DC9210E211;
 Wed,  2 Aug 2023 17:25:21 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 60D5B8685D;
 Wed,  2 Aug 2023 19:25:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1690997119;
 bh=RYe5PxJYQ9XrOHJfTi636roYNO47+WQvmmqcvq5UECM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=eVFe57KoNs4YTqA0uiq3jG392qoq2aYa2ch2IpgVhL+mcKy0vY4865Ep6sV5CbRDx
 0Syff0W9iVZUJjgvV3lIbIEt9E/eYpTYyDofUzVytSWx/QKmz2FKKz+utQEzPxs5Ps
 y5Jt2ekFNFsuevweac978G1PHlhjPxpwk+/O4UFiHhqcvrZ4TupN4OFpp6NqeGzcXw
 G+wWl2WfZ8nSdLAgcXTqaY+HSAonDk4G062DKQgjadTcqb6SOKSqUJI3DHtfZZTcg6
 RxOsvioaIUUdVvpS5dp7/DspbZRwt4/Wc3MLMutz6IXREiKrsha86nC+1Bn1kedXvK
 H9gh88Mwc38Dg==
Message-ID: <c9e42b81-f0b4-05a7-03db-786fa7d38135@denx.de>
Date: Wed, 2 Aug 2023 19:25:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH 2/2] drm/bridge: lt9611: Do not generate HFP/HBP/HSA and
 EOT packet
To: neil.armstrong@linaro.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Amit Pundir <amit.pundir@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
 <64c3352f-c2aa-5260-c6ff-4a607ce219a2@quicinc.com>
 <f768950b-0406-1f03-86a5-50d5794bb060@denx.de>
 <51d782c4-3539-c3d3-6844-d6b9a39c09eb@linaro.org>
 <88a49ed7-8132-3212-1f7a-9378eb640d68@denx.de>
 <d4b778f6-35b6-fc1b-014d-eaa9b3b900a4@linaro.org>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <d4b778f6-35b6-fc1b-014d-eaa9b3b900a4@linaro.org>
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

On 8/2/23 15:08, neil.armstrong@linaro.org wrote:
> Hi Marek,
> 
> On 02/08/2023 14:25, Marek Vasut wrote:
>> On 8/2/23 10:39, neil.armstrong@linaro.org wrote:
>>> Hi Marek,
>>
>> Hi,
>>
>>> On 13/07/2023 20:28, Marek Vasut wrote:
>>>
>>> <snip>
>>>
>>>>>>
>>>>>> MIPI_DSI_MODE_VIDEO_NO_HFP means the HBP period is just skipped by 
>>>>>> DSIM.
>>>>>>
>>>>>> Maybe there is a need for new set of flags which differentiate 
>>>>>> between HBP skipped (i.e. NO HBP) and HBP LP11 ?
>>>>>>
>>>>>
>>>>> No, the section of the MIPI DSI spec I posted below clearly states 
>>>>> there are two options:
>>>>>
>>>>> 1) send blanking packets during those periods
>>>>> 2) transition to LP11 during those periods
>>>>>
>>>>> There is no 3rd option in the spec of not doing both like what you 
>>>>> are suggesting. So DSIM should also be only transitioning to LP11 
>>>>> during those periods if its not sending the blanking packets with 
>>>>> those flags set.
>>>>>
>>>>> So, there is no need for any new set of flags to differentiate.
>>>>>
>>>>> The flags and their interpretation is correct in MSM driver. I 
>>>>> cannot comment on what exactly DSIM does with those flags.
>>>>
>>>> How do you explain the comment in include/drm/drm_mipi_dsi.h:
>>>>
>>>> 128 /* disable hback-porch area */
>>>> 129 #define MIPI_DSI_MODE_VIDEO_NO_HBP      BIT(6)
>>>
>>> Can you specify how you determined those flags were needed on DSIM ? 
>>> a vendor tree ? a datasheet ?
>>
>> The following upstream commit:
>>
>> 996e1defca344 ("drm: exynos: dsi: Fix MIPI_DSI*_NO_* mode flags")
>>
>>> In the meantime, we should revert this patch because it regresses 
>>> some Qcom
>>> based platforms until we figure out what's missing to make DSIM based 
>>> boards
>>> happy.
>>>
>>> I'll send a revert change afterwards.
>>
>> That change would break existing use case on i.MX8M then, I disagree 
>> with that revert.
> 
> As I understand the timeline is :
> 
> - 996e1defca344 was merged in v6.2-rc2 and caused regression on NXP 
> platforms
> 
> - 8ddce13ae696 was merged in v6.5-rc1 to fix that but caused regression 
> on QCOM platforms
> 
> Did I miss something ?

That looks about right.

> I don't know how to handle this apart reverting 8ddce13ae696 and trying 
> to find a proper fix that doesn't regress QCOM.

I provided a suggestion above -- I believe QCOM is misinterpreting the 
NO_H* flags and it needs separate flags for its behavior. The NXP 
hardware per MX8M{M,N,P} reference manual (which is available at 
NXP.com) skips the H* areas in the transfer, which matches the flags 
description:

include/drm/drm_mipi_dsi.h-/* disable hback-porch area */
include/drm/drm_mipi_dsi.h:#define MIPI_DSI_MODE_VIDEO_NO_HBP   BIT(6)

If the QCOM hardware does something else, it should introduce its own 
set of flags for that something else and that would be problem solved, 
for both platforms.

I don't have access to the QCOM hardware or datasheet however, is either 
available ?

> So, The main issue is around the real meaning of the 
> IPI_DSI_MODE_VIDEO_NO_* flags,
> Exynos DRM removed the HSA, HBP and HFP packets, Qcom DSI moves the DSI 
> lanes
> state to LP-11 during the period.
> 
> The behavior is significantly different and the naming doesn't suggest any
> correct behavior.
> 
> The only solution is to find out why :
> - On Qcom platforms, having the HSA, HBP and HFP periods is OK, but not 
> on DSIM
> - On DSIM, removing the HSA, HBP and HFP periods is fine
> - What's the exact requirement of the lt9611 bridge concerning those 
> periods

See above.
