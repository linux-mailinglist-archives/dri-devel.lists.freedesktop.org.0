Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C710BA2182B
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 08:31:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E48C10E74F;
	Wed, 29 Jan 2025 07:31:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VABuxuU2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAB2D10E74F
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 07:31:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A18965C57F1;
 Wed, 29 Jan 2025 07:30:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87D90C4CEE0;
 Wed, 29 Jan 2025 07:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738135898;
 bh=vaLfSjS74gqgUZVZqpZI1Spi9TQQGJMrQAS15v1471U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VABuxuU27Ks/hWe7YYp/ddzQeaZDLN3UPkrl/THpXnuMyctbE5sHTHSnp3MeIMq7c
 wwOZZQraoGbvTOTTEq+WvLMZlHXPrssFW575y1bCBArS2cx+jq++4Z9ON4RVa8sQ9Y
 8+UPAd4kkoK5o1NVg1YB8j59NZk41qHAgg53gWFMc3VkWpGBmh8GZBvaroBFiWCs2m
 uhYX127ozm/hK4TmC4DMrO9k4LqWhZd3FE6yN0jDSEh0rRqU/vEy906s0AL2mlgUin
 zSA0AxA3ysKTJI86bJ2rvryAKDYcULXhPPVWxJsCTJ9CH1MSReCjuLntGyQ/6pLSsa
 +zs3MzRpdeouA==
Date: Wed, 29 Jan 2025 08:31:35 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com, guoren@kernel.org, 
 wefu@redhat.com, jassisinghbrar@gmail.com, paul.walmsley@sifive.com, 
 palmer@dabbelt.com, aou@eecs.berkeley.edu, frank.binns@imgtec.com, 
 matt.coster@imgtec.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, ulf.hansson@linaro.org,
 jszhang@kernel.org, p.zabel@pengutronix.de, m.szyprowski@samsung.com, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Subject: Re: [PATCH v4 05/18] dt-bindings: power: Add TH1520 SoC power domains
Message-ID: <20250129-daring-tan-hawk-ffdc1b@krzk-bin>
References: <20250128194816.2185326-1-m.wilczynski@samsung.com>
 <CGME20250128194831eucas1p258522118b2f21abd8f6d4cdde277fe07@eucas1p2.samsung.com>
 <20250128194816.2185326-6-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250128194816.2185326-6-m.wilczynski@samsung.com>
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

On Tue, Jan 28, 2025 at 08:48:03PM +0100, Michal Wilczynski wrote:
> Add power domain ID's for the TH1520 SoC power domains.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  MAINTAINERS                                   |  1 +
>  .../dt-bindings/power/thead,th1520-power.h    | 19 +++++++++++++++++++
>  2 files changed, 20 insertions(+)
>  create mode 100644 include/dt-bindings/power/thead,th1520-power.h

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

