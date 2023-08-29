Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9C978CB0C
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 19:20:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DEC510E487;
	Tue, 29 Aug 2023 17:20:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63DE910E477
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 17:20:40 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2b962c226ceso70833471fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 10:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693329638; x=1693934438;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2gJh7hh3Cv4MKGAYWWiEyZbDkr75Vxh68gw9dOhliEo=;
 b=svFv/Z9pr7z+fE96FtSY4wNw5Qa2yWz9MMDZgo8e5txPC7jOPprZ+/VfkDOhO9+5ff
 JZbANOmLFqeO8HbS9PoJbKb8b3ziDDnQyTUOlfVWdJ5IBXengbnaH+UBjH1U6aFAEsWo
 H0F44cpGBCVK18gmBV0dWJi1qVfi3txaFE2I4YM9onDQB2OfMS4VTVoCQQQJgZhD8dhi
 aq57PQjk/nBpwCbPwjSHfVxNMRTfNVqOiqu600sz3+nNxjjDIs7GU6nLF0fFWuOKdgm4
 k2Nj6XlyP0xiztq8gbA+3vi2kXSKxd4ze0yumQ8Hz9IDWAknT7KaS9nXgckiNRTMnjdh
 HJRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693329638; x=1693934438;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2gJh7hh3Cv4MKGAYWWiEyZbDkr75Vxh68gw9dOhliEo=;
 b=l7yCBVTWCne+hq3/JO0XeaaiWLaG6SE2sZtzfJWWt30Mo6hR8aM0FESKpBD5CDqOK+
 19wpNCjSdDeqJtiHyixLJ1znaJcRoa46Tk2a6/mtcOcJD2rp/IMQmbWPlvJ86tnudzMw
 qOvZ6zXbNS1eTVxpE9z++kJN118yaXVR0vRcUihKeLpx6tbWavTlDmys3MC3M91lQAbq
 UpelIzYR/1x+HugBBxPhiG/MYMpRVrtVf6lL5HqjvUlPS1WjkNiSUbDwtnFC5MEEDgqP
 tHclgcX2aa3Mp+Gu/XP6EMxaSHA9qM4AjeHs1K930VsaC7hcCkaQ5xoKS9qdGH/XG/hB
 77vA==
X-Gm-Message-State: AOJu0YxI210ae3DnPTp5hOR7erhSNAp8xf95UKioopV2dbo771rDuzCG
 L8TMmvIy4ly2l/cxDy1L6J3Q9Q==
X-Google-Smtp-Source: AGHT+IGlVnUWA48hZ1fV2ZgoaAUWDkmNEboaK1aSOxLC5DhzgZm2KyvX6J5uG+IbCKz7WrZM5DcSfA==
X-Received: by 2002:ac2:4985:0:b0:4f9:51ac:41eb with SMTP id
 f5-20020ac24985000000b004f951ac41ebmr17504153lfl.16.1693329638491; 
 Tue, 29 Aug 2023 10:20:38 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.196])
 by smtp.gmail.com with ESMTPSA id
 u18-20020a1709064ad200b0099bc08862b6sm6299274ejt.171.2023.08.29.10.20.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Aug 2023 10:20:38 -0700 (PDT)
Message-ID: <20308990-0701-6dae-a5f3-b0c5d6cccbe4@linaro.org>
Date: Tue, 29 Aug 2023 19:20:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 01/31] dt-bindings: mfd: syscon: Add rockchip,rk3128-qos
 compatible
Content-Language: en-US
To: Alex Bee <knaerzche@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lee Jones <lee@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
References: <20230829171647.187787-1-knaerzche@gmail.com>
 <20230829171647.187787-2-knaerzche@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230829171647.187787-2-knaerzche@gmail.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Elaine Zhang <zhangqing@rock-chips.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-phy@lists.infradead.org, Johan Jonker <jbx6244@gmail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/08/2023 19:16, Alex Bee wrote:
> Document Rockchip RK3128 SoC compatible for qos registers.
> 
> Signed-off-by: Alex Bee <knaerzche@gmail.com>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +

You should probably split patches per subsystem, if you want it to get
applied.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

