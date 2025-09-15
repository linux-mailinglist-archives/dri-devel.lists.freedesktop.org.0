Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7E7B58343
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 19:19:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 289F510E513;
	Mon, 15 Sep 2025 17:19:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IE48EwGK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A74ED10E513
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 17:18:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 71DD04039D;
 Mon, 15 Sep 2025 17:18:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29D2FC4CEF1;
 Mon, 15 Sep 2025 17:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757956739;
 bh=echBK1j+X18njnYEmIigVCWTPbyp+OCXowD7iTEllfs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IE48EwGK3IiFjChHMY8WDepEbhLCtNxnYU/5z69sMcEgP7bXPN0cqBnteEiF8K4wz
 BDuAS8CAefnVdeOjVD221KnpxDk/F0LjOH6qcKQWQJG47odmA0WmwHnSCVre/ZLl6L
 zVzS+g2T8rF+z/6cNHOBtIbOh8J+0KdUAvwDgAFChv7sM3e6KAmp2O8D1X/hkC2k6l
 aWTpA49ruDg8QSVkTHqFtiDRf0CjQK0eS2GsoHAD0SyLtQ0pxwhoMX6nTMlLWiuHmK
 oAKrC/RF+A0eeLwt/qbnL2I7MmyKjt0xGF8YNIIVcrl2hxWOfGG/6RIeiVz12BpOTh
 dEA+cAoc3xBLg==
Date: Mon, 15 Sep 2025 12:18:58 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: louisalexis.eyraud@collabora.com, angelogioacchino.delregno@collabora.com,
 support.opensource@diasemi.com, tzimmermann@suse.de,
 sean.wang@kernel.org, maarten.lankhorst@linux.intel.com,
 luiz.dentz@gmail.com, krzk+dt@kernel.org, kuba@kernel.org,
 linux-bluetooth@vger.kernel.org, p.zabel@pengutronix.de,
 jeesw@melfas.com, andrew+netdev@lunn.ch, houlong.wei@mediatek.com,
 linux-rockchip@lists.infradead.org, mripard@kernel.org,
 linux-input@vger.kernel.org, tiffany.lin@mediatek.com,
 amergnat@baylibre.com, linus.walleij@linaro.org,
 andrew-ct.chen@mediatek.com, marcel@holtmann.org,
 lgirdwood@gmail.com, heiko@sntech.de, matthias.bgg@gmail.com,
 dri-devel@lists.freedesktop.org, dmitry.torokhov@gmail.com,
 airlied@gmail.com, linux-mediatek@lists.infradead.org,
 chunkuang.hu@kernel.org, flora.fu@mediatek.com,
 devicetree@vger.kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 simona@ffwll.ch, netdev@vger.kernel.org, edumazet@google.com,
 yunfei.dong@mediatek.com, linux-gpio@vger.kernel.org,
 minghsiu.tsai@mediatek.com, linux-kernel@vger.kernel.org,
 pabeni@redhat.com, broonie@kernel.org, mchehab@kernel.org,
 conor+dt@kernel.org, linux-media@vger.kernel.org,
 linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 08/12] dt-bindings: pinctrl: mt65xx: Allow
 gpio-line-names
Message-ID: <175795673768.2952954.14700429990661884718.robh@kernel.org>
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
 <20250911151001.108744-9-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911151001.108744-9-ariel.dalessandro@collabora.com>
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


On Thu, 11 Sep 2025 12:09:57 -0300, Ariel D'Alessandro wrote:
> Current, the DT bindings for MediaTek's MT65xx Pin controller is missing
> the gpio-line-names property, add it to the associated schema.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
>  .../devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml    | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

