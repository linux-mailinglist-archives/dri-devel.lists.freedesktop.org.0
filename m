Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E9AB12552
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 22:27:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B1AD10E45F;
	Fri, 25 Jul 2025 20:27:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AivHnx6f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D96D810E45F
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 20:27:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4AB695C5FBA;
 Fri, 25 Jul 2025 20:27:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C85EEC4CEE7;
 Fri, 25 Jul 2025 20:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753475264;
 bh=aTUYa4oy4wxPOvc8JecX8ElfkuEQILHtAfALn/xab6s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AivHnx6fxOn/tyd89Fe+bvxQTmzuwiKd6XahF2foKADROK61HvS8eG5aqcgsjOwo0
 QrEn+cpmRseYPEDN+2lgU6QGI7SWcgLSxrjNGxFM/oXNPP0g/f1sztZ5kRvMK+GsBq
 OO1DuTpijsVzwGPHQ8K1/2vhGbRR3SuWmbHvI5JVhuQorMFU1XtVhK6yReD050/FzQ
 +u83DVE9OuKOXkCV052rxzX/HVExTYmVgnWa8IowrfBlMwtheKx2ti6lXTQNmGMmsw
 J1yqjYwhoBbqr64fW7jtsZdYr/zCSY9zIZ1ZpMs+HRj5QCZBoAuRmyJrBWNJ5NFF6a
 kc+jE5j8hHdYA==
Date: Fri, 25 Jul 2025 15:27:43 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: ck.hu@mediatek.com, mathieu.poirier@linaro.org,
 linux-kernel@vger.kernel.org, krzk+dt@kernel.org,
 linux-media@vger.kernel.org, olivia.wen@mediatek.com,
 p.zabel@pengutronix.de, broonie@kernel.org,
 linus.walleij@linaro.org, tzimmermann@suse.de,
 daniel.lezcano@linaro.org, mchehab@kernel.org, kishon@kernel.org,
 houlong.wei@mediatek.com, herbert@gondor.apana.org.au,
 jieyy.yang@mediatek.com, jitao.shi@mediatek.com,
 shane.chien@mediatek.com, davem@davemloft.net,
 maarten.lankhorst@linux.intel.com,
 linux-arm-kernel@lists.infradead.org, simona@ffwll.ch,
 chunfeng.yun@mediatek.com, airlied@gmail.com,
 kyrie.wu@mediatek.corp-partner.google.com, mwalle@kernel.org,
 chunkuang.hu@kernel.org, linux-gpio@vger.kernel.org,
 linux-sound@vger.kernel.org, dri-devel@lists.freedesktop.org,
 lgirdwood@gmail.com, linux-mediatek@lists.infradead.org,
 atenart@kernel.org, vkoul@kernel.org, andy.teng@mediatek.com,
 linux-crypto@vger.kernel.org, granquet@baylibre.com,
 matthias.bgg@gmail.com, andersson@kernel.org, conor+dt@kernel.org,
 jiaxin.yu@mediatek.com, arnd@arndb.de, frank-w@public-files.de,
 sean.wang@kernel.org, eugen.hristev@linaro.org,
 sam.shih@mediatek.com, linux-phy@lists.infradead.org,
 tglx@linutronix.de, mripard@kernel.org, jassisinghbrar@gmail.com,
 fparent@baylibre.com, devicetree@vger.kernel.org,
 tinghan.shen@mediatek.com, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 02/38] dt-bindings: display: mediatek,dp: Allow
 DisplayPort AUX bus
Message-ID: <175347526170.1834693.13284335506775768371.robh@kernel.org>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724083914.61351-3-angelogioacchino.delregno@collabora.com>
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


On Thu, 24 Jul 2025 10:38:38 +0200, AngeloGioacchino Del Regno wrote:
> Like others, the MediaTek DisplayPort controller provides an
> auxiliary bus: import the common dp-aux-bus.yaml in this binding
> to allow specifying an aux-bus subnode.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dp.yaml      | 3 +++
>  1 file changed, 3 insertions(+)
> 

Applied, thanks!

