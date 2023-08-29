Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B4178CB6F
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 19:40:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85BD510E0B4;
	Tue, 29 Aug 2023 17:40:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E16210E0B4
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 17:40:51 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-99bfcf4c814so611268866b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 10:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693330850; x=1693935650;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2YNG7LD4K4KMxQp5UZSaL2MeLl8EFjm+UQ/TTjynihU=;
 b=KmEE7T5sialkQHA7uBm2PpWGs/ZGGqTq02s3Yw33ntN7nH7hF0rgTi6bhJcVRe0gUe
 n+7sXgY6R0X4sM3t9RrhSbtnj1wj7FIQhMmE+9XbqiOINprzleLlQnHZZBesnITHn/JB
 pvbJMvr+iOoS1qtKvP5amQio1ol8/VZSIUFHmJha+u/9YBBRjtawNb1iBqmCZTAI9U+6
 /EGo39TLk1NruxXYkr9na91s/mrhZkDa+aQcVrmEyH+0M/gX2m6YCGUWPJwRwuTNSud8
 Bh8WoteBLNLZbk9XMXJiCy0flgPIvNhFeKY9LCrheun1P9+mVwI9w0rCyGS3G9dzmVcQ
 dW+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693330850; x=1693935650;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2YNG7LD4K4KMxQp5UZSaL2MeLl8EFjm+UQ/TTjynihU=;
 b=aZDyXcCaUaIHFML9Duj0Ws8UcF3B0cRW2Px7wKddiHLTTVEnNJU0ynUQgKMWTDBOBo
 1gZq3QBnjQaSa2BLNUl06qyYNwMOjrqdyxvR+sIEEjH8H9yXhHC8VeIutp79gkhEmeFE
 FSsHVhq5yom1YV0hkz7FT+O1RJh/rtyiwbD+TjPwRKZoYylCTAfaACy/kG0BM69F+TKA
 Asx4JzjAKDbOVp8JPl5riIdv60XXDIQjjuhSKNyQrdbyWXgrdo/OY3ZDMrHZbpGzB7zP
 GFkOkNKmeEsZIWr+hWnPZ8K4hWXEwloM/cBDb8LfLmnAX9wNyUsEMJKppo6Xc43Lh9Es
 1/ZQ==
X-Gm-Message-State: AOJu0Yw4NJWeYJewGHDLGnzEhYwAdw7HcPcMSiPxlhZ5weS5jeHg3Fbj
 UqN5xkAiY87JsOtMbigs6wZFzg==
X-Google-Smtp-Source: AGHT+IEitwmwVk9+KoKIBEHpiME/Abb3aHzRC9tehqbQ93vUndcYPbpMcUZcdG971B60lRyMIL5+mA==
X-Received: by 2002:a17:906:256:b0:9a1:cccb:5429 with SMTP id
 22-20020a170906025600b009a1cccb5429mr17132480ejl.15.1693330849791; 
 Tue, 29 Aug 2023 10:40:49 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.196])
 by smtp.gmail.com with ESMTPSA id
 f17-20020a17090624d100b0099cb0a7098dsm6285502ejb.19.2023.08.29.10.40.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Aug 2023 10:40:49 -0700 (PDT)
Message-ID: <dc2f32d3-001c-746f-6dc5-58a2a6a4a8e6@linaro.org>
Date: Tue, 29 Aug 2023 19:40:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 05/31] clk: rockchip: rk3128: Fix aclk_peri_src parent
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
 <20230829171647.187787-6-knaerzche@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230829171647.187787-6-knaerzche@gmail.com>
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
 Finley Xiao <finley.xiao@rock-chips.com>, linux-phy@lists.infradead.org,
 Johan Jonker <jbx6244@gmail.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/08/2023 19:16, Alex Bee wrote:
> From: Finley Xiao <finley.xiao@rock-chips.com>
> 
> According to the TRM there are no specific cpll_peri, gpll_div2_peri or
> gpll_div3_peri gates, but a single clk_peri_src gate and the peri mux
> directly connects to the plls respectivly the pll divider clocks.
> Fix this by creating a single gated composite.
> 
> Also rename all occurrences of "aclk_peri_src*" to clk_peri_src, since it
> is the parent for both peri aclks and hclks and that also matches the
> naming in the TRM.
> 
> Fixes: f6022e88faca ("clk: rockchip: add clock controller for rk3128")
> Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
> [renamed aclk_peri_src -> clk_peri_src and added commit message]
> Signed-off-by: Alex Bee <knaerzche@gmail.com>

Please send fixes as separate patchset. Don't mix it with other work and
definitely it should not be in the middle of the patchset.

Best regards,
Krzysztof

