Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C463AA8D0
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 03:57:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 054C26E7D0;
	Thu, 17 Jun 2021 01:57:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E2BD6E7D0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 01:57:45 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 06283E53;
 Thu, 17 Jun 2021 03:57:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1623895063;
 bh=Z2N2k77gMr7nNxeA63YorzCdihQE805EO/4rjphda/Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QhrGW8xJk6uG4Qp+7P1PILIBKn7UU21vAVLfq/RoU/V8qiVOAwSG3e0INOVv/nZKU
 fH4dIQCXPgRr2ZGxqzw43vZyCWyhOZ0d8dXa7M5Y7rqDe2P/ndQO0SOA8vwG3O4rGz
 6HY8FGkFjrL8oqtbHYbFQ4aeQ6+ErqcaYvNagSgI=
Date: Thu, 17 Jun 2021 04:57:22 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] dt-bindings: display: renesas,du: Make resets optional
 on R-Car H1
Message-ID: <YMqsAkFfAU02t4oD@pendragon.ideasonboard.com>
References: <2da75fd2e971dfab8dd05a2a28bb1d6d9cbe5adb.1619700420.git.geert+renesas@glider.be>
 <YIrU+tdcfQ/6ODRz@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YIrU+tdcfQ/6ODRz@pendragon.ideasonboard.com>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

On Thu, Apr 29, 2021 at 06:47:06PM +0300, Laurent Pinchart wrote:
> On Thu, Apr 29, 2021 at 02:47:31PM +0200, Geert Uytterhoeven wrote:
> > The "resets" property is not present on R-Car Gen1 SoCs.
> > Supporting it would require migrating from renesas,cpg-clocks to
> > renesas,cpg-mssr.
> > 
> > Reflect this in the DT bindings by removing the global "required:
> > resets".  All SoCs that do have "resets" properties already have
> > SoC-specific rules making it required.
> 
> Should we drop the
> 
>         resets:
> 	  maxItems: 1
> 
> from renesas,du-r8a7779 then ? And maybe the
> 
>   resets: true
> 
> in the general case ?

Any opinion on this ?

> > Fixes: 99d66127fad25ebb ("dt-bindings: display: renesas,du: Convert binding to YAML")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  Documentation/devicetree/bindings/display/renesas,du.yaml | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/Documentation/devicetree/bindings/display/renesas,du.yaml
> > index 552a99ce4f1280d7..e955034da53b86e2 100644
> > --- a/Documentation/devicetree/bindings/display/renesas,du.yaml
> > +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
> > @@ -89,7 +89,6 @@ required:
> >    - reg
> >    - clocks
> >    - interrupts
> > -  - resets
> >    - ports
> >  
> >  allOf:

-- 
Regards,

Laurent Pinchart
