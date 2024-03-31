Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BBE893170
	for <lists+dri-devel@lfdr.de>; Sun, 31 Mar 2024 13:20:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B277010E400;
	Sun, 31 Mar 2024 11:20:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YmVzaw01";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A735F10E400
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Mar 2024 11:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1711884041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZAFJ+0SeTqdsqNS6GC0N4AccV7yeFgGXHpRB2cwbNo4=;
 b=YmVzaw01L6wP0YrHVQehlPiCzbihX9iqYaBOvQPOeQKqqegaZX5Dh8N/Yrs6+803f/aL2t
 5kVOXpMltgtWJNl2RXl5UJ6fVnLNA01C1cbyjPUBGyOAdwQmZlSu9Yms3zWAMooawf7UOC
 QmYb7UPnglwB1SCEyLtFpA/ydPN6fSY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-279-zklcY1VTMTWydAnX3i9l8A-1; Sun, 31 Mar 2024 07:20:35 -0400
X-MC-Unique: zklcY1VTMTWydAnX3i9l8A-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-41481ad9364so21227085e9.0
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Mar 2024 04:20:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711884034; x=1712488834;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZAFJ+0SeTqdsqNS6GC0N4AccV7yeFgGXHpRB2cwbNo4=;
 b=lZ3FeShCMB59cCgXYEneWFlh2jRlzbUDf7ZIZpJMX8FaydkOTwgGGuipWKjFz/bY1f
 GaQKk+YM0mW2MHTdmyxxnCw5ifzX2r1RExibY8T43YE4dqk7bN6HtWLYaVXzfbM7PZck
 6JrjUXU1i3uj4V9PA35KBDyRdVK+xER946vpPdYCgIQsfzkjJ9hF3WmVMKDW96ozMxF9
 HqXcnDcnABuFXowj8403/4TgsDvSDj9Y3+n31biJ4Gio2u3Rp0anysZPZRfDwWSte2rH
 BLqfz+yUqeBR9+8oUwL6H0wz8WOFQC85X4of7b6DtzHzOzG6S37XyCq1brAvDS13HHgL
 HhJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUC2IuHilg0Rbzq78crAJXo4+U5OGspndHDzcDDq9f/XFNYWwSmF2XXvNiO+09h+NivbammoOC4SgG9fEG21yJQyZLUVxXq1PYycb8l636u
X-Gm-Message-State: AOJu0YzL2d9swkiCDR3jU3DLCKUUgzBdWY2pLOHYbkIYlPy5L9zpXHg7
 Q2lqmNgfBHxS9E9R7XUoiZnUz3OuViRAg7mgmRsPQ9lVuLcr0EKqLHW2MnC7xKrl9ekmnKhEEo7
 2RLLfQnSuftlkBWZ4fJYpQh+uIJ0pbWwgdJw4wkj5Qq32DPpgJHtFCM4Xc+vZuYfQ9w==
X-Received: by 2002:a05:600c:220f:b0:413:e19:337f with SMTP id
 z15-20020a05600c220f00b004130e19337fmr6115862wml.22.1711884034569; 
 Sun, 31 Mar 2024 04:20:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhoN6xvj4jps7JZJhPCGbovoaf04BQIV4BBUP7925nSfWx1HPIV5PQzN7Ku2MIo02ql2sOQw==
X-Received: by 2002:a05:600c:220f:b0:413:e19:337f with SMTP id
 z15-20020a05600c220f00b004130e19337fmr6115845wml.22.1711884033951; 
 Sun, 31 Mar 2024 04:20:33 -0700 (PDT)
Received: from redhat.com ([2a02:14f:173:c52c:ce6f:ec9c:ca7c:7200])
 by smtp.gmail.com with ESMTPSA id
 u22-20020a05600c139600b004148d7b889asm14465567wmf.8.2024.03.31.04.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Mar 2024 04:20:33 -0700 (PDT)
Date: Sun, 31 Mar 2024 07:20:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: virtualization@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-um@lists.infradead.org,
 linux-block@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org,
 iommu@lists.linux.dev, netdev@vger.kernel.org, v9fs@lists.linux.dev,
 kvm@vger.kernel.org, linux-wireless@vger.kernel.org,
 nvdimm@lists.linux.dev, linux-remoteproc@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 01/22] virtio: store owner from modules with
 register_virtio_driver()
Message-ID: <20240331071546-mutt-send-email-mst@kernel.org>
References: <20240327-module-owner-virtio-v1-0-0feffab77d99@linaro.org>
 <20240327-module-owner-virtio-v1-1-0feffab77d99@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20240327-module-owner-virtio-v1-1-0feffab77d99@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 27, 2024 at 01:40:54PM +0100, Krzysztof Kozlowski wrote:
> Modules registering driver with register_virtio_driver() might forget to
> set .owner field.  i2c-virtio.c for example has it missing.  The field
> is used by some of other kernel parts for reference counting
> (try_module_get()), so it is expected that drivers will set it.
> 
> Solve the problem by moving this task away from the drivers to the core
> amba bus code, just like we did for platform_driver in
> commit 9447057eaff8 ("platform_device: use a macro instead of
> platform_driver_register").
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>



This makes sense. So this will be:

Fixes: 3cfc88380413 ("i2c: virtio: add a virtio i2c frontend driver")
Cc: "Jie Deng" <jie.deng@intel.com>

and I think I will pick this patch for this cycle to fix
the bug. The cleanups can go in the next cycle.


> ---
>  Documentation/driver-api/virtio/writing_virtio_drivers.rst | 1 -
>  drivers/virtio/virtio.c                                    | 6 ++++--
>  include/linux/virtio.h                                     | 7 +++++--
>  3 files changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/driver-api/virtio/writing_virtio_drivers.rst b/Documentation/driver-api/virtio/writing_virtio_drivers.rst
> index e14c58796d25..e5de6f5d061a 100644
> --- a/Documentation/driver-api/virtio/writing_virtio_drivers.rst
> +++ b/Documentation/driver-api/virtio/writing_virtio_drivers.rst
> @@ -97,7 +97,6 @@ like this::
>  
>  	static struct virtio_driver virtio_dummy_driver = {
>  		.driver.name =  KBUILD_MODNAME,
> -		.driver.owner = THIS_MODULE,
>  		.id_table =     id_table,
>  		.probe =        virtio_dummy_probe,
>  		.remove =       virtio_dummy_remove,
> diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
> index f173587893cb..9510c551dce8 100644
> --- a/drivers/virtio/virtio.c
> +++ b/drivers/virtio/virtio.c
> @@ -362,14 +362,16 @@ static const struct bus_type virtio_bus = {
>  	.remove = virtio_dev_remove,
>  };
>  
> -int register_virtio_driver(struct virtio_driver *driver)
> +int __register_virtio_driver(struct virtio_driver *driver, struct module *owner)
>  {
>  	/* Catch this early. */
>  	BUG_ON(driver->feature_table_size && !driver->feature_table);
>  	driver->driver.bus = &virtio_bus;
> +	driver->driver.owner = owner;
> +
>  	return driver_register(&driver->driver);
>  }
> -EXPORT_SYMBOL_GPL(register_virtio_driver);
> +EXPORT_SYMBOL_GPL(__register_virtio_driver);
>  
>  void unregister_virtio_driver(struct virtio_driver *driver)
>  {
> diff --git a/include/linux/virtio.h b/include/linux/virtio.h
> index b0201747a263..26c4325aa373 100644
> --- a/include/linux/virtio.h
> +++ b/include/linux/virtio.h
> @@ -170,7 +170,7 @@ size_t virtio_max_dma_size(const struct virtio_device *vdev);
>  
>  /**
>   * struct virtio_driver - operations for a virtio I/O driver
> - * @driver: underlying device driver (populate name and owner).
> + * @driver: underlying device driver (populate name).
>   * @id_table: the ids serviced by this driver.
>   * @feature_table: an array of feature numbers supported by this driver.
>   * @feature_table_size: number of entries in the feature table array.
> @@ -208,7 +208,10 @@ static inline struct virtio_driver *drv_to_virtio(struct device_driver *drv)
>  	return container_of(drv, struct virtio_driver, driver);
>  }
>  
> -int register_virtio_driver(struct virtio_driver *drv);
> +/* use a macro to avoid include chaining to get THIS_MODULE */
> +#define register_virtio_driver(drv) \
> +	__register_virtio_driver(drv, THIS_MODULE)
> +int __register_virtio_driver(struct virtio_driver *drv, struct module *owner);
>  void unregister_virtio_driver(struct virtio_driver *drv);
>  
>  /* module_virtio_driver() - Helper macro for drivers that don't do
> 
> -- 
> 2.34.1

