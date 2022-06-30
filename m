Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AA0561F16
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 17:20:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3FEC10F604;
	Thu, 30 Jun 2022 15:20:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09FC210F604
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 15:20:44 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id p69so19431142iod.10
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 08:20:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/1HbS2XeFkAq2TGo4tfRIV4kCjKVeXOWKZ5BjlPxEG8=;
 b=JMMfrEfbCI7VbcK6Vt5lXr1RBAfdQjn6wUCe7qb0sD2JgwTGeESZBwTE1A+uQozX8X
 RUZDk+ORcklv/dgojLUwe60sgW6xR0vdo1kHpYYt/vPjGJWIrTR98SJRiHxelwUJp0Ng
 tf+lWmuR5vCshwqa+P0CPqQsOYCmFYPTsf0q3gHbjnQRl73x6WogPWSAXGn2NxlHELXD
 oc2A/Y+aUYk5pXYAmDAzCb9Ojt9Notlzu+0N/dW5OJl9W4i7edjxFBqUaKchJHc/EToW
 RP7vByLWmXI3WpnvyUeDI4WO2OUt6BCUJjvlifkhNmacv5qofbhW+ih84DeFtVkAYD/5
 MQ3Q==
X-Gm-Message-State: AJIora/mdH4RUNLP0W2bp2fOQMHawcQfSz86gRH4p1bYyYfEbGR2IUhy
 PqZCB90Hj1D9nvOHIZpsMA==
X-Google-Smtp-Source: AGRyM1vM/iFlvYVryv12Rx56X63E6E8m1CYyPidUegMYK9NrgRMC6l0oefCLQrMCdbepwDwdiiZ5tw==
X-Received: by 2002:a05:6602:1682:b0:65d:f539:e30 with SMTP id
 s2-20020a056602168200b0065df5390e30mr4625406iow.81.1656602443355; 
 Thu, 30 Jun 2022 08:20:43 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 124-20020a021d82000000b00339a0e19e8csm8632463jaj.90.2022.06.30.08.20.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 08:20:43 -0700 (PDT)
Received: (nullmailer pid 2731040 invoked by uid 1000);
 Thu, 30 Jun 2022 15:20:41 -0000
Date: Thu, 30 Jun 2022 09:20:41 -0600
From: Rob Herring <robh@kernel.org>
To: Mikko Perttunen <cyndis@kapsi.fi>
Subject: Re: [PATCH v7/v3 09/22] dt-bindings: Add bindings for Tegra234
 Host1x and VIC
Message-ID: <20220630152041.GA2730974-robh@kernel.org>
References: <20220627142008.2072474-1-cyndis@kapsi.fi>
 <20220627142008.2072474-10-cyndis@kapsi.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220627142008.2072474-10-cyndis@kapsi.fi>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 27 Jun 2022 17:19:55 +0300, Mikko Perttunen wrote:
> From: Mikko Perttunen <mperttunen@nvidia.com>
> 
> Update VIC and Host1x bindings for changes in Tegra234.
> 
> Namely,
> - New compatible strings
> - Sharded syncpoint interrupts
> - Optional reset.
> 
> Also, fix the order of descriptions for VM/hypervisor
> register apertures -- while the reg-names specification
> was correct, the descriptions for these were switched.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
> v2:
> * Add back 'required' for resets/reset-names on older SoCs
> * Simplified reg descriptions
> * Updated commit message
> v3:
> * Split out bracketing change in example
> ---
>  .../display/tegra/nvidia,tegra124-vic.yaml    |   1 +
>  .../display/tegra/nvidia,tegra20-host1x.yaml  | 106 +++++++++++++++---
>  2 files changed, 93 insertions(+), 14 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
