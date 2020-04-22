Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C53411B4D85
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 21:42:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D84CC89F6F;
	Wed, 22 Apr 2020 19:42:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B87FD89F6F
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 19:42:34 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id 19so2940773oiy.8
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 12:42:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=huAsohfgPjKhobu8tGI0Z2yU/DwK8rb6r7ozAP98pjc=;
 b=EijpOoYT426Y7eJtdTbU1CJU01Y9ei302Naf9EB1+UPi58c6Nlke1VKrRZKopNZdWs
 5OH0V0NIJ+ayD7Ybo4eo+XfH3MW8iQYaHiiFPzQ0wQnWBm8Ns4zWVXl5F9smsZsRp3ax
 Kpr2ohqRUR8mVbzO7PplXbKKVD25dCTKJPURfh7GaOVC/ma7VArG72MeUsep8n1Nnmwc
 crjUEZOGNHXH012FikgTmQcOaY9D/wMyvIkUWu1A5n6t/X49cjSxdpLqswykULVYuHfM
 HGEwMRxxEoyA5YrHV+RTWYoQZsN0XQ877eN6NYK7GeHNGPEeECe+HC8BWPwITdHuT+6P
 KfLg==
X-Gm-Message-State: AGi0PuYcwAUsKh7o3VIPCF1+tGgpW5lEDFNxl057Vh6ldqf/GJK/6Jy3
 d6etmWWXTgTSN6zMAXuA6g==
X-Google-Smtp-Source: APiQypIhe/Vj/x+9Tj76bJkE00Ecb+4p/RQomG76rndQXNYWtXWXHpxdZCnJwyfvOc0r/Nbba51iYQ==
X-Received: by 2002:aca:ecd7:: with SMTP id k206mr432558oih.113.1587584553937; 
 Wed, 22 Apr 2020 12:42:33 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id h137sm46208oib.33.2020.04.22.12.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2020 12:42:33 -0700 (PDT)
Received: (nullmailer pid 8268 invoked by uid 1000);
 Wed, 22 Apr 2020 19:42:31 -0000
Date: Wed, 22 Apr 2020 14:42:31 -0500
From: Rob Herring <robh@kernel.org>
To: Adrian Ratiu <adrian.ratiu@collabora.com>
Subject: Re: [PATCH v7 5/8] dt-bindings: display: add i.MX6 MIPI DSI host
 controller doc
Message-ID: <20200422194231.GA6333@bogus>
References: <20200421161610.1501827-1-adrian.ratiu@collabora.com>
 <20200421161610.1501827-6-adrian.ratiu@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200421161610.1501827-6-adrian.ratiu@collabora.com>
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
 Adrian Pop <pop.adrian61@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Martyn Welch <martyn.welch@collabora.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 linux-rockchip@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Arnaud Ferraris <arnaud.ferraris@collabora.com>, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-imx@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 21 Apr 2020 19:16:07 +0300, Adrian Ratiu wrote:
> This provides an example DT binding for the MIPI DSI host controller
> present on the i.MX6 SoC based on Synopsis DesignWare v1.01 IP.
> 
> Cc: Rob Herring <robh@kernel.org>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: devicetree@vger.kernel.org
> Tested-by: Adrian Pop <pop.adrian61@gmail.com>
> Tested-by: Arnaud Ferraris <arnaud.ferraris@collabora.com>
> Signed-off-by: Sjoerd Simons <sjoerd.simons@collabora.com>
> Signed-off-by: Martyn Welch <martyn.welch@collabora.com>
> Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
> ---
> Changes since v6:
>   - Added ref to the newly created snps,dw-mipi-dsi.yaml (Laurent)
>   - Moved *-cells properties outside patternProperties (Laurent)
>   - Removed the panel port documentation (Laurent)
>   - Wrapped lines at 80 chars, typo fixes, sort includes (Laurent)
> 
> Changes since v5:
>   - Fixed missing reg warning (Fabio)
>   - Updated dt-schema and fixed warnings (Rob)
> 
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
>  .../display/imx/fsl,mipi-dsi-imx6.yaml        | 135 ++++++++++++++++++
>  1 file changed, 135 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,mipi-dsi-imx6.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

Unknown file referenced: [Errno 2] No such file or directory: '/usr/local/lib/python3.6/dist-packages/dtschema/schemas/display/bridge/snps,dw-mipi-dsi.yaml'
Documentation/devicetree/bindings/Makefile:11: recipe for target 'Documentation/devicetree/bindings/display/imx/fsl,mipi-dsi-imx6.example.dts' failed
make[1]: *** [Documentation/devicetree/bindings/display/imx/fsl,mipi-dsi-imx6.example.dts] Error 255
make[1]: *** Waiting for unfinished jobs....
Makefile:1300: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1274360

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
