Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EFA84C938
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 12:09:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30A3F10E957;
	Wed,  7 Feb 2024 11:09:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ofNieulp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3C8E10EDB2
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Feb 2024 11:09:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2B24E6182E;
 Wed,  7 Feb 2024 11:09:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ACC1C433C7;
 Wed,  7 Feb 2024 11:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707304147;
 bh=91DCFeQ7d3VJjnWv7geoiac+u+Qyv8mwJMlI/ARZNSg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ofNieulp1lv7S4WEoCoFFOejsfQCM/0UFI4LnmKrztj2CzYKy54049p3ECwmmLtzg
 6BybZv6ROFqk3ejU0udD8uy0/peDzW+S8QdpKyiPYGE06/zu2xb9hSfRjaVvcJjP/Z
 hlCazkBchNnA9ZRu5AFr8KyI4QItkouKcSImzUq+T4QNl9PBp/evBpM553rKPk20eu
 S02Z1qtzt0eIcUdqagCdaR9RhXEUCigJ2OydxW9sSHXuQjCdpsCENcnSl/ZnDrw8rX
 nGjFtjcQSECzWYySlTaZAFXUrUsLVriI26BAIKhTqO33DX8iiDRgbSnN42OpOjROhr
 FiH50pSostpDA==
Date: Wed, 7 Feb 2024 12:09:05 +0100
From: Vinod Koul <vkoul@kernel.org>
To: Julien Stephan <jstephan@baylibre.com>
Cc: Andy Hsieh <andy.hsieh@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v5 0/2] phy: mtk-mipi-csi: add driver for CSI phy
Message-ID: <ZcNk0VylU2mBsewy@matsya>
References: <20240111101504.468169-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240111101504.468169-1-jstephan@baylibre.com>
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

On 11-01-24, 11:14, Julien Stephan wrote:
> Adding a new driver for the MIPI CSI CD-PHY module v 0.5 embedded in
> some Mediatek soc, such as the MT8365

You would want to fix the way you send patches, the series is disjoint.
I had to apply them manually, but please fix your process

-- 
~Vinod
