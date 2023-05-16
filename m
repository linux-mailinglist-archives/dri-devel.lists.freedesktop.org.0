Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF2470485E
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 11:00:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8CE210E32B;
	Tue, 16 May 2023 09:00:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 996CB10E32C
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 09:00:13 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f4271185daso94299345e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 02:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684227612; x=1686819612;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=wrFkte/bezt1PlNhFCGqqPcTWG4E53z6ADYV3K7fF3g=;
 b=sjp+lL/oyBSGysWhOvH+HyKbaqlOkgM4gPDAx6wEodMzeHJ7CIwWV/D6Czgf7g5b4y
 3pq0iP4PbZbdtl8nXHy5xEuKwlzOhXlby6wZroKbsZnYXMmr6DQMnSKyM9IHVwYeLosI
 jzIxHuQExAJ6cdYicbzRPbpf7WMkkR2x9chwjgwmPU2lkF8Fu83tw5V6qQrDhhyB8kHF
 IoWtbsPD1K3bFtjyChL9/r2atKzi9e9kn9FPjoT1lWrWrBBDbxYKieGQWaiyYI2fqkVv
 om0/lULQwVmA5ddQZOJTYP0du+5eivl6xsSLSUcY8vxUUwHlPYdzqj3Py8lnvOcrE9jL
 v2MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684227612; x=1686819612;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wrFkte/bezt1PlNhFCGqqPcTWG4E53z6ADYV3K7fF3g=;
 b=eTXPqEx9gb7vXCNuXY0dPe4OPCGgcYVTP07BCXFt9AnSUvNa2hyM2aoAOCeeo2FCfJ
 S5tOrTdQm/mtDEuchqG2/c0CU7GJgaTI3t45YE2hwgi/v6Es5YlSGxRT49XvXKzIFVZr
 z9gPMERO3GPui/0+90QDSI6G8xtq2WHi4IhpbTwDfnm/q9SC8++vUZZTaY4gVYEep6Xe
 ZS95bgwj3ZbPbZfyC8Ox65nsdFItYMT91iS89Tp+2cY0lYUMoVLNCO7BdfIvnqcc6uyW
 kd7QX8q00BhsyXYpbST8pat92usr+3ZzV7l6qoE4Bkqx4lq5oE68EhqMATxocK0/eqHJ
 EzLA==
X-Gm-Message-State: AC+VfDyUZJxCsULmtx40CzwG3EghvAVjP0Sa2u27sKQ1fDN3cOtg03fx
 OF7nca9MTITwRTB1AenVTy4/GA==
X-Google-Smtp-Source: ACHHUZ5bSlYDSBtrIk3ZZo2GUz0L3bCKdlDXlaw/wT8THT4atVNx1A2nmPcmuGErziRjmwMbrF+ZaQ==
X-Received: by 2002:a5d:42ca:0:b0:306:3b78:fe31 with SMTP id
 t10-20020a5d42ca000000b003063b78fe31mr23654611wrr.69.1684227611789; 
 Tue, 16 May 2023 02:00:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:86be:97a:a043:77a8?
 ([2a01:e0a:982:cbb0:86be:97a:a043:77a8])
 by smtp.gmail.com with ESMTPSA id
 s14-20020a1cf20e000000b003f4285629casm1532562wmc.42.2023.05.16.02.00.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 May 2023 02:00:11 -0700 (PDT)
Message-ID: <aa22c05d-9db7-eff1-d203-cb795359252b@linaro.org>
Date: Tue, 16 May 2023 11:00:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 01/13] dt-bindings: clk: g12a-clkc: export VCLK2_SEL
 and add CTS_ENCL clock ids
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-0-2592c29ea263@linaro.org>
 <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-1-2592c29ea263@linaro.org>
 <5cb38be4-a27f-dc1a-cbb9-c195505a9e7c@linaro.org>
 <9fa0662e-8854-05f9-da7f-ec8e08d2badf@linaro.org>
 <d5c030f9-2f4d-25cc-b922-d00f5033ac37@linaro.org>
 <6228670c-3e06-3061-f304-a2c641962ffa@linaro.org>
 <9cba6384-123b-1cd1-ed02-08365a0ed529@linaro.org>
 <2fabe721-7434-43e7-bae5-088a42ba128d@app.fastmail.com>
Organization: Linaro Developer Services
In-Reply-To: <2fabe721-7434-43e7-bae5-088a42ba128d@app.fastmail.com>
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
Reply-To: neil.armstrong@linaro.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nicolas Belin <nbelin@baylibre.com>,
 linux-phy@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/05/2023 10:44, Arnd Bergmann wrote:
> On Mon, May 15, 2023, at 18:22, neil.armstrong@linaro.org wrote:
>> On 15/05/2023 18:15, Krzysztof Kozlowski wrote:
>>> On 15/05/2023 18:13, Krzysztof Kozlowski wrote:
>>>
>>> Also one more argument maybe not relevant here but for other cases -
>>> this makes literally impossible to include the clock ID in DTS in the
>>> same kernel revision, because you must not merge driver branch to DTS
>>> branch. SoC folks were complaining about this many times.
>>
>> Actually we handle this very simply by having such patches merged in a immutable
>> branch merged in the clock and DT pull-requests, it worked perfectly so far
>> and neither Stephen or Arnd complained about that.
> 
> It's usually benign if you just add a new clk at the end of the binding
> header, as that doesn't touch the internal header file in the same
> commit. I'm certainly happier about drivers that just use numbers from
> a datasheet instead of having to come up with numbers to stick in a binding
> because the hardware is entirely irregular, but there is usually no point
> trying to complain about bad hardware to the driver authors -- I unsterstand
> you are just trying to make things work.
> 
> I agree with Krzysztof that using the same identifiers in the local
> header and in the binding is just making your life harder for no
> reason, and if you are the only ones doing it this way, it would
> help to change it. Maybe just add a namespace prefix to all the internal
> macros so the next time you move one into the documented bindings you
> can do it with the same immutable branch hack but not include the
> driver changes in the dt branch.

Ack, I'll try to find a simple intermediate solution to avoid this situation.

Thanks,
Neil

> 
>      Arnd

