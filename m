Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8B7B0E97B
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 06:14:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7413D10E333;
	Wed, 23 Jul 2025 04:14:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fxKsrMsw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 957B710E332
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 04:14:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5A5C7A52AE5;
 Wed, 23 Jul 2025 04:14:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5D71C4CEE7;
 Wed, 23 Jul 2025 04:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753244057;
 bh=LfCvVTNncyI+L5GWkBACZBAP9t3HVvfRp0+7jgztVKs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fxKsrMswqYJH8+j6y3yO5jFVs/Er5KQlLrf+oEk9G4n6Hz97KZAg6XhIYQS9w+gWR
 DDuij8/rFoEHhYrXY7BQhMKBIEBvGggh+tYsaNDFmBfebWZk5lA+xFgwKTj+8zv4Kb
 NnNNRkPrGbo3rc71tOfq3ZX8TzK6sP1ZLPYARQLfzC0Xaqo3cdYolpLNOPdIQa2Zt2
 Np9lQCu5LVjpouseO7ZcMpsRQabakEqb6U2Z99pBLcJ4qTHu03goqE3wI8o++O8yon
 P9gWi0xP+seY8Kn3hOldCO5rP48t9K2DHIYxgPgw59cACOQa3CHcusQRuhsEpyCEht
 I6gJw4cijaETQ==
Date: Tue, 22 Jul 2025 23:14:16 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Orson Zhai <orsonzhai@gmail.com>, David Airlie <airlied@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Simona Vetter <simona@ffwll.ch>, stable@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kevin Tang <kevin.tang@unisoc.com>, devicetree@vger.kernel.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Maxime Ripard <mripard@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Chunyan Zhang <zhang.lyra@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: sprd,sharkl3-dpu: Fix missing
 clocks constraints
Message-ID: <175324405446.1118889.12773496556755624286.robh@kernel.org>
References: <20250720123003.37662-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250720123003.37662-3-krzysztof.kozlowski@linaro.org>
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


On Sun, 20 Jul 2025 14:30:04 +0200, Krzysztof Kozlowski wrote:
> 'minItems' alone does not impose upper bound, unlike 'maxItems' which
> implies lower bound.  Add missing clock constraint so the list will have
> exact number of items (clocks).
> 
> Fixes: 8cae15c60cf0 ("dt-bindings: display: add Unisoc's dpu bindings")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!

