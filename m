Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A15F747C69D
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 19:31:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91BB011B50F;
	Tue, 21 Dec 2021 18:31:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 120A111B50F
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 18:31:11 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id 8so13716101qtx.5
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 10:31:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Msqbr64lilA79sJrWaKHhlNoWI4Y9ukNts0JMzmKRhI=;
 b=baLWK1NBB3w5/ezW/nt2HKKXxbKT8bPHjJ/E3YRbz+HlARguPZSCVZ9CZjcjDy6plF
 ssHf1ANFbajRhvoAzzbv2Yo4a7q/3XMdUGcBaf3vv3G2p6vr1L2hcZ2YDNBCmBb0oSVb
 Ov72PfJ8uYgQB5ZKOyBGBI1FYuOuSXFcGjVYtdOebg+LkN/7/kgN1+EI9iqe/mlllgqL
 lHoIScRXaqduavqOlVfYxALDkm0HjgzCgGzIbiUy6Hjux4i64+lbewTnaryLwR38z4xM
 u3mCTgmgfuBYsPAf63uiO6dO1wDGcSJrhFhmUArUNueIADAEOFeCLJjJAUnVW9K++bNQ
 S6IQ==
X-Gm-Message-State: AOAM533gfh4JrMlffLL96CcTRuye6SnC6TNknMzv2v8obWBz0cZCQZkN
 Qk6JORSkxyqPr2o0dljmOA==
X-Google-Smtp-Source: ABdhPJyf75x3C6dapnwSf9z2R3Z2Osx2xL1TcJO6IOd4QXYzPawNCtrFL7EjqDnAc7dKxtwj+1s2Ww==
X-Received: by 2002:a05:622a:190f:: with SMTP id
 w15mr3404818qtc.124.1640111471085; 
 Tue, 21 Dec 2021 10:31:11 -0800 (PST)
Received: from robh.at.kernel.org ([24.55.105.145])
 by smtp.gmail.com with ESMTPSA id v9sm13845840qkf.90.2021.12.21.10.31.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 10:31:10 -0800 (PST)
Received: (nullmailer pid 1534684 invoked by uid 1000);
 Tue, 21 Dec 2021 18:31:09 -0000
Date: Tue, 21 Dec 2021 14:31:09 -0400
From: Rob Herring <robh@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v4] dt-bindings: display: tegra: Convert to json-schema
Message-ID: <YcIdbfoeBIZl8xlW@robh.at.kernel.org>
References: <20211217164320.2330784-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211217164320.2330784-1-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 17 Dec 2021 17:43:20 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the Tegra host1x controller bindings from the free-form text
> format to json-schema.
> 
> This also adds the missing display-hub DT bindings that were not
> previously documented.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v4:
> - add interconnect, interconnect-names, operating-points-v2 and
>   power-domains property to match latest DT updates
> - drop stale reference to DPAUX pad controller bindings
> - include dsi-controller.yaml and drop $nodename, #address-cells,
>   #size-cells and patternProperties from DSI bindings
> - integrate #sound-dai-cells addition from published patch
> - drop some generic, useless comments
> 
> Changes in v3:
> - split into separate YAML files for simplicity
> - add display-hub DT bindings
> 
> Changes in v2:
> - use additionalProperties instead of unevaluatedProperties where
>   sufficient
> - drop redundant $ref and add missing maxItems properties
> - drop documentation for standard properties
> - remove status properties from example
> - drop spurious comments
> 
>  .../display/tegra/nvidia,tegra114-mipi.txt    |  41 --
>  .../display/tegra/nvidia,tegra114-mipi.yaml   |  74 ++
>  .../display/tegra/nvidia,tegra124-dpaux.yaml  | 149 ++++
>  .../display/tegra/nvidia,tegra124-sor.yaml    | 206 ++++++
>  .../display/tegra/nvidia,tegra124-vic.yaml    |  71 ++
>  .../display/tegra/nvidia,tegra186-dc.yaml     |  85 +++
>  .../tegra/nvidia,tegra186-display.yaml        | 310 ++++++++
>  .../tegra/nvidia,tegra186-dsi-padctl.yaml     |  46 ++
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
>  22 files changed, 2524 insertions(+), 775 deletions(-)
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

Reviewed-by: Rob Herring <robh@kernel.org>
