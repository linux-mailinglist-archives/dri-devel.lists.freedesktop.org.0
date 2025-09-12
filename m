Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3326B5594F
	for <lists+dri-devel@lfdr.de>; Sat, 13 Sep 2025 00:37:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 155E310ECE9;
	Fri, 12 Sep 2025 22:37:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TrVcwliJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8D4010ECE9
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 22:37:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6B716423C5;
 Fri, 12 Sep 2025 22:37:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2214AC4CEF1;
 Fri, 12 Sep 2025 22:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757716673;
 bh=B9UWbZGKGjcmdpBpJTHq4Bvu86HEtGMURBUQlAh+wng=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TrVcwliJdziWcvEcLi0TVBaYRU0cqz+P0LkYP18PS4V8it1ba7cZ92zsa5Y3dzWLc
 YrEuOyNwShq0RR+1+3s/CzKz/FvAj8Dg2ILyM9zKHc+GxAcTbJRbF9zrHAxYtHAtWS
 nowrg87C3Mhu7Ma9MVTSiKPANaSzfmKeaaI+jiwqqKI/eFzfgCVIsx0GyGgRpB5mC/
 E1FV/bHUfiM/xWBXFUvAkeBLYpdn5iD18PAOpqzc3WdYh8uHA0QJpTs+ikEAG/Jg8A
 LroectmFESH23Jvjk8Jl5nAs0sIu7GliX4k4LL9XE6Kb1IBSFNtgZdkeRG9oO5IQJw
 v2hGeBjsKFJvA==
Date: Fri, 12 Sep 2025 17:37:52 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: luiz.dentz@gmail.com, kuba@kernel.org, airlied@gmail.com,
 mripard@kernel.org, angelogioacchino.delregno@collabora.com,
 linux-arm-kernel@lists.infradead.org,
 maarten.lankhorst@linux.intel.com, tiffany.lin@mediatek.com,
 houlong.wei@mediatek.com, minghsiu.tsai@mediatek.com,
 lgirdwood@gmail.com, louisalexis.eyraud@collabora.com,
 linus.walleij@linaro.org, devicetree@vger.kernel.org,
 linux-input@vger.kernel.org, yunfei.dong@mediatek.com,
 edumazet@google.com, linux-bluetooth@vger.kernel.org,
 tzimmermann@suse.de, broonie@kernel.org, andrew+netdev@lunn.ch,
 kernel@collabora.com, chunkuang.hu@kernel.org,
 amergnat@baylibre.com, conor+dt@kernel.org, matthias.bgg@gmail.com,
 support.opensource@diasemi.com, linux-rockchip@lists.infradead.org,
 davem@davemloft.net, andrew-ct.chen@mediatek.com,
 krzk+dt@kernel.org, p.zabel@pengutronix.de, sean.wang@kernel.org,
 linux-kernel@vger.kernel.org, simona@ffwll.ch,
 linux-mediatek@lists.infradead.org, marcel@holtmann.org,
 dmitry.torokhov@gmail.com, dri-devel@lists.freedesktop.org,
 pabeni@redhat.com, jeesw@melfas.com, mchehab@kernel.org,
 linux-media@vger.kernel.org, flora.fu@mediatek.com,
 linux-gpio@vger.kernel.org, heiko@sntech.de,
 linux-sound@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 05/12] dt-bindings: display: mediatek,od: Add
 mediatek,gce-client-reg property
Message-ID: <175771595983.1528737.3645378655142592974.robh@kernel.org>
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
 <20250911151001.108744-6-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911151001.108744-6-ariel.dalessandro@collabora.com>
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


On Thu, 11 Sep 2025 12:09:54 -0300, Ariel D'Alessandro wrote:
> Currently, users of Mediatek OD (display overdrive) DT bindings set
> mediatek,gce-client-reg node property, which is missing from the DT schema.
> 
> For example, device tree arch/arm64/boot/dts/mediatek/mt8173.dtsi is
> causing the following dtb check error:
> 
> ```
> $ make CHECK_DTBS=y mediatek/mt8173-elm.dtb
>    SCHEMA  Documentation/devicetree/bindings/processed-schema.json
>    DTC [C] arch/arm64/boot/dts/mediatek/mt8173-elm.dtb
> [...]
> arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: od@14023000
> (mediatek,mt8173-disp-od): 'mediatek,gce-client-reg' does not match
> any of the regexes: '^pinctrl-[0-9]+$'
> ```
> 
> This commit adds the missing node property in the DT schema and updates the
> example as well.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
>  .../bindings/display/mediatek/mediatek,od.yaml     | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

I fixed up the commit msg with Krzysztof's comments and applied both 
display patches. Thanks!

Rob
