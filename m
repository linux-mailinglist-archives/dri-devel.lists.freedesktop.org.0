Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1820B7120D6
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 09:23:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D2F010E7A6;
	Fri, 26 May 2023 07:23:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAB5B10E7A6
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 07:23:45 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-309553c5417so321651f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 00:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685085824; x=1687677824;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=MoMJb/3ygAHemeTwFhWl9bC1M2IUgInMEPVYub1aWm8=;
 b=SfLOA8Gjh5Flmffs3QiDjo/F8EmfVx9Z9MGwFnle6dbg4VUP0nHgRscw0YvpvJpCSd
 M2gdSh4lkP8HLmNPWNrluaf76o2tSdjHJeFCR6ffap1XlpQcKw6uOVPKXuo14Need9IT
 BGntp7JKIsF+C7a2XUkb4uyD76zFLXZTcSqhobCdiQbOKFoGvR+KiUPV5CaKtc4klFlN
 KrVwmfIMszJAYHJXxtmjorEwCCWU/y8rjMqgUofVVyqCVqzrzQYa3sXtJ1bee5ia1Z7X
 XoVrkob6+mGMUFD+bovAtAoAntD/NxVbsCiRyoVCRQdGdW6RR4QlQmoU7oe07XSTWcZJ
 RD4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685085824; x=1687677824;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MoMJb/3ygAHemeTwFhWl9bC1M2IUgInMEPVYub1aWm8=;
 b=Bw61Cs/GuVkzHOsZbUg2HgXt5NwYSNGde90KtIhtdCPRPSV4588Yfejv3dZbh8kWMr
 ygq7HyHX7nhFw47yTFPO7VTV8cQ68MkifWbe/1YOV3fjU+Z9pt89g7Z98ciVm7wRwe4M
 RARXck7D4aH96tP1bDIXUM15BUh6Ee1Ix25wWl8W8kq7Ia7Ol2JNO1NEDs+Z7wmJznUf
 nG4VEqHiflBJ06yCXvpFFGvEaHGoBM/2Iikj8oy2NTFHURkT4Tnh2OlP3jSqF7OegQZO
 mVdtN1J5mrAe80HtbTTlHpz4oIr/xROPUm9DLfbwJigQS71GrtSu4AgrZstynpKkJYFs
 h/Jw==
X-Gm-Message-State: AC+VfDyIsaNWmBswijKJlpFsfC33903u08I1/mltbaq+wHRH0Zw+kyQk
 LDhwQWMNHvKMR584Vat8huIIKTOJNCfqJ7XvrJE2FQ==
X-Google-Smtp-Source: ACHHUZ6nBfmoGOfFj1UiNhrpHsCNORjebjfenmWMYeDuCJb1qiiOw9Oyg/V2gEttx8ZGFMRChNnwCA==
X-Received: by 2002:adf:f187:0:b0:306:3b08:6da3 with SMTP id
 h7-20020adff187000000b003063b086da3mr727330wro.61.1685085824052; 
 Fri, 26 May 2023 00:23:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:15d9:4dfb:95d6:f5a0?
 ([2a01:e0a:982:cbb0:15d9:4dfb:95d6:f5a0])
 by smtp.gmail.com with ESMTPSA id
 y9-20020a5d4709000000b00307d58b3da9sm4146547wrq.25.2023.05.26.00.23.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 May 2023 00:23:43 -0700 (PDT)
Message-ID: <a481109f-17f5-3a95-46aa-c7254201cd5c@linaro.org>
Date: Fri, 26 May 2023 09:23:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH V7 0/6] drm: bridge: samsung-dsim: Support variable
 clocking
Content-Language: en-US
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, Adam Ford <aford173@gmail.com>
References: <20230518230626.404068-1-aford173@gmail.com>
 <168508573242.1449766.4668062755722232780.b4-ty@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <168508573242.1449766.4668062755722232780.b4-ty@linaro.org>
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
Cc: Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, aford@beaconembedded.com,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 26/05/2023 09:22, Neil Armstrong wrote:
> Hi,
> 
> On Thu, 18 May 2023 18:06:20 -0500, Adam Ford wrote:
>> This series fixes the blanking pack size and the PMS calculation.  It then
>> adds support to allows the DSIM to dynamically DPHY clocks, and support
>> non-burst mode while allowing the removal of the hard-coded clock values
>> for the PLL for imx8m mini/nano/plus, and it allows the removal of the
>> burst-clock device tree entry when burst-mode isn't supported by connected
>> devices like an HDMI brige.  In that event, the HS clock is set to the
>> value requested by the bridge chip.
>>
>> [...]
> 
> Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)
> 
> [1/6] drm: bridge: samsung-dsim: fix blanking packet size calculation
>        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=a617b33f7e513f25becf843bc97f8f1658c16337
> [2/6] drm: bridge: samsung-dsim: Fix PMS Calculator on imx8m[mnp]
>        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=54f1a83c72250b182fa7722b0c5f6eb5e769598d
> [3/6] drm: bridge: samsung-dsim: Fetch pll-clock-frequency automatically
>        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=33d8d14c83bf67aa0d262961a6fda9c40f3c1052
> [4/6] drm: bridge: samsung-dsim: Select GENERIC_PHY_MIPI_DPHY
>        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=171b3b1e0f8b8c894f2388e1cf765a56f831ee5e
> [5/6] drm: bridge: samsung-dsim: Dynamically configure DPHY timing
>        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=89691775f5735fca9dc40e119edcbb52a25b9612
> [6/6] drm: bridge: samsung-dsim: Support non-burst mode
>        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=bb0e13b9e223b218c9f242f8d340a332b4381042
> 

Unlike what b4 determined, I applied v8 patches 1-6, I'll wait for comments on the bindings patch.

Thanks,
Neil
