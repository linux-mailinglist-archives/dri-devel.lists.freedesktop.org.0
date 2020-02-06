Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BDB154D3B
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 21:46:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D20F6FB47;
	Thu,  6 Feb 2020 20:46:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 495F96FB47;
 Thu,  6 Feb 2020 20:46:28 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id gv17so499749pjb.1;
 Thu, 06 Feb 2020 12:46:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=2NBFgKyFN0dyFl8VDFki9+LYpwoMV3nlGwylBI5zhTc=;
 b=is09vlFbX5CfRaTg+sqc26R1aYBp0ivQ+owR5pYoJT/WPd6KZxLokdZTWxwoZf+UBS
 jphcpWzdM8350QI2rGfbRtlHuRqUlopchBtsEA2kSlbuI028TEgQr5gEd9n6Z6YFBNLC
 xforcLnQdcHaIvRO2mOw66UpzzQzaVbbTjTMBg8uLw+guRJt0d99DaBM3DZNtpNGDlN/
 cZUfAkC+OEc3X03cF7jKajGaUIh0BAPasUQ20Rkm6icayayra87gOVOcmG9sZYhmBso4
 UEwAh1ml0R/Uo6Fs9IjjzBSm2BmXS3hPPkeuyYjZtCP8Pq6jFWjj7/Dw6+9yrCIxydVj
 evDw==
X-Gm-Message-State: APjAAAVg2RkUv1yjwMjK65SHh8f5/bnruVGMe+zVYY5UvCIozC6thh0j
 ZBRzJ2AWgOTEDxAQII6CWA==
X-Google-Smtp-Source: APXvYqyNEAAyTPvXxo1+qNGiJAaKLAML/OFDLMtfR2Y+1qUW/cvHgBNZYIkLTG9VLfLbpd3NqAC9UA==
X-Received: by 2002:a17:90a:c390:: with SMTP id
 h16mr6846851pjt.131.1581021987274; 
 Thu, 06 Feb 2020 12:46:27 -0800 (PST)
Received: from rob-hp-laptop (63-158-47-182.dia.static.qwest.net.
 [63.158.47.182])
 by smtp.gmail.com with ESMTPSA id e38sm268368pgm.82.2020.02.06.12.46.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 12:46:26 -0800 (PST)
Received: (nullmailer pid 23987 invoked by uid 1000);
 Thu, 06 Feb 2020 19:13:14 -0000
Date: Thu, 6 Feb 2020 19:13:14 +0000
From: Rob Herring <robh@kernel.org>
To: Harigovindan P <harigovi@codeaurora.org>
Subject: Re: [v1] dt-bindings: msm:disp: update dsi and dpu bindings
Message-ID: <20200206191314.GA19759@bogus>
References: <1580825737-27189-1-git-send-email-harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1580825737-27189-1-git-send-email-harigovi@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 seanpaul@chromium.org, kalyan_t@codeaurora.org, hoegsberg@chromium.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 04, 2020 at 07:45:37PM +0530, Harigovindan P wrote:
> Updating bindings of dsi and dpu by adding and removing certain
> properties.

Yes, the diff tells me that. The commit message should say why.

This change breaks compatibility as well.

> 
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> ---
> 
> Changes in v1:
>         - Adding "ahb" clock as a required property.
>         - Adding "bus", "rot", "lut" as optional properties for sc7180 device.
>         - Removing properties from dsi bindings that are unused.
> 	- Removing power-domain property since DSI is the child node of MDSS
> 	  and it will inherit supply from its parent.
> 
>  Documentation/devicetree/bindings/display/msm/dpu.txt | 7 +++++++
>  Documentation/devicetree/bindings/display/msm/dsi.txt | 5 -----
>  2 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu.txt b/Documentation/devicetree/bindings/display/msm/dpu.txt
> index 551ae26..dd58472a 100644
> --- a/Documentation/devicetree/bindings/display/msm/dpu.txt
> +++ b/Documentation/devicetree/bindings/display/msm/dpu.txt
> @@ -19,6 +19,7 @@ Required properties:
>    The following clocks are required:
>    * "iface"
>    * "bus"
> +  * "ahb"

You can't just add new clocks...

>    * "core"
>  - interrupts: interrupt signal from MDSS.
>  - interrupt-controller: identifies the node as an interrupt controller.
> @@ -50,6 +51,8 @@ Required properties:
>  - clock-names: device clock names, must be in same order as clocks property.
>    The following clocks are required.
>    * "bus"
> +  For the device "qcom,sc7180-dpu":
> +  * "bus" - is an optional property due to architecture change.
>    * "iface"
>    * "core"
>    * "vsync"
> @@ -70,6 +73,10 @@ Optional properties:
>  - assigned-clocks: list of clock specifiers for clocks needing rate assignment
>  - assigned-clock-rates: list of clock frequencies sorted in the same order as
>    the assigned-clocks property.
> +- For the device "qcom,sc7180-dpu":
> +  clock-names: optional device clocks, needed for accessing LUT blocks.
> +  * "rot"
> +  * "lut"
>  
>  Example:
>  
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi.txt b/Documentation/devicetree/bindings/display/msm/dsi.txt
> index af95586..61d659a 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi.txt
> +++ b/Documentation/devicetree/bindings/display/msm/dsi.txt
> @@ -8,13 +8,10 @@ Required properties:
>  - reg-names: The names of register regions. The following regions are required:
>    * "dsi_ctrl"
>  - interrupts: The interrupt signal from the DSI block.
> -- power-domains: Should be <&mmcc MDSS_GDSC>.
>  - clocks: Phandles to device clocks.
>  - clock-names: the following clocks are required:
> -  * "mdp_core"
>    * "iface"
>    * "bus"
> -  * "core_mmss"
>    * "byte"
>    * "pixel"
>    * "core"
> @@ -156,7 +153,6 @@ Example:
>  			"core",
>  			"core_mmss",
>  			"iface",
> -			"mdp_core",
>  			"pixel";
>  		clocks =
>  			<&mmcc MDSS_AXI_CLK>,
> @@ -164,7 +160,6 @@ Example:
>  			<&mmcc MDSS_ESC0_CLK>,
>  			<&mmcc MMSS_MISC_AHB_CLK>,
>  			<&mmcc MDSS_AHB_CLK>,
> -			<&mmcc MDSS_MDP_CLK>,
>  			<&mmcc MDSS_PCLK0_CLK>;
>  
>  		assigned-clocks =
> -- 
> 2.7.4
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
