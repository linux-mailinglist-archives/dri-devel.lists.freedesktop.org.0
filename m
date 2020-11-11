Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AC62AF2E1
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 15:01:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A35789FED;
	Wed, 11 Nov 2020 14:01:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 857C689FE3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 14:01:26 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 13F31A19;
 Wed, 11 Nov 2020 15:01:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1605103285;
 bh=51fAu1UeFFm6MkvjlJ3Z548fg6LgDLTNEsnQQ2v2WDU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YK1ye34235uVBRBLgpgCH3uPTmFkOlbs8ZY5HvxtVKhQ0py+uaGaUEuW0kk9BZKL+
 SUMeaW8IPPbHhY7T18lV4G4GhXTY9ntLM8wVJtSteAeL877OaEDnxqUjcHFGhLRvaw
 lkduxzDfKLRo3JMNpqTYBH7QegLx26S/6JpkOeeA=
Date: Wed, 11 Nov 2020 16:01:21 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: usb-connector: Add reference to
 graph schema
Message-ID: <20201111140121.GE4115@pendragon.ideasonboard.com>
References: <20201102203656.220187-1-robh@kernel.org>
 <20201102203656.220187-3-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201102203656.220187-3-robh@kernel.org>
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
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 kuninori.morimoto.gx@renesas.com, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

Thank you for the patch.

On Mon, Nov 02, 2020 at 02:36:55PM -0600, Rob Herring wrote:
> Now that we have a graph schema, reference it from the usb-connector
> schema.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> v3: new patch
> 
>  .../devicetree/bindings/connector/usb-connector.yaml   | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> index 728f82db073d..64f2e1246ddb 100644
> --- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
> +++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> @@ -125,11 +125,13 @@ properties:
>        power dual role.
> 
>    ports:
> -    description: OF graph bindings (specified in bindings/graph.txt) that model
> -      any data bus to the connector unless the bus is between parent node and
> -      the connector. Since a single connector can have multiple data buses every
> -      bus has an assigned OF graph port number as described below.
> +    $ref: /schemas/graph.yaml#/properties/ports
>      type: object
> +    description: OF graph bindings modeling any data bus to the connector
> +      unless the bus is between parent node and the connector. Since a single
> +      connector can have multiple data buses every bus has an assigned OF graph
> +      port number as described below.
> +
>      properties:
>        port@0:
>          type: object

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
