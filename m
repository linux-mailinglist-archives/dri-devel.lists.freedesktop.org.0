Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB52BB3B384
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 08:35:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5474210EB4A;
	Fri, 29 Aug 2025 06:35:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mUS4NeEQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F96610EB4A
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 06:35:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 201204535C;
 Fri, 29 Aug 2025 06:35:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AACDC4CEF5;
 Fri, 29 Aug 2025 06:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756449326;
 bh=0NgMjqXnvtRxxln19R3tS9pI1H20Mq7W/lHIuqdY+uk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mUS4NeEQDHp4RpXIEfmuZNrr7scAypuu9Ptx8sJ0yCP1XNllD61+L5wEEx9ld2LEB
 IKZ8NbSez9ZALLcZTsa2OTkyVVitVJs4listetsc4sgMlzbfcOo+NQ/i10dA4OGiJV
 3ypKzqdmOYZWb3FOdXhkzi+F/V959omeAx0IGhpWxCotcvditbNQSMaIyAWjBxbLGL
 ehOepos0hy2v1fN/9Xx35Nhm+9qoq/NFA2yoic7goQ9zq4YIlODN5rtI/pvCN7LSuF
 YQ3ja/kZA9aWCCGInZ+/PpGYpePQHhkMO5PozkkNwawFZY/k721wgzp/EBR5bhA4sF
 U3e5wycRVi74w==
Date: Fri, 29 Aug 2025 08:35:23 +0200
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
Subject: Re: [PATCH v4 03/19] dt-bindings: display: mediatek: add EXDMA yaml
 for MT8196
Message-ID: <20250829-solemn-herring-of-conversion-ec5b1a@kuoka>
References: <20250828080855.3502514-1-paul-pl.chen@mediatek.com>
 <20250828080855.3502514-4-paul-pl.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250828080855.3502514-4-paul-pl.chen@mediatek.com>
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

On Thu, Aug 28, 2025 at 04:06:58PM +0800, Paul Chen wrote:
> From: Paul-pl Chen <paul-pl.chen@mediatek.com>
> 
> Add mediatek,exdma.yaml to support EXDMA for MT8196.
> The MediaTek display overlap extended DMA engine, namely
> OVL_EXDMA or EXDMA, primarily functions as a DMA engine
> for reading data from DRAM with various DRAM footprints
> and data formats.
> 
> Signed-off-by: Paul-pl Chen <paul-pl.chen@mediatek.com>
> ---
>  .../bindings/dma/mediatek,exdma.yaml          | 68 +++++++++++++++++++


Your changelog says NOTHING changed here and this fails tests, so does it
mean you received that warnings before but you keep sending same broken
code?

Last two weeks of contributions from mediatek are absolutely terrible.
Very poor code, basic in-house reviews not done, basic testing not done.

I talked about this at OSSE 25 with some friends and got reasons why
your setup is broken. Well, it's on you.

I was already raising this with Mediatek, but we are now back to square
one.

NAK, because this patch WAS NEVER tested.

Best regards,
Krzysztof

