Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A85A82B0111
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 09:16:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40A246E1BE;
	Thu, 12 Nov 2020 08:16:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com
 [IPv6:2607:f8b0:4864:20::a41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C439289F27
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 11:45:39 +0000 (UTC)
Received: by mail-vk1-xa41.google.com with SMTP id b190so418252vka.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 03:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W2LROEDqwB/YAfpZuvnNBx/s/n4ussPUTp1SoV848WE=;
 b=Rj4QLbP7hQUGidksqh3Sz+Mz1awLgghgywmgmq9iaGhu6djYI966xmN5JUcRmcYrq/
 Woc2NSWg8j33913hx6Vmfrrzuym6+skblcbvL41IiQFacYFt1SjAs/nslFk+g3W36u4V
 5Z4diCxFrS93BVrqJ7SDLPJfjdeswkTya8vvZmjaKgR3zhBTTE1EhWuFIHUSn9N1wPo1
 iX4p8Jc2fBB3F1mpe8ZqM6XFLIoz2+OX+tvgiLg3x8tn5z0hkeUvi4fzbnv3qjZga/O9
 dv9NoC5jp/yLI8jF8N3x1Yw2xoMv3ppOhpBWH3CIkWAXgT5hobFLAqPh/q8PjOiT3/Eo
 yovw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W2LROEDqwB/YAfpZuvnNBx/s/n4ussPUTp1SoV848WE=;
 b=Th5X2IvS8sDCXfpcHOCALal2q8Q7iejnbpYQs8/HyJOoCBZCBpwGVhqDDf9sKm3TXy
 2LSBsxIz+kUxgOD90fDjy8Qz8aqK/jladx+bUcFmaYNQSrRWTK81WSEydN/y6EpVPwl6
 YF/wwQDnvrVcQVdI/bPzdWtdo14ItofIvHNgFJdTBivx1fG2CMxF6tcApy7FrT/mopLY
 nPHsBn1bcMg4h3qv2x9s+lelRHZxWxv8oq0K5J766tG2Pm+oXXAmMYEdJrvmYtD5wkcY
 zceBVarIL4+04CMUEhIqd/+BomyuCvB2gMoIh1a8EuUYVAQXRPYAHbz4cquKHYwKPcnR
 Ud/g==
X-Gm-Message-State: AOAM533urCahN1uJcIDN+mo7dNdi0Gza9tjS0mLfrEbxmYy3HyurXMfw
 tx2xo9H3SWTokmWKdLCqBGAP05RgvIR8awB8ZavMKA==
X-Google-Smtp-Source: ABdhPJy49vZO4pNDp6JtJUn+KdVv0aND0NyO3da5g+cVxXyOVmgGe9S4bf/F/v98cY0CP0i1NrbPCyiERv3WhWMkEBU=
X-Received: by 2002:a1f:41cc:: with SMTP id o195mr13053486vka.15.1605095138861; 
 Wed, 11 Nov 2020 03:45:38 -0800 (PST)
MIME-Version: 1.0
References: <20201104234427.26477-1-digetx@gmail.com>
 <20201104234427.26477-2-digetx@gmail.com>
In-Reply-To: <20201104234427.26477-2-digetx@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 11 Nov 2020 12:45:02 +0100
Message-ID: <CAPDyKFpYeLjeYan74QdtWxtLhZZT-855Rd21sFHBkQXZg78D5g@mail.gmail.com>
Subject: Re: [PATCH v1 01/30] dt-bindings: host1x: Document OPP and voltage
 regulator properties
To: Dmitry Osipenko <digetx@gmail.com>, Rob Herring <robh+dt@kernel.org>
X-Mailman-Approved-At: Thu, 12 Nov 2020 08:15:51 +0000
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
Cc: Peter Chen <Peter.Chen@nxp.com>, DTML <devicetree@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 driverdevel <devel@driverdev.osuosl.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Alan Stern <stern@rowland.harvard.edu>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linux-pwm@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux USB List <linux-usb@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 5 Nov 2020 at 00:44, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> Document new DVFS OPP table and voltage regulator properties of the
> Host1x bus and devices sitting on the bus.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../display/tegra/nvidia,tegra20-host1x.txt   | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
> index 34d993338453..0593c8df70bb 100644
> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
> @@ -20,6 +20,18 @@ Required properties:
>  - reset-names: Must include the following entries:
>    - host1x
>
> +Optional properties:
> +- operating-points-v2: See ../bindings/opp/opp.txt for details.
> +- core-supply: Phandle of voltage regulator of the SoC "core" power domain.
> +
> +For each opp entry in 'operating-points-v2' table of host1x and its modules:
> +- opp-supported-hw: One bitfield indicating:
> +       On Tegra20: SoC process ID mask
> +       On Tegra30+: SoC speedo ID mask
> +
> +       A bitwise AND is performed against the value and if any bit
> +       matches, the OPP gets enabled.
> +
>  Each host1x client module having to perform DMA through the Memory Controller
>  should have the interconnect endpoints set to the Memory Client and External
>  Memory respectively.
> @@ -45,6 +57,8 @@ of the following host1x client modules:
>    - interconnect-names: Must include name of the interconnect path for each
>      interconnect entry. Consult TRM documentation for information about
>      available memory clients, see MEMORY CONTROLLER section.
> +  - core-supply: Phandle of voltage regulator of the SoC "core" power domain.
> +  - operating-points-v2: See ../bindings/opp/opp.txt for details.
>

As discussed in the thread for the cover-letter.

We already have DT bindings for power-domains (providers and
consumers). Please use them instead of adding SoC specific bindings to
each peripheral device.

[...]

Kind regards
Uffe
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
