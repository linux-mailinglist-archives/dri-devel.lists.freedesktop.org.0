Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B60F863BD77
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 11:04:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 226E010E07D;
	Tue, 29 Nov 2022 10:03:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C18010E07D
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 10:03:54 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id b3so21695086lfv.2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 02:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=w8n8D5c9i03T8w2DDSgaYVMzXubZeJqpt2MAW25kmIg=;
 b=HRtWiQKUFFTdbrqkcKHRYxOB1I0UGjnOG4GbWcj/qhFiH7Vc5lkfZTJszmpGs/IQP8
 4AMLtOOTNFyWyfjhHtkJ6/VQSodkY23rkZptjWBsTn86HxfgjjMDwgs++hgcZf5KY+CS
 iP5OJMm7RB1iFp3zBbFxGLSHWqiiuwhjRE7uHgQTgBzf3tfMBKS0gbbdfvtkGDOreFEX
 fecpJXsQZ4wWnqyRUDQHyLeYgF9aIVHzkUI/CH/NFGAmixBnJ+HNmNQ0bRGeZHImU/S0
 9VoSCxkY1WAQNxZdhfKAMc9sRDmJvjlOeWTx6gsgITxvBYd7uVEwDqHyyljAMlB30si6
 aCqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w8n8D5c9i03T8w2DDSgaYVMzXubZeJqpt2MAW25kmIg=;
 b=n4Xll8TvxlE/xWmffJaIhNL31Nvz4L9OS2XKTHiQ91zgwcdEJAW/dYE591+DP0WI0l
 ZouJURBHeBuwoEMZFyOZKjkBHriyFnqhpwIIP7Q8159H3f/nlAMhSpO+Gk/F2Na8Py9v
 i8dL2hO34K+Nm69p4HFBBGKyMsddZu5e6FYQDYDncG/xiDhT7LYUZZkmyqMkyl8bWMkV
 w/++dxPqMKvwJzMDuFaXvIW+Gzk7Sk2MrceJZfPRc1mHoXGqYdnhJLE2CD08yE4JugSq
 6MU7u37gS+qysZEZzhRX9QHm7GZTaQqDXy9DvqSKvV1G2UP5/FbH/BnJSsTimM+5PqT1
 Cy9w==
X-Gm-Message-State: ANoB5pndLEI1vWbdGR2qEBzYFKGpqq8p0EaNEaVqDO5oXP4w0HtGBXYb
 KF/oQIrY8eEcsVfCr1QG0EuD5Q==
X-Google-Smtp-Source: AA0mqf4NtG+py5H+BteIqF8gMqKK2u157ejZXaq8Zx9QLVlyLtKmJyZV9BFwIQn3S4lYJrdyVVTSGg==
X-Received: by 2002:a19:9113:0:b0:4b1:e3ec:d99d with SMTP id
 t19-20020a199113000000b004b1e3ecd99dmr12765707lfd.95.1669716231318; 
 Tue, 29 Nov 2022 02:03:51 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 o17-20020ac25e31000000b0049465afdd38sm2150135lfg.108.2022.11.29.02.03.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Nov 2022 02:03:50 -0800 (PST)
Message-ID: <9975ae10-8477-b72a-9d55-bb31e73f6b2c@linaro.org>
Date: Tue, 29 Nov 2022 11:03:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v1] dt-bindings: display: Convert fsl,imx-fb.txt to
 dt-schema
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20221110094945.191100-1-u.kleine-koenig@pengutronix.de>
 <20221116174921.GA25509@pengutronix.de>
 <2b0463c1-7fee-b7f0-5cf7-0448a6aab4a7@linaro.org>
 <20221128174232.irad6caswhz2y2jk@pengutronix.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221128174232.irad6caswhz2y2jk@pengutronix.de>
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
Cc: devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/11/2022 18:42, Uwe Kleine-König wrote:
> So I'd go for putting into the legacy binding what is currently done in
> arch/arm/boot/dts and the driver allowing exactly:
> 
> 	compatible = "fsl,imx27-fb", "fsl,imx21-fb";
> 	compatible = "fsl,imx25-fb", "fsl,imx21-fb";
> 	compatible = "fsl,imx21-fb";
> 	compatible = "fsl,imx1-fb";
> 
> I thinks this is accomplished using:
> 
>   compatible:
>     oneOf:
>       - enum:
>           - fsl,imx1-fb
> 	  - fsl,imx21-fb
>       - items
>           - enum:
> 	      - fsl,imx25-fb
> 	      - fsl,imx27-fb
> 	  - const: fsl,imx21-fb
> 
> right?

Yes, looks correct.

Best regards,
Krzysztof

