Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 730C4245D4D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:08:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC2056E489;
	Mon, 17 Aug 2020 07:07:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92D4F6E17D
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Aug 2020 21:21:38 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id dd12so6017767qvb.0
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Aug 2020 14:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fSOWg6njAo0BgaYAkW3ZI1XqUj8alLoYvs3NDMkiQSk=;
 b=fNTr1AP6oXI+Z+vP9W7aopVeB8HKDdHLOWptbwzZzf+/9o4e6mmG8uiZAHNv0y6lWd
 TKsz9faMxGXvwuzoRbAnGOoIYbSJyPMXzOYEK+lV18IhjpncKwKwQ3qgtQx489VgvIIk
 bV8k8/td6zymhZdtoNTI/s85alwGZlxlKuuoKwfX0YLKhauRO7OAsvZGQxy4H9HiK/gF
 om936XsMh9eYx5rV9G0o0B0JDW/Vi+f0NAamfu92QrPofwUL+C6vZgSUQrFzekLMBsX4
 ECmKIQqHJ2Hr8gzkvG86aMVtpLDQCrCp5oL8QoB4sXL8MIRRVeRLoVQl20//6oJwB7TZ
 Mu9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fSOWg6njAo0BgaYAkW3ZI1XqUj8alLoYvs3NDMkiQSk=;
 b=qRa61FEP9cgZ0rUpDi5iDfkNbRs34/2yXYj2GlqaM1r+LTu4RAbqgTSq3c1gJcLEcO
 y89N/zUXl7Qx/TZe4XgOX2U+ju71mrmbQmqgzQ6/Bz085N26w3WyAy1ZxtPdzr7z+RHg
 r/IRWDTjwUU2IAuwaBEByloWzJaOJB8RqL2gu5bVDXWRLbsbAN6BFtHrRvo+UTsl/iVB
 qFw+HpoFsylrUrAJsHVwThtXJwCDHFkXGwcVtgobpdCUtPFYAXcs4IUcltOk6YyQW4Hi
 iWEe6pOIHWjgAiLbqjLRq5TnIDDI8wH1W0DY//058fL/M9jmTFSoTDCAN1sJ+0daKWRk
 OO8A==
X-Gm-Message-State: AOAM530sYUJ+SE7jUanc/nXRfCKP1mxwSKXVBEIVvzOET3yL+YTCGvd8
 bsB9kv8qjs79NI/ljniAwsTHFA==
X-Google-Smtp-Source: ABdhPJx3XPsMq4FB0tV42kjhPB8zgg9seOaawRnu+HoLIebEV0cYDDmb+NOgtyoCPkyOwqIgewXCog==
X-Received: by 2002:a0c:ea30:: with SMTP id t16mr8572128qvp.177.1597526497539; 
 Sat, 15 Aug 2020 14:21:37 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id 73sm2825144qtf.74.2020.08.15.14.21.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 Aug 2020 14:21:37 -0700 (PDT)
Subject: Re: [Freedreno] [PATCH v10 3/5] drm/msm/dp: add support for DP PLL
 driver
To: Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20200812044223.19279-1-tanmay@codeaurora.org>
 <20200812044223.19279-4-tanmay@codeaurora.org>
 <821b5cf9-5ca0-7026-fd99-9a32285ed030@linaro.org>
 <CAF6AEGtcfXodN1_HSdTcH402FdwTk15Nt6p3F=QYeSRhTc+hqw@mail.gmail.com>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <1ea81fa2-1dc8-a0b9-aa32-3127e9354be2@marek.ca>
Date: Sat, 15 Aug 2020 17:21:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAF6AEGtcfXodN1_HSdTcH402FdwTk15Nt6p3F=QYeSRhTc+hqw@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:42 +0000
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

On 8/15/20 4:20 PM, Rob Clark wrote:
> On Fri, Aug 14, 2020 at 10:05 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>>
>> On 12/08/2020 07:42, Tanmay Shah wrote:
>>   > From: Chandan Uddaraju <chandanu@codeaurora.org>
>>   >
>>   > Add the needed DP PLL specific files to support
>>   > display port interface on msm targets.
>>
>> [skipped]
>>
>>   > diff --git a/drivers/gpu/drm/msm/dp/dp_pll_private.h
>> b/drivers/gpu/drm/msm/dp/dp_pll_private.h
>>   > new file mode 100644
>>   > index 000000000000..475ba6ed59ab
>>   > --- /dev/null
>>   > +++ b/drivers/gpu/drm/msm/dp/dp_pll_private.h
>>   > @@ -0,0 +1,98 @@
>>   > +/* SPDX-License-Identifier: GPL-2.0-only */
>>   > +/*
>>   > + * Copyright (c) 2016-2020, The Linux Foundation. All rights reserved.
>>   > + */
>>   > +
>>   > +#ifndef __DP_PLL_10NM_H
>>   > +#define __DP_PLL_10NM_H
>>   > +
>>   > +#include "dp_pll.h"
>>   > +#include "dp_reg.h"
>>   > +
>>   > +#define DP_VCO_HSCLK_RATE_1620MHZDIV1000    1620000UL
>>   > +#define DP_VCO_HSCLK_RATE_2700MHZDIV1000    2700000UL
>>   > +#define DP_VCO_HSCLK_RATE_5400MHZDIV1000    5400000UL
>>   > +#define DP_VCO_HSCLK_RATE_8100MHZDIV1000    8100000UL
>>   > +
>>   > +#define NUM_DP_CLOCKS_MAX            6
>>   > +
>>   > +#define DP_PHY_PLL_POLL_SLEEP_US        500
>>   > +#define DP_PHY_PLL_POLL_TIMEOUT_US        10000
>>   > +
>>   > +#define DP_VCO_RATE_8100MHZDIV1000        8100000UL
>>   > +#define DP_VCO_RATE_9720MHZDIV1000        9720000UL
>>   > +#define DP_VCO_RATE_10800MHZDIV1000        10800000UL
>>   > +
>>   > +struct dp_pll_vco_clk {
>>   > +    struct clk_hw hw;
>>   > +    unsigned long    rate;        /* current vco rate */
>>   > +    u64        min_rate;    /* min vco rate */
>>   > +    u64        max_rate;    /* max vco rate */
>>   > +    void        *priv;
>>   > +};
>>   > +
>>   > +struct dp_pll_db {
>>
>> This struct should probably go into dp_pll_10nm.c. dp_pll_7nm.c, for
>> example, will use slightly different structure.
> 
> Note that sboyd has a WIP series to move all of the pll code out to a
> phy driver.  If there is work already happening on 7nm support, it
> might be better to go with the separate phy driver approach?  I'm
> still a bit undecided about whether to land the dp code initially with
> the pll stuff in drm, and then continue refactoring to move to
> separate phy driver upstream, or to strip out the pll code from the
> beginning.  If you/someone is working on 7nm support, then feedback
> about which approach is easier is welcome.
> 
> https://lore.kernel.org/dri-devel/20200611091919.108018-1-swboyd@chromium.org/
> 

I have a sm8150/sm8250 (7nm) upstream kernel stack with DP enabled, and 
I have done something similar, with the PLL driver in the QMP phy, 
although not based on sboyd's series (along with some typec changes to 
negotiate the DP alt mode and get HPD events, etc.). I don't think 
having PLL in drm/msm makes sense, the drm/msm DP driver shouldn't need 
to be aware of the DP PLL/PHY driver, it only needs to set the 
link/pixel clock rates which are in dispcc (and those then have the PLL 
clocks as a parent).

FYI, since it sounds you are considering landing this: it is completely 
broken, for example:
- ioremap()'s to #define'd addresses in the PLL driver
- main DP driver reading/writing to registers in the PHY region, but 
getting the base address from devicetree was removed since earlier 
revisions, so it just fails completely. Look at usb3_dp_com (for 
example), which in dp_catalog_ctrl_usb_reset() would be used to 
overwrite registers already being driven by the qmp phy driver - but now 
the usb3_dp_com.base is never initialized.

-Jonathan

> BR,
> -R
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
