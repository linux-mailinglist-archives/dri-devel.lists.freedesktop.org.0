Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B65B979E3
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 23:48:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E5F410E1C0;
	Tue, 23 Sep 2025 21:48:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gPtHV0im";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ABF410E1C0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 21:48:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3A1006029B;
 Tue, 23 Sep 2025 21:48:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B63F5C4CEF7;
 Tue, 23 Sep 2025 21:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758664115;
 bh=ynSU1sjv/APhbJJAUkW92GPfKCAkcMDj27Y78DB5+JA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gPtHV0imNsUTP1wQzviVh4zQi3BxZ5/9R0MrNEIhtqcEaB/XUpHIKkKeRanyeehY0
 ievQlqwU2fZZUxcrIHQrV7w6FvObgnmnDdd72mY1KwpPiDV5r/F0fQ9+ksRhi/Xr8F
 uWlhIVqm6YSkGT2vYircLvEly2pCXJIHPJF6FMjpkEzH1H2herK4Njygc3EfE0lrL3
 ozpyW40XNqKw7fH7eq/7gsEIlJFf2Vr/ijD2RX5ii7SfLIKdyN2mPOP4BKWK/XqoB6
 yAYE6NoqRCOrl51Qu9pWtpQJ6IvHxKM1uhTLUVw8OMgZxIgorvSJ1zgyjRohNZMKx1
 8GX+dWpLaH69g==
Date: Tue, 23 Sep 2025 16:48:34 -0500
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
Subject: Re: [PATCH v2 00/12] MediaTek dt-bindings sanitization (MT8173)
Message-ID: <20250923214834.GC91441-robh@kernel.org>
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
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

On Thu, Sep 11, 2025 at 12:09:49PM -0300, Ariel D'Alessandro wrote:
> This patch series continues the effort to address Device Tree validation
> warnings for MediaTek platforms, with a focus on MT8173. It follows the
> initial cleanup series by Angelo [0].
> 
> Similarly to the ongoing MT8183 work done by Julien Massot, this patchset
> eliminates several of the remaining warnings by improving or converting DT
> bindings to YAML, adding missing properties, and updating device tree files
> accordingly.
> 
> [0] https://www.spinics.net/lists/kernel/msg5780177.html
> 
> Changes in v2:
> * Wrapped commit messages to 75 columns line wrap.
> * Replaced "YAML" by "DT schema" in patches subject and content.
> * mt8173-mdp: Fixed properties: compatible, clocks, iommus and
>   mediatek,vpu.
> * mt8173-vpu: Fixed line wrap. Dropped memory-region property description.
> * mediatek,mmsys: Dropped patch as it's not a binding issue.
> * mediatek,od: Rewrote commit log with details on DT schema users missing
>   the related property. Rewrote mediatek,gce-client-reg property.
> * mediatek,ufoe: Rewrote commit log with details on DT schema users missing
>   the related property. Rewrote mediatek,gce-client-reg property.
> * marvell,sd8897-bt: Moved to net/bluetooth/. Added missing ref to
>   bluetooth-controller.yaml. Dropped example. Updated reference in another
>   file. Minor fixes in properties.
> * mediatek,mt8173-rt5650: Dropped unnecessary quotes and unused label.
> * dlg,da9211: Dropped enable-gpios description. Rewrote generic example
>   node names. Minor fixes in properties.
> * melfas,mip4_ts: Dropped unnecessary quotes. Added "active high" to
>   ce-gpios property description.
> * mediatek,jpeg: Dropped patch as it doesn't apply.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> 
> Ariel D'Alessandro (12):
>   dt-bindings: media: Convert MediaTek mt8173-mdp bindings to DT schema
>   dt-bindings: media: Convert MediaTek mt8173-vpu bindings to DT schema
>   dt-bindings: net: Convert Marvell 8897/8997 bindings to DT schema
>   dt-bindings: ASoC: Convert MediaTek RT5650 codecs bindings to DT
>     schema
>   dt-bindings: display: mediatek,od: Add mediatek,gce-client-reg
>     property
>   dt-bindings: display: mediatek,ufoe: Add mediatek,gce-client-reg
>     property
>   arm64: dts: mediatek: mt8173: Fix mt8173-pinctrl node names
>   dt-bindings: pinctrl: mt65xx: Allow gpio-line-names
>   dt-bindings: regulator: Convert Dialog DA9211 Regulators to DT schema
>   arm64: dts: mediatek: mt8173-elm: Drop unused bank supply
>   dt-bindings: soc: mediatek: pwrap: Add power-domains property
>   dt-bindings: input: Convert MELFAS MIP4 Touchscreen to DT schema

As we're close to the merge window, I applied patches 2, 8, and 11.

Rob
