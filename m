Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D80526DA39
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 13:31:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A9126EC05;
	Thu, 17 Sep 2020 11:31:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 921926EA78;
 Thu, 17 Sep 2020 11:31:31 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id x23so1614766wmi.3;
 Thu, 17 Sep 2020 04:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QoGoJWGY9uvsPbK1VFldPakdj/95886EaH4XmF5Nmig=;
 b=WT+tCnqscdjnhBzx4pey4qfrs3TpF1Xktu7jt8T8cQSP0yZJdX3KoYHPdWspzIugsq
 6HSKY9VJKgsdLw89cCYxqdbs7Vt7/k4/jK9LtTE+4i9XvfXW1Lr/Fm+fEnngxxWPD5dx
 hAgvu8wEl2ImGMZ/Vxi1axcUTWC/C1hcCZmRCP+VMlQrWSEcu/Hqzj+fuVKA2INfBjX3
 /zcARTJCVi7gGPGSYovxguWtsuZzPwF6TsPs2IH9t/Kp5k3R+t/9fCDbL8cqbYXRyKxo
 iHGdqfCt+o61f/ixQfUMrk5tyRoSS69zCZaqGiTmJsGllEHi/xlz25EYavgN+6zZY8AL
 WM8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QoGoJWGY9uvsPbK1VFldPakdj/95886EaH4XmF5Nmig=;
 b=kRjiOL3I7Vcu8ApmGoondF4fg7fd3dZbHYBb05dB1s2Ld0TSD/JXQXCR5U9MeSgY3x
 W6QOE7RI6XSag6ilt9SAcqZxwzc4T5YpM4iy16UpQoSCaQQnubS4Xlm3tf9k6m2fvupu
 MK4GQ+rlaAJLI5nQUoPiPX7WQ7jc7PDV1lZX18OMW6u/sc+uoyS8MYEhIlw80gzkRVRn
 DydDqMNvfZDD+7VBibsu4eUVlA0BZUZ4uP5wb99R7UmuIqm0m36Wf2YUEhA94pk4wInF
 aUm86eMkQ+jvNg2s9lb12ZprMBF9zqIu48k/QjBa+BhX2bNhR2o56rx2UBZqjWc+nb5F
 vxhw==
X-Gm-Message-State: AOAM5315u/VmMyTs5TiJflOWOxvSt0es3CZzs0regyZaEtOq0exeSrVc
 x59znwu22GHyY8TyokIkCWU=
X-Google-Smtp-Source: ABdhPJyuZcp+AqRLPz3yJIfvdwNUATarIMvgIK7I09VrN4WEXhLqSMqZyvaS1A1ZqiWgJrdIoQA/Hg==
X-Received: by 2002:a1c:96:: with SMTP id 144mr9601334wma.84.1600342290200;
 Thu, 17 Sep 2020 04:31:30 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id 11sm10489240wmi.14.2020.09.17.04.31.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2020 04:31:29 -0700 (PDT)
Date: Thu, 17 Sep 2020 08:31:20 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 18/21] drm/vkms: Introduce GEM object functions
Message-ID: <20200917113120.dtz7yxvdg7xdgbx5@smtp.gmail.com>
References: <20200915145958.19993-1-tzimmermann@suse.de>
 <20200915145958.19993-19-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200915145958.19993-19-tzimmermann@suse.de>
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
Cc: hamohammed.sa@gmail.com, airlied@linux.ie, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, michal.simek@xilinx.com,
 thierry.reding@gmail.com, krzk@kernel.org, sam@ravnborg.org,
 emil.velikov@collabora.com, linux-samsung-soc@vger.kernel.org,
 jy0922.shim@samsung.com, oleksandr_andrushchenko@epam.com,
 tomi.valkeinen@ti.com, linux-tegra@vger.kernel.org, linux@armlinux.org.uk,
 jonathanh@nvidia.com, linux-rockchip@lists.infradead.org, kgene@kernel.org,
 bskeggs@redhat.com, xen-devel@lists.xenproject.org, miaoqinglang@huawei.com,
 intel-gfx@lists.freedesktop.org, matthew.auld@intel.com,
 chunkuang.hu@kernel.org, andi.shyti@intel.com, linux-arm-msm@vger.kernel.org,
 marek.olsak@amd.com, tianci.yin@amd.com, etnaviv@lists.freedesktop.org,
 hdegoede@redhat.com, linux-mediatek@lists.infradead.org,
 rodrigo.vivi@intel.com, matthias.bgg@gmail.com, evan.quan@amd.com,
 sean@poorly.run, linux-arm-kernel@lists.infradead.org,
 tvrtko.ursulin@linux.intel.com, amd-gfx@lists.freedesktop.org,
 laurent.pinchart@ideasonboard.com, hyun.kwon@xilinx.com,
 rodrigosiqueiramelo@gmail.com, aaron.liu@amd.com, Felix.Kuehling@amd.com,
 xinhui.pan@amd.com, sw0312.kim@samsung.com, hjc@rock-chips.com,
 chris@chris-wilson.co.uk, kyungmin.park@samsung.com, nirmoy.das@amd.com,
 alexander.deucher@amd.com, Hawking.Zhang@amd.com,
 freedreno@lists.freedesktop.org, christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On 09/15, Thomas Zimmermann wrote:
> GEM object functions deprecate several similar callback interfaces in
> struct drm_driver. This patch replaces the per-driver callbacks with
> per-instance callbacks in vkms.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks! Looks fine.

Reviewed-by: Melissa Wen <melissa.srw@gmail.com>

> ---
>  drivers/gpu/drm/vkms/vkms_drv.c |  8 --------
>  drivers/gpu/drm/vkms/vkms_gem.c | 13 +++++++++++++
>  2 files changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index cb0b6230c22c..726801ab44d4 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -51,12 +51,6 @@ static const struct file_operations vkms_driver_fops = {
>  	.release	= drm_release,
>  };
>  
> -static const struct vm_operations_struct vkms_gem_vm_ops = {
> -	.fault = vkms_gem_fault,
> -	.open = drm_gem_vm_open,
> -	.close = drm_gem_vm_close,
> -};
> -
>  static void vkms_release(struct drm_device *dev)
>  {
>  	struct vkms_device *vkms = container_of(dev, struct vkms_device, drm);
> @@ -98,8 +92,6 @@ static struct drm_driver vkms_driver = {
>  	.release		= vkms_release,
>  	.fops			= &vkms_driver_fops,
>  	.dumb_create		= vkms_dumb_create,
> -	.gem_vm_ops		= &vkms_gem_vm_ops,
> -	.gem_free_object_unlocked = vkms_gem_free_object,
>  	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
>  	.gem_prime_import_sg_table = vkms_prime_import_sg_table,
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_gem.c b/drivers/gpu/drm/vkms/vkms_gem.c
> index a017fc59905e..19a0e260a4df 100644
> --- a/drivers/gpu/drm/vkms/vkms_gem.c
> +++ b/drivers/gpu/drm/vkms/vkms_gem.c
> @@ -7,6 +7,17 @@
>  
>  #include "vkms_drv.h"
>  
> +static const struct vm_operations_struct vkms_gem_vm_ops = {
> +	.fault = vkms_gem_fault,
> +	.open = drm_gem_vm_open,
> +	.close = drm_gem_vm_close,
> +};
> +
> +static const struct drm_gem_object_funcs vkms_gem_object_funcs = {
> +	.free = vkms_gem_free_object,
> +	.vm_ops = &vkms_gem_vm_ops,
> +};
> +
>  static struct vkms_gem_object *__vkms_gem_create(struct drm_device *dev,
>  						 u64 size)
>  {
> @@ -17,6 +28,8 @@ static struct vkms_gem_object *__vkms_gem_create(struct drm_device *dev,
>  	if (!obj)
>  		return ERR_PTR(-ENOMEM);
>  
> +	obj->gem.funcs = &vkms_gem_object_funcs;
> +
>  	size = roundup(size, PAGE_SIZE);
>  	ret = drm_gem_object_init(dev, &obj->gem, size);
>  	if (ret) {
> -- 
> 2.28.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
