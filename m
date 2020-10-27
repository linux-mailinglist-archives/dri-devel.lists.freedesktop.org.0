Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D232E29A74A
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 10:05:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BD9B6EB35;
	Tue, 27 Oct 2020 09:05:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AAB26EB35
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 09:05:56 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id p9so1132418eji.4
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 02:05:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FSlOTo+zGWamBX2WAxzQkPjeyrJMzym+nDUb6jRYhTI=;
 b=dtWktNoTBIVxsvZCIjQ47s4vZ0IyYFhXVxFIK9fhgP1dFfSTKevz1o5SmfsoCfZfGK
 qrSdUMOid0TRzBq39eGPjqxfIj5HQ8Io0Kj5u9rb8jF+nHG243fQ774WUGNHeEm2n+C7
 etNWRg9SL0UBJwmPNgKS1afvBuJcqI9tIZdaTcgbOVLP1WzPxjEzF+Y/+zlO9Jzi6U8N
 IDSAW0TnH4uodGNqVm6GoBBDDJFMhzwMMj+7pE+FzgTpxkJYKdn7jkGVfSoRKW3A0wGn
 ODbauOxkpDX0B5j7erSyP2G8e7XtfFTin5QKUaV/LYXH6bLFiOgyJxg8o/WkBxhONC/i
 Zs9A==
X-Gm-Message-State: AOAM531Vq5yUMvgmOdRSrQwL2GEcpp6fu7mvF24P3WiP/YVUYzt/cBAc
 s2uIc0qdRfWMceUL/ovIJbQ=
X-Google-Smtp-Source: ABdhPJwpB7zlslYYqry/Tn76sD9QhQfOP3c+c7xncdpzGfAK9wt/B+FS8uKYdnkUGHJeI6sHYSxQSg==
X-Received: by 2002:a17:906:aed9:: with SMTP id
 me25mr1447133ejb.52.1603789555092; 
 Tue, 27 Oct 2020 02:05:55 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
 by smtp.googlemail.com with ESMTPSA id o11sm608711ejd.60.2020.10.27.02.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 02:05:53 -0700 (PDT)
Date: Tue, 27 Oct 2020 10:05:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 09/52] dt-bindings: memory: tegra30: mc: Document new
 interconnect property
Message-ID: <20201027090550.GI4244@kozik-lap>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-10-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201025221735.3062-10-digetx@gmail.com>
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

On Mon, Oct 26, 2020 at 01:16:52AM +0300, Dmitry Osipenko wrote:
> Memory controller is interconnected with memory clients and with the
> External Memory Controller. Document new interconnect property which
> turns memory controller into interconnect provider.
> 
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/memory-controllers/nvidia,tegra30-mc.yaml       | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-mc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-mc.yaml
> index 84fd57bcf0dc..5436e6d420bc 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-mc.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-mc.yaml
> @@ -57,6 +57,9 @@ properties:
>    "#iommu-cells":
>      const: 1
>  
> +  "#interconnect-cells":
> +    const: 1
> +
>  patternProperties:
>    "^emc-timings-[0-9]+$":
>      type: object
> @@ -120,6 +123,7 @@ required:
>    - clock-names
>    - "#reset-cells"
>    - "#iommu-cells"
> +  - "#interconnect-cells"

Rob,

You were fine with adding a new required property which breaks all
existing DTBs?

Were these bindings marked as unstable? The patchset does not even
say/scream that it breaks the ABI, so this might be quite a surprise for
someone...

Best regards,
Krzysztof
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
