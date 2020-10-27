Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E53629A986
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 11:25:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 646B76EB63;
	Tue, 27 Oct 2020 10:25:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDA206EB63
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 10:25:11 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id p9so1452105eji.4
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 03:25:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ylNf2aSrBKpAGk/XmG8j77J1836YfOHwLDEKrBDhhto=;
 b=Rayd2+8OzbLQtbSKXxixk3xS92uid68VmFb651GFFOUwiNSdI6qKc4lic7reJEg9uJ
 LSdLCPpDFDgRlwccy5183vfQ4hlt0InOq1fQBbBeksuPiIvD5eMogxsG/TmsRduL0dwE
 MG2+Sg0Q9ytixauX21LJ2E2p/TTMmpxIL/vbN+E3AP8js8j6pq6xVdpFrnuZPwynrHDC
 ak7ldC2ZK+npBHsBV8CYq+rJv2hrm7c5frqBKKACegGRcub295EkeOMNLVyxWYg6wATm
 RHnVVgrA7dPTaXP4QZAp0ikkTxEgyrvEW5xmDJfNJ2ErF/mhw0Bf4HESggj4naA+SFrB
 P5Pg==
X-Gm-Message-State: AOAM532b1NEMh7U+MoHZFyiVHg+y3nxqRy+5Tqk7SF1gcg4OK4BFbZGO
 x6Sbb0cBW3pwBvn9boIpXP8=
X-Google-Smtp-Source: ABdhPJyTiWvQkB0SHAsJaXsSdNHED7COpFBG6lf+CNCt8imIyB1mFelDwWrl3AGCqa/XD9EaDgO3wg==
X-Received: by 2002:a17:906:3bc7:: with SMTP id
 v7mr1586575ejf.245.1603794310498; 
 Tue, 27 Oct 2020 03:25:10 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
 by smtp.googlemail.com with ESMTPSA id yw17sm747674ejb.97.2020.10.27.03.25.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 03:25:09 -0700 (PDT)
Date: Tue, 27 Oct 2020 11:25:06 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 13/52] dt-bindings: memory: tegra124: emc: Document
 new interconnect property
Message-ID: <20201027102506.GB17089@kozik-lap>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-14-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201025221735.3062-14-digetx@gmail.com>
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

On Mon, Oct 26, 2020 at 01:16:56AM +0300, Dmitry Osipenko wrote:
> External memory controller is interconnected with memory controller and
> with external memory. Document new interconnect property which turns
> External Memory Controller into interconnect provider.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/memory-controllers/nvidia,tegra124-emc.yaml   | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml
> index 278549f9e051..ac00832ceac1 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml
> @@ -29,6 +29,9 @@ properties:
>      items:
>        - const: emc
>  
> +  "#interconnect-cells":
> +    const: 0
> +
>    nvidia,memory-controller:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description:
> @@ -327,6 +330,7 @@ required:
>    - clocks
>    - clock-names
>    - nvidia,memory-controller
> +  - "#interconnect-cells"

Another required property, what about all existing users of this binding?

>  
>  additionalProperties: false
>  
> @@ -345,6 +349,7 @@ examples:
>  
>          #iommu-cells = <1>;
>          #reset-cells = <1>;
> +        #interconnect-cells = <1>;

You meant '0'?

Best regards,
Krzysztof
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
