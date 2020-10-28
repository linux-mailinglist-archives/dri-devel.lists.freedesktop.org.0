Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF2329D099
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 16:16:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA24A6E575;
	Wed, 28 Oct 2020 15:16:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 273EC6E575
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 15:16:33 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id h62so4518997oth.9
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 08:16:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tEpfJA/Z9AKrEVaajdL+QptYcnQ05daCxtJhgSiGjgE=;
 b=KtpfRIfCr9COn/PStszjCAhzykZLGxHtzcOMDqbOmnvw9NS8l3Y5A7nRYOjh/tRa96
 oo25Rn+LZleLJ1crcs72zr/1xyk4rnpo4VJ3caCK1blNTKypy0rbM4TS552Jz/O4XvDF
 J0wK7UHDaxZAP8ZvzaGXGH54a/5Cofx/F9brRxbxBV5Iap8lRBO1NFHSy8KaJaI3IDyP
 t2VjZcaw6u80KKPcCakYan9H2Wcvd96Hl5GaLGWABd3T8H+p+igPDNl4SVL1vLr8r4d6
 TwmHqltT/4KpjWk2fr70PAEXL9VLYPugz1fjAUAETEPqS9ugWYCF+CRFFBJizcjWqJMT
 V2Rw==
X-Gm-Message-State: AOAM531C4HQCoY7MEvQdsr5dDgJ8sso+RGmZKuBlYvid8KyTYpZ9cFjL
 G4DVr3WAcTR9t6p0r+y2vg==
X-Google-Smtp-Source: ABdhPJzMI0qpyEpldPp5Skmtq0XN2ZPZ/0VkR6YRCtR8HrbN2dO6boMbO257rWxdkY/LpYL4aX72Pg==
X-Received: by 2002:a05:6830:1c62:: with SMTP id
 s2mr5192386otg.177.1603898192374; 
 Wed, 28 Oct 2020 08:16:32 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id h135sm2598822oib.23.2020.10.28.08.16.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 08:16:30 -0700 (PDT)
Received: (nullmailer pid 4041362 invoked by uid 1000);
 Wed, 28 Oct 2020 15:16:29 -0000
Date: Wed, 28 Oct 2020 10:16:29 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 03/52] dt-bindings: memory: tegra20: emc: Correct
 registers range in example
Message-ID: <20201028151629.GA4041307@bogus>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-4-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201025221735.3062-4-digetx@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Mikko Perttunen <cyndis@kapsi.fi>, Chanwoo Choi <cw00.choi@samsung.com>,
 linux-pm@vger.kernel.org, Nicolas Chauvet <kwizart@gmail.com>,
 Viresh Kumar <vireshk@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Peter De Schrijver <pdeschrijver@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 26 Oct 2020 01:16:46 +0300, Dmitry Osipenko wrote:
> There is superfluous zero in the registers base address and registers
> size should be twice bigger.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/memory-controllers/nvidia,tegra20-emc.txt          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
