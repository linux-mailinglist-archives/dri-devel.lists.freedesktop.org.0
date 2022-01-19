Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D4F4949E6
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 09:47:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 167D310E93B;
	Thu, 20 Jan 2022 08:47:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EAD810E2FC
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 10:35:48 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id b13so9332344edn.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 02:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OSDFZdcVmsxc9n5bq5153WrX2NPdR5H36ptL4DF/Ld8=;
 b=YzN3hIDiV3bsIYsBRldtIUseIA+Xg7yiUwxhkQBN4CpuDkGRGuFL7tAwCFTPYxhsRL
 HPHBSnHmlPJjpHnwXFn3XLaO3n9wa1rhK6vn59VsHIzMFUB6Jaq/3jsmguiQSKRchg1F
 Rt8vJSiYrulpQPWwPqPi3M8d7DsPrMLpe1PuuNpPMpczmmAtVSklZu+pQaTuoZw/CFJz
 zmTnBvK6MUoD+sXbx5PZpdbapVrA4zutuPKb+I0hcI1WoSE1tZMwas+pgK6nHJrD6hKt
 eeU6QEdcKx7a9glyGv2v53ut+S9OpX/JqVokRLDZ4YgZwe4DtxLJ2DYjxyR/R4KjvJPB
 tM2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OSDFZdcVmsxc9n5bq5153WrX2NPdR5H36ptL4DF/Ld8=;
 b=G3k+nrolcop6sEunpqAu+RObNYKYxy1orq/4pYFVg6+A65lpXPvWRednOJpuW379sx
 ltMAAADna85Zc9yI/+TrFsdJDuAWjk9MLmJTivM/Jnt8M39JnSScwR4wax3A5EPPTDjm
 4hE37XTBaqGU12BuwZI6uwMWfsqavLp96EK1KG+tfBcY4E6KgTL4yeZsUTFLD0weRmT/
 v6D9oFQpq8zNddvJfLeqhxZgkrs3wiDjbzh/NSD5KwdRguXrj0BfvLOWI6WPM686mD2P
 rskkfSmlqjRTS53FjM2oRaBG0YHmjzH9/uQtfIsIrepWgc/7HA/o8OIBinSuiBHS5PVX
 y5zw==
X-Gm-Message-State: AOAM530AXu+CPAqbtLu9EOOrsjkOhS6C2ZPGWCYXN73QyYLed1XL0gfM
 J4LXoEpEkjSdoEs/+EphD9M=
X-Google-Smtp-Source: ABdhPJxftTapCLkxAI0MUlBNg1QEZq+09+lN2uAiNmyiN4LnLKb1WAquBvnPN+ndGN2eyHqbgIspAw==
X-Received: by 2002:a05:6402:4310:: with SMTP id
 m16mr13576339edc.344.1642588546591; 
 Wed, 19 Jan 2022 02:35:46 -0800 (PST)
Received: from skbuf ([188.25.255.2])
 by smtp.gmail.com with ESMTPSA id go41sm6349344ejc.200.2022.01.19.02.35.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 02:35:46 -0800 (PST)
Date: Wed, 19 Jan 2022 12:35:42 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Improve phandle-array schemas
Message-ID: <20220119103542.el3yuqds6ihpkthn@skbuf>
References: <20220119015038.2433585-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220119015038.2433585-1-robh@kernel.org>
X-Mailman-Approved-At: Thu, 20 Jan 2022 08:47:25 +0000
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
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-remoteproc@vger.kernel.org,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sre@kernel.org>, linux-ide@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, linux-phy@lists.infradead.org,
 netdev@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Lee Jones <lee.jones@linaro.org>, linux-riscv@lists.infradead.org,
 linux-leds@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Marc Zyngier <maz@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, iommu@lists.linux-foundation.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Jakub Kicinski <kuba@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, linux-usb@vger.kernel.org,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Wolfgang Grandegger <wg@grandegger.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 Kalle Valo <kvalo@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Kevin Hilman <khilman@kernel.org>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 linux-crypto@vger.kernel.org, Viresh Kumar <vireshk@kernel.org>,
 dmaengine@vger.kernel.org, Georgi Djakov <djakov@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Joerg Roedel <joro@8bytes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 18, 2022 at 07:50:38PM -0600, Rob Herring wrote:
> The 'phandle-array' type is a bit ambiguous. It can be either just an
> array of phandles or an array of phandles plus args. Many schemas for
> phandle-array properties aren't clear in the schema which case applies
> though the description usually describes it.
> 
> The array of phandles case boils down to needing:
> 
> items:
>   maxItems: 1
> 
> The phandle plus args cases should typically take this form:
> 
> items:
>   - items:
>       - description: A phandle
>       - description: 1st arg cell
>       - description: 2nd arg cell
> 
> With this change, some examples need updating so that the bracketing of
> property values matches the schema.
> ---
(...)
> diff --git a/Documentation/devicetree/bindings/net/dsa/dsa-port.yaml b/Documentation/devicetree/bindings/net/dsa/dsa-port.yaml
> index 702df848a71d..c504feeec6db 100644
> --- a/Documentation/devicetree/bindings/net/dsa/dsa-port.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/dsa-port.yaml
> @@ -34,6 +34,8 @@ properties:
>        full routing information must be given, not just the one hop
>        routes to neighbouring switches
>      $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      maxItems: 1
>  
>    ethernet:
>      description:

For better or worse, the mainline cases of this property all take the
form of:

arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts
				link = <&switch1port9 &switch2port9>;
				link = <&switch1port10 &switch0port10>;
arch/arm/boot/dts/vf610-zii-dev-rev-b.dts
						link = <&switch1port6
							&switch2port9>;
						link = <&switch1port5
							&switch0port5>;
arch/arm/boot/dts/vf610-zii-scu4-aib.dts
						link = <&switch1port10
							&switch3port10
							&switch2port10>;
						link = <&switch3port10
							&switch2port10>;
						link = <&switch1port9
							&switch0port10>;

So not really an array of phandles.
