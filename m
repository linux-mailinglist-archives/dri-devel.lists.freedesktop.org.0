Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3C725B65F
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 00:15:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E65989E0C;
	Wed,  2 Sep 2020 22:15:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0393D89E0C
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 22:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599084928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=588AR49B//W9Vky20+AfOmPNBmhHAgmTsNk4jrdLn3Y=;
 b=LM+jX6R16bD7GP6PtryWVQ35w4LU+u5LD7WzCOIZykIzR4wbbI5wi2rI1ZODgYK3pnDPXK
 uPXH84VqR+TquwnnB3kJrw+eXYtnt74aVdNrpbzgv07Mii+QbWGz+BKAJv5Nzc2IyfwXNZ
 h9H2LsOfKX9E1icLOT7rIBDN3VX5FCI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-N_keGioMNciZ5wErhSHsxw-1; Wed, 02 Sep 2020 18:15:21 -0400
X-MC-Unique: N_keGioMNciZ5wErhSHsxw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E1361888A3E;
 Wed,  2 Sep 2020 22:15:20 +0000 (UTC)
Received: from horse.redhat.com (ovpn-114-152.rdu2.redhat.com [10.10.114.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 96FF160C0F;
 Wed,  2 Sep 2020 22:15:14 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 1DF00223642; Wed,  2 Sep 2020 18:15:14 -0400 (EDT)
Date: Wed, 2 Sep 2020 18:15:14 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>
Subject: Re: [PATCH v2 04/23] virtio: Add get_shm_region method
Message-ID: <20200902221514.GE1263242@redhat.com>
References: <20200902210847.2689-1-gurchetansingh@chromium.org>
 <20200902210847.2689-5-gurchetansingh@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20200902210847.2689-5-gurchetansingh@chromium.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
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
Cc: virtio-dev@lists.oasis-open.org, Miklos Szeredi <miklos@szeredi.hu>,
 mst@redhat.com, dri-devel@lists.freedesktop.org, sebastien.boeuf@intel.com,
 kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Gurchetan,

Now Miklos has queued, these tree virtio patches for shared memory
region in his tree as part of virtiofs dax patch series.

I am hoping this will get merged in 5.10 through his tree.

https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git/log/?h=dax

Thanks
Vivek

On Wed, Sep 02, 2020 at 02:08:28PM -0700, Gurchetan Singh wrote:
> From: Sebastien Boeuf <sebastien.boeuf@intel.com>
> 
> Virtio defines 'shared memory regions' that provide a continuously
> shared region between the host and guest.
> 
> Provide a method to find a particular region on a device.
> 
> Signed-off-by: Sebastien Boeuf <sebastien.boeuf@intel.com>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> Cc: kvm@vger.kernel.org
> Cc: virtualization@lists.linux-foundation.org
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> ---
>  include/linux/virtio_config.h | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/include/linux/virtio_config.h b/include/linux/virtio_config.h
> index 8fe857e27ef32..4b8e38c5c4d8c 100644
> --- a/include/linux/virtio_config.h
> +++ b/include/linux/virtio_config.h
> @@ -11,6 +11,11 @@
>  
>  struct irq_affinity;
>  
> +struct virtio_shm_region {
> +	u64 addr;
> +	u64 len;
> +};
> +
>  /**
>   * virtio_config_ops - operations for configuring a virtio device
>   * Note: Do not assume that a transport implements all of the operations
> @@ -66,6 +71,7 @@ struct irq_affinity;
>   *      the caller can then copy.
>   * @set_vq_affinity: set the affinity for a virtqueue (optional).
>   * @get_vq_affinity: get the affinity for a virtqueue (optional).
> + * @get_shm_region: get a shared memory region based on the index.
>   */
>  typedef void vq_callback_t(struct virtqueue *);
>  struct virtio_config_ops {
> @@ -89,6 +95,8 @@ struct virtio_config_ops {
>  			       const struct cpumask *cpu_mask);
>  	const struct cpumask *(*get_vq_affinity)(struct virtio_device *vdev,
>  			int index);
> +	bool (*get_shm_region)(struct virtio_device *vdev,
> +			       struct virtio_shm_region *region, u8 id);
>  };
>  
>  /* If driver didn't advertise the feature, it will never appear. */
> @@ -251,6 +259,15 @@ int virtqueue_set_affinity(struct virtqueue *vq, const struct cpumask *cpu_mask)
>  	return 0;
>  }
>  
> +static inline
> +bool virtio_get_shm_region(struct virtio_device *vdev,
> +			   struct virtio_shm_region *region, u8 id)
> +{
> +	if (!vdev->config->get_shm_region)
> +		return false;
> +	return vdev->config->get_shm_region(vdev, region, id);
> +}
> +
>  static inline bool virtio_is_little_endian(struct virtio_device *vdev)
>  {
>  	return virtio_has_feature(vdev, VIRTIO_F_VERSION_1) ||
> -- 
> 2.26.2
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
