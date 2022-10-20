Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8216062DF
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 16:21:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F65E10F225;
	Thu, 20 Oct 2022 14:21:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11F6B10EF1D
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 14:21:12 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id
 br15-20020a056830390f00b0061c9d73b8bdso11489173otb.6
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 07:21:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DRmvj/Qw7m4kPQR3vXMSaW6JmzIt/vfRx5j71ATZMPo=;
 b=1Y7Z9qTvzP21ltCwYbBSlh/wGMFlpFQR6yR6MLCyVDAxozwldp7cKe159IuI60DNUv
 U7FRJjU4PWS/+dWIER9GpoYI2XxN44OJA6U2BOnByyfn28gUAC5FFn/SmDpfia0kbYbM
 xCa5mGYeeYZ0l0fW+iWZhzBxThRdkRWhKXHTfxF2LAnJkv9+SPViHWvebHHRczwPPmAo
 shCSe6hqq4nONPtHIuiHQHq2cQjjLGnQHqhmvv3iHZ2LS/zwyz+7E0xRaPZ1YxL9WRpI
 2Vd5d5dl5EnvfOWEyfc1pqk2SiyVOgrw4YUepH++VuUVsAJXrde0v9ERte+D8vqKMS9L
 /t3g==
X-Gm-Message-State: ACrzQf3WLc5YdvXeo+efxeM3gyFcQtIqLPN99ShATFeV+G4CLpRpKVqb
 CqBZgVb7icwLV2OkuXsy6Q==
X-Google-Smtp-Source: AMsMyM6kgMpF5YggwgwsLirXF7Rn0lq5eGb6xz4yME8rs2ScP7Fq/R5S22HP4elC/sSX+ifGN97D+g==
X-Received: by 2002:a05:6830:2a0d:b0:656:bd3f:253f with SMTP id
 y13-20020a0568302a0d00b00656bd3f253fmr7105548otu.25.1666275671070; 
 Thu, 20 Oct 2022 07:21:11 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 z15-20020a4ade4f000000b004767c273d3csm7559774oot.5.2022.10.20.07.21.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 07:21:10 -0700 (PDT)
Received: (nullmailer pid 1261301 invoked by uid 1000);
 Thu, 20 Oct 2022 14:21:10 -0000
Date: Thu, 20 Oct 2022 09:21:10 -0500
From: Rob Herring <robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Remove "status" from schema examples, again
Message-ID: <166627566746.1261189.15059225154291335125.robh@kernel.org>
References: <20221014205104.2822159-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221014205104.2822159-1-robh@kernel.org>
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
Cc: linux-iio@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>, Eric Dumazet <edumazet@google.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-phy@lists.infradead.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Joakim Zhang <qiangqing.zhang@nxp.com>, Rashmi A <rashmi.a@intel.com>,
 NXP Linux Team <linux-imx@nxp.com>, Jakub Kicinski <kuba@kernel.org>,
 Sumit Gupta <sumitg@nvidia.com>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Nandhini Srikandan <nandhini.srikandan@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Vinod Koul <vkoul@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 14 Oct 2022 15:51:04 -0500, Rob Herring wrote:
> There's no reason to have "status" properties in examples. "okay" is the
> default, and "disabled" turns off some schema checks ('required'
> specifically).
> 
> A meta-schema check for this is pending, so hopefully the last time to
> fix these.
> 
> Fix the indentation in intel,phy-thunderbay-emmc while we're here.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../arm/tegra/nvidia,tegra-ccplex-cluster.yaml    |  1 -
>  .../display/tegra/nvidia,tegra124-dpaux.yaml      |  1 -
>  .../display/tegra/nvidia,tegra186-display.yaml    |  2 --
>  .../bindings/iio/addac/adi,ad74413r.yaml          |  1 -
>  .../devicetree/bindings/net/cdns,macb.yaml        |  1 -
>  .../devicetree/bindings/net/nxp,dwmac-imx.yaml    |  1 -
>  .../bindings/phy/intel,phy-thunderbay-emmc.yaml   | 15 +++++++--------
>  7 files changed, 7 insertions(+), 15 deletions(-)
> 

Applied, thanks!
