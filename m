Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 834354760DB
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 19:37:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB83310E6AA;
	Wed, 15 Dec 2021 18:37:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 633DF10E6AA
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 18:37:32 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 u18-20020a9d7212000000b00560cb1dc10bso25968559otj.11
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 10:37:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1SeB84S69bpsa1PObCsguFCuIUK1jo7w+NpM6xYNgYQ=;
 b=NUeWy1TXD+/ffUSwWxok2cNgJ49y8rahmqPrG5S3AmAsKT9gKWatLBgMzkTIxkp0K4
 mrlkVj0uxO2DA+H7jn9yScBaLwTY/I6tw8HpU27BDiQ8LC01dSEzKRWRDIUAc2dELgxq
 TNcQBryORHIMsMfplYjeWB7kak7VYh3RvUZchi8XdBW0sP1Jn8mosi6eqadcFuL7g2QT
 ZJaSDwZo+V5XwYPkw3R+UgPWIv5ng9HnSR4armbiSFzUoHLyi1tJrRbuNJ8NJ4seUplW
 ZfH6rixpmnQTO7BCRPjyTMogDr26ywZK1rjr2TuL9OjLyxVufN+XYG70djv/3rshC+Gb
 zE9A==
X-Gm-Message-State: AOAM5332MtdRw52ZUKCFfrT7x1ej47har+TU6NtSP52DYWY15IbHeHRg
 OnRtkaJ7iCXw6Z6itaHO5w==
X-Google-Smtp-Source: ABdhPJwjTsE+G4GlNjpU1uHHk79mPFLVzI/DID9ltvFzWeKtA+cshnlVlgrxc/OfhJkOkys0N0IFIw==
X-Received: by 2002:a05:6830:1ddd:: with SMTP id
 a29mr9883407otj.311.1639593451526; 
 Wed, 15 Dec 2021 10:37:31 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id b22sm474096oib.41.2021.12.15.10.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 10:37:30 -0800 (PST)
Received: (nullmailer pid 1614869 invoked by uid 1000);
 Wed, 15 Dec 2021 18:37:29 -0000
Date: Wed, 15 Dec 2021 12:37:29 -0600
From: Rob Herring <robh@kernel.org>
To: Akhil R <akhilrajeev@nvidia.com>
Subject: Re: [PATCH 1/2] dt-bindings: i2c: tegra: Add SMBus feature properties
Message-ID: <Ybo16aNZ5MBW6XY6@robh.at.kernel.org>
References: <1639062321-18840-1-git-send-email-akhilrajeev@nvidia.com>
 <1639062321-18840-2-git-send-email-akhilrajeev@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1639062321-18840-2-git-send-email-akhilrajeev@nvidia.com>
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
 dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
 linaro-mm-sig@lists.linaro.org, andy.shevchenko@gmail.com,
 ldewangan@nvidia.com, thierry.reding@gmail.com, linux-i2c@vger.kernel.org,
 linux-tegra@vger.kernel.org, digetx@gmail.com, christian.koenig@amd.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 09, 2021 at 08:35:20PM +0530, Akhil R wrote:
> Tegra I2C can use a gpio as an smbus-alert. Document the usage of
> the same.
> 
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
>  Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.txt b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.txt
> index 3f2f990..71ee79b 100644
> --- a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.txt
> +++ b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.txt
> @@ -70,6 +70,10 @@ Required properties:
>    - rx
>    - tx
>  
> +optional properties:
> +- smbalert-gpio: Must contain an entry for the gpio to be used as smbus alert.
> +  It will be used only if optional smbus-alert property is present.

There's already a standard way to do this with interrupts. And GPIOs can 
be interrupts usually.

> +
>  Example:
>  
>  	i2c@7000c000 {
> -- 
> 2.7.4
> 
> 
