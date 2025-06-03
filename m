Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8F9ACC79F
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 15:22:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71CF710E60E;
	Tue,  3 Jun 2025 13:22:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NzT5xA3O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9735A10E607
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 13:22:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BAAFCA501FD;
 Tue,  3 Jun 2025 13:22:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0281C4CEED;
 Tue,  3 Jun 2025 13:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748956928;
 bh=AeP+iL5P7qpLgfVgmLcOenednHQMm95Ci593umBxRE8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NzT5xA3OmAdEgRSvkvLt9CI1a+FbVuq2tkARJG7t186qPTmQtIBAqDj3Riq4lYU3X
 hh7augS36aqONwII4MdyqFp8Cm0MD4oq5vTNoinNv5wPB7eOOpd536RG+bbiYTK5fU
 K66Hai7QwRu4Vd/vvPeiQ7XJul0Soe/BtUzqMzGPus5AxEvZiewHu58dhX+CGt2Ex6
 RKOYR23e8jQSTbxbSF6/Pc9+FiFjqXXDCViGzSGgQpFpHdXF8nKtO0GZoXA+SHtT5r
 abxL40K0qMXZ0aTcHfXbJ+gjEz+wN6rXdMoxE5XeYkzO8gooxbgalqtlwh4GoCAvzF
 KjN/DUfmd3fRQ==
Date: Tue, 3 Jun 2025 15:22:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 6/8] riscv: dts: thead: Add GPU power sequencer node
Message-ID: <20250603-gleaming-mammoth-of-kindness-538add@kuoka>
References: <20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
 <CGME20250529222408eucas1p20f62cea4c9c64bb5dda6db1fd38fb333@eucas1p2.samsung.com>
 <20250530-apr_14_for_sending-v3-6-83d5744d997c@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250530-apr_14_for_sending-v3-6-83d5744d997c@samsung.com>
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

On Fri, May 30, 2025 at 12:23:53AM GMT, Michal Wilczynski wrote:
> Add the device tree node for the T-HEAD TH1520 GPU power sequencer
> (gpu_pwrseq) to the th1520.dtsi file.
> 
> This node instantiates the thead,th1520-gpu-pwrseq driver, which

Explain the hardware, not what drivers do.

> is responsible for managing the GPU's power-on/off sequence. The node
> specifies the gpu-clkgen reset, which is one of the resources
> controlled by this sequencer.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> index bdbb1b985b0b76cf669a9bf40c6ec37258329056..6170eec79e919b606a2046ac8f52db07e47ef441 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -238,6 +238,12 @@ aon: aon {
>  		#power-domain-cells = <1>;
>  	};
>  
> +	gpu_pwrseq: pwrseq {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +		compatible = "thead,th1520-gpu-pwrseq";
> +		resets = <&rst TH1520_RESET_ID_GPU_CLKGEN>;
> +		reset-names = "gpu-clkgen";

What is the point of pwrseq if there is no consumer/user of it? Looks
like simple placeholder and anyway maybe the future consumer should just
use reset directly.

Best regards,
Krzysztof

