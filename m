Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FF217795B
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 15:42:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 222A56EA7A;
	Tue,  3 Mar 2020 14:42:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FEC36EA7A
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 14:42:43 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id v19so3183207ote.8
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2020 06:42:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ksT/wtaEoqeTN1KHOE8aetE606Rk22N2PLcG6a01LS8=;
 b=U9j9K1k4lxhLMFTMaUKqHIwNQwMgCQX2aHdlrIdK0UfdOH4NX9opFaA2Z3XW7G0QxE
 OqvHwnJB6zOit7ZZJ3pjLNL3fAPmg0dMLRn4Roq6sGVWKPftX/3PzeuDYqH0+SIbrcpW
 qKeP/9QvBlKSQ94U5hOkNYi9yO4lDP6r5EsW8XKDtZSA3g1K4wvDMaZkio/2Ij8SNwBP
 0hGLp4EK2JK8+i9EJQlpxLr4AIm8K3Ikabxqg3Gv3mShu2cfULjO8TeA6M5mzHffeBjq
 Wxh2jFg3ZgDvhTArNYnjiThy7hyLkwAL631ZLzlfQqXn1ixKcXLMRkIewzyruP1VOSjP
 9dYQ==
X-Gm-Message-State: ANhLgQ1mbnjaIvbjD5WXLV+K1r6KWyYsk45UsdDMAx9Gl1B6/y6xuiKC
 GE2/GBEjJj36hdLFBYtXBw==
X-Google-Smtp-Source: ADFU+vtZr4p2NRYC43S+DOX0tBm8RXxT6xe9atzAn2pCgAHYItWK3P3s4o97cZ5EPhX2trhg/h5qWw==
X-Received: by 2002:a05:6830:22ca:: with SMTP id
 q10mr3896085otc.280.1583246562491; 
 Tue, 03 Mar 2020 06:42:42 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t193sm4828281oif.34.2020.03.03.06.42.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2020 06:42:41 -0800 (PST)
Received: (nullmailer pid 8497 invoked by uid 1000);
 Tue, 03 Mar 2020 14:42:40 -0000
Date: Tue, 3 Mar 2020 08:42:40 -0600
From: Rob Herring <robh@kernel.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [RFC 1/8] dt-bindings: video: Add jz4780-lcd binding
Message-ID: <20200303144240.GB24762@bogus>
References: <cover.1582744379.git.hns@goldelico.com>
 <d7dd7c52a9f6cb4e31bce69bb6879e46bfba530c.1582744379.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d7dd7c52a9f6cb4e31bce69bb6879e46bfba530c.1582744379.git.hns@goldelico.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Paul Boddie <paul@boddie.org.uk>,
 Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Paul Burton <paulburton@kernel.org>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, linux-gpio@vger.kernel.org,
 Andi Kleen <ak@linux.intel.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 kernel@pyra-handheld.com, letux-kernel@openphoenux.org,
 "Eric W. Biederman" <ebiederm@xmission.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 26, 2020 at 08:12:53PM +0100, H. Nikolaus Schaller wrote:
> From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> 
> Add DT bindings for the LCD controller on the jz4780 SoC
> 
> Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> ---
>  .../bindings/display/ingenic-jz4780-lcd.txt   | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/ingenic-jz4780-lcd.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/ingenic-jz4780-lcd.txt b/Documentation/devicetree/bindings/display/ingenic-jz4780-lcd.txt
> new file mode 100644
> index 000000000000..8512ce3f93df
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/ingenic-jz4780-lcd.txt
> @@ -0,0 +1,39 @@
> +Bindings for Ingenic JZ4780 LCD Controller
> +
> +LCD Controller is the Display Controller for the Ingenic JZ4780 SoC
> +
> +Required properties:
> +- compatible: should be "ingenic,jz4780-lcd"
> +- reg: Should contain the address & size of the LCD controller registers.
> +- interrupts: Should specify the interrupt provided by parent.
> +- clocks: Should contain two clock specifiers for the JZ4780_CLK_TVE JZ4780_CLK_LCD0PIXCLK.
> +- clock-names : Must be "lcd_clk", "lcd_pixclk";
> +- port: A port node with endpoint definitions as defined in
> +  Documentation/devicetree/bindings/media/video-interfaces.txt.
> +
> +Optional properties:
> +- interrupt-parent: phandle to parent interrupt controller

Drop this. 'interrupt-parent' is always valid and could be in a parent 
node.

> +
> +Example:
> +
> +lcd: jz4780-lcdk@0x13050000 {

Drop the '0x'.

> +	compatible = "ingenic,jz4780-lcd";
> +	reg = <0x13050000 0x1800>;
> +
> +	clocks = <&cgu JZ4780_CLK_TVE>, <&cgu JZ4780_CLK_LCD0PIXCLK>;
> +	clock-names = "lcd_clk", "lcd_pixclk";
> +
> +	interrupt-parent = <&intc>;
> +	interrupts = <31>;
> +
> +	jz4780_lcd_out: port {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			jz4780_out_hdmi: endpoint@0 {
> +				reg = <0>;

Don't need an address as there's only 1 endpoint.

> +				remote-endpoint = <&hdmi_in_lcd>;
> +			};
> +		};
> +
> +};
> -- 
> 2.23.0
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
