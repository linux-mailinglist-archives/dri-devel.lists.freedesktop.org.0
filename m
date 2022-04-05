Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C3B4F2914
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 10:35:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12ED010EF5F;
	Tue,  5 Apr 2022 08:35:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A43A10EF5F
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 08:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EptHcbXgf4+/YVBV8Lp2UUrmmYj3GkmvAVgxNi5tz5w=; b=CtnmsDt4kkyQausn2HunhXYd/E
 OHt2BuKrDTyuWuS76ABlx0PmVXPqO5iH4DTn7dJQEO9cnhd9IXrCZZvxjv7YcdTp5J5bz9Fcs4LAq
 Jd76QT4JadI0H+/Jm2GA9Ek66qZ2C8ATG7PXycEy7JgPiCF+xHWy3eOJ3E9OcWk/no8ipK2miwE7M
 5yfb+U01BxB/wJngdy3zFPQTH6fv4wwBFypJgATPV4NrJaEtS9avdhp/f40Ejz9C6N10JQQSe0I9G
 TYQHzV4SySpRFDkBt4krl+YrSjHkDB2tqnvN3RGzQTcpwCOIiXPp2JIgjnWnK2XWHZ3GEvXea+ZGk
 zBZ7FJqw==;
Received: from [2a01:799:961:d200:cca0:57ac:c55d:a485] (port=60315)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1nbeel-0000bS-1G; Tue, 05 Apr 2022 10:35:19 +0200
Message-ID: <9b268804-8f2d-9de6-cc90-89f3df1838cc@tronnes.org>
Date: Tue, 5 Apr 2022 10:35:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] dt-bindings: display: panel: mipi-dbi-spi: Make
 width-mm/height-mm mandatory
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
References: <20220404192105.12547-1-marex@denx.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220404192105.12547-1-marex@denx.de>
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
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 devicetree@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 robert.foss@linaro.org, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Osipenko <digetx@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 04.04.2022 21.21, skrev Marek Vasut:
> Make the width-mm/height-mm panel properties mandatory
> to correctly report the panel dimensions to the OS.
> 
> Fixes: 2f3468b82db97 ("dt-bindings: display: add bindings for MIPI DBI compatible SPI panels")
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Dmitry Osipenko <digetx@gmail.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Noralf Trønnes <noralf@tronnes.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> To: dri-devel@lists.freedesktop.org
> ---

Acked-by: Noralf Trønnes <noralf@tronnes.org>

>  .../devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml   | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml b/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
> index f29789994b180..c2df8d28aaf5f 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
> @@ -83,6 +83,8 @@ properties:
>  required:
>    - compatible
>    - reg
> +  - width-mm
> +  - height-mm
>    - panel-timing
>  
>  unevaluatedProperties: false
