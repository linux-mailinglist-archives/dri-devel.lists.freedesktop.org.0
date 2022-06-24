Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE62559FAB
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 19:26:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5633410EA06;
	Fri, 24 Jun 2022 17:26:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 938A510EA06
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 17:26:54 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id l24so3340154ion.13
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 10:26:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=W9o9Q8p3oMHAVX7O1A1F5sZAeGnXCxQ/vXrDDAt7Do8=;
 b=V+WApbcviYsFsxojjTqKc3i7aec3uiT4hoC16FhdvtO1wvzOrDeIOGz62YzHbhHHS6
 YLCzwNr24RWO0H72zXxme5f2hM/bWvfHEey2xOB+2j/jZmsjiOa2Y0GTO2cPP3rc/rJc
 X8ApZvmHN8Eep2WSw0dmUJrnybdRiyXHxzdZxMSg//IUd1tABh4QjCdw5AMVj6ePlvHg
 3NGvRZDtO+7rBuo09SNFKD6c2tUIRhGKruZgir7+xUKu/oX9F5EnPWmGFIlJbw9V3hG2
 xbbZ6xX1bOYHWNMfYv+/5UBXd9RkyIHv60lh689F0MHsl5uAQi20aMJkneLpvx5GjHBg
 ZVxw==
X-Gm-Message-State: AJIora93xQWZEjiTrDWIRLAlLjwnGnjuUfZFhR/vUbSCrh3a9iza4BUr
 8I+ZiIQ4k9Zir9uAho5kMw==
X-Google-Smtp-Source: AGRyM1sVEh8rq+3905/IcPFgRU7Fy1TLeRbAXiXeOp+CmyUaFz0EH/Vzb8EIUR4m9bvLyRLCKVigUw==
X-Received: by 2002:a05:6638:31c2:b0:335:dd22:83ec with SMTP id
 n2-20020a05663831c200b00335dd2283ecmr164947jav.88.1656091613790; 
 Fri, 24 Jun 2022 10:26:53 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id
 h22-20020a022b16000000b00339d10e9d22sm1308243jaa.111.2022.06.24.10.26.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 10:26:53 -0700 (PDT)
Received: (nullmailer pid 146332 invoked by uid 1000);
 Fri, 24 Jun 2022 17:26:34 -0000
From: Rob Herring <robh@kernel.org>
To: Mikko Perttunen <cyndis@kapsi.fi>
In-Reply-To: <20220621151022.1416300-3-cyndis@kapsi.fi>
References: <20220621151022.1416300-1-cyndis@kapsi.fi>
 <20220621151022.1416300-3-cyndis@kapsi.fi>
Subject: Re: [PATCH v6 02/10] dt-bindings: display: tegra: Convert to
 json-schema
Date: Fri, 24 Jun 2022 11:26:34 -0600
Message-Id: <1656091594.348474.146331.nullmailer@robh.at.kernel.org>
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski@canonical.com,
 will@kernel.org, joro@8bytes.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
 iommu@lists.linux-foundation.org, robh+dt@kernel.org, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org, Thierry Reding <treding@nvidia.com>,
 robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 21 Jun 2022 18:10:14 +0300, Mikko Perttunen wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the Tegra host1x controller bindings from the free-form text
> format to json-schema.
> 
> This also adds the missing display-hub DT bindings that were not
> previously documented.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../display/tegra/nvidia,tegra114-mipi.txt    |  41 --
>  .../display/tegra/nvidia,tegra114-mipi.yaml   |  74 ++
>  .../display/tegra/nvidia,tegra124-dpaux.yaml  | 149 ++++
>  .../display/tegra/nvidia,tegra124-sor.yaml    | 206 ++++++
>  .../display/tegra/nvidia,tegra124-vic.yaml    |  71 ++
>  .../display/tegra/nvidia,tegra186-dc.yaml     |  85 +++
>  .../tegra/nvidia,tegra186-display.yaml        | 310 ++++++++
>  .../tegra/nvidia,tegra186-dsi-padctl.yaml     |  45 ++
>  .../display/tegra/nvidia,tegra20-dc.yaml      | 181 +++++
>  .../display/tegra/nvidia,tegra20-dsi.yaml     | 159 +++++
>  .../display/tegra/nvidia,tegra20-epp.yaml     |  70 ++
>  .../display/tegra/nvidia,tegra20-gr2d.yaml    |  73 ++
>  .../display/tegra/nvidia,tegra20-gr3d.yaml    | 214 ++++++
>  .../display/tegra/nvidia,tegra20-hdmi.yaml    | 126 ++++
>  .../display/tegra/nvidia,tegra20-host1x.txt   | 675 ------------------
>  .../display/tegra/nvidia,tegra20-host1x.yaml  | 347 +++++++++
>  .../display/tegra/nvidia,tegra20-isp.yaml     |  67 ++
>  .../display/tegra/nvidia,tegra20-mpe.yaml     |  73 ++
>  .../display/tegra/nvidia,tegra20-tvo.yaml     |  58 ++
>  .../display/tegra/nvidia,tegra20-vi.yaml      | 163 +++++
>  .../display/tegra/nvidia,tegra210-csi.yaml    |  52 ++
>  .../pinctrl/nvidia,tegra124-dpaux-padctl.txt  |  59 --
>  22 files changed, 2523 insertions(+), 775 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.txt
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-dpaux.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-sor.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-vic.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-dc.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-display.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-dsi-padctl.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-epp.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-gr2d.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-gr3d.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-hdmi.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-isp.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-mpe.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-tvo.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-dpaux-padctl.txt
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-sor.yaml: allOf:1:if:not:properties: {'contains': {'const': 'nvidia,panel'}} should not be valid under {'$ref': '#/definitions/sub-schemas'}
	hint: A json-schema keyword was found instead of a DT property name.
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-sor.yaml: ignoring, error in schema: allOf: 1: if: not: properties
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-gr3d.example.dtb: gr3d@54180000: resets: [[4294967295, 24]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-gr3d.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-gr3d.example.dtb: gr3d@54180000: reset-names: ['3d'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-gr3d.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.example.dtb: gr2d@54140000: resets: [[4294967295, 21]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-gr2d.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.example.dtb: gr2d@54140000: reset-names: ['2d'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-gr2d.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.example.dtb: gr3d@54180000: resets: [[4294967295, 24]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-gr3d.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.example.dtb: gr3d@54180000: reset-names: ['3d'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-gr3d.yaml
Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-sor.example.dtb:0:0: /example-0/sor@54540000: failed to match any schema with compatible: ['nvidia,tegra210-sor']
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-gr2d.example.dtb: gr2d@54140000: resets: [[4294967295, 21]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-gr2d.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-gr2d.example.dtb: gr2d@54140000: reset-names: ['2d'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-gr2d.yaml

doc reference errors (make refcheckdocs):
MAINTAINERS: Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
MAINTAINERS: Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

