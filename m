Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D352A177947
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 15:41:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB9576EA80;
	Tue,  3 Mar 2020 14:41:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 418196EA7C
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 14:41:50 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id a22so3165652oid.13
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2020 06:41:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=pBPgC25ubKS5wPAN+uT8vJ9mnR6iCFqlpOC1P57sXK4=;
 b=Nc+oVFCdCex39R+ZwdlR2aa0crmMPlPcQzP/yrueW9Oxa2CcQ2crG4G2VCbSifjlqT
 nUvOnPR87m400INLlL1uQZ1nwklsZfo38E9qN7I/nuWMV2TOrTMLz1QFcCm/TlddUFwj
 2EtGWMZJdoPI/1/fgcphGh4WyFtIAWd6r+MBNGwXtB1VLdWXlFjm/6i3JwhgxJVTvd00
 yI55n7QCRZ6v57akd0K0Oq4ZxHiKAFgXTIA3ozmxOOX0F+KU11alSe27/GOCyy3McvuE
 WssPnAfGql1ktQV7qsavEKc3MbPqfWiE7FPluJPwQDKAa6iEOzw74BbGUTWhgooAqRkT
 MgGA==
X-Gm-Message-State: ANhLgQ3gr9sOd/lsac36OhJSwRk8KNO+HzB/ENVABvlx8DL+tar/BD8m
 V+5Ml0oJIIbjQvxEVQ5w4w==
X-Google-Smtp-Source: ADFU+vv05XHH/grNWOM44+Loiz7eSQ7oRdXeA6SR+r3YHZMxgPfK8MbbrKBZbP66Sthy2ocwKowBzg==
X-Received: by 2002:a54:4006:: with SMTP id x6mr2678057oie.145.1583246449504; 
 Tue, 03 Mar 2020 06:40:49 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id a26sm6034251oid.17.2020.03.03.06.40.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2020 06:40:48 -0800 (PST)
Received: (nullmailer pid 5880 invoked by uid 1000);
 Tue, 03 Mar 2020 14:40:47 -0000
Date: Tue, 3 Mar 2020 08:40:47 -0600
From: Rob Herring <robh@kernel.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [RFC 2/8] dt-bindings: video: Add jz4780-hdmi binding
Message-ID: <20200303144047.GA24762@bogus>
References: <cover.1582744379.git.hns@goldelico.com>
 <2d7202155bae3fa9c7097275d4c9a1ccab569aea.1582744379.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2d7202155bae3fa9c7097275d4c9a1ccab569aea.1582744379.git.hns@goldelico.com>
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

On Wed, Feb 26, 2020 at 08:12:54PM +0100, H. Nikolaus Schaller wrote:
> From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> 
> Add DT bindings for the hdmi driver for the Ingenic JZ4780 SoC.
> 
> Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> ---
>  .../bindings/display/ingenic-jz4780-hdmi.txt  | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.txt b/Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.txt
> new file mode 100644
> index 000000000000..f02e59fbdd5a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.txt
> @@ -0,0 +1,41 @@
> +Device-Tree bindings for Ingenic JZ4780 HDMI Transmitter
> +
> +The HDMI Transmitter in the Ingenic JZ4780 is a Synopsys DesignWare HDMI 1.4
> +TX controller IP with accompanying PHY IP.
> +
> +Required properties:
> + - #address-cells : should be <1>
> + - #size-cells : should be <0>

These aren't in the example.

> + - compatible : should be "ingenic,jz4780-hdmi"
> + - reg-io-width: must be <4>

If it can only be 4, then you can just assume that from the compatible.

> + - clocks: phandle to isrf and iahb clocks
> + - clock-names : must be "isrf" and "iahb"
> + - ports: Port nodes with endpoint definitions as defined in
> +   Documentation/devicetree/bindings/media/video-interfaces.txt,
> +
> +Optional properties:
> + - ddc-i2c-bus: phandle of an I2C controller used for DDC EDID probing

This goes in a connector node. It's not part of the HDMI block.

That also means you need an out port to the connector.

> +
> +example:
> +
> +hdmi: hdmi@10180000 {
> +	compatible = "ingenic,jz4780-hdmi";
> +	reg = <0x10180000 0x8000>;
> +	reg-io-width = <4>;
> +	ddc-i2c-bus = <&i2c4>;
> +	interrupt-parent = <&intc>;
> +	interrupts = <3>;
> +	clocks = <&cgu JZ4780_CLK_HDMI>, <&cgu JZ4780_CLK_AHB0>;
> +	clock-names = "isfr", "iahb";
> +
> +	ports {
> +		hdmi_in: port {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			hdmi_in_lcd: endpoint@0 {
> +				reg = <0>;
> +				remote-endpoint = <&jz4780_out_hdmi>;
> +			};
> +		};
> +	};
> +};
> -- 
> 2.23.0
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
