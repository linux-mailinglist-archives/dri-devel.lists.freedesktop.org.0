Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76AAE764824
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 09:12:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A2E310E4F7;
	Thu, 27 Jul 2023 07:12:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7734010E50A
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 07:12:05 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9923833737eso72710266b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 00:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690441924; x=1691046724;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vZq2MeivEqSHRkBO/qVMzQytuDJ9NC8npO5moiygy8U=;
 b=k4j8Q5+eKCeNG368L0gpCrKFo7yFuKjNXIuV6rpNdzHK6o/JQ0yMlVaOWytInQkDge
 kekMA5dZz6m054Ew3nUAJG3w2u3Icojle2rdTT2l29r7Z5+qaQDL9+uZyZIhKWjFyne7
 NmjwBFSPfwRvnfaC436oKBIj13SHkQA+IlRtzPAsnO3K0pFgx4dEFQ03xGubi6zJ18ra
 cVdQFw3ULv+ALkublIl29FsjGoSwcLjrOToJLOkY9lQCpWZsK007KAY9WvSIwq9pd/FG
 ra3Qj8wwyv1y//OIldlrc6Gtsct3XpY1XaFw9qqbgp83goyMIpeidHU/5GQAyUe5R28n
 y5vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690441924; x=1691046724;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vZq2MeivEqSHRkBO/qVMzQytuDJ9NC8npO5moiygy8U=;
 b=JV8JbLUKzAKdZsl5L2Wp96sIxzf6OBpBhE6c5lLK6HR0infQZiPt95BQuo4KYQyskY
 syOvzhKskloi7WlUx9mRBPvzG6OAL6mi/eFpQB2KS2yTPX+qdBFa26FHK2yZkspPIYku
 HOubjTJurHTLZnUvyH72zKOq/J3tt3haMpQi8TaQEd45okZRkhYjuv0H9j2+kKKCk3QY
 lHskddbMQ6Owo1FyuTNze6ybvHgsqbiJ8xLUkQGAOEG4KHa+TtLhuU3rw5syuYRYJAF9
 Qv9Cd+YY1YKbQbPD2bYrRwUyAp684O3qatFnQt+hocJ6hdjFZ77Ev6XZ1MtE6JJxu4e+
 zayA==
X-Gm-Message-State: ABy/qLY+sZ2ESb1PAgLcXr/8MdKcAhXcyW825w+2Jm+p0WwCuEcgprGf
 ksiQITHkrflgPgVUyvRd3GNXbA==
X-Google-Smtp-Source: APBJJlFygRKCjhls9utd0oUM+NPPuz/OCQskSU3O2UcGkRKWA2YdrnyWFdID9D2zwrd3Fy0S4O6tBw==
X-Received: by 2002:a17:907:761b:b0:99b:4aa3:6480 with SMTP id
 jx27-20020a170907761b00b0099b4aa36480mr1383272ejc.40.1690441923907; 
 Thu, 27 Jul 2023 00:12:03 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
 by smtp.gmail.com with ESMTPSA id
 x20-20020a1709065ad400b00988be3c1d87sm411792ejs.116.2023.07.27.00.12.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jul 2023 00:12:03 -0700 (PDT)
Message-ID: <8a48118e-8f86-1506-e93a-0223981809d4@linaro.org>
Date: Thu, 27 Jul 2023 09:11:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/3] dt-bindings: display: panel: Document Hydis
 HV070WX2-1E0
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20230726185010.2294709-1-thierry.reding@gmail.com>
 <20230726185010.2294709-2-thierry.reding@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230726185010.2294709-2-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 Svyatoslav Ryhel <clamor95@gmail.com>, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/07/2023 20:50, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The Hydis HV070WX2-1E0 is a 7" WXGA (800x1280) TFT LCD LVDS panel that
> is one of the variants used on Google Nexus 7.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  Documentation/devicetree/bindings/display/panel/panel-lvds.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

