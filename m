Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C454F7A77AE
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 11:36:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5278210E2AE;
	Wed, 20 Sep 2023 09:36:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3218910E2AE
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 09:36:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 19324CE1AAA;
 Wed, 20 Sep 2023 09:36:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29C12C433C7;
 Wed, 20 Sep 2023 09:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695202604;
 bh=QvrfuDunGeVeEzTT0m7V7qM30d5sUcAJp/nuSRoA/Kw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=QdA1dIKg00oVg/Tj4DG0pqitCVasDs/Wfzz1pmVVUrFxCqOFNFq+rrzIkZnS4JT4w
 abqTNCAEkvI3Fmv0kF4DI3Qvh5Qbk/TZBx2spbFLJ1EANyqTsg4//fkpwtCVed1V+S
 eWKWmdU98GAMfD8baYyoe7RMo5Q5oPdaIL8fXrI5FXZWeVuTVa4KJC1jvrrWjROGF4
 3p8qz7ZVv0Ru6+0F7F/3bnxtEGw7avECx9YrNwNEhcVWav0ubrGOJAT0i9boUZTCkG
 m7ynqHyfLU6eBbPJMIj+S45/BYpZhRhW/ksj8/qq0iHH9IIHsN1DG+imqr2y1WjNTB
 PLnMvIH0FWn/w==
From: Lee Jones <lee@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Lee Jones <lee@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Alex Bee <knaerzche@gmail.com>
In-Reply-To: <20230829171647.187787-2-knaerzche@gmail.com>
References: <20230829171647.187787-1-knaerzche@gmail.com>
 <20230829171647.187787-2-knaerzche@gmail.com>
Subject: Re: (subset) [PATCH 01/31] dt-bindings: mfd: syscon: Add
 rockchip,rk3128-qos compatible
Message-Id: <169520259990.3354839.11054139849766032688.b4-ty@kernel.org>
Date: Wed, 20 Sep 2023 10:36:39 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Elaine Zhang <zhangqing@rock-chips.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-phy@lists.infradead.org, Johan Jonker <jbx6244@gmail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 29 Aug 2023 19:16:17 +0200, Alex Bee wrote:
> Document Rockchip RK3128 SoC compatible for qos registers.
> 
> 

Applied, thanks!

[01/31] dt-bindings: mfd: syscon: Add rockchip,rk3128-qos compatible
        commit: 4c57b25b09932acf81ead78bd32019fc5d0ea913

--
Lee Jones [李琼斯]

