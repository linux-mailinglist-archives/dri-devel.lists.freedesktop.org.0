Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D463B1D341
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 09:27:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E14DF10E7F0;
	Thu,  7 Aug 2025 07:26:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RARr7oXY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26FC810E7F0
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Aug 2025 07:26:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 58C4A5C629A;
 Thu,  7 Aug 2025 07:26:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6275DC4CEED;
 Thu,  7 Aug 2025 07:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754551618;
 bh=bb7LlDA7OpV7Qv2Xzhoqqi80I/uW8JaOPH4FzntEDfQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RARr7oXYIsoOmGGKVYK80eGl+V7p9fEMpd6wq8gkvI2QAw3Pdn/Qza1dm4JMuQIrR
 ckHcFFIbPjSyYXr/bDzKd9wTpftvlrtlWh15XwQH58GQlO6e+zJGVNp3500ZZn5QYD
 5QneCWxxF3IjJSq5ND/6IsuN9KFsCuZch9rp7IJaEKeFaWa8yXIY41vKuTh9M5iowv
 ulfCsz9H9JMuN7Rc6ASg0VhV8C/3QfmVDNQteffZ4he+83stLI7XNfGWr4Vd5y9RNR
 e6HhbcXI/axVm5F+nI+ndKUr629ax2PLvQV26eyZ57qaiXWLKFxTy2cm/t4Tz3sNwv
 ItroFzgrdWagw==
Date: Thu, 7 Aug 2025 09:26:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: imx@lists.linux.dev, Abel Vesa <abelvesa@kernel.org>, 
 Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Philipp Zabel <p.zabel@pengutronix.de>,
 Marek Vasut <marex@denx.de>, Frank Li <frank.li@nxp.com>,
 linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 0/9] Add support for i.MX94 DCIF
Message-ID: <20250807-psychedelic-vulture-of-valor-d743cc@kuoka>
References: <20250806150521.2174797-1-laurentiu.palcu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250806150521.2174797-1-laurentiu.palcu@oss.nxp.com>
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

On Wed, Aug 06, 2025 at 06:05:07PM +0300, Laurentiu Palcu wrote:
> Hi,
> 
> This patch-set adds support for the i.MX94 Display Control Interface.
> It depends on Peng Fan's DTS patch [1] that was not yet merged. Also, it
> needs the BLK CTL changes [2] that I spinned off from v2 in a different
> patchset.
> 
> Also, included in the patch-set are a few extra patches that the DCIF
> driver depends on for functioning properly:
>  * 1/9 - 3/9 : add support for i.MX94 to fsl-ldb driver. It also
> 			   contains a patch (2/9) from Liu Ying that was already reviewed
> 			   and was part of another patch-set ([3]), but was never merged;
> 
> v3:
>  * Removed the BLK CTL patches and created a separate patch set [2] for them;
>  * Collected r-b tags for 1/9, 2/9, 3/9 and 9/9;
>  * Removed the DCIF QoS functionality until I find a better way to
>    implement it through syscon. QoS functionality will be added in
>    subsequent patches. Also, used devm_clk_bulk_get_all() and used
>    dev_err_probe() as suggested;
>  * Addressed Frank's and Krzysztof's comments on the DCIF bindings;

What exactly changed? I cannot find v2 of one of the patches, no lore
links here, so with incomplete changelog I say you make it difficult for
me to review it.

Best regards,
Krzysztof

