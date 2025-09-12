Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C372AB55063
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 16:06:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C459610EC55;
	Fri, 12 Sep 2025 14:06:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jzznp34s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46A7110EC63
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 14:06:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 087D543BA8;
 Fri, 12 Sep 2025 14:06:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3BA2C4CEF1;
 Fri, 12 Sep 2025 14:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757685979;
 bh=gQYcfi405JQ9buqQxkTP7o9NnD/8vJsE/3UdfYC31Vk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jzznp34s7YFwrDjEEJkZ6iekjTLnPUhXzJLoPxBZyYG7N5CYK4W0PMCRqN5AARwKl
 VymP7CBqTch6oU3Dxu+8CbAWzZ0kIqydRCrxLBhWWMw1bhQ7Z0t2YuRuWT8PhZMYIS
 Kfz1cNTv0+6uUTVt0rhcsIvu+8XBwwvlvJbDRBPtUXZi6WaKHo+fJ4EgKll7QJ1KOo
 UF6gaG8l5++/aG16KdKtx01G+jonZrF4pNSs9q4TWqU3ki3ZkruTpdg/M5gSykWMLS
 gn47pNV+L6Wki7pJ42z98l/YWp8hyHWCGWhDKKhEbjU7tW/W+1B318r/PjuvYKi3cx
 6YB8Oj981CRLQ==
Date: Fri, 12 Sep 2025 09:06:19 -0500
From: Rob Herring <robh@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch,
 andrew-ct.chen@mediatek.com,
 angelogioacchino.delregno@collabora.com, broonie@kernel.org,
 chunkuang.hu@kernel.org, conor+dt@kernel.org, davem@davemloft.net,
 dmitry.torokhov@gmail.com, edumazet@google.com,
 flora.fu@mediatek.com, heiko@sntech.de, houlong.wei@mediatek.com,
 jeesw@melfas.com, kernel@collabora.com, krzk+dt@kernel.org,
 kuba@kernel.org, lgirdwood@gmail.com, linus.walleij@linaro.org,
 louisalexis.eyraud@collabora.com, luiz.dentz@gmail.com,
 maarten.lankhorst@linux.intel.com, marcel@holtmann.org,
 matthias.bgg@gmail.com, mchehab@kernel.org,
 minghsiu.tsai@mediatek.com, mripard@kernel.org,
 p.zabel@pengutronix.de, pabeni@redhat.com, sean.wang@kernel.org,
 simona@ffwll.ch, support.opensource@diasemi.com,
 tiffany.lin@mediatek.com, tzimmermann@suse.de,
 yunfei.dong@mediatek.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-bluetooth@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH v2 03/12] dt-bindings: net: Convert Marvell 8897/8997
 bindings to DT schema
Message-ID: <20250912140619.GA1293647-robh@kernel.org>
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
 <20250911151001.108744-4-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911151001.108744-4-ariel.dalessandro@collabora.com>
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

On Thu, Sep 11, 2025 at 12:09:52PM -0300, Ariel D'Alessandro wrote:
> Convert the existing text-based DT bindings for Marvell 8897/8997
> (sd8897/sd8997) bluetooth devices controller to a DT schema.
> 
> While here:
> 
> * bindings for "usb1286,204e" (USB interface) are dropped from the DT
>   schema definition as these are currently documented in file [0].
> * DT binding users are updated to use bluetooth generic name
>   recommendation.
> 
> [0] Documentation/devicetree/bindings/net/btusb.txt
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
>  .../net/bluetooth/marvell,sd8897-bt.yaml      | 79 ++++++++++++++++++
>  .../devicetree/bindings/net/btusb.txt         |  2 +-
>  .../bindings/net/marvell-bt-8xxx.txt          | 83 -------------------

>  .../dts/rockchip/rk3288-veyron-fievel.dts     |  2 +-
>  .../boot/dts/rockchip/rk3288-veyron-jaq.dts   |  2 +-
>  arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  |  2 +-

.dts files should be separate patches. Please send the bindings patches 
separately per subsystem so subsystem maintainers can apply them. All 
the Mediatek dts changes can be 1 series.

The schema looks good.

Rob
