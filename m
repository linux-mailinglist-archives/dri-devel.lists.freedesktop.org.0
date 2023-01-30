Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2064F680DB9
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 13:32:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30C3710E231;
	Mon, 30 Jan 2023 12:32:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 74CA910E0EA
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 12:32:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 007B41758
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 04:33:09 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B789A3F71E
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 04:32:26 -0800 (PST)
Date: Mon, 30 Jan 2023 12:32:22 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Deepak R Varma <drv@mailo.com>
Subject: Re: [PATCH] drm/arm/malidp: use sysfs_emit in show function callback
Message-ID: <Y9e41kG1tcQX6L10@e110455-lin.cambridge.arm.com>
References: <Y9Q5Tt8c9WBDxeyV@ubun2204.myguest.virtualbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y9Q5Tt8c9WBDxeyV@ubun2204.myguest.virtualbox.org>
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
Cc: Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 Saurabh Singh Sengar <ssengar@microsoft.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jan 28, 2023 at 02:21:26AM +0530, Deepak R Varma wrote:
> According to Documentation/filesystems/sysfs.rst, the show() callback
> function of kobject attributes should strictly use sysfs_emit() instead
> of sprintf() family functions.
> Issue identified using the device_attr_show.cocci Coccinelle script.
> 
> Signed-off-by: Deepak R Varma <drv@mailo.com>

Acked-by: Liviu Dudau <liviu.dudau@arm.com>

I will push the change into drm-misc-next by the end of the week.

Best regards,
Liviu

> ---
>  drivers/gpu/drm/arm/malidp_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
> index 589c1c66a6dc..cf040e2e9efe 100644
> --- a/drivers/gpu/drm/arm/malidp_drv.c
> +++ b/drivers/gpu/drm/arm/malidp_drv.c
> @@ -649,7 +649,7 @@ static ssize_t core_id_show(struct device *dev, struct device_attribute *attr,
>  	struct drm_device *drm = dev_get_drvdata(dev);
>  	struct malidp_drm *malidp = drm_to_malidp(drm);
>  
> -	return snprintf(buf, PAGE_SIZE, "%08x\n", malidp->core_id);
> +	return sysfs_emit(buf, "%08x\n", malidp->core_id);
>  }
>  
>  static DEVICE_ATTR_RO(core_id);
> -- 
> 2.34.1
> 
> 
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
