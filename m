Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E71B323BB
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 22:44:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B8B310E0B0;
	Fri, 22 Aug 2025 20:43:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="myyMEVM+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E537410EB9C
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 20:43:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C7DAEA58AD0;
 Fri, 22 Aug 2025 20:43:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A1F9C4CEED;
 Fri, 22 Aug 2025 20:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755895435;
 bh=TEdHF9pUX27RDqqMATVQj7+pnf8Vs/Rf6VDbI1qD1Lk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=myyMEVM+bG7+YSaMj6mY2qSH8azZg5DrqUVeNO5J30SqcakUL1hcNdIoGKP1xJCLX
 AP3TMdbKHat3PbYVL99dJnb4p3+vvlet5ome8KfpPnNtrQyb5zwncNFGbDAbd0SjdG
 ydTEvhFHNa5jRrjCjmc7QH8T5SvIPWHy9DYPx7Ik92gJ2Gr5XFcqHHpeV9dnHUDjQ1
 fFiiNmill6JZ8rsVEWWXVc+5sr9J2iAVRUO4FNc8IF/TpHRxlPfV44lfcxeCQ0Dyif
 KU7Co8VS4oHGDY8b0ADiAzrRgKiFwNYJueNi8ud5pvOi+fVBRpzfjRB2Fzgwx7nZlS
 fQ0aLSJ9nKI6Q==
Date: Fri, 22 Aug 2025 13:43:53 -0700
From: Drew Fustini <fustini@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v13 3/4] riscv: dts: thead: th1520: Add IMG BXM-4-64 GPU
 node
Message-ID: <aKjWiU4fQw3k77GR@x1>
References: <20250822-apr_14_for_sending-v13-0-af656f7cc6c3@samsung.com>
 <CGME20250821222023eucas1p1805feda41e485de76c2981beb8b9102d@eucas1p1.samsung.com>
 <20250822-apr_14_for_sending-v13-3-af656f7cc6c3@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822-apr_14_for_sending-v13-3-af656f7cc6c3@samsung.com>
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

On Fri, Aug 22, 2025 at 12:20:17AM +0200, Michal Wilczynski wrote:
> Add a device tree node for the IMG BXM-4-64 GPU present in the T-HEAD
> TH1520 SoC used by the Lichee Pi 4A board. This node enables support for
> the GPU using the drm/imagination driver.
> 
> By adding this node, the kernel can recognize and initialize the GPU,
> providing graphics acceleration capabilities on the Lichee Pi 4A and
> other boards based on the TH1520 SoC.
> 
> Add fixed clock gpu_mem_clk, as the MEM clock on the T-HEAD SoC can't be
> controlled programatically.
> 
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Reviewed-by: Drew Fustini <drew@pdp7.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Acked-by: Matt Coster <matt.coster@imgtec.com>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)

I've applied this to thead-dt-for-next [1]:

0f78e44fb857 ("riscv: dts: thead: th1520: Add IMG BXM-4-64 GPU node")

Thanks,
Drew

[1] https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git/log/?h=thead-dt-for-next

