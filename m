Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06482A6D793
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 10:36:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CE2F10E283;
	Mon, 24 Mar 2025 09:36:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IepI6eE/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D926A10E283
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 09:36:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6388B438F1;
 Mon, 24 Mar 2025 09:36:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F010DC4CEDD;
 Mon, 24 Mar 2025 09:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742808998;
 bh=PJzZLmVcfVBTyYixEnKzvpzn4eT4hlh6iQAK6VQBE3k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IepI6eE/HrjMOv4BkqvK3/BA94amIdm+TWEoIBz/29IkPA7bNK6NAJaZW0AqnHDPv
 E4DZfUi67CT3+W30Fcdi9b8cf/GuDyljgLmaUgAubP4QHh9eUAf2nXn4oru0jIgW5i
 bup58hM18Mwfzcuh12bXP3ZdJClglMQfD7Dm7Vv3r85ViIUfbrhwbhyNT3Byc93tPm
 Dpzw445pZKzm6AH9RlR3Tr3EVOuxOzOI1GWpmz6G0ATNakDTlSfft7dJnTrCK07M/O
 VuWaiy9WlSgfakHBSZxq/uiDCRo7p02Ro261R8eadCg59G/JbtXuKYKMmF4nyhtxRd
 i0VFiGWVlB8hg==
Date: Mon, 24 Mar 2025 10:36:35 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "paul-pl.chen" <paul-pl.chen@mediatek.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 chunkuang.hu@kernel.org, angelogioacchino.delregno@collabora.com,
 matthias.bgg@gmail.com, 
 p.zabel@pengutronix.de, jason-jh.lin@mediatek.com, nancy.lin@mediatek.com, 
 singo.chang@mediatek.com, xiandong.wang@mediatek.com, sirius.wang@mediatek.com,
 sunny.shen@mediatek.com, fshao@chromium.org, treapking@chromium.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2 04/15] dt-bindings: display: mediatek: add BLENDER
 yaml for MT8196
Message-ID: <20250324-vigilant-vagabond-earthworm-b4e2c9@krzk-bin>
References: <20250321093435.94835-1-paul-pl.chen@mediatek.com>
 <20250321093435.94835-5-paul-pl.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250321093435.94835-5-paul-pl.chen@mediatek.com>
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

On Fri, Mar 21, 2025 at 05:33:33PM +0800, paul-pl.chen wrote:
> +additionalProperties: false
> +
> +examples:
> +  - |
> +

Why did you add here blank line? Random changes happening...

> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        disp_ovl0_blender0: blender@328d0000 {
> +            compatible = "mediatek,mt8196-blender";
> +            reg = <0 0x328d0000 0 0x1000>;
> +            clocks = <&ovlsys_config_clk 29>;

With fixed code:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

