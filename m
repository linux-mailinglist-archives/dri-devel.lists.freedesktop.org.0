Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E7DD21730
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 22:52:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FCEA10E699;
	Wed, 14 Jan 2026 21:52:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kwWwxiky";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D4DE10E699
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 21:52:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E1728437C2;
 Wed, 14 Jan 2026 21:52:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B14CC4CEF7;
 Wed, 14 Jan 2026 21:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768427524;
 bh=M1gJhCbLOU4I/BZFPxEOzvEA0Bnn9+kKwnxcwbbgbkE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kwWwxikyHO4uMF7uRfY8WsAKTfTOC5gGgvBeg80DGMtleeRKM40iWnh8pdsn4DKtp
 q3Y+R51snbfadJlsqcQeacKH64t3GUoczhhBU38DtbP1sMw06HgZmdfHubYNXatH1f
 Uj3y3WqXHdBr5rDXDrwOO6/BBE9pOxRD73krvnp661saWIQ3hjOh4GCHlOXMS1nLxV
 AhBWXK1AHTENiCh5Usa0mwV6rXL6dAFEXxm4CxblQmzHW9SqxakDsS+IOsHhSFRFaF
 PFUV/1ffmIP+0IHbpsi1UQ/iBwZbkUr5wD6CULCpPSQ/eFEiBcsJPSfEon0yr2gxHz
 I1+eqycXqmEMA==
Date: Wed, 14 Jan 2026 15:52:03 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 09/12] dt-bindings: media: st: dcmi: add DMA-MDMA
 chaining properties
Message-ID: <176842752326.3259543.1333457446847101857.robh@kernel.org>
References: <20260106-stm32-dcmi-dma-chaining-v2-0-70688bccd80a@foss.st.com>
 <20260106-stm32-dcmi-dma-chaining-v2-9-70688bccd80a@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106-stm32-dcmi-dma-chaining-v2-9-70688bccd80a@foss.st.com>
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


On Tue, 06 Jan 2026 12:34:37 +0100, Alain Volmat wrote:
> Add properties update and new sram property necessary in order
> to enable the DMA-MDMA chaining.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> 
> ---
> Change in v2:
>   - correct typo (phandles -> phandle)
>   - remove explanation about generic binding sram.yaml
> ---
>  Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

