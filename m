Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJNkKDFeg2mJlQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 15:56:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A927E79ED
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 15:56:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BE2510E100;
	Wed,  4 Feb 2026 14:56:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=shazbot.org header.i=@shazbot.org header.b="0o8WaWC+";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="jzmMz8cj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 516 seconds by postgrey-1.36 at gabe;
 Wed, 04 Feb 2026 14:56:43 UTC
Received: from fout-b6-smtp.messagingengine.com
 (fout-b6-smtp.messagingengine.com [202.12.124.149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8092D10E678;
 Wed,  4 Feb 2026 14:56:43 +0000 (UTC)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfout.stl.internal (Postfix) with ESMTP id 459111D00099;
 Wed,  4 Feb 2026 09:48:05 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Wed, 04 Feb 2026 09:48:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1770216485;
 x=1770302885; bh=OAqECMTNWylYMxvQZWo48cfQCG+FzsGTUnm7TRzruJc=; b=
 0o8WaWC+JS0r9CyNO/nTgXfRQDJ56/yoy70axLrKphXjIXJxrk75jlyRIc0mFozg
 Lk9yZLXvit+j0LAW6FO4NKvl1M/1uw0AqI/Kv0zLHGMB4xaXYj7dVhwRDcsAdFbe
 XldCsL0y3BWhA1RU+xIRj0DlrCxgJ+y9G+eS5tdLTz/xq9KeKueV28uAkNWAkYki
 JFt10+lcANDhqdHiJ+aWcx0rZPmqY4AcPIAS78Sywq78D8ETU6OsQVbv4v/NDVLx
 tcRW2AWOeJfeGEo9hYpBcCvKQi7VmCM0uEGGCIeEXOrD7uBLnfVA8mCfURXdb+Zo
 0O72ph1Y+QfDvfTonvb22Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1770216485; x=
 1770302885; bh=OAqECMTNWylYMxvQZWo48cfQCG+FzsGTUnm7TRzruJc=; b=j
 zmMz8cjFVoG/rsm+0syFV2GjH1G9Jl5OSmRwqy86uRGwWgXestcZk51Jl2OtfOhi
 5dT2To2mQwZKbEcO3KiJ6YVzN/OWqj+r5xAY4f4Pcl47DGV+vjJCwJT82kWxuiYI
 U3D3g6AIwCcaYR2plHhaB4epoyk0ucC5lxbtg6+tuSzhDaJBG2MwMz5qymt6du14
 u5x4iw9+Urw3wJMot+A2nGSTxrNjdniDBsJvL0IV/uztGqUeYAV7FueJ6jd7hMI2
 V0Qujs8/84hPQEZQbg81ddFd/smKComYzHat9t/3Z/A9zAv532+oJhyaXykyLIuz
 /MklR4ShSvjuoAZODm5ow==
X-ME-Sender: <xms:JFyDabc3NtC5x9d-S5b8xgv_nBJstlaRTFKO2hRPyja2VYX4o8sNZQ>
 <xme:JFyDaTGLxs7JuKE4V_IA9P4W29Q7v5RsliDeybttbvBXmlhQwQJ1WPvXOy_ADVtQJ
 e5mu5eIf2Mw1llgw8EuXb9IOb9VYfiAv1zqZFzzC2PoRDuwWF_R>
X-ME-Received: <xmr:JFyDaZKGg0VtncgyvA-_AYz2KWPpimcRT69PBe7Nym3aMVuNqRimo99sgsg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukedvjedvucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhepfffhvfevuffkjghfofggtgfgsehtjeertdertddvnecuhfhrohhmpeetlhgvgicu
 hghilhhlihgrmhhsohhnuceorghlvgigsehshhgriigsohhtrdhorhhgqeenucggtffrrg
 htthgvrhhnpedvkeefjeekvdduhfduhfetkedugfduieettedvueekvdehtedvkefgudeg
 veeuueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grlhgvgiesshhhrgiisghothdrohhrghdpnhgspghrtghpthhtohepfeegpdhmohguvgep
 shhmthhpohhuthdprhgtphhtthhopehlvghonheskhgvrhhnvghlrdhorhhgpdhrtghpth
 htohepshhumhhithdrshgvmhifrghlsehlihhnrghrohdrohhrghdprhgtphhtthhopegt
 hhhrihhsthhirghnrdhkohgvnhhighesrghmugdrtghomhdprhgtphhtthhopegrlhgvgi
 grnhguvghrrdguvghutghhvghrsegrmhgurdgtohhmpdhrtghpthhtoheprghirhhlihgv
 ugesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpd
 hrtghpthhtohepkhhrrgigvghlsehrvgguhhgrthdrtghomhdprhgtphhtthhopegumhhi
 thhrhidrohhsihhpvghnkhhosegtohhllhgrsghorhgrrdgtohhmpdhrtghpthhtohepgh
 hurhgthhgvthgrnhhsihhnghhhsegthhhrohhmihhumhdrohhrgh
X-ME-Proxy: <xmx:JFyDabfA6AFufRXzaJSlKz-2t1bgQfl_-vcdUPLYedDqqhfQtD0F4g>
 <xmx:JFyDaXvtfjlvHHOBDbzIpiei4TfKRK6qgjSvLo_n98W07rjE3fSC_w>
 <xmx:JFyDaXtAyHrtabg5GCKcPsYXr1EXU3FQH7-j2yI9cGuotG8BnRMRyA>
 <xmx:JFyDaW-L9op9ODgl26-U7zgoSReG5Hb16hvQv5SKv36wBdcXrSzLXQ>
 <xmx:JVyDacEzOan8IdGoHVZJwVYbWkrRfU2u-Tob81oE2TJvkvib1I9BFGdR>
Feedback-ID: i03f14258:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Feb 2026 09:48:01 -0500 (EST)
Date: Wed, 4 Feb 2026 07:47:59 -0700
From: Alex Williamson <alex@shazbot.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
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
 Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Ankit Agrawal <ankita@nvidia.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux.dev, intel-xe@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, iommu@lists.linux.dev, kvm@vger.kernel.org
Subject: Re: [PATCH v7 4/8] vfio: Wait for dma-buf invalidation to complete
Message-ID: <20260204074759.108f579e@shazbot.org>
In-Reply-To: <20260131-dmabuf-revoke-v7-4-463d956bd527@nvidia.com>
References: <20260131-dmabuf-revoke-v7-0-463d956bd527@nvidia.com>
 <20260131-dmabuf-revoke-v7-4-463d956bd527@nvidia.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[shazbot.org,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[shazbot.org:s=fm2,messagingengine.com:s=fm3];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,amd.com,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,kernel.org,suse.de,intel.com,ziepe.ca,8bytes.org,arm.com,nvidia.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	DKIM_TRACE(0.00)[shazbot.org:+,messagingengine.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[alex@shazbot.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:email,shazbot.org:email,shazbot.org:dkim,shazbot.org:mid,intel.com:email,messagingengine.com:dkim]
X-Rspamd-Queue-Id: 3A927E79ED
X-Rspamd-Action: no action

On Sat, 31 Jan 2026 07:34:14 +0200
Leon Romanovsky <leon@kernel.org> wrote:

> From: Leon Romanovsky <leonro@nvidia.com>
> 
> dma-buf invalidation is handled asynchronously by the hardware, so VFIO
> must wait until all affected objects have been fully invalidated.
> 
> In addition, the dma-buf exporter is expecting that all importers unmap any
> buffers they previously mapped.
> 
> Fixes: 5d74781ebc86 ("vfio/pci: Add dma-buf export support for MMIO regions")
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  drivers/vfio/pci/vfio_pci_dmabuf.c | 61 +++++++++++++++++++++++++++++++++++---
>  1 file changed, 57 insertions(+), 4 deletions(-)

Reviewed-by: Alex Williamson <alex@shazbot.org>

> 
> diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
> index d8ceafabef48..78d47e260f34 100644
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
> @@ -331,9 +355,33 @@ void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
>  
>  		if (priv->revoked != revoked) {
>  			dma_resv_lock(priv->dmabuf->resv, NULL);
> -			priv->revoked = revoked;
> +			if (revoked)
> +				priv->revoked = true;
>  			dma_buf_invalidate_mappings(priv->dmabuf);
> +			dma_resv_wait_timeout(priv->dmabuf->resv,
> +					      DMA_RESV_USAGE_BOOKKEEP, false,
> +					      MAX_SCHEDULE_TIMEOUT);
>  			dma_resv_unlock(priv->dmabuf->resv);
> +			if (revoked) {
> +				kref_put(&priv->kref, vfio_pci_dma_buf_done);
> +				wait_for_completion(&priv->comp);
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
> +				dma_resv_lock(priv->dmabuf->resv, NULL);
> +				priv->revoked = false;
> +				dma_resv_unlock(priv->dmabuf->resv);
> +			}
>  		}
>  		fput(priv->dmabuf->file);
>  	}
> @@ -354,7 +402,12 @@ void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev)
>  		priv->vdev = NULL;
>  		priv->revoked = true;
>  		dma_buf_invalidate_mappings(priv->dmabuf);
> +		dma_resv_wait_timeout(priv->dmabuf->resv,
> +				      DMA_RESV_USAGE_BOOKKEEP, false,
> +				      MAX_SCHEDULE_TIMEOUT);
>  		dma_resv_unlock(priv->dmabuf->resv);
> +		kref_put(&priv->kref, vfio_pci_dma_buf_done);
> +		wait_for_completion(&priv->comp);
>  		vfio_device_put_registration(&vdev->vdev);
>  		fput(priv->dmabuf->file);
>  	}
> 

