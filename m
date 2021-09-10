Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B30B7406CA3
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 15:08:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22D6F6E9F1;
	Fri, 10 Sep 2021 13:08:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AA036E9F1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 13:08:09 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 o16-20020a9d2210000000b0051b1e56c98fso2129586ota.8
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 06:08:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=283Y9UlcMi+APx5COV8qDm1rdMUU5aXjcw1zhBbMwjw=;
 b=jkz0B1MibU5h8xAsr2UCiLzzn2d+wOgUdovOskac1sniyZtDepxhG8DfTxxQF+FANm
 DrMpVq/tAmbC/GIGRANzyM0V0QXDWCcXRpabUoUy42p4VjyKm5sk58OMqfM9XAiwaH7K
 o6yuXNTuAW54y29hR1cbAMcTejs1HvDUmJJ4euTP8VXMKz8ot2wrkiocWKtupu+HWgVI
 LKGfnSKXcNexJNdA/O8ZDzIf+VL3OYcYlmYL2mYuU1Bgohejg8ECXmvvkpKiLNz31P2a
 jKV6n5G80eFh/5VFw5xtoGKzolrFehDj0qG0s4SkPZYRVifF83JtBI4yrgKuo+6qArZS
 3cuQ==
X-Gm-Message-State: AOAM5300Vjph8IGhC6lAe0EaxqL7q6rje+0WxVJ96oF9+t/a4fv+NP4k
 g8aysk9Vn2i+ngmTB6xeMQ==
X-Google-Smtp-Source: ABdhPJxV1nuJALXEy7y62dHRYbTZIvGmh4x5J83MUZxSWKiJ5l8KiRjl6RNLgHuhCAfQpQrnxr78Jg==
X-Received: by 2002:a05:6830:788:: with SMTP id
 w8mr1983528ots.235.1631279287960; 
 Fri, 10 Sep 2021 06:08:07 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id p81sm1235173oia.48.2021.09.10.06.08.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 06:08:05 -0700 (PDT)
Received: (nullmailer pid 2509935 invoked by uid 1000);
 Fri, 10 Sep 2021 13:08:04 -0000
From: Rob Herring <robh@kernel.org>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
 jonathanh@nvidia.com, robh+dt@kernel.org, linux-tegra@vger.kernel.org,
 daniel@ffwll.ch, devicetree@vger.kernel.org, airlied@linux.ie
In-Reply-To: <20210910104247.1206716-2-mperttunen@nvidia.com>
References: <20210910104247.1206716-1-mperttunen@nvidia.com>
 <20210910104247.1206716-2-mperttunen@nvidia.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: Add YAML bindings for NVDEC
Date: Fri, 10 Sep 2021 08:08:04 -0500
Message-Id: <1631279284.846111.2509934.nullmailer@robh.at.kernel.org>
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

On Fri, 10 Sep 2021 13:42:45 +0300, Mikko Perttunen wrote:
> Add YAML device tree bindings for NVDEC, now in a more appropriate
> place compared to the old textual Host1x bindings.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
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
>  .../gpu/host1x/nvidia,tegra210-nvdec.yaml     | 104 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 105 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml:104:1: [warning] too many blank lines (2 > 1) (empty-lines)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1526459

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

