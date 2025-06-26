Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B07AEAAA9
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 01:33:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8949710E927;
	Thu, 26 Jun 2025 23:33:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="g7jYLF0t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EA1A10E927
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 23:33:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id DFFDD6112E;
 Thu, 26 Jun 2025 23:27:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C547C4CEEB;
 Thu, 26 Jun 2025 23:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750980442;
 bh=rGd8vHm/pPWBrQU2pyGvRYmV2BAuKK2EJhchFvW1jhI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g7jYLF0tw2pR7Hfsb/eeM3tS6+x9BiYkO1MmXkp5lMY3wDl7vxrlGP+jyGJGcxP4C
 /un5N8u6PQXyfXvbbkWd5hIVeyO6Ci3gIqzfKWetXWhMmQodR3EaWB9HfKQMlfIdwu
 fYurMq9P0VUgvlK2EPtT1gj9nkaSIeZ+rfuC/eXMbQGS1n7vs4BxkIO87xb95mPqNQ
 g9yKKW/csMUMnElCSTVr6z45DixTZ84TSgC9as+/BG7Ml6athlIiVlWg6bUDyFqQl0
 4s4wPtKxunL0/ZR9QIXCXgCjNEZ3MzZXi5BlUTaFcF3Jz+W2nhBuyAvpdJ9plcGF+q
 4QmfjxWg/hpDg==
Date: Thu, 26 Jun 2025 18:27:21 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>, Janne Grunau <j@jannau.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Sven Peter <sven@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: gpu: Add Apple SoC GPU
Message-ID: <175098044101.1398221.2403754383485344517.robh@kernel.org>
References: <20250613-sgx-dt-v2-0-fb2b7d1c3ff7@gmail.com>
 <20250613-sgx-dt-v2-1-fb2b7d1c3ff7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613-sgx-dt-v2-1-fb2b7d1c3ff7@gmail.com>
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


On Fri, 13 Jun 2025 23:17:07 +0200, Sasha Finkelstein wrote:
> Add bindings for the GPU present in Apple SoCs
> 
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  Documentation/devicetree/bindings/gpu/apple,agx.yaml | 94 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  MAINTAINERS                                          |  1 +
>  2 files changed, 95 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

