Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 152626D0433
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 14:00:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C2E10EE01;
	Thu, 30 Mar 2023 12:00:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 409E710EE11
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 12:00:05 +0000 (UTC)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi
 [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 179F76E1;
 Thu, 30 Mar 2023 14:00:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1680177603;
 bh=0uI20oJPIAR4nVBGOBj4ZCiEiH/RWDOkw8ENQEspywo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bsw3qEYixnJOVxUvMlcqBXd/VUl5BBxWnO3LnatTmurV8GCeZUdUlmxFw/c8nUnQw
 fxWFzi+krhiUmPd3yg91gDHJr2A/dyEQ5NMADwJwCrn0qTuc070sIrUJ4KpepMG7PE
 HASy7PJjGcQjIozS/e4lgTNRlL4VNdGHU5rtFxRc=
Message-ID: <71a23ab3-59a9-2215-33a3-0113dbca5812@ideasonboard.com>
Date: Thu, 30 Mar 2023 15:00:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/6] drm/omapdrm: Include <linux/of.h>
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch
References: <20230330083205.12621-1-tzimmermann@suse.de>
 <20230330083205.12621-2-tzimmermann@suse.de>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230330083205.12621-2-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/03/2023 11:32, Thomas Zimmermann wrote:
> Include <linux/of.h> to get the contained declarations. No functional
> changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/omapdrm/omap_drv.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
> index 699ed814e021..fb403b44769c 100644
> --- a/drivers/gpu/drm/omapdrm/omap_drv.c
> +++ b/drivers/gpu/drm/omapdrm/omap_drv.c
> @@ -6,6 +6,7 @@
>   
>   #include <linux/dma-mapping.h>
>   #include <linux/platform_device.h>
> +#include <linux/of.h>
>   #include <linux/sort.h>
>   #include <linux/sys_soc.h>
>   

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

