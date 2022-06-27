Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F7755BA13
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 15:33:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7088711A649;
	Mon, 27 Jun 2022 13:33:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01BF111A76A
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 13:33:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 86B5F612EE
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 13:33:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E90FCC341C8
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 13:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656336810;
 bh=ozPyfku+IxLJ/xWqltXSkq39bDAVGGKGz9HK5lRI660=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Fkq1VTJFOkuvhF9ZwqPo6bJzy16pCxzVTJeuViLhRelToRK0Hvq/fWuw38TdAdRV5
 4B1/J1XyjGuE7LftuaC4uVKzWNUs3ErO0Pz0SHULTDrXsfcoWNiBCb3LIeUh/0RoPL
 aJAwEbBcNnvjyVKqtigUnv5SRebMqIUKOr/P0Hzw0rH5QYT/IRD9QmDF1NEguf3sYY
 wfUeD5v7K+YGzswjx3RybigpyMiLpazt+bHuEFnEKdQvBqZjJPnJShcK01KeNRvT0c
 0BUwXNa/cBfTufhkbvEPndL28QstvEeflccTaWssLO5l1yYFpI+STVOeSC+qrQWqxn
 sH7wsjPOir6Sw==
Received: by mail-vk1-f174.google.com with SMTP id b5so4469995vkp.4
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 06:33:30 -0700 (PDT)
X-Gm-Message-State: AJIora8ABSXKYc4eLJ2h9inXDnMTkp5UDJRbEOgzrwLj1o9oxL3JPS4y
 nTLtd03JCfM6YnFDKv1ZJbKViMkiHXW6TdRpsg==
X-Google-Smtp-Source: AGRyM1scsPUWNixG94RrMA/c0WdzqcCV5semb71Np32MVVYQN0Tnz33ChJSrmtGpjWTGsYsOWzKI4Q7hjj31Llm839Y=
X-Received: by 2002:a1f:aac7:0:b0:35e:1c45:def with SMTP id
 t190-20020a1faac7000000b0035e1c450defmr4200423vke.35.1656336809878; Mon, 27
 Jun 2022 06:33:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220621151022.1416300-1-cyndis@kapsi.fi>
 <20220621151022.1416300-3-cyndis@kapsi.fi>
 <1656091594.348474.146331.nullmailer@robh.at.kernel.org>
In-Reply-To: <1656091594.348474.146331.nullmailer@robh.at.kernel.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 27 Jun 2022 07:33:18 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJMDEf1_3P2q2XPKKuOqr=+sYixVfMwnouGXPkMPWtjGA@mail.gmail.com>
Message-ID: <CAL_JsqJMDEf1_3P2q2XPKKuOqr=+sYixVfMwnouGXPkMPWtjGA@mail.gmail.com>
Subject: Re: [PATCH v6 02/10] dt-bindings: display: tegra: Convert to
 json-schema
To: Mikko Perttunen <cyndis@kapsi.fi>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jon Hunter <jonathanh@nvidia.com>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-tegra <linux-tegra@vger.kernel.org>, Thierry Reding <treding@nvidia.com>,
 Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 24, 2022 at 11:26 AM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, 21 Jun 2022 18:10:14 +0300, Mikko Perttunen wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >
> > Convert the Tegra host1x controller bindings from the free-form text
> > format to json-schema.
> >
> > This also adds the missing display-hub DT bindings that were not
> > previously documented.
> >
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  .../display/tegra/nvidia,tegra114-mipi.txt    |  41 --
> >  .../display/tegra/nvidia,tegra114-mipi.yaml   |  74 ++
> >  .../display/tegra/nvidia,tegra124-dpaux.yaml  | 149 ++++
> >  .../display/tegra/nvidia,tegra124-sor.yaml    | 206 ++++++
> >  .../display/tegra/nvidia,tegra124-vic.yaml    |  71 ++
> >  .../display/tegra/nvidia,tegra186-dc.yaml     |  85 +++
> >  .../tegra/nvidia,tegra186-display.yaml        | 310 ++++++++
> >  .../tegra/nvidia,tegra186-dsi-padctl.yaml     |  45 ++
> >  .../display/tegra/nvidia,tegra20-dc.yaml      | 181 +++++
> >  .../display/tegra/nvidia,tegra20-dsi.yaml     | 159 +++++
> >  .../display/tegra/nvidia,tegra20-epp.yaml     |  70 ++
> >  .../display/tegra/nvidia,tegra20-gr2d.yaml    |  73 ++
> >  .../display/tegra/nvidia,tegra20-gr3d.yaml    | 214 ++++++
> >  .../display/tegra/nvidia,tegra20-hdmi.yaml    | 126 ++++
> >  .../display/tegra/nvidia,tegra20-host1x.txt   | 675 ------------------
> >  .../display/tegra/nvidia,tegra20-host1x.yaml  | 347 +++++++++
> >  .../display/tegra/nvidia,tegra20-isp.yaml     |  67 ++
> >  .../display/tegra/nvidia,tegra20-mpe.yaml     |  73 ++
> >  .../display/tegra/nvidia,tegra20-tvo.yaml     |  58 ++
> >  .../display/tegra/nvidia,tegra20-vi.yaml      | 163 +++++
> >  .../display/tegra/nvidia,tegra210-csi.yaml    |  52 ++
> >  .../pinctrl/nvidia,tegra124-dpaux-padctl.txt  |  59 --
> >  22 files changed, 2523 insertions(+), 775 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.txt
> >  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml
> >  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-dpaux.yaml
> >  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-sor.yaml
> >  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-vic.yaml
> >  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-dc.yaml
> >  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-display.yaml
> >  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-dsi-padctl.yaml
> >  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
> >  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml
> >  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-epp.yaml
> >  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-gr2d.yaml
> >  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-gr3d.yaml
> >  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-hdmi.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
> >  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
> >  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-isp.yaml
> >  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-mpe.yaml
> >  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-tvo.yaml
> >  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
> >  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-dpaux-padctl.txt
> >
>
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-sor.yaml: allOf:1:if:not:properties: {'contains': {'const': 'nvidia,panel'}} should not be valid under {'$ref': '#/definitions/sub-schemas'}
>         hint: A json-schema keyword was found instead of a DT property name.
>         from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-sor.yaml: ignoring, error in schema: allOf: 1: if: not: properties
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-gr3d.example.dtb: gr3d@54180000: resets: [[4294967295, 24]] is too short
>         From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-gr3d.yaml
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-gr3d.example.dtb: gr3d@54180000: reset-names: ['3d'] is too short
>         From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-gr3d.yaml
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.example.dtb: gr2d@54140000: resets: [[4294967295, 21]] is too short
>         From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-gr2d.yaml
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.example.dtb: gr2d@54140000: reset-names: ['2d'] is too short
>         From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-gr2d.yaml
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.example.dtb: gr3d@54180000: resets: [[4294967295, 24]] is too short
>         From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-gr3d.yaml
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.example.dtb: gr3d@54180000: reset-names: ['3d'] is too short
>         From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-gr3d.yaml
> Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-sor.example.dtb:0:0: /example-0/sor@54540000: failed to match any schema with compatible: ['nvidia,tegra210-sor']
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-gr2d.example.dtb: gr2d@54140000: resets: [[4294967295, 21]] is too short
>         From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-gr2d.yaml
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-gr2d.example.dtb: gr2d@54140000: reset-names: ['2d'] is too short
>         From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-gr2d.yaml
>
> doc reference errors (make refcheckdocs):
> MAINTAINERS: Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
> MAINTAINERS: Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
>
> See https://patchwork.ozlabs.org/patch/
>
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit.

Now failing in linux-next. Please fix.

Rob
