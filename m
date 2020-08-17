Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2D8247FCB
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 09:50:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D57889C6C;
	Tue, 18 Aug 2020 07:50:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C075889E2A
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 20:32:42 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id k13so9063578lfo.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 13:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7UUf0GtAjcXwxOClmWoxhw8w0tZ2fKlaVkQ/G18ibVU=;
 b=iH7PhF6apID8HfRTQnm3TdWrTVotIcsjPuMHYU94rvbYK1XlWosHk5t9pMpmA1/1/z
 fsKRmhHp8CZXk0QMciJmQggvYwNDrbIb7uH6HEhWqjWs0tQCg6CXKnTSNhOhGPSLlrwI
 TYiagBbt8DNdYYgzHYPoFGtEoOrvl6yXoClkDfehLC1p6auV8GaFy8dYm35GdRXPEUTo
 0o358WxmOte7Topcgo8aiRo5mjOxwUX1/WO26sPEqxAw/zRNCHJ1JoMFFFWhls0Bms7h
 Izs3xpbSArKjRVI5yhwWvGAh8MI9xC3S0xMtJD+WQ2oPcLJsTiqoZQYoaabA6ZwuwTFh
 NcYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7UUf0GtAjcXwxOClmWoxhw8w0tZ2fKlaVkQ/G18ibVU=;
 b=dnZKTZGdLL5NRBifxk9UGwLCey1Llz8SZjWWBw73evcGchYhOv3OvtriytPMDbmukm
 b2tHzfBcYBAZn/Oeo2ZAH99izxeJoE5t/DtR/559STverpAChL7Dj0dv2wr3FrDzdxXt
 G5D5LIUhFWOnUKho6q96mNCBFQpvdQbts62rVJSgY2JeLJRlkVios1SOn5vz4/i3V1db
 yWzAs3goVBFAPH0MTP+7dhLyCfxQz4mbBc1FA7JXU21iDTzbwG1OWYfa1TIeyM2iEImE
 41z23fuHsVtBqN3XAQ/1+NfRx2qeUek3Kf+jr4brztcvhGzOWRis25iGEh9nr8cOsbP8
 E5QA==
X-Gm-Message-State: AOAM531K3M2f1/lz8zcGDP0rTqT28beRpeMRLT5PXKBuv+ec5lj/jwYG
 W+WBLgXB+QC8Sai56U9Rg0H7Rg==
X-Google-Smtp-Source: ABdhPJwEGamNpOT3Eoy9QL+rlpLKGVgC7rS5VILfXtBOezTtOyz1RLer7bdp602XAU66grZpU0Dp8w==
X-Received: by 2002:a19:803:: with SMTP id 3mr8181127lfi.15.1597696360059;
 Mon, 17 Aug 2020 13:32:40 -0700 (PDT)
Received: from [192.168.1.211] ([188.162.65.254])
 by smtp.gmail.com with ESMTPSA id p1sm5278763lji.93.2020.08.17.13.32.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2020 13:32:39 -0700 (PDT)
Subject: Re: [Freedreno] [PATCH v10 3/5] drm/msm/dp: add support for DP PLL
 driver
To: Rob Clark <robdclark@gmail.com>, Jonathan Marek <jonathan@marek.ca>
References: <20200812044223.19279-1-tanmay@codeaurora.org>
 <20200812044223.19279-4-tanmay@codeaurora.org>
 <821b5cf9-5ca0-7026-fd99-9a32285ed030@linaro.org>
 <CAF6AEGtcfXodN1_HSdTcH402FdwTk15Nt6p3F=QYeSRhTc+hqw@mail.gmail.com>
 <1ea81fa2-1dc8-a0b9-aa32-3127e9354be2@marek.ca>
 <CAF6AEGt+NV-T7Qo_-gLM981QBWy3865Vbj518sd-4XQJccX_WA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <d67ffcd6-b10c-92a4-55a7-40521b3be68f@linaro.org>
Date: Mon, 17 Aug 2020 23:32:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAF6AEGt+NV-T7Qo_-gLM981QBWy3865Vbj518sd-4XQJccX_WA@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 18 Aug 2020 07:50:42 +0000
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Tanmay Shah <tanmay@codeaurora.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, khsieh@codeaurora.org,
 Sean Paul <seanpaul@chromium.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Vara Reddy <varar@codeaurora.org>, aravindh@codeaurora.org,
 freedreno <freedreno@lists.freedesktop.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/08/2020 01:45, Rob Clark wrote:
> On Sat, Aug 15, 2020 at 2:21 PM Jonathan Marek <jonathan@marek.ca> wrote:
>>
>> On 8/15/20 4:20 PM, Rob Clark wrote:
>>> On Fri, Aug 14, 2020 at 10:05 AM Dmitry Baryshkov
>>> <dmitry.baryshkov@linaro.org> wrote:
>>>>
>>>>
>>>> On 12/08/2020 07:42, Tanmay Shah wrote:
>>>>    > From: Chandan Uddaraju <chandanu@codeaurora.org>
>>>>    >
>>>>    > Add the needed DP PLL specific files to support
>>>>    > display port interface on msm targets.
>>>>
>>>> [skipped]
>>>>
>>>>    > diff --git a/drivers/gpu/drm/msm/dp/dp_pll_private.h
>>>> b/drivers/gpu/drm/msm/dp/dp_pll_private.h
>>>>    > new file mode 100644
>>>>    > index 000000000000..475ba6ed59ab
>>>>    > --- /dev/null
>>>>    > +++ b/drivers/gpu/drm/msm/dp/dp_pll_private.h
>>>>    > @@ -0,0 +1,98 @@
>>>>    > +/* SPDX-License-Identifier: GPL-2.0-only */
>>>>    > +/*
>>>>    > + * Copyright (c) 2016-2020, The Linux Foundation. All rights reserved.
>>>>    > + */
>>>>    > +
>>>>    > +#ifndef __DP_PLL_10NM_H
>>>>    > +#define __DP_PLL_10NM_H
>>>>    > +
>>>>    > +#include "dp_pll.h"
>>>>    > +#include "dp_reg.h"
>>>>    > +
>>>>    > +#define DP_VCO_HSCLK_RATE_1620MHZDIV1000    1620000UL
>>>>    > +#define DP_VCO_HSCLK_RATE_2700MHZDIV1000    2700000UL
>>>>    > +#define DP_VCO_HSCLK_RATE_5400MHZDIV1000    5400000UL
>>>>    > +#define DP_VCO_HSCLK_RATE_8100MHZDIV1000    8100000UL
>>>>    > +
>>>>    > +#define NUM_DP_CLOCKS_MAX            6
>>>>    > +
>>>>    > +#define DP_PHY_PLL_POLL_SLEEP_US        500
>>>>    > +#define DP_PHY_PLL_POLL_TIMEOUT_US        10000
>>>>    > +
>>>>    > +#define DP_VCO_RATE_8100MHZDIV1000        8100000UL
>>>>    > +#define DP_VCO_RATE_9720MHZDIV1000        9720000UL
>>>>    > +#define DP_VCO_RATE_10800MHZDIV1000        10800000UL
>>>>    > +
>>>>    > +struct dp_pll_vco_clk {
>>>>    > +    struct clk_hw hw;
>>>>    > +    unsigned long    rate;        /* current vco rate */
>>>>    > +    u64        min_rate;    /* min vco rate */
>>>>    > +    u64        max_rate;    /* max vco rate */
>>>>    > +    void        *priv;
>>>>    > +};
>>>>    > +
>>>>    > +struct dp_pll_db {
>>>>
>>>> This struct should probably go into dp_pll_10nm.c. dp_pll_7nm.c, for
>>>> example, will use slightly different structure.
>>>
>>> Note that sboyd has a WIP series to move all of the pll code out to a
>>> phy driver.  If there is work already happening on 7nm support, it
>>> might be better to go with the separate phy driver approach?  I'm
>>> still a bit undecided about whether to land the dp code initially with
>>> the pll stuff in drm, and then continue refactoring to move to
>>> separate phy driver upstream, or to strip out the pll code from the
>>> beginning.  If you/someone is working on 7nm support, then feedback
>>> about which approach is easier is welcome.
>>>
>>> https://lore.kernel.org/dri-devel/20200611091919.108018-1-swboyd@chromium.org/
>>>
>>
>> I have a sm8150/sm8250 (7nm) upstream kernel stack with DP enabled, and
>> I have done something similar, with the PLL driver in the QMP phy,
>> although not based on sboyd's series (along with some typec changes to
>> negotiate the DP alt mode and get HPD events, etc.). I don't think
>> having PLL in drm/msm makes sense, the drm/msm DP driver shouldn't need
>> to be aware of the DP PLL/PHY driver, it only needs to set the
>> link/pixel clock rates which are in dispcc (and those then have the PLL
>> clocks as a parent).
> 
> yeah, in the dp case, having phy split out makes a ton of sense.. it
> would maybe be a nice cleanup in other cases (dsi, hdmi) but the
> combination of usb+dp makes burying this in drm not so great..
> 
> It would be good if you could work w/ sboyd on this.. based on what
> I've seen on previous gens, it is probably a different phy driver for
> 7nm vs 10nm, but I think where we want to end up upstream is with phy
> split out of drm.

7nm differs in registers programming, so it would end up with a separate 
set of tables in qmp phy driver. There is also a 14nm version of dp phy, 
but I don't know if it usable in any actual hardware design.


-- 
With best wishes
Dmitry
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
