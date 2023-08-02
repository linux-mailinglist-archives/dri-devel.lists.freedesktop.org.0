Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFEC76C87B
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 10:40:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07DC010E526;
	Wed,  2 Aug 2023 08:39:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E72C10E522
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 08:39:55 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3128fcd58f3so6642396f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Aug 2023 01:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690965593; x=1691570393;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=WRAP0HWhn6g/kOzKMWD911kOSk1jcneyHwYZl0WYjRQ=;
 b=zjxvc+i/DMwy1ldffwestytA9zQ9YS0gCIeUp8PCaYqnMRm0KdoXXjQaiLjlmVNd4R
 V9MlqPOtLLrS5A8JldTm24Y4SUL3Q/fbST66sPcPKUa7FlLcnbHIstHpy1qKRAfzEIcH
 lWzUqvT4+c3diBNyjapbUqGjGLy+6J+B4XAysz/sviUq2oKPjjVzspVzhN5fkrsPO7S/
 gsrNFKoV3BUklHuINdw0XifiiigWRFl+oINrXKVd1P9v3qESnDUt8MmAsmnBiOBMPhA8
 tTG1VSsi4f5KTXhU1Jd22P/IB1ra3DG+yYW/39m6Ue2zFdFV8+PUgo8hjAnBqUjLIOCV
 LNIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690965593; x=1691570393;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WRAP0HWhn6g/kOzKMWD911kOSk1jcneyHwYZl0WYjRQ=;
 b=h0j7+QcKJAxMlI44b2eVarXOyxU122haA3tr/nNG5Eh0hmTFEnPJxCGO9Fi/iu1duK
 CY3UgMl24CiDNCiFymV1Ed6YxubVklpPBodogcG+3oXt1wnZTkaY+Qb0YtFIx3Y8jn4k
 LyAMS2Peb4kOi8HYvPQOw09l7a9pmvzi4ktGbHsgYUjzzqGBc9QllJdawB85CVbHmwBr
 uu9EC8miRGSjsW39Bwt5IdZRzmN2ah4mocCfg5SsmfJCJCULtOi+3wqG33BVmYZ3g3P2
 K4YEjwAoBKoA5mLBlK8ekH9aJChVhrsL2ip/0t7RGYZBf27ARAh01u8yaLra/+Pze3AQ
 ki2w==
X-Gm-Message-State: ABy/qLbYKQhyrZw7+Vk94Mw2L3AsWNspwhwap8bRv1MYtQRw+kSKe0O5
 XeLwX/LvtKkujezqkrE7XnYx0A==
X-Google-Smtp-Source: APBJJlGt/JMMR519d7Jukm0qKi7EMlBz8mwUobaLaXQQYxBaB55wp9ApOuo9C23hQVRgAF3YcFVuYA==
X-Received: by 2002:a5d:4e0a:0:b0:317:5747:b955 with SMTP id
 p10-20020a5d4e0a000000b003175747b955mr4465403wrt.17.1690965593557; 
 Wed, 02 Aug 2023 01:39:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:c5bb:5b4:61e3:d196?
 ([2a01:e0a:982:cbb0:c5bb:5b4:61e3:d196])
 by smtp.gmail.com with ESMTPSA id
 r18-20020adfce92000000b0031272fced4dsm18264016wrn.52.2023.08.02.01.39.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Aug 2023 01:39:52 -0700 (PDT)
Message-ID: <51d782c4-3539-c3d3-6844-d6b9a39c09eb@linaro.org>
Date: Wed, 2 Aug 2023 10:39:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/2] drm/bridge: lt9611: Do not generate HFP/HBP/HSA and
 EOT packet
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
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
Organization: Linaro Developer Services
In-Reply-To: <f768950b-0406-1f03-86a5-50d5794bb060@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Reply-To: neil.armstrong@linaro.org
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

Hi Marek,

On 13/07/2023 20:28, Marek Vasut wrote:

<snip>

>>>
>>> MIPI_DSI_MODE_VIDEO_NO_HFP means the HBP period is just skipped by DSIM.
>>>
>>> Maybe there is a need for new set of flags which differentiate between HBP skipped (i.e. NO HBP) and HBP LP11 ?
>>>
>>
>> No, the section of the MIPI DSI spec I posted below clearly states there are two options:
>>
>> 1) send blanking packets during those periods
>> 2) transition to LP11 during those periods
>>
>> There is no 3rd option in the spec of not doing both like what you are suggesting. So DSIM should also be only transitioning to LP11 during those periods if its not sending the blanking packets with those flags set.
>>
>> So, there is no need for any new set of flags to differentiate.
>>
>> The flags and their interpretation is correct in MSM driver. I cannot comment on what exactly DSIM does with those flags.
> 
> How do you explain the comment in include/drm/drm_mipi_dsi.h:
> 
> 128 /* disable hback-porch area */
> 129 #define MIPI_DSI_MODE_VIDEO_NO_HBP      BIT(6)

Can you specify how you determined those flags were needed on DSIM ? a vendor tree ? a datasheet ?

In the meantime, we should revert this patch because it regresses some Qcom
based platforms until we figure out what's missing to make DSIM based boards
happy.

I'll send a revert change afterwards.

Neil

> 
> Esp. the "disable" part. That to me reads as "don't send HBP packet".
> 
> Where do you see that quote above in the DSI spec (which chapter and which version do you read) ?
> 
>>>> It should be replacing those periods with LP11 too.
>>>>
>>>> The traffic mode being used on this bridge is MIPI_DSI_MODE_VIDEO_SYNC_PULSE which is "Non-Burst Mode with Sync Pulses".
>>>>
>>>> As per this traffic mode in the DSI spec,
>>>>
>>>> "Normally, periods shown as HSA (Horizontal Sync Active), HBP (Horizontal Back Porch) and HFP (Horizontal Front Porch) are filled by Blanking Packets, with lengths (including packet overhead) calculated to match the period specified by the peripheral’s data sheet. Alternatively, if there is sufficient time to transition from HS to LP mode and back again, a timed interval in LP mode may substitute for a Blanking Packet, thus saving power. During HSA, HBP and HFP periods, the bus should stay in the LP-11 state."
>>>>
>>>> So we can either send the blanking packets or transition to LP state and those 3 flags are controlling exactly that during those periods for MSM driver.
>>>>
>>>> If you stop sending the blanking packets, you need to replace that gap with LP.
>>>
>>> I don't think that's what MIPI_DSI_MODE_VIDEO_NO_HBP means, the way I understand MIPI_DSI_MODE_VIDEO_NO_HBP is that it skips the HBP completely. So if you want HBP, then do not set MIPI_DSI_MODE_VIDEO_NO_HBP . And if you want LP11 during HBP, that is I think up to the controller (or maybe another new flag?).
>>>
>>
>> No, there is no need of another new flag. There are only two options as per the spec.
>>
>> In fact, as per my checking with more folks, requiring LP11 during those periods is something very rare.
>>
>> Because usually horizontal period is usually a very short period, most of the time we do not use the LP11 option and send the blanking packets instead.
>>
>> So its something very unusual for DSIM.
>>
>> That being said, I still think my previous question is important.
>>
>> 1) What is the difference between the resolution you are trying Vs what Amit is trying?
>>
>> 2) Are you both using just standard HDMI monitors?
> 
> What is a "standard HDMI monitor" ?
> I use DELL U2713HM .
> 
> [...]

