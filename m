Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0903C7120C9
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 09:22:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A6BE10E7A5;
	Fri, 26 May 2023 07:22:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CE0910E7A5
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 07:22:16 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-309382efe13so197180f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 00:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685085734; x=1687677734;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=quLuDrImAY4dEXMU5Crf4TapiE3eFiJnHWi9mJIE9Zc=;
 b=u7LIE4uCUGqqsAaj7BYUZivMeOFoTG9VAIYRkFSGFI8fqidD4WwZNBbs8stj+XgFIH
 +Equ+MNb4C1+popYKd2y73amoQq8ocKI+4z7e3aTtJabw5JvkBGJ3+znwLw8I/ecTvoS
 J1bF2+OEGXSea0uA9CkGLaYsKYphMtpkj4Upj6OJSEf2ag5UtTHXyIaPsC4vs0HJAf/f
 4iDfmH0Swe1SVm3xfpa6Jhcg3VO0Bf4loFHdjPatH+ZWPWugMPM6j1x5tC7JhKnB0TSm
 pXgY68/NjwpVl7XfR/9FlMJXy47gcNJrBs38dE2SKcBS1I+DY4snTQkvOwO50cqIX+/I
 QwIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685085734; x=1687677734;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=quLuDrImAY4dEXMU5Crf4TapiE3eFiJnHWi9mJIE9Zc=;
 b=dzTUFi7yudFyMNDX8K3SighYrV2Cywe9RFl33ciO7A4ZE7ARoY6L2Is8Bancc/7Uwj
 PcVVAPntprqx1CTABtX1QXa+wSRQo9H8CGfTx1ULxndDUrjoHpZ3+kpK4TgWSZwJpfa1
 pK7DG0/EIJu4H6bVoCjDX1sjAN+a8PaoNqIyOOr+6ImmIFaaopQyyum9i+fk7LfWhyAl
 XlGWB4Sm1UVczl7YtmjZjyjdkX4qdsWE1Ey3/dGP/1YfajqEYUyGOvZJD1NBxYFx35Yh
 VrY1l+YzTLd0sZ2C9dmBK6IdCpY5oagXbtrDIF3vUCSE1l0A5OSpThDPfFDw4JCN6dAi
 nQdQ==
X-Gm-Message-State: AC+VfDweauk9g51O2LsAOWYUcZQ6rXkBcIv35XVFYiGw2Nealw2lkXdZ
 WYgaRAjAAT47unQq74o4rrzQ0A==
X-Google-Smtp-Source: ACHHUZ43Tr6ndY2wriomk6kcW8y+kKoegz3Q5DAUm3qWY6LzjvyaHCQbP0D0ugRAxLQWqwCOrRwvhA==
X-Received: by 2002:a5d:45cf:0:b0:306:2656:66d4 with SMTP id
 b15-20020a5d45cf000000b00306265666d4mr593949wrs.58.1685085734423; 
 Fri, 26 May 2023 00:22:14 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 r6-20020adff706000000b0030903371ef9sm4115935wrp.22.2023.05.26.00.22.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 May 2023 00:22:14 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, Adam Ford <aford173@gmail.com>
In-Reply-To: <20230526030559.326566-1-aford173@gmail.com>
References: <20230526030559.326566-1-aford173@gmail.com>
Subject: Re: [PATCH V8 0/7] drm: bridge: samsung-dsim: Support variable
 clocking
Message-Id: <168508573345.1449766.11809947722851001124.b4-ty@linaro.org>
Date: Fri, 26 May 2023 09:22:13 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, aford@beaconembedded.com,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Rob Herring <robh+dt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, 25 May 2023 22:05:52 -0500, Adam Ford wrote:
> This series fixes the blanking pack size and the PMS calculation.  It then
> adds support to allows the DSIM to dynamically DPHY clocks, and support
> non-burst mode while allowing the removal of the hard-coded clock values
> for the PLL for imx8m mini/nano/plus, and it allows the removal of the
> burst-clock device tree entry when burst-mode isn't supported by connected
> devices like an HDMI brige.  In that event, the HS clock is set to the
> value requested by the bridge chip.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/7] drm: bridge: samsung-dsim: fix blanking packet size calculation
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=a617b33f7e513f25becf843bc97f8f1658c16337
[2/7] drm: bridge: samsung-dsim: Fix PMS Calculator on imx8m[mnp]
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=54f1a83c72250b182fa7722b0c5f6eb5e769598d
[3/7] drm: bridge: samsung-dsim: Fetch pll-clock-frequency automatically
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=33d8d14c83bf67aa0d262961a6fda9c40f3c1052
[4/7] drm: bridge: samsung-dsim: Select GENERIC_PHY_MIPI_DPHY
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=171b3b1e0f8b8c894f2388e1cf765a56f831ee5e
[5/7] drm: bridge: samsung-dsim: Dynamically configure DPHY timing
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=89691775f5735fca9dc40e119edcbb52a25b9612
[6/7] drm: bridge: samsung-dsim: Support non-burst mode
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=bb0e13b9e223b218c9f242f8d340a332b4381042
[7/7] dt-bindings: bridge: samsung-dsim: Make some flags optional
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=cfaf76d349837f695c8aa6d7077847fec4231fe5

-- 
Neil

