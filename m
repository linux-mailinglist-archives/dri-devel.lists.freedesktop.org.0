Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EAB4F4D11
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 03:24:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5127510ECCC;
	Wed,  6 Apr 2022 01:24:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8399810ECCC
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 01:24:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3B618B82014;
 Wed,  6 Apr 2022 01:23:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9027AC385A1;
 Wed,  6 Apr 2022 01:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649208236;
 bh=y610PixkxE0FbqCL6lBrY29URlY0CZAXClPdmkzBRr8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mPT1GL31n6ypgG8+0qeuiomp4TGySTjAhFA1JoBIEH4K6CR2KfpyHO0IfL9ksSOyo
 v1o9u56Y/wVLQCrdJzucyk86wNkIe5XNeC/Vb+XHGU0ASvnAKTdfdt6klXsKbbTjdD
 AdCjGtPjCp9IpQVGCZzS8EhDuF6lBOfUwbM4hma6sppIYVWSMhp9zMP6D+I7SHobpV
 68YfptgKuHu/pfZ/xKk6/DSmloIy5b85XZ+zQE58B4lRS7Gy+P+TwxHRQ/EWLyriga
 PAxTJ0yjK+XOmAMZ0Eg077Rs85AQsgqjk9sgvGaSbxSCLUTQ5TPjy9gwenbIKvBX4h
 jb5R27IhVqK+A==
Date: Wed, 6 Apr 2022 09:23:48 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v1 1/8] ARM: dts: imx6qdl-vicut1/vicutgo: Set default
 backlight brightness to maximum
Message-ID: <20220406012348.GE129381@dragon>
References: <20220221095312.3692669-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220221095312.3692669-1-o.rempel@pengutronix.de>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robin van der Gracht <robin@protonic.nl>, David Airlie <airlied@linux.ie>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 David Jander <david@protonic.nl>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 21, 2022 at 10:53:05AM +0100, Oleksij Rempel wrote:
> From: David Jander <david@protonic.nl>
> 
> Recover default behavior of the device and set maximal brightness
> 
> Signed-off-by: David Jander <david@protonic.nl>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  arch/arm/boot/dts/imx6dl-victgo.dts   | 2 +-
>  arch/arm/boot/dts/imx6qdl-vicut1.dtsi | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/imx6dl-victgo.dts b/arch/arm/boot/dts/imx6dl-victgo.dts
> index 227c952543d4..e6134efbfabd 100644
> --- a/arch/arm/boot/dts/imx6dl-victgo.dts
> +++ b/arch/arm/boot/dts/imx6dl-victgo.dts
> @@ -28,7 +28,7 @@ backlight: backlight {
>  		pwms = <&pwm1 0 5000000 0>;
>  		brightness-levels = <0 16 64 255>;
>  		num-interpolated-steps = <16>;
> -		default-brightness-level = <1>;
> +		default-brightness-level = <48>;

Please take a look at the documentation of the property.

  default-brightness-level:
    description:
      The default brightness level (index into the array defined by the
      "brightness-levels" property).

Shawn

>  		power-supply = <&reg_3v3>;
>  		enable-gpios = <&gpio4 28 GPIO_ACTIVE_HIGH>;
>  	};
> diff --git a/arch/arm/boot/dts/imx6qdl-vicut1.dtsi b/arch/arm/boot/dts/imx6qdl-vicut1.dtsi
> index 1ac7e13249d2..c1d06bc28c67 100644
> --- a/arch/arm/boot/dts/imx6qdl-vicut1.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl-vicut1.dtsi
> @@ -23,7 +23,7 @@ backlight: backlight {
>  		pwms = <&pwm1 0 5000000 0>;
>  		brightness-levels = <0 16 64 255>;
>  		num-interpolated-steps = <16>;
> -		default-brightness-level = <1>;
> +		default-brightness-level = <48>;
>  		power-supply = <&reg_3v3>;
>  		enable-gpios = <&gpio4 28 GPIO_ACTIVE_HIGH>;
>  	};
> -- 
> 2.30.2
> 
