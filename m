Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9035F26C287
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 14:10:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AA1C6E9FB;
	Wed, 16 Sep 2020 12:09:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD3336E9FA
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 12:09:53 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id w5so6643308wrp.8
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 05:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+3jvoy/bBV/BNfVwVnfU8KcCZN1nPBtEmgjgdo9EwXk=;
 b=FENeMTOiWrFokQkUzY6vSvMhlCXV7HMJqSDFsMTbLqeNytwJMofYpFGvXfw3GhxJQe
 D9FUrSX8+Brv74I6kUhpyFb/XZioFwNiGTb+QuFgOQkexhfx/xeg364unF1nN8hvk40W
 Hh+h3hsu+pBXFmPF/2PAzcQ04fALpK5XDa9tA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+3jvoy/bBV/BNfVwVnfU8KcCZN1nPBtEmgjgdo9EwXk=;
 b=JrMZ0tNG0uDZvtStLeRuDToC/dI6HOI1m3hClxN3KQa7jV+Gja8EYtbpJPUD/ZL2xS
 rOCmjNTjZw9JC1ACt4rCwmrmReCbHrBsJ92hm7oLq+wN/LjhqWXF1SjZLciDBR8SjrZJ
 nmDCfD9/bt7gIlZPtpqY7FgWlUEx91cuDQHX+O00gq07tASr+2+iwio813OT+DRiEOwU
 x+daFLWW1DF95ZCrGFHfro3yCi6NNsvKGqU5Kg/xyb/mRHIEsBsqNHL8ew+DEC5APegK
 uQN5zjEFfJxssX3kBbxWJHVmlAe5Tzb8OMiIyg04zx8EKdBynOGPSjxERz5NAt55De3D
 IWcA==
X-Gm-Message-State: AOAM532d3E/+uyjzcKyMEums8E7Cgp6nF1BHuzgrTT2RWC4+eVJU8RQw
 ajzPAy0wJuYvs/nOEtmoQBs5bA==
X-Google-Smtp-Source: ABdhPJwcFrpBowFHXDaGWxAmgGA6UC0qLIIbiwK0yYyfwUChHgh/bXrgr93clOHTT0R4i2flV+cOiA==
X-Received: by 2002:a5d:4448:: with SMTP id x8mr28185933wrr.207.1600258192468; 
 Wed, 16 Sep 2020 05:09:52 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n11sm32655611wrx.91.2020.09.16.05.09.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 05:09:51 -0700 (PDT)
Date: Wed, 16 Sep 2020 14:09:48 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 17/21] drm/virtgpu: Set PRIME export function in
 struct drm_gem_object_funcs
Message-ID: <20200916120948.GO438822@phenom.ffwll.local>
References: <20200915145958.19993-1-tzimmermann@suse.de>
 <20200915145958.19993-18-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200915145958.19993-18-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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

On Tue, Sep 15, 2020 at 04:59:54PM +0200, Thomas Zimmermann wrote:
> GEM object functions deprecate several similar callback interfaces in
> struct drm_driver. This patch replaces virtgpu's per-driver PRIME export
> function with a per-object function.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.c    | 1 -
>  drivers/gpu/drm/virtio/virtgpu_object.c | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
> index b039f493bda9..1f8d6ed11d21 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
> @@ -203,7 +203,6 @@ static struct drm_driver driver = {
>  	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
>  	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
>  	.gem_prime_mmap = drm_gem_prime_mmap,
> -	.gem_prime_export = virtgpu_gem_prime_export,
>  	.gem_prime_import = virtgpu_gem_prime_import,
>  	.gem_prime_import_sg_table = virtgpu_gem_prime_import_sg_table,
>  
> diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
> index 842f8b61aa89..4f7d7ea8194c 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_object.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_object.c
> @@ -108,6 +108,7 @@ static const struct drm_gem_object_funcs virtio_gpu_shmem_funcs = {
>  	.close = virtio_gpu_gem_object_close,
>  
>  	.print_info = drm_gem_shmem_print_info,
> +	.export = virtgpu_gem_prime_export,
>  	.pin = drm_gem_shmem_pin,
>  	.unpin = drm_gem_shmem_unpin,
>  	.get_sg_table = drm_gem_shmem_get_sg_table,
> -- 
> 2.28.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
