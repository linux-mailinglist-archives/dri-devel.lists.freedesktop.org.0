Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A456677B1A
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 13:38:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE1C610E486;
	Mon, 23 Jan 2023 12:38:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0936810E486
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 12:38:05 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id bk16so10643750wrb.11
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 04:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=i9phcZUG9auLg0bxKIvGJannf7qVnTDPudwSDuLifXA=;
 b=VjvRJ6+FeMUv4R98Vg80kPUFvb3t4rOGG2L0n/BvBl++NQHpd83iX83lHSHjkapSY7
 XoHf2p7Zkx1XKYXOZiynZSPQHkFrYePAj/+o7gd99Mkvpq5zSJZS3h4o4PqmFPWvkyJ3
 bFtMfzAzaJ1R6lm/QrkQrjYSE6e3/V0Ipo0VBu31QY57Gsr+9/3fNrCshzCg6k8uqBLb
 dr0F0hmzqTGEHp5Mq4azBOxxQZdWuaFQX5rENuH8WAXneVMoDOiKSnr58lQCNoE5zWxQ
 8zaVgsPligmMhL1FG5AtQ3RS/q+/4uNdWPNIDxpkA0Yzbm1Ta6BC3apzW5zPQHjxhRqc
 O6OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i9phcZUG9auLg0bxKIvGJannf7qVnTDPudwSDuLifXA=;
 b=NwgYdfLY4eriHbBLcxhIdoAzRhD4z6+LwB7bAVWv3Ieq70MzNP4V9619lG/dSmo/Yi
 +aUe4Gt0gG50LWXKNuMBgTN/6NieSyZXqaLmVjdXJQalRVFEuqHGHExhfMcZvygCqAqg
 Ouo3JlSuWKxVDI9Fr0+yAhxA7dhm1K/r1RQpq/e0SG+u3th5KUjRfKnTNXeMp3vBULy2
 Ws5yhPp9vppg0LMVtNfBRH84PtCw92ZDuvYDq2lVAcm/nG3ZMVYfqJjzpNrpdn5u6V3k
 JST0b3el05kTl5HU0cCgCvVZlIgEivjWOnoYIRWem/JTJYZdzAmGkFsfwlu5Po3bUuG3
 HE6w==
X-Gm-Message-State: AFqh2kpb5qE3rfYBt3zl2Xfkr0lb1jD0ceHbLI5MC4y5iAVHf7Y1DSwI
 foFynnqe39y5SGgdXxH2ilQ=
X-Google-Smtp-Source: AMrXdXtI/73PQmywuJOsSpQBR5sFyd6fzwCCApfuw/gzzfctaoucA/oesi0FCWUDars87FaJ7ZSjLg==
X-Received: by 2002:adf:f689:0:b0:2bd:d095:5590 with SMTP id
 v9-20020adff689000000b002bdd0955590mr21375825wrp.14.1674477483513; 
 Mon, 23 Jan 2023 04:38:03 -0800 (PST)
Received: from able.fritz.box (p5b0ea2e7.dip0.t-ipconnect.de. [91.14.162.231])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a5d6e83000000b00289bdda07b7sm4284510wrz.92.2023.01.23.04.38.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 04:38:02 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: l.stach@pengutronix.de, nicolas@ndufresne.ca, ppaalanen@gmail.com,
 sumit.semwal@linaro.org, daniel@ffwll.ch, robdclark@gmail.com,
 tfiga@chromium.org, sebastian.wick@redhat.com, hverkuil@xs4all.nl,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org, benjamin.gaignard@collabora.com,
 lmark@codeaurora.org, labbott@redhat.com, Brian.Starkey@arm.com,
 jstultz@google.com, laurent.pinchart@ideasonboard.com, mchehab@kernel.org
Subject: [PATCH 2/2] media: uvcvideo: expose dma-heap hint to userspace
Date: Mon, 23 Jan 2023 13:37:56 +0100
Message-Id: <20230123123756.401692-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123123756.401692-1-christian.koenig@amd.com>
References: <20230123123756.401692-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Expose an indicator to let userspace know from which dma_heap
to allocate for buffers of this device.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index e4bcb5011360..b247026b68c5 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/atomic.h>
+#include <linux/dma-heap.h>
 #include <linux/gpio/consumer.h>
 #include <linux/kernel.h>
 #include <linux/list.h>
@@ -1909,6 +1910,8 @@ static void uvc_unregister_video(struct uvc_device *dev)
 
 	if (dev->vdev.dev)
 		v4l2_device_unregister(&dev->vdev);
+	dma_heap_remove_device_link(&dev->udev->dev);
+
 #ifdef CONFIG_MEDIA_CONTROLLER
 	if (media_devnode_is_registered(dev->mdev.devnode))
 		media_device_unregister(&dev->mdev);
@@ -2181,6 +2184,14 @@ static int uvc_probe(struct usb_interface *intf,
 			 dev->uvc_version >> 8, dev->uvc_version & 0xff);
 	}
 
+	/*
+	 * UVC exports DMA-buf buffers with dirty CPU caches. For compatibility
+	 * with device which can't snoop the CPU cache it's best practice to
+	 * allocate DMA-bufs from the system DMA-heap.
+	 */
+	if (dma_heap_create_device_link(&dev->udev->dev, "system"))
+		goto error;
+
 	/* Register the V4L2 device. */
 	if (v4l2_device_register(&intf->dev, &dev->vdev) < 0)
 		goto error;
-- 
2.34.1

