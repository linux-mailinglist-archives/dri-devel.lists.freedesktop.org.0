Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA07892F24
	for <lists+dri-devel@lfdr.de>; Sun, 31 Mar 2024 10:44:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B58210E99D;
	Sun, 31 Mar 2024 08:44:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eeEC/ZGL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7D9010E1D1
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Mar 2024 08:44:29 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4155bdc0bc5so3566785e9.3
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Mar 2024 01:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711874668; x=1712479468; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2sqUaJ3F0oIXdnezjdx4l/HGQrEHUiJM730gZB0fIbE=;
 b=eeEC/ZGLg/QDV1q1NtlMNb7WSI3JLS3VIl9VxdH2OPXDz397FQgnfHtNZnph/1kmB/
 zW3hiOPhr0EnfpHaAuj84eSZST6W7rXhC4MR3UuMCNeoe5e+SK0pvUyuwkCw1XGGZjlJ
 iPw3VYMgVwf9A7m4mwnbYfIBNc1yP1gmHW7F7pmR/4JQH3LxvT3AYT/wgUVTgwl1NCLZ
 aoeg3ouTMSoAgfpetfyA+PLJdq6yhKkYGHJvPz15bZ4G4LRTHP8GuZ7cmzmwcmnDJ9GD
 yczk47xKS9yyW4kc5Dx6GI6ETJfWEat5keTc/ODOKLroPAKxs5ZrDICja02pAL28xfhw
 Nyzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711874668; x=1712479468;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2sqUaJ3F0oIXdnezjdx4l/HGQrEHUiJM730gZB0fIbE=;
 b=bR07Foq2HSbfvXWJG2YXv7X1vmPjZjxBFJmTTTTXMeJGoS044D5CZ5du+Kq3jf9752
 mVnGBLUyT9WKuPr5R1jleH8G4y5hGfiyeUB2JhVUKFTtaOsOumbTCj+uS97/2HWxnLOq
 sPUN1C/E+diC0L3WNJ9zX26ahJMseMwG1rLlDEOdvezcqceer2VDQaydPCN09hYfAfZf
 SkMeM8WwVixbvKklB0kmjD9dgxXymT6czaIIB3/fu7Mp1RBQe4DA5sFkSooTtuKVRk+U
 aRa0Q7aDHBo918ZoIEhG3Vfd5ZNwiJq/w/tZpTMASuEl1MUtAaA+PtAYD8995aebV1qm
 gg0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFI79tc1bAhVX28M1JvIG1hRjMYhqLUPQKtae99agF2X+WPN/dD08EcJNO0LR1ET5zFuJer9JS6FnwtU0yaXlNzEoYpTDfoUo4MVbA1uav
X-Gm-Message-State: AOJu0YxJvQMyF6Z5WSmymTNfcAzHQpueJ+YMvbd1f07lD5QCUqdgSGm4
 W5tnEf6HwUyIuKGiM7mWWbXsbdPfztQD5B5zZsa/NNLhURDMLRsxV4ACeHwLTjI=
X-Google-Smtp-Source: AGHT+IGRtVdiB0tbOSLfOXovtwdG5H9mbUjwpU0tBzceuiXLquDRXJG/+3RcRx7InUOrbUq4kV2O/A==
X-Received: by 2002:a05:600c:4fc3:b0:414:894b:df65 with SMTP id
 o3-20020a05600c4fc300b00414894bdf65mr4484011wmq.3.1711874667865; 
 Sun, 31 Mar 2024 01:44:27 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16]) by smtp.gmail.com with ESMTPSA id
 k17-20020adff5d1000000b00341b7388dafsm8436003wrp.77.2024.03.31.01.44.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Mar 2024 01:44:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 00/25] virtio: store owner from modules with
 register_virtio_driver()
Date: Sun, 31 Mar 2024 10:43:47 +0200
Message-Id: <20240331-module-owner-virtio-v2-0-98f04bfaf46a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEMiCWYC/32NQQ6CMBBFr0Jm7ZhSkAZX3sOwqDCFSbA1U6waw
 t2tHMDle8l/f4VIwhThXKwglDhy8Bn0oYB+sn4k5CEzaKVrVWmD9zA8Z8Lw8iSYWBYOeKob01S
 3qrdaQ14+hBy/9+q1yzxxXIJ89pNU/uz/XipRoXLknL0ZM7TtZWZvJRyDjNBt2/YFCNOSuLcAA
 AA=
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3968;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=RbNxoqlZdgy0nYNI8rhm+31pAchfQHzLu9REkEdnoxY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCSJOfbLDaNdnK7LZ1sjz9p0nKU8yjNOYDTxRF
 4/5FYB++7yJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgkiTgAKCRDBN2bmhouD
 16xfD/sGCutGIoRx2mgC/Hzc5lMgoTczIXo0qN8pbpswO/nFngNxF2adSq55q9CTUzlGZru9bWH
 cNigDmSXMrSx7sM5ybz4qcmCMyehu+O7U8aOA8tW+erFZAOR0aUfLcQqpLPDYLI7hHQ63O8I7Xj
 VtJUMKdpfYuqQseiDryzJ7zX7vXMTLSRsMPlVp19sEGgRGa3gqRZv83c766vMP83MLwQxLpK4Z0
 fC4BciD8EYSau1CqSlwHVw0CKNFS+3fOE+eUbMU1/MDg7uNVJhh1g8G4k1IwOMn5an8AH7S3jst
 Yv6WIreS8LWUyj8KK7ZYISf6/5LWFfQOhTtEUtxJUKYX8x4eYhd3Chzc4as2k6CKZJJLNUufHXk
 29XnqUetqiy8dO89GrEG833CGg8DZS69bEER9EIFBUp6npPkX2mRYhs6C2jOw/+HMrrhFRYuj0b
 90GkjTaKji3hfg/b20jvDdu8F30M0jhl238jJQ6wc/ehq9fr9tSOnT8crROsB1fo7GJ0QK5fUA4
 WiGXRrSwF3LgXEqkYWW4FeVmFB4V8uRr3ouRwdLMwRe4mHe2iV5MXhs+XE7nzazEStXPgvNetGF
 ctJR56fkmyU2W1CRwSQNwxkotC5tYJYs6mW3MbY0xjCNZ5ya5KBoG/F48Dd8KQpSIKmpQVamNr9
 jmD2MP/z6d7uUdg==
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

Changes in v2:
- Three new patches: virtio mem+input+balloon
- Minor commit msg adjustments
- Add tags
- Link to v1: https://lore.kernel.org/r/20240327-module-owner-virtio-v1-0-0feffab77d99@linaro.org

Merging
=======
All further patches depend on the first virtio patch, therefore please ack
and this should go via one tree: maybe virtio?

Description
===========
Modules registering driver with register_virtio_driver() often forget to
set .owner field.

Solve the problem by moving this task away from the drivers to the core
virtio code, just like we did for platform_driver in commit
9447057eaff8 ("platform_device: use a macro instead of
platform_driver_register").

Best regards,
Krzysztof

---
Krzysztof Kozlowski (25):
      virtio: store owner from modules with register_virtio_driver()
      virtio: balloon: drop owner assignment
      virtio: input: drop owner assignment
      virtio: mem: drop owner assignment
      um: virt-pci: drop owner assignment
      virtio_blk: drop owner assignment
      bluetooth: virtio: drop owner assignment
      hwrng: virtio: drop owner assignment
      virtio_console: drop owner assignment
      crypto: virtio - drop owner assignment
      firmware: arm_scmi: virtio: drop owner assignment
      gpio: virtio: drop owner assignment
      drm/virtio: drop owner assignment
      iommu: virtio: drop owner assignment
      misc: nsm: drop owner assignment
      net: caif: virtio: drop owner assignment
      net: virtio: drop owner assignment
      net: 9p: virtio: drop owner assignment
      vsock/virtio: drop owner assignment
      wifi: mac80211_hwsim: drop owner assignment
      nvdimm: virtio_pmem: drop owner assignment
      rpmsg: virtio: drop owner assignment
      scsi: virtio: drop owner assignment
      fuse: virtio: drop owner assignment
      sound: virtio: drop owner assignment

 Documentation/driver-api/virtio/writing_virtio_drivers.rst | 1 -
 arch/um/drivers/virt-pci.c                                 | 1 -
 drivers/block/virtio_blk.c                                 | 1 -
 drivers/bluetooth/virtio_bt.c                              | 1 -
 drivers/char/hw_random/virtio-rng.c                        | 1 -
 drivers/char/virtio_console.c                              | 2 --
 drivers/crypto/virtio/virtio_crypto_core.c                 | 1 -
 drivers/firmware/arm_scmi/virtio.c                         | 1 -
 drivers/gpio/gpio-virtio.c                                 | 1 -
 drivers/gpu/drm/virtio/virtgpu_drv.c                       | 1 -
 drivers/iommu/virtio-iommu.c                               | 1 -
 drivers/misc/nsm.c                                         | 1 -
 drivers/net/caif/caif_virtio.c                             | 1 -
 drivers/net/virtio_net.c                                   | 1 -
 drivers/net/wireless/virtual/mac80211_hwsim.c              | 1 -
 drivers/nvdimm/virtio_pmem.c                               | 1 -
 drivers/rpmsg/virtio_rpmsg_bus.c                           | 1 -
 drivers/scsi/virtio_scsi.c                                 | 1 -
 drivers/virtio/virtio.c                                    | 6 ++++--
 drivers/virtio/virtio_balloon.c                            | 1 -
 drivers/virtio/virtio_input.c                              | 1 -
 drivers/virtio/virtio_mem.c                                | 1 -
 fs/fuse/virtio_fs.c                                        | 1 -
 include/linux/virtio.h                                     | 7 +++++--
 net/9p/trans_virtio.c                                      | 1 -
 net/vmw_vsock/virtio_transport.c                           | 1 -
 sound/virtio/virtio_card.c                                 | 1 -
 27 files changed, 9 insertions(+), 30 deletions(-)
---
base-commit: 7fdcff3312e16ba8d1419f8a18f465c5cc235ecf
change-id: 20240327-module-owner-virtio-546763b3ca22

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

