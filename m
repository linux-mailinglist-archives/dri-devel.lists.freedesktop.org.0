Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 775992DEE42
	for <lists+dri-devel@lfdr.de>; Sat, 19 Dec 2020 11:57:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9016F89DC7;
	Sat, 19 Dec 2020 10:57:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97F2389DC7
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Dec 2020 10:57:24 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id ga15so6905014ejb.4
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Dec 2020 02:57:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EpBQBebW9DJ389TpaCDahYCkX51lISZZEMe47kdJ6lQ=;
 b=eC6FtTKLja1CpmrB0HMZZaxodJ8vuH+/aJub1cevhCmnoJC5y80Au+v1jGO21fch+h
 0GBnUviEWuSwV/d3tbOPzFWLdWiNhLflZTRx4Ixk1mwXiGrmkzMGscz8Ddt58uJCfSyv
 IOWCWT4zmehq23Iuavz55JY5Gagf7VB4+dRJr4qaN04achycL2J44siMfm8Wfta2RA1C
 JQuY7adK+Tb5rSDu1OH/nt8SrfOxKfgrXDdEGUH1MxgZtuSA7K/adwU4Mfax/BV7slUg
 aojOrugqwepVAzTsiVw8sTjoxcLOGkbhgXJ56QWJN0BUgNEsQ3yp9Y8w+09vnMJa0D7v
 oH9A==
X-Gm-Message-State: AOAM530iFxCx3jbThuf8cXGa09lp1KkmpqU//NdnZXDaaZmB8g73xrXL
 tU6dWSNkIXAWAuQDLchgK7A=
X-Google-Smtp-Source: ABdhPJyWR/64ayreIal22iSj58nHkNVe6iV5yUrUJ5pe5qe42bhP84ft40zxoVfZe823dJe4zocuIg==
X-Received: by 2002:a17:906:4ec7:: with SMTP id
 i7mr8055250ejv.252.1608375443178; 
 Sat, 19 Dec 2020 02:57:23 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id pk19sm6666596ejb.32.2020.12.19.02.57.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Dec 2020 02:57:22 -0800 (PST)
Date: Sat, 19 Dec 2020 11:57:20 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 07/48] dt-bindings: arm: tegra: Add binding for core
 power domain
Message-ID: <20201219105720.GA5323@kozik-lap>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-8-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201217180638.22748-8-digetx@gmail.com>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-clk@vger.kernel.org, devel@driverdev.osuosl.org,
 Kevin Hilman <khilman@kernel.org>, Nicolas Chauvet <kwizart@gmail.com>,
 Viresh Kumar <vireshk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 17, 2020 at 09:05:57PM +0300, Dmitry Osipenko wrote:
> All NVIDIA Tegra SoCs have a core power domain where majority of hardware
> blocks reside. Add binding for the core power domain.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../arm/tegra/nvidia,tegra20-core-domain.yaml | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-core-domain.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-core-domain.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-core-domain.yaml
> new file mode 100644
> index 000000000000..f3d8fd2d8371
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-core-domain.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/tegra/nvidia,tegra20-core-domain.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra Core Power Domain
> +
> +maintainers:
> +  - Dmitry Osipenko <digetx@gmail.com>
> +  - Jon Hunter <jonathanh@nvidia.com>
> +  - Thierry Reding <thierry.reding@gmail.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nvidia,tegra20-core-domain
> +      - nvidia,tegra30-core-domain

The file should be in bindings/power.
Include also the power-domain.yaml schema.

> +
> +  operating-points-v2:
> +    description:
> +      Should contain level, voltages and opp-supported-hw property.
> +      The supported-hw is a bitfield indicating SoC speedo or process
> +      ID mask.
> +
> +  "#power-domain-cells":
> +    const: 0
> +
> +  power-supply:
> +    description:
> +      Phandle to voltage regulator connected to the SoC Core power rail.
> +
> +required:
> +  - compatible
> +  - operating-points-v2
> +  - "#power-domain-cells"
> +  - power-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    core-domain {

power-domain (to follow schema and devicetree spec)

Best regards,
Krzysztof


> +        compatible = "nvidia,tegra20-core-domain";
> +        operating-points-v2 = <&opp_table>;
> +        power-supply = <&regulator>;
> +        #power-domain-cells = <0>;
> +    };
> -- 
> 2.29.2
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
