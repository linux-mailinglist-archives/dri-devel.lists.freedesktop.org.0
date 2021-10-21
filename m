Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5DA436886
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 18:58:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A4C66ECD7;
	Thu, 21 Oct 2021 16:58:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 607266ECD7
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 16:58:17 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 17fda43b-3290-11ec-9c3f-0050568c148b;
 Thu, 21 Oct 2021 16:58:20 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id C46EB194B7E;
 Thu, 21 Oct 2021 18:58:14 +0200 (CEST)
Date: Thu, 21 Oct 2021 18:58:13 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Julian Braha <julianbraha@gmail.com>
Cc: thierry.reding@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: panel-simple-dsi: add Tianma TL057FVXP01
Message-ID: <YXGcJeqfBh5Cc7yX@ravnborg.org>
References: <20211018225221.25330-1-julianbraha@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211018225221.25330-1-julianbraha@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Julian,

On Mon, Oct 18, 2021 at 06:52:21PM -0400, Julian Braha wrote:
> Adds the bindings for the Tianma TL057FVXP01 DSI panel,
> found on the Motorola Moto G6.
> 
> v2:
> Fixed accidental whitespace deletion.
> 
> Signed-off-by: Julian Braha <julianbraha@gmail.com>

Sorry to bother you but I have deleted the original thread.
Can you resend the binding and the driver patch is one series,
or at last the driver then I will try to keep this mail around.

	Sam

> ---
>  .../devicetree/bindings/display/panel/panel-simple-dsi.yaml     | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
> index fbd71669248f..92a702d141e1 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
> @@ -55,6 +55,8 @@ properties:
>        - samsung,sofef00
>          # Shangai Top Display Optoelectronics 7" TL070WSH30 1024x600 TFT LCD panel
>        - tdo,tl070wsh30
> +        # Tianma Micro-electronics TL057FVXP01 5.7" 2160x1080 LCD panel
> +      - tianma,tl057fvxp01
>  
>    reg:
>      maxItems: 1
> -- 
> 2.30.2
