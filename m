Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C561ADEFA
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 16:07:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F09116EC0B;
	Fri, 17 Apr 2020 14:07:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 863A86EC0B
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 14:07:39 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200417140737euoutp029b682cfbd6fa6edf3e4104f64e2ae920~GoI_4GA1u1552515525euoutp02b
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 14:07:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200417140737euoutp029b682cfbd6fa6edf3e4104f64e2ae920~GoI_4GA1u1552515525euoutp02b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1587132457;
 bh=AA9eWcExNDYAyO3MXfW9No2TG5apeJ8hc2l9WJQxLKY=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=YdhmTjxmWbc9/4i6fotgb6MA6pu4Pjd+zaaXgjZLbRMNzuvC4aYtg0kU/l1Syz28N
 /7kegiNVzsWNlJTdAjqXYZHJDZcXVwWaXvUQIgGf67M5DE/T2BsffUgrucmDDeiBDP
 lQ+Dii7brftXAMbepB2SeVUjENd+CFglImRLLCWo=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200417140737eucas1p1a61434801629abdc5ec9890ce6b8ff40~GoI_yPNn21657716577eucas1p1n;
 Fri, 17 Apr 2020 14:07:37 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 72.CA.60698.928B99E5; Fri, 17
 Apr 2020 15:07:37 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200417140737eucas1p251bdf38e53ce14c3c9c75f7b6fd6340e~GoI_bqh_N2051220512eucas1p2j;
 Fri, 17 Apr 2020 14:07:37 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200417140737eusmtrp1a984395c21cb7f66c5cb47477cbca200~GoI_bIleS2210922109eusmtrp13;
 Fri, 17 Apr 2020 14:07:37 +0000 (GMT)
X-AuditID: cbfec7f5-a0fff7000001ed1a-82-5e99b829b525
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id D6.D0.07950.928B99E5; Fri, 17
 Apr 2020 15:07:37 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200417140737eusmtip21aebf82b855b60431bafe9a255edfdb0~GoI_Lm03u2969929699eusmtip2Y;
 Fri, 17 Apr 2020 14:07:37 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v1 3/5] video: ssd1307fb: Make use of device properties
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <5cb3805e-d4d1-1573-7d2c-1a2de6227d13@samsung.com>
Date: Fri, 17 Apr 2020 16:07:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200324170532.44384-3-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKKsWRmVeSWpSXmKPExsWy7djPc7qaO2bGGWw/rGnR2zSdyeLK1/ds
 Fif6PrBaLFu2ltWBxWPnrLvsHvNOBnrc7z7O5PF5k1wASxSXTUpqTmZZapG+XQJXRlvjJ7aC
 y6oVv3dOZm1g/CnfxcjJISFgIvHu8ETGLkYuDiGBFYwSp143MUM4Xxgl9jW8ZoJwPjNKbDva
 yALT0r3mE1TLckaJ7muf2CGct4wSi08eYgapYhOwkpjYvgqoioNDWMBbovtnEUhYRMBcYt2k
 RWwgNrNAqMSGhvfsIDavgJ3E4ZWrmEBsFgFViRlfL4ItExWIkPj04DArRI2gxMmZT8DinALu
 Enf3HmeFmCMucevJfCYIW15i+9s5YC9ICExml5j8+SMTxNUuEgu/z2WFsIUlXh3fwg5hy0ic
 ntzDAtGwjlHib8cLqO7tjBLLJ/9jg6iylrhz7hcbyDfMApoS63fpg5gSAo4Szz56QJh8Ejfe
 CkLcwCcxadt0Zogwr0RHmxDEDDWJDcs2sMFs7dq5knkCo9IsJJ/NQvLNLCTfzEJYu4CRZRWj
 eGppcW56arFxXmq5XnFibnFpXrpecn7uJkZgYjn97/jXHYz7/iQdYhTgYFTi4TXomRknxJpY
 VlyZe4hRgoNZSYT3oBtQiDclsbIqtSg/vqg0J7X4EKM0B4uSOK/xopexQgLpiSWp2ampBalF
 MFkmDk6pBsZ++zuMcqvfrrrrmFua9ndp/4OaI/pnRWbXJ74SnRF87s3Wmzel2PUd5r0Nb+zt
 0mKeIPbjF/vm1+dfufe9qeQ6/8ol0LaukD1yemq9roncs2Dx7Iu163peT8gQ/fv78/n4Drb/
 xQFNhsZh9tqi99sfdt5/xOh/g/nHjMKPam9uqcRdvPtUMESJpTgj0VCLuag4EQASVafPKAMA
 AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOIsWRmVeSWpSXmKPExsVy+t/xe7qaO2bGGTx7LmjR2zSdyeLK1/ds
 Fif6PrBaLFu2ltWBxWPnrLvsHvNOBnrc7z7O5PF5k1wAS5SeTVF+aUmqQkZ+cYmtUrShhZGe
 oaWFnpGJpZ6hsXmslZGpkr6dTUpqTmZZapG+XYJeRlvjJ7aCy6oVv3dOZm1g/CnfxcjJISFg
 ItG95hNjFyMXh5DAUkaJvqcvmLoYOYASMhLH15dB1AhL/LnWxQZR85pR4ui0pywgCTYBK4mJ
 7asYQeqFBbwlun8WgYRFBMwl1k1axAZiMwuESty/vY4Jovc6o8T0VZcYQRK8AnYSh1euYgKx
 WQRUJWZ8vQg2U1QgQuLwjllQNYISJ2c+AYtzCrhL3N17nBViqLrEn3mXmCFscYlbT+YzQdjy
 EtvfzmGewCg0C0n7LCQts5C0zELSsoCRZRWjSGppcW56brGRXnFibnFpXrpecn7uJkZgJG07
 9nPLDsaud8GHGAU4GJV4eA16ZsYJsSaWFVfmHmKU4GBWEuE96AYU4k1JrKxKLcqPLyrNSS0+
 xGgK9NxEZinR5HxglOeVxBuaGppbWBqaG5sbm1koifN2CByMERJITyxJzU5NLUgtgulj4uCU
 amC04BcU+3fXq6lLvMXIgr/Se4Zs+KmH/z6Hy07cqtTE370hX9rIK971aHmlyHsLRs3pFXan
 YgK+z4n6ukVLKv/fkZ195335ozumvVL9YZXz74Lr2aprT26+bZFr9e2TM1jgetP3zk/tjr8h
 WU6zjyzZpl97pKsvyL76bd7EJ55XN1xSNfpyMU2JpTgj0VCLuag4EQD/TyruugIAAA==
X-CMS-MailID: 20200417140737eucas1p251bdf38e53ce14c3c9c75f7b6fd6340e
X-Msg-Generator: CA
X-RootMTR: 20200324170554eucas1p164794d0c08b18a1d066b2b83957c73a1
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200324170554eucas1p164794d0c08b18a1d066b2b83957c73a1
References: <20200324170532.44384-1-andriy.shevchenko@linux.intel.com>
 <CGME20200324170554eucas1p164794d0c08b18a1d066b2b83957c73a1@eucas1p1.samsung.com>
 <20200324170532.44384-3-andriy.shevchenko@linux.intel.com>
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
Cc: linux-fbdev@vger.kernel.org, xllacyx@gmail.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


[ added dri-devel ML to Cc: ]

On 3/24/20 6:05 PM, Andy Shevchenko wrote:
> Device property API allows to gather device resources from different sources,
> such as ACPI. Convert the drivers to unleash the power of device property API.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch queued for v5.8, thanks.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> ---
>  drivers/video/fbdev/ssd1307fb.c | 40 ++++++++++++++++-----------------
>  1 file changed, 19 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/video/fbdev/ssd1307fb.c b/drivers/video/fbdev/ssd1307fb.c
> index 84dfd7b0f682..7a6a44a0b7a6 100644
> --- a/drivers/video/fbdev/ssd1307fb.c
> +++ b/drivers/video/fbdev/ssd1307fb.c
> @@ -12,8 +12,7 @@
>  #include <linux/i2c.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
> -#include <linux/of_gpio.h>
> +#include <linux/property.h>
>  #include <linux/pwm.h>
>  #include <linux/uaccess.h>
>  #include <linux/regulator/consumer.h>
> @@ -592,7 +591,6 @@ static int ssd1307fb_probe(struct i2c_client *client)
>  	struct backlight_device *bl;
>  	char bl_name[12];
>  	struct fb_info *info;
> -	struct device_node *node = client->dev.of_node;
>  	struct fb_deferred_io *ssd1307fb_defio;
>  	u32 vmem_size;
>  	struct ssd1307fb_par *par;
> @@ -607,7 +605,7 @@ static int ssd1307fb_probe(struct i2c_client *client)
>  	par->info = info;
>  	par->client = client;
>  
> -	par->device_info = of_device_get_match_data(&client->dev);
> +	par->device_info = device_get_match_data(dev);
>  
>  	par->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
>  	if (IS_ERR(par->reset)) {
> @@ -627,44 +625,44 @@ static int ssd1307fb_probe(struct i2c_client *client)
>  		}
>  	}
>  
> -	if (of_property_read_u32(node, "solomon,width", &par->width))
> +	if (device_property_read_u32(dev, "solomon,width", &par->width))
>  		par->width = 96;
>  
> -	if (of_property_read_u32(node, "solomon,height", &par->height))
> +	if (device_property_read_u32(dev, "solomon,height", &par->height))
>  		par->height = 16;
>  
> -	if (of_property_read_u32(node, "solomon,page-offset", &par->page_offset))
> +	if (device_property_read_u32(dev, "solomon,page-offset", &par->page_offset))
>  		par->page_offset = 1;
>  
> -	if (of_property_read_u32(node, "solomon,com-offset", &par->com_offset))
> +	if (device_property_read_u32(dev, "solomon,com-offset", &par->com_offset))
>  		par->com_offset = 0;
>  
> -	if (of_property_read_u32(node, "solomon,prechargep1", &par->prechargep1))
> +	if (device_property_read_u32(dev, "solomon,prechargep1", &par->prechargep1))
>  		par->prechargep1 = 2;
>  
> -	if (of_property_read_u32(node, "solomon,prechargep2", &par->prechargep2))
> +	if (device_property_read_u32(dev, "solomon,prechargep2", &par->prechargep2))
>  		par->prechargep2 = 2;
>  
> -	if (!of_property_read_u8_array(node, "solomon,lookup-table",
> -				       par->lookup_table,
> -				       ARRAY_SIZE(par->lookup_table)))
> +	if (!device_property_read_u8_array(dev, "solomon,lookup-table",
> +					   par->lookup_table,
> +					   ARRAY_SIZE(par->lookup_table)))
>  		par->lookup_table_set = 1;
>  
> -	par->seg_remap = !of_property_read_bool(node, "solomon,segment-no-remap");
> -	par->com_seq = of_property_read_bool(node, "solomon,com-seq");
> -	par->com_lrremap = of_property_read_bool(node, "solomon,com-lrremap");
> -	par->com_invdir = of_property_read_bool(node, "solomon,com-invdir");
> +	par->seg_remap = !device_property_read_bool(dev, "solomon,segment-no-remap");
> +	par->com_seq = device_property_read_bool(dev, "solomon,com-seq");
> +	par->com_lrremap = device_property_read_bool(dev, "solomon,com-lrremap");
> +	par->com_invdir = device_property_read_bool(dev, "solomon,com-invdir");
>  	par->area_color_enable =
> -		of_property_read_bool(node, "solomon,area-color-enable");
> -	par->low_power = of_property_read_bool(node, "solomon,low-power");
> +		device_property_read_bool(dev, "solomon,area-color-enable");
> +	par->low_power = device_property_read_bool(dev, "solomon,low-power");
>  
>  	par->contrast = 127;
>  	par->vcomh = par->device_info->default_vcomh;
>  
>  	/* Setup display timing */
> -	if (of_property_read_u32(node, "solomon,dclk-div", &par->dclk_div))
> +	if (device_property_read_u32(dev, "solomon,dclk-div", &par->dclk_div))
>  		par->dclk_div = par->device_info->default_dclk_div;
> -	if (of_property_read_u32(node, "solomon,dclk-frq", &par->dclk_frq))
> +	if (device_property_read_u32(dev, "solomon,dclk-frq", &par->dclk_frq))
>  		par->dclk_frq = par->device_info->default_dclk_frq;
>  
>  	vmem_size = DIV_ROUND_UP(par->width, 8) * par->height;
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
