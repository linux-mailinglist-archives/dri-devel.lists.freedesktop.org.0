Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 586EE5669A0
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 13:34:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ACC31128C1;
	Tue,  5 Jul 2022 11:30:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AD2910E04C;
 Tue,  5 Jul 2022 08:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657011281; x=1688547281;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=g6BONoqwyYFdwqpfxorfSG9kCiHa2zfaJ8YHwkSPYwk=;
 b=ZAniFgKWVO4jgf5tqEJ6kaJVBkYqopb2ECGdkGF1m2k7agW91w+XVNlu
 JkTCfsy2dk4rDuqKvhb1OFBR7X8v6Wc8MjrBqeQN+1b7SxCFTmQjp+vL/
 GR2Kw9wTB3ykAudUAfmdTPPLuws0KecqoDD2EVTxY7x+c+Rg4hOWmxhpj
 Qu266mZtO3vXuOSbEUmg8G+ddwpsPtaDe3QY4oUsgw4GxfMPqf33qw/uT
 Wkan/ZGQK9AFQTKDqLdeph7WwJHl7IKCLZ5Q9vFjITfjG28XIH2ImZOn1
 gpU6htoSatGQo+AsJi1bnP4MvSW01/Hyzxf3wzyU1mjstEqJqsIqiV3B4 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10398"; a="263087650"
X-IronPort-AV: E=Sophos;i="5.92,245,1650956400"; 
 d="asc'?scan'208";a="263087650"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2022 01:54:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,245,1650956400"; 
 d="asc'?scan'208";a="597217894"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.159.108])
 by fmsmga007.fm.intel.com with ESMTP; 05 Jul 2022 01:54:30 -0700
Date: Tue, 5 Jul 2022 16:31:18 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v3 1/2] vfio: Replace the DMA unmapping notifier with a
 callback
Message-ID: <20220705083118.GY1089@zhen-hp.sh.intel.com>
References: <0-v3-7593f297c43f+56ce-vfio_unmap_notif_jgg@nvidia.com>
 <1-v3-7593f297c43f+56ce-vfio_unmap_notif_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="XzWDHICoUFRd33PB"
Content-Disposition: inline
In-Reply-To: <1-v3-7593f297c43f+56ce-vfio_unmap_notif_jgg@nvidia.com>
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
Reply-To: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: kvm@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Kevin Tian <kevin.tian@intel.com>, dri-devel@lists.freedesktop.org,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christoph Hellwig <hch@lst.de>,
 linux-s390@vger.kernel.org, Matthew Rosato <mjrosato@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Jason Herne <jjherne@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--XzWDHICoUFRd33PB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2022.07.04 21:59:03 -0300, Jason Gunthorpe wrote:
> Instead of having drivers register the notifier with explicit code just
> have them provide a dma_unmap callback op in their driver ops and rely on
> the core code to wire it up.
>=20
> Suggested-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Reviewed-by: Tony Krowiak <akrowiak@linux.ibm.com>
> Reviewed-by: Eric Farman <farman@linux.ibm.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/gpu/drm/i915/gvt/gvt.h        |   1 -
>  drivers/gpu/drm/i915/gvt/kvmgt.c      |  75 ++++-----------

gvt change looks fine to me.

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

>  drivers/s390/cio/vfio_ccw_ops.c       |  41 ++------
>  drivers/s390/cio/vfio_ccw_private.h   |   2 -
>  drivers/s390/crypto/vfio_ap_ops.c     |  53 ++---------
>  drivers/s390/crypto/vfio_ap_private.h |   3 -
>  drivers/vfio/vfio.c                   | 129 +++++++++-----------------
>  drivers/vfio/vfio.h                   |   3 +
>  include/linux/vfio.h                  |  21 +----
>  9 files changed, 88 insertions(+), 240 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gv=
t.h
> index aee1a45da74bcb..705689e6401197 100644
> --- a/drivers/gpu/drm/i915/gvt/gvt.h
> +++ b/drivers/gpu/drm/i915/gvt/gvt.h
> @@ -226,7 +226,6 @@ struct intel_vgpu {
>  	unsigned long nr_cache_entries;
>  	struct mutex cache_lock;
> =20
> -	struct notifier_block iommu_notifier;
>  	atomic_t released;
> =20
>  	struct kvm_page_track_notifier_node track_node;
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/=
kvmgt.c
> index e2f6c56ab3420c..ecd5bb37b63a2a 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -729,34 +729,25 @@ int intel_gvt_set_edid(struct intel_vgpu *vgpu, int=
 port_num)
>  	return ret;
>  }
> =20
> -static int intel_vgpu_iommu_notifier(struct notifier_block *nb,
> -				     unsigned long action, void *data)
> +static void intel_vgpu_dma_unmap(struct vfio_device *vfio_dev, u64 iova,
> +				 u64 length)
>  {
> -	struct intel_vgpu *vgpu =3D
> -		container_of(nb, struct intel_vgpu, iommu_notifier);
> -
> -	if (action =3D=3D VFIO_IOMMU_NOTIFY_DMA_UNMAP) {
> -		struct vfio_iommu_type1_dma_unmap *unmap =3D data;
> -		struct gvt_dma *entry;
> -		unsigned long iov_pfn, end_iov_pfn;
> +	struct intel_vgpu *vgpu =3D vfio_dev_to_vgpu(vfio_dev);
> +	struct gvt_dma *entry;
> +	u64 iov_pfn =3D iova >> PAGE_SHIFT;
> +	u64 end_iov_pfn =3D iov_pfn + length / PAGE_SIZE;
> =20
> -		iov_pfn =3D unmap->iova >> PAGE_SHIFT;
> -		end_iov_pfn =3D iov_pfn + unmap->size / PAGE_SIZE;
> +	mutex_lock(&vgpu->cache_lock);
> +	for (; iov_pfn < end_iov_pfn; iov_pfn++) {
> +		entry =3D __gvt_cache_find_gfn(vgpu, iov_pfn);
> +		if (!entry)
> +			continue;
> =20
> -		mutex_lock(&vgpu->cache_lock);
> -		for (; iov_pfn < end_iov_pfn; iov_pfn++) {
> -			entry =3D __gvt_cache_find_gfn(vgpu, iov_pfn);
> -			if (!entry)
> -				continue;
> -
> -			gvt_dma_unmap_page(vgpu, entry->gfn, entry->dma_addr,
> -					   entry->size);
> -			__gvt_cache_remove_entry(vgpu, entry);
> -		}
> -		mutex_unlock(&vgpu->cache_lock);
> +		gvt_dma_unmap_page(vgpu, entry->gfn, entry->dma_addr,
> +				   entry->size);
> +		__gvt_cache_remove_entry(vgpu, entry);
>  	}
> -
> -	return NOTIFY_OK;
> +	mutex_unlock(&vgpu->cache_lock);
>  }
> =20
>  static bool __kvmgt_vgpu_exist(struct intel_vgpu *vgpu)
> @@ -783,36 +774,20 @@ static bool __kvmgt_vgpu_exist(struct intel_vgpu *v=
gpu)
>  static int intel_vgpu_open_device(struct vfio_device *vfio_dev)
>  {
>  	struct intel_vgpu *vgpu =3D vfio_dev_to_vgpu(vfio_dev);
> -	unsigned long events;
> -	int ret;
> -
> -	vgpu->iommu_notifier.notifier_call =3D intel_vgpu_iommu_notifier;
> =20
> -	events =3D VFIO_IOMMU_NOTIFY_DMA_UNMAP;
> -	ret =3D vfio_register_notifier(vfio_dev, VFIO_IOMMU_NOTIFY, &events,
> -				     &vgpu->iommu_notifier);
> -	if (ret !=3D 0) {
> -		gvt_vgpu_err("vfio_register_notifier for iommu failed: %d\n",
> -			ret);
> -		goto out;
> -	}
> -
> -	ret =3D -EEXIST;
>  	if (vgpu->attached)
> -		goto undo_iommu;
> +		return -EEXIST;
> =20
> -	ret =3D -ESRCH;
>  	if (!vgpu->vfio_device.kvm ||
>  	    vgpu->vfio_device.kvm->mm !=3D current->mm) {
>  		gvt_vgpu_err("KVM is required to use Intel vGPU\n");
> -		goto undo_iommu;
> +		return -ESRCH;
>  	}
> =20
>  	kvm_get_kvm(vgpu->vfio_device.kvm);
> =20
> -	ret =3D -EEXIST;
>  	if (__kvmgt_vgpu_exist(vgpu))
> -		goto undo_iommu;
> +		return -EEXIST;
> =20
>  	vgpu->attached =3D true;
> =20
> @@ -831,12 +806,6 @@ static int intel_vgpu_open_device(struct vfio_device=
 *vfio_dev)
> =20
>  	atomic_set(&vgpu->released, 0);
>  	return 0;
> -
> -undo_iommu:
> -	vfio_unregister_notifier(vfio_dev, VFIO_IOMMU_NOTIFY,
> -				 &vgpu->iommu_notifier);
> -out:
> -	return ret;
>  }
> =20
>  static void intel_vgpu_release_msi_eventfd_ctx(struct intel_vgpu *vgpu)
> @@ -853,8 +822,6 @@ static void intel_vgpu_release_msi_eventfd_ctx(struct=
 intel_vgpu *vgpu)
>  static void intel_vgpu_close_device(struct vfio_device *vfio_dev)
>  {
>  	struct intel_vgpu *vgpu =3D vfio_dev_to_vgpu(vfio_dev);
> -	struct drm_i915_private *i915 =3D vgpu->gvt->gt->i915;
> -	int ret;
> =20
>  	if (!vgpu->attached)
>  		return;
> @@ -864,11 +831,6 @@ static void intel_vgpu_close_device(struct vfio_devi=
ce *vfio_dev)
> =20
>  	intel_gvt_release_vgpu(vgpu);
> =20
> -	ret =3D vfio_unregister_notifier(&vgpu->vfio_device, VFIO_IOMMU_NOTIFY,
> -				       &vgpu->iommu_notifier);
> -	drm_WARN(&i915->drm, ret,
> -		 "vfio_unregister_notifier for iommu failed: %d\n", ret);
> -
>  	debugfs_remove(debugfs_lookup(KVMGT_DEBUGFS_FILENAME, vgpu->debugfs));
> =20
>  	kvm_page_track_unregister_notifier(vgpu->vfio_device.kvm,
> @@ -1610,6 +1572,7 @@ static const struct vfio_device_ops intel_vgpu_dev_=
ops =3D {
>  	.write		=3D intel_vgpu_write,
>  	.mmap		=3D intel_vgpu_mmap,
>  	.ioctl		=3D intel_vgpu_ioctl,
> +	.dma_unmap	=3D intel_vgpu_dma_unmap,
>  };
> =20
>  static int intel_vgpu_probe(struct mdev_device *mdev)
> diff --git a/drivers/s390/cio/vfio_ccw_ops.c b/drivers/s390/cio/vfio_ccw_=
ops.c
> index b49e2e9db2dc6f..09e0ce7b72324c 100644
> --- a/drivers/s390/cio/vfio_ccw_ops.c
> +++ b/drivers/s390/cio/vfio_ccw_ops.c
> @@ -44,31 +44,19 @@ static int vfio_ccw_mdev_reset(struct vfio_ccw_privat=
e *private)
>  	return ret;
>  }
> =20
> -static int vfio_ccw_mdev_notifier(struct notifier_block *nb,
> -				  unsigned long action,
> -				  void *data)
> +static void vfio_ccw_dma_unmap(struct vfio_device *vdev, u64 iova, u64 l=
ength)
>  {
>  	struct vfio_ccw_private *private =3D
> -		container_of(nb, struct vfio_ccw_private, nb);
> -
> -	/*
> -	 * Vendor drivers MUST unpin pages in response to an
> -	 * invalidation.
> -	 */
> -	if (action =3D=3D VFIO_IOMMU_NOTIFY_DMA_UNMAP) {
> -		struct vfio_iommu_type1_dma_unmap *unmap =3D data;
> -
> -		if (!cp_iova_pinned(&private->cp, unmap->iova))
> -			return NOTIFY_OK;
> +		container_of(vdev, struct vfio_ccw_private, vdev);
> =20
> -		if (vfio_ccw_mdev_reset(private))
> -			return NOTIFY_BAD;
> +	/* Drivers MUST unpin pages in response to an invalidation. */
> +	if (!cp_iova_pinned(&private->cp, iova))
> +		return;
> =20
> -		cp_free(&private->cp);
> -		return NOTIFY_OK;
> -	}
> +	if (vfio_ccw_mdev_reset(private))
> +		return;
> =20
> -	return NOTIFY_DONE;
> +	cp_free(&private->cp);
>  }
> =20
>  static ssize_t name_show(struct mdev_type *mtype,
> @@ -178,19 +166,11 @@ static int vfio_ccw_mdev_open_device(struct vfio_de=
vice *vdev)
>  {
>  	struct vfio_ccw_private *private =3D
>  		container_of(vdev, struct vfio_ccw_private, vdev);
> -	unsigned long events =3D VFIO_IOMMU_NOTIFY_DMA_UNMAP;
>  	int ret;
> =20
> -	private->nb.notifier_call =3D vfio_ccw_mdev_notifier;
> -
> -	ret =3D vfio_register_notifier(vdev, VFIO_IOMMU_NOTIFY,
> -				     &events, &private->nb);
> -	if (ret)
> -		return ret;
> -
>  	ret =3D vfio_ccw_register_async_dev_regions(private);
>  	if (ret)
> -		goto out_unregister;
> +		return ret;
> =20
>  	ret =3D vfio_ccw_register_schib_dev_regions(private);
>  	if (ret)
> @@ -204,7 +184,6 @@ static int vfio_ccw_mdev_open_device(struct vfio_devi=
ce *vdev)
> =20
>  out_unregister:
>  	vfio_ccw_unregister_dev_regions(private);
> -	vfio_unregister_notifier(vdev, VFIO_IOMMU_NOTIFY, &private->nb);
>  	return ret;
>  }
> =20
> @@ -222,7 +201,6 @@ static void vfio_ccw_mdev_close_device(struct vfio_de=
vice *vdev)
> =20
>  	cp_free(&private->cp);
>  	vfio_ccw_unregister_dev_regions(private);
> -	vfio_unregister_notifier(vdev, VFIO_IOMMU_NOTIFY, &private->nb);
>  }
> =20
>  static ssize_t vfio_ccw_mdev_read_io_region(struct vfio_ccw_private *pri=
vate,
> @@ -645,6 +623,7 @@ static const struct vfio_device_ops vfio_ccw_dev_ops =
=3D {
>  	.write =3D vfio_ccw_mdev_write,
>  	.ioctl =3D vfio_ccw_mdev_ioctl,
>  	.request =3D vfio_ccw_mdev_request,
> +	.dma_unmap =3D vfio_ccw_dma_unmap,
>  };
> =20
>  struct mdev_driver vfio_ccw_mdev_driver =3D {
> diff --git a/drivers/s390/cio/vfio_ccw_private.h b/drivers/s390/cio/vfio_=
ccw_private.h
> index b7163bac8cc75d..61418109238976 100644
> --- a/drivers/s390/cio/vfio_ccw_private.h
> +++ b/drivers/s390/cio/vfio_ccw_private.h
> @@ -74,7 +74,6 @@ struct vfio_ccw_crw {
>   * @completion: synchronization helper of the I/O completion
>   * @avail: available for creating a mediated device
>   * @mdev: pointer to the mediated device
> - * @nb: notifier for vfio events
>   * @io_region: MMIO region to input/output I/O arguments/results
>   * @io_mutex: protect against concurrent update of I/O regions
>   * @region: additional regions for other subchannel operations
> @@ -98,7 +97,6 @@ struct vfio_ccw_private {
>  	struct completion	*completion;
>  	atomic_t		avail;
>  	struct mdev_device	*mdev;
> -	struct notifier_block	nb;
>  	struct ccw_io_region	*io_region;
>  	struct mutex		io_mutex;
>  	struct vfio_ccw_region *region;
> diff --git a/drivers/s390/crypto/vfio_ap_ops.c b/drivers/s390/crypto/vfio=
_ap_ops.c
> index a7d2a95796d360..bb1a1677c5c230 100644
> --- a/drivers/s390/crypto/vfio_ap_ops.c
> +++ b/drivers/s390/crypto/vfio_ap_ops.c
> @@ -1226,34 +1226,14 @@ static int vfio_ap_mdev_set_kvm(struct ap_matrix_=
mdev *matrix_mdev,
>  	return 0;
>  }
> =20
> -/**
> - * vfio_ap_mdev_iommu_notifier - IOMMU notifier callback
> - *
> - * @nb: The notifier block
> - * @action: Action to be taken
> - * @data: data associated with the request
> - *
> - * For an UNMAP request, unpin the guest IOVA (the NIB guest address we
> - * pinned before). Other requests are ignored.
> - *
> - * Return: for an UNMAP request, NOFITY_OK; otherwise NOTIFY_DONE.
> - */
> -static int vfio_ap_mdev_iommu_notifier(struct notifier_block *nb,
> -				       unsigned long action, void *data)
> +static void vfio_ap_mdev_dma_unmap(struct vfio_device *vdev, u64 iova,
> +				   u64 length)
>  {
> -	struct ap_matrix_mdev *matrix_mdev;
> -
> -	matrix_mdev =3D container_of(nb, struct ap_matrix_mdev, iommu_notifier);
> -
> -	if (action =3D=3D VFIO_IOMMU_NOTIFY_DMA_UNMAP) {
> -		struct vfio_iommu_type1_dma_unmap *unmap =3D data;
> -		unsigned long g_pfn =3D unmap->iova >> PAGE_SHIFT;
> -
> -		vfio_unpin_pages(&matrix_mdev->vdev, &g_pfn, 1);
> -		return NOTIFY_OK;
> -	}
> +	struct ap_matrix_mdev *matrix_mdev =3D
> +		container_of(vdev, struct ap_matrix_mdev, vdev);
> +	unsigned long g_pfn =3D iova >> PAGE_SHIFT;
> =20
> -	return NOTIFY_DONE;
> +	vfio_unpin_pages(&matrix_mdev->vdev, &g_pfn, 1);
>  }
> =20
>  /**
> @@ -1380,27 +1360,11 @@ static int vfio_ap_mdev_open_device(struct vfio_d=
evice *vdev)
>  {
>  	struct ap_matrix_mdev *matrix_mdev =3D
>  		container_of(vdev, struct ap_matrix_mdev, vdev);
> -	unsigned long events;
> -	int ret;
> =20
>  	if (!vdev->kvm)
>  		return -EINVAL;
> =20
> -	ret =3D vfio_ap_mdev_set_kvm(matrix_mdev, vdev->kvm);
> -	if (ret)
> -		return ret;
> -
> -	matrix_mdev->iommu_notifier.notifier_call =3D vfio_ap_mdev_iommu_notifi=
er;
> -	events =3D VFIO_IOMMU_NOTIFY_DMA_UNMAP;
> -	ret =3D vfio_register_notifier(vdev, VFIO_IOMMU_NOTIFY, &events,
> -				     &matrix_mdev->iommu_notifier);
> -	if (ret)
> -		goto err_kvm;
> -	return 0;
> -
> -err_kvm:
> -	vfio_ap_mdev_unset_kvm(matrix_mdev);
> -	return ret;
> +	return vfio_ap_mdev_set_kvm(matrix_mdev, vdev->kvm);
>  }
> =20
>  static void vfio_ap_mdev_close_device(struct vfio_device *vdev)
> @@ -1408,8 +1372,6 @@ static void vfio_ap_mdev_close_device(struct vfio_d=
evice *vdev)
>  	struct ap_matrix_mdev *matrix_mdev =3D
>  		container_of(vdev, struct ap_matrix_mdev, vdev);
> =20
> -	vfio_unregister_notifier(vdev, VFIO_IOMMU_NOTIFY,
> -				 &matrix_mdev->iommu_notifier);
>  	vfio_ap_mdev_unset_kvm(matrix_mdev);
>  }
> =20
> @@ -1461,6 +1423,7 @@ static const struct vfio_device_ops vfio_ap_matrix_=
dev_ops =3D {
>  	.open_device =3D vfio_ap_mdev_open_device,
>  	.close_device =3D vfio_ap_mdev_close_device,
>  	.ioctl =3D vfio_ap_mdev_ioctl,
> +	.dma_unmap =3D vfio_ap_mdev_dma_unmap,
>  };
> =20
>  static struct mdev_driver vfio_ap_matrix_driver =3D {
> diff --git a/drivers/s390/crypto/vfio_ap_private.h b/drivers/s390/crypto/=
vfio_ap_private.h
> index a26efd804d0df3..abb59d59f81b20 100644
> --- a/drivers/s390/crypto/vfio_ap_private.h
> +++ b/drivers/s390/crypto/vfio_ap_private.h
> @@ -81,8 +81,6 @@ struct ap_matrix {
>   * @node:	allows the ap_matrix_mdev struct to be added to a list
>   * @matrix:	the adapters, usage domains and control domains assigned to =
the
>   *		mediated matrix device.
> - * @iommu_notifier: notifier block used for specifying callback function=
 for
> - *		    handling the VFIO_IOMMU_NOTIFY_DMA_UNMAP even
>   * @kvm:	the struct holding guest's state
>   * @pqap_hook:	the function pointer to the interception handler for the
>   *		PQAP(AQIC) instruction.
> @@ -92,7 +90,6 @@ struct ap_matrix_mdev {
>  	struct vfio_device vdev;
>  	struct list_head node;
>  	struct ap_matrix matrix;
> -	struct notifier_block iommu_notifier;
>  	struct kvm *kvm;
>  	crypto_hook pqap_hook;
>  	struct mdev_device *mdev;
> diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
> index 61e71c1154be67..610bb884d9197b 100644
> --- a/drivers/vfio/vfio.c
> +++ b/drivers/vfio/vfio.c
> @@ -231,6 +231,9 @@ int vfio_register_iommu_driver(const struct vfio_iomm=
u_driver_ops *ops)
>  {
>  	struct vfio_iommu_driver *driver, *tmp;
> =20
> +	if (WARN_ON(!ops->register_notifier !=3D !ops->unregister_notifier))
> +		return -EINVAL;
> +
>  	driver =3D kzalloc(sizeof(*driver), GFP_KERNEL);
>  	if (!driver)
>  		return -ENOMEM;
> @@ -1077,8 +1080,20 @@ static void vfio_device_unassign_container(struct =
vfio_device *device)
>  	up_write(&device->group->group_rwsem);
>  }
> =20
> +static int vfio_iommu_notifier(struct notifier_block *nb, unsigned long =
action,
> +			       void *data)
> +{
> +	struct vfio_device *vfio_device =3D
> +		container_of(nb, struct vfio_device, iommu_nb);
> +	struct vfio_iommu_type1_dma_unmap *unmap =3D data;
> +
> +	vfio_device->ops->dma_unmap(vfio_device, unmap->iova, unmap->size);
> +	return NOTIFY_OK;
> +}
> +
>  static struct file *vfio_device_open(struct vfio_device *device)
>  {
> +	struct vfio_iommu_driver *iommu_driver;
>  	struct file *filep;
>  	int ret;
> =20
> @@ -1109,6 +1124,18 @@ static struct file *vfio_device_open(struct vfio_d=
evice *device)
>  			if (ret)
>  				goto err_undo_count;
>  		}
> +
> +		iommu_driver =3D device->group->container->iommu_driver;
> +		if (device->ops->dma_unmap && iommu_driver &&
> +		    iommu_driver->ops->register_notifier) {
> +			unsigned long events =3D VFIO_IOMMU_NOTIFY_DMA_UNMAP;
> +
> +			device->iommu_nb.notifier_call =3D vfio_iommu_notifier;
> +			iommu_driver->ops->register_notifier(
> +				device->group->container->iommu_data, &events,
> +				&device->iommu_nb);
> +		}
> +
>  		up_read(&device->group->group_rwsem);
>  	}
>  	mutex_unlock(&device->dev_set->lock);
> @@ -1143,8 +1170,16 @@ static struct file *vfio_device_open(struct vfio_d=
evice *device)
>  err_close_device:
>  	mutex_lock(&device->dev_set->lock);
>  	down_read(&device->group->group_rwsem);
> -	if (device->open_count =3D=3D 1 && device->ops->close_device)
> +	if (device->open_count =3D=3D 1 && device->ops->close_device) {
>  		device->ops->close_device(device);
> +
> +		iommu_driver =3D device->group->container->iommu_driver;
> +		if (device->ops->dma_unmap && iommu_driver &&
> +		    iommu_driver->ops->unregister_notifier)
> +			iommu_driver->ops->unregister_notifier(
> +				device->group->container->iommu_data,
> +				&device->iommu_nb);
> +	}
>  err_undo_count:
>  	device->open_count--;
>  	if (device->open_count =3D=3D 0 && device->kvm)
> @@ -1339,12 +1374,20 @@ static const struct file_operations vfio_group_fo=
ps =3D {
>  static int vfio_device_fops_release(struct inode *inode, struct file *fi=
lep)
>  {
>  	struct vfio_device *device =3D filep->private_data;
> +	struct vfio_iommu_driver *iommu_driver;
> =20
>  	mutex_lock(&device->dev_set->lock);
>  	vfio_assert_device_open(device);
>  	down_read(&device->group->group_rwsem);
>  	if (device->open_count =3D=3D 1 && device->ops->close_device)
>  		device->ops->close_device(device);
> +
> +	iommu_driver =3D device->group->container->iommu_driver;
> +	if (device->ops->dma_unmap && iommu_driver &&
> +	    iommu_driver->ops->unregister_notifier)
> +		iommu_driver->ops->unregister_notifier(
> +			device->group->container->iommu_data,
> +			&device->iommu_nb);
>  	up_read(&device->group->group_rwsem);
>  	device->open_count--;
>  	if (device->open_count =3D=3D 0)
> @@ -2027,90 +2070,6 @@ int vfio_dma_rw(struct vfio_device *device, dma_ad=
dr_t user_iova, void *data,
>  }
>  EXPORT_SYMBOL(vfio_dma_rw);
> =20
> -static int vfio_register_iommu_notifier(struct vfio_group *group,
> -					unsigned long *events,
> -					struct notifier_block *nb)
> -{
> -	struct vfio_container *container;
> -	struct vfio_iommu_driver *driver;
> -	int ret;
> -
> -	lockdep_assert_held_read(&group->group_rwsem);
> -
> -	container =3D group->container;
> -	driver =3D container->iommu_driver;
> -	if (likely(driver && driver->ops->register_notifier))
> -		ret =3D driver->ops->register_notifier(container->iommu_data,
> -						     events, nb);
> -	else
> -		ret =3D -ENOTTY;
> -
> -	return ret;
> -}
> -
> -static int vfio_unregister_iommu_notifier(struct vfio_group *group,
> -					  struct notifier_block *nb)
> -{
> -	struct vfio_container *container;
> -	struct vfio_iommu_driver *driver;
> -	int ret;
> -
> -	lockdep_assert_held_read(&group->group_rwsem);
> -
> -	container =3D group->container;
> -	driver =3D container->iommu_driver;
> -	if (likely(driver && driver->ops->unregister_notifier))
> -		ret =3D driver->ops->unregister_notifier(container->iommu_data,
> -						       nb);
> -	else
> -		ret =3D -ENOTTY;
> -
> -	return ret;
> -}
> -
> -int vfio_register_notifier(struct vfio_device *device,
> -			   enum vfio_notify_type type, unsigned long *events,
> -			   struct notifier_block *nb)
> -{
> -	struct vfio_group *group =3D device->group;
> -	int ret;
> -
> -	if (!nb || !events || (*events =3D=3D 0) ||
> -	    !vfio_assert_device_open(device))
> -		return -EINVAL;
> -
> -	switch (type) {
> -	case VFIO_IOMMU_NOTIFY:
> -		ret =3D vfio_register_iommu_notifier(group, events, nb);
> -		break;
> -	default:
> -		ret =3D -EINVAL;
> -	}
> -	return ret;
> -}
> -EXPORT_SYMBOL(vfio_register_notifier);
> -
> -int vfio_unregister_notifier(struct vfio_device *device,
> -			     enum vfio_notify_type type,
> -			     struct notifier_block *nb)
> -{
> -	struct vfio_group *group =3D device->group;
> -	int ret;
> -
> -	if (!nb || !vfio_assert_device_open(device))
> -		return -EINVAL;
> -
> -	switch (type) {
> -	case VFIO_IOMMU_NOTIFY:
> -		ret =3D vfio_unregister_iommu_notifier(group, nb);
> -		break;
> -	default:
> -		ret =3D -EINVAL;
> -	}
> -	return ret;
> -}
> -EXPORT_SYMBOL(vfio_unregister_notifier);
> -
>  /*
>   * Module/class support
>   */
> diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
> index a6713022115155..25da02ca1568fc 100644
> --- a/drivers/vfio/vfio.h
> +++ b/drivers/vfio/vfio.h
> @@ -33,6 +33,9 @@ enum vfio_iommu_notify_type {
>  	VFIO_IOMMU_CONTAINER_CLOSE =3D 0,
>  };
> =20
> +/* events for register_notifier() */
> +#define VFIO_IOMMU_NOTIFY_DMA_UNMAP BIT(0)
> +
>  /**
>   * struct vfio_iommu_driver_ops - VFIO IOMMU driver callbacks
>   */
> diff --git a/include/linux/vfio.h b/include/linux/vfio.h
> index 49580fa2073a8d..8c5c389d42d918 100644
> --- a/include/linux/vfio.h
> +++ b/include/linux/vfio.h
> @@ -44,6 +44,7 @@ struct vfio_device {
>  	unsigned int open_count;
>  	struct completion comp;
>  	struct list_head group_next;
> +	struct notifier_block iommu_nb;
>  };
> =20
>  /**
> @@ -60,6 +61,8 @@ struct vfio_device {
>   * @match: Optional device name match callback (return: 0 for no-match, =
>0 for
>   *         match, -errno for abort (ex. match with insufficient or incor=
rect
>   *         additional args)
> + * @dma_unmap: Called when userspace unmaps IOVA from the container
> + *             this device is attached to.
>   * @device_feature: Optional, fill in the VFIO_DEVICE_FEATURE ioctl
>   * @migration_set_state: Optional callback to change the migration state=
 for
>   *         devices that support migration. It's mandatory for
> @@ -85,6 +88,7 @@ struct vfio_device_ops {
>  	int	(*mmap)(struct vfio_device *vdev, struct vm_area_struct *vma);
>  	void	(*request)(struct vfio_device *vdev, unsigned int count);
>  	int	(*match)(struct vfio_device *vdev, char *buf);
> +	void	(*dma_unmap)(struct vfio_device *vdev, u64 iova, u64 length);
>  	int	(*device_feature)(struct vfio_device *device, u32 flags,
>  				  void __user *arg, size_t argsz);
>  	struct file *(*migration_set_state)(
> @@ -154,23 +158,6 @@ int vfio_unpin_pages(struct vfio_device *device, uns=
igned long *user_pfn,
>  int vfio_dma_rw(struct vfio_device *device, dma_addr_t user_iova,
>  		void *data, size_t len, bool write);
> =20
> -/* each type has independent events */
> -enum vfio_notify_type {
> -	VFIO_IOMMU_NOTIFY =3D 0,
> -};
> -
> -/* events for VFIO_IOMMU_NOTIFY */
> -#define VFIO_IOMMU_NOTIFY_DMA_UNMAP	BIT(0)
> -
> -int vfio_register_notifier(struct vfio_device *device,
> -			   enum vfio_notify_type type,
> -			   unsigned long *required_events,
> -			   struct notifier_block *nb);
> -int vfio_unregister_notifier(struct vfio_device *device,
> -			     enum vfio_notify_type type,
> -			     struct notifier_block *nb);
> -
> -
>  /*
>   * Sub-module helpers
>   */
> --=20
> 2.37.0
>=20

--XzWDHICoUFRd33PB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYsP20AAKCRCxBBozTXgY
Jyz7AKCb2pHfQ9DPRS9D1bia48aXOK0g2ACeM4yslhnf0CzNnfIVmU66W44r5eE=
=490+
-----END PGP SIGNATURE-----

--XzWDHICoUFRd33PB--
