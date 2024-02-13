Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DFB8536AC
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 17:58:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BADAC10E886;
	Tue, 13 Feb 2024 16:57:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WHGWcr1W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A93DC10E889
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 16:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707843473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8e0DccU/KeSr/q5ONRNWJlNTzavT2616Q3HcyER/HV4=;
 b=WHGWcr1W8lVqoIfuzI5i3o8hXw43XCrHitqYciCXZiR6gcqMrghF+eYREVr4L6omBfu4H4
 z2qoZueY4g9qTaQZz3jpqsdRecrEEXpj7AlRP1BkLYheqDjseMqwU9oh6iJ6hlgE1PloTj
 EZBOK5XJHNQsf3QkzCKiLPjQNz58PMc=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-fyFJ0i1INDW5ZjEpNnLUXA-1; Tue, 13 Feb 2024 11:57:51 -0500
X-MC-Unique: fyFJ0i1INDW5ZjEpNnLUXA-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-50e55470b49so5455691e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 08:57:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707843470; x=1708448270;
 h=content-transfer-encoding:in-reply-to:cc:organization:from
 :references:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8e0DccU/KeSr/q5ONRNWJlNTzavT2616Q3HcyER/HV4=;
 b=WmhH8ht1sDiPzNkzQv2BMQMljfk1QXQ9R7NvBjhe+p6UV3vNzms4AHD+u+Y9Vc68VG
 Dfitf7Ggy2vKMh+qaBAtD1D5denNDkTczI0v2vjJSSTLBbKWso9Rss37S9MEAzpzYtke
 wHgCzto3P90vy5KqUhY+mIHK7cpEDS4uWQQudqugTZvuD6wRU5ehceYoS0B204s960Na
 NMdilUmEFXq/f6UJf13jCQyul9clAoTk/IHYEzam5Y8+nWpAJVuTOJu9TAA68ttZqoy0
 vrHK0S8DWjee8ZwZ13fBXxPIRRYXmt1Bhg3r+HaZTeoGKzSg56mbsMEKFenDJa+MG2y4
 pbKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQpZcga0qGcsCzv0zHnt6g8/a7DH/L61LxczEWbkTTux2xv3qiIkTcBwWQ9Ue11s81vgYR2c3/staBwr3TJCEhGQkMO0+VthMCxclm9fSU
X-Gm-Message-State: AOJu0Ywmg6l6HygHOP+dXJOsXHsozWouycCCrZY8ewx6gruASOP+Bwr0
 gXitEWdp0ygSx1jOxj49h/UNfoTiS3rrvNl4+QfK0LswpYvN2w8/SCm5/dIx1kUv3DbdOpRaCQz
 Re2LoA5P4K4BTmftwC75IlwCmTh+OyzojuQwM5PVWQGBgmenM52IDucJFzVZ7Xegs9w==
X-Received: by 2002:a19:7419:0:b0:511:79ce:8a01 with SMTP id
 v25-20020a197419000000b0051179ce8a01mr80763lfe.46.1707843470171; 
 Tue, 13 Feb 2024 08:57:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEDJhQ5kLgZ/agbkRZYBqnnyin+Pp0rbzaCzgdlXwu0gyQ1ItE0UcyuImEXW2oI1LYyWVChVg==
X-Received: by 2002:a19:7419:0:b0:511:79ce:8a01 with SMTP id
 v25-20020a197419000000b0051179ce8a01mr80740lfe.46.1707843469716; 
 Tue, 13 Feb 2024 08:57:49 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXzYw0AJvw1+lot2iI9yjCOzIsrof6tL3ODL9MryRcaI8jxvoMbseu1RZfyozqPLj17pCCXzUvphNkQGvJs8vuz8tXjZZhmjQo06KhqTXktwYVdVAq3ec6E533v6JYIH71bafMvBm598irwzc6QyhhlJ9SyfkE9GYrQYKsupYPbUA==
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 ca23-20020a170906a3d700b00a3caccb8f66sm1456401ejb.44.2024.02.13.08.57.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Feb 2024 08:57:49 -0800 (PST)
Message-ID: <62204be5-9367-4e52-9d25-be9c99a1a856@redhat.com>
Date: Tue, 13 Feb 2024 17:57:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] [v3] drm/nouveau: expose GSP-RM logging buffers via
 debugfs
To: Timur Tabi <ttabi@nvidia.com>
References: <20240212211548.1094496-1-ttabi@nvidia.com>
 <20240212211548.1094496-3-ttabi@nvidia.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
Cc: Dave Airlie <airlied@redhat.com>, Lyude Paul <lyude@redhat.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20240212211548.1094496-3-ttabi@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 2/12/24 22:15, Timur Tabi wrote:
> The LOGINIT, LOGINTR, LOGRM, and LOGPMU buffers are circular buffers
> that have printf-like logs from GSP-RM and PMU encoded in them.
> 
> LOGINIT, LOGINTR, and LOGRM are allocated by Nouveau and their DMA
> addresses are passed to GSP-RM during initialization.  The buffers are
> required for GSP-RM to initialize properly.
> 
> LOGPMU is also allocated by Nouveau, but its contents are updated
> when Nouveau receives an NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT RPC from
> GSP-RM.  Nouveau then copies the RPC to the buffer.
> 
> The messages are encoded as an array of variable-length structures that
> contain the parameters to an NV_PRINTF call.  The format string and
> parameter count are stored in a special ELF image that contains only
> logging strings.  This image is not currently shipped with the Nvidia
> driver.
> 
> There are two methods to extract the logs.
> 
> OpenRM tries to load the logging ELF, and if present, parses the log
> buffers in real time and outputs the strings to the kernel console.
> 
> Alternatively, and this is the method used by this patch, the buffers
> can be exposed to user space, and a user-space tool (along with the
> logging ELF image) can parse the buffer and dump the logs.
> 
> This method has the advantage that it allows the buffers to be parsed
> even when the logging ELF file is not available to the user.  However,
> it has the disadvantage the debubfs entries need to remain until the
> driver is unloaded.
> 
> The buffers are exposed via debugfs.  The debugfs entries must be
> created before GSP-RM is started, to ensure that they are available
> during GSP-RM initialization.
> 
> If GSP-RM fails to initialize, then Nouveau immediately shuts down
> the GSP interface.  This would normally also deallocate the logging
> buffers, thereby preventing the user from capturing the debug logs.
> To avoid this, the keep-gsp-logging command line parameter can be
> specified.  This parmater is marked as *unsafe* (thereby taining the
> kernel) because the DMA buffer and debugfs entries are never
> deallocated, even if the driver unloads.  This gives the user the
> time to capture the logs, but it also means that resources can only
> be recovered by a reboot.
> 
> An end-user can capture the logs using the following commands:
> 
>      cp /sys/kernel/debug/dri/<path>/loginit loginit
>      cp /sys/kernel/debug/dri/<path>/logrm logrm
>      cp /sys/kernel/debug/dri/<path>/logintr logintr
>      cp /sys/kernel/debug/dri/<path>/logpmu logpmu
> 
> where <path> is the PCI ID of the GPU (e.g. 0000:65:00.0).  If
> keep-gsp-logging is specified, then the <path> is the same but with
> -debug appended (e.g. 0000:65:00.0-debug).
> 
> Since LOGPMU is not needed for normal GSP-RM operation, it is only
> created if debugfs is available.  Otherwise, the
> NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT RPCs are ignored.
> 
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
> v3: reworked r535_gsp_libos_debugfs_init, rebased for drm-next
> 
>   .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  12 +
>   .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 215 +++++++++++++++++-
>   2 files changed, 223 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> index 3fbc57b16a05..2ee44bdf8be7 100644
> --- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> +++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> @@ -5,6 +5,8 @@
>   #include <core/falcon.h>
>   #include <core/firmware.h>
>   
> +#include <linux/debugfs.h>
> +
>   #define GSP_PAGE_SHIFT 12
>   #define GSP_PAGE_SIZE  BIT(GSP_PAGE_SHIFT)
>   
> @@ -217,6 +219,16 @@ struct nvkm_gsp {
>   
>   	/* The size of the registry RPC */
>   	size_t registry_rpc_size;
> +
> +	/*
> +	 * Logging buffers in debugfs.  The wrapper objects need to remain
> +	 * in memory until the dentry is deleted.
> +	 */
> +	struct debugfs_blob_wrapper blob_init;
> +	struct debugfs_blob_wrapper blob_intr;
> +	struct debugfs_blob_wrapper blob_rm;
> +	struct debugfs_blob_wrapper blob_pmu;
> +	struct dentry *debugfs_logging_dir;

I think we should not create those from within the nvkm layer, but rather pass
them down through nvkm_device_pci_new().

Lifecycle wise I think we should ensure that removing the Nouveau kernel module
also cleans up those buffers. Even though keep-gsp-logging is considered unsafe,
we shouldn't leak memory.

For instance, can we allocate corresponding buffers in the driver layer, copy
things over and keep those buffers until nouveau_drm_exit()? This would also
avoid exposing those DMA buffers via debugfs.

>   };
>   
>   static inline bool
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> index 86b62c7e1229..56209bf81360 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> @@ -26,6 +26,7 @@
>   #include <subdev/vfn.h>
>   #include <engine/fifo/chan.h>
>   #include <engine/sec2.h>
> +#include <drm/drm_device.h>
>   
>   #include <nvfw/fw.h>
>   
> @@ -1979,6 +1980,196 @@ r535_gsp_rmargs_init(struct nvkm_gsp *gsp, bool resume)
>   	return 0;
>   }
>   
> +#define NV_GSP_MSG_EVENT_UCODE_LIBOS_CLASS_PMU		0xf3d722
> +
> +/**
> + * r535_gsp_msg_libos_print - capture log message from the PMU
> + * @priv: gsp pointer
> + * @fn: function number (ignored)
> + * @repv: pointer to libos print RPC
> + * @repc: message size
> + *
> + * See _kgspRpcUcodeLibosPrint
> + */
> +static int r535_gsp_msg_libos_print(void *priv, u32 fn, void *repv, u32 repc)
> +{
> +	struct nvkm_gsp *gsp = priv;
> +	struct nvkm_subdev *subdev = &gsp->subdev;
> +	struct {
> +		u32 ucodeEngDesc;
> +		u32 libosPrintBufSize;
> +		u8 libosPrintBuf[];
> +	} *rpc = repv;
> +	unsigned int class = rpc->ucodeEngDesc >> 8;
> +
> +	nvkm_debug(subdev, "received libos print from class 0x%x for %u bytes\n",
> +		   class, rpc->libosPrintBufSize);
> +
> +	if (class != NV_GSP_MSG_EVENT_UCODE_LIBOS_CLASS_PMU) {
> +		nvkm_warn(subdev,
> +			  "received libos print from unknown class 0x%x\n",
> +			  class);
> +		return -ENOMSG;
> +	}
> +	if (rpc->libosPrintBufSize > GSP_PAGE_SIZE) {
> +		nvkm_error(subdev, "libos print is too large (%u bytes)\n",
> +			   rpc->libosPrintBufSize);
> +		return -E2BIG;
> +
> +	}
> +	memcpy(gsp->blob_pmu.data, rpc->libosPrintBuf, rpc->libosPrintBufSize);
> +
> +	return 0;
> +}
> +
> +/*
> + * If GSP-RM load fails, then the GSP nvkm object will be deleted, the
> + * logging debugfs entries will be deleted, and it will not be possible to
> + * debug the load failure.  The keep_gsp_logging parameter tells Nouveau
> + * not to free these resources, even if the driver is unloading.  In this
> + * case, the only recovery is a reboot.
> + */
> +static bool keep_gsp_logging;
> +module_param_unsafe(keep_gsp_logging, bool, 0444);
> +MODULE_PARM_DESC(keep_gsp_logging,
> +		 "Do not remove the GSP-RM logging debugfs entries upon exit");
> +
> +/**
> + * r535_gsp_libos_debugfs_init - create logging debugfs entries
> + * @gsp: gsp pointer
> + *
> + * Create the debugfs entries.  This exposes the log buffers to
> + * userspace so that an external tool can parse it.
> + *
> + * The 'logpmu' contains exception dumps from the PMU. It is written via an
> + * RPC sent from GSP-RM and must be only 4KB.  We create it here because it's
> + * only useful if there is a debugfs entry to expose it.  If we get the PMU
> + * logging RPC and there is no debugfs entry, the RPC is just ignored.
> + *
> + * The blob_init, blob_rm, and blob_pmu objects can't be transient
> + * because debugfs_create_blob doesn't copy them.
> + *
> + * NOTE: OpenRM loads the logging elf image and prints the log messages
> + * in real-time. We may add that capability in the future, but that
> + * requires loading an ELF images that are not distributed with the driver,
> + * and adding the parsing code to Nouveau.
> + *
> + * Ideally, this should be part of nouveau_debugfs_init(), but that function
> + * is called too late.  We really want to create these debugfs entries before
> + * r535_gsp_booter_load() is called, so that if GSP-RM fails to initialize,
> + * there could still be a log to capture.
> + *
> + * If the unsafe command line pararameter 'keep-gsp-logging' is specified,
> + * then the logging buffer and debugfs entries will be retained when the
> + * driver shuts down.  This is necessary to debug initialization failures,
> + * because otherwise the buffers will disappear before the logs can be
> + * captured.
> + */
> +static void r535_gsp_libos_debugfs_init(struct nvkm_gsp *gsp)
> +{
> +	struct dentry *dir_init, *dir_intr, *dir_rm, *dir_pmu;
> +	struct dentry *root, *dir;
> +	struct device *dev = gsp->subdev.device->dev;
> +
> +	/*
> +	 * Under normal circumstances, we add our debugfs entries to the dentry
> +	 * created by the DRM layer when the driver registered.  However, this
> +	 * dentry and everything in it is deleted if GSP fails to initialize.
> +	 *
> +	 * If keep-gsp-logging is specified, then a different top-entry dentry
> +	 * is created and that is used.  This dentry is never deleted, even if
> +	 * the driver exits.
> +	 */
> +	if (keep_gsp_logging) {
> +		char temp[64];
> +
> +		/* Find the 'dri' root debugfs entry. Every GPU has a dentry under it */
> +		root = debugfs_lookup("dri", NULL);
> +		if (IS_ERR(root)) {
> +			/* No debugfs, or no root dentry for DRM */
> +			return;
> +		}
> +
> +		scnprintf(temp, sizeof(temp), "%s-debug", dev_name(dev));
> +		dir = debugfs_create_dir(temp, root);
> +		dput(root);
> +		if (IS_ERR(dir)) {
> +			nvkm_error(&gsp->subdev,
> +				"failed to create %s debugfs entry\n", temp);
> +			return;
> +		}
> +
> +		gsp->debugfs_logging_dir = dir;
> +	} else {
> +		/* Each GPU has a subdir based on its device name, so find it */
> +		struct drm_device *drm_dev = dev_get_drvdata(dev);
> +
> +		if (!drm_dev || !drm_dev->debugfs_root) {
> +			nvkm_error(&gsp->subdev, "could not find debugfs path\n");
> +			return;
> +		}
> +
> +		dir = drm_dev->debugfs_root;
> +	}
> +
> +	gsp->blob_init.data = gsp->loginit.data;
> +	gsp->blob_init.size = gsp->loginit.size;
> +	gsp->blob_intr.data = gsp->logintr.data;
> +	gsp->blob_intr.size = gsp->logintr.size;
> +	gsp->blob_rm.data = gsp->logrm.data;
> +	gsp->blob_rm.size = gsp->logrm.size;
> +
> +	/*
> +	 * Since the PMU buffer is copied from an RPC, it doesn't need to be
> +	 * a DMA buffer.
> +	 */
> +	gsp->blob_pmu.size = GSP_PAGE_SIZE;
> +	gsp->blob_pmu.data = kzalloc(gsp->blob_pmu.size, GFP_KERNEL);
> +	if (!gsp->blob_pmu.data)
> +		goto error;
> +
> +	dir_init = debugfs_create_blob("loginit", 0444, dir, &gsp->blob_init);
> +	if (IS_ERR(dir_init)) {
> +		nvkm_error(&gsp->subdev, "failed to create loginit debugfs entry\n");
> +		goto error;
> +	}
> +
> +	dir_intr = debugfs_create_blob("logintr", 0444, dir, &gsp->blob_intr);
> +	if (IS_ERR(dir_intr)) {
> +		nvkm_error(&gsp->subdev, "failed to create logintr debugfs entry\n");
> +		goto error;
> +	}
> +
> +	dir_rm = debugfs_create_blob("logrm", 0444, dir, &gsp->blob_rm);
> +	if (IS_ERR(dir_rm)) {
> +		nvkm_error(&gsp->subdev, "failed to create logrm debugfs entry\n");
> +		goto error;
> +	}
> +
> +	dir_pmu = debugfs_create_blob("logpmu", 0444, dir, &gsp->blob_pmu);
> +	if (IS_ERR(dir_pmu)) {
> +		nvkm_error(&gsp->subdev, "failed to create logpmu debugfs entry\n");
> +		goto error;
> +	}
> +
> +	i_size_write(d_inode(dir_init), gsp->blob_init.size);
> +	i_size_write(d_inode(dir_intr), gsp->blob_intr.size);
> +	i_size_write(d_inode(dir_rm), gsp->blob_rm.size);
> +	i_size_write(d_inode(dir_pmu), gsp->blob_pmu.size);
> +
> +	r535_gsp_msg_ntfy_add(gsp, 0x0000100C, r535_gsp_msg_libos_print, gsp);
> +
> +	nvkm_debug(&gsp->subdev, "created debugfs GSP-RM logging entries\n");
> +	return;
> +
> +error:
> +	debugfs_remove(gsp->debugfs_logging_dir);
> +	gsp->debugfs_logging_dir = NULL;
> +
> +	kfree(gsp->blob_pmu.data);
> +	gsp->blob_pmu.data = NULL;
> +}
> +
>   static inline u64
>   r535_gsp_libos_id8(const char *name)
>   {
> @@ -2029,7 +2220,11 @@ static void create_pte_array(u64 *ptes, dma_addr_t addr, size_t size)
>    * written to directly by GSP-RM and can be any multiple of GSP_PAGE_SIZE.
>    *
>    * The physical address map for the log buffer is stored in the buffer
> - * itself, starting with offset 1. Offset 0 contains the "put" pointer.
> + * itself, starting with offset 1. Offset 0 contains the "put" pointer (pp).
> + * Initially, pp is equal to 0.  If the buffer has valid logging data in it,
> + * then pp points to index into the buffer where the next logging entry will
> + * be written.  Therefore, the logging data is valid if:
> + *   1 <= pp < sizeof(buffer)/sizeof(u64)
>    *
>    * The GSP only understands 4K pages (GSP_PAGE_SIZE), so even if the kernel is
>    * configured for a larger page size (e.g. 64K pages), we need to give
> @@ -2100,6 +2295,9 @@ r535_gsp_libos_init(struct nvkm_gsp *gsp)
>   	args[3].size = gsp->rmargs.size;
>   	args[3].kind = LIBOS_MEMORY_REGION_CONTIGUOUS;
>   	args[3].loc  = LIBOS_MEMORY_REGION_LOC_SYSMEM;
> +
> +	r535_gsp_libos_debugfs_init(gsp);
> +
>   	return 0;
>   }
>   
> @@ -2404,9 +2602,18 @@ r535_gsp_dtor(struct nvkm_gsp *gsp)
>   	r535_gsp_dtor_fws(gsp);
>   
>   	nvkm_gsp_mem_dtor(gsp, &gsp->shm.mem);
> -	nvkm_gsp_mem_dtor(gsp, &gsp->loginit);
> -	nvkm_gsp_mem_dtor(gsp, &gsp->logintr);
> -	nvkm_gsp_mem_dtor(gsp, &gsp->logrm);
> +
> +	if (keep_gsp_logging && gsp->debugfs_logging_dir)
> +		nvkm_warn(&gsp->subdev,
> +			"GSP-RM logging buffers retained, reboot required to recover\n");
> +	else {
> +		kfree(gsp->blob_pmu.data);
> +		gsp->blob_pmu.data = NULL;
> +
> +		nvkm_gsp_mem_dtor(gsp, &gsp->loginit);
> +		nvkm_gsp_mem_dtor(gsp, &gsp->logintr);
> +		nvkm_gsp_mem_dtor(gsp, &gsp->logrm);
> +	}
>   }
>   
>   int

