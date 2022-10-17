Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB6C6007B1
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 09:26:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C71A10ECBF;
	Mon, 17 Oct 2022 07:26:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 428 seconds by postgrey-1.36 at gabe;
 Mon, 17 Oct 2022 07:26:43 UTC
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D47D410ECBF
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 07:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1665991604; x=1697527604;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=UBuvRDypJT++mgXI7DOwGnJFcpVZ/gzflYCezJdbRdo=;
 b=MnUJ0zu8ANRO7WZAqtID6htIjvJxIY9NX7qvFeiokwIPhan+h5C8hjtR
 wg+KeZXAafKMCkqzjxa45hKG0WRJ4zZAg57+bc/tTS6ObvCMZofTZCuco
 hp8mLE5FZiQHGXbKPmjU+NigtyBVAWm/AhMle72V4y6G3tH75NbucquOB
 rNTFTTKSE+GbS/+oK7QMTID0F0wLGyHiOI9ojVEuMz2CADUKWrOMIcBJH
 KfuS+dKfy7Kq/nU+aM3PnFPHWI2xLyhB9kvfRZ4PqJ//gJ2SY4Z2H7Ilj
 Y6xp98d+h/mSpcwiYJ/0BQhnxTzcQIne8RPACQqyopqCDKNSdtnnuuabe g==;
X-IronPort-AV: E=Sophos;i="5.95,190,1661842800"; d="scan'208";a="182465180"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Oct 2022 00:19:33 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 17 Oct 2022 00:19:33 -0700
Received: from [10.159.245.112] (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Mon, 17 Oct 2022 00:19:26 -0700
Message-ID: <91250148-67b9-d514-6af0-bfcd719fde53@microchip.com>
Date: Mon, 17 Oct 2022 09:19:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] dt-bindings: Remove "status" from schema examples, again
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "Lars-Peter
 Clausen" <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>, Jonathan Cameron
 <jic23@kernel.org>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Nandhini Srikandan <nandhini.srikandan@intel.com>, Rashmi A
 <rashmi.a@intel.com>, Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul
 <vkoul@kernel.org>, Sumit Gupta <sumitg@nvidia.com>, Mikko Perttunen
 <mperttunen@nvidia.com>, Claudiu Beznea <claudiu.beznea@microchip.com>,
 Joakim Zhang <qiangqing.zhang@nxp.com>
References: <20221014205104.2822159-1-robh@kernel.org>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20221014205104.2822159-1-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, linux-iio@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/10/2022 at 22:51, Rob Herring wrote:
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
>   .../arm/tegra/nvidia,tegra-ccplex-cluster.yaml    |  1 -
>   .../display/tegra/nvidia,tegra124-dpaux.yaml      |  1 -
>   .../display/tegra/nvidia,tegra186-display.yaml    |  2 --
>   .../bindings/iio/addac/adi,ad74413r.yaml          |  1 -
>   .../devicetree/bindings/net/cdns,macb.yaml        |  1 -
>   .../devicetree/bindings/net/nxp,dwmac-imx.yaml    |  1 -
>   .../bindings/phy/intel,phy-thunderbay-emmc.yaml   | 15 +++++++--------
>   7 files changed, 7 insertions(+), 15 deletions(-)

[..]

> diff --git a/Documentation/devicetree/bindings/net/cdns,macb.yaml b/Documentation/devicetree/bindings/net/cdns,macb.yaml
> index 318f4efe7f6f..bef5e0f895be 100644
> --- a/Documentation/devicetree/bindings/net/cdns,macb.yaml
> +++ b/Documentation/devicetree/bindings/net/cdns,macb.yaml
> @@ -203,7 +203,6 @@ examples:
>                       power-domains = <&zynqmp_firmware PD_ETH_1>;
>                       resets = <&zynqmp_reset ZYNQMP_RESET_GEM1>;
>                       reset-names = "gem1_rst";
> -                    status = "okay";
>                       phy-mode = "sgmii";
>                       phys = <&psgtr 1 PHY_TYPE_SGMII 1 1>;
>                       fixed-link {


Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
Thanks Rob. Best regards,
   Nicolas

-- 
Nicolas Ferre
