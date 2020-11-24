Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF032C2F0B
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 18:45:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 360876E323;
	Tue, 24 Nov 2020 17:45:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 826A76E323
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 17:45:40 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 0EBBF80636;
 Tue, 24 Nov 2020 18:45:36 +0100 (CET)
Date: Tue, 24 Nov 2020 18:45:35 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: "Lukas F. Hartmann" <lukas@mntre.com>
Subject: Re: [PATCH 2/2] dt-bindings: display/panel: add Innolux N125HCE-GN1
Message-ID: <20201124174535.GA57448@ravnborg.org>
References: <20201124172604.981746-1-lukas@mntre.com>
 <20201124172604.981746-2-lukas@mntre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201124172604.981746-2-lukas@mntre.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VafZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=Xw0AzbREAAAA:8 a=FZtKqjOaVaul58dK6XgA:9
 a=CjuIK1q_8ugA:10 a=8ntjimWYsTyQni2bnFcl:22
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lukas

On Tue, Nov 24, 2020 at 06:26:06PM +0100, Lukas F. Hartmann wrote:
> The Innolux N125HCE-GN1 display is used in the MNT Reform 2.0 laptop,
> attached via eDP to a SN65DSI86 MIPI-DSI to eDP bridge. This patch
> contains the DT binding for "innolux,n125hce-gn1".
> 
> Signed-off-by: Lukas F. Hartmann <lukas@mntre.com>

bindings before their usage, so this should be first patch.

> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index edb53ab0d..03b3e0b9d 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -160,6 +160,8 @@ properties:
>          # Innolux Corporation 11.6" WXGA (1366x768) TFT LCD panel
>        - innolux,n116bge
>          # InnoLux 15.6" WXGA TFT LCD panel
> +      - innolux,n125hce-gn1
> +        # InnoLux 13.3" FHD (1920x1080) eDP TFT LCD panel

Comments before the compatible.

I applied this first and reordered the comment - so both details are
handled.

Applied to drm-misc-next.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
