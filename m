Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F67E73C9F1
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jun 2023 11:13:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6404F10E18B;
	Sat, 24 Jun 2023 09:13:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F07A10E174
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jun 2023 09:12:58 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-51cff235226so1058798a12.0
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jun 2023 02:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687597976; x=1690189976;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vchTo0Ol++OLJmq7HkKHErizaURF3xHVTmmMX3ficGE=;
 b=lbMMOlNVSXG7UBvaMUImfSKH7/n6r6Ndl26O12IO6VUdAMh57hAh7TKLUcTQEmzW4z
 8qiviylmAklg5Zgk6kOOVYxUQCvuwmfjxlWR6KoxtUAX+Knh/p/GPT1DhyXmednt/n/b
 XFGWInS0/evgU+4t6VgZJMb5EWyrhwzut3lhcxOnLtNPn6tWeOOijFaxiKqfCoeuO/ph
 r6uzYWtZfjHw6J3donHZpDZT2yNsyrY8auaWHd+eelL363XvSEcKaUJBRm+3FCJFZKaL
 y5nTgBhsjWwFCZ7FCLvn/39YP3rvOVIGdLD+RuJCPk9TREWL+Izhl6x7Q8gWxH2/SJ29
 a1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687597976; x=1690189976;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vchTo0Ol++OLJmq7HkKHErizaURF3xHVTmmMX3ficGE=;
 b=BN5Dhb1zmkDJRiycCK6aakCp3k4EbWvdvFh0qk2WJ5ZKa7uskEa+LNY/BdrCbCLiVd
 74/dHvvcIyJpipHd1c20E5EyeFiMumvDDy+Z73L3VXDhZQQBhD4IZTWYjVrUeP4u2e9T
 DVWBb0KORb8jDQOm7K9XclfNWxzSLlhBtfb31xj0w8Z6AFLy4JEZp8TPirlUtzUZ/Nvn
 ZTMzzb0pghsbw+uwhEFcIU+uYrwoMRPcM+9wBtx+Br4+uJs9RwFw3xpnTQEJ57kPn1MH
 wBDe3XXwI/NSbZITK70K5EVxhK2ssJmcTQp6CEeCS/QzPIfTWTtweZ5cy4BcTa3SD7i8
 CosA==
X-Gm-Message-State: AC+VfDwm0qWGWniyQfA5qW8M74XlQPOsJ7rADLtYDCCA1VlyIMwRekGM
 28s1N8IsOHSEO1ORJTxnLowiYg==
X-Google-Smtp-Source: ACHHUZ6HroITc5YdkUcavz4MKFxBB8L412c78SNrFWbnl1gdMQWQ0zgOQinmNiUzqMWS9McYR20j2w==
X-Received: by 2002:a05:6402:35c5:b0:51b:fd09:9ec1 with SMTP id
 z5-20020a05640235c500b0051bfd099ec1mr2819074edc.0.1687597976653; 
 Sat, 24 Jun 2023 02:12:56 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 i4-20020a056402054400b0051a318c0120sm461301edx.28.2023.06.24.02.12.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Jun 2023 02:12:56 -0700 (PDT)
Message-ID: <6bbf239f-d530-2f1e-ff52-361f7c9cc951@linaro.org>
Date: Sat, 24 Jun 2023 11:12:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 06/15] dt-bindings: display/msm: sc7180-dpu: Describe
 SM6125
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
References: <20230624-sm6125-dpu-v1-0-1d5a638cebf2@somainline.org>
 <20230624-sm6125-dpu-v1-6-1d5a638cebf2@somainline.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230624-sm6125-dpu-v1-6-1d5a638cebf2@somainline.org>
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
Cc: devicetree@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Lux Aliaga <they@mint.lgbt>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/06/2023 02:41, Marijn Suijten wrote:
> SM6125 is identical to SM6375 except that while downstream also defines
> a throttle clock, its presence results in timeouts whereas SM6375
> requires it to not observe any timeouts.

Then it should not be allowed, so you need either "else:" block or
another "if: properties: compatible:" to disallow it. Because in current
patch it would be allowed.

Best regards,
Krzysztof

