Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1DBADFB67
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 04:50:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D25010E1AF;
	Thu, 19 Jun 2025 02:50:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="je1fdK/y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 620D310E1AF
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 02:50:19 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-3134c67a173so260426a91.1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 19:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1750301419; x=1750906219;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tB8e1qVEfhuTIR6cCezHfjL1333Oy60fxLgjuSXst14=;
 b=je1fdK/yP41PLM+7zLJxHHRjp4ExBvCtwobHRM7iPQq0k8MAq88MaE9KBr2k9v0568
 6PUusZhM5TjIudLbVXiwqdFDDeClVCeNEirezsKrOHUQgf27aobiBg1ObH/kZOW1mTlb
 6tLV0+edNY1+s39Qc2F/riptwHOHKK8Sls6Yu7ayEIH96w579GUVoM/SQOzEKI0xl6l0
 xJON1p4qnLbr11ypeSFEqNy0Zk72B52S14eiUbIZnDmSVfqg3E3wkvaSlOal51F6bXAT
 76miioobdi8QcHO2yv35co+NKV1tBTk2Xb5pbs0DFyQpQdA8DySstbvUg0cO2e2RsBYs
 q+sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750301419; x=1750906219;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tB8e1qVEfhuTIR6cCezHfjL1333Oy60fxLgjuSXst14=;
 b=cKInY0Pdtol6WvFiSR8LZk0QoSmegVINpuOHcFXWwpw2mMM7Lz935xhTYJxCX5Ukz8
 l8hJCf8uGeRscG8SQBsWTCSy6SnBy+OQWpaBxF18jcT3Tsg4Q/6Odum9jhlnf9jklLZN
 Rd0vTOFFOU7Yxq8fdMgFJEAignkJEsI4oZfNzUGIZrjC5rYSVrx/FolzUJaUSVL1THaP
 b9a24qvlPiG7NZ143OcNqzjmQS2WlmGvmTwikqPHOyGCaIFWSacWO5YZp2iJEO5PPgZj
 R5knvKg4jhdZ0C6jdhWAXzb7+GLBH3HuoWltffYyO6UiWVLc3wbQmfV9siCvYFG16DQ7
 WNHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6lKD4HX3ud6Z2YBP9pVaK2G3SqSpPeT0A8ms+sfzkPweYqQmwxxempvZLF5HCgc3pvoAy24qFxI4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YywodOk1q8P86XgXyH7yaxOYtcyMRkPvZh1sy+iBoqvZbgpFgAo
 DQUQlTaqxvnRA9TpJxC16Huf9hmKqyIfqBGSHbeF5giZPbG3PX1DmnH9HIvRHFuhkfA=
X-Gm-Gg: ASbGnctbnSZ+nN8ourPUAUAjG28BH/4mykpDSBCVZf/NLTzsEZpfHFW82CwphvnOHSw
 7JTFxYLGfP7B7zlB3RZ7CkdppfaItgg/2MxzFv41knifAxz8Y7yogKtAyrKwBTl056Wme/cDTZh
 ZgEjSh4VKx32NjUZhFcyF2HRCojoQn0WvN3qIpY9OCOfLRFtXUS8/sN6ws+WmHqr9QFCTQDDU8Y
 Vn1OoL7ZjNZoL6kQZhqmga3HWi1GJ9NqdX7XkW4UhLwF8V4xuZLQRzsMC7T9ZSEWzyfOjl/vLdf
 qq0m1kJi2gMmuOmVfg4jHYnyj4EaG35PD/SjSKiSu2yOcsnZbkXHuXI90ZQ065/3B9nSVWk=
X-Google-Smtp-Source: AGHT+IFubn9Xjjn7fmMto+xZqblm2yd0WPXfa0iuVG1BkV+6lAGb7+2YAe7yAyYCgSsbecVsjsPVIw==
X-Received: by 2002:a17:90b:524b:b0:311:ab20:159a with SMTP id
 98e67ed59e1d1-313f1d1c00cmr26840306a91.29.1750301418839; 
 Wed, 18 Jun 2025 19:50:18 -0700 (PDT)
Received: from x1 (97-120-250-80.ptld.qwest.net. [97.120.250.80])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3158a25617asm985583a91.33.2025.06.18.19.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jun 2025 19:50:18 -0700 (PDT)
Date: Wed, 18 Jun 2025 19:50:16 -0700
From: Drew Fustini <drew@pdp7.com>
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
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 7/8] riscv: dts: thead: th1520: Add IMG BXM-4-64 GPU
 node
Message-ID: <aFN66I9GsCb9qC4G@x1>
References: <20250618-apr_14_for_sending-v5-0-27ed33ea5c6f@samsung.com>
 <CGME20250618102233eucas1p228b24f58e4cb3d15b0f273530b582cea@eucas1p2.samsung.com>
 <20250618-apr_14_for_sending-v5-7-27ed33ea5c6f@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618-apr_14_for_sending-v5-7-27ed33ea5c6f@samsung.com>
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

On Wed, Jun 18, 2025 at 12:22:13PM +0200, Michal Wilczynski wrote:
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
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> index f3f5db0201ab8c0306d4d63072a1573431e51893..c8447eef36c3a6e92d768658b6b19dfeb59a47c4 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -225,6 +225,13 @@ aonsys_clk: clock-73728000 {
>  		#clock-cells = <0>;
>  	};
>  
> +	gpu_mem_clk: mem-clk {
> +		compatible = "fixed-clock";
> +		clock-frequency = <0>;
> +		clock-output-names = "gpu_mem_clk";
> +		#clock-cells = <0>;
> +	};
> +
>  	stmmac_axi_config: stmmac-axi-config {
>  		snps,wr_osr_lmt = <15>;
>  		snps,rd_osr_lmt = <15>;
> @@ -500,6 +507,21 @@ clk: clock-controller@ffef010000 {
>  			#clock-cells = <1>;
>  		};
>  
> +		gpu: gpu@ffef400000 {
> +			compatible = "thead,th1520-gpu", "img,img-bxm-4-64",
> +				     "img,img-rogue";
> +			reg = <0xff 0xef400000 0x0 0x100000>;
> +			interrupt-parent = <&plic>;
> +			interrupts = <102 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clk_vo CLK_GPU_CORE>,
> +				 <&gpu_mem_clk>,
> +				 <&clk_vo CLK_GPU_CFG_ACLK>;
> +			clock-names = "core", "mem", "sys";
> +			power-domains = <&aon TH1520_GPU_PD>;
> +			power-domain-names = "a";
> +			resets = <&rst TH1520_RESET_ID_GPU>;
> +		};
> +
>  		rst: reset-controller@ffef528000 {
>  			compatible = "thead,th1520-reset";
>  			reg = <0xff 0xef528000 0x0 0x4f>;
> 
> -- 
> 2.34.1
> 

Reviewed-by: Drew Fustini <drew@pdp7.com>
