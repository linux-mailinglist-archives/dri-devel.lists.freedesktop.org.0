Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 554A758878C
	for <lists+dri-devel@lfdr.de>; Wed,  3 Aug 2022 08:46:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C51210E8D3;
	Wed,  3 Aug 2022 06:45:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC6F10F414
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Aug 2022 06:45:48 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2736jLws025983;
 Wed, 3 Aug 2022 01:45:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1659509121;
 bh=sMxR/cYnNHSziJ4eordm1fdKL/wVbLQvEtLnAAMD3TM=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=ElcX/qb+qbCyyq7oxpgBJd2lUqwFf76O/q+JDjIjLiV1mTZQ9SGtOsNVz5EAokBOh
 3mVOKFUbHPFwpEGX6gkRAcAvZu7MoZJElDm43o70rke16vV7y2Pnmggu4qDgLFWTsJ
 sX8lnbxqKWcnS02MuTVfEdh1PXhHdM5Qy0LmAdhI=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2736jKH4019604
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 3 Aug 2022 01:45:20 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 3
 Aug 2022 01:45:20 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 3 Aug 2022 01:45:20 -0500
Received: from [172.24.157.172] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2736jC96087125;
 Wed, 3 Aug 2022 01:45:13 -0500
Message-ID: <a010d333-70b1-bc58-ddf8-d3fa911a6852@ti.com>
Date: Wed, 3 Aug 2022 12:15:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.3
Subject: Re: [PATCH v3 4/4] drm/panel: simple: add bus-format support for
 panel-dpi
Content-Language: en-US
To: Max Krummenacher <max.oss.09@gmail.com>, <max.krummenacher@toradex.com>
References: <20220628181838.2031-1-max.oss.09@gmail.com>
 <20220628181838.2031-5-max.oss.09@gmail.com>
From: Aradhya Bhatia <a-bhatia1@ti.com>
In-Reply-To: <20220628181838.2031-5-max.oss.09@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Marek Vasut <marex@denx.de>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 28-Jun-22 23:48, Max Krummenacher wrote:
> From: Max Krummenacher <max.krummenacher@toradex.com>
> 
> Evaluate the device tree bus-format property to set bus_format for
> a 'panel-dpi' panel. Additionally infer the bpc value from the
> given bus-format.
> 
> Valid values for bus-format are found in:
> <include/dt-bindings/display/dt-media-bus-format.h>
> 
> This completes the addition of panel-dpi to completely specify
> a panel-simple panel from the device tree.
> 
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> 
> ---
> 
> Changes in v3:
> - Moved the bus-format property under the port/endpoint node as
>    suggested by Rob Herring
> 
> Changes in v2:
> - Fix errors found by dt_binding_check
> 
>   drivers/gpu/drm/panel/panel-simple.c | 49 ++++++++++++++++++++++++++++
>   1 file changed, 49 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 4a2e580a2f7b..f1a457f1069e 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -21,9 +21,11 @@
>    * DEALINGS IN THE SOFTWARE.
>    */
>   
> +#include <dt-bindings/display/dt-media-bus-format.h>
>   #include <linux/delay.h>
>   #include <linux/gpio/consumer.h>
>   #include <linux/module.h>
> +#include <linux/of_graph.h>
>   #include <linux/of_platform.h>
>   #include <linux/platform_device.h>
>   #include <linux/pm_runtime.h>
> @@ -449,10 +451,12 @@ static int panel_dpi_probe(struct device *dev,
>   			   struct panel_simple *panel)
>   {
>   	struct display_timing *timing;
> +	struct device_node *endpoint;
>   	const struct device_node *np;
>   	struct panel_desc *desc;
>   	unsigned int bus_flags;
>   	struct videomode vm;
> +	u32 bus_format;
>   	int ret;
>   
>   	np = dev->of_node;
> @@ -477,6 +481,51 @@ static int panel_dpi_probe(struct device *dev,
>   	of_property_read_u32(np, "width-mm", &desc->size.width);
>   	of_property_read_u32(np, "height-mm", &desc->size.height);
>   
> +	endpoint = of_graph_get_endpoint_by_regs(np, -1, -1);
> +	if (endpoint &&
> +	    !of_property_read_u32(endpoint, "bus-format", &bus_format)) {
> +		/* infer bpc from bus-format */
> +		switch (bus_format) {
> +		case DT_MEDIA_BUS_FMT_RGB565_1X16:
> +			desc->bus_format = MEDIA_BUS_FMT_RGB565_1X16;
> +			desc->bpc = 6;
> +			break;
> +		case DT_MEDIA_BUS_FMT_RGB666_1X18:
> +			desc->bus_format = MEDIA_BUS_FMT_RGB666_1X18;
> +			desc->bpc = 6;
> +			break;
> +		case DT_MEDIA_BUS_FMT_RGB666_1X24_CPADHI:
> +			desc->bus_format = MEDIA_BUS_FMT_RGB666_1X24_CPADHI;
> +			desc->bpc = 6;
> +			break;
> +		case DT_MEDIA_BUS_FMT_BGR888_1X24:
> +			desc->bus_format = MEDIA_BUS_FMT_BGR888_1X24;
> +			desc->bpc = 8;
> +			break;
> +		case DT_MEDIA_BUS_FMT_GBR888_1X24:
> +			desc->bus_format = MEDIA_BUS_FMT_GBR888_1X24;
> +			desc->bpc = 8;
> +			break;
> +		case DT_MEDIA_BUS_FMT_RBG888_1X24:
> +			desc->bus_format = MEDIA_BUS_FMT_RBG888_1X24;
> +			desc->bpc = 8;
> +			break;
> +		case DT_MEDIA_BUS_FMT_RGB888_1X24:
> +			desc->bus_format = MEDIA_BUS_FMT_RGB888_1X24;
> +			desc->bpc = 8;
> +			break;
> +		case DT_MEDIA_BUS_FMT_RGB888_1X32_PADHI:
> +			desc->bus_format = MEDIA_BUS_FMT_RGB888_1X32_PADHI;
> +			desc->bpc = 8;
> +			break;
> +		default:
> +			dev_err(dev, "%pOF: unknown bus-format property\n", np);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	of_node_put(endpoint);
> +
>   	/* Extract bus_flags from display_timing */
>   	bus_flags = 0;
>   	vm.flags = timing->flags;

I understand that it is important to add a bus-format property for dumb
dpi-panels, and I agree with the implementation in the patch-set.

However,
I do not yet fully understand Rob's comments on the dt-bindings side of
patch set (patch 1/4) and what consequences it may cause if that remains
unresolved.

Given that the bus-format property gets added, I do not see any concern
with the panel-simple driver patch.


Reviewed-by: Aradhya Bhatia <a-bhatia1@ti.com>


Regards
Aradhya
