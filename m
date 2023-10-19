Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D99B77CF34F
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 10:54:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 280B310E1DB;
	Thu, 19 Oct 2023 08:54:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5760510E1DB
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Oct 2023 08:54:34 +0000 (UTC)
Received: from i5e861907.versanet.de ([94.134.25.7] helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1qtOnR-0001vg-Dr; Thu, 19 Oct 2023 10:54:25 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Chris Morgan <macroalpha82@gmail.com>, linux-rockchip@lists.infradead.org
Subject: Re: (subset) [PATCH 0/5] rockchip: Add Powkiddy RK2023
Date: Thu, 19 Oct 2023 10:54:21 +0200
Message-Id: <169770556939.1297560.13095304413651630727.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231018161848.346947-1-macroalpha82@gmail.com>
References: <20231018161848.346947-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org, sboyd@kernel.org,
 sam@ravnborg.org, mturquette@baylibre.com, sebastian.reichel@collabora.com,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>, linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 18 Oct 2023 11:18:43 -0500, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add support for the Powkiddy RK2023, which is extremely similar to
> existing devices from Anbernic.
> 
> Chris Morgan (5):
>   dt-bindings: display: panel: Update NewVision NV3051D compatibles
>   drm/panel: nv3051d: Add Powkiddy RK2023 Panel Support
>   clk: rockchip: rk3568: Add PLL rate for 115.2MHz
>   dt-bindings: arm: rockchip: Add Powkiddy RK2023
>   arm64: dts: rockchip: add Powkiddy RK2023
> 
> [...]

Applied, thanks!

[3/5] clk: rockchip: rk3568: Add PLL rate for 115.2MHz
      commit: ccf59682a0287b81015dc1939203fac70b818c6b

I've gone forward and grabbed the PLL rate already, so it
can go together with the other rate addition from the fixes
series.

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
