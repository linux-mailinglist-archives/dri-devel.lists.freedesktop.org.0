Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D38D15D800
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 14:10:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23B1E6F920;
	Fri, 14 Feb 2020 13:10:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0503F6F920
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 13:10:47 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 14E04504;
 Fri, 14 Feb 2020 14:10:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1581685843;
 bh=VBpnQBYrhS7rjLikkevn4VY+OoeRpTZ17mrFu2uIFkI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eSnObmA8eOFh0K2ebyyFg+LI6qet1ihcffdb8byKZ4v3oU0wkEJkF1+nyihZHhzPF
 2aQO2wtxyIkrz7RpgrddgUxhajY3HmSd7DzXCCmtAi+tsXM7UNLi8Ua4qHCz5/QJL7
 WikTXkvV1tNladGZ7HpnTfDjaHvHH23z/gPwEcRQ=
Date: Fri, 14 Feb 2020 15:10:25 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 1/2] dt-bindings: display: sun4i-tcon: Add LVDS Dual Link
 property
Message-ID: <20200214131025.GI4831@pendragon.ideasonboard.com>
References: <20200214123244.109300-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200214123244.109300-1-maxime@cerno.tech>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel.vetter@intel.com>,
 Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

Thank you for the patch.

On Fri, Feb 14, 2020 at 01:32:43PM +0100, Maxime Ripard wrote:
> SoCs that have multiple TCONs can use the two set of pins on the first TCON
> to drive a dual-link display. Add a property to enable the dual link.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  .../bindings/display/allwinner,sun4i-a10-tcon.yaml         | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
> index 86ad617d2327..aa6dd8409dbc 100644
> --- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
> +++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
> @@ -105,6 +105,13 @@ properties:
>          - const: edp
>          - const: lvds
>  
> +  allwinner,lvds-dual-link:
> +    type: boolean
> +    description: |
> +      On a SoC with two TCON with LVDS support, the first TCON can
> +      operate over both pins sets to output in a dual-link setup. This
> +      will be triggered by setting this property.

Could you maybe provide an example of how this property is supposed to
be used ? I'm especially wondering what ports are used in that case and
how they're connected.

> +
>    ports:
>      type: object
>      description: |

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
