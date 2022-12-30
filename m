Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56506659A1C
	for <lists+dri-devel@lfdr.de>; Fri, 30 Dec 2022 16:43:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E025310E442;
	Fri, 30 Dec 2022 15:43:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 324 seconds by postgrey-1.36 at gabe;
 Fri, 30 Dec 2022 15:43:13 UTC
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D58810E442
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Dec 2022 15:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
 t=1672414992; bh=w9fhMs5fspO/slo/bCQ0zUyvbC6Ov4MaIWY/dq3FWIc=;
 h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
 b=ecOJKlTVZT7pYN6fFl0dVKUkKKjwd1f/cbokCbDz3ItCoOxeODKYrSgV3ib9p1r9Y
 lBQUQCErsE5hIDXhjXp1nj8+M3o/M3/LnB9lum4hCPANHpHkDbtKiQtEBblqH5cBQ1
 3w3L6AMiQXy9OgR7280HBqrDkSLj33SbTEfwzjuM=
Date: Fri, 30 Dec 2022 16:43:11 +0100
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v4 3/4] MAINTAINERS: Add entry for Himax HX8394 panel
 controller driver
Message-ID: <20221230154311.bvgmjlryu5guctyr@core>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>,
 Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org,
 Kamil =?utf-8?Q?Trzci=C5=84ski?= <ayufan@ayufan.eu>,
 Martijn Braam <martijn@brixit.nl>, Sam Ravnborg <sam@ravnborg.org>,
 Robert Mader <robert.mader@posteo.de>,
 Tom Fitzhenry <tom@tom-fitzhenry.me.uk>,
 Peter Robinson <pbrobinson@gmail.com>,
 Onuralp Sezer <thunderbirdtr@fedoraproject.org>,
 dri-devel@lists.freedesktop.org,
 Maya Matuszczyk <maccraft123mc@gmail.com>,
 Neal Gompa <ngompa13@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20221230113155.3430142-1-javierm@redhat.com>
 <20221230113155.3430142-4-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221230113155.3430142-4-javierm@redhat.com>
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
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 Robert Mader <robert.mader@posteo.de>,
 Onuralp Sezer <thunderbirdtr@fedoraproject.org>,
 Neal Gompa <ngompa13@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tom Fitzhenry <tom@tom-fitzhenry.me.uk>,
 Martijn Braam <martijn@brixit.nl>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Peter Robinson <pbrobinson@gmail.com>,
 Kamil =?utf-8?Q?Trzci=C5=84ski?= <ayufan@ayufan.eu>,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org,
 Maya Matuszczyk <maccraft123mc@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On Fri, Dec 30, 2022 at 12:31:53PM +0100, Javier Martinez Canillas wrote:
> Add myself as maintainer for the driver and devicetree bindings schema.
> 
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
> 
> Changes in v4:
> - Add Sam Ravnborg's Acked-by tag.
> 
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7729a30b9609..c901e536303b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6551,6 +6551,13 @@ S:	Maintained
>  T:	git git://anongit.freedesktop.org/drm/drm-misc
>  F:	drivers/gpu/drm/tiny/gm12u320.c
>  
> +DRM DRIVER FOR HIMAX HX8394 MIPI-DSI LCD panels
> +M:	Javier Martinez Canillas <javierm@redhat.com>

+M:	Ondrej Jirman <megi@xff.cz>

thank you,
	o.

> +S:	Maintained
> +T:	git git://anongit.freedesktop.org/drm/drm-misc
> +F:	Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
> +F:	drivers/gpu/drm/panel/panel-himax-hx8394.c
> +
>  DRM DRIVER FOR HX8357D PANELS
>  M:	Emma Anholt <emma@anholt.net>
>  S:	Maintained
> -- 
> 2.38.1
> 
