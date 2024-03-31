Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00275892F28
	for <lists+dri-devel@lfdr.de>; Sun, 31 Mar 2024 10:44:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4244510E9A8;
	Sun, 31 Mar 2024 08:44:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ds6Ij5Ep";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F4BB10E9A0
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Mar 2024 08:44:34 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4148c6132b4so23546445e9.1
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Mar 2024 01:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711874672; x=1712479472; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=C2gqY2xVgjiqYd3plRFeW5FJATNTaLEJOUnLK54AS+4=;
 b=ds6Ij5EpUcNMvVaXc+KfmjxuuVovVN6a8gm07wgTWrEt94fT55/H7IQK3HkoilttcJ
 12XJGz+3v+5Y4Yf6fg/04xXq2UBJYBU25iYGTtKRXRTGyTpnU7RwhehMnknuwRN1+qiq
 crhEbKpywvlVWlZqaTLgRKgxIlaENF55ujaiWF5w/aYDDUiLTH8VEbCVMQkke5sxdZR4
 m/DgxHICVsFBxK7OAPYkj3X9R2XOEwpVL9Y8aT2Ny/Fh+HWRVQja3Rvql46ITP+vO6Uj
 fH1esxrBtc1alyHiPN2MLCMyl5YoE1oFTrRbaxOP72+Z7FL56wT+k5hi6io6kfynitiw
 oDjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711874672; x=1712479472;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C2gqY2xVgjiqYd3plRFeW5FJATNTaLEJOUnLK54AS+4=;
 b=atcQwSfz8BC+vLss6U1tcaixltggtZG7V3TVfpnqDEfk19APkvSf0Fiug0Aok7MYQ2
 Gh2z1Q3ic+HqtSr4mxNYqudmn5XyoqjH7/DOibQ8JiOMQ2Bw4dys1mHQdY5m8X887P3C
 0c19tUSEdjCaaSo19EU1ultdidmx8R2wQ23A4NQ7uvI63pHSywShCf3NIPRNDudI8rWm
 8Tyl93EsjiSxt3I0R8vdbeJvZstzHDib5U3izJbZoMV6eQba1378tpZlAMk/mlSb6Ohh
 /5aGrt5E/CBJo2xlKfz3wz4MfcxVj+XJlaH1R5ObfBWb9zAheDgeGzRHqlW1J5r3Ati+
 u+zQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+EMb3PKo5kTqqDgvSwsuwM4GqlHRRwwpnc1TwsHn6wc/+uoCk0xG/8kCr9JkBrq5zofuXnY1+i02FBlPeAWDLpwZu/eqPUHR8BtyN6h5a
X-Gm-Message-State: AOJu0YwuMaEflZu3awBcGCAlJoqmpHyWMuzIIjnFQ2Ml0bZSS8+XXtc0
 pPJOdv651CXESy4IWgULUeKuIg/koF11tF0xVo00UsxXYFnoKfHfNhFfYVsazkc=
X-Google-Smtp-Source: AGHT+IFxLkTASaVlM+54K0R8k1ijktRvGP8npYlgKOHWvCMgwx6bYbCzbUX+6nbz+A1gBdO+Q97GFQ==
X-Received: by 2002:adf:f287:0:b0:33e:c91b:9083 with SMTP id
 k7-20020adff287000000b0033ec91b9083mr7888273wro.16.1711874672351; 
 Sun, 31 Mar 2024 01:44:32 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16]) by smtp.gmail.com with ESMTPSA id
 k17-20020adff5d1000000b00341b7388dafsm8436003wrp.77.2024.03.31.01.44.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Mar 2024 01:44:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 31 Mar 2024 10:43:48 +0200
Subject: [PATCH v2 01/25] virtio: store owner from modules with
 register_virtio_driver()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240331-module-owner-virtio-v2-1-98f04bfaf46a@linaro.org>
References: <20240331-module-owner-virtio-v2-0-98f04bfaf46a@linaro.org>
In-Reply-To: <20240331-module-owner-virtio-v2-0-98f04bfaf46a@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jonathan Corbet <corbet@lwn.net>, 
 David Hildenbrand <david@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Jens Axboe <axboe@kernel.dk>, Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, Amit Shah <amit@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Gonglei <arei.gonglei@huawei.com>, "David S. Miller" <davem@davemloft.net>, 
 Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Viresh Kumar <vireshk@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, David Airlie <airlied@redhat.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Jean-Philippe Brucker <jean-philippe@linaro.org>, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Alexander Graf <graf@amazon.com>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Eric Van Hensbergen <ericvh@kernel.org>, 
 Latchesar Ionkov <lucho@ionkov.net>, 
 Dominique Martinet <asmadeus@codewreck.org>, 
 Christian Schoenebeck <linux_oss@crudebyte.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Kalle Valo <kvalo@kernel.org>, 
 Dan Williams <dan.j.williams@intel.com>, 
 Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
 Ira Weiny <ira.weiny@intel.com>, 
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 "James E.J. Bottomley" <jejb@linux.ibm.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Vivek Goyal <vgoyal@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>, 
 Anton Yakovlev <anton.yakovlev@opensynergy.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: virtualization@lists.linux.dev, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-um@lists.infradead.org, 
 linux-block@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 iommu@lists.linux.dev, netdev@vger.kernel.org, v9fs@lists.linux.dev, 
 kvm@vger.kernel.org, linux-wireless@vger.kernel.org, nvdimm@lists.linux.dev, 
 linux-remoteproc@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, alsa-devel@alsa-project.org, 
 linux-sound@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3442;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=s2Mj8PFVzHUnyWBxfjg5SBZxGZiBlbDBzv7Dx2i8dmM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCSJRMAmo958+gpAdtWf3kAKomp/Ip2aKL9xIN
 Z2BywqkB02JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgkiUQAKCRDBN2bmhouD
 189/EACR/B93stOdtu1JuyUNz4OfxjEk8+PI7wALF2CF8wWyUnX1RqIit4KjtyGpz8IU3wUEOGC
 vvkRH4dWkO4VfbeaYOXrYCQdMtciljn9VQceUtxxpKYZBYDzBXmVArj0/iUj0cb4OBc8fkXvRKi
 EMTUUcWHJmLIGJvNMN2U4I6qMRSWnpXQAhX5lCoswuE+s9DonLiw+Lv9tFBK/PSWTPZW3CTTOg3
 1s6rfpzJpnBxFSTQESh7M1dqpE/85wG8AQoXS/wEZ3AuZTxQbzWxvlymDKo4/D8Zsruaa5cw3mq
 tmRGWN5AzZOqbZ34CYnxq3SBAjVb/gW8+Bq/PbwZhNYAWM2Rb6QMKUq9n00JqZUc7NwfeT57fO0
 6ThiLflUllCHlXzO3VCJooih8+6jhemlv0kSariKz4FEJT//EvDmPMw3zRoQbOdeL2prM2sDXz7
 /HCfa04XqJo02JCSS6z3UOMhKyYdESZgy5fqIiutQuKa09AosUkF0rxKZPoBmaaFPSFelMb5gPY
 kKJaRfbDPV9OOzskHs6efccitB2qx+s4OAVyPIlY5M1M0HEIrYNxHMrylwffbNYJwLfel3k30m3
 iAlSeTFkTWrNk/60McW6xVUexB2Kej+RFiAZDn5U6Fs0RtBNfrg6d/X8YVYB7llg9va+5h7WabZ
 kUag/9PjoTLwGPA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Modules registering driver with register_virtio_driver() might forget to
set .owner field.  i2c-virtio.c for example has it missing.  The field
is used by some of other kernel parts for reference counting
(try_module_get()), so it is expected that drivers will set it.

Solve the problem by moving this task away from the drivers to the core
virtio code, just like we did for platform_driver in
commit 9447057eaff8 ("platform_device: use a macro instead of
platform_driver_register").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/driver-api/virtio/writing_virtio_drivers.rst | 1 -
 drivers/virtio/virtio.c                                    | 6 ++++--
 include/linux/virtio.h                                     | 7 +++++--
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/Documentation/driver-api/virtio/writing_virtio_drivers.rst b/Documentation/driver-api/virtio/writing_virtio_drivers.rst
index e14c58796d25..e5de6f5d061a 100644
--- a/Documentation/driver-api/virtio/writing_virtio_drivers.rst
+++ b/Documentation/driver-api/virtio/writing_virtio_drivers.rst
@@ -97,7 +97,6 @@ like this::
 
 	static struct virtio_driver virtio_dummy_driver = {
 		.driver.name =  KBUILD_MODNAME,
-		.driver.owner = THIS_MODULE,
 		.id_table =     id_table,
 		.probe =        virtio_dummy_probe,
 		.remove =       virtio_dummy_remove,
diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
index f173587893cb..9510c551dce8 100644
--- a/drivers/virtio/virtio.c
+++ b/drivers/virtio/virtio.c
@@ -362,14 +362,16 @@ static const struct bus_type virtio_bus = {
 	.remove = virtio_dev_remove,
 };
 
-int register_virtio_driver(struct virtio_driver *driver)
+int __register_virtio_driver(struct virtio_driver *driver, struct module *owner)
 {
 	/* Catch this early. */
 	BUG_ON(driver->feature_table_size && !driver->feature_table);
 	driver->driver.bus = &virtio_bus;
+	driver->driver.owner = owner;
+
 	return driver_register(&driver->driver);
 }
-EXPORT_SYMBOL_GPL(register_virtio_driver);
+EXPORT_SYMBOL_GPL(__register_virtio_driver);
 
 void unregister_virtio_driver(struct virtio_driver *driver)
 {
diff --git a/include/linux/virtio.h b/include/linux/virtio.h
index b0201747a263..26c4325aa373 100644
--- a/include/linux/virtio.h
+++ b/include/linux/virtio.h
@@ -170,7 +170,7 @@ size_t virtio_max_dma_size(const struct virtio_device *vdev);
 
 /**
  * struct virtio_driver - operations for a virtio I/O driver
- * @driver: underlying device driver (populate name and owner).
+ * @driver: underlying device driver (populate name).
  * @id_table: the ids serviced by this driver.
  * @feature_table: an array of feature numbers supported by this driver.
  * @feature_table_size: number of entries in the feature table array.
@@ -208,7 +208,10 @@ static inline struct virtio_driver *drv_to_virtio(struct device_driver *drv)
 	return container_of(drv, struct virtio_driver, driver);
 }
 
-int register_virtio_driver(struct virtio_driver *drv);
+/* use a macro to avoid include chaining to get THIS_MODULE */
+#define register_virtio_driver(drv) \
+	__register_virtio_driver(drv, THIS_MODULE)
+int __register_virtio_driver(struct virtio_driver *drv, struct module *owner);
 void unregister_virtio_driver(struct virtio_driver *drv);
 
 /* module_virtio_driver() - Helper macro for drivers that don't do

-- 
2.34.1

