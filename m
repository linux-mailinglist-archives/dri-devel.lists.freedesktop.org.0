Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E157C29A72E
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 10:03:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ECE46EB2E;
	Tue, 27 Oct 2020 09:03:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 166996EB2E
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 09:03:08 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id x1so627284eds.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 02:03:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Yrkq+w+CNrcs2d/CHfaDmYUZq0y1BCcvuJB0UBRduYM=;
 b=fq/Yd+/8P0uEg/b+ddEBFIgC/J3BMvvkrqFx4fRLhCzP7lecueZXOUjtRMb8gNU5bi
 h1uYkvjw+UtaHfebhR2BbM69xspgTJBfIUArPsvhfemuW5LnfvYRTnSmuVRmbzZgWBQw
 t4DI2Kj9+2WYNHsTaGAibfZj0uByc0KIGhPH7sLO0t1kE1AYUf6LtpqeLPgycX23mKS3
 8SLnhvkLZ6vFci05ZWocT/hAMI2u8A3A2C11p+tceZGkBL3kCRa8iN508/K+BSNyo3HI
 7yurizKwqNDj9nELl9n915h5M7xQCwBFxuLt77rjWbgng3RoRKtJt5K/L0BARnEMM7BE
 MKUg==
X-Gm-Message-State: AOAM5320cSbikyLWMT7iqvefM6em6TsLOHv/S7QtGvbA3V1rJCu6BoWk
 xxlrmKAgnLWWZnqX1YmZJ8E=
X-Google-Smtp-Source: ABdhPJzNdRHhqt+RsXfXzhPc0FfVZYTR4QTRInXFxqbry09ZA816h7phOrK/RR0xsohIY4dLm8QVeg==
X-Received: by 2002:aa7:c6d9:: with SMTP id b25mr1096980eds.27.1603789386647; 
 Tue, 27 Oct 2020 02:03:06 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
 by smtp.googlemail.com with ESMTPSA id p4sm587298eji.105.2020.10.27.02.03.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 02:03:05 -0700 (PDT)
Date: Tue, 27 Oct 2020 10:03:03 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 06/52] dt-bindings: memory: tegra20: emc: Document new
 interconnect property
Message-ID: <20201027090303.GH4244@kozik-lap>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-7-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201025221735.3062-7-digetx@gmail.com>
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
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <cyndis@kapsi.fi>, dri-devel@lists.freedesktop.org,
 Nicolas Chauvet <kwizart@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 26, 2020 at 01:16:49AM +0300, Dmitry Osipenko wrote:
> External Memory Controller is interconnected with memory controller and
> with external memory. Document new interconnect property which turns EMC
> into interconnect provider.
> 
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/memory-controllers/nvidia,tegra20-emc.txt          | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
> index 1b0d4417aad8..0a53adc6ccba 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
> +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
> @@ -13,6 +13,7 @@ Properties:
>  - interrupts : Should contain EMC General interrupt.
>  - clocks : Should contain EMC clock.
>  - nvidia,memory-controller : Phandle of the Memory Controller node.
> +- #interconnect-cells : Should be 0.
>  
>  Child device nodes describe the memory settings for different configurations and clock rates.
>  
> @@ -21,6 +22,7 @@ Example:
>  	memory-controller@7000f400 {
>  		#address-cells = < 1 >;
>  		#size-cells = < 0 >;
> +		#interconnect-cells = < 0 >;

No spaces within <>. I see existing example, but bad pattern should not
be continued just because it is already there.

Best regards,
Krzysztof
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
