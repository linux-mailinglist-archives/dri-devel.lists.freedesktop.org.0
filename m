Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A32A63EF745
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 03:16:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FDDA6E2BC;
	Wed, 18 Aug 2021 01:16:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16E946E2BC
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 01:16:12 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 l36-20020a0568302b24b0290517526ce5e3so750273otv.11
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 18:16:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pZhI8s0bq6Q/ufRFM0cKz5GDmu8z9ddT9tyGnPEkEkA=;
 b=XXIG+1Sra1kjNcy9oNM+eWzbbe1woCEdByiyRTQZDCHKHK+91o8oU+gyHR1e+nLfwZ
 fAU6IybAzix/mZU3y43yR0fWa5no78W0QaZbw+7PGYXJerAeswMvavYfGJdoeYg6m2VV
 AsCOwuDjEEPtVI+dYFP/SQYzwRNWUA/37NMHCNkW6Nt4c/3hndSQVHyjq9N9X7PrsbmX
 jGd/FoRpyOP4xgLyQ9ftcbC8h7XwldwFkmihu62FgpPIjmNkQKS0cthP5UyMDgNw+RUR
 p/7+8BM7SBT6Zf10pCVJ2AtEAMJvYs8szO1aZCO5tkvYbbMtKr/1EFRXEJp8Xh7KSSdJ
 53Hg==
X-Gm-Message-State: AOAM530J6RyPQGJWZfDnDOo9c0fakuDJM7w7DMeX6sCQnlEafW9xDGyX
 Vm9hMCY4dNPmZROTx7kUaA==
X-Google-Smtp-Source: ABdhPJygYnXFnxnEh28gqMyYF6NthIHBysWjBhU7p2cYyKWsqAlZXR7MMNfgasUuDyAVpFFwk0mEQg==
X-Received: by 2002:a9d:ecc:: with SMTP id 70mr4970700otj.96.1629249371372;
 Tue, 17 Aug 2021 18:16:11 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id l7sm747356ooq.28.2021.08.17.18.16.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 18:16:10 -0700 (PDT)
Received: (nullmailer pid 1176067 invoked by uid 1000);
 Wed, 18 Aug 2021 01:16:08 -0000
Date: Tue, 17 Aug 2021 20:16:08 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, Peter Chen <peter.chen@kernel.org>, 
 Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>, 
 Stefan Agner <stefan@agner.ch>, Adrian Hunter <adrian.hunter@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, 
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-mmc@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org
Subject: Re: [PATCH v8 09/34] dt-bindings: host1x: Document Memory Client
 resets of Host1x, GR2D and GR3D
Message-ID: <YRxfWJJ6+1GgVs33@robh.at.kernel.org>
References: <20210817012754.8710-1-digetx@gmail.com>
 <20210817012754.8710-10-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210817012754.8710-10-digetx@gmail.com>
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

On Tue, Aug 17, 2021 at 04:27:29AM +0300, Dmitry Osipenko wrote:
> Memory Client should be blocked before hardware reset is asserted in order
> to prevent memory corruption and hanging of memory controller.
> 
> Document Memory Client resets of Host1x, GR2D and GR3D hardware units.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/display/tegra/nvidia,tegra20-host1x.txt          | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
> index 62861a8fb5c6..07a08653798b 100644
> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
> @@ -18,6 +18,7 @@ Required properties:
>  - resets: Must contain an entry for each entry in reset-names.
>    See ../reset/reset.txt for details.
>  - reset-names: Must include the following entries:
> +  - mc
>    - host1x

New entries should be at the end. Order matters.

>  
>  Optional properties:
> @@ -197,6 +198,7 @@ of the following host1x client modules:
>    - resets: Must contain an entry for each entry in reset-names.
>      See ../reset/reset.txt for details.
>    - reset-names: Must include the following entries:
> +    - mc
>      - 2d
>  
>    Optional properties:
> @@ -222,6 +224,8 @@ of the following host1x client modules:
>    - resets: Must contain an entry for each entry in reset-names.
>      See ../reset/reset.txt for details.
>    - reset-names: Must include the following entries:
> +    - mc
> +    - mc2 (Only required on SoCs with two 3D clocks)
>      - 3d
>      - 3d2 (Only required on SoCs with two 3D clocks)
>  
> -- 
> 2.32.0
> 
> 
