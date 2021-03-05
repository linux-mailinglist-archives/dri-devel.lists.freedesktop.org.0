Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C41B32F474
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 21:09:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D74826EC45;
	Fri,  5 Mar 2021 20:09:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABE776EC45
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 20:09:26 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id j1so3851711oiw.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Mar 2021 12:09:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ss792e9AzN8pjeKvrYSJl54ETIcPVmGeIfafQZbwyRs=;
 b=ISdDDzz8H5IM75zLQ0fnDTxFuBX5+oHHU9Mw7d38hT9aob768Mlstrrm5jdQjIHNTD
 T7JYh2uqR12hAEpwOhsDPP3JjW36P8YcwhP1FRsXJ7BSFhsD4jOO34xgUfjEzK3sXsXT
 M4iT0AWHAS2t2mW7IGgobVgPXIX6k9JXx2cx2+Q2rmzEUiRrqRAQqH3OIcVGVIny8eCC
 82BAc90o2F8tptjhQt6WLAxsq7lxRBnqkVLFXFdKvuI7lPh0d17/dTLtx4QOo+JrQAdo
 XIfxp46HF6YbEKl/LniaBeCmbVNw6WwxLl/0ByVixW0Z5c3lgaj210LmhzbxgairrXvg
 wGSw==
X-Gm-Message-State: AOAM530Q2/2BbFkuGeLtz0u9iiWZrAGJSR/QmdMcCEnPGTMpPujZ5DKY
 PZKAOaDb4LGHlhRLOXAvZw==
X-Google-Smtp-Source: ABdhPJyWzH5vssnBk81mBIlieZqf96YvWnGr6QQXuZ9SWUS5ishKqyWBA+wIeKLkC43T5cLuSXWafA==
X-Received: by 2002:aca:de82:: with SMTP id v124mr8418177oig.125.1614974965977; 
 Fri, 05 Mar 2021 12:09:25 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id u19sm795835ote.15.2021.03.05.12.09.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 12:09:25 -0800 (PST)
Received: (nullmailer pid 567755 invoked by uid 1000);
 Fri, 05 Mar 2021 20:09:23 -0000
Date: Fri, 5 Mar 2021 14:09:23 -0600
From: Rob Herring <robh@kernel.org>
To: Daniel Mack <daniel@zonque.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: add bindings for
 newhaven,1.8-128160EF
Message-ID: <20210305200923.GA566941@robh.at.kernel.org>
References: <20210212095336.635701-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210212095336.635701-1-daniel@zonque.org>
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
Cc: airlied@linux.ie, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 12, 2021 at 10:53:35AM +0100, Daniel Mack wrote:
> This adds documentation for a new ILI9163 based, SPI connected display.
> 
> Signed-off-by: Daniel Mack <daniel@zonque.org>
> ---
>  .../bindings/display/ilitek,ili9163.txt       | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/ilitek,ili9163.txt

Bindings are in schema format now.

> 
> diff --git a/Documentation/devicetree/bindings/display/ilitek,ili9163.txt b/Documentation/devicetree/bindings/display/ilitek,ili9163.txt
> new file mode 100644
> index 0000000000000..fee119991c14e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/ilitek,ili9163.txt
> @@ -0,0 +1,27 @@
> +Ilitek ILI9163 display panels
> +
> +This binding is for display panels using an Ilitek ILI9163 controller in SPI
> +mode.
> +
> +Required properties:
> +- compatible:	"newhaven,1.8-128160EF", "ilitek,ili9163"
> +- dc-gpios:	D/C pin
> +- reset-gpios:	Reset pin
> +
> +The node for this driver must be a child node of a SPI controller, hence
> +all mandatory properties described in ../spi/spi-bus.txt must be specified.
> +
> +Optional properties:
> +- rotation:	panel rotation in degrees counter clockwise (0,90,180,270)
> +- backlight:	phandle of the backlight device attached to the panel
> +
> +Example:
> +	display@0{
> +		compatible = "newhaven,1.8-128160EF", "ilitek,ili9163"
> +		reg = <0>;
> +		spi-max-frequency = <32000000>;
> +		dc-gpios = <&gpio0 9 GPIO_ACTIVE_HIGH>;
> +		reset-gpios = <&gpio0 8 GPIO_ACTIVE_HIGH>;
> +		rotation = <270>;
> +		backlight = <&backlight>;
> +	};
> -- 
> 2.29.2
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
