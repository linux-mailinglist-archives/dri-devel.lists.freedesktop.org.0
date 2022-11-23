Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C546359B8
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 11:25:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D568610E538;
	Wed, 23 Nov 2022 10:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F61810E53D
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 10:24:55 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id x21so20821459ljg.10
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 02:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z2cZ2aGvz+KFwNkBLj5Eji6CLqnLqwcqLWGZReHxQoo=;
 b=tccV9u0DPOr7WGHaeW7SHV7zoLGrY+IccG2qq+rPFQuqHwLHQPSTKvIQal19aGStQS
 qFuS0TCuUZbKwURtutPUto8/iBsAVhSPMbolATkWfeAE288vQ2/1PjzJzIpouG09dAE5
 egZt69Z7OqqkLA8/BKMIE8YoGoKKb0nAMP5ppVPvVZPtjH3ZoaY/RTgcs3/hg2D+GxkY
 w0Q1PD3Tgaam+isXAgN7hIbbMUV3kDAIQFYtp97WK4jvOvzE8XgtTHHN5YMIf11YkmAS
 nNQ04rpP0i3riYxq7Vqe32Qr4Q6JQClc+92LYISNzEw4ng6mgRNUAhdDXDzMcV5xBi0s
 Rn8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z2cZ2aGvz+KFwNkBLj5Eji6CLqnLqwcqLWGZReHxQoo=;
 b=jVII99XAb95JjGmX7LAOV/W82JPJOwwQ22408Sbl1Z1tBQipO8aBJ7faI4bHPM6gbC
 S0+yNaJtYbTFlG/RUEEXwVtBItgAdMOpgfGeXTidCoGg8vKZ8Uis2mPp+OYNF+nvFVqL
 Ig8a2J3sTn3gPPXVv3Wx0Q00BXuxeL+oVRAW53DXar7UylXmGtXWP6PxOmzNe1ZH2bQJ
 o0f7l6Qh2tQ+wO+B0J9RlJBC7O9fmL+d+eSNh2O9nHqWqrgFlJqGB3WIFUi+zKNJyN+S
 /TW5q1fNYzPJEDjFv9LOtZi3RZmML9P3izOBLTbJlhNmDnvTh6TGZ6R1n9a6V4fxazKB
 E8fA==
X-Gm-Message-State: ANoB5pnZ//BvCepujCX152USUOsexXglDNGeF2d1RTvS84yV7wyocrq6
 Y8DrRxWX8TinFx58oSc+EVYqbQ==
X-Google-Smtp-Source: AA0mqf56iGGSkxj6TllkNQuinXzUirCmomHmNOpMWrybBSVRIH2xAEjCe0t5105VGr4MUVvDU2OuHg==
X-Received: by 2002:a2e:6d02:0:b0:279:4a4a:ca9d with SMTP id
 i2-20020a2e6d02000000b002794a4aca9dmr4481353ljc.27.1669199093716; 
 Wed, 23 Nov 2022 02:24:53 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 u26-20020ac248ba000000b004abc977ad7fsm2843143lfg.294.2022.11.23.02.24.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Nov 2022 02:24:53 -0800 (PST)
Message-ID: <d7629871-1c29-e23d-1741-33714f187bbd@linaro.org>
Date: Wed, 23 Nov 2022 11:24:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v4 04/11] dt-bindings: display/msm: add sm8350 and sm8450
 DSI PHYs
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221122231235.3299737-1-dmitry.baryshkov@linaro.org>
 <20221122231235.3299737-5-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221122231235.3299737-5-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/11/2022 00:12, Dmitry Baryshkov wrote:
> SM8350 and SM8450 platforms use the same driver and same bindings as the
> existing 7nm DSI PHYs. Add corresponding compatibility strings.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Didn't you have here tag? What changed?

Best regards,
Krzysztof

