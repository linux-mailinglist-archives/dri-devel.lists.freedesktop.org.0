Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4BD764963
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 09:53:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D48910E503;
	Thu, 27 Jul 2023 07:53:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C71F510E503
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 07:53:34 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3C3DC4A9;
 Thu, 27 Jul 2023 09:52:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1690444354;
 bh=q2DYtbFmbhJ6XFDL3PRzs1vfmLvBbkXV5QWg7q2GMuw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N5qT3rDxLY3QGBYiyHghxiw+8HqoFRi3rxuUgqm6h4OmVwQIfkW3x9q5Lv4jIsAyk
 ja3wqm6kIgPSnEdXVsoWN/JFRRPqivq1ZSg7kRBCQ7XBh0XXkkHBPm9yHXo43VUYq6
 /VdTVxkKEYlQ9S5mpsIsDTYvPSlirhUSVuKTT0wQ=
Date: Thu, 27 Jul 2023 10:53:39 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: display: panel: Document Hydis
 HV070WX2-1E0
Message-ID: <20230727075339.GD25174@pendragon.ideasonboard.com>
References: <20230726185010.2294709-1-thierry.reding@gmail.com>
 <20230726185010.2294709-2-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230726185010.2294709-2-thierry.reding@gmail.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Svyatoslav Ryhel <clamor95@gmail.com>, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-tegra@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thierry,

Thank you for the patch.

On Wed, Jul 26, 2023 at 08:50:09PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The Hydis HV070WX2-1E0 is a 7" WXGA (800x1280) TFT LCD LVDS panel that
> is one of the variants used on Google Nexus 7.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  Documentation/devicetree/bindings/display/panel/panel-lvds.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> index dbbf32a8be87..9f1016551e0b 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> @@ -44,6 +44,8 @@ properties:
>            - chunghwa,claa070wp03xg
>            # HannStar Display Corp. HSD101PWW2 10.1" WXGA (1280x800) LVDS panel
>            - hannstar,hsd101pww2
> +          # Hydis Technologies 7" WXGA (800x1280) TFT LCD LVDS panel
> +          - hydis,hv070wx2-1e0
>            - tbs,a711-panel
>  
>        - const: panel-lvds

-- 
Regards,

Laurent Pinchart
