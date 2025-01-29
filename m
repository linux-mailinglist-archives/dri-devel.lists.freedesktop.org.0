Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C162EA21817
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 08:29:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AFF010E06E;
	Wed, 29 Jan 2025 07:29:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XbAqTznq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13A7410E06E
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 07:29:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 134D9A40249;
 Wed, 29 Jan 2025 07:27:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9843C4CED3;
 Wed, 29 Jan 2025 07:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738135771;
 bh=DXSINqkmFSvNXZ9ZgNUdpFLZfOy0cstu/Nnpuqu30vA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XbAqTznqG2RKyauAP1Wo2Hfs0x+2I4RrU4O0/QclXgYFjHcLHbkvro8MU29Md7BgN
 4EKO6LxIPLbNhal3n0geqjJZcHN0QTKRzx4WAmz9QiT5oP0YvRyGegdHt8rLjprf8N
 QuldEFKC0Q2l1InZM/Sf8nqHe8D5OaTfX0odhd5Lfs65sGTzmTVlNrsThkgOCG4b88
 jhBEEQEa4K0pcp+iIqwr98ddocM5ECQZ1LWvaiqI+qSPQlOM1QNriV0RkSmG4RZa+X
 RLOGYDqnfVVllxCcZNDUNpDz6T0QkxcX64DI5hJS1WfeAzZJbnVQD+jKSoyE1A5X+E
 Z1jGiHO/+CTxw==
Date: Wed, 29 Jan 2025 08:29:28 +0100
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
Subject: Re: [PATCH v4 01/18] dt-bindings: clock: thead: Add TH1520 VO clock
 controller
Message-ID: <20250129-outstanding-golden-taipan-d3fff5@krzk-bin>
References: <20250128194816.2185326-1-m.wilczynski@samsung.com>
 <CGME20250128194826eucas1p1b18e5af64e66b06da985b194d022273c@eucas1p1.samsung.com>
 <20250128194816.2185326-2-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250128194816.2185326-2-m.wilczynski@samsung.com>
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

On Tue, Jan 28, 2025 at 08:47:59PM +0100, Michal Wilczynski wrote:
> Add device tree bindings for the TH1520 Video Output (VO) subsystem
> clock controller. The VO sub-system manages clock gates for multimedia
> components including HDMI, MIPI, and GPU.
> 
> Document the VIDEO_PLL requirements for the VO clock controller, which
> receives its input from the AP clock controller. The VIDEO_PLL is a
> Silicon Creations Sigma-Delta (integer) PLL typically running at 792 MHz
> with maximum FOUTVCO of 2376 MHz.
> 
> This binding complements the existing AP sub-system clock controller
> which manages CPU, DPU, GMAC and TEE PLLs.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  .../bindings/clock/thead,th1520-clk-ap.yaml   | 17 ++++++++--
>  .../dt-bindings/clock/thead,th1520-clk-ap.h   | 33 +++++++++++++++++++
>  2 files changed, 47 insertions(+), 3 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

