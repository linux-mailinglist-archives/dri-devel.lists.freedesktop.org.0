Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D83E19B1F03
	for <lists+dri-devel@lfdr.de>; Sun, 27 Oct 2024 16:01:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CF4E10E15F;
	Sun, 27 Oct 2024 15:01:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZdZaJPbS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C3DA10E15F
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Oct 2024 15:01:10 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id CC97A7E4;
 Sun, 27 Oct 2024 16:01:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1730041268;
 bh=1KHBgB1jN5wEIj5V4tyt8H6QiXGElPZqaFhEXB8PLSU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZdZaJPbSLRfJ0YU/ZlFtblP8x+lYBLm/KWp8yy4MVNzEq3FzpFl0VfggQVi4zO2qH
 LDcB0vQPem3+aX+rvofEN5KVygJhuAmYTm9zpiwdIXzi+MzFoW+LOR0goHmd8yAA6u
 B8goxDOFR7cEv3pstOtxxFZk4lyObvv0h+WGMaM4=
Date: Sun, 27 Oct 2024 17:01:03 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: bridge: sn65dsi83: Add interrupt
Message-ID: <20241027150103.GJ6519@pendragon.ideasonboard.com>
References: <20241024095539.1637280-1-herve.codina@bootlin.com>
 <20241024095539.1637280-2-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241024095539.1637280-2-herve.codina@bootlin.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Herve,

Thank you for the patch.

On Thu, Oct 24, 2024 at 11:55:37AM +0200, Herve Codina wrote:
> Both the TI SN65DSI83 and SN65DSI84 bridges have an IRQ pin to signal
> errors using interrupt.
> 
> This interrupt is not documented in the binding.
> 
> Add the missing interrupts property.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  .../devicetree/bindings/display/bridge/ti,sn65dsi83.yaml       | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> index 48a97bb3e2e0..4505d2d83e0d 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> @@ -35,6 +35,9 @@ properties:
>    vcc-supply:
>      description: A 1.8V power supply (see regulator/regulator.yaml).
>  
> +  interrupts:
> +    maxItems: 1
> +
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>  

-- 
Regards,

Laurent Pinchart
