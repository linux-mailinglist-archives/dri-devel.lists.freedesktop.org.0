Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8333F0B00
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 20:25:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A15D6E8B6;
	Wed, 18 Aug 2021 18:24:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 026186E8B6
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 18:24:55 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 8fbb1805-0051-11ec-b37b-0050568c148b;
 Wed, 18 Aug 2021 18:24:44 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id CD104194B25;
 Wed, 18 Aug 2021 20:25:04 +0200 (CEST)
Date: Wed, 18 Aug 2021 20:24:52 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Nikola Pavlica <pavlica.nikola@gmail.com>
Cc: dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
 airlied@linux.ie, daniel@ffwll.ch,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: display: simple: Add Vivax TPC-9150 panel
Message-ID: <YR1QdDgB0H+8J318@ravnborg.org>
References: <20210818144648.72665-1-pavlica.nikola@gmail.com>
 <20210818144648.72665-2-pavlica.nikola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210818144648.72665-2-pavlica.nikola@gmail.com>
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

Hi Nikola,

On Wed, Aug 18, 2021 at 04:46:47PM +0200, Nikola Pavlica wrote:
> This tablet display is unique and hence must be added to documentation.
> Unfortunately, it's real make and number is not known due to obscure and
> missing documentation and lack of writing on the display assembly
> itself.
> 
> So the natural alternative that came to mind is to name the panel after
> the device that contained it (an Android tablet). Hopefully that isn't
> an issue.
> 
> I can confirm that the parameters that I've obtained are correct since
> they came from a dump of the original Android OS.
> 
> Signed-off-by: Nikola Pavlica <pavlica.nikola@gmail.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

I like this to be *before* the patch to panel-simple.c, as we cannot
apply the panel-simple.c patch before the compatible is documented.

Or we can apply it, but checkpatch will complain and that will stop me
applying.

So in other words - reverse the order of the patches.

	Sam

> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index 62b0d54d87b7..d0efefa5a820 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -285,6 +285,8 @@ properties:
>        - urt,umsh-8596md-11t
>        - urt,umsh-8596md-19t
>        - urt,umsh-8596md-20t
> +        # Vivax TPC-9150 tablet 9.0" WSVGA TFT LCD panel
> +      - vivax,tpc9150-panel
>          # VXT 800x480 color TFT LCD panel
>        - vxt,vl050-8048nt-c01
>          # Winstar Display Corporation 3.5" QVGA (320x240) TFT LCD panel
> -- 
> 2.32.0
