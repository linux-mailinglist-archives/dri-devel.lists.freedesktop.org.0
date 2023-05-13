Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E60A5701932
	for <lists+dri-devel@lfdr.de>; Sat, 13 May 2023 20:28:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA6A110E012;
	Sat, 13 May 2023 18:28:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D6210E012
 for <dri-devel@lists.freedesktop.org>; Sat, 13 May 2023 18:28:30 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-50bd37ca954so99296875a12.0
 for <dri-devel@lists.freedesktop.org>; Sat, 13 May 2023 11:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684002506; x=1686594506;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/skyL1sLWdeVWQOTLH4B/eNUzzrc9hV+v4n2aX70iXk=;
 b=G0WSmFIDrbVpJnxA9vpq/+boMjF9sbPpuRcq/wRTF+rvSiPClVefSbA/Jm14QEe6PX
 BXt+NA2Bbavm3P/r6lUp+m42FltmWO2O2Eo+W9Y2YjVaObvHtfcVQeKMGEkhMIP1EvHr
 RxYaVGxah6XG4y7V8ffKGPej4l7rM/TxK2jSHEWLR6AIplNAhqjjLptXJAfQnbBd6ooD
 dk71FI55LsAlOFey7nU7iP4DPulUDmZiLTi9pfMSkcXAZ4VYcABlBQM1RiXRIfEy0JJN
 snHoVzbzI6sxKlgJO4SlWsiBWaJXpjiaSjNi02viIIhOjY7O9QniU+IXRz7CDIAVh2c1
 n5vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684002506; x=1686594506;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/skyL1sLWdeVWQOTLH4B/eNUzzrc9hV+v4n2aX70iXk=;
 b=R0GUYISHqOsYBs1z0azcVgyxXiZH1TdVdM1Omb+dNFsnO8EuTwhRIZdZ6OTkoBccC/
 0kynb2U/6My5GjYZheVFBFbHgirlgExbDkAxXxMhbe9Mmt8zr7jbbOXVe7xgPai7R99V
 hcfZhpCLyQ0KdQTAIzCvyW7CqvsiiStRs1ftHuWrMPWR5K2J10nk+CjX0U8FMb5Ts+6V
 xM31pl19jgZxyWiwlwaMJPjlG6GbS7+q5zrjtXf28eaoaHWXzlhBWCarcn6ijZZazmQd
 +1waJZC0wJ/05g3XjYvSl2eUqMvl2sut3qj3pox3lFUPlVp10PTHWNZHW/uTR3xtUV9G
 W18w==
X-Gm-Message-State: AC+VfDzflHL8R2zLJSmFjtnq2/JDNriMlCLnFaZWoPpTh0bUZWSvc9VW
 M9BF2lExeTa/xD3Cr7XiO6u61Q==
X-Google-Smtp-Source: ACHHUZ6BZjAGfoNRaV4SZYpzLVlE5wxvvxIlWnwclnXWyUvW+KjYeL4jTHPXBIuhzNmNzRxBc6Fsmw==
X-Received: by 2002:a17:907:1c8c:b0:965:cac1:53ad with SMTP id
 nb12-20020a1709071c8c00b00965cac153admr28615039ejc.8.1684002506136; 
 Sat, 13 May 2023 11:28:26 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ba68:e5c9:694e:c6e4?
 ([2a02:810d:15c0:828:ba68:e5c9:694e:c6e4])
 by smtp.gmail.com with ESMTPSA id
 de9-20020a1709069bc900b0094e6a9c1d24sm7172177ejc.12.2023.05.13.11.28.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 May 2023 11:28:25 -0700 (PDT)
Message-ID: <5cb38be4-a27f-dc1a-cbb9-c195505a9e7c@linaro.org>
Date: Sat, 13 May 2023 20:28:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 01/13] dt-bindings: clk: g12a-clkc: export VCLK2_SEL
 and add CTS_ENCL clock ids
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-0-2592c29ea263@linaro.org>
 <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-1-2592c29ea263@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-1-2592c29ea263@linaro.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nicolas Belin <nbelin@baylibre.com>,
 linux-phy@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/05/2023 15:11, Neil Armstrong wrote:
> Expose VCLK2_SEL clock id and add new ids for the CTS_ENCL and CTS_ENCL_SEL
> clocks on G12A compatible SoCs.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/clk/meson/g12a.h              | 1 -
>  include/dt-bindings/clock/g12a-clkc.h | 3 +++
>  2 files changed, 3 insertions(+), 1 deletion(-)

Bindings must be a separate patch from the driver changes. If this
causes bisectability issues, this means entire solution breaks ABI and
is not appropriate anyway...

Best regards,
Krzysztof

