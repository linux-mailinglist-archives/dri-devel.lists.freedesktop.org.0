Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D51E26A85A
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 17:08:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8A2E6E872;
	Tue, 15 Sep 2020 15:08:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68F646E864
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 15:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n0AeAcI3zA0iCIxRdvDpWIpeomoM/Ow+oqCMUrZ8unY=; b=DY/uEfsiICorhg8iHeARjWh0Q
 cS0EKw/YCxVo9c/DRgV77Gc/fMhw80uqdFD1X3NvNbG8E9/gDU7FOr8XhdiWA4oeGiVT2qR18cF2G
 rbumEdeKR7VfQDXUwezoo+hIbAR+lkT20j5iUe9RiL8DC97jOljbnlxm0stBllgiNwutxUvFMmjf2
 nZaK5hytHWAtFXkuU5EYx2JOLZTIRELbYZ15UAAlaZBs+E+zoYjszb6y0j79bc+LUZ0g2Qxuu6Zcq
 d7bL2K6UkYMroIM/nP+yxcofUcKz/TRZ/3IX2smVFTWH7UaXEb6h6XVwsj25JE3FRBD4+grwHrZEJ
 9t8rye/uQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34006)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1kICYn-00035d-N0; Tue, 15 Sep 2020 16:07:57 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1kICYY-0003lk-6C; Tue, 15 Sep 2020 16:07:42 +0100
Date: Tue, 15 Sep 2020 16:07:42 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 02/21] drm/armada: Introduce GEM object functions
Message-ID: <20200915150742.GO1551@shell.armlinux.org.uk>
References: <20200915145958.19993-1-tzimmermann@suse.de>
 <20200915145958.19993-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200915145958.19993-3-tzimmermann@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 tomi.valkeinen@ti.com, linux-tegra@vger.kernel.org, jonathanh@nvidia.com,
 linux-rockchip@lists.infradead.org, kgene@kernel.org, bskeggs@redhat.com,
 xen-devel@lists.xenproject.org, miaoqinglang@huawei.com,
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

On Tue, Sep 15, 2020 at 04:59:39PM +0200, Thomas Zimmermann wrote:
> GEM object functions deprecate several similar callback interfaces in
> struct drm_driver. This patch replaces the per-driver callbacks with
> per-instance callbacks in armada.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Russell King <rmk+kernel@armlinux.org.uk>

Thanks.

> ---
>  drivers/gpu/drm/armada/armada_drv.c |  3 ---
>  drivers/gpu/drm/armada/armada_gem.c | 12 +++++++++++-
>  drivers/gpu/drm/armada/armada_gem.h |  2 --
>  3 files changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/armada/armada_drv.c b/drivers/gpu/drm/armada/armada_drv.c
> index 980d3f1f8f16..22247cfce80b 100644
> --- a/drivers/gpu/drm/armada/armada_drv.c
> +++ b/drivers/gpu/drm/armada/armada_drv.c
> @@ -37,13 +37,10 @@ DEFINE_DRM_GEM_FOPS(armada_drm_fops);
>  
>  static struct drm_driver armada_drm_driver = {
>  	.lastclose		= drm_fb_helper_lastclose,
> -	.gem_free_object_unlocked = armada_gem_free_object,
>  	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd,
>  	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
> -	.gem_prime_export	= armada_gem_prime_export,
>  	.gem_prime_import	= armada_gem_prime_import,
>  	.dumb_create		= armada_gem_dumb_create,
> -	.gem_vm_ops		= &armada_gem_vm_ops,
>  	.major			= 1,
>  	.minor			= 0,
>  	.name			= "armada-drm",
> diff --git a/drivers/gpu/drm/armada/armada_gem.c b/drivers/gpu/drm/armada/armada_gem.c
> index ecf8a55e93d9..c343fbefe47c 100644
> --- a/drivers/gpu/drm/armada/armada_gem.c
> +++ b/drivers/gpu/drm/armada/armada_gem.c
> @@ -25,7 +25,7 @@ static vm_fault_t armada_gem_vm_fault(struct vm_fault *vmf)
>  	return vmf_insert_pfn(vmf->vma, vmf->address, pfn);
>  }
>  
> -const struct vm_operations_struct armada_gem_vm_ops = {
> +static const struct vm_operations_struct armada_gem_vm_ops = {
>  	.fault	= armada_gem_vm_fault,
>  	.open	= drm_gem_vm_open,
>  	.close	= drm_gem_vm_close,
> @@ -184,6 +184,12 @@ armada_gem_map_object(struct drm_device *dev, struct armada_gem_object *dobj)
>  	return dobj->addr;
>  }
>  
> +static const struct drm_gem_object_funcs armada_gem_object_funcs = {
> +	.free = armada_gem_free_object,
> +	.export = armada_gem_prime_export,
> +	.vm_ops = &armada_gem_vm_ops,
> +};
> +
>  struct armada_gem_object *
>  armada_gem_alloc_private_object(struct drm_device *dev, size_t size)
>  {
> @@ -195,6 +201,8 @@ armada_gem_alloc_private_object(struct drm_device *dev, size_t size)
>  	if (!obj)
>  		return NULL;
>  
> +	obj->obj.funcs = &armada_gem_object_funcs;
> +
>  	drm_gem_private_object_init(dev, &obj->obj, size);
>  
>  	DRM_DEBUG_DRIVER("alloc private obj %p size %zu\n", obj, size);
> @@ -214,6 +222,8 @@ static struct armada_gem_object *armada_gem_alloc_object(struct drm_device *dev,
>  	if (!obj)
>  		return NULL;
>  
> +	obj->obj.funcs = &armada_gem_object_funcs;
> +
>  	if (drm_gem_object_init(dev, &obj->obj, size)) {
>  		kfree(obj);
>  		return NULL;
> diff --git a/drivers/gpu/drm/armada/armada_gem.h b/drivers/gpu/drm/armada/armada_gem.h
> index de04cc2c8f0e..ffcc7e8dd351 100644
> --- a/drivers/gpu/drm/armada/armada_gem.h
> +++ b/drivers/gpu/drm/armada/armada_gem.h
> @@ -21,8 +21,6 @@ struct armada_gem_object {
>  	void			*update_data;
>  };
>  
> -extern const struct vm_operations_struct armada_gem_vm_ops;
> -
>  #define drm_to_armada_gem(o) container_of(o, struct armada_gem_object, obj)
>  
>  void armada_gem_free_object(struct drm_gem_object *);
> -- 
> 2.28.0
> 
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
