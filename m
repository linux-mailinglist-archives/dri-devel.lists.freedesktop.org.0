Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4965719800B
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 17:44:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC9AD6E42F;
	Mon, 30 Mar 2020 15:44:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 183AE6E42F
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 15:44:07 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id r5so16240806ilq.6
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 08:44:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6L0zwcu6TJpBy8ROIw82e95a8IhAis774QnwFUUDei4=;
 b=lo+Q8cFiI22gXkJt7TBGjvq/nH9KjH72NbzQk8ebHRy7JtRIiaXzovwYCfSE0DA0/z
 zPf+fJz9WbIB71f1EehZ0Fjz95XWrnb0sITo0GFqq+mQWu3/vMd1bzIQcnMaI8vi3WTt
 74P5Zw/VZX9JM01HZHeO1Rp/fxwOLAysizAWKxmBAstpQnYGV0YzFMVeQJPzYSoz+qi5
 owTrCOLzIsOXyYOZ3Sg0W2UkoFR3q0Gj7BOCk1RH2SqS7upKn6VJ28oG1PeSyBJt8MMc
 oncI5mMnIk2D98IV+OEfG3o+R7aH9wbzdMgeihQ33aO/BiaaKMdr9B/790egkA5Ep3Ge
 5eHA==
X-Gm-Message-State: ANhLgQ1XUtYjmAaOlJIJwivNnPX0Q3B03I87wLZo34eaokkyeKm0powI
 Zln03wOaXkWDUbm9YaadGQ==
X-Google-Smtp-Source: ADFU+vtLzoK7bLF3KNLPQffJzUbWf20WdfYgGwLo68WhEGLJBcEYEu+x/FRUoIOGhBcqWrVUOHXMcg==
X-Received: by 2002:a92:8d0e:: with SMTP id s14mr11505607ild.117.1585583046446; 
 Mon, 30 Mar 2020 08:44:06 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id c88sm4970096ill.15.2020.03.30.08.44.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2020 08:44:05 -0700 (PDT)
Received: (nullmailer pid 27458 invoked by uid 1000);
 Mon, 30 Mar 2020 15:44:04 -0000
Date: Mon, 30 Mar 2020 09:44:04 -0600
From: Rob Herring <robh@kernel.org>
To: Adrian Ratiu <adrian.ratiu@collabora.com>
Subject: Re: [PATCH v5 5/5] dt-bindings: display: add i.MX6 MIPI DSI host
 controller doc
Message-ID: <20200330154404.GA26389@bogus>
References: <20200330113542.181752-1-adrian.ratiu@collabora.com>
 <20200330113542.181752-6-adrian.ratiu@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200330113542.181752-6-adrian.ratiu@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sjoerd Simons <sjoerd.simons@collabora.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Martyn Welch <martyn.welch@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-rockchip@lists.infradead.org, linux-imx@nxp.com, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 30 Mar 2020 14:35:42 +0300, Adrian Ratiu wrote:
> This provides an example DT binding for the MIPI DSI host controller
> present on the i.MX6 SoC based on Synopsis DesignWare v1.01 IP.
> 
> Cc: Rob Herring <robh@kernel.org>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Sjoerd Simons <sjoerd.simons@collabora.com>
> Signed-off-by: Martyn Welch <martyn.welch@collabora.com>
> Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
> ---
> Changes since v4:
>   - Fixed yaml binding to pass `make dt_binding_check dtbs_check`
>   and addressed received binding feedback (Rob)
> 
> Changes since v3:
>   - Added commit message (Neil)
>   - Converted to yaml format (Neil)
>   - Minor dt node + driver fixes (Rob)
>   - Added small panel example to the host controller binding
> 
> Changes since v2:
>   - Fixed commit tags (Emil)
> ---
>  .../display/imx/fsl,mipi-dsi-imx6.yaml        | 134 ++++++++++++++++++
>  1 file changed, 134 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,mipi-dsi-imx6.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/display/imx/fsl,mipi-dsi-imx6.example.dts:34.21-31: Warning (reg_format): /example-0/dsi@21e0000/ports/port@1:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
Documentation/devicetree/bindings/display/imx/fsl,mipi-dsi-imx6.example.dt.yaml: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/display/imx/fsl,mipi-dsi-imx6.example.dt.yaml: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/display/imx/fsl,mipi-dsi-imx6.example.dt.yaml: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/display/imx/fsl,mipi-dsi-imx6.example.dts:33.24-38.19: Warning (avoid_default_addr_size): /example-0/dsi@21e0000/ports/port@1: Relying on default #address-cells value
Documentation/devicetree/bindings/display/imx/fsl,mipi-dsi-imx6.example.dts:33.24-38.19: Warning (avoid_default_addr_size): /example-0/dsi@21e0000/ports/port@1: Relying on default #size-cells value
Documentation/devicetree/bindings/display/imx/fsl,mipi-dsi-imx6.example.dts:33.24-38.19: Warning (graph_port): /example-0/dsi@21e0000/ports/port@1: graph node '#address-cells' is -1, must be 1
Documentation/devicetree/bindings/display/imx/fsl,mipi-dsi-imx6.example.dts:33.24-38.19: Warning (graph_port): /example-0/dsi@21e0000/ports/port@1: graph node '#size-cells' is -1, must be 0

See https://patchwork.ozlabs.org/patch/1263893

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
