Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FF595AF89
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 09:43:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1206B10E091;
	Thu, 22 Aug 2024 07:43:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FUkg6gap";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6699510E091
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 07:43:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BF4A0A4252C;
 Thu, 22 Aug 2024 07:43:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17364C4AF09;
 Thu, 22 Aug 2024 07:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724312615;
 bh=AK/xKIzO4LquYSa3Q1oE65b0txD/L+ZJgcTFxpFcUSA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FUkg6gapQxxX6quXXXFRUKJOZt+8KjY6nZJXyF1prQnI+xXGfwNK/SyqUE4FNGVNH
 jB6NbeNeIJkhNoPP0hWb13ZBzxtbUfzqV3sskk6QavLqidPOYb70hbFU/nFBOhP8rP
 0oQb+ZtvvM/k1tsVS8RdrccthUgsaIAtMZvOGIyVJ1qi3cKtYKeAMiKebMTgYXvAib
 YhmHnQzN912Q7ZFH0SexObsRX/7Bp68DxY9j/l/qrVFJ4N7MCZf8ni3nGYCfh0ZR+w
 0e0kunKAtMKKGSjtsOfAEs9RpMt/42pY9gFWadHx8w2vtydKiYt5TOGmZjVqOFhwgn
 bZTUK4n6FOtHQ==
Date: Thu, 22 Aug 2024 09:43:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rohit Agarwal <rohiagar@chromium.org>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 ck.hu@mediatek.com, 
 jitao.shi@mediatek.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: display: mediatek: dpi: Add power
 domains
Message-ID: <uabbapstxrkfwlntifdoowcsifb5ywfhxubaycfyhwkkykfpev@4hdqcxdov3er>
References: <20240822064650.1473930-1-rohiagar@chromium.org>
 <20240822064650.1473930-2-rohiagar@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240822064650.1473930-2-rohiagar@chromium.org>
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

On Thu, Aug 22, 2024 at 06:46:48AM +0000, Rohit Agarwal wrote:
> Add power domain binding to the mediatek DPI controller
> for MT8186.
> Also, add power domain binding for other SoCs like
> MT6795 and MT8173 that already had power domain property.
> 
> Signed-off-by: Rohit Agarwal <rohiagar@chromium.org>
> ---
>  .../bindings/display/mediatek/mediatek,dpi.yaml | 17 +++++++++++++++++

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

