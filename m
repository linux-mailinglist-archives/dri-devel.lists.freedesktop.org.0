Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D7232F569
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 22:43:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D4B16E3B2;
	Fri,  5 Mar 2021 21:43:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B1FB6E3B2
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 21:43:51 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4Dsh7g59sjz1rwn0;
 Fri,  5 Mar 2021 22:43:43 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4Dsh7g3fl1z1qr4d;
 Fri,  5 Mar 2021 22:43:43 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id zA9oLoIZs84D; Fri,  5 Mar 2021 22:43:41 +0100 (CET)
X-Auth-Info: GmqYrIyAYBzZBk9/Hy/h0siIg5F0MIUqR5KnsSVg2Bc=
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri,  5 Mar 2021 22:43:40 +0100 (CET)
Subject: Re: [PATCH v3 1/2] dt-bindings: display: bridge: Add bindings for
 SN65DSI83/84/85
To: Jagan Teki <jagan@amarulasolutions.com>, Rob Herring
 <robh+dt@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>
References: <20210214174453.104616-1-jagan@amarulasolutions.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <be0fdd57-507d-0f9b-89db-65891531908c@denx.de>
Date: Fri, 5 Mar 2021 22:43:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210214174453.104616-1-jagan@amarulasolutions.com>
Content-Language: en-US
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
Cc: devicetree@vger.kernel.org, linux-amarula@amarulasolutions.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/14/21 6:44 PM, Jagan Teki wrote:
> SN65DSI83/84/85 devices are MIPI DSI to LVDS based bridge
> controller IC's from Texas Instruments.
> 
> SN65DSI83 - Single Channel DSI to Single-link LVDS bridge
> SN65DSI84 - Single Channel DSI to Dual-link LVDS bridge
> SN65DSI85 - Dual Channel DSI to Dual-link LVDS bridge

[...]

> +description: |
> +  SN65DSI83/84/85 devices are MIPI DSI to LVDS based bridge controller
> +  IC's from Texas Instruments.
> +
> +  SN65DSI83 - Single Channel DSI to Single-link LVDS bridge
> +  SN65DSI84 - Single Channel DSI to Dual-link LVDS bridge
> +  SN65DSI85 - Dual Channel DSI to Dual-link LVDS bridge

[...]

> +properties:
> +  compatible:
> +    enum:
> +      - ti,sn65dsi83
> +      - ti,sn65dsi84

DSI85 seems missing ?

> +  reg:
> +    const: 0x2c

I have the DSI83 device at 0x2d, so this cannot be const 0x2c ?

> +  enable-gpios:
> +    maxItems: 1
> +    description: GPIO specifier for bridge enable pin (active high).

The bridge can work without this GPIO, so its optional.

[...]

Also, Doug reported that vcc and vcore regulators should likely be 
listed, see feedback on:
[PATCH 1/2] dt-bindings: drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 bindings
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
