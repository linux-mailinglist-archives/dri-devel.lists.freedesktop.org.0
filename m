Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDWsHHLUd2n1lwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 21:54:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A6B8D599
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 21:54:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECC4610E054;
	Mon, 26 Jan 2026 20:54:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="pzrR2Cj+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECF1B10E054
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 20:54:06 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-2a0d06cfa93so3195ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 12:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1769460846; x=1770065646;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Hzbl67LvVO3G9O2kTwPWCnjF6/j6A2BV5AiFShhPhBU=;
 b=pzrR2Cj+phHrgyIAbVJoFm060moWMkBNKJeheocm6Z6eJjwlJwpZB5+ikU5LUx91zc
 JMuieJPR5j2fZw9stD5+huqWokb50nANvsFzRq+jqebaeWrRoLID7xvtmLJ1Ap5xLE5d
 2Hae/oEt3udcikzmYqDnm+w06SUZyBkhp2Kn+WHnB75AaJuExVHMcoFMS9v9nJfcow5g
 FputNENXp94uf8kMMkV7XGqzvf8gVxR8oCSzkC5hd6L4/7hAsPe9cN0sWsawtDIN94UL
 6EumaB+3D8OwI6WxjoqaekAyqj60xBLNcu5J9d9EDmPcdf+f8pUT26fZh87EsrBpszpm
 Kv/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769460846; x=1770065646;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hzbl67LvVO3G9O2kTwPWCnjF6/j6A2BV5AiFShhPhBU=;
 b=AOgNeTqDKZKTCdK9FH/lsMtlWNx6wDL3y0nk2i95TPSAGt+m/rNdG8z7v4pPe13JHb
 /I3dIXYYtsQLG3CESoj8jN0AJ7LoroPAow6VWyJBItYQKXf5zkeiXJMnfe64A3pTf23O
 3dkMFFrj7QkQ9at0RVMn3QRfWf+m0HZHkeXx5XZe0nXFgwj7P/3qEvzcVP/2HlbCzisL
 yd7WzO8usYR/iX2TFP8Jz4sl/6mUEh0krUcpn6nXuvA/UP9VgxEYjDIGwgzVIDPn4m/I
 qbV48HJKKfsoym4COAJYmpjHp8FZsH88ID1KfX3wZaeBmGJlP1pQvPY+HHlG+32UkIKd
 4OTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3pZfcXfUyn18QfWOALSQ1cCBiAwsc2mpOIDbRMc1/VP10CsB3JVz+tBcV452Uqe1v6HsI/yQjOSM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3EWVRAeeE3Qiz9ffQ9i9xWP26NHQiTls8iERBZmHoD8aEf3F+
 oOySskDBHoOr7Nic8qImRGfNXFoMrcN2Nq5IBZn76DR2ghtjq4nzI6AaXWSPsL/Kjg==
X-Gm-Gg: AZuq6aLJtwpeRB3ZtHxojJW83ISTDlrdc1ot2UX9tKpbmeXnSDbO/m4GhEKyYj7x4B6
 cGoJ7E+oKFY6UCQg7OAszsD0Itly01Ums9Cy2aBFST/Au699IAViIBjfd/NGSSgEOq/nO9WVRIT
 0lb+egQeSvnmCKOtYbhPeS+b2W3meF5RQ6NfuclomthPJn9KH+qpd3bnrpXVndhy3qFRsxo30mL
 Piu52lNUoO/HwqOAmceP3G/DgViCtQMSQV4mtlOcShCAi61R0n9hQBesQwH5YiG9zwKeKQ1zFHD
 1Q2Ozc9AWPe+JqRiV1VFOjTeHUHZ4JmP9STFx8Zg14qY6FkMpjjPII+TFrA9YTJgrqmepg8THdl
 p+Ixw7WsNKDjrYt2lYns9g4Z5LI1m6KUAkgvjPL32J0Z3lvG7XcOxBrhVEJKBsRPFLfHpuVM25O
 eI5NqIB0S0tZIfn6S8OAgWo4VJGUhX3OtnYFzbGwRjmKHv5le+
X-Received: by 2002:a17:903:1cc:b0:295:5405:46be with SMTP id
 d9443c01a7336-2a8447fe3b6mr3809735ad.1.1769460846094; 
 Mon, 26 Jan 2026 12:54:06 -0800 (PST)
Received: from google.com (222.245.187.35.bc.googleusercontent.com.
 [35.187.245.222]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a802fda160sm94991165ad.88.2026.01.26.12.53.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 12:54:05 -0800 (PST)
Date: Mon, 26 Jan 2026 20:53:57 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Williamson <alex@shazbot.org>, Ankit Agrawal <ankita@nvidia.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 intel-xe@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 iommu@lists.linux.dev, kvm@vger.kernel.org
Subject: Re: [PATCH v5 4/8] vfio: Wait for dma-buf invalidation to complete
Message-ID: <aXfUZcSEr9N18o6w@google.com>
References: <20260124-dmabuf-revoke-v5-0-f98fca917e96@nvidia.com>
 <20260124-dmabuf-revoke-v5-4-f98fca917e96@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260124-dmabuf-revoke-v5-4-f98fca917e96@nvidia.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,amd.com,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,kernel.org,suse.de,intel.com,ziepe.ca,8bytes.org,arm.com,shazbot.org,nvidia.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[praan@google.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	FORGED_RECIPIENTS(0.00)[m:leon@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:alexander.deucher@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:kraxel@redhat.com,m:dmitry.osipenko@collabora.com,m:gurchetansingh@chromium.org,m:olvaffe@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:lucas.demarchi@intel.com,m:thomas.hellstrom@linux.intel.com,m:rodrigo.vivi@intel.com,m:jgg@ziepe.ca,m:kevin.tian@intel.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:Felix.Kuehling@amd.com,m:alex@shazbot.org,m:ankita@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:virtualization@lists.linux.dev,m:intel-xe@lists.freedesktop.org,m:linux-rdma@vger.kernel.org,m:iommu@lists.linux.dev,m:kvm@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[google.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[praan@google.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: D9A6B8D599
X-Rspamd-Action: no action

On Sat, Jan 24, 2026 at 09:14:16PM +0200, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> dma-buf invalidation is handled asynchronously by the hardware, so VFIO
> must wait until all affected objects have been fully invalidated.
> 
> In addition, the dma-buf exporter is expecting that all importers unmap any
> buffers they previously mapped.
> 
> Fixes: 5d74781ebc86 ("vfio/pci: Add dma-buf export support for MMIO regions")
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  drivers/vfio/pci/vfio_pci_dmabuf.c | 71 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 68 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
> index d8ceafabef48..485515629fe4 100644
> --- a/drivers/vfio/pci/vfio_pci_dmabuf.c
> +++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
> @@ -17,6 +17,8 @@ struct vfio_pci_dma_buf {
>  	struct dma_buf_phys_vec *phys_vec;
>  	struct p2pdma_provider *provider;
>  	u32 nr_ranges;
> +	struct kref kref;
> +	struct completion comp;
>  	u8 revoked : 1;
>  };
>  
> @@ -44,27 +46,46 @@ static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
>  	return 0;
>  }
>  
> +static void vfio_pci_dma_buf_done(struct kref *kref)
> +{
> +	struct vfio_pci_dma_buf *priv =
> +		container_of(kref, struct vfio_pci_dma_buf, kref);
> +
> +	complete(&priv->comp);
> +}
> +
>  static struct sg_table *
>  vfio_pci_dma_buf_map(struct dma_buf_attachment *attachment,
>  		     enum dma_data_direction dir)
>  {
>  	struct vfio_pci_dma_buf *priv = attachment->dmabuf->priv;
> +	struct sg_table *ret;
>  
>  	dma_resv_assert_held(priv->dmabuf->resv);
>  
>  	if (priv->revoked)
>  		return ERR_PTR(-ENODEV);
>  
> -	return dma_buf_phys_vec_to_sgt(attachment, priv->provider,
> -				       priv->phys_vec, priv->nr_ranges,
> -				       priv->size, dir);
> +	ret = dma_buf_phys_vec_to_sgt(attachment, priv->provider,
> +				      priv->phys_vec, priv->nr_ranges,
> +				      priv->size, dir);
> +	if (IS_ERR(ret))
> +		return ret;
> +
> +	kref_get(&priv->kref);
> +	return ret;
>  }
>  
>  static void vfio_pci_dma_buf_unmap(struct dma_buf_attachment *attachment,
>  				   struct sg_table *sgt,
>  				   enum dma_data_direction dir)
>  {
> +	struct vfio_pci_dma_buf *priv = attachment->dmabuf->priv;
> +
> +	dma_resv_assert_held(priv->dmabuf->resv);
> +
>  	dma_buf_free_sgt(attachment, sgt, dir);
> +	kref_put(&priv->kref, vfio_pci_dma_buf_done);
>  }
>  
>  static void vfio_pci_dma_buf_release(struct dma_buf *dmabuf)
> @@ -287,6 +308,9 @@ int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
>  		goto err_dev_put;
>  	}
>  
> +	kref_init(&priv->kref);
> +	init_completion(&priv->comp);
> +
>  	/* dma_buf_put() now frees priv */
>  	INIT_LIST_HEAD(&priv->dmabufs_elm);
>  	down_write(&vdev->memory_lock);
> @@ -326,6 +350,8 @@ void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
>  	lockdep_assert_held_write(&vdev->memory_lock);
>  
>  	list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm) {
> +		unsigned long wait;
> +
>  		if (!get_file_active(&priv->dmabuf->file))
>  			continue;
>  
> @@ -333,7 +359,37 @@ void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
>  			dma_resv_lock(priv->dmabuf->resv, NULL);
>  			priv->revoked = revoked;
>  			dma_buf_invalidate_mappings(priv->dmabuf);
> +			dma_resv_wait_timeout(priv->dmabuf->resv,
> +					      DMA_RESV_USAGE_BOOKKEEP, false,
> +					      MAX_SCHEDULE_TIMEOUT);
>  			dma_resv_unlock(priv->dmabuf->resv);
> +			if (revoked) {
> +				kref_put(&priv->kref, vfio_pci_dma_buf_done);
> +				/* Let's wait till all DMA unmap are completed. */
> +				wait = wait_for_completion_timeout(
> +					&priv->comp, secs_to_jiffies(1));

Is the 1-second constant sufficient for all hardware, or should the 
invalidate_mappings() contract require the callback to block until 
speculative reads are strictly fenced? I'm wondering about a case where
a device's firmware has a high response latency, perhaps due to internal
management tasks like error recovery or thermal and it exceeds the 1s 
timeout. 

If the device is in the middle of a large DMA burst and the firmware is
slow to flush the internal pipelines to a fully "quiesced"
read-and-discard state, reclaiming the memory at exactly 1.001 seconds
risks triggering platform-level faults..

Since the wen explicitly permit these speculative reads until unmap is
complete, relying on a hardcoded timeout in the exporter seems to 
introduce a hardware-dependent race condition that could compromise
system stability via IOMMU errors or AER faults. 

Should the importer instead be required to guarantee that all 
speculative access has ceased before the invalidation call returns?

Thanks
Praan

> +				/*
> +				 * If you see this WARN_ON, it means that
> +				 * importer didn't call unmap in response to
> +				 * dma_buf_invalidate_mappings() which is not
> +				 * allowed.
> +				 */
> +				WARN(!wait,
> +				     "Timed out waiting for DMABUF unmap, importer has a broken invalidate_mapping()");
> +			} else {
> +				/*
> +				 * Kref is initialize again, because when revoke
> +				 * was performed the reference counter was decreased
> +				 * to zero to trigger completion.
> +				 */
> +				kref_init(&priv->kref);
> +				/*
> +				 * There is no need to wait as no mapping was
> +				 * performed when the previous status was
> +				 * priv->revoked == true.
> +				 */
> +				reinit_completion(&priv->comp);
> +			}
>  		}
>  		fput(priv->dmabuf->file);
>  	}
> @@ -346,6 +402,8 @@ void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev)
>  
>  	down_write(&vdev->memory_lock);
>  	list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm) {
> +		unsigned long wait;
> +
>  		if (!get_file_active(&priv->dmabuf->file))
>  			continue;
>  
> @@ -354,7 +412,14 @@ void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev)
>  		priv->vdev = NULL;
>  		priv->revoked = true;
>  		dma_buf_invalidate_mappings(priv->dmabuf);
> +		dma_resv_wait_timeout(priv->dmabuf->resv,
> +				      DMA_RESV_USAGE_BOOKKEEP, false,
> +				      MAX_SCHEDULE_TIMEOUT);
>  		dma_resv_unlock(priv->dmabuf->resv);
> +		kref_put(&priv->kref, vfio_pci_dma_buf_done);
> +		wait = wait_for_completion_timeout(&priv->comp,
> +						   secs_to_jiffies(1));
> +		WARN_ON(!wait);
>  		vfio_device_put_registration(&vdev->vdev);
>  		fput(priv->dmabuf->file);
>  	}
> 
> -- 
> 2.52.0
> 
> 
