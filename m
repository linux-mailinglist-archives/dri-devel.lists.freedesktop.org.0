Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFA276CC98
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 14:25:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB82E10E0C4;
	Wed,  2 Aug 2023 12:25:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 501AC10E0B5;
 Wed,  2 Aug 2023 12:25:25 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 4F8BE86839;
 Wed,  2 Aug 2023 14:25:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1690979123;
 bh=lG/SL2bAOZTbz6YJmrIJViDYuRVyF1NDlcj3sZIb0iM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hnE8WtIASiyatRx+LvqTvUNOLL0QRQW2sNai260TIls9FJC9uTMxxc08WUm/H/doT
 uszoDbblktLiWpcTFRUPrQfU5/ih7QivweZQx3cu+LFurZ2AOXVl4gVVV+rjgQUJ0B
 O/p3rGExvUB9ImkX+0QYglUzNjpPTtjQSdKSTI8SBqwL90A4n7/mb/NK2o/K7dukzg
 NLy+Ql/C7mJJJ4jgI8KyudSirFx+NraolBxLKS099Lph682K3BhRqEoc3Ddrh7dCaD
 c6zk9QT8OiRDbVvTtHAp0Kwt98PVDXNb5pIDe9novcx4mpUba+HYFsXJhKPsVQylyf
 2FGGdDn34uITQ==
Message-ID: <88a49ed7-8132-3212-1f7a-9378eb640d68@denx.de>
Date: Wed, 2 Aug 2023 14:25:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH 2/2] drm/bridge: lt9611: Do not generate HFP/HBP/HSA and
 EOT packet
Content-Language: en-US
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
From: Marek Vasut <marex@denx.de>
In-Reply-To: <51d782c4-3539-c3d3-6844-d6b9a39c09eb@linaro.org>
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

On 8/2/23 10:39, neil.armstrong@linaro.org wrote:
> Hi Marek,

Hi,

> On 13/07/2023 20:28, Marek Vasut wrote:
> 
> <snip>
> 
>>>>
>>>> MIPI_DSI_MODE_VIDEO_NO_HFP means the HBP period is just skipped by 
>>>> DSIM.
>>>>
>>>> Maybe there is a need for new set of flags which differentiate 
>>>> between HBP skipped (i.e. NO HBP) and HBP LP11 ?
>>>>
>>>
>>> No, the section of the MIPI DSI spec I posted below clearly states 
>>> there are two options:
>>>
>>> 1) send blanking packets during those periods
>>> 2) transition to LP11 during those periods
>>>
>>> There is no 3rd option in the spec of not doing both like what you 
>>> are suggesting. So DSIM should also be only transitioning to LP11 
>>> during those periods if its not sending the blanking packets with 
>>> those flags set.
>>>
>>> So, there is no need for any new set of flags to differentiate.
>>>
>>> The flags and their interpretation is correct in MSM driver. I cannot 
>>> comment on what exactly DSIM does with those flags.
>>
>> How do you explain the comment in include/drm/drm_mipi_dsi.h:
>>
>> 128 /* disable hback-porch area */
>> 129 #define MIPI_DSI_MODE_VIDEO_NO_HBP      BIT(6)
> 
> Can you specify how you determined those flags were needed on DSIM ? a 
> vendor tree ? a datasheet ?

The following upstream commit:

996e1defca344 ("drm: exynos: dsi: Fix MIPI_DSI*_NO_* mode flags")

> In the meantime, we should revert this patch because it regresses some Qcom
> based platforms until we figure out what's missing to make DSIM based 
> boards
> happy.
> 
> I'll send a revert change afterwards.

That change would break existing use case on i.MX8M then, I disagree 
with that revert.
