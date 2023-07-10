Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7085974CEC5
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 09:44:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5681510E202;
	Mon, 10 Jul 2023 07:44:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B470410E202
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 07:44:21 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2b71ae5fa2fso13526371fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 00:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688975059; x=1691567059;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6XrmlGPg2875uNjm6boMUV/4SOLisp7J98OyN2fD1Tw=;
 b=pPrTTLBnGur5kN4+tW9BpSR3CRK1iLs2xQ5LA2jYbG3ZnCOdgiR7x3rbMWZL0wIKcY
 ONovt9MrvNp/PSjRLm1unFrsXKnzjZzi//nZT3gxyU50a24CvIN5RidEKkSt+GVbrZp9
 vZH80Y9T28gpopOKUjPEFZ8Vs3K2XDFsxTf2j+dtOdnKfFY9e6/Q0oKGetam1di2/X1y
 rt0YDTle3h8GKRvd70ctpI4X4Y8ZJHZvei8eceydWn7zMwZLNa6G34HqPTUTrwt3FpWx
 LnQz5pA0SadArrSv9a1CJYdaiP88Al05514dB6CU9x+4dPjdZZDS0q5iDfUjqrPToFHx
 VH+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688975059; x=1691567059;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6XrmlGPg2875uNjm6boMUV/4SOLisp7J98OyN2fD1Tw=;
 b=N6pBcO+zjBmUBsaJD4/zl+OLYdD9OgrcEkQn8SehIEgw7Y7CxZwKzdhE8jKGgkgJaa
 pTPeotiRkl6jJHedFsb7NAQbR7oSp43GYK+Czs9+ISSDr+Mc6+alHfQ8y2Pcn2n+he7Z
 F5R94VXy2CD1rHk79F76D//ygImquKB/oEv66WXTjHC+7klO20hUED4xYi02N6v1jSeK
 Z1emhWnnOyzBsnZ6vEMDBZ42qMcyX/xD72DLrglZ9n6hPrKEYsKGzVZHnHZSMBFDsCUx
 NpSnoiJmgOYEKDJBCmPPEYyTkFmoTGeT+Dd7c1fZ+rXlboEmf8NgJFhgL/Dlk9MGXBD8
 Ma6A==
X-Gm-Message-State: ABy/qLba/Yr16UkJbAgytkMPMmNQ+JTHkR5h/tmZRCSKBlhN8tHsOiy2
 ghiHy2McXjlX3lQVPleFtyXR9g==
X-Google-Smtp-Source: APBJJlG9EwwBqMxbwjIJnMoPkWXpbz49k2oZ4zzVaR1jVwtsSlECY1RtVLmIAi3Z49JKpD4MBMXLZg==
X-Received: by 2002:a2e:7013:0:b0:2b6:d536:1bba with SMTP id
 l19-20020a2e7013000000b002b6d5361bbamr9641213ljc.18.1688975059356; 
 Mon, 10 Jul 2023 00:44:19 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 n25-20020a2e86d9000000b002b6cc17add3sm1886857ljj.25.2023.07.10.00.44.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jul 2023 00:44:18 -0700 (PDT)
Message-ID: <8966feba-eef9-2ea3-dbec-13fc53232a6b@linaro.org>
Date: Mon, 10 Jul 2023 10:44:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [EXT] Re: [PATCH v6 4/8] phy: Add HDMI configuration options
Content-Language: en-GB
To: Sandor Yu <sandor.yu@nxp.com>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "robert.foss@linaro.org" <robert.foss@linaro.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>
References: <cover.1686729444.git.Sandor.yu@nxp.com>
 <cec469206a166c4b070fd7d7bbf89a8df656ccc6.1686729444.git.Sandor.yu@nxp.com>
 <6f590bb6-7d17-3ae8-684d-2d4403d6ff55@linaro.org>
 <PAXPR04MB9448598256524162A74F0311F430A@PAXPR04MB9448.eurprd04.prod.outlook.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <PAXPR04MB9448598256524162A74F0311F430A@PAXPR04MB9448.eurprd04.prod.outlook.com>
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
Cc: Oliver Brown <oliver.brown@nxp.com>, dl-linux-imx <linux-imx@nxp.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/07/2023 10:28, Sandor Yu wrote:
> Hi Dmitry,
> 
> Thanks for your comments,
> 
>> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> On 15/06/2023 04:38, Sandor Yu wrote:
>>> Allow HDMI PHYs to be configured through the generic functions through
>>> a custom structure added to the generic union.
>>>
>>> The parameters added here are based on HDMI PHY implementation
>>> practices.  The current set of parameters should cover the potential
>>> users.
>>>
>>> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
>>> ---
>>>    include/linux/phy/phy-hdmi.h | 38
>> ++++++++++++++++++++++++++++++++++++
>>>    include/linux/phy/phy.h      |  7 ++++++-
>>>    2 files changed, 44 insertions(+), 1 deletion(-)
>>>    create mode 100644 include/linux/phy/phy-hdmi.h
>>>
>>> diff --git a/include/linux/phy/phy-hdmi.h
>>> b/include/linux/phy/phy-hdmi.h new file mode 100644 index
>>> 000000000000..5765aa5bc175
>>> --- /dev/null
>>> +++ b/include/linux/phy/phy-hdmi.h
>>> @@ -0,0 +1,38 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +/*
>>> + * Copyright 2022 NXP
>>> + */
>>> +
>>> +#ifndef __PHY_HDMI_H_
>>> +#define __PHY_HDMI_H_
>>> +
>>> +/**
>>> + * Pixel Encoding as HDMI Specification
>>> + * RGB, YUV422, YUV444:HDMI Specification 1.4a Section 6.5
>>> + * YUV420: HDMI Specification 2.a Section 7.1  */ enum
>>> +hdmi_phy_colorspace {
>>> +     HDMI_PHY_COLORSPACE_RGB,        /* RGB 4:4:4 */
>>> +     HDMI_PHY_COLORSPACE_YUV422,     /* YCbCr 4:2:2 */
>>> +     HDMI_PHY_COLORSPACE_YUV444,     /* YCbCr 4:4:4 */
>>> +     HDMI_PHY_COLORSPACE_YUV420,     /* YCbCr 4:2:0 */
>>> +     HDMI_PHY_COLORSPACE_RESERVED4,
>>> +     HDMI_PHY_COLORSPACE_RESERVED5,
>>> +     HDMI_PHY_COLORSPACE_RESERVED6,
>>> +};
>>
>> This enum duplicates enum hdmi_colorspace from <linux/hdmi.h> HDMI 2.0
>> defines '7' to be IDO-defined.
>>
>> Would it be better to use that enum instead?
> Accept. I will create head file hdmi_colorspace.h to reuse enum hdmi_colorspace in <linux/hdmi.h>.

Excuse me, it was supposed to be a question.

Do you need another header file to reuse this enum?

> 
> B.R
> Sandor
>>
>>> +
>>> +/**
>>> + * struct phy_configure_opts_hdmi - HDMI configuration set
>>> + * @pixel_clk_rate:  Pixel clock of video modes in KHz.
>>> + * @bpc: Maximum bits per color channel.
>>> + * @color_space: Colorspace in enum hdmi_phy_colorspace.
>>> + *
>>> + * This structure is used to represent the configuration state of a HDMI phy.
>>> + */
>>> +struct phy_configure_opts_hdmi {
>>> +     unsigned int pixel_clk_rate;
>>> +     unsigned int bpc;
>>> +     enum hdmi_phy_colorspace color_space; };
>>> +
>>> +#endif /* __PHY_HDMI_H_ */
>>
>> [skipped the rest]
>>
>> --
>> With best wishes
>> Dmitry
> 

-- 
With best wishes
Dmitry

