Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 488F540EE7B
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 02:49:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C2256EA14;
	Fri, 17 Sep 2021 00:49:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C05F16EA38
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 00:49:09 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id a15so10124915iot.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 17:49:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=6zodSke86hnlsQe7klR3A5X+2RRUPHUNpKbftVQV0oE=;
 b=tEbCOZfvO6Mdd0WoEMNHr+JUTaRffvvAdsuyJyYmGwm2A085k7y1mXwIy1SCKPuNAE
 xxRBYvtIn6CmZlhYYorl0tYfhFTsd7CPDRbyXsNkddFO9XA6A+bAOBzjCTmc/GqWNRge
 y9xIP4zWXZO4Ls7g1sb/jmB6gjehjyCVEu+Kghd/1ZFRwms7FulpTp8iYq2tfS4xkWJC
 K4Zv2/xh1F4lrNtb60WldApqO6gieu4PZmLqC99oVbLun3x6BWz84zcppMB3Ghj/v3Ff
 vNpDmDaJIcrpHCUI4NW9qkD1xRfoUD4ur5SZWqkvFOYmgZAwESQKhwGBX+PieUHx0hI2
 IErA==
X-Gm-Message-State: AOAM531V4sSfipUF+NzRwqbcVL8QLPyZYhHx/Bl1Xrk22CGkdteczM5Z
 UfYjnTlwv+VuG9hoBgSE7A==
X-Google-Smtp-Source: ABdhPJxbqFS9VhfN7t4ZOhlO3skieDQOI5xZyT2eWGR/1mS9FuokN01beDwOIfVzeVBuy/bDqxtasA==
X-Received: by 2002:a6b:7710:: with SMTP id n16mr6311114iom.101.1631839748848; 
 Thu, 16 Sep 2021 17:49:08 -0700 (PDT)
Received: from robh.at.kernel.org (96-84-70-89-static.hfc.comcastbusiness.net.
 [96.84.70.89])
 by smtp.gmail.com with ESMTPSA id z15sm2498669ioh.28.2021.09.16.17.49.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 17:49:08 -0700 (PDT)
Received: (nullmailer pid 1484025 invoked by uid 1000);
 Fri, 17 Sep 2021 00:49:06 -0000
From: Rob Herring <robh@kernel.org>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: daniel@ffwll.ch, thierry.reding@gmail.com, linux-tegra@vger.kernel.org,
 dri-devel@lists.freedesktop.org, airlied@linux.ie, devicetree@vger.kernel.org,
 robh+dt@kernel.org, jonathanh@nvidia.com
In-Reply-To: <20210916145517.2047351-2-mperttunen@nvidia.com>
References: <20210916145517.2047351-1-mperttunen@nvidia.com>
 <20210916145517.2047351-2-mperttunen@nvidia.com>
Subject: Re: [PATCH v6 1/3] dt-bindings: Add YAML bindings for NVDEC
Date: Thu, 16 Sep 2021 19:49:06 -0500
Message-Id: <1631839746.871547.1484024.nullmailer@robh.at.kernel.org>
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

On Thu, 16 Sep 2021 17:55:15 +0300, Mikko Perttunen wrote:
> Add YAML device tree bindings for NVDEC, now in a more appropriate
> place compared to the old textual Host1x bindings.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
> v6:
> * Elaborated description for nvidia,host1x-class.
> * Added default value for nvidia,host1x-class.
> v5:
> * Changed from nvidia,instance to nvidia,host1x-class optional
>   property.
> * Added dma-coherent
> v4:
> * Fix incorrect compatibility string in 'if' condition
> v3:
> * Drop host1x bindings
> * Change read2 to read-1 in interconnect names
> v2:
> * Fix issues pointed out in v1
> * Add T194 nvidia,instance property
> ---
>  .../gpu/host1x/nvidia,tegra210-nvdec.yaml     | 108 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 109 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml:108:1: [warning] too many blank lines (2 > 1) (empty-lines)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1528902

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

