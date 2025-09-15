Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74418B5833B
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 19:18:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09D5F10E510;
	Mon, 15 Sep 2025 17:18:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="F/JbTlRd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14DD110E510
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 17:18:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A415243833;
 Mon, 15 Sep 2025 17:18:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5060DC4CEF1;
 Mon, 15 Sep 2025 17:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757956714;
 bh=UudavyaBPyKCvnlpRZjR/WL6Gz4dsHuj/kJzrYrD31k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F/JbTlRdHf2wuMS7PAQDX+cMcUt0Tl2t0XWZyhzi1eOyiISPk7RjJcnsIS0GIpi9V
 7SbXrx0cZaL37tKdyg/vcUqZJzqSXLzgTtNoPXknib9uGaINZ14kqTyI7w27Jd9lfE
 6D3ifCwLIr5z4r+BgcNvocGfn8dNx4/n/EYCi8Mze70UyAizPmCLXaCHML3w4Or7VH
 FunnWjeDz28vusWXMx/XEhCwqYuB21S/9Q0HK2V/W6cRl8dDYJpjZR2DN8/L5UEREY
 wgMm1OoRpOaQJd0B0pyOH+m2tJXI1okpo7J4dXt2uk7aqpPPk7lAJ+PaV8RA0gVQkg
 wtCjSaz/a2p3A==
Date: Mon, 15 Sep 2025 12:18:33 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
 broonie@kernel.org, flora.fu@mediatek.com, p.zabel@pengutronix.de,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 support.opensource@diasemi.com, edumazet@google.com,
 krzk+dt@kernel.org, louisalexis.eyraud@collabora.com,
 mchehab@kernel.org, matthias.bgg@gmail.com,
 tiffany.lin@mediatek.com, linux-media@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 chunkuang.hu@kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, airlied@gmail.com,
 linus.walleij@linaro.org, pabeni@redhat.com, lgirdwood@gmail.com,
 kuba@kernel.org, linux-sound@vger.kernel.org, tzimmermann@suse.de,
 amergnat@baylibre.com, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, andrew+netdev@lunn.ch,
 conor+dt@kernel.org, dmitry.torokhov@gmail.com,
 yunfei.dong@mediatek.com, linux-bluetooth@vger.kernel.org,
 davem@davemloft.net, jeesw@melfas.com, heiko@sntech.de,
 linux-arm-kernel@lists.infradead.org, minghsiu.tsai@mediatek.com,
 sean.wang@kernel.org, houlong.wei@mediatek.com,
 luiz.dentz@gmail.com, kernel@collabora.com,
 linux-mediatek@lists.infradead.org, simona@ffwll.ch,
 marcel@holtmann.org, andrew-ct.chen@mediatek.com
Subject: Re: [PATCH v2 04/12] dt-bindings: ASoC: Convert MediaTek RT5650
 codecs bindings to DT schema
Message-ID: <175795671272.2949182.4347956532845839846.robh@kernel.org>
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
 <20250911151001.108744-5-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911151001.108744-5-ariel.dalessandro@collabora.com>
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


On Thu, 11 Sep 2025 12:09:53 -0300, Ariel D'Alessandro wrote:
> Convert the existing text-based DT bindings for Mediatek MT8173 RT5650
> codecs to a DT schema.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
>  .../sound/mediatek,mt8173-rt5650.yaml         | 73 +++++++++++++++++++
>  .../bindings/sound/mt8173-rt5650.txt          | 31 --------
>  2 files changed, 73 insertions(+), 31 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/mt8173-rt5650.txt
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

