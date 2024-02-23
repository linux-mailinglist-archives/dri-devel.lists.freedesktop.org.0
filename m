Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F8786114D
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 13:16:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EB1E10EBE3;
	Fri, 23 Feb 2024 12:16:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iwAAV5G0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B38D10EBE5
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 12:16:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4F0886176E;
 Fri, 23 Feb 2024 12:16:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02934C433C7;
 Fri, 23 Feb 2024 12:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708690563;
 bh=JCFDC8egWyXQb7HABdNFJAfvo0AUNIyjCWnepDQI21c=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=iwAAV5G0xRLinAtkNwS/UDub21NcNA/YD1kSoIhSJS+aJCIHz/rumU3D1Lenn5wnk
 HkGxD26tSsFekC+CXQG5DAxyM5Nzw7ypVnkoX0qMWTFo45T7vyZh1ulJdmcw6I6vSI
 UJ6q6aPRVM14waxuS1UmjG5fRjGbU95J8syQO6PWLp28QwLU5RigoqYeGbzTnehotR
 OZnD6ewlC3ECto1MNL2V+wyAZ3smxhQ8ivngTmijPejLtLKy0AU+B7T3E2jt7ju1IV
 UjCjpAXG60xgL49D4fBUMAYJ90iueYRNijtk1m0BQrN7+M/KilrjgPT1EIM/oblm0X
 /pGqEA5bFmyQw==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Linus Walleij <linus.walleij@linaro.org>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240217093937.58234-1-krzysztof.kozlowski@linaro.org>
References: <20240217093937.58234-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] phy: constify of_phandle_args in xlate
Message-Id: <170869055762.530534.10335046810476136989.b4-ty@kernel.org>
Date: Fri, 23 Feb 2024 17:45:57 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Sat, 17 Feb 2024 10:39:37 +0100, Krzysztof Kozlowski wrote:
> The xlate callbacks are supposed to translate of_phandle_args to proper
> provider without modifying the of_phandle_args.  Make the argument
> pointer to const for code safety and readability.
> 
> 

Applied, thanks!

[1/1] phy: constify of_phandle_args in xlate
      commit: 00ca8a15dafa990d391abc37f2b8256ddf909b35

Best regards,
-- 
~Vinod


