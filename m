Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9136861F413
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 14:14:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9585410E30B;
	Mon,  7 Nov 2022 13:13:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89DD810E30B
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 13:13:50 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 77F852B066D2;
 Mon,  7 Nov 2022 08:13:45 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 07 Nov 2022 08:13:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1667826825; x=
 1667834025; bh=gzFmsKb28RRV6aTHwSd32zSKbP4ruxh8B+/J4PqCwTo=; b=S
 ggAXxM9D+SbpZ9rMhVLLaSfq7m1uc2XpDznokcUUlsO+4Pb8qCBn+xRhhfN8jUgq
 FpF6AXLT1LhGrcfuqVl43MsGGn6vldVkgxjAc4YIIVWW2XLHpXYVq+7X7IX/auE+
 e0PGMe0CpQJzQsfkv9lqyt6TU5XFOGDatcHk2HpQ9RKMbMQLnkUw03BIXvnAmpf2
 xGDU+58haUwQU28zadYuwnNyDbmRx2WlaIv1LntuqKmQ66zxwQVizEC+SXsqbmTt
 yq7rviFdc9BMgtG0xrFi3rzKjzWMoGBapcHWvbT64szDrJUTADd4LM6Y93oiXllz
 JQ2S5LNmFm1GNRorb0T6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1667826825; x=
 1667834025; bh=gzFmsKb28RRV6aTHwSd32zSKbP4ruxh8B+/J4PqCwTo=; b=f
 OLaRc1MIcBUnZInXZHy7Qd8hVVUBFfwwre4WcjM6KmXZp0UrzawMSP2EzM9v2bMX
 tcLM9PKlu0y4X4+8AIC+JGFfQxU+Wd93vEfkv+/mbIBrDpKQPFDk8bgefiNu5cvG
 KpUmeqW4Az3JOK7LlZa8hxDRyRGiKrV2jzrQwcHvA/M+JVqo1d7JoHe24c7WxWQb
 1c6AeoUAmqqwy4q5PuVYhV/FaaZ7smqqUW93H+80RJQdUwJDg4Rwh3xytmWH/Woi
 tDynAfXCWwfByP2TMIg53vBds47UKVCV2vBqJpirsm5jG2JqebqlY2gnrhD2dHvw
 3q6Wa89noKriOmHFJ3eUA==
X-ME-Sender: <xms:iARpY5OY25HDymg5DH-ie89NFFuTQ_tpNB0zwPJ8RbtsIzZoIJnFdg>
 <xme:iARpY78kDs8Gr883aCcVhvgfUK6xpgBfbAOKwsQqUAF2xtSCHi-2f9Xtx0eTZc41F
 _7g0LMx9l886JLkdK0>
X-ME-Received: <xmr:iARpY4SXfVcoanuZ5ibDJKtkYKfQ49V2uumXyxiHcwJ21amOnrngvmIK7Iv8nm8nbgQfsKdLc-uwXY_hfF5RQAso8yV_eXwhClHps3t1eh1KrQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvdekgdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevjghfuffkffggtgfgofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeifeeigeelhfehkeeltdetjeetueelteeuveekueevffduhefffefhhfeh
 gfehieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:iARpY1uHLYE89zuPgzQmd72chgY8kQ3GD1WqVJD1cJL7Hotut9yW7g>
 <xmx:iARpYxcoJtYs6UFU90XrAM_A5pfR1NGKF8D2-rFcCY6eVlrWIezPiQ>
 <xmx:iARpYx1YXt67AV9nPn7Xl3rmQ5jQ5yQP_blhenTPP60saug38B0a3Q>
 <xmx:iQRpY0xjFrmpNgU4q9TdEM4obv-T2YBGFbrXMDqajko2HLPRF1EUUOC0kvQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Nov 2022 08:13:44 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
 Maxime Ripard <mripard@kernel.org>
In-Reply-To: <20221107053552.2330-1-samuel@sholland.org>
References: <20221107053552.2330-1-samuel@sholland.org>
Subject: Re: [PATCH v2 0/4] drm/sun4i: dsi: Support the A100/D1 controller
 variant
Message-Id: <166782681040.2738607.11879377629762805271.b4-ty@cerno.tech>
Date: Mon, 07 Nov 2022 14:13:30 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.1
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 6 Nov 2022 23:35:48 -0600, Samuel Holland wrote:
> This series adds support for the digital part of the DSI controller
> found in the A100 and D1 SoCs (plus T7, which is not supported by
> mainline Linux). There are two changes to the hardware integration:
>   1) the module clock routes through the TCON TOP, and
>   2) the separate I/O domain is removed.
> 
> The actual register interface appears to be the same as before. The
> register definitions in the D1 BSP exactly match the A64 BSP.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
