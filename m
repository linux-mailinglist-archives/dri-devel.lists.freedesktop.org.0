Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A86726C90
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 22:34:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7C5710E546;
	Wed,  7 Jun 2023 20:34:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2078 seconds by postgrey-1.36 at gabe;
 Wed, 07 Jun 2023 20:34:30 UTC
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3006::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B709A10E546
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 20:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202212;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/b4ajCqI25DW6ri9g92RjyuwGLkAwnN2KYxGew63Kmg=; b=QZ7HpcUQXI0kzfxOYpZY3EIIpM
 fOcpFu5bQwUIHgsHdeDG5gWwSxKRTnKemoGMHddPycz2U4DN14DAXJz+qICPM3Q2niZdSfJxFDasc
 uK32Lth+ZHIT1Wsbdutw/GXYMjpeAZbo8D06Y6RL87GgcljEK9qbEiw4+aGkWPuGlqE5z0xDgnTHX
 E3PWzSwO7cJKFrpWZTwFfDHvuixMw+cdOqXZQ4nKUQ19jGvyV3UKSsyxaO+LvDdHtk2vXylggZ8b7
 fy/DndbQnQhBwy2wFYvosY3kSE1/g66fViSmq0uyR8frMrCoYhNuMwR76srqf/YkzPRDNYPuZ/rb2
 wAJAK+1w==;
Received: from [2a01:799:961:2c00:5fc6:a9a5:c042:d1cd] (port=55530)
 by smtp.domeneshop.no with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <noralf@tronnes.org>) id 1q6zJs-00BVdA-RF;
 Wed, 07 Jun 2023 21:59:48 +0200
Message-ID: <69fdb6a2-12b6-547d-019b-c77dd2bd98cf@tronnes.org>
Date: Wed, 7 Jun 2023 21:59:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v1 2/8] dt-bindings: display: panel: mipi-dbi-spi: add
 spi-3wire property
Content-Language: en-US
To: =?UTF-8?Q?Leonard_G=c3=b6hrs?= <l.goehrs@pengutronix.de>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230607115508.2964574-1-l.goehrs@pengutronix.de>
 <20230607115508.2964574-2-l.goehrs@pengutronix.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20230607115508.2964574-2-l.goehrs@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 noralf@tronnes.org, kernel@pengutronix.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/7/23 13:55, Leonard Göhrs wrote:
> Some MIPI DBI panels support a three wire mode (clock, chip select,
> bidirectional data) that can be used to ask the panel if it is already set
> up by e.g. the bootloader and can thus skip the initialization.
> This enables a flicker-free boot.
> 
> Signed-off-by: Leonard Göhrs <l.goehrs@pengutronix.de>
> ---
>  .../devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml   | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml b/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
> index c07da1a9e6288..2f0238b770eba 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
> @@ -87,6 +87,8 @@ properties:
>        Logic level supply for interface signals (Vddi).
>        No need to set if this is the same as power-supply.
>  
> +  spi-3wire: true
> +

I don't think this should be added here. spi-cpha and spi-cpol are also
supported but they are not mentioned. Instead those are documented in
bindings/spi/spi-controller.yaml. Why they're not documented in
bindings/spi/spi-peripheral-props.yaml instead which this binding has a
ref to, I have no idea.

Noralf.

>  required:
>    - compatible
>    - reg
