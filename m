Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0420427B4D
	for <lists+dri-devel@lfdr.de>; Sat,  9 Oct 2021 17:24:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9F5F6E1B4;
	Sat,  9 Oct 2021 15:24:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73C1B6E1B4
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Oct 2021 15:24:40 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id fc4276a5-2914-11ec-ac3c-0050568cd888;
 Sat, 09 Oct 2021 15:24:24 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 39D3C194BA9;
 Sat,  9 Oct 2021 17:24:26 +0200 (CEST)
Date: Sat, 9 Oct 2021 17:24:36 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: David Heidelberg <david@ixit.cz>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display: simple: hardware can use ddc-i2c-bus
Message-ID: <YWG0NGnKcsf3q+ds@ravnborg.org>
References: <20210927214503.36012-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210927214503.36012-1-david@ixit.cz>
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

Hi David,

On Mon, Sep 27, 2021 at 11:45:03PM +0200, David Heidelberg wrote:
> Both hardware and driver can communicate DDC over i2c bus.
> 
> Fixes warnings as:
> arch/arm/boot/dts/tegra20-paz00.dt.yaml: panel: 'ddc-i2c-bus' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	From schema: /home/runner/work/linux/linux/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>

Thanks, applied to drm-misc-next.

	Sam


> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml          | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index 31f678636717..e4d93e0ddfc3 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -319,6 +319,7 @@ properties:
>        - yes-optoelectronics,ytc700tlag-05-201c
>  
>    backlight: true
> +  ddc-i2c-bus: true
>    enable-gpios: true
>    port: true
>    power-supply: true
> -- 
> 2.33.0
