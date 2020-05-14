Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2951D28B9
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 09:27:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAF0D6EACB;
	Thu, 14 May 2020 07:27:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 836A16EACB
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 07:27:03 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (unknown [217.70.183.200])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id D74383A9CAC
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 07:15:42 +0000 (UTC)
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it
 [2.224.242.101]) (Authenticated sender: jacopo@jmondi.org)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id A40FC2000F;
 Thu, 14 May 2020 07:15:18 +0000 (UTC)
Date: Thu, 14 May 2020 09:18:35 +0200
From: Jacopo Mondi <jacopo@jmondi.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH 5/4] dt-bindings: display: bridge: thc63lvd1024: Document
 dual-output mode
Message-ID: <20200514071835.ap4pusz3i52jhosc@uno.localdomain>
References: <20200406111543.GC4757@pendragon.ideasonboard.com>
 <20200513232127.21798-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200513232127.21798-1-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Thu, May 14, 2020 at 02:21:27AM +0300, Laurent Pinchart wrote:
> The DT binding support both dual-input and dual-output mode, but only
> dual-input is documented. Document dual-output mode.
>
> Suggested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks
Acked-by: Jacopo Mondi <jacopo@jmondi.org>


> ---
>  .../display/bridge/thine,thc63lvd1024.yaml       | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.yaml b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.yaml
> index 469ac4a34273..fedd3460d6f6 100644
> --- a/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.yaml
> @@ -30,11 +30,17 @@ properties:
>        This device has four video ports. Their connections are modeled using the
>        OF graph bindings specified in Documentation/devicetree/bindings/graph.txt.
>
> -      The device can operate in single-link mode or dual-link mode. In
> -      single-link mode, all pixels are received on port@0, and port@1 shall not
> -      contain any endpoint. In dual-link mode, even-numbered pixels are
> -      received on port@0 and odd-numbered pixels on port@1, and both port@0 and
> -      port@1 shall contain endpoints.
> +      The device can operate in single or dual input and output modes.
> +
> +      When operating in single input mode, all pixels are received on port@0,
> +      and port@1 shall not contain any endpoint. In dual input mode,
> +      even-numbered pixels are received on port@0 and odd-numbered pixels on
> +      port@1, and both port@0 and port@1 shall contain endpoints.
> +
> +      When operating in single output mode all pixels are output from the first
> +      CMOS/TTL port and port@3 shall not contain any endpoint. In dual output
> +      mode pixels are output from both CMOS/TTL ports and both port@2 and
> +      port@3 shall contain endpoints.
>
>      properties:
>        '#address-cells':
> --
> Regards,
>
> Laurent Pinchart
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
