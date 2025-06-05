Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1608FACED2D
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 11:58:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 248A210EA1F;
	Thu,  5 Jun 2025 09:58:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bIb1TikC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25EAF10E9F4
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 09:58:29 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-e812c817de0so791373276.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jun 2025 02:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749117507; x=1749722307; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4zPdTQVDPRTSNl8wo5w6MeNmYmfyR+yoWh8tW6/DZaY=;
 b=bIb1TikCkHdcsGACydxikznViVO6ZcnXPzAoSsfuZfV1i6ua05Y4EydcaPengj0iKN
 Z2Tgx6M4XN1nkPsYkQH5zaf/x1ZeB9eSmARcODCu7Suyu8NrSfR2TMnZhNKkBDbMZgt+
 hHRQOHHy0SVhRJflY7Z4rypGPCpEKxCRoVUk82X8ROoPwTi+lTz4NWQbxR8N2wJM3MSK
 8VVpHKwAbSGjUZsknzugEKTu7F4hI2PcDKi4fI4wdojfHdCvc7raeU8yDePwfVFWty6D
 OfizjCttivV8XZo+IKTlNYt8GAKNXcveGk02p+lqp5YvXzerFMr28bsDA4onURTQuKYg
 g8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749117507; x=1749722307;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4zPdTQVDPRTSNl8wo5w6MeNmYmfyR+yoWh8tW6/DZaY=;
 b=dyU0VgVaVs44T8Np3ZO2J0MDELZECdvrzXU7NCyb1d0YHCRrrHnowTlhL9lgSYEb3f
 AJIYg3Y1lnTLLvhhBJridfCfhAynpNu9Q1nLOv7W9DXOfOG0X24qVob/aa+4Ph5Q1O10
 HOTdJ0V/T/NXtQAPQ5P5bK9Q8sw6paFFilWBvjzHgjD5mc7haCrodd4rAPBLaynysK8H
 pKY7MKrObpqoyYmKXtlChc+F/OIfFq0anUASmiks7W8hLZ3DSeHkMxH1CD03KlzR/HFy
 q64Jk9fFOigXpP2k4kNV2pA7n/ga1m+QRzNVUDOpM/XYnUB4QsbeBccDT2cidaBin7Vz
 6t7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXa4jlMErnV3MPUufx+jej14eqRtPZjSBsXLvQxZwXXBdxU6o/ON9T72Jy+2hN8hzZp0xKo9vkYteE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywdb5xaZMkUVM5goLCS2I663G/Fb7jatpFGTF8LEVNuAOFlTdtJ
 Hc5MxOCEeghVr8qUnOtBVy0CN8UFkazVTzqK4swvq6wxsLnHkwknb3zAEnwBZgfh6fFaw1ix7ER
 U9BhbhYlczV3eXKck4AI84T9yZdmbDpRMIep/R8bNXg==
X-Gm-Gg: ASbGncu0WzZbc3re5NBoXAVDdSCO5ALdzhRbMmM7PXwLNdR7it8fgwLcPESucnw2mRB
 ie2nlqefzQNX8AsdaidmtK8Ux/SNgRl4sU1EYroRzmBNlEzZJQ1kq6QYE4a+Rx2n9QXjMuUfbnb
 ic4TNz2/Y6SPlTl8gSCYHkvqvSn3QWqKTbeA==
X-Google-Smtp-Source: AGHT+IEs9z2qDMjfH7cC75fVmmSjHZHDht5i6D5bKkcjTo5PY949JkkRdQafZEhuxNNXbWaU8JI1NrPxlkNCttr89yg=
X-Received: by 2002:a05:6902:1006:b0:e81:89b9:f7fb with SMTP id
 3f1490d57ef6-e8189b9fd46mr2688470276.20.1749117507589; Thu, 05 Jun 2025
 02:58:27 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250529222410eucas1p2e1d41a2fc717caef1aed51367a7db944@eucas1p2.samsung.com>
 <20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
 <20250530-apr_14_for_sending-v3-7-83d5744d997c@samsung.com>
 <CAPDyKFpYfZNthdRN=pCv4FEdFCzrKEH4aFBy4ew-xLKtpbJ5Tg@mail.gmail.com>
 <e39c6748-59aa-4c4a-98f3-263751a120c1@imgtec.com>
In-Reply-To: <e39c6748-59aa-4c4a-98f3-263751a120c1@imgtec.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 5 Jun 2025 11:57:51 +0200
X-Gm-Features: AX0GCFs9t2KTNaikDlvnZamDB-7XXtdndYPeCom5IA-jJ40VSGgqWKBlwED7Z-4
Message-ID: <CAPDyKFrxqp30RWGoudVsy2NR7dSUoKwxc=nk3Bqp9RVZGZ6_vQ@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] riscv: dts: thead: th1520: Add IMG BXM-4-64 GPU
 node
To: Matt Coster <Matt.Coster@imgtec.com>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>, Drew Fustini <drew@pdp7.com>,
 Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Frank Binns <Frank.Binns@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
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

On Wed, 4 Jun 2025 at 18:48, Matt Coster <Matt.Coster@imgtec.com> wrote:
>
> On 03/06/2025 13:27, Ulf Hansson wrote:
> > On Fri, 30 May 2025 at 00:24, Michal Wilczynski
> > <m.wilczynski@samsung.com> wrote:
> >>
> >> Add a device tree node for the IMG BXM-4-64 GPU present in the T-HEAD
> >> TH1520 SoC used by the Lichee Pi 4A board. This node enables support for
> >> the GPU using the drm/imagination driver.
> >>
> >> By adding this node, the kernel can recognize and initialize the GPU,
> >> providing graphics acceleration capabilities on the Lichee Pi 4A and
> >> other boards based on the TH1520 SoC.
> >>
> >> Add fixed clock gpu_mem_clk, as the MEM clock on the T-HEAD SoC can't be
> >> controlled programatically.
> >>
> >> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> >> ---
> >>  arch/riscv/boot/dts/thead/th1520.dtsi | 22 ++++++++++++++++++++++
> >>  1 file changed, 22 insertions(+)
> >>
> >> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> >> index 6170eec79e919b606a2046ac8f52db07e47ef441..ee937bbdb7c08439a70306f035b1cc82ddb4bae2 100644
> >> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> >> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> >> @@ -225,6 +225,13 @@ aonsys_clk: clock-73728000 {
> >>                 #clock-cells = <0>;
> >>         };
> >>
> >> +       gpu_mem_clk: mem-clk {
> >> +               compatible = "fixed-clock";
> >> +               clock-frequency = <0>;
> >> +               clock-output-names = "gpu_mem_clk";
> >> +               #clock-cells = <0>;
> >> +       };
> >> +
> >>         stmmac_axi_config: stmmac-axi-config {
> >>                 snps,wr_osr_lmt = <15>;
> >>                 snps,rd_osr_lmt = <15>;
> >> @@ -504,6 +511,21 @@ clk: clock-controller@ffef010000 {
> >>                         #clock-cells = <1>;
> >>                 };
> >>
> >> +               gpu: gpu@ffef400000 {
> >> +                       compatible = "thead,th1520-gpu", "img,img-bxm-4-64",
> >> +                                    "img,img-rogue";
> >> +                       reg = <0xff 0xef400000 0x0 0x100000>;
> >> +                       interrupt-parent = <&plic>;
> >> +                       interrupts = <102 IRQ_TYPE_LEVEL_HIGH>;
> >> +                       clocks = <&clk_vo CLK_GPU_CORE>,
> >> +                                <&gpu_mem_clk>,
> >> +                                <&clk_vo CLK_GPU_CFG_ACLK>;
> >> +                       clock-names = "core", "mem", "sys";
> >> +                       power-domains = <&aon TH1520_GPU_PD>;
> >> +                       power-domain-names = "a";
> >
> > If the power-domain-names are really needed, please pick a
> > useful/descriptive name.
>
> This isn't the first time our unfortunate power domain names have come
> up [1][2]. Sadly, we're stuck with them for Rogue.

Wow, that's really crazy.

BTW, are there any reasons why you can't rely on attaching them by
index instead, via dev_pm_domain_attach_by_id() for example? Thus
entirely drop the names in the DT docs?

It sounds like the names don't really have a meaning, or do they?

>
> Matt
>
> [1]: https://lore.kernel.org/r/ff4e96e4-ebc2-4c50-9715-82ba3d7b8612@imgtec.com/
> [2]: https://lore.kernel.org/r/cc6a19b3-ba35-465c-9fa6-a764df7c01c1@imgtec.com/
>
> >

[...]

Kind regards
Uffe
