Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04083ACDFA7
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 15:58:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5FE810E0DD;
	Wed,  4 Jun 2025 13:58:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nteHRQqW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9ED810E0DD
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 13:58:05 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-e7311e66a8eso5896927276.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jun 2025 06:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749045485; x=1749650285; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IFWXnsIMSq1bn0DUFYmY7z6V87/rRA1du54TZxFaV2Y=;
 b=nteHRQqWvKsn45DX8VwkF562ONu+2MFqAzCsLhmSFbmv60+Lrp8XYPqyHKOS3Bl4ZZ
 15fwhSC/KyV4fIdI9ezYvyYVSw5/CUr96h4SKOERI4ubyS3jPg94P3w6mctME4mjPQst
 AWvdGA+tLwLOhNjt8TsGcGTJlD1exV646vcu4vKk60gC4D6M1qNhEpzwkjTMPxVWKOuE
 3gCuBP0Wb0sMcOE4ma+xFcpy4ARplgMYn+MCVMBVDvJvn+6k0DjkKwU3wya7YnYwg6VK
 XP6zV0ZVI5cTlAp9nCA6aaNHdwRkqLHlkl0FLFzNNxnElm0yaUUfQ+/kGk9MF6odws5B
 c5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749045485; x=1749650285;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IFWXnsIMSq1bn0DUFYmY7z6V87/rRA1du54TZxFaV2Y=;
 b=AVuJGfKOxRuMv6vBXMMG4FjgM6kysZWsj406McvcC3CC8MUxHozMBK+6opA5vg/d35
 DOd1PYOerVALvr2MRw0adorSiZ3g1WPpTJyn2hAX+nzImkFdFslwmb/ehlNiYCEtklHl
 qz/gTzds0myIJ717twz+miW4FQ6VQcP0/22o53XVtM+PgG77jUGY+mQDHN+TvSndHZb6
 EleqrHQ63PlO6ERZHroC9QgPOnEhtLT/R+OPDMzszCIDwjSZro4fFdoMprQDWc5lkluR
 bTO3n17gkCcOhBKuJyfsgiz+HiCgKuydJHP48jDdKMDCD0h/AQgwHKnLHE+OFZzham2Y
 59xQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0c3O0Y8ruc2xJ2mWpQhIO+QM5fdXLpwTGGc5JmQII1Dmh4TA3a4glw71CyFwb6rz6J4whq/17e50=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzgJwKcgkxWP6cxYp4qujGF792hzFoG8p0ctbtO24x2MkLX+YVq
 yLueE8sXXBWTcg74knra2qxlxOwceLorU0TAfa/kap+hTEnkQrjWZgiR06lYlAFOUgbCE7iJSpQ
 VK1kBFjj7u+6Yls8FrZjenjN9DobuBW+f/ioOp8T50A==
X-Gm-Gg: ASbGnctdyDfjWXSxeYHIvpKNWr0C7sZ/A4bMYRf2M0JexYmp9FKlNhpCIOwNgHBWSnm
 hWICWbngKwU7aozGWOfwA9z5DcMfaFmgqeT4b2LZKddw5PlSVmJNie0FDE+N8R6PVWekhjOCmMV
 g4kwFovZVfEwKxCVzQhIoKWt5TStCalgLGXw==
X-Google-Smtp-Source: AGHT+IGXFY8gppNCB1I6k87GeD/bmWPUV8R4mMgK2i7dZCLcfF2RhkUBwoySiJMKIOMWeHJraaSZXAxgR7paTZPeyFU=
X-Received: by 2002:a05:6902:1383:b0:e81:2447:6b74 with SMTP id
 3f1490d57ef6-e817a0011f4mr3409868276.43.1749045484537; Wed, 04 Jun 2025
 06:58:04 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250529222410eucas1p2e1d41a2fc717caef1aed51367a7db944@eucas1p2.samsung.com>
 <20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
 <20250530-apr_14_for_sending-v3-7-83d5744d997c@samsung.com>
 <CAPDyKFpYfZNthdRN=pCv4FEdFCzrKEH4aFBy4ew-xLKtpbJ5Tg@mail.gmail.com>
 <a68e3bee-f4ad-4d73-a5a8-e39772c41711@samsung.com>
In-Reply-To: <a68e3bee-f4ad-4d73-a5a8-e39772c41711@samsung.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 4 Jun 2025 15:57:28 +0200
X-Gm-Features: AX0GCFsKqqHfcoyjgQNY4Bx0T-G_vnaUmkhnEv_Xdt_09WriRo8KoB3SpnFxVUU
Message-ID: <CAPDyKFo8scYL59+ELgawop30habZad0Xsd6bKGLXtSF+UNd9Ng@mail.gmail.com>
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

On Wed, 4 Jun 2025 at 14:40, Michal Wilczynski <m.wilczynski@samsung.com> wrote:
>
>
>
> On 6/3/25 14:27, Ulf Hansson wrote:
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
> Yeah they are required. Even though this convention doesn't seem to be
> enforced by the dt-binding it seems like it's hard-coded into the driver
> 330e76d31697 ("drm/imagination: Add power domain control"). So I don't
> think I have any choice here.

Well, unless there is a DT doc describing the power-domain-names it's
perfectly fine to change the driver too.

Moreover, it looks like 330e76d31697 is a brand new commit, just in
linux-next, so not even included in a release yet.

Kind regards
Uffe
