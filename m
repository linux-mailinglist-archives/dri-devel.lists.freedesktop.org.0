Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3454A1C6330
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 23:38:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 552346E43A;
	Tue,  5 May 2020 21:38:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE07A6E43A
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 21:38:19 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4FAB1542;
 Tue,  5 May 2020 23:38:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1588714698;
 bh=M5j/b8gzH+fEUm7+KYZDdahsQo0EipSPaFfxodU1oig=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bv9ht1WdBhg5CG4w/4P+SK85qmX/CvOLXcCs97A7poVWrT2LdnEqelj9shuNxri23
 q+7yrOU1+3pUmQ9bPZT1IQmdPG+EUdXY08/5sotkN0gT4/e7xHTlMi5/1yOEmRdUtF
 KGW4DTMbakP9826lut/JbXBtDvAaovgd0KwXycFQ=
Date: Wed, 6 May 2020 00:38:13 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v4 2/6] dt-bindings: display: Add hpd-gpios to
 panel-common bindings
Message-ID: <20200505213813.GC8640@pendragon.ideasonboard.com>
References: <20200430194617.197510-1-dianders@chromium.org>
 <20200430124442.v4.2.I1976736b400a3b30e46efa47782248b86b3bc627@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200430124442.v4.2.I1976736b400a3b30e46efa47782248b86b3bc627@changeid>
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
Cc: robdclark@chromium.org, devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 narmstrong@baylibre.com, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 jonas@kwiboo.se, jeffrey.l.hugo@gmail.com, spanda@codeaurora.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 a.hajda@samsung.com, bgolaszewski@baylibre.com, robh+dt@kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-gpio@vger.kernel.org,
 swboyd@chromium.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug,

Thank you for the patch.

On Thu, Apr 30, 2020 at 12:46:13PM -0700, Douglas Anderson wrote:
> In the cases where there is no connector in a system there's no great
> place to put "hpd-gpios".  As per discussion [1] the best place to put
> it is in the panel.  Add this to the device tree bindings.
> 
> [1] https://lore.kernel.org/r/20200417180819.GE5861@pendragon.ideasonboard.com
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> 
> Changes in v4: None
> Changes in v3: None
> Changes in v2:
> - ("dt-bindings: display: Add hpd-gpios to panel-common...") new for v2
> 
>  .../devicetree/bindings/display/panel/panel-common.yaml     | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-common.yaml b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> index ed051ba12084..e9a04a3a4f5f 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> @@ -96,6 +96,12 @@ properties:
>        (hot plug detect) signal, but the signal isn't hooked up so we should
>        hardcode the max delay from the panel spec when powering up the panel.
>  
> +  hpd-gpios:
> +    maxItems: 1
> +    description:
> +      If Hot Plug Detect (HPD) is connected to a GPIO in the system rather
> +      than a dedicated HPD pin the pin can be specified here.
> +
>    # Control I/Os
>  
>    # Many display panels can be controlled through pins driven by GPIOs. The nature

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
