Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C07913531F
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 07:20:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10632898A4;
	Thu,  9 Jan 2020 06:20:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26693898A4
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2020 06:20:30 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 3B0542006A;
 Thu,  9 Jan 2020 07:20:28 +0100 (CET)
Date: Thu, 9 Jan 2020 07:20:27 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 2/2] dt-bindings: panel-simple: Add compatible for Sharp
 LS020B1DD01D
Message-ID: <20200109062026.GB9071@ravnborg.org>
References: <20200109003000.119516-1-paul@crapouillou.net>
 <20200109003000.119516-2-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200109003000.119516-2-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=ER_8r6IbAAAA:8
 a=4zq-3AoUyEjbUeS7jCwA:9 a=CjuIK1q_8ugA:10 a=9LHmKk7ezEChjTCyhBa9:22
 a=pHzHmUro8NiASowvMSCR:22 a=6VlIyEUom7LUIeUMNQJH:22
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, od@zcrc.me,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 08, 2020 at 09:30:00PM -0300, Paul Cercueil wrote:
> Add a compatible string for the Sharp LS020B1DD01D 2" HQVGA TFT LCD
> panel, and remove the old sharp,ls020b1dd01d.txt documentation which is
> now obsolete.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Applied to drm-misc-next, thanks

	Sam

> ---
>  .../bindings/display/panel/panel-simple.yaml         |  2 ++
>  .../bindings/display/panel/sharp,ls020b1dd01d.txt    | 12 ------------
>  2 files changed, 2 insertions(+), 12 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/sharp,ls020b1dd01d.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index c1a77d9105a2..f1fba1db382a 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -35,6 +35,8 @@ properties:
>        - ampire,am800480r3tmqwa1h
>          # GiantPlus GPM940B0 3.0" QVGA TFT LCD panel
>        - giantplus,gpm940b0
> +        # Sharp LS020B1DD01D 2.0" HQVGA TFT LCD panel
> +      - sharp,ls020b1dd01d
>  
>    backlight: true
>    enable-gpios: true
> diff --git a/Documentation/devicetree/bindings/display/panel/sharp,ls020b1dd01d.txt b/Documentation/devicetree/bindings/display/panel/sharp,ls020b1dd01d.txt
> deleted file mode 100644
> index e45edbc565a3..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/sharp,ls020b1dd01d.txt
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -Sharp 2.0" (240x160 pixels) 16-bit TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "sharp,ls020b1dd01d"
> -- power-supply: as specified in the base binding
> -
> -Optional properties:
> -- backlight: as specified in the base binding
> -- enable-gpios: as specified in the base binding
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> -- 
> 2.24.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
