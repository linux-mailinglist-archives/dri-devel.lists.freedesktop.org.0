Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4CEA17A84
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 10:52:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4A7E10E216;
	Tue, 21 Jan 2025 09:52:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="O4xqtr0H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A592410E216
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 09:52:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 141DEA41400;
 Tue, 21 Jan 2025 09:50:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76701C4CEDF;
 Tue, 21 Jan 2025 09:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737453151;
 bh=PROraVkzIJD81IIiVaOKlfp/Ts8aLobHr6k/3m6C0CA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O4xqtr0HGdFA4rJciWtAE6HDzwkBHKo0Bv6xSKW5rOVbR5hxPhxWkUhO7EWu5nrGD
 MHj0nIDMMkDmLOozgFXX40WAGZa+kMrKO//XpI51pnvmaRHDtAew1NNLp9dsyRi+Kc
 MTDxLy2C8+BzLBj/3Sjodh+zw1tGb+gcDIeUqvnn+QRc5E6JUhSfB+tk73OE+hXqzx
 w76vgR9a709da+V5BF7grTVSVTeL92cm1pM3hDmFLFYEpznWSRt6UXPa1A6gWo4T/T
 zO06ZgOQdf140T4eQEfCyvREMG9Ila6BLH1cNbQ78P5ZMQ+orE6azV7S4dDDaFdZ1l
 uoily9ER40F1A==
Date: Tue, 21 Jan 2025 10:52:27 +0100
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
Subject: Re: [RFC v3 03/18] dt-bindings: firmware: thead,th1520: Add support
 for firmware node
Message-ID: <20250121-lively-cocky-lorikeet-e0a3db@krzk-bin>
References: <20250120172111.3492708-1-m.wilczynski@samsung.com>
 <CGME20250120172123eucas1p13564bf2d07000506caf44cf55bda7fd9@eucas1p1.samsung.com>
 <20250120172111.3492708-4-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250120172111.3492708-4-m.wilczynski@samsung.com>
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

On Mon, Jan 20, 2025 at 06:20:56PM +0100, Michal Wilczynski wrote:
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0fa7c5728f1e..c56a1fb6e02a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20184,6 +20184,7 @@ M:	Fu Wei <wefu@redhat.com>
>  L:	linux-riscv@lists.infradead.org
>  S:	Maintained
>  T:	git https://github.com/pdp7/linux.git
> +F:	Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
>  F:	Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml

Misordered.

>  F:	Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml
>  F:	Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
> @@ -20194,6 +20195,7 @@ F:	drivers/mailbox/mailbox-th1520.c
>  F:	drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
>  F:	drivers/pinctrl/pinctrl-th1520.c
>  F:	include/dt-bindings/clock/thead,th1520-clk-ap.h
> +F:	include/dt-bindings/firmware/thead,th1520-aon.h
>  
>  RNBD BLOCK DRIVERS
>  M:	Md. Haris Iqbal <haris.iqbal@ionos.com>
> diff --git a/include/dt-bindings/firmware/thead,th1520-aon.h b/include/dt-bindings/firmware/thead,th1520-aon.h
> new file mode 100644
> index 000000000000..7607522289f7
> --- /dev/null
> +++ b/include/dt-bindings/firmware/thead,th1520-aon.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (C) 2022 Alibaba Group Holding Limited.
> + * Copyright (c) 2024 Samsung Electronics Co., Ltd.
> + * Author: Michal Wilczynski <m.wilczynski@samsung.com>
> + */
> +
> +#ifndef __DT_BINDINGS_AON_TH1520_H
> +#define __DT_BINDINGS_AON_TH1520_H
> +
> +#define TH1520_AON_VDEC_PD	1
> +#define TH1520_AON_NPU_PD	2
> +#define TH1520_AON_VENC_PD	3
> +#define TH1520_AON_GPU_PD	4
> +#define TH1520_AON_DSP0_PD	5
> +#define TH1520_AON_DSP1_PD	6

I don't see these being used in the driver. Can you point me?

Best regards,
Krzysztof

