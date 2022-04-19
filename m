Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4A4506982
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 13:14:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB0FE10F045;
	Tue, 19 Apr 2022 11:14:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id ADAEA10F045
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 11:14:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 457CC106F
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 04:14:24 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0F02F3F73B
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 04:14:23 -0700 (PDT)
Date: Tue, 19 Apr 2022 12:14:14 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Xuezhi Zhang <zhangxuezhi1@coolpad.com>
Subject: Re: [PATCH] drm/malidp: convert sysfs snprintf to sysfs_emit
Message-ID: <Yl6ZhnewbrlUbWuo@e110455-lin.cambridge.arm.com>
References: <20220417132918.135795-1-zhangxuezhi1@coolpad.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220417132918.135795-1-zhangxuezhi1@coolpad.com>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Apr 17, 2022 at 01:29:18PM +0000, Xuezhi Zhang wrote:
> Fix the following coccicheck warning:
> drivers/gpu/drm/arm/malidp_drv.c:658:8-16:
> WARNING: use scnprintf or sprintf
> 
> Signed-off-by: Xuezhi Zhang <zhangxuezhi1@coolpad.com>

Acked-by: Liviu Dudau <liviu.dudau@arm.com>

Thanks for this!

Best regards,
Liviu

> ---
>  drivers/gpu/drm/arm/malidp_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
> index d5aef21426cf..b1ffd5ba27d9 100644
> --- a/drivers/gpu/drm/arm/malidp_drv.c
> +++ b/drivers/gpu/drm/arm/malidp_drv.c
> @@ -655,7 +655,7 @@ static ssize_t core_id_show(struct device *dev, struct device_attribute *attr,
>  	struct drm_device *drm = dev_get_drvdata(dev);
>  	struct malidp_drm *malidp = drm->dev_private;
>  
> -	return snprintf(buf, PAGE_SIZE, "%08x\n", malidp->core_id);
> +	return sysfs_emit(buf, "%08x\n", malidp->core_id);
>  }
>  
>  static DEVICE_ATTR_RO(core_id);
> -- 
> 2.25.1
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
