Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C55F7211CE4
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 09:26:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1CD26EA69;
	Thu,  2 Jul 2020 07:24:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E97E66E1F9
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 09:29:47 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0619TV9b129642;
 Wed, 1 Jul 2020 04:29:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1593595771;
 bh=qUyJUjQt0uUssUspq0PshC38HCjt/avZKbIchaC4fbM=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=PyFbXnSvyZdtPXu9KU6It8SJcyptdUVZ72FhqiMeB4nqP+/VGkbUYzuMN9XEoPbUs
 3d6YWFLNzzJjEX4cBu/Oby4emzoke/Fg8UlOydJbLmcXZx5a9ZpU+mS8C+9efc7+VC
 pGjWSxZoXffTId+Cuv2AOAfeeZlgI+rNqAfuItug=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0619TVxf089571
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 1 Jul 2020 04:29:31 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 1 Jul
 2020 04:29:31 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 1 Jul 2020 04:29:31 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0619TLbF100084;
 Wed, 1 Jul 2020 04:29:22 -0500
Subject: Re: [PATCH v6 1/4] driver core: add device probe log helper
To: Andrzej Hajda <a.hajda@samsung.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
References: <20200626100103.18879-1-a.hajda@samsung.com>
 <CGME20200626100109eucas1p25331652d017cd17d21c0ae60541d1f73@eucas1p2.samsung.com>
 <20200626100103.18879-2-a.hajda@samsung.com>
From: Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <5a19df1f-4712-0083-34f0-3cb1be7923e6@ti.com>
Date: Wed, 1 Jul 2020 12:29:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200626100103.18879-2-a.hajda@samsung.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Thu, 02 Jul 2020 07:24:22 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, andy.shevchenko@gmail.com,
 Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 26/06/2020 13:01, Andrzej Hajda wrote:
> During probe every time driver gets resource it should usually check for
> error printk some message if it is not -EPROBE_DEFER and return the error.
> This pattern is simple but requires adding few lines after any resource
> acquisition code, as a result it is often omitted or implemented only
> partially.
> dev_err_probe helps to replace such code sequences with simple call,
> so code:
> 	if (err != -EPROBE_DEFER)
> 		dev_err(dev, ...);
> 	return err;
> becomes:
> 	return probe_err(dev, err, ...);
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>   drivers/base/core.c    | 42 ++++++++++++++++++++++++++++++++++++++++++
>   include/linux/device.h |  3 +++
>   2 files changed, 45 insertions(+)
> 

Basic version of the helper looks very good to me, thank you.
Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>

> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index 67d39a90b45c..3a827c82933f 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -3953,6 +3953,48 @@ define_dev_printk_level(_dev_info, KERN_INFO);
>   
>   #endif
>   
> +/**
> + * dev_err_probe - probe error check and log helper
> + * @dev: the pointer to the struct device
> + * @err: error value to test
> + * @fmt: printf-style format string
> + * @...: arguments as specified in the format string
> + *
> + * This helper implements common pattern present in probe functions for error
> + * checking: print debug or error message depending if the error value is
> + * -EPROBE_DEFER and propagate error upwards.
> + * It replaces code sequence:
> + * 	if (err != -EPROBE_DEFER)
> + * 		dev_err(dev, ...);
> + * 	else
> + * 		dev_dbg(dev, ...);
> + * 	return err;
> + * with
> + * 	return dev_err_probe(dev, err, ...);
> + *
> + * Returns @err.
> + *
> + */
> +int dev_err_probe(const struct device *dev, int err, const char *fmt, ...)
> +{
> +	struct va_format vaf;
> +	va_list args;
> +
> +	va_start(args, fmt);
> +	vaf.fmt = fmt;
> +	vaf.va = &args;
> +
> +	if (err != -EPROBE_DEFER)
> +		dev_err(dev, "error %d: %pV", err, &vaf);
> +	else
> +		dev_dbg(dev, "error %d: %pV", err, &vaf);
> +
> +	va_end(args);
> +
> +	return err;
> +}
> +EXPORT_SYMBOL_GPL(dev_err_probe);
> +
>   static inline bool fwnode_is_primary(struct fwnode_handle *fwnode)
>   {
>   	return fwnode && !IS_ERR(fwnode->secondary);
> diff --git a/include/linux/device.h b/include/linux/device.h
> index 15460a5ac024..6b2272ae9af8 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -964,6 +964,9 @@ void device_link_remove(void *consumer, struct device *supplier);
>   void device_links_supplier_sync_state_pause(void);
>   void device_links_supplier_sync_state_resume(void);
>   
> +extern __printf(3, 4)
> +int dev_err_probe(const struct device *dev, int err, const char *fmt, ...);
> +
>   /* Create alias, so I can be autoloaded. */
>   #define MODULE_ALIAS_CHARDEV(major,minor) \
>   	MODULE_ALIAS("char-major-" __stringify(major) "-" __stringify(minor))
> 

-- 
Best regards,
grygorii
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
