Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5942A659A8D
	for <lists+dri-devel@lfdr.de>; Fri, 30 Dec 2022 17:34:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E423910E063;
	Fri, 30 Dec 2022 16:34:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A55D310E063
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Dec 2022 16:34:39 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id g2so8346395ila.4
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Dec 2022 08:34:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YUQ13UNlMnnU+RdBOzrUXm3dMsngq/6hNGyj9q9MZiw=;
 b=OBxbYeX2NwUBwUpCncHKTT/TLoG58tMR5z2hRB7RBCbm/TpRitTbtx4JIn8O5xmY/b
 nSuRKxUjEcHtKcslTunOJAO4YMnkZ4PZAd20hRBg/Om9GD7ZQN65LVT3KjzZtw+Ikfgv
 O5kHdWD6IQafHfxJ4Z4rZHgvdAQFzmBvHpmUPqU+jrE8Be8xkLN+MHgRk4KVBUj4RvVf
 DUoRj7/g5VGLte3GVl77fitOVzAi5309V8GO0kxfY6ZvYFN41sOXB2ElDhQEHtMymWuU
 3kpCrliZcpl9x7scfKOiWzYLouWMgveM5EQ+u1PXjsdFeDSJY1Zr9McF0U3hS6jhz67j
 ArSg==
X-Gm-Message-State: AFqh2kq0V1gqaLQ1REyI3S93u+Fwoc56r+xomQDs2YoAuou908N/tQkn
 s9zRu6nJ7XvV38mDwr5iJg==
X-Google-Smtp-Source: AMrXdXuqzf/p/KUX/Q6NKkpnki1GkGA1OTlRSftkvhspmWMJCquaB27tfx1TAffdn4xlh0Cred4a0g==
X-Received: by 2002:a92:504:0:b0:30c:323c:f7d1 with SMTP id
 q4-20020a920504000000b0030c323cf7d1mr1707763ile.15.1672418078764; 
 Fri, 30 Dec 2022 08:34:38 -0800 (PST)
Received: from robh_at_kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 o3-20020a92c683000000b00302f7654187sm6670218ilg.72.2022.12.30.08.34.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Dec 2022 08:34:38 -0800 (PST)
Received: (nullmailer pid 1935053 invoked by uid 1000);
 Fri, 30 Dec 2022 16:34:28 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
In-Reply-To: <20221229133205.981397-3-luca.ceresoli@bootlin.com>
References: <20221229133205.981397-1-luca.ceresoli@bootlin.com>
 <20221229133205.981397-3-luca.ceresoli@bootlin.com>
Message-Id: <167241769230.1925726.8527129486424295727.robh@kernel.org>
Subject: Re: [PATCH v3 02/21] dt-bindings: display: tegra: vi: add 'vip'
 property and example
Date: Fri, 30 Dec 2022 10:34:28 -0600
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
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, linux-tegra@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Sowjanya Komatineni <skomatineni@nvidia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Thierry Reding <thierry.reding@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 linux-media@vger.kernel.org, Richard Leitner <richard.leitner@skidata.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 29 Dec 2022 14:31:46 +0100, Luca Ceresoli wrote:
> The Tegra20 VI peripheral can receive parallel input from the VIP parallel
> input module. Add it to the allowed properties and augment the existing
> nvidia,tegra20-vi example to show a 'vip' property.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Changed in v3 (suggested by Rob Herring):
>  - drop 'endpoint', unneeded as there's no extra properties in the
>    endpoints
> 
> Changed in v2 (suggested by Krzysztof Kozlowski):
>  - rename "i2c3" -> "ic2"
>  - add review tag
> ---
>  .../display/tegra/nvidia,tegra20-vi.yaml      | 64 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 65 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.example.dtb: vi@54080000: vip: Unevaluated properties are not allowed ('channel@0' was unexpected)
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.example.dtb: vi@54080000: vip: 'ports' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.example.dtb: vip: Unevaluated properties are not allowed ('channel@0' was unexpected)
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.example.dtb: vip: 'ports' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221229133205.981397-3-luca.ceresoli@bootlin.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

