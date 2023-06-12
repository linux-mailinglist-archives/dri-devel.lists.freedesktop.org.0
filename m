Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9598172CE28
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 20:30:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F5ED10E22A;
	Mon, 12 Jun 2023 18:30:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6173310E2CC
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 18:30:09 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2b203360d93so56621561fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 11:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686594607; x=1689186607;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=86ugo32DRfKDcuMrDG0yQ43XUYb0oQVlSxJDfDAPaVg=;
 b=dKoteqlNv9+E30xypMf0WlSywBagA+fPeLhvu2Fwd4e7n1wieMST4o4+Ozdl8lNxF3
 ZMTMCH3HagCdQ6OhGn3PUMxABYNBP5508IgD/EWwXfUuEnyCJe+MVhSccbj2TpWPJyJ/
 R+kwu6JVoopOxT3LMWS7RbvXphKyQ2eAUWRUXEnZ6kNraY80ffrzXv2dc/1Fv4N2Fy6T
 82wQc6Fa/QWvESYq43VLgwBDOuFduNnh4ZcUQAukv9xS0KRr07PKiFMQwWUXcpQfE9bD
 EEBAg5cuZaCHXRnZQXQnkhg8QQ5Tyq0TnfyYnGSdq0tFs+PCCXm7ahVsdhPR95S+K4ez
 gQTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686594607; x=1689186607;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=86ugo32DRfKDcuMrDG0yQ43XUYb0oQVlSxJDfDAPaVg=;
 b=WBY01e2ok6ckJ52MPBsfgZUdQlrjsflLGJQkaRB9DyTA/JH/1U4+MfibxGbR+bBhpc
 qplhfIgu2qBoaU2XN8JJ0dDA6mLXD+ffgKS5atkUQ6Tv59rTYNdFqCOdPTcWSUlWHnK8
 QnGuXRzgwdCgraLMKplnI1R5+HU3834rfn4Hr0M6A5w1fiLGHrSeholKgdBWoJHXvfPv
 j4utyMPG8Yh7EsQrOoiJFWjzzew3AQV3Ns/bBeTA3Hdb1dl0yhhMocd9kALOCWfg/Dbw
 d2U65Nwmg4JWiTqiJLOaS8Q5A58Sny+ZPvLXqjO2N9Dvo+f5w+3/45XBGS818GEaIO9k
 QK2Q==
X-Gm-Message-State: AC+VfDyqHZAGX2bbiFCrJoQidQ8etWuPey3ux6d103LxHSiDS5fRFdHx
 ixz2/K+JgU9a6saItNTiJBGA7A==
X-Google-Smtp-Source: ACHHUZ6X9nloN3ygOvB6chpZTre6E0HKZJ17Z6MMO57ovWo5jJeV9l7k/AX8bvH4CTKcSrSzc9+hkw==
X-Received: by 2002:a05:651c:1023:b0:2ad:dd7e:6651 with SMTP id
 w3-20020a05651c102300b002addd7e6651mr3634093ljm.43.1686594606728; 
 Mon, 12 Jun 2023 11:30:06 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 f9-20020a2e9509000000b002b32d4a59d5sm530954ljh.117.2023.06.12.11.30.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jun 2023 11:30:06 -0700 (PDT)
Message-ID: <a8b72f2a-d5b2-723e-405a-e7c304ddeed4@linaro.org>
Date: Mon, 12 Jun 2023 21:30:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/2] drm/msm/dsi: don't allow enabling 7nm VCO with
 unprogrammed rate
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230612031616.3620134-1-dmitry.baryshkov@linaro.org>
 <20230612031616.3620134-2-dmitry.baryshkov@linaro.org>
 <g4ogg7ecraduqbvcxsost2lm26fr6rswdm4tgba5ae23b5jjvg@6mzv2u7bmw7u>
 <yyjkikzxsggwlnxcexho62zkapw5xrkogvoclsu6af7t5xcp3a@jdssfb3hz7px>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <yyjkikzxsggwlnxcexho62zkapw5xrkogvoclsu6af7t5xcp3a@jdssfb3hz7px>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: freedreno@lists.freedesktop.org, Degdag Mohamed <degdagmohamed@gmail.com>,
 Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/06/2023 12:21, Marijn Suijten wrote:
> On 2023-06-12 11:15:53, Marijn Suijten wrote:
>> On 2023-06-12 06:16:16, Dmitry Baryshkov wrote:
>>> CCF can try enabling VCO before the rate has been programmed. This can
>>> cause clock lockups and/or other boot issues. Program the VCO to the
>>> minimal PLL rate if the read rate is 0 Hz.
>>>
>>> Reported-by: Degdag Mohamed <degdagmohamed@gmail.com>
>>> Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>
>> This unfortunately regresses my Xperia 5 (sofef01 panel driver that's
>> on the lists) to now run at 30~33Hz instead of 60Hz.  I can provide
>> debugging and clk trees later, if needed.
> 
> I'll also retest the Xperia 1 with this, which has a 4k DSC panel.
> 
> Is this intended to get rid of:
> 
>      msm_dsi_phy ae94400.phy: [drm:dsi_pll_7nm_vco_prepare] *ERROR* DSI PLL(0) lock failed, status=0x00000000: -110
>      PLL(0) lock failed
> 
> ... at startup (and relevant rcg2 update_config failures, unbalanced
> disables etc)?  It locks after a couple tries but it's still
> unnecessarily spammy.

Yes.

> 
> - Marijn
> 
>>
>> - Marijn
>>
>>> ---
>>>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 5 +++++
>>>   1 file changed, 5 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>>> index 3b1ed02f644d..6979d35eb7c3 100644
>>> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>>> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>>> @@ -395,11 +395,16 @@ static void dsi_pll_phy_dig_reset(struct dsi_pll_7nm *pll)
>>>   	wmb(); /* Ensure that the reset is deasserted */
>>>   }
>>>   
>>> +static unsigned long dsi_pll_7nm_vco_recalc_rate(struct clk_hw *hw,
>>> +						  unsigned long parent_rate);
>>>   static int dsi_pll_7nm_vco_prepare(struct clk_hw *hw)
>>>   {
>>>   	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(hw);
>>>   	int rc;
>>>   
>>> +	if (dsi_pll_7nm_vco_recalc_rate(hw, VCO_REF_CLK_RATE) == 0)
>>> +		dsi_pll_7nm_vco_set_rate(hw, pll_7nm->phy->cfg->min_pll_rate, VCO_REF_CLK_RATE);
>>> +
>>>   	dsi_pll_enable_pll_bias(pll_7nm);
>>>   	if (pll_7nm->slave)
>>>   		dsi_pll_enable_pll_bias(pll_7nm->slave);
>>> -- 
>>> 2.39.2
>>>

-- 
With best wishes
Dmitry

