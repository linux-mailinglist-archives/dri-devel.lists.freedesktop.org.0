Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D4B6D1AB4
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 10:48:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE52310F136;
	Fri, 31 Mar 2023 08:48:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DFF310F136
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 08:48:18 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id j11so27933736lfg.13
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 01:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680252496;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tm1V7yJO1sVJ8oDFW+efMTQrEjYBE09NjiCatpcfg0g=;
 b=czTv+X6h/pqGRW6NQmy6IbpwwYHkahMl6Bin0QQeBAZZSrK7dBNfkmhN46ZSflUSlH
 66Anvk5SWJ/f9ZufHR2/GqmqK+J0u/5s/At2tJrY1DQTxd97IsJTOfW94PmAJP3+gI6Q
 1Wa/YLbpK/wP867WfAP/y5oh3UgWBR9qAos+d50fX+Dqjd6tPmRkHz0U3XIhs4hU5ZJJ
 TDPAkH6dPJrjWcBIq7AmsJ1sb8okqMmEhU3ZCALg77+2JWviNae3jgwIzQrXuFUTNNHV
 N7Z6sAxSTdqA07ISq1KR5HWk/73HGA0z3bNUbbyxZ6web94381onW7CnS8sk9r+yppvm
 7gPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680252496;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tm1V7yJO1sVJ8oDFW+efMTQrEjYBE09NjiCatpcfg0g=;
 b=mxybnADsGYLIkhElAZ96G0H1YiraygTgQLfjPUBNSujm0gi6/lU4XOFc8Qn/ln63jo
 jrehnQhqNjK/X0RN6l/3IQ4H3YmBclriKHy84T4whPe5ukfb3zIglfsalv1YiKTPlnhl
 wCdPvm0ncMk38UBOc9Sx8vN8Yh6Bdd7deTuEx/ip5VxY5n5YZ63teIf/IyzM52z4ocM1
 xVJBdQiIHhlU9xm3gLM1PUu2MhZx9CztDrqAe1bHZOjK0M6dNXAIpJRpqSOGH2mgnyGk
 Iu0i3JC+nID9uV9ZFkx6xpTU0kb5fwiPRL08eq7WZ0SUNy/7Iwm5i1WSHNa8x4wZaM+E
 7ESg==
X-Gm-Message-State: AAQBX9f2t1teePrwe1pfeiF7iJk56S6Rytw09lCYgIu2BhqkncaKBQKM
 Dt7qMIJajQRwGiSK2okexf1zDw==
X-Google-Smtp-Source: AKy350aRSIm5s41a7PMGjDDesTvcDx2ZxIyhCmAa39Q7CsCcLVTVNf+UCZjjrQ0UDaqg2r1OTZIenQ==
X-Received: by 2002:ac2:5a06:0:b0:4b5:61e8:8934 with SMTP id
 q6-20020ac25a06000000b004b561e88934mr7151447lfn.64.1680252496629; 
 Fri, 31 Mar 2023 01:48:16 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 h9-20020a05651211c900b004e7d9176dfasm289636lfr.285.2023.03.31.01.48.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 01:48:16 -0700 (PDT)
Message-ID: <a924186c-31d3-b7f0-085f-97b849a4d751@linaro.org>
Date: Fri, 31 Mar 2023 10:48:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 3/6] dt-bindings: display: bridge: toshiba,tc358768:
 add parallel input mode
Content-Language: en-US
To: Francesco Dolcini <francesco@dolcini.it>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, devicetree@vger.kernel.org
References: <20230330095941.428122-1-francesco@dolcini.it>
 <20230330095941.428122-4-francesco@dolcini.it>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230330095941.428122-4-francesco@dolcini.it>
Content-Type: text/plain; charset=UTF-8
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
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/03/2023 11:59, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> Add new toshiba,input-rgb-mode property to describe the actual signal
> connection on the parallel RGB input interface.
> 
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
>  .../bindings/display/bridge/toshiba,tc358768.yaml | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
> index 8f22093b61ae..2638121a2223 100644
> --- a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
> @@ -42,6 +42,21 @@ properties:
>    clock-names:
>      const: refclk
>  
> +  toshiba,input-rgb-mode:
> +    description: |
> +      Parallel Input (RGB) Mode.
> +
> +      RGB inputs (PD[23:0]) color arrangement as documented in the datasheet
> +      and in the table below.
> +
> +      0 = R[7:0], G[7:0], B[7:0]

RGB888?

> +      1 = R[1:0], G[1:0], B[1:0], R[7:2], G[7:2], B[7:2]
> +      2 = 8’b0, R[4:0], G[5:0], B[4:0]

Isn't this RGB565?

Don't we have already properties like this? e.g. colorspace?

Best regards,
Krzysztof

