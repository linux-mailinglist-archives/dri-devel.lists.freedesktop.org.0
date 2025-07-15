Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 634D7B05414
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 10:06:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C646D10E54F;
	Tue, 15 Jul 2025 08:06:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rlfCgMPl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8931710E54F
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 08:06:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6E63A61140;
 Tue, 15 Jul 2025 08:06:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B47F5C4CEE3;
 Tue, 15 Jul 2025 08:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752566783;
 bh=IdD1fLvIqtuuHLiO8uhclVEZklj1JJ7FrDLnTE9qxs4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rlfCgMPlbkLuG4W/GWe3TWZK2HD1gZCh35btsGlcMdQjvsRLuUp+S+O0gKanp+sMW
 MY0M1CW4FAQa8gvnFXfS/WGoE12srQ2rPtA+R9U+dnGskfxNskqD52yXnj5d3AfWuo
 U9aJVOhn6Oy4YVi3V5acXTzdUdL8pVA0Q7N271BZm+Yhl43mheqYT5fjeKHfHUF/dY
 WI1zNqRrUSPM0lDrMCXuXfKhE4w77jMLrr/9jPhIwMzh5aXXRx0/Wa4UhQ6+0tyjt6
 aoE5S4sAk7EFzq5eJWmgGQmYGwdWAsu8dYPqvbDW6BxoVF+D3hOQIAD4oR1w1K95Bk
 HgZtxQuulfHHw==
Date: Tue, 15 Jul 2025 10:06:20 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Yao <richard@scandent.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Akshay Athalye <akshay@scandent.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: ilitek-ili9881c: Add Tianxianwei
 TWX700100S0 support
Message-ID: <20250715-daft-armadillo-of-luxury-4f5d6d@krzk-bin>
References: <20250714221804.25691-1-richard@scandent.com>
 <20250714221804.25691-3-richard@scandent.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250714221804.25691-3-richard@scandent.com>
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

On Mon, Jul 14, 2025 at 06:18:00PM -0400, Richard Yao wrote:
> Document the compatible value for Tianxianwei TWX700100S0 panel.
> 
> Signed-off-by: Richard Yao <richard@scandent.com>
> ---
>  .../devicetree/bindings/display/panel/ilitek,ili9881c.yaml       | 1 +
>  1 file changed, 1 insertion(+)
>

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

Please read:
https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.
</form letter>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

