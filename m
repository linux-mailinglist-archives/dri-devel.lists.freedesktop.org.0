Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B558A26C210
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 13:24:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ABCE6E9A9;
	Wed, 16 Sep 2020 11:24:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF5726E9A6
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 11:24:29 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id l9so2595982wme.3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 04:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=+a06VRmEudn2VQsC3iRJVsBR9BGJLaW45iWLDadZyRI=;
 b=GUr+B+EIQnykYRecoS9xztPc0/dmBYz0juGXJQ+82bnH0XOFLeyGdR7DXoJWfQI/8v
 uV6cBfGWTv8GfGsnvr2MrJOMoG5UfSEg4lIignk/xv/qBGjiERDGzKpRftrrWz5Mz7Ds
 IxCKmFcqeMxhPaSpSYh1wxMK2TNY4jkQyjW+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=+a06VRmEudn2VQsC3iRJVsBR9BGJLaW45iWLDadZyRI=;
 b=d6n1BGOqHYl6tGxKEfVZrugiFPHpelhgl7rkPtbQjwBFoltTiXwQy5bOq3wO8exwY8
 7O3WZFDsdyAV5jVMWWpHvC1VgtDhwVffjYWZwaufK+KcR5oKtBFkhWxvfJcN9Et4JEPQ
 uZOiwyz0Th/5qoo95kmygJqZDTYfEgjsMeeq75IfDBc8oRh3OfHtteQ3WEiaU/Ux6rh+
 NfghGXPV0iZFqXBGH8sXh4SvpxdwVvucya+gqmt0bZNf70VpRGyHfYrntLS90V/Gvw1q
 g9QX1WOWSazma6OT+Z9nKXDU4DZiFFyXAUeL1SgNZw66SbhxriZzCwRI74K1APEDBguS
 gbUg==
X-Gm-Message-State: AOAM530+Hj+cRibs0IbVOaTLd2WG/6NF8xgl5jYzP1BIFSENrIPIENLN
 bR1UyBqMA0cn2v9q5iCJ8ek2Zw==
X-Google-Smtp-Source: ABdhPJz4UqL+lwqUdWSoHFY6s7qCiJkilQoTwwhfF2waks/JDm6PnP2Zfkj6hPwcgWm/ZWJDyyjL3w==
X-Received: by 2002:a7b:c24a:: with SMTP id b10mr3984516wmj.149.1600255468515; 
 Wed, 16 Sep 2020 04:24:28 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h76sm5509546wme.10.2020.09.16.04.24.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 04:24:27 -0700 (PDT)
Date: Wed, 16 Sep 2020 13:24:24 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 04/21] drm/exynos: Introduce GEM object functions
Message-ID: <20200916112424.GH438822@phenom.ffwll.local>
References: <20200915145958.19993-1-tzimmermann@suse.de>
 <20200915145958.19993-5-tzimmermann@suse.de>
 <20200916100318.GF438822@phenom.ffwll.local>
 <fb1f5992-1642-5751-5672-486b89442e1c@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fb1f5992-1642-5751-5672-486b89442e1c@suse.de>
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
 dri-devel@lists.freedesktop.org, linux@armlinux.org.uk, matthias.bgg@gmail.com,
 thierry.reding@gmail.com, krzk@kernel.org, sam@ravnborg.org,
 emil.velikov@collabora.com, linux-samsung-soc@vger.kernel.org,
 jy0922.shim@samsung.com, oleksandr_andrushchenko@epam.com,
 michal.simek@xilinx.com, miaoqinglang@huawei.com, jonathanh@nvidia.com,
 linux-rockchip@lists.infradead.org, tomi.valkeinen@ti.com, bskeggs@redhat.com,
 xen-devel@lists.xenproject.org, marek.olsak@amd.com, matthew.auld@intel.com,
 chunkuang.hu@kernel.org, andi.shyti@intel.com, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, tianci.yin@amd.com,
 etnaviv@lists.freedesktop.org, hdegoede@redhat.com,
 linux-mediatek@lists.infradead.org, rodrigo.vivi@intel.com,
 linux-tegra@vger.kernel.org, evan.quan@amd.com, sean@poorly.run,
 linux-arm-kernel@lists.infradead.org, tvrtko.ursulin@linux.intel.com,
 amd-gfx@lists.freedesktop.org, chris@chris-wilson.co.uk,
 rodrigosiqueiramelo@gmail.com, hyun.kwon@xilinx.com, aaron.liu@amd.com,
 Felix.Kuehling@amd.com, xinhui.pan@amd.com, sw0312.kim@samsung.com,
 hjc@rock-chips.com, kyungmin.park@samsung.com, nirmoy.das@amd.com,
 kgene@kernel.org, alexander.deucher@amd.com, Hawking.Zhang@amd.com,
 freedreno@lists.freedesktop.org, christian.koenig@amd.com,
 laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 16, 2020 at 12:36:28PM +0200, Thomas Zimmermann wrote:
> Hi
> =

> Am 16.09.20 um 12:03 schrieb Daniel Vetter:
> > On Tue, Sep 15, 2020 at 04:59:41PM +0200, Thomas Zimmermann wrote:
> >> GEM object functions deprecate several similar callback interfaces in
> >> struct drm_driver. This patch replaces the per-driver callbacks with
> >> per-instance callbacks in exynos. The only exception is gem_prime_mmap,
> >> which is non-trivial to convert.
> >>
> >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >> ---
> >>  drivers/gpu/drm/exynos/exynos_drm_drv.c | 10 ----------
> >>  drivers/gpu/drm/exynos/exynos_drm_gem.c | 15 +++++++++++++++
> >>  2 files changed, 15 insertions(+), 10 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm=
/exynos/exynos_drm_drv.c
> >> index dbd80f1e4c78..fe46680ca208 100644
> >> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> >> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> >> @@ -75,11 +75,6 @@ static void exynos_drm_postclose(struct drm_device =
*dev, struct drm_file *file)
> >>  	file->driver_priv =3D NULL;
> >>  }
> >>  =

> >> -static const struct vm_operations_struct exynos_drm_gem_vm_ops =3D {
> >> -	.open =3D drm_gem_vm_open,
> >> -	.close =3D drm_gem_vm_close,
> >> -};
> >> -
> >>  static const struct drm_ioctl_desc exynos_ioctls[] =3D {
> >>  	DRM_IOCTL_DEF_DRV(EXYNOS_GEM_CREATE, exynos_drm_gem_create_ioctl,
> >>  			DRM_RENDER_ALLOW),
> >> @@ -124,16 +119,11 @@ static struct drm_driver exynos_drm_driver =3D {
> >>  	.open			=3D exynos_drm_open,
> >>  	.lastclose		=3D drm_fb_helper_lastclose,
> >>  	.postclose		=3D exynos_drm_postclose,
> >> -	.gem_free_object_unlocked =3D exynos_drm_gem_free_object,
> >> -	.gem_vm_ops		=3D &exynos_drm_gem_vm_ops,
> >>  	.dumb_create		=3D exynos_drm_gem_dumb_create,
> >>  	.prime_handle_to_fd	=3D drm_gem_prime_handle_to_fd,
> >>  	.prime_fd_to_handle	=3D drm_gem_prime_fd_to_handle,
> >>  	.gem_prime_import	=3D exynos_drm_gem_prime_import,
> >> -	.gem_prime_get_sg_table	=3D exynos_drm_gem_prime_get_sg_table,
> >>  	.gem_prime_import_sg_table	=3D exynos_drm_gem_prime_import_sg_table,
> >> -	.gem_prime_vmap		=3D exynos_drm_gem_prime_vmap,
> >> -	.gem_prime_vunmap	=3D exynos_drm_gem_prime_vunmap,
> >>  	.gem_prime_mmap		=3D exynos_drm_gem_prime_mmap,
> >>  	.ioctls			=3D exynos_ioctls,
> >>  	.num_ioctls		=3D ARRAY_SIZE(exynos_ioctls),
> >> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm=
/exynos/exynos_drm_gem.c
> >> index efa476858db5..69a5cf28b4ae 100644
> >> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
> >> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> >> @@ -129,6 +129,19 @@ void exynos_drm_gem_destroy(struct exynos_drm_gem=
 *exynos_gem)
> >>  	kfree(exynos_gem);
> >>  }
> >>  =

> >> +static const struct vm_operations_struct exynos_drm_gem_vm_ops =3D {
> >> +	.open =3D drm_gem_vm_open,
> >> +	.close =3D drm_gem_vm_close,
> >> +};
> > =

> > Hm moving the drm_gem_cma_vm_ops into drm_gem.h or so and maybe calling
> > them drm_gem_simple_ops or so would remove a pile of these. But perhaps=
 a
> > quick follow up series.
> =

> Good idea. Several interfaces use the term 'default' in their name, so
> something like drm_gem_default_vm_ops seems appropriate.

Default sounds like a fine naming choice too.

> BTW is there a reason why we have file operations like
> DEFINE_DRM_GEM_CMA_FOPS() in each module? It seems like this could also
> be provided by the rsp memory-manager library.

It's for the module reference counting of the underlying file. So
file_operations need this.
-Daniel


> =

> Best regards
> Thomas
> =

> > =

> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > =

> >> +
> >> +static const struct drm_gem_object_funcs exynos_drm_gem_object_funcs =
=3D {
> >> +	.free =3D exynos_drm_gem_free_object,
> >> +	.get_sg_table =3D exynos_drm_gem_prime_get_sg_table,
> >> +	.vmap =3D exynos_drm_gem_prime_vmap,
> >> +	.vunmap	=3D exynos_drm_gem_prime_vunmap,
> >> +	.vm_ops =3D &exynos_drm_gem_vm_ops,
> >> +};
> >> +
> >>  static struct exynos_drm_gem *exynos_drm_gem_init(struct drm_device *=
dev,
> >>  						  unsigned long size)
> >>  {
> >> @@ -143,6 +156,8 @@ static struct exynos_drm_gem *exynos_drm_gem_init(=
struct drm_device *dev,
> >>  	exynos_gem->size =3D size;
> >>  	obj =3D &exynos_gem->base;
> >>  =

> >> +	obj->funcs =3D &exynos_drm_gem_object_funcs;
> >> +
> >>  	ret =3D drm_gem_object_init(dev, obj, size);
> >>  	if (ret < 0) {
> >>  		DRM_DEV_ERROR(dev->dev, "failed to initialize gem object\n");
> >> -- =

> >> 2.28.0
> >>
> > =

> =

> -- =

> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> (HRB 36809, AG N=FCrnberg)
> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
> =





-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
