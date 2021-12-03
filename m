Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 165D946788C
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 14:38:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AEDF7AD49;
	Fri,  3 Dec 2021 13:38:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 425 seconds by postgrey-1.36 at gabe;
 Fri, 03 Dec 2021 13:37:58 UTC
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 300957AD48
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 13:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1638538679; x=1670074679;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=IVzJ6uRZKJICUulg8tUewqaz2kUK3rrMEjcvHyFkaFA=;
 b=2J9o3xsPd02T24kmpNSvtG7cNcZhFph8hqd+wvVtz/8pAHZpq65CLTiL
 QKovqXw2dFy9tNpkzCSvs15lufdVBEbgFl7uyr9WUs6jluabvJ8UDn+SM
 h8k9MQAM4EuuKtcpZ7lPtzadE/hB/LuoF4Dpgli4inbK/FQeKdM9wOETN
 hztHixgHhL/gnl6h3k2AlVqWlqqIzt0fAJRebqYCC+7EuhjTbmh/JEwO3
 ro4Wc1u4dlzsAo2Hx9g7F5Rmqa6MIvL+vIAy7zYNJiXrRa1+SlMgIpiHC
 3TuuK6AsuKpSm7BcuVNtuHaM4gRhY3H2fJoJ8a65jnsNGJ8mC9p5xLIMX A==;
IronPort-SDR: A1LAoFzyfcnhi0uZIwbn8U+XV2yMea2jYd7ocZ8ThxWpi8kmngxwGaYG0KUHzGyJsyzopkIFs9
 xQ/kBAF1rfHSMYIipVk9BWzrbkgjGQlARx/OdUY1Io+Ct9tfdF7hnf+zemINw+Mydn3B1wT6cX
 Vrjocu1ZWVRQMS1pZ53nCtqPQxcYlAYjEX3bSQ1m84Ytnu8CMvaUUbj+j0hNns1qVxS+KK/JS6
 B3XhZIsGmBkHIVQT/Ztc41SDXV9FFEDgNvk8tiFny0RgZ4uB96zOEMNAlNWeiMRiXvf2Z3osr0
 Oz93s+Kg/pE3iZED4OJ8+mm1
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="145433415"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 Dec 2021 06:30:52 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 3 Dec 2021 06:30:51 -0700
Received: from [10.159.245.112] (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Fri, 3 Dec 2021 06:30:49 -0700
Subject: Re: [PATCH] video: fbdev: atmel_lcdfb: fix an error code in
 atmel_lcdfb_probe()
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <20211203095808.GE2480@kili>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
Message-ID: <b09117ad-40bb-4abb-1f40-c31c5ca5989b@microchip.com>
Date: Fri, 3 Dec 2021 14:30:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211203095808.GE2480@kili>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 kernel-janitors@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/12/2021 at 10:58, Dan Carpenter wrote:
> If "sinfo->config" is not found, then return -ENODEV.  Don't
> return success.
> 
> Fixes: b985172b328a ("video: atmel_lcdfb: add device tree suport")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Looks good to me: thanks Dan!

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Best regards,
   Nicolas

> ---
>   drivers/video/fbdev/atmel_lcdfb.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/video/fbdev/atmel_lcdfb.c b/drivers/video/fbdev/atmel_lcdfb.c
> index 355b6120dc4f..1fc8de4ecbeb 100644
> --- a/drivers/video/fbdev/atmel_lcdfb.c
> +++ b/drivers/video/fbdev/atmel_lcdfb.c
> @@ -1062,15 +1062,16 @@ static int __init atmel_lcdfb_probe(struct platform_device *pdev)
> 
>          INIT_LIST_HEAD(&info->modelist);
> 
> -       if (pdev->dev.of_node) {
> -               ret = atmel_lcdfb_of_init(sinfo);
> -               if (ret)
> -                       goto free_info;
> -       } else {
> +       if (!pdev->dev.of_node) {
>                  dev_err(dev, "cannot get default configuration\n");
>                  goto free_info;
>          }
> 
> +       ret = atmel_lcdfb_of_init(sinfo);
> +       if (ret)
> +               goto free_info;
> +
> +       ret = -ENODEV;
>          if (!sinfo->config)
>                  goto free_info;
> 
> --
> 2.20.1
> 


-- 
Nicolas Ferre
