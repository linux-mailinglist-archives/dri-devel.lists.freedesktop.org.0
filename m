Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F022A4002B6
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 17:56:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E22A6E8AC;
	Fri,  3 Sep 2021 15:56:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFBCD6E8AC
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Sep 2021 15:56:15 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id bi4so7386633oib.9
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Sep 2021 08:56:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=OO8luS8vgFhGkY6YSH40ZaexdCs2RwuF6KUiXO6O8tY=;
 b=lzOCmHrZRSnNxKMLp9zVC3106FuHOtp2jQb+lFSjcX6FQARkSUIJCPkTSQdHbHoHvd
 JjtwXEmVHwZhaznu4sPw1ZdKz1+3nXpkKtloiesLtppkLsRh8P0gqn3uvqYjklPBD60Z
 UztWjn7bz98VM8WbW8xlns6GCw2eYJGyqcmdJqaI2KPhlBsXAdz1LgxfDmjcL/Y8lQpc
 0MMsPWcNPW5Dv96G4D6INoAw2DvnB6T2qK6mNfJpn3ngTAut/0NWW/cykrji2LzZXwFC
 r8lrcr5/MHaERS90439sEOGREeog67oS5K7T6LgNI6yScYv409nHZ38LRleDPjgYStXQ
 p8jQ==
X-Gm-Message-State: AOAM530iXA2mP6QvwWCjj8bjLzbieZXFU9kKV4BMeFkiFuM+r5XFLj2e
 du1Oc9DA+5FNREPbj/dArA==
X-Google-Smtp-Source: ABdhPJyLABGfu7vavSWKCNaNztOHcPGmiaVkLlo6BKMej6uKXD1qbWjFW2ILxDIMF0F0iGps99lXCw==
X-Received: by 2002:aca:ba44:: with SMTP id k65mr3229328oif.131.1630684575013; 
 Fri, 03 Sep 2021 08:56:15 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id 8sm1069046oix.7.2021.09.03.08.56.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 08:56:14 -0700 (PDT)
Received: (nullmailer pid 3010410 invoked by uid 1000);
 Fri, 03 Sep 2021 15:56:11 -0000
From: Rob Herring <robh@kernel.org>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org, jonathanh@nvidia.com,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 thierry.reding@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org
In-Reply-To: <20210903083155.690022-2-mperttunen@nvidia.com>
References: <20210903083155.690022-1-mperttunen@nvidia.com>
 <20210903083155.690022-2-mperttunen@nvidia.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: Add YAML bindings for NVDEC
Date: Fri, 03 Sep 2021 10:56:11 -0500
Message-Id: <1630684571.605300.3010409.nullmailer@robh.at.kernel.org>
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

On Fri, 03 Sep 2021 11:31:53 +0300, Mikko Perttunen wrote:
> Add YAML device tree bindings for NVDEC, now in a more appropriate
> place compared to the old textual Host1x bindings.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
> v4:
> * Fix incorrect compatibility string in 'if' condition
> v3:
> * Drop host1x bindings
> * Change read2 to read-1 in interconnect names
> v2:
> * Fix issues pointed out in v1
> * Add T194 nvidia,instance property
> ---
>  .../gpu/host1x/nvidia,tegra210-nvdec.yaml     | 109 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 110 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml:109:1: [warning] too many blank lines (2 > 1) (empty-lines)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1524104

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

