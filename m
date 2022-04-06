Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D3E4F4F85
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 04:05:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF45E10EBF5;
	Wed,  6 Apr 2022 02:05:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E189110EBF5
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 02:05:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4C49B61542;
 Wed,  6 Apr 2022 02:05:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B886DC385A1;
 Wed,  6 Apr 2022 02:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649210750;
 bh=acChcUw+dtLQiG63ZL5fQxXE+Lczp9WNFEL8waQsqPs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mJVe9uh4OfYhQBkko31BKfMYBXQgMj+Y6d+POb7aTAmnB3eY1pk13Dvotb8xYtXDT
 4QRNeA/t4fnp1cpgQHG2Tedm0SX+9JH8NdED3eo9jiZ5fHCJBoSaBZd99tmzf5k/B2
 boccLvW/W5Xj/hxSsKNQFQOPXsGxFJKegEG854wfLLM0yn2o8gQkautNeKRZBG/kCH
 vR3LD4230NJuqs+feM0whJ99MmHNwDV65lnIOjadk0pTov2L5+vaK/B45HZ01u6W0e
 Y/xPGDSctg+4A3Hr9rXIun0hznibuwejIAB9PFrqqRdoyBL/BhyeGgX3oa/HtiXQkm
 Tu4At8Ig1vfUw==
Date: Wed, 6 Apr 2022 10:05:42 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v1 5/8] ARM: dts: imx6qdl-vicut1/vicutgo: The sgtl5000
 uses i2s not ac97
Message-ID: <20220406020542.GF129381@dragon>
References: <20220221095312.3692669-1-o.rempel@pengutronix.de>
 <20220221095312.3692669-5-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220221095312.3692669-5-o.rempel@pengutronix.de>
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
 David Airlie <airlied@linux.ie>, Robin van der Gracht <robin@protonic.nl>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 David Jander <david@protonic.nl>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 21, 2022 at 10:53:09AM +0100, Oleksij Rempel wrote:
> From: Robin van der Gracht <robin@protonic.nl>
> 
> According to Documentation/devicetree/bindings/sound/fsl,ssi.txt
> 'fsl,mode' should be specified for AC97 mode only.
> 
> The 'fsl,ssi' documentation doesn't say anything about specifying
> 'sound-dai-cells' so we'll remove that as well.

Hmm, what needs to be fixed is fsl,ssi binding doc, I think.

Shawn

> 
> Signed-off-by: Robin van der Gracht <robin@protonic.nl>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  arch/arm/boot/dts/imx6dl-victgo.dts   | 2 --
>  arch/arm/boot/dts/imx6qdl-vicut1.dtsi | 2 --
>  2 files changed, 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/imx6dl-victgo.dts b/arch/arm/boot/dts/imx6dl-victgo.dts
> index d542ddad4e32..20c7f80e5ec9 100644
> --- a/arch/arm/boot/dts/imx6dl-victgo.dts
> +++ b/arch/arm/boot/dts/imx6dl-victgo.dts
> @@ -591,8 +591,6 @@ &pwm3 {
>  };
>  
>  &ssi1 {
> -	#sound-dai-cells = <0>;
> -	fsl,mode = "ac97-slave";
>  	status = "okay";
>  };
>  
> diff --git a/arch/arm/boot/dts/imx6qdl-vicut1.dtsi b/arch/arm/boot/dts/imx6qdl-vicut1.dtsi
> index ec39008c0950..97ef8264947a 100644
> --- a/arch/arm/boot/dts/imx6qdl-vicut1.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl-vicut1.dtsi
> @@ -466,8 +466,6 @@ &pwm3 {
>  };
>  
>  &ssi1 {
> -	#sound-dai-cells = <0>;
> -	fsl,mode = "ac97-slave";
>  	status = "okay";
>  };
>  
> -- 
> 2.30.2
> 
