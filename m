Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBB91A9DCE
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 13:50:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19F096E9AE;
	Wed, 15 Apr 2020 11:49:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A45146E9AE
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 11:49:57 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 373112166E
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 11:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586951397;
 bh=wuXS7RCUYgyS51p4SeDx49zy51VkJGb5/qdr8yBZ0d4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=xeYP5cgafRPn6YhT6fu/+txsms6Rtv2DIovKV6n2lrE++374gHweZw442o4eW6zsC
 0QPce/mOtpt2CYbuX3ZFAnyYNI2ZEwjJnhtikf8CEIIN6kqNvsnWY7Mv65g7qt/ye7
 uxrNjWBorfjR3nRfrgurBt9sUOOix1lQMqGuSVeE=
Received: by mail-lj1-f171.google.com with SMTP id l14so3320924ljj.5
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 04:49:57 -0700 (PDT)
X-Gm-Message-State: AGi0PuaJ/0s+Z5tvsIrPtzS0WC7xjC7fWaUIZHY6+uKU7fuy9vLQtth2
 JdG8B1BXoiztaVcybjlaPpSjujZ4KFvLeppUBrg=
X-Google-Smtp-Source: APiQypJ6JgZvNxuPA2SlFZq3seBA6kaFPbk0RkqFDGIpIMdWvmYwpqEO8cmLBYYdZ/c1p1IHSS++MGMZGzTZDC6zHHI=
X-Received: by 2002:a2e:9845:: with SMTP id e5mr3131512ljj.201.1586951395296; 
 Wed, 15 Apr 2020 04:49:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1586939718.git.hns@goldelico.com>
 <b6733f80546bf3e6b3799f716b9c8e0f407de03d.1586939718.git.hns@goldelico.com>
In-Reply-To: <b6733f80546bf3e6b3799f716b9c8e0f407de03d.1586939718.git.hns@goldelico.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 15 Apr 2020 13:49:44 +0200
X-Gmail-Original-Message-ID: <CAJKOXPcb9KWNAem-CAx_zCS+sZoEHYc0J8x0nk1xjY9hD4-M4w@mail.gmail.com>
Message-ID: <CAJKOXPcb9KWNAem-CAx_zCS+sZoEHYc0J8x0nk1xjY9hD4-M4w@mail.gmail.com>
Subject: Re: [PATCH v6 08/12] arm: dts: s5pv210: Add G3D node
To: "H. Nikolaus Schaller" <hns@goldelico.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>,
 James Hogan <jhogan@kernel.org>, Jonathan Bakker <xc-racer2@live.ca>,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 linux-omap@vger.kernel.org, Paul Burton <paulburton@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org,
 =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, letux-kernel@openphoenux.org,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Philipp Rossak <embed3d@gmail.com>, openpvrsgx-devgroup@letux.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>, kernel@pyra-handheld.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 15 Apr 2020 at 10:36, H. Nikolaus Schaller <hns@goldelico.com> wrote:
>
> From: Jonathan Bakker <xc-racer2@live.ca>
>
> to add support for SGX540 GPU.

Do not continue the subject in commit msg like it is one sentence.
These are two separate sentences, so commit msg starts with capital
letter and it is sentence by itself.

> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  arch/arm/boot/dts/s5pv210.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/arch/arm/boot/dts/s5pv210.dtsi b/arch/arm/boot/dts/s5pv210.dtsi
> index 2ad642f51fd9..e7fc709c0cca 100644
> --- a/arch/arm/boot/dts/s5pv210.dtsi
> +++ b/arch/arm/boot/dts/s5pv210.dtsi
> @@ -512,6 +512,21 @@ vic3: interrupt-controller@f2300000 {
>                         #interrupt-cells = <1>;
>                 };
>
> +               g3d: g3d@f3000000 {
> +                       compatible = "samsung,s5pv210-sgx540-120";
> +                       reg = <0xf3000000 0x10000>;
> +                       interrupt-parent = <&vic2>;
> +                       interrupts = <10>;
> +                       clock-names = "sclk";
> +                       clocks = <&clocks CLK_G3D>;

Not part of bindings, please remove or add to the bindings.

> +
> +                       power-domains = <&pd S5PV210_PD_G3D>;

Ditto

> +
> +                       assigned-clocks = <&clocks MOUT_G3D>, <&clocks DOUT_G3D>;
> +                       assigned-clock-rates = <0>, <66700000>;
> +                       assigned-clock-parents = <&clocks MOUT_MPLL>;

Probably this should have status disabled because you do not set
regulator supply.

Best regards,
Krzysztof
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
