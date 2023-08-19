Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6D17819B0
	for <lists+dri-devel@lfdr.de>; Sat, 19 Aug 2023 15:28:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 293A210E02A;
	Sat, 19 Aug 2023 13:28:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8DEC10E02A
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Aug 2023 13:28:16 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-52580a24128so2247301a12.2
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Aug 2023 06:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692451695; x=1693056495;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=g2/eTmeGLIHBF7FLb+vCfZlq5lr8O3DMbn1/hvnwEr0=;
 b=IPP4vVumV3eDszkG6RRimK7qs2DHKWHs0SYQ/Txw9bpUM69YewaXB+K+ON0WZhlKHi
 /QaRSWaQPo/Q9BFzBsxvX1O4hzyKIAkvkQVMUn9nJcb0gZ3ZNlQDMi+xvl6y/xMvJye1
 s4Qm1dnccDe35absNagrltggKFvTDuoBLzHcNz04CMDNGPTxJZmq3utzsFBabOzEO2Qy
 q8A2QYMzmfPmsDwWZAEBMe023eV4jlOyinzFkYH7+0cCaCBjhOPe0vNnKYFbE9/y3CZ3
 eKX19dgYEQSJ/CNa0M/WJgwUN1etceK7lJme8LgKn/jmMVU012xyyCcgZNlYM1yT7lyV
 LARQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692451695; x=1693056495;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g2/eTmeGLIHBF7FLb+vCfZlq5lr8O3DMbn1/hvnwEr0=;
 b=G1dHPReZVHuqzUpCoFSrbakpfRpGeSe/lcxmcmWmNNJOEFBhJwRP8dqwA5eZKy2DHM
 FkhbIf4n6OyiqE5YLK0/ui193LKq/7+3WhLeUZ6ypwt31EBmaewZMBZtyWt5EMM7Lfpt
 pEWG8n1h43B/JxoBwJkFQwDGjrL5oGDSylTGYriOGZeKDkpcuD6bf1TXaEtriBMN4h3s
 3A6c/VALViBRUyf4g9Q3DcpofmkZnuSbhQwVgTLWlhqC2om3ahiAZOAZqynh0RSHFfrZ
 WBg31L2M/zSETb3FJoGPFdP4EeG+icRUkwMEGjMj7YlIrvgt48nmp9OKIb5apaLPme7F
 G1tA==
X-Gm-Message-State: AOJu0YwPGr7erT48EFomk6+XzVdSBzZGNZtkzk0wsYICXYC5CkR/9O27
 qU/vIozb8ZYhG5yH+ujpW5pCeg==
X-Google-Smtp-Source: AGHT+IEY+//SQa8zNcZTsTQw8ncQ3H3DK6JEfU+cLSw3MgnGMw7CEFSFaX3ge9tNUR78sO6+c880Uw==
X-Received: by 2002:a17:906:3287:b0:991:fef4:bb9 with SMTP id
 7-20020a170906328700b00991fef40bb9mr1393127ejw.58.1692451695295; 
 Sat, 19 Aug 2023 06:28:15 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
 by smtp.gmail.com with ESMTPSA id
 sd20-20020a170906ce3400b0096f6a131b9fsm2710140ejb.23.2023.08.19.06.28.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Aug 2023 06:28:14 -0700 (PDT)
Message-ID: <18f41262-97fc-9346-7d77-32d914cf3b24@linaro.org>
Date: Sat, 19 Aug 2023 15:28:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v8 3/7] dt-bindings: display: bridge: Add Cadence MHDP850
Content-Language: en-US
To: Sandor Yu <Sandor.yu@nxp.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
 vkoul@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
References: <20230808083243.3113192-1-Sandor.yu@nxp.com>
 <20230808083243.3113192-4-Sandor.yu@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230808083243.3113192-4-Sandor.yu@nxp.com>
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
Cc: oliver.brown@nxp.com, alexander.stein@ew.tq-group.com, sam@ravnborg.org,
 linux-imx@nxp.com, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/08/2023 10:32, Sandor Yu wrote:
> Add bindings for Cadence MHDP8501 DisplayPort/HDMI bridge.
> 
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> ---
>  .../display/bridge/cdns,mhdp8501.yaml         | 104 ++++++++++++++++++
>  1 file changed, 104 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

