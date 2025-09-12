Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D375B542A6
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 08:19:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1A8210EBAF;
	Fri, 12 Sep 2025 06:19:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TAfBsjAS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E13C410EBAD
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 06:19:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D99B0601AE;
 Fri, 12 Sep 2025 06:19:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1432C4CEF4;
 Fri, 12 Sep 2025 06:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757657974;
 bh=o8hk3zQNATXcYNezfLWUb6kcglAXSeb1kRjCzbDhJIw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TAfBsjASg0j47G0aj71WpPiHwEzVjLh8frxE9MTlUre9o4kgdD0AT9C2l8NxGKnp8
 7IFEcYbPKl8ue4IGOaLDKbEJWbquIJXUUac3GR9E8dEo3Jh7cz5KyP8qh3mPDlVArz
 meCJadPxluLfi2gaQmclFasUpdycrQpAxtv6mRtBuVlbMKoWoMt6LIpZ7jlivjF0dg
 SBAPM4eomEn87Qqye6+Q6x4eBzcUHZ4H1iHg9AmOB6gpsAuvBFvm28piizL42FE7pD
 /GR042vD8YIz4ZS/9nvYqbhp9jXT7LOUgXCQDvL0U4FZWriZxiFMJkIGihya5dMtB1
 KwwnUs4bBEHfQ==
Date: Fri, 12 Sep 2025 08:19:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch, 
 andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com,
 broonie@kernel.org, 
 chunkuang.hu@kernel.org, conor+dt@kernel.org, davem@davemloft.net, 
 dmitry.torokhov@gmail.com, edumazet@google.com, flora.fu@mediatek.com,
 heiko@sntech.de, 
 houlong.wei@mediatek.com, jeesw@melfas.com, kernel@collabora.com,
 krzk+dt@kernel.org, 
 kuba@kernel.org, lgirdwood@gmail.com, linus.walleij@linaro.org, 
 louisalexis.eyraud@collabora.com, luiz.dentz@gmail.com,
 maarten.lankhorst@linux.intel.com, 
 marcel@holtmann.org, matthias.bgg@gmail.com, mchehab@kernel.org, 
 minghsiu.tsai@mediatek.com, mripard@kernel.org, p.zabel@pengutronix.de,
 pabeni@redhat.com, 
 robh@kernel.org, sean.wang@kernel.org, simona@ffwll.ch, 
 support.opensource@diasemi.com, tiffany.lin@mediatek.com, tzimmermann@suse.de, 
 yunfei.dong@mediatek.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org,
 linux-gpio@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-sound@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 06/12] dt-bindings: display: mediatek,ufoe: Add
 mediatek,gce-client-reg property
Message-ID: <20250912-innocent-polite-cricket-05dbd8@kuoka>
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
 <20250911151001.108744-7-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250911151001.108744-7-ariel.dalessandro@collabora.com>
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

On Thu, Sep 11, 2025 at 12:09:55PM -0300, Ariel D'Alessandro wrote:
> Currently, users of Mediatek UFOe (Unified Frame Optimization engine) DT
> bindings set mediatek,gce-client-reg node property, which is missing from
> the DT schema.
> 
> For example, device tree arch/arm64/boot/dts/mediatek/mt8173.dtsi is
> causing the following dtb check error:
> 
> ```
> $ make CHECK_DTBS=y mediatek/mt8173-elm.dtb
>    SCHEMA  Documentation/devicetree/bindings/processed-schema.json
>    DTC [C] arch/arm64/boot/dts/mediatek/mt8173-elm.dtb
> [...]

You can drop above 4 lines, they are obvious. Your "dtbs_check error"
message already defined that.

> arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: ufoe@1401a000
> (mediatek,mt8173-disp-ufoe): 'mediatek,gce-client-reg' does not match
> any of the regexes: '^pinctrl-[0-9]+$'

The warning message should not be wrapped, so this should be two lines.
Maybe entire warning should be in one line, at least that's what I would
do, after dropping "arch/arm64/boot/dts/".

Anyway, no need to resend just for these. Thanks for the update.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

