Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EF3481545
	for <lists+dri-devel@lfdr.de>; Wed, 29 Dec 2021 17:47:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D01A710E1F8;
	Wed, 29 Dec 2021 16:47:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B48D810E1F8
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Dec 2021 16:47:01 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 20AC1D6E;
 Wed, 29 Dec 2021 17:47:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1640796420;
 bh=ymKJuUNIvrp3/QHbIsO0gRO9KwKbQnHDSoAKgx7VMMQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ITKgtCJX60ss+aEn430yirkaZ87nHCGVxRYHuRLK9nKW4bYLGp60z3za9VwQDGQKU
 4PG9K2RbnCA2zq7wBUgknmGoRC7wIBRKVI+sDiJRYh/C5C5vUu9lfai9XrNhR2cMJX
 utWApJhZOqssm/2yqr1sXcuVNAxqFB0jh932HRvU=
Date: Wed, 29 Dec 2021 18:46:58 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: Re: [PATCH 3/3] dt-bindings: display: bridge: renesas, lvds: Document
 r8a77961 bindings
Message-ID: <YcyRAk/d2728mDgH@pendragon.ideasonboard.com>
References: <20211224052309.1997096-1-nikita.yoush@cogentembedded.com>
 <20211224052309.1997096-4-nikita.yoush@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211224052309.1997096-4-nikita.yoush@cogentembedded.com>
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
Cc: devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nikita,

Thank you for the patch.

On Fri, Dec 24, 2021 at 08:23:09AM +0300, Nikita Yushchenko wrote:
> Document the R-Car M3-W+ (R8A77961) SoC in the R-Car LVDS encoder
> bindings.
> 
> Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
> ---
>  .../devicetree/bindings/display/bridge/renesas,lvds.yaml         | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
> index acfc327f70a7..ca5443e5c2e3 100644
> --- a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
> @@ -27,6 +27,7 @@ properties:
>        - renesas,r8a7791-lvds # for R-Car M2-W compatible LVDS encoders
>        - renesas,r8a7793-lvds # for R-Car M2-N compatible LVDS encoders
>        - renesas,r8a7795-lvds # for R-Car H3 compatible LVDS encoders
> +      - renesas,r8a77961-lvds # for R-Car M3-W+ compatible LVDS encoders

I'll move this line after the next to keep them sorted. No need to
resubmit.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>        - renesas,r8a7796-lvds # for R-Car M3-W compatible LVDS encoders
>        - renesas,r8a77965-lvds # for R-Car M3-N compatible LVDS encoders
>        - renesas,r8a77970-lvds # for R-Car V3M compatible LVDS encoders

-- 
Regards,

Laurent Pinchart
