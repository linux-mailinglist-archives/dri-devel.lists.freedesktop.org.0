Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4C2B12559
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 22:28:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9009810E466;
	Fri, 25 Jul 2025 20:28:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hCV5qzX5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2896110E466
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 20:28:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9B8C4416DC;
 Fri, 25 Jul 2025 20:28:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49DE1C4CEF6;
 Fri, 25 Jul 2025 20:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753475302;
 bh=90YjidsW0zLfZ2EVgtXoscfqDLtrHgB9m/jDQVG5PWk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hCV5qzX5FcJQA4jUKlOvPOf0uPNZFnxjS8SpjO4vPyWdTLmiiniC01y1vRcAEqpuQ
 ch5awJmTQUZXLkBsqHUw8LR+DvmjjRGNmsiUY3gnWa8juFrOwKLkFaNAywPkRH6X1L
 2T0Rm+Hnl3I7WH874DB9G1Cfg/rBdOomAfOL9Z0F4gujhwDlk7z4Qvs41FKYpl6kvB
 +oKfi+dcjn9xFtoLqSl9eOho8FtJ+BZkG4T8okai1wn2zzuXT59v/kd0lUfL7zYJ5a
 5n5RQAebqjE94nWw6X5XcvwBXf1t/4PmAN0PROqQuBvwdbxGx/oE9W1UiLZLYeAWPz
 ipk20JnM64rnw==
Date: Fri, 25 Jul 2025 15:28:21 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, conor+dt@kernel.org,
 chunkuang.hu@kernel.org, atenart@kernel.org, ck.hu@mediatek.com,
 sean.wang@kernel.org, kyrie.wu@mediatek.corp-partner.google.com,
 airlied@gmail.com, olivia.wen@mediatek.com, frank-w@public-files.de,
 sam.shih@mediatek.com, krzk+dt@kernel.org, simona@ffwll.ch,
 eugen.hristev@linaro.org, fparent@baylibre.com, mchehab@kernel.org,
 herbert@gondor.apana.org.au, tinghan.shen@mediatek.com,
 jiaxin.yu@mediatek.com, linux-remoteproc@vger.kernel.org,
 jitao.shi@mediatek.com, linux-sound@vger.kernel.org,
 mripard@kernel.org, matthias.bgg@gmail.com, jieyy.yang@mediatek.com,
 broonie@kernel.org, shane.chien@mediatek.com,
 linus.walleij@linaro.org, davem@davemloft.net,
 jassisinghbrar@gmail.com, kishon@kernel.org, lgirdwood@gmail.com,
 granquet@baylibre.com, dri-devel@lists.freedesktop.org,
 arnd@arndb.de, andy.teng@mediatek.com, linux-kernel@vger.kernel.org,
 daniel.lezcano@linaro.org, mathieu.poirier@linaro.org,
 linux-phy@lists.infradead.org, p.zabel@pengutronix.de,
 tglx@linutronix.de, maarten.lankhorst@linux.intel.com,
 andersson@kernel.org, houlong.wei@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-media@vger.kernel.org, tzimmermann@suse.de,
 chunfeng.yun@mediatek.com, vkoul@kernel.org,
 linux-gpio@vger.kernel.org, mwalle@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 03/38] dt-bindings: mailbox: mediatek,gce-mailbox: Make
 clock-names optional
Message-ID: <175347530117.1835509.4802205566620946645.robh@kernel.org>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-4-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724083914.61351-4-angelogioacchino.delregno@collabora.com>
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


On Thu, 24 Jul 2025 10:38:39 +0200, AngeloGioacchino Del Regno wrote:
> The GCE Mailbox needs only one clock and the clock-names can be
> used only by the driver (which, for instance, does not use it),
> and this is true for all of the currently supported MediaTek SoCs.
> 
> Stop requiring to specify clock-names on all non-MT8195 GCEs.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/mailbox/mediatek,gce-mailbox.yaml        | 11 -----------
>  1 file changed, 11 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

