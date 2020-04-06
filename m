Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 114301A08FD
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 10:10:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D23B56E59D;
	Tue,  7 Apr 2020 08:09:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Mon, 06 Apr 2020 14:21:06 UTC
Received: from esa5.microchip.iphmx.com (esa5.microchip.iphmx.com
 [216.71.150.166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 625716E3DA
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 14:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1586182867; x=1617718867;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=VxBfFZSMnzPlZNHz2TtxxRNY5T+Ta8nxtKmyydIYbJ8=;
 b=kpwhmJyl7sV6VflAL49oclFE+F6xi4jbMEwcgxogjCkOUkVvpNz87EXN
 urUMaGP7LqHocGCFdvwo4URzUa0lOmhyAHH61+XhZjo4Jr/rE/5lDTi5s
 JllmSkIcjdbPo52j3Y0BR2ePM36xv4bAIsXMdJEYwLCZZNs6BOyhtvss/
 fVfaR7xuv/peMaIVty+WE4/1VY8JX1IaeEvGBLzxzx5vONKFD0t86gA2u
 CrZUWbqI1ejDYsUK869QDFwkz1V5/LX0jOToP198hEhhtojPHDstzRwMq
 La1w1Jp2/eAUrMyRGLBwEvwUxli+9C67wxCsa8oPRaOfZOgHNzVtCw5sG w==;
IronPort-SDR: 3dhHBhElSxHQC59mGMY0HVh7OBNkgad/SlfGf8LOeUnqPpr8jm+FFOjg8EX/1MI5BisywgXgYc
 pdPi4XsnSPa3UOej5f/VB5P14Sv9FOvnpQ6byLPegzF5YxnjLX3CwErHzBFsaCBJk1PRz6kL03
 l4Kgs29BkGfq6w4xZ+OapMJJDSJHi1IFkVcvlpIEymygXGyUROheYBIq8bgUuu4pNxuXib6TRp
 9AF9NC1IutFhGz1I5nyb0CDM41BulqXLEWvVxc6Jg/cDzE82ULYI7cOdKTuwQHC7swyYNfoTZd
 Ejc=
X-IronPort-AV: E=Sophos;i="5.72,351,1580799600"; d="scan'208";a="71546329"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 06 Apr 2020 07:13:59 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 6 Apr 2020 07:13:57 -0700
Received: from [10.205.29.84] (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Mon, 6 Apr 2020 07:14:05 -0700
Subject: Re: [PATCH] video: fbdev: don't print error message on
 platform_get_irq() failure
To: Tang Bin <tangbin@cmss.chinamobile.com>, <b.zolnierkie@samsung.com>,
 <alexandre.belloni@bootlin.com>, <ludovic.desroches@microchip.com>,
 <linux-fbdev@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
References: <20200406053450.8380-1-tangbin@cmss.chinamobile.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
Message-ID: <d6c8f07c-a57e-45ef-429a-d627ba7d7ce0@microchip.com>
Date: Mon, 6 Apr 2020 16:13:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200406053450.8380-1-tangbin@cmss.chinamobile.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 07 Apr 2020 08:09:32 +0000
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
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/04/2020 at 07:34, Tang Bin wrote:
> The platform_get_irq() can print error message,so remove the redundant
> dev_err() here.
> 
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> ---
>   drivers/video/fbdev/atmel_lcdfb.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/atmel_lcdfb.c b/drivers/video/fbdev/atmel_lcdfb.c
> index d567f5d56..1e2521925 100644
> --- a/drivers/video/fbdev/atmel_lcdfb.c
> +++ b/drivers/video/fbdev/atmel_lcdfb.c
> @@ -1114,7 +1114,6 @@ static int __init atmel_lcdfb_probe(struct platform_device *pdev)
> 
>          sinfo->irq_base = platform_get_irq(pdev, 0);
>          if (sinfo->irq_base < 0) {
> -               dev_err(dev, "unable to get irq\n");
>                  ret = sinfo->irq_base;
>                  goto stop_clk;
>          }
> --
> 2.20.1.windows.1
> 
> 
> 


-- 
Nicolas Ferre
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
