Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4280512E5A9
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2020 12:28:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B27786E0CA;
	Thu,  2 Jan 2020 11:28:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6CCD6E0C8
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2020 11:28:14 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 002BSAKb037148;
 Thu, 2 Jan 2020 05:28:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1577964490;
 bh=pQMnuYBfYCD58YZSxUie6AtdWBn6T0NjGO56pZTzQTA=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=U+C4KPKcUCJvIVOn2IjXKD4HEmJVaIONKxXmlwyMeyHHMsFOXS1vHKfq0Ev0YBUTf
 rFals+cFbN4gbor8aRT73rAMfwxDtLQuKHHKT1xW2a6tze2LYT48V8sRoh2kLX04sN
 GrKkKKiYZSaOG/mY54fWyUAN00xYtmMFHVJVhL5Y=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 002BSAeh051345;
 Thu, 2 Jan 2020 05:28:10 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 2 Jan
 2020 05:28:08 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 2 Jan 2020 05:28:08 -0600
Received: from [10.1.3.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 002BS6B1090483;
 Thu, 2 Jan 2020 05:28:06 -0600
Subject: Re: [PATCH v2] phy: Add DisplayPort configuration options
To: Yuti Amonkar <yamonkar@cadence.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <maxime@cerno.tech>, "ABRAHAM, KISHON
 VIJAY" <kishon@ti.com>
References: <1577108473-29294-1-git-send-email-yamonkar@cadence.com>
From: Jyri Sarha <jsarha@ti.com>
Autocrypt: addr=jsarha@ti.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <471995bd-ed4e-7f51-875e-925d64ca50c9@ti.com>
Date: Thu, 2 Jan 2020 13:28:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1577108473-29294-1-git-send-email-yamonkar@cadence.com>
Content-Language: en-GB
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
Cc: praneeth@ti.com, mparab@cadence.com, tomi.valkeinen@ti.com,
 sjakhade@cadence.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/12/2019 15:41, Yuti Amonkar wrote:
> Allow DisplayPort PHYs to be configured through the generic
> functions through a custom structure added to the generic union.
> The configuration structure is used for reconfiguration of
> DisplayPort PHYs during link training operation.
> 
> The parameters added here are the ones defined in the DisplayPort
> spec 1.4 which include link rate, number of lanes, voltage swing
> and pre-emphasis.
> 
> Signed-off-by: Yuti Amonkar <yamonkar@cadence.com>

I think we should also add phy mode for DisplayPort in this patch (or
series). e.g. something like this:

------------------------------------------------------------------
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index ba0aab59804f..79f25c8801f7 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -39,7 +39,8 @@ enum phy_mode {
        PHY_MODE_PCIE,
        PHY_MODE_ETHERNET,
        PHY_MODE_MIPI_DPHY,
-       PHY_MODE_SATA
+       PHY_MODE_SATA,
+       PHY_MODE_DISPLAYPORT
 };

 /**
------------------------------------------------------------------

Without it (and an associated phy_ops set_mode() call by the phy client)
the phy driver has no way to know how to interpret the "union
phy_configure_opts" in phy_ops configure() call.

Best regards,
Jyri

> ---
> 
> This patch was a part of [1] series earlier but we think that it needs
> to have a separate attention of the reviewers. Also as both [1] & [2] are
> dependent on this patch, our sincere request to reviewers to have a
> faster review of this patch.
> 
> [1]
> 
> https://lkml.org/lkml/2019/12/11/455
> 
> [2]
> 
> https://patchwork.kernel.org/cover/11271191/
> 
>  include/linux/phy/phy-dp.h | 95 ++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/phy/phy.h    |  4 ++
>  2 files changed, 99 insertions(+)
>  create mode 100644 include/linux/phy/phy-dp.h
> 
> diff --git a/include/linux/phy/phy-dp.h b/include/linux/phy/phy-dp.h
> new file mode 100644
> index 0000000..18cad23
> --- /dev/null
> +++ b/include/linux/phy/phy-dp.h
> @@ -0,0 +1,95 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2019 Cadence Design Systems Inc.
> + */
> +
> +#ifndef __PHY_DP_H_
> +#define __PHY_DP_H_
> +
> +#include <linux/types.h>
> +
> +/**
> + * struct phy_configure_opts_dp - DisplayPort PHY configuration set
> + *
> + * This structure is used to represent the configuration state of a
> + * DisplayPort phy.
> + */
> +struct phy_configure_opts_dp {
> +	/**
> +	 * @link_rate:
> +	 *
> +	 * Link Rate, in Mb/s, of the main link.
> +	 *
> +	 * Allowed values: 1620, 2160, 2430, 2700, 3240, 4320, 5400, 8100 Mb/s
> +	 */
> +	unsigned int link_rate;
> +
> +	/**
> +	 * @lanes:
> +	 *
> +	 * Number of active, consecutive, data lanes, starting from
> +	 * lane 0, used for the transmissions on main link.
> +	 *
> +	 * Allowed values: 1, 2, 4
> +	 */
> +	unsigned int lanes;
> +
> +	/**
> +	 * @voltage:
> +	 *
> +	 * Voltage swing levels, as specified by DisplayPort specification,
> +	 * to be used by particular lanes. One value per lane.
> +	 * voltage[0] is for lane 0, voltage[1] is for lane 1, etc.
> +	 *
> +	 * Maximum value: 3
> +	 */
> +	unsigned int voltage[4];
> +
> +	/**
> +	 * @pre:
> +	 *
> +	 * Pre-emphasis levels, as specified by DisplayPort specification, to be
> +	 * used by particular lanes. One value per lane.
> +	 *
> +	 * Maximum value: 3
> +	 */
> +	unsigned int pre[4];
> +
> +	/**
> +	 * @ssc:
> +	 *
> +	 * Flag indicating, whether or not to enable spread-spectrum clocking.
> +	 *
> +	 */
> +	u8 ssc : 1;
> +
> +	/**
> +	 * @set_rate:
> +	 *
> +	 * Flag indicating, whether or not reconfigure link rate and SSC to
> +	 * requested values.
> +	 *
> +	 */
> +	u8 set_rate : 1;
> +
> +	/**
> +	 * @set_lanes:
> +	 *
> +	 * Flag indicating, whether or not reconfigure lane count to
> +	 * requested value.
> +	 *
> +	 */
> +	u8 set_lanes : 1;
> +
> +	/**
> +	 * @set_voltages:
> +	 *
> +	 * Flag indicating, whether or not reconfigure voltage swing
> +	 * and pre-emphasis to requested values. Only lanes specified
> +	 * by "lanes" parameter will be affected.
> +	 *
> +	 */
> +	u8 set_voltages : 1;
> +};
> +
> +#endif /* __PHY_DP_H_ */
> diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
> index 15032f14..ba0aab5 100644
> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -16,6 +16,7 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/regulator/consumer.h>
>  
> +#include <linux/phy/phy-dp.h>
>  #include <linux/phy/phy-mipi-dphy.h>
>  
>  struct phy;
> @@ -46,9 +47,12 @@ enum phy_mode {
>   *
>   * @mipi_dphy:	Configuration set applicable for phys supporting
>   *		the MIPI_DPHY phy mode.
> + * @dp:		Configuration set applicable for phys supporting
> + *		the DisplayPort protocol.
>   */
>  union phy_configure_opts {
>  	struct phy_configure_opts_mipi_dphy	mipi_dphy;
> +	struct phy_configure_opts_dp		dp;
>  };
>  
>  /**
> 


-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
