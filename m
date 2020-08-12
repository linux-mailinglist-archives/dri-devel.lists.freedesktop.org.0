Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F915242A64
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 15:32:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2DA76E0F5;
	Wed, 12 Aug 2020 13:32:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39CAA6E0F5
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 13:32:42 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07CDWdwU007324;
 Wed, 12 Aug 2020 08:32:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1597239159;
 bh=w+rICkNSuSrsehMcmh+na0UUIZJP8TffZUjfvuB/BM4=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=FIMJ+kulKNpTYm+ZwB6dBqp3kUkozGkAQLH0rUWKaBEUsm6lH5GN2/ya2JGluleHR
 InlSKiLXYEBR+yH1K1/jj6KZBvG3som89CR+5NeXh4+LHoXxZM9KJ69cduAdTEfs+p
 vY7uE5e0DqOJd4tGCvQR4u+vUk8JX44yb8/U4NKA=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07CDWd3J097204;
 Wed, 12 Aug 2020 08:32:39 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 12
 Aug 2020 08:32:38 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 12 Aug 2020 08:32:38 -0500
Received: from [10.1.3.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07CDWbBg079679;
 Wed, 12 Aug 2020 08:32:37 -0500
Subject: Re: [PATCH] drm/tidss: implement WA for AM65xx erratum i2000
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, <dri-devel@lists.freedesktop.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jan Kiszka
 <jan.kiszka@siemens.com>
References: <20200812112625.59897-1-tomi.valkeinen@ti.com>
From: Jyri Sarha <jsarha@ti.com>
Autocrypt: addr=jsarha@ti.com; prefer-encrypt=mutual; keydata=
 xsFNBFbdWt8BEADnCIkQrHIvAmuDcDzp1h2pO9s22nacEffl0ZyzIS//ruiwjMfSnuzhhB33
 fNEWzMjm7eqoUBi1BUAQIReS6won0cXIEXFg9nDYQ3wNTPyh+VRjBvlb/gRJlf4MQnJDTGDP
 S5i63HxYtOfjPMSsUSu8NvhbzayNkN5YKspJDu1cK5toRtyUn1bMzUSKDHfwpdmuCDgXZSj2
 t+z+c6u7yx99/j4m9t0SVlaMt00p1vJJ3HJ2Pkm3IImWvtIfvCmxnOsK8hmwgNQY6PYK1Idk
 puSRjMIGLqjZo071Z6dyDe08zv6DWL1fMoOYbAk/H4elYBaqEsdhUlDCJxZURcheQUnOMYXo
 /kg+7TP6RqjcyXoGgqjfkqlf3hYKmyNMq0FaYmUAfeqCWGOOy3PPxR/IiACezs8mMya1XcIK
 Hk/5JAGuwsqT80bvDFAB2XfnF+fNIie/n5SUHHejJBxngb9lFE90BsSfdcVwzNJ9gVf/TOJc
 qJEHuUx0WPi0taO7hw9+jXV8KTHp6CQPmDSikEIlW7/tJmVDBXQx8n4RMUk4VzjE9Y/m9kHE
 UVJ0bJYzMqECMTAP6KgzgkQCD7n8OzswC18PrK69ByGFpcm664uCAa8YiMuX92MnesKMiYPQ
 z1rvR5riXZdplziIRjFRX+68fvhPverrvjNVmzz0bAFwfVjBsQARAQABzRpKeXJpIFNhcmhh
 IDxqc2FyaGFAdGkuY29tPsLBeAQTAQIAIgUCVt1a3wIbAwYLCQgHAwIGFQgCCQoLBBYCAwEC
 HgECF4AACgkQkDazUNfWGUEVVhAAmFL/21tUhZECrDrP9FWuAUuDvg+1CgrrqBj7ZxKtMaiz
 qTcZwZdggp8bKlFaNrmsyrBsuPlAk99f7ToxufqbV5l/lAT3DdIkjb4nwN4rJkxqSU3PaUnh
 mDMKIAp6bo1N9L+h82LE6CjI89W4ydQp5i+cOeD/kbdxbHHvxgNwrv5x4gg1JvEQLVnUSHva
 R2kx7u2rlnq7OOyh9vU0MUq7U5enNNqdBjjBTeaOwa5xb3S2Cc9dR10mpFiy+jSSkuFOjPpc
 fLfr/s03NGqbZ4aXvZCGjCw4jclpTJkuWPKO+Gb+a/3oJ4qpGN9pJ+48n2Tx9MdSrR4aaXHi
 EYMrbYQz9ICJ5V80P5+yCY5PzCvqpkizP6vtKvRSi8itzsglauMZGu6GwGraMJNBgu5u+HIZ
 nfRtJO1AAiwuupOHxe1nH05c0zBJaEP4xJHyeyDsMDh+ThwbGwQmAkrLJZtOd3rTmqlJXnuj
 sfgQlFyC68t1YoMHukz9LHzg02xxBCaLb0KjslfwuDUTPrWtcDL1a5hccksrkHx7k9crVFA1
 o6XWsOPGKRHOGvYyo3TU3CRygXysO41UnGG40Q3B5R8RMwRHV925LOQIwEGF/6Os8MLgFXCb
 Lv3iJtan+PBdqO1Bv3u2fXUMbYgQ3v7jHctB8nHphwSwnHuGN7FAmto+SxzotE3OwU0EVt1a
 3wEQAMHwOgNaIidGN8UqhSJJWDEfF/SPSCrsd3WsJklanbDlUCB3WFP2EB4k03JroIRvs7/V
 VMyITLQvPoKgaECbDS5U20r/Po/tmaAOEgC7m1VaWJUUEXhjYQIw7t/tSdWlo5XxZIcO4LwO
 Kf0S4BPrQux6hDLIFL8RkDH/8lKKc44ZnSLoF1gyjc5PUt6iwgGJRRkOD8gGxCv1RcUsu1xU
 U9lHBxdWdPmMwyXiyui1Vx7VJJyD55mqc7+qGrpDHG9yh3pUm2IWp7jVt/qw9+OE9dVwwhP9
 GV2RmBpDmB3oSFpk7lNvLJ11VPixl+9PpmRlozMBO00wA1W017EpDHgOm8XGkq++3wsFNOmx
 6p631T2WuIthdCSlZ2kY32nGITWn4d8L9plgb4HnDX6smrMTy1VHVYX9vsHXzbqffDszQrHS
 wFo5ygKhbGNXO15Ses1r7Cs/XAZk3PkFsL78eDBHbQd+MveApRB7IyfffIz7pW1R1ZmCrmAg
 Bn36AkDXJTgUwWqGyJMd+5GHEOg1UPjR5Koxa4zFhj1jp1Fybn1t4N11cmEmWh0aGgI/zsty
 g/qtGRnFEywBbzyrDEoV4ZJy2Q5pnZohVhpbhsyETeYKQrRnMk/dIPWg6AJx38Cl4P9PK1JX
 8VK661BG8GXsXJ3uZbPSu6K0+FiJy09N4IW7CPJNABEBAAHCwV8EGAECAAkFAlbdWt8CGwwA
 CgkQkDazUNfWGUFOfRAA5K/z9DXVEl2kkuMuIWkgtuuLQ7ZwqgxGP3dMA5z3Iv/N+VNRGbaw
 oxf+ZkTbJHEE/dWclj1TDtpET/t6BJNLaldLtJ1PborQH+0jTmGbsquemKPgaHeSU8vYLCdc
 GV/Rz+3FN0/fRdmoq2+bIHght4T6KZJ6jsrnBhm7y6gzjMOiftH6M5GXPjU0/FsU09qsk/af
 jbwLETaea0mlWMrLd9FC2KfVITA/f/YG2gqtUUF9WlizidyctWJqSTZn08MdzaoPItIkRUTv
 6Bv6rmFn0daWkHt23BLd0ZP7e7pON1rqNVljWjWQ/b/E/SzeETrehgiyDr8pP+CLlC+vSQxi
 XtjhWjt1ItFLXxb4/HLZbb/L4gYX7zbZ3NwkON6Ifn3VU7UwqxGLmKfUwu/mFV+DXif1cKSS
 v6vWkVQ6Go9jPsSMFxMXPA5317sZZk/v18TAkIiwFqda3/SSjwc3e8Y76/DwPvUQd36lEbva
 uBrUXDDhCoiZnjQaNz/J+o9iYjuMTpY1Wp+igjIretYr9+kLvGsoPo/kTPWyiuh/WiFU2d6J
 PMCGFGhodTS5qmQA6IOuazek1qSZIl475u3E2uG98AEX/kRhSzgpsbvADPEUPaz75uvlmOCX
 tv+Sye9QT4Z1QCh3lV/Zh4GlY5lt4MwYnqFCxroK/1LpkLgdyQ4rRVw=
Message-ID: <50383e04-41ef-acd2-8d65-5b3e8349329d@ti.com>
Date: Wed, 12 Aug 2020 16:32:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200812112625.59897-1-tomi.valkeinen@ti.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/08/2020 14:26, Tomi Valkeinen wrote:
> This patch implements WA for AM65xx erratum i2000, which causes YUV
> formats to show wrong colors.
> 
> An earlier patch removed a partial WA:
> 
> a8d9d7da1546349f18eb2d6b6b3a04bdeb38719d ("drm/tidss: remove AM65x PG1 YUV erratum code")
> 
> The patch explains the reasoning for removal. The change in plans has
> been that it has become clear that there are and will be users for PG1
> SoCs and as such it's good to implement the WA for PG1s.
> 
> This patch adds the WA back so that it is only used on SR1.0 (which is
> the new name for PG1). The previous WA code didn't check the SoC
> revision, which this patch does.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Jyri Sarha <jsarha@ti.com>

> ---
>  drivers/gpu/drm/tidss/tidss_dispc.c | 32 +++++++++++++++++++++++++----
>  drivers/gpu/drm/tidss/tidss_dispc.h |  4 ++++
>  2 files changed, 32 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
> index 629dd06393f6..a3e8caf319bb 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
> @@ -19,6 +19,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
> +#include <linux/sys_soc.h>
>  
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_fb_cma_helper.h>
> @@ -302,6 +303,8 @@ struct dispc_device {
>  	u32 num_fourccs;
>  
>  	u32 memory_bandwidth_limit;
> +
> +	struct dispc_errata errata;
>  };
>  
>  static void dispc_write(struct dispc_device *dispc, u16 reg, u32 val)
> @@ -2641,6 +2644,19 @@ static int dispc_init_am65x_oldi_io_ctrl(struct device *dev,
>  	return 0;
>  }
>  
> +static void dispc_init_errata(struct dispc_device *dispc)
> +{
> +	static const struct soc_device_attribute am65x_sr10_soc_devices[] = {
> +		{ .family = "AM65X", .revision = "SR1.0" },
> +		{ /* sentinel */ }
> +	};
> +
> +	if (soc_device_match(am65x_sr10_soc_devices)) {
> +		dispc->errata.i2000 = true;
> +		dev_info(dispc->dev, "WA for erratum i2000: YUV formats disabled\n");
> +	}
> +}
> +
>  int dispc_init(struct tidss_device *tidss)
>  {
>  	struct device *dev = tidss->dev;
> @@ -2664,19 +2680,27 @@ int dispc_init(struct tidss_device *tidss)
>  	if (!dispc)
>  		return -ENOMEM;
>  
> +	dispc->tidss = tidss;
> +	dispc->dev = dev;
> +	dispc->feat = feat;
> +
> +	dispc_init_errata(dispc);
> +
>  	dispc->fourccs = devm_kcalloc(dev, ARRAY_SIZE(dispc_color_formats),
>  				      sizeof(*dispc->fourccs), GFP_KERNEL);
>  	if (!dispc->fourccs)
>  		return -ENOMEM;
>  
>  	num_fourccs = 0;
> -	for (i = 0; i < ARRAY_SIZE(dispc_color_formats); ++i)
> +	for (i = 0; i < ARRAY_SIZE(dispc_color_formats); ++i) {
> +		if (dispc->errata.i2000 &&
> +		    dispc_fourcc_is_yuv(dispc_color_formats[i].fourcc)) {
> +			continue;
> +		}
>  		dispc->fourccs[num_fourccs++] = dispc_color_formats[i].fourcc;
> +	}
>  
>  	dispc->num_fourccs = num_fourccs;
> -	dispc->tidss = tidss;
> -	dispc->dev = dev;
> -	dispc->feat = feat;
>  
>  	dispc_common_regmap = dispc->feat->common_regs;
>  
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.h b/drivers/gpu/drm/tidss/tidss_dispc.h
> index 902e612ff7ac..353972fe658a 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.h
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.h
> @@ -46,6 +46,10 @@ struct dispc_features_scaling {
>  	u32 xinc_max;
>  };
>  
> +struct dispc_errata {
> +	bool i2000; /* DSS Does Not Support YUV Pixel Data Formats */
> +};
> +
>  enum dispc_vp_bus_type {
>  	DISPC_VP_DPI,		/* DPI output */
>  	DISPC_VP_OLDI,		/* OLDI (LVDS) output */
> 


-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
