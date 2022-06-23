Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA95557A80
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 14:41:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEDAA10E4D2;
	Thu, 23 Jun 2022 12:41:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC09510E295
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 12:41:22 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 p6-20020a05600c1d8600b003a035657950so443080wms.4
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 05:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=YKuhlfeie/APuzN1zX50F9wlajDVarix+gW9JqPWiT0=;
 b=UMP6RCyZP4CD6hOpGQbkX9Cj3bPk1ibYJbn4nsdNdndZTqQfI3/vZ8bIRLgJSIms8u
 CPePjkJfaFGkLpAH9WY7iFv9pbNYvYe5jqqSz8sj+2Qf4GfYVFiKObOiaJ7J+qH1bGvP
 VbLXbFzeDNL3kV5xpFgi8EPl9utzHo/yeUTmYj0EJVSqHBEOLi9N+dZTEkBtSiT1ZYoV
 E4fQE+A+R2BHBwNPUeWkzfyaoJLLBH+EMoSWnr4Qer7+DC8yHJI0iUtL7cob5S1ocket
 H2qCHNsne4oMOwFRLI9UMKSLvjNlpdi8dU2fdlh1bFht6a2RH8lnI13E785t9rZnNwvq
 L5OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YKuhlfeie/APuzN1zX50F9wlajDVarix+gW9JqPWiT0=;
 b=UjWsvc3+BgrpPTyD72MLPbHj4DiGpbh3SM3jKNKtSKTjACzsJWJXhsYnupEMFShg/F
 rNo+D8MREAmTLR9Zr2D/Sgg5F1QJYJrop4pPU8BTvNY0odR2VSCYiUt1zH97Ibd2BynG
 QUDkKHUiDTI4BvUxuE+sXmMcrDtRTYiUO+Z6FpbbbjRfFNiTs7Wl30ICsrwH/iV7epfe
 kbnA1em4YcxOJMRV1nm6kddqLhZOkcxsb5OtM0UvbWPczPU24qukrWqT5SORGWsm4ADx
 AjAb59o+yx68msKI95vT8GeTesHBniZentfUSXRYQ2rT/XB7WFC76BJ6kuayGtQ/ow0+
 I02g==
X-Gm-Message-State: AJIora99OERmEQc/CKpvqUJioxxJ8FE0wmvTWYXiCHoU87ewS7k1JzFF
 mxVKjUfZP1ekyQbXpNJHcW7DrA==
X-Google-Smtp-Source: AGRyM1sX86vrrjVPPP1yUcwx/sZIRbQprpzXl44FYJKuAjsvw6TD5Ua2hBw6xE35bd62RibFYqBp1g==
X-Received: by 2002:a05:600c:2c46:b0:39c:55a0:9533 with SMTP id
 r6-20020a05600c2c4600b0039c55a09533mr4015082wmg.104.1655988081094; 
 Thu, 23 Jun 2022 05:41:21 -0700 (PDT)
Received: from [192.168.149.129] ([80.233.63.220])
 by smtp.gmail.com with ESMTPSA id
 n1-20020a5d4201000000b0021a36955493sm23104159wrq.74.2022.06.23.05.41.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jun 2022 05:41:20 -0700 (PDT)
Message-ID: <4a76c7aa-62e8-385c-15a0-9992ec566de5@conchuod.ie>
Date: Thu, 23 Jun 2022 13:41:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 06/14] spi: dt-bindings: dw-apb-ssi: update
 spi-{r,t}x-bus-width for dwc-ssi
Content-Language: en-US
To: Serge Semin <fancer.lancer@gmail.com>, Conor.Dooley@microchip.com
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-7-mail@conchuod.ie>
 <20220620205654.g7fyipwytbww5757@mobilestation>
 <61b0fb86-078d-0262-b142-df2984ce0f97@microchip.com>
 <9a1fcb40-9267-d8e6-b3b6-3b03fd789822@opensource.wdc.com>
 <a2d85598-76d1-c9dc-d50d-e5aa815997cf@conchuod.ie>
 <c272728f-f610-77df-bd9b-c9fee6b727f8@opensource.wdc.com>
 <bd2547f8-e069-60a2-a223-9f694457636d@microchip.com>
 <20220623102502.jiksqr3m6y733haq@mobilestation>
From: Conor Dooley <mail@conchuod.ie>
In-Reply-To: <20220623102502.jiksqr3m6y733haq@mobilestation>
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
Cc: niklas.cassel@wdc.com, alsa-devel@alsa-project.org, airlied@linux.ie,
 palmer@rivosinc.com, linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org,
 sam@ravnborg.org, damien.lemoal@opensource.wdc.com, daniel.lezcano@linaro.org,
 joabreu@synopsys.com, geert@linux-m68k.org, Eugeniy.Paltsev@synopsys.com,
 devicetree@vger.kernel.org, aou@eecs.berkeley.edu, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org, paul.walmsley@sifive.com, tglx@linutronix.de,
 dillon.minfei@gmail.com, lgirdwood@gmail.com, jee.heng.sia@intel.com,
 linux-spi@vger.kernel.org, vkoul@kernel.org, broonie@kernel.org,
 palmer@dabbelt.com, dmaengine@vger.kernel.org, masahiroy@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 23/06/2022 11:25, Serge Semin wrote:
> On Tue, Jun 21, 2022 at 04:06:21PM +0000, Conor.Dooley@microchip.com wrote:
>> On 21/06/2022 00:17, Damien Le Moal wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> On 6/21/22 07:49, Conor Dooley wrote:
>>>>
>> ---8<---
>>>>>>
>>>>>> hmm, well I'll leave that up to people that have Canaan hardware!
>>>>>
>>>>> I will test this series.
>>>>>
>>>>
>>>> Cool, thanks.
>>>> I'll try to get a respin out tomorrow w/ the memory node "unfixed".
>>>
>>> OK. I will test that then :)
>>
>> Since the memory node hit that dt-schema snag, I have not sent a v2.
>> Going to be AFK for a few days, so I dropped the memory node change,
>> changed the spi binding & put the series on:
>> git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ canaan
>>
> 
>> If you get a chance to look at it great, if not I'll send a v2 once
>> the memory node is figured out.
> 
> commit 84df6ca0f277 ("spi: dt-bindings: dw-apb-ssi: update
> spi-{r,t}x-bus-width") looks good to me. Feel free to add my ack tag
> to v2 of that patch.

Sure, thanks!
