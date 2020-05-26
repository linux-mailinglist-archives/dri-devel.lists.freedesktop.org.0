Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D97B51E2336
	for <lists+dri-devel@lfdr.de>; Tue, 26 May 2020 15:42:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01C276E1CD;
	Tue, 26 May 2020 13:42:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1160 seconds by postgrey-1.36 at gabe;
 Tue, 26 May 2020 13:42:40 UTC
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F40256E1CD
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 13:42:40 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04QDHsIC023863; Tue, 26 May 2020 15:22:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=wQm2v0Z5VAQgV4xTo2zwfCmgV90iJzta4mQKFeoOBcE=;
 b=IuvCEUoT2isjEnlFiBuOp+ENWrK5REcb2viDxPg1CkUV/9OylPvwjza0XQvPK69H0Ptr
 kq3/2QvM4INWlK0y1F9GxBeUwmquz+5lz5HeF9xCHFhqeJDEQJzI77qtwu5t6wJjyFsD
 fQiK81ZpXfC5QEzBSVQWnYQUp+wIX5hkrXKtFeosLtvU3+iRfOj71yIkMznsdHKPIlyD
 H2O24f8B1/cNkQsByCVV8sw5rrp5O3zeGRHrhWXa5ui7i51ilD9C841TFYMcQUQAHdGi
 Tz1xN8X/+ubyIvg1tPJWEKh2t3N5NPgTsvTNvfw0Eb/zrmzd5dCIJ/NxSu4ppcdXu0X0 6w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 316sa1yxsc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 May 2020 15:22:24 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AE2AB10002A;
 Tue, 26 May 2020 15:22:19 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5C9042AEF26;
 Tue, 26 May 2020 15:22:19 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 26 May
 2020 15:22:19 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 26 May 2020 15:22:18 +0200
From: Philippe CORNU <philippe.cornu@st.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "abrodkin@synopsys.com"
 <abrodkin@synopsys.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "james.qian.wang@arm.com"
 <james.qian.wang@arm.com>, "liviu.dudau@arm.com" <liviu.dudau@arm.com>,
 "mihail.atanassov@arm.com" <mihail.atanassov@arm.com>,
 "brian.starkey@arm.com" <brian.starkey@arm.com>, "joel@jms.id.au"
 <joel@jms.id.au>, "andrew@aj.id.au" <andrew@aj.id.au>, "sam@ravnborg.org"
 <sam@ravnborg.org>, "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
 "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "stefan@agner.ch"
 <stefan@agner.ch>, "alison.wang@nxp.com" <alison.wang@nxp.com>,
 "xinliang.liu@linaro.org" <xinliang.liu@linaro.org>,
 "zourongrong@gmail.com" <zourongrong@gmail.com>,
 "john.stultz@linaro.org" <john.stultz@linaro.org>,
 "kong.kongxinwei@hisilicon.com" <kong.kongxinwei@hisilicon.com>,
 "puck.chen@hisilicon.com" <puck.chen@hisilicon.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de"
 <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>, "paul@crapouillou.net"
 <paul@crapouillou.net>, "linus.walleij@linaro.org"
 <linus.walleij@linaro.org>, "narmstrong@baylibre.com"
 <narmstrong@baylibre.com>, "khilman@baylibre.com" <khilman@baylibre.com>,
 "marex@denx.de" <marex@denx.de>, "laurent.pinchart@ideasonboard.com"
 <laurent.pinchart@ideasonboard.com>,
 "kieran.bingham+renesas@ideasonboard.com"
 <kieran.bingham+renesas@ideasonboard.com>, "benjamin.gaignard@linaro.org"
 <benjamin.gaignard@linaro.org>, Vincent ABRIOU <vincent.abriou@st.com>,
 Yannick FERTRE <yannick.fertre@st.com>, "mcoquelin.stm32@gmail.com"
 <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>,
 "wens@csie.org" <wens@csie.org>, "jsarha@ti.com" <jsarha@ti.com>,
 "tomi.valkeinen@ti.com" <tomi.valkeinen@ti.com>, "noralf@tronnes.org"
 <noralf@tronnes.org>
Subject: Re: [PATCH 17/21] drm/stm: Use GEM CMA object functions
Thread-Topic: [PATCH 17/21] drm/stm: Use GEM CMA object functions
Thread-Index: AQHWMEBP24K9tztXlE2wkAB9PsURFKi6P1KA
Date: Tue, 26 May 2020 13:22:18 +0000
Message-ID: <ee29b996-77ec-9ada-2e96-090399dc5383@st.com>
References: <20200522135246.10134-1-tzimmermann@suse.de>
 <20200522135246.10134-18-tzimmermann@suse.de>
In-Reply-To: <20200522135246.10134-18-tzimmermann@suse.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-ID: <93ED9A11ABEFE040B87BC6B2D4A9B569@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-05-26_02:2020-05-26,
 2020-05-26 signatures=0
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
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/22/20 3:52 PM, Thomas Zimmermann wrote:
> The stm driver uses the default implementation for CMA functions; except
> for the .dumb_create callback. The __DRM_GEM_CMA_DRIVER_OPS macro now sets
> these defaults and .dumb_create in struct drm_driver. All remaining
> operations are provided by CMA GEM object functions.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/stm/drv.c | 11 +----------
>   1 file changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/stm/drv.c b/drivers/gpu/drm/stm/drv.c
> index 0f85dd86cafa7..d6238c71fabf6 100644
> --- a/drivers/gpu/drm/stm/drv.c
> +++ b/drivers/gpu/drm/stm/drv.c
> @@ -62,16 +62,7 @@ static struct drm_driver drv_driver = {
>   	.minor = 0,
>   	.patchlevel = 0,
>   	.fops = &drv_driver_fops,
> -	.dumb_create = stm_gem_cma_dumb_create,
> -	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
> -	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
> -	.gem_free_object_unlocked = drm_gem_cma_free_object,
> -	.gem_vm_ops = &drm_gem_cma_vm_ops,
> -	.gem_prime_get_sg_table = drm_gem_cma_prime_get_sg_table,
> -	.gem_prime_import_sg_table = drm_gem_cma_prime_import_sg_table,
> -	.gem_prime_vmap = drm_gem_cma_prime_vmap,
> -	.gem_prime_vunmap = drm_gem_cma_prime_vunmap,
> -	.gem_prime_mmap = drm_gem_cma_prime_mmap,
> +	__DRM_GEM_CMA_DRIVER_OPS(stm_gem_cma_dumb_create),
>   };
>   
>   static int drv_load(struct drm_device *ddev)
> 
Hi Thomas,
Thank you for the patch.
Reviewed-by: Philippe Cornu <philippe.cornu@st.com>
Philippe :-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
