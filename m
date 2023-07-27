Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EF476495E
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 09:53:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1C8510E501;
	Thu, 27 Jul 2023 07:53:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6541910E501
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 07:53:05 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D51114A9;
 Thu, 27 Jul 2023 09:52:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1690444325;
 bh=dR8gnsMmE2P/4PG3z2RpAooK2VdzEXWdnAESzz3tzGo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QLceiO/bT7iigaqo5m1H9YfZv1+e+eGHhkelR0EzPuQQH4DPln/NGlcJWK41nFkjV
 tQ4GPtuZI10fJFTSLvcv5WuldHhWmCucBWZbBstN11Y7FGJv/6idM57McyZqK7/YCC
 jgNS2reGm/i2vEYFNZDBYoDOeSYu++veIzZmSZpg=
Date: Thu, 27 Jul 2023 10:53:10 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: display: panel: Move Chunghwa
 CLAA070WP03XG to LVDS
Message-ID: <20230727075310.GC25174@pendragon.ideasonboard.com>
References: <20230726185010.2294709-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230726185010.2294709-1-thierry.reding@gmail.com>
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

On Wed, Jul 26, 2023 at 08:50:08PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The Chunghwa CLAA070WP03XG is an LVDS panel, so move it to the correct
> bindings file.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  Documentation/devicetree/bindings/display/panel/panel-lvds.yaml | 2 ++
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 --
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> index 344e5df40c2f..dbbf32a8be87 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> @@ -40,6 +40,8 @@ properties:
>      items:
>        - enum:
>            - auo,b101ew05
> +          # Chunghwa Picture Tubes Ltd. 7" WXGA (800x1280) TFT LCD LVDS panel
> +          - chunghwa,claa070wp03xg
>            # HannStar Display Corp. HSD101PWW2 10.1" WXGA (1280x800) LVDS panel
>            - hannstar,hsd101pww2
>            - tbs,a711-panel
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index f4d9da4afefd..67959290b212 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -103,8 +103,6 @@ properties:
>        - cdtech,s070wv95-ct16
>          # Chefree CH101OLHLWH-002 10.1" (1280x800) color TFT LCD panel
>        - chefree,ch101olhlwh-002
> -        # Chunghwa Picture Tubes Ltd. 7" WXGA TFT LCD panel
> -      - chunghwa,claa070wp03xg
>          # Chunghwa Picture Tubes Ltd. 10.1" WXGA TFT LCD panel
>        - chunghwa,claa101wa01a
>          # Chunghwa Picture Tubes Ltd. 10.1" WXGA TFT LCD panel

-- 
Regards,

Laurent Pinchart
