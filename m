Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 693E225E8F8
	for <lists+dri-devel@lfdr.de>; Sat,  5 Sep 2020 18:07:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFA606E10E;
	Sat,  5 Sep 2020 16:07:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A6D96E10E
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Sep 2020 16:07:40 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B6C3A335;
 Sat,  5 Sep 2020 18:07:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1599322057;
 bh=IB7aiNF5Sb4q/FXtKiMOEHFOQFRZ3n8rv9ArPIC44tk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DXiRUtx74nhKWsTE0dT3zhkPyvZLLHKqpS8m2WCGl5PGMiYJQEDpp0by3Ai2QEcw/
 ewP2tHRhGjQnr2voRHeinE+hAayuvTUV4JfGTwM618+0kLicpIjgju2gQs4XWNjCxL
 v5QKfyk7CrN4Ats/cfMYBiHh2lhiwm3sd1/a9gIM=
Date: Sat, 5 Sep 2020 19:07:14 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Robert Chiras (OSS)" <robert.chiras@oss.nxp.com>
Subject: Re: [PATCH 4/5] dt-bindings: display/bridge: nwl-dsi: Document
 fsl,clock-drop-level property
Message-ID: <20200905160714.GA6319@pendragon.ideasonboard.com>
References: <1598613212-1113-1-git-send-email-robert.chiras@oss.nxp.com>
 <1598613212-1113-5-git-send-email-robert.chiras@oss.nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1598613212-1113-5-git-send-email-robert.chiras@oss.nxp.com>
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
Cc: Ondrej Jirman <megous@megous.com>, devicetree@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>,
 Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Rob Herring <robh+dt@kernel.org>, linux-imx@nxp.com,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Robert,

Thank you for the patch.

On Fri, Aug 28, 2020 at 02:13:31PM +0300, Robert Chiras (OSS) wrote:
> From: Robert Chiras <robert.chiras@nxp.com>
> 
> Add documentation for a new property: 'fsl,clock-drop-level'.
> 
> Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
> ---
>  Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml b/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
> index 8b5741b..b415f4e 100644
> --- a/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
> @@ -143,6 +143,10 @@ properties:
>  
>      additionalProperties: false
>  
> +  clock-drop-level:
> +    description:
> +      Specifies the level at wich the crtc_clock should be dropped
> +

There's no "crtc_clock" defined in the bindings. As DT bindings
shouldn't be tied to a particular driver implementation, could you
document this property without referring to concepts specific to the
driver ? I think the documentation should also be extended, looking at
this patch I have no idea what this does and how to compute the value
that should be set.

>  patternProperties:
>    "^panel@[0-9]+$":
>      type: object

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
