Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 273E62EF590
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 17:12:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6150E6E835;
	Fri,  8 Jan 2021 16:12:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 496D76E835
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 16:12:35 +0000 (UTC)
IronPort-SDR: b6P66A+kNGre37KgUoxfK2ciygGBk6prLduZGfmwrQSLdascDohHgSHhcEbfrph38dNQKbO0f5
 Y/tB3kAR2BGw==
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="165304546"
X-IronPort-AV: E=Sophos;i="5.79,331,1602572400"; d="scan'208";a="165304546"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2021 08:12:34 -0800
IronPort-SDR: JMbobQ7je7NHlqEgCJqr+/MvTBYSjiYikipnt+2BMt8dIYeeNWW8hzX84f1xJ/FHwBuwkoaUT5
 6Hcg9CKTDj0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,331,1602572400"; d="scan'208";a="351723950"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP; 08 Jan 2021 08:12:33 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 8 Jan 2021 08:12:33 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 8 Jan 2021 08:12:32 -0800
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.1713.004;
 Fri, 8 Jan 2021 08:12:25 -0800
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "sumit.semwal@linaro.org"
 <sumit.semwal@linaro.org>, "christian.koenig@amd.com"
 <christian.koenig@amd.com>, "airlied@redhat.com" <airlied@redhat.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "kraxel@redhat.com" <kraxel@redhat.com>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>, "sean@poorly.run"
 <sean@poorly.run>, "eric@anholt.net" <eric@anholt.net>, "sam@ravnborg.org"
 <sam@ravnborg.org>
Subject: RE: [PATCH v4 01/13] dma-buf: Add vmap_local and vnumap_local
 operations
Thread-Topic: [PATCH v4 01/13] dma-buf: Add vmap_local and vnumap_local
 operations
Thread-Index: AQHW5aLP4hX76tQjY0SfdcD489sfwKod5bgg
Date: Fri, 8 Jan 2021 16:12:25 +0000
Message-ID: <39d9d40bf6284ef29c777776f9f2b5a3@intel.com>
References: <20210108094340.15290-1-tzimmermann@suse.de>
 <20210108094340.15290-2-tzimmermann@suse.de>
In-Reply-To: <20210108094340.15290-2-tzimmermann@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.22.254.132]
MIME-Version: 1.0
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
Cc: "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>-----Original Message-----
>From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
>Thomas Zimmermann
>Sent: Friday, January 8, 2021 4:43 AM
>To: sumit.semwal@linaro.org; christian.koenig@amd.com;
>airlied@redhat.com; daniel@ffwll.ch; maarten.lankhorst@linux.intel.com;
>mripard@kernel.org; kraxel@redhat.com; hdegoede@redhat.com;
>sean@poorly.run; eric@anholt.net; sam@ravnborg.org
>Cc: Daniel Vetter <daniel.vetter@ffwll.ch>; dri-devel@lists.freedesktop.org;
>virtualization@lists.linux-foundation.org; linaro-mm-sig@lists.linaro.org;
>Thomas Zimmermann <tzimmermann@suse.de>; linux-
>media@vger.kernel.org
>Subject: [PATCH v4 01/13] dma-buf: Add vmap_local and vnumap_local
>operations
>
>The existing dma-buf calls dma_buf_vmap() and dma_buf_vunmap() are
>allowed to pin the buffer or acquire the buffer's reservation object
>lock.
>
>This is a problem for callers that only require a short-term mapping
>of the buffer without the pinning, or callers that have special locking
>requirements. These may suffer from unnecessary overhead or interfere
>with regular pin operations.
>
>The new interfaces dma_buf_vmap_local(), dma_buf_vunmapo_local(), and
>their rsp callbacks in struct dma_buf_ops provide an alternative without
>pinning or reservation locking. Callers are responsible for these
>operations.
>
>v4:
>	* update documentation (Daniel)
>
>Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>---
> drivers/dma-buf/dma-buf.c | 81
>+++++++++++++++++++++++++++++++++++++++
> include/linux/dma-buf.h   | 34 ++++++++++++++++
> 2 files changed, 115 insertions(+)
>
>diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>index b8465243eca2..01f9c74d97fa 100644
>--- a/drivers/dma-buf/dma-buf.c
>+++ b/drivers/dma-buf/dma-buf.c
>@@ -1295,6 +1295,87 @@ void dma_buf_vunmap(struct dma_buf *dmabuf,
>struct dma_buf_map *map)
> }
> EXPORT_SYMBOL_GPL(dma_buf_vunmap);
>
>+/**
>+ * dma_buf_vmap_local - Create virtual mapping for the buffer object into
>kernel
>+ * address space.
>+ * @dmabuf:	[in]	buffer to vmap
>+ * @map:	[out]	returns the vmap pointer
>+ *
>+ * Unlike dma_buf_vmap() this is a short term mapping and will not pin
>+ * the buffer. The struct dma_resv for the @dmabuf must be locked until
>+ * dma_buf_vunmap_local() is called.
>+ *
>+ * Returns:
>+ * 0 on success, or a negative errno code otherwise.
>+ */
>+int dma_buf_vmap_local(struct dma_buf *dmabuf, struct dma_buf_map
>*map)
>+{
>+	struct dma_buf_map ptr;
>+	int ret = 0;
>+
>+	dma_buf_map_clear(map);
>+
>+	if (WARN_ON(!dmabuf))
>+		return -EINVAL;
>+
>+	dma_resv_assert_held(dmabuf->resv);
>+
>+	if (!dmabuf->ops->vmap_local)
>+		return -EINVAL;

You are clearing the map, and then doing the above checks.

Is it ok to change the map info and then exit on error?

Mike

>+	mutex_lock(&dmabuf->lock);
>+	if (dmabuf->vmapping_counter) {
>+		dmabuf->vmapping_counter++;
>+		BUG_ON(dma_buf_map_is_null(&dmabuf->vmap_ptr));
>+		*map = dmabuf->vmap_ptr;
>+		goto out_unlock;
>+	}
>+
>+	BUG_ON(dma_buf_map_is_set(&dmabuf->vmap_ptr));
>+
>+	ret = dmabuf->ops->vmap_local(dmabuf, &ptr);
>+	if (WARN_ON_ONCE(ret))
>+		goto out_unlock;
>+
>+	dmabuf->vmap_ptr = ptr;
>+	dmabuf->vmapping_counter = 1;
>+
>+	*map = dmabuf->vmap_ptr;
>+
>+out_unlock:
>+	mutex_unlock(&dmabuf->lock);
>+	return ret;
>+}
>+EXPORT_SYMBOL_GPL(dma_buf_vmap_local);
>+
>+/**
>+ * dma_buf_vunmap_local - Unmap a vmap obtained by
>dma_buf_vmap_local.
>+ * @dmabuf:	[in]	buffer to vunmap
>+ * @map:	[in]	vmap pointer to vunmap
>+ *
>+ * Release a mapping established with dma_buf_vmap_local().
>+ */
>+void dma_buf_vunmap_local(struct dma_buf *dmabuf, struct
>dma_buf_map *map)
>+{
>+	if (WARN_ON(!dmabuf))
>+		return;
>+
>+	dma_resv_assert_held(dmabuf->resv);
>+
>+	BUG_ON(dma_buf_map_is_null(&dmabuf->vmap_ptr));
>+	BUG_ON(dmabuf->vmapping_counter == 0);
>+	BUG_ON(!dma_buf_map_is_equal(&dmabuf->vmap_ptr, map));
>+
>+	mutex_lock(&dmabuf->lock);
>+	if (--dmabuf->vmapping_counter == 0) {
>+		if (dmabuf->ops->vunmap_local)
>+			dmabuf->ops->vunmap_local(dmabuf, map);
>+		dma_buf_map_clear(&dmabuf->vmap_ptr);
>+	}
>+	mutex_unlock(&dmabuf->lock);
>+}
>+EXPORT_SYMBOL_GPL(dma_buf_vunmap_local);
>+
> #ifdef CONFIG_DEBUG_FS
> static int dma_buf_debug_show(struct seq_file *s, void *unused)
> {
>diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
>index 628681bf6c99..aeed754b5467 100644
>--- a/include/linux/dma-buf.h
>+++ b/include/linux/dma-buf.h
>@@ -264,6 +264,38 @@ struct dma_buf_ops {
>
> 	int (*vmap)(struct dma_buf *dmabuf, struct dma_buf_map *map);
> 	void (*vunmap)(struct dma_buf *dmabuf, struct dma_buf_map
>*map);
>+
>+	/**
>+	 * @vmap_local:
>+	 *
>+	 * Creates a virtual mapping for the buffer into kernel address space.
>+	 *
>+	 * This callback establishes short-term mappings for situations where
>+	 * callers only use the buffer for a bounded amount of time; such as
>+	 * updates to the framebuffer or reading back contained information.
>+	 * In contrast to the regular @vmap callback, vmap_local does never
>pin
>+	 * the buffer to a specific domain or acquire the buffer's reservation
>+	 * lock.
>+	 *
>+	 * This is called with the &dma_buf.resv object locked. Callers must
>hold
>+	 * the lock until after removing the mapping with @vunmap_local.
>+	 *
>+	 * This callback is optional.
>+	 *
>+	 * Returns:
>+	 *
>+	 * 0 on success or a negative error code on failure.
>+	 */
>+	int (*vmap_local)(struct dma_buf *dmabuf, struct dma_buf_map
>*map);
>+
>+	/**
>+	 * @vunmap_local:
>+	 *
>+	 * Removes a virtual mapping that was established by @vmap_local.
>+	 *
>+	 * This callback is optional.
>+	 */
>+	void (*vunmap_local)(struct dma_buf *dmabuf, struct dma_buf_map
>*map);
> };
>
> /**
>@@ -501,4 +533,6 @@ int dma_buf_mmap(struct dma_buf *, struct
>vm_area_struct *,
> 		 unsigned long);
> int dma_buf_vmap(struct dma_buf *dmabuf, struct dma_buf_map *map);
> void dma_buf_vunmap(struct dma_buf *dmabuf, struct dma_buf_map
>*map);
>+int dma_buf_vmap_local(struct dma_buf *dmabuf, struct dma_buf_map
>*map);
>+void dma_buf_vunmap_local(struct dma_buf *dmabuf, struct
>dma_buf_map *map);
> #endif /* __DMA_BUF_H__ */
>--
>2.29.2
>
>_______________________________________________
>dri-devel mailing list
>dri-devel@lists.freedesktop.org
>https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
