Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1708F74AD4D
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 10:47:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 110EB10E53B;
	Fri,  7 Jul 2023 08:47:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86F3210E53D
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 08:47:47 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3113da5260dso1528004f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 01:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688719665; x=1691311665;
 h=content-transfer-encoding:in-reply-to:subject:organization
 :references:cc:to:from:content-language:reply-to:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=7eZbe/XyoM1kx0exxSQOZIhc5pgYclThKrh6yiXDKVs=;
 b=JpxiyQZfXHpfnSz2OkQwyysBeqSToeUcE5I1dQey2GhYdB/qzxFuVHITg0q1QNr9uY
 h1FNzGyVaUI7hgh6UANdjLxrQFDgLwVl9bwJFDLXFgJY3YkYclAVhHo645qFo/Uup5+h
 jR8BuLUBohkPAMxbRsjY5+W+3MBsefXtVlnbMgEsRBRsdUCPucSxKbnYD05UgxCJuNQr
 Wlq0EYi+Cv2rk3cvwwbPJdrsF0ZCueN2GyzkoLUdnohbBLbbj4hOGnWYiwZnwBGIdmw5
 KebUqpMCtG3d7uEKL71+XaaNjjXMNH7JW3AsrEoag1aiCQG5QpG9qJMP1ik+k+7ffxZP
 6RwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688719665; x=1691311665;
 h=content-transfer-encoding:in-reply-to:subject:organization
 :references:cc:to:from:content-language:reply-to:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=7eZbe/XyoM1kx0exxSQOZIhc5pgYclThKrh6yiXDKVs=;
 b=jhiNmI5J/OELVf8su+plB4SMwTI2ozcOu0Unxj1LtTyvCRa4yeq6iQAR9u7A5UMl9e
 xsCJ7NFVPLuBNXWX3WUQ2y/r9RXoTh2QQ1isDIary2VeO7/gJuIcCyTpKpigPvTeZ7OB
 0weepeEPSCAvAQGtKHwFdwe24ys98xTBXvGZUVF4MIFeQJ2RS11YxXyUVLccOVZHp7dM
 xsy0oMCOGW33nHMkSCKsSodq/7ci/pM8hSRuPlY6u99N67kccJ2mDpavjggCW5qaExpx
 1biKE2C5llVYaeGj5sWlqh5hAHeSj/jz8corT42MFiQfAz7ZN5dKE02KJSKEts9ihn3H
 NE7A==
X-Gm-Message-State: ABy/qLaGUH1M7HphGGkTw9XvWTduH05j4cmmgM2tOLbNNDOPt5EsyuPF
 p2WY1x+adUlgSuN0NpXFFvElNA==
X-Google-Smtp-Source: APBJJlEtOj6EMYjuXm8EaEQe72h1l3M6Ieut1MxpZlsLXb7PRlZSOA4stAdW7sy0f6e/MoaRMHIIQA==
X-Received: by 2002:adf:e0d0:0:b0:313:f463:9d40 with SMTP id
 m16-20020adfe0d0000000b00313f4639d40mr3544981wri.65.1688719665553; 
 Fri, 07 Jul 2023 01:47:45 -0700 (PDT)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
 by smtp.gmail.com with ESMTPSA id
 i8-20020a5d5588000000b0030fa3567541sm3876641wrv.48.2023.07.07.01.47.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jul 2023 01:47:45 -0700 (PDT)
Message-ID: <d28b0090-bd1e-6737-d92b-348dc6c30750@linaro.org>
Date: Fri, 7 Jul 2023 10:47:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Amit Pundir <amit.pundir@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230403221233.500485-1-marex@denx.de>
 <20230403221233.500485-2-marex@denx.de>
 <CAMi1Hd0TD=2z_=bcDrht3H_wiLvAFcv8Z-U_r_KUOoeMc6UMjw@mail.gmail.com>
 <CAMty3ZBNFu=f-FS4YFN4wfmiTuk=48nna-vub1eMYwidDt+msg@mail.gmail.com>
 <CAA8EJppbdiUz5m+9EAPnFb916DaS_VKWd30c7_EPWjuid8rtqQ@mail.gmail.com>
 <CAMi1Hd2G5PJmz4wpO1wbdqKd0FA8LBgvRDv2u5ZYAMb5s6Kt0A@mail.gmail.com>
 <d5fb8106-b8f3-0acf-1267-d4d6d0860e25@linaro.org>
Organization: Linaro Developer Services
Subject: Re: [PATCH 2/2] drm/bridge: lt9611: Do not generate HFP/HBP/HSA and
 EOT packet
In-Reply-To: <d5fb8106-b8f3-0acf-1267-d4d6d0860e25@linaro.org>
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

On 07/07/2023 09:18, Neil Armstrong wrote:
> Hi,
> 
> On 06/07/2023 11:20, Amit Pundir wrote:
>> On Wed, 5 Jul 2023 at 11:09, Dmitry Baryshkov
>> <dmitry.baryshkov@linaro.org> wrote:
>>>
>>> [Adding freedreno@ to cc list]
>>>
>>> On Wed, 5 Jul 2023 at 08:31, Jagan Teki <jagan@amarulasolutions.com> wrote:
>>>>
>>>> Hi Amit,
>>>>
>>>> On Wed, Jul 5, 2023 at 10:15 AM Amit Pundir <amit.pundir@linaro.org> wrote:
>>>>>
>>>>> Hi Marek,
>>>>>
>>>>> On Wed, 5 Jul 2023 at 01:48, Marek Vasut <marex@denx.de> wrote:
>>>>>>
>>>>>> Do not generate the HS front and back porch gaps, the HSA gap and
>>>>>> EOT packet, as these packets are not required. This makes the bridge
>>>>>> work with Samsung DSIM on i.MX8MM and i.MX8MP.
>>>>>
>>>>> This patch broke display on Dragonboard 845c (SDM845) devboard running
>>>>> AOSP. This is what I see
>>>>> https://people.linaro.org/~amit.pundir/db845c-userdebug/v6.5-broken-display/PXL_20230704_150156326.jpg.
>>>>> Reverting this patch fixes this regression for me.
>>>>
>>>> Might be msm dsi host require proper handling on these updated
>>>> mode_flags? did they?
>>>
>>> The msm DSI host supports those flags. Also, I'd like to point out
>>> that the patch didn't change the rest of the driver code. So even if
>>> drm/msm ignored some of the flags, it should not have caused the
>>> issue. Most likely the issue is on the lt9611 side. I's suspect that
>>> additional programming is required to make it work with these flags.
>>
>> I spent some time today on smoke testing these flags (individually and
>> in limited combination) on DB845c, to narrow down this breakage to one
>> or more flag(s) triggering it. Here are my observations in limited
>> testing done so far.
>>
>> There is no regression with MIPI_DSI_MODE_NO_EOT_PACKET when enabled
>> alone and system boots to UI as usual.
>>
>> MIPI_DSI_MODE_VIDEO_NO_HFP always trigger the broken display as in the
>> screenshot[1] shared earlier as well.
>>
>> Adding either of MIPI_DSI_MODE_VIDEO_NO_HSA and
>> MIPI_DSI_MODE_VIDEO_NO_HBP always result in no display, unless paired
>> with MIPI_DSI_MODE_VIDEO_NO_HFP and in that case we get the broken
>> display as reported.
>>
>> In short other than MIPI_DSI_MODE_NO_EOT_PACKET flag, all other flags
>> added in this commit break the display on DB845c one way or another.
> 
> I think the investigation would be to understand why samsung-dsim requires
> such flags and/or what are the difference in behavior between MSM DSI and samsung DSIM
> for those flags ?
> 
> If someone has access to the lt9611 datasheet, so it requires HSA/HFP/HBP to be
> skipped ? and does MSM DSI and samsung DSIM skip them in the same way ?

I think there's a mismatch, where on one side this flags sets the link in LP-11 while
in HSA/HFP/HPB while on the other it completely removes those blanking packets.

The name MIPI_DSI_MODE_VIDEO_NO_HBP suggests removal of HPB, not LP-11 while HPB.
the registers used in both controllers are different:
- samsung-dsim: DSIM_HBP_DISABLE_MODE
- msm dsi: DSI_VID_CFG0_HBP_POWER_STOP

The first one suggest removing the packet, while the second one suggests powering
off the line while in the blanking packet period.

@Abhinav, can you comment on that ?

@Jagan, Andrezej So you have any documentation on what DSIM_xxx_DISABLE_MODE does ?

@Dmitry, so you have access to the lt9611 datasheet to know what's needed here ?

Neil

> 
> Neil
> 
>>
>> Regards,
>> Amit Pundir
>> [1] https://people.linaro.org/~amit.pundir/db845c-userdebug/v6.5-broken-display/PXL_20230704_150156326.jpg
>>
>>>
>>> -- 
>>> With best wishes
>>> Dmitry
> 

