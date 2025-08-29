Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E41B3B370
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 08:32:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA2E510EB49;
	Fri, 29 Aug 2025 06:32:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ead6Kr+0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F80A10EB49
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 06:32:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2F6B64170E;
 Fri, 29 Aug 2025 06:32:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68D48C4CEF0;
 Fri, 29 Aug 2025 06:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756449141;
 bh=lZ0QTag0VjlOQOxSce3jMyppu0ATtFUwrlYgNcJo/x0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ead6Kr+0+piLg9YfVifMhyiEpWCpjYQwKm5BrNkbVVEhEtUxHhdAY3TZdPVPMcPho
 X3MQDNIkatnzRTNeLcZGs0m8ip2ORZAsk+iB5f9gNgs9Q3Kr7pXUqAwlL/fhzdjlf0
 5JpoRNg74ZvzDfAj19KNjv+NyjqWhN2ttfNmJN6aGpaRinfwpW0CW1TFc2bOvqAeiZ
 x+X3MEjEruyfBzhwk9aOZJcYANhUWu4Atdkg3VSVbMKA73GlPZulTS1m8pd/XuZZFO
 L6mqlEbt2gJG/NF5ilq0yfdbTjGFrpREaByt43g///9jPr93TLluHDTMvEZDCtOu8k
 Fz+dHR4x+QKQQ==
Date: Fri, 29 Aug 2025 08:32:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Paul Chen <paul-pl.chen@mediatek.com>
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
Subject: Re: [PATCH v4 00/19] Add MediaTek SoC DRM support for MT8196
Message-ID: <20250829-curious-indigo-worm-b7e7ad@kuoka>
References: <20250828080855.3502514-1-paul-pl.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250828080855.3502514-1-paul-pl.chen@mediatek.com>
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

On Thu, Aug 28, 2025 at 04:06:55PM +0800, Paul Chen wrote:
> From: Paul-pl Chen <paul-pl.chen@mediatek.com>
> 
> Changes in v4:
> - [PATCH v4 11/19]
>   Add New commit to refactor the naming of OVL Fornat.
> - [PATCH v4 12/19]
>   Refactor ovl_blend_mode fucntion
> - [PATCH v4 13/19]
>   Move mtk_ovl_get_blend_mode to this commit to align with driver.
> - [PATCH v4 14/19]
>   Remove the unused paramter cmdq
>   Remove the reapet of pitch setting
> - [PATCH v4 15/19]
>   Remove the unused paramter cmdq
>   Remove the useless parametrt of func():mtk_disp_blender_config
> - [PATCH v4 16/19] 
>   Simplified the driiver code to improve readability 
> - [PATCH v4 17/19]
>   Refine mtk_ovlsys_adaptor_layer_config's layer config checking. 
>   Refine mtk_ovlsys_adaptor_config's logic
>   Fix func()'s mtk_ovlsys_adaptor_stop settting
>   Refine mtk_ovlsys_adaptor_clk_enbale to repaet NULL checking
> - [PATCH v4 18/19]
>   Fix the system report's syntext error


Where are lore links to previous versions?

Why aren't you using b4?

Best regards,
Krzysztof

