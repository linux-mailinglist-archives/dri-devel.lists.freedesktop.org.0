Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FCE534681
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 00:34:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CA6110E8BC;
	Wed, 25 May 2022 22:34:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A97F910E8BC
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 22:34:25 +0000 (UTC)
Received: from pendragon.ideasonboard.com (ip-109-40-242-63.web.vodafone.de
 [109.40.242.63])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8B09C563;
 Thu, 26 May 2022 00:34:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1653518063;
 bh=SEgBW7SHEvO9WqxRVFG1Zg8n5BFJC+ASS7wS2330RpQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K1mboHc48vmbNTO50G6n+zn3SoJnydnuIxaUVlTQIkB34RM85zmmQ39/6Jt7fqfhZ
 L45dnG4X6HlTI2Xj1IHPy6lvGm6lDQKgnz0L07hpvXknhrBb5zXkaNwOakaVtrHzDi
 5EEti13iHMTR+YeWbLGOwdazoUBi9f/wtZr2mQOU=
Date: Thu, 26 May 2022 01:34:18 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: display: ingenic,jz4780-hdmi: Drop
 undocumented 'ddc-i2c-bus'
Message-ID: <Yo6u6jcVSsTQvRiU@pendragon.ideasonboard.com>
References: <20220525205626.2482584-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220525205626.2482584-1-robh@kernel.org>
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
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

Thank you for the patch.

On Wed, May 25, 2022 at 03:56:26PM -0500, Rob Herring wrote:
> While 'ddc-i2c-bus' is a common property, it should be in a connector
> node rather than the HDMI bridge node as the I2C bus goes to a
> connector and not the HDMI block. Drop it from the example.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml  | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml b/Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml
> index b8219eab4475..89490fdffeb0 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml
> @@ -55,7 +55,6 @@ examples:
>          compatible = "ingenic,jz4780-dw-hdmi";
>          reg = <0x10180000 0x8000>;
>          reg-io-width = <4>;
> -        ddc-i2c-bus = <&i2c4>;
>          interrupt-parent = <&intc>;
>          interrupts = <3>;
>          clocks = <&cgu JZ4780_CLK_AHB0>, <&cgu JZ4780_CLK_HDMI>;

-- 
Regards,

Laurent Pinchart
