Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A40927120DB
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 09:25:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6552B10E7AA;
	Fri, 26 May 2023 07:25:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23A5710E7AA
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 07:25:00 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3095b1b6e02so178147f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 00:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685085898; x=1687677898;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=kMA0q0+orF3dwWefUl5BaOVFBflGo6mcE1xBc9h+qAw=;
 b=s3h+nLTL18ptvO3FGp02QqI4CWOqQlb4rt1Rp1Moln8gEdPq8E4JX5cvEsAWcCQjVe
 noYIp0WOJoyMXQCyTzd9J67Ye3JF2zszLyjQzCGwOqyEueMUCxx9wDO8r3lAjqDN1lye
 0K8ChzfN9qzsv23hstWu/mIhMso2GI8DRiIPWvU1jZCF5+5AYo86tqyYaEfvMpbpPbyT
 d/gHPjhnQoxl7RZX5oKeMKeqmY9YtNE+6mPZz/ISru6bK5BGXLC+qFprpMrceXCWuADt
 MvI+lbk2KxqEOGKkui5xT/kWXJJsjww3+dTjTN1wu8tx+4Pu89WB6Se/FHENND10+008
 DwrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685085898; x=1687677898;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kMA0q0+orF3dwWefUl5BaOVFBflGo6mcE1xBc9h+qAw=;
 b=UJVyS9tIzdeVyAIkOpdbpBaN5T4+yJm3s3EjH/09E4TeRTZ1nvUQpYHx3kcbjaMPTm
 Wmrrt+C3hYXnCrXbvhUNZxVMvkes1ClyIgZlrY4DaNPTPaap1+TWvPGL/KNLoVT1ypSa
 5RenUdjUZljw2eF2Z9rhLirJs/pUmEH/L1LQDrV/uPAVvuOkdgKbaKdPW/cUTEb8SXym
 u1C8SMKe8hS8S1u/wpo4QiAPdwW7TxAwaCyUs9BbeHgmCfA8YmEZbfvoKZxRbAyEGpeN
 ICbwNb8Mj0ve438RpdOaTFIxTOt0j9Y1MtSHNpShsU0jwk0cb+6LoAyHUCyx3V7PA9rX
 Dbmg==
X-Gm-Message-State: AC+VfDw/8nLL32/NJ7DDKc5yIQRcLTgaK2S5VFkXYVPw++ydG8/eM9gT
 fV/R3ejYEEN/6E8s5T515JV7RH+9RdmbS/HWUrfjZw==
X-Google-Smtp-Source: ACHHUZ4i6+Ev8Xo3WXWSge2iHDb34BDFGq9Aqn+jmz4LirYDZaHB8nKbRQDH2HDjY9lGUCjUd+5q4g==
X-Received: by 2002:adf:fc4e:0:b0:306:3da7:f33c with SMTP id
 e14-20020adffc4e000000b003063da7f33cmr576474wrs.63.1685085897848; 
 Fri, 26 May 2023 00:24:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:15d9:4dfb:95d6:f5a0?
 ([2a01:e0a:982:cbb0:15d9:4dfb:95d6:f5a0])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a5d51c5000000b003064088a94fsm4112766wrv.16.2023.05.26.00.24.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 May 2023 00:24:57 -0700 (PDT)
Message-ID: <cd3c7cca-9edd-ca16-8376-e3ba924eaa30@linaro.org>
Date: Fri, 26 May 2023 09:24:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH V8 0/7] drm: bridge: samsung-dsim: Support variable
 clocking
Content-Language: en-US
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, Adam Ford <aford173@gmail.com>
References: <20230526030559.326566-1-aford173@gmail.com>
 <168508573345.1449766.11809947722851001124.b4-ty@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <168508573345.1449766.11809947722851001124.b4-ty@linaro.org>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, aford@beaconembedded.com,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Rob Herring <robh+dt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/05/2023 09:22, Neil Armstrong wrote:
> Hi,
> 
> On Thu, 25 May 2023 22:05:52 -0500, Adam Ford wrote:
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
> [1/7] drm: bridge: samsung-dsim: fix blanking packet size calculation
>        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=a617b33f7e513f25becf843bc97f8f1658c16337
> [2/7] drm: bridge: samsung-dsim: Fix PMS Calculator on imx8m[mnp]
>        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=54f1a83c72250b182fa7722b0c5f6eb5e769598d
> [3/7] drm: bridge: samsung-dsim: Fetch pll-clock-frequency automatically
>        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=33d8d14c83bf67aa0d262961a6fda9c40f3c1052
> [4/7] drm: bridge: samsung-dsim: Select GENERIC_PHY_MIPI_DPHY
>        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=171b3b1e0f8b8c894f2388e1cf765a56f831ee5e
> [5/7] drm: bridge: samsung-dsim: Dynamically configure DPHY timing
>        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=89691775f5735fca9dc40e119edcbb52a25b9612
> [6/7] drm: bridge: samsung-dsim: Support non-burst mode
>        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=bb0e13b9e223b218c9f242f8d340a332b4381042
> [7/7] dt-bindings: bridge: samsung-dsim: Make some flags optional
>        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=cfaf76d349837f695c8aa6d7077847fec4231fe5
> 

OK I made a bad manipulation, I applied patch 7 without review... I'll send a revert patch.

Neil
