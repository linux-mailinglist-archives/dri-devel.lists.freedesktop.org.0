Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FBBACC69C
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 14:27:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2E2110E010;
	Tue,  3 Jun 2025 12:27:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SwfpTQER";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 092E710E010
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 12:27:48 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-e7b3410e122so4840991276.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jun 2025 05:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748953667; x=1749558467; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zkBUpTusJpTA0VXTt0i8mXorEGwS/Hyqj+o9q7jAdU0=;
 b=SwfpTQERjlsD+Bzy+zpQimQdpL4Ra9+QHzOQQWWyQpLraQSF312ZZM6zGlNa6yaOFr
 /soc+eo84XmFw+IAQk32MpADObH6rH8/pymopfRrjlEx33wCzl/WT+XZPIGCn358rKyc
 Jls8dCAVt7OsUB2vjsKSyuKtI3+HWoYSt9BM+uE+VioBmY+forgzjbp1t8fl8XyJTSBg
 PotEcu9BpClQpVRHUUCN2EHDtaUtVI4LHCsfweIPJntGbeQCQxVVZ0Y8DNNmcBuM0Goe
 Tr17d0E8+8+/NqZpb7CtnyZL3lkN4jW/tDMpj7JxGGYVzUDOnDx1gxNsEeWIE/mo+uaN
 WaOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748953667; x=1749558467;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zkBUpTusJpTA0VXTt0i8mXorEGwS/Hyqj+o9q7jAdU0=;
 b=P9r6SoSL9GYTO9Syxry6rxpry3XG9AamQhAUS36PNP7lU0o/PlRP8PytVi15GuEpbQ
 poBo5RR9Aj/0kMYdkkaBwxCRBB/Wn3BkC81dGAZiCpTobEee20+Vze6kk1wCco8EKOU+
 Bva5QO1hTIAwMv4ORNHTSOO1df/su91vKQ0HgCQ7dLR/mumlLY0zG3wqcUfqCmqPtNYI
 pCD3LHG2oJHg2VxqVijs7cS0uwQgrQ4F8/DSxGSMYkklGC2qEieWUy2VEZCE6SC5Ff6d
 5hsUeND63vi8OaTwhH6YRMJFg7HP294Jdz89tPor3k4Jy8A6bXWESf/SDcGv93bO+CpX
 YArg==
X-Forwarded-Encrypted: i=1;
 AJvYcCURIPfeKWPJm6EzIlPHh+aWzxAKLESei16oUC+Lbj4bfOhjWHeVtLyuCMesUCYJ+60dOwHaNDRnEMI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQqW2n4mpeLIwoNyv9yTBulA5xSLVreVngl1zgaHndwOW5Kntq
 0pwBgYx4vG8zd2ocvnTXiFu6PnVsoJ/VOwap8UUxkYLPtFzYqgsr6dbzWCSaQEIz0l45jWGP1/7
 DNiDzfWKeaW71DD8TrTttxoULbc7o/x7Hyuc/Sdbqbw==
X-Gm-Gg: ASbGncu6hB1GRPts/QyGE/tLS2i4sRAt9t9BWNT5ae64F1Ee/sGsWbnze/gd46n+AwE
 SWFtJ6I3jJUmRiETvhkOK1at6kBYS3aULRW4kHca7SW4O/wo0jnernKXaiyg3zTNLcFfEP/IDEG
 gq8anRF12ZbR/Qp80zpd3JV/2id6fA5QyV
X-Google-Smtp-Source: AGHT+IHrpeHkj+2BBo06F52MCRNOttN7I/OSF6yK1xPb3e+88rZaXmBzR2xH+shfwb8QDbG4StP/a4Wb3x5cAxCSx/4=
X-Received: by 2002:a05:6902:6b10:b0:e7d:b0b6:1bf6 with SMTP id
 3f1490d57ef6-e7f81dfaa44mr21941753276.12.1748953666949; Tue, 03 Jun 2025
 05:27:46 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250529222410eucas1p2e1d41a2fc717caef1aed51367a7db944@eucas1p2.samsung.com>
 <20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
 <20250530-apr_14_for_sending-v3-7-83d5744d997c@samsung.com>
In-Reply-To: <20250530-apr_14_for_sending-v3-7-83d5744d997c@samsung.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 3 Jun 2025 14:27:11 +0200
X-Gm-Features: AX0GCFuhikVc4rQPnpXMCgeyFTV30-WWzpds7-nPqvmmTrY7jKqhLTeVB-8SqLA
Message-ID: <CAPDyKFpYfZNthdRN=pCv4FEdFCzrKEH4aFBy4ew-xLKtpbJ5Tg@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] riscv: dts: thead: th1520: Add IMG BXM-4-64 GPU
 node
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 30 May 2025 at 00:24, Michal Wilczynski
<m.wilczynski@samsung.com> wrote:
>
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
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> index 6170eec79e919b606a2046ac8f52db07e47ef441..ee937bbdb7c08439a70306f035b1cc82ddb4bae2 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -225,6 +225,13 @@ aonsys_clk: clock-73728000 {
>                 #clock-cells = <0>;
>         };
>
> +       gpu_mem_clk: mem-clk {
> +               compatible = "fixed-clock";
> +               clock-frequency = <0>;
> +               clock-output-names = "gpu_mem_clk";
> +               #clock-cells = <0>;
> +       };
> +
>         stmmac_axi_config: stmmac-axi-config {
>                 snps,wr_osr_lmt = <15>;
>                 snps,rd_osr_lmt = <15>;
> @@ -504,6 +511,21 @@ clk: clock-controller@ffef010000 {
>                         #clock-cells = <1>;
>                 };
>
> +               gpu: gpu@ffef400000 {
> +                       compatible = "thead,th1520-gpu", "img,img-bxm-4-64",
> +                                    "img,img-rogue";
> +                       reg = <0xff 0xef400000 0x0 0x100000>;
> +                       interrupt-parent = <&plic>;
> +                       interrupts = <102 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&clk_vo CLK_GPU_CORE>,
> +                                <&gpu_mem_clk>,
> +                                <&clk_vo CLK_GPU_CFG_ACLK>;
> +                       clock-names = "core", "mem", "sys";
> +                       power-domains = <&aon TH1520_GPU_PD>;
> +                       power-domain-names = "a";

If the power-domain-names are really needed, please pick a
useful/descriptive name.

[...]

Kind regards
Uffe
