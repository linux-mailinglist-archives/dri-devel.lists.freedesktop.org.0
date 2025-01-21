Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C22A17A74
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 10:47:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8554F10E52D;
	Tue, 21 Jan 2025 09:47:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QFw3hIUx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E93D10E52B
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 09:47:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D9EAFA413E1;
 Tue, 21 Jan 2025 09:45:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EFCAC4CEDF;
 Tue, 21 Jan 2025 09:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737452832;
 bh=gOL40yEr1/NPatRuvUJBWXcIzOUAyp06nqREo6aK9zg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QFw3hIUxRpB0pMNWW0ecfvl/6pcMDQLWAHAlTacL7xDYfmxnfuC2GgHgmQtGA7lA/
 HJOeo177MwbuT8NRlE5PllCCq85/rUPQFQig62PxdRqJrgvkTAVu2CssMFUkaT1oNX
 5hyF7ug7CtXd3SZWU/NKZN4QfJkaErG6w1aIqu/zSnzKIRUpfzpgu4KQrrI/bFNWbZ
 NTC/bMqfhPAhj4hkrtbE7q+PknOLGSPlUWMPT9Ju3401Mnl1SRtydWjtFuBcCKS3dR
 M9Y8x32vW601rin/e5SpoULr1kgQU+1jVQPYtgOpe0keb4APlUOx8lmu94YtAq67/0
 ocYLgz1JQbhzw==
Date: Tue, 21 Jan 2025 10:47:09 +0100
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
Subject: Re: [RFC v3 01/18] dt-bindings: clock: Add VO subsystem clock
 controller support
Message-ID: <20250121-raptor-of-terrific-perfection-cafc27@krzk-bin>
References: <20250120172111.3492708-1-m.wilczynski@samsung.com>
 <CGME20250120172120eucas1p23993cdbbe65e82054b9cb92fb704103b@eucas1p2.samsung.com>
 <20250120172111.3492708-2-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250120172111.3492708-2-m.wilczynski@samsung.com>
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

On Mon, Jan 20, 2025 at 06:20:54PM +0100, Michal Wilczynski wrote:
>  properties:
>    compatible:
> -    const: thead,th1520-clk-ap
> +    enum:
> +      - thead,th1520-clk-ap
> +      - thead,th1520-clk-vo
>  
>    reg:
>      maxItems: 1
>  
>    clocks:
>      items:
> -      - description: main oscillator (24MHz)
> +      - description: main oscillator (24MHz) or CLK_VIDEO_PLL

thead,th1520-clk-ap gets also VIDEO_PLL? Aren't both serving the same
purpose from these devices point of view? Bindings are telling what this
device is expecting.

>  
>    "#clock-cells":
>      const: 1
> @@ -51,3 +54,10 @@ examples:
>          clocks = <&osc>;
>          #clock-cells = <1>;
>      };
> +
> +    clock-controller@ff010000 {
> +        compatible = "thead,th1520-clk-vo";

Difference in one property does not justify new example. If there is
goign to be resend, just drop.


> +        reg = <0xff010000 0x1000>;
> +        clocks = <&clk CLK_VIDEO_PLL>;
> +        #clock-cells = <1>;

Best regards,
Krzysztof

