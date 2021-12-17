Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E32478C55
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 14:30:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5EE910FB4F;
	Fri, 17 Dec 2021 13:30:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 995D310FB5E
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 13:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
 In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vDy/h/0IhDpG31/AHmcO9oajllR8KeNpEmxogpr82bE=; b=zP3lDawS9GQKm7r2TbZtiC/xvn
 QuC2H7RI0Nn9Tzfqeaa6b4Sfz5r333CB0bPLcqj4yowfp2IbEabWUezuybyeiHXzTgmc5KfA714ET
 bA9zH0VExtR8i+e1PWACv/lyqsVTGhVXalfOFPghNeBS2bgwiE+G7Q4iQfV8c5UWuFDJdpRI9xLIZ
 M3KTvgcjiaqbc5QrFEnBZfWD85DgqAD79SF3CGcoOhomNUkDKwcVswyAKKzszaQg1pFU8ucAyz+WJ
 0K6v2r4JV4JHSa6+D/KuqsYK7En0l3+THQgMRpxP963wuHkOLP2p7ldZEqkshywZQportfoz5z2N+
 TsL6O9Vg==;
Received: from webng-gw.kapsi.fi ([91.232.154.200] helo=roundcube.kapsi.fi)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <jyri.sarha@iki.fi>)
 id 1myDJE-00011F-Ux; Fri, 17 Dec 2021 15:30:04 +0200
MIME-Version: 1.0
Date: Fri, 17 Dec 2021 15:30:02 +0200
From: Jyri Sarha <jyri.sarha@iki.fi>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v2 36/37] drm/tilcdc: Add support for the nomodeset kernel
 parameter
In-Reply-To: <20211217003752.3946210-37-javierm@redhat.com>
References: <20211217003752.3946210-1-javierm@redhat.com>
 <20211217003752.3946210-37-javierm@redhat.com>
Message-ID: <0e12f51baaf76b9863b4ab11fdb86af6@iki.fi>
X-Sender: jyri.sarha@iki.fi
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 91.232.154.200
X-SA-Exim-Mail-From: jyri.sarha@iki.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: Tomi Valkeinen <tomba@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-12-17 2:37, Javier Martinez Canillas wrote:
> According to disable Documentation/admin-guide/kernel-parameters.txt, 
> this
> parameter can be used to disable kernel modesetting.
> 
> DRM drivers will not perform display-mode changes or accelerated 
> rendering
> and only the system framebuffer will be available if it was set-up.
> 
> But only a few DRM drivers currently check for nomodeset, make this 
> driver
> to also support the command line parameter.
> 
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

Acked-by: Jyri Sarha <jyri.sarha@iki.fi>

> ---
> 
> (no changes since v1)
> 
>  drivers/gpu/drm/tilcdc/tilcdc_drv.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> index cc567c87057d..eee3c447fbac 100644
> --- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> @@ -604,6 +604,9 @@ static struct platform_driver 
> tilcdc_platform_driver = {
> 
>  static int __init tilcdc_drm_init(void)
>  {
> +	if (drm_firmware_drivers_only())
> +		return -ENODEV;
> +
>  	DBG("init");
>  	tilcdc_panel_init();
>  	return platform_driver_register(&tilcdc_platform_driver);
