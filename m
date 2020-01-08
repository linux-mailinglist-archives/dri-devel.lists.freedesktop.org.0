Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1FE134E57
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 22:04:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A5396E33F;
	Wed,  8 Jan 2020 21:04:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 856D06E33F
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2020 21:04:00 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 319B380540;
 Wed,  8 Jan 2020 22:03:58 +0100 (CET)
Date: Wed, 8 Jan 2020 22:03:56 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: Add vendor prefix for Satoz
Message-ID: <20200108210356.GB4476@ravnborg.org>
References: <20200106151827.31511-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200106151827.31511-1-miquel.raynal@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=oYh99mQ5AAAA:8
 a=P-IC7800AAAA:8 a=VwQbUJbxAAAA:8 a=J3MoksNOTPvGxBsvGqEA:9
 a=CjuIK1q_8ugA:10 a=Dexii-P0nw1V_nRav-Pa:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=AjGcO6oz07-iQ99wixmX:22
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Miquel.

On Mon, Jan 06, 2020 at 04:18:25PM +0100, Miquel Raynal wrote:
> Satoz is a Chinese TFT manufacturer.
> Website: http://www.sat-sz.com/English/index.html
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Acked-by: Rob Herring <robh@kernel.org>

I have applied this.
Can you please re-do patch 2/3 so the compatible is added to
panel-simple.yaml - which I just pushed to drm-misc-next.

Then we have a two-line entry rather than a whole file
as you also asked for.

	Sam

> ---
> 
> Changes since v3:
> * None.
> 
> Changes since v2:
> * None.
> 
> Changes since v1:
> * Added Rob's Ack.
> 
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 967e78c5ec0a..4894c5314b49 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -819,6 +819,8 @@ patternProperties:
>      description: Sancloud Ltd
>    "^sandisk,.*":
>      description: Sandisk Corporation
> +  "^satoz,.*":
> +    description: Satoz International Co., Ltd
>    "^sbs,.*":
>      description: Smart Battery System
>    "^schindler,.*":
> -- 
> 2.20.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
