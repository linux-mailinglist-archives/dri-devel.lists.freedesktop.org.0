Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B722B200A1
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 09:47:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBCE010E2F4;
	Mon, 11 Aug 2025 07:47:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fMEvTVq9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F91310E2F4
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 07:47:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B2DBE44B8E;
 Mon, 11 Aug 2025 07:47:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36169C4CEF1;
 Mon, 11 Aug 2025 07:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754898470;
 bh=RTJN9RqRJ4UnrPrUYqFKFXdjiVHAvBNzSUV0agHEpCw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fMEvTVq9mH5UQ+CteJtO3qeUITYpyPArJqZdO8zN+Ojtqz/5TLMo5qIb5+VuTvd5O
 9WhOMwLS9cQVb34kMY1uVFjDuKhA67JMVk/gPPhqW5MjCFI/pAhU0DFrshJ9BHdMcG
 1nSJWesI8hsBoIPvjjMOfOr/hgX4Pvvoh3ZZvYh0TGwBQPmjyBZTgC736gKFDdppLD
 M2V6oIe/2WOeeuom3JxeUuwvSFZPIfMnEXvQLL0evzi50Jc5N96kj2fZ8mEla5HZow
 7eom7wiHjK9I03tlz1HRvrA5RuGO7PIX+E9BrGsLNxZ2rHn3nGZ4WZ847hGK8LcT+X
 IfSz4ABQV9Nhg==
Date: Mon, 11 Aug 2025 09:47:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jay Liu <jay.liu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/6] dt-bindings: display: mediatek: gamma: Add
 support for MT8196
Message-ID: <20250811-chubby-infrared-spider-df0d8c@kuoka>
References: <20250808125512.9788-1-jay.liu@mediatek.com>
 <20250808125512.9788-2-jay.liu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250808125512.9788-2-jay.liu@mediatek.com>
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

On Fri, Aug 08, 2025 at 08:53:56PM +0800, Jay Liu wrote:
> Add a compatible string for the GAMMA IP found in the MT8196 SoC.
> Each GAMMA IP of this SoC is fully compatible with the ones found
> in MT8195.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Jay Liu <jay.liu@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,gamma.yaml     | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

