Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BA5B9795C
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 23:37:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF89910E04A;
	Tue, 23 Sep 2025 21:37:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="a55I2Dre";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1310010E04A
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 21:37:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D620B6028C;
 Tue, 23 Sep 2025 21:37:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EE44C4CEF5;
 Tue, 23 Sep 2025 21:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758663443;
 bh=AmT7pTT/bQK4h7VloFIIhchliPgyZojTf54MF0QHREo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a55I2Drexre9bmk9zOM6IHzQLXlQLZh5HwWP9Px8aa/1hUS7J58IX7JJ3YDzCuSEM
 PAS3UJCrtAIueVROmkX4i4/LE8CnJ4xggv/HzM6XkXuZUCxXuwrOA/v6g8Y2f0uku/
 f0ijwgCPwX5/BC3M3TGHhGSBZsK1PD0rxU7lsZr5CX9FWDXzMlOrlUQMTXiYaxcO0D
 skyJYWG9BJlwnI2a0btE2FNr6ra9N0dWRB6zll1TTr5tpxaUDyhp6C6gLAYOk8Mmtl
 jxKtO5V+Vycuwt7yWcI4UnHje3zc3L22NfIckDsJKK8yanMDnkXkmCavEDVeL+Tcsl
 68jmOmlZAVZmQ==
Date: Tue, 23 Sep 2025 16:37:21 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, herbert@gondor.apana.org.au,
 davem@davemloft.net, krzk+dt@kernel.org, conor+dt@kernel.org,
 chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, jassisinghbrar@gmail.com,
 mchehab@kernel.org, matthias.bgg@gmail.com,
 chunfeng.yun@mediatek.com, vkoul@kernel.org, kishon@kernel.org,
 sean.wang@kernel.org, linus.walleij@linaro.org, lgirdwood@gmail.com,
 broonie@kernel.org, andersson@kernel.org,
 mathieu.poirier@linaro.org, daniel.lezcano@linaro.org,
 tglx@linutronix.de, atenart@kernel.org, jitao.shi@mediatek.com,
 ck.hu@mediatek.com, houlong.wei@mediatek.com,
 kyrie.wu@mediatek.corp-partner.google.com, andy.teng@mediatek.com,
 tinghan.shen@mediatek.com, jiaxin.yu@mediatek.com,
 shane.chien@mediatek.com, olivia.wen@mediatek.com,
 granquet@baylibre.com, eugen.hristev@linaro.org, arnd@arndb.de,
 sam.shih@mediatek.com, jieyy.yang@mediatek.com,
 frank-w@public-files.de, mwalle@kernel.org, fparent@baylibre.com,
 linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 00/38] MediaTek devicetree/bindings warnings sanitization
Message-ID: <20250923213721.GA91441-robh@kernel.org>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
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

On Thu, Jul 24, 2025 at 10:38:36AM +0200, AngeloGioacchino Del Regno wrote:
> As Rob pointed out, MediaTek devicetrees are *poor* in the dtbs_check
> tests, and got an infinite load of warnings.
> 
> This series starts attacking this situation.
> 
> I didn't really count how many warnings I have resolved - it's a lot
> of them anyway - and I think that this is a good start in any case.
> 
> More will come, but I'll be on a long holiday soon, so not from me
> (or anyway not before I come back anyway), but most probably from
> someone else (in August...!).
> 
> Cheers!
> Angelo
> 
> AngeloGioacchino Del Regno (38):
>   dt-bindings: display: mediatek: dpi: Allow specifying resets
>   dt-bindings: display: mediatek,dp: Allow DisplayPort AUX bus
>   dt-bindings: mailbox: mediatek,gce-mailbox: Make clock-names optional
>   ASoC: dt-bindings: mt8192-afe-pcm: Fix clocks and clock-names
>   dt-bindings: crypto: inside-secure,safexcel: Mandate only ring IRQs
>   dt-bindings: timer: mediatek: Add compatible for MT6795 GP Timer
>   dt-bindings: pinctrl: mediatek,mt7622-pinctrl: Add missing pwm_ch7_2
>   dt-bindings: pinctrl: mediatek,mt7622-pinctrl: Add missing base reg
>   dt-bindings: pinctrl: mt6779: Allow common MediaTek pinctrl node names
>   dt-bindings: regulator: mediatek,mt6332-regulator: Add missing
>     compatible
>   dt-bindings: regulator: mediatek,mt6331: Fix various regulator names
>   dt-bindings: regulator: mediatek,mt6331: Add missing compatible
>   dt-bindings: remoteproc: mediatek: Remove l1tcm MMIO from MT8188 dual
>   dt-bindings: media: mediatek,mt8195-jpeg: Allow range number in node
>     address
>   dt-bindings: phy: mediatek,hdmi-phy: Fix clock output names for MT8195

As we are close to the merge window, I applied patches 1, 3, 6, 7, 8, 
10, 11, 12 and 14.

Rob
