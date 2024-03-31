Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A82BE892F80
	for <lists+dri-devel@lfdr.de>; Sun, 31 Mar 2024 10:46:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 152B510E9F0;
	Sun, 31 Mar 2024 08:46:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qfy1rsqf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED0CC10E9EB
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Mar 2024 08:46:10 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-3417a3151c4so2994713f8f.3
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Mar 2024 01:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711874769; x=1712479569; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YUfNTipefEmXHX8bGR8JVQXCUjDv6U/ZK8sNVLNneMU=;
 b=qfy1rsqfKNwyBVDCEeXxfRyqsjFbJf3Hb7HzH6mzgir5TGOGAt3LHG+XPHrJblHDuM
 YOS16gvNd1bkVDccAkJaBgqsI8LwKGnrwPH0OHLXJR2FmzMp+rEF2QzQWjXJCYSlw0HT
 PTk7p6WzYN9yDAS1MYaKTsJW2ASbQ7QYLZrUs4DshjPDaEUOHa2OoEOR8Xn8dZ/gAdGu
 Y3DOKbzWlSACNHO/UYhzCwq0b9B6wD80r7L7z8LveiffOf6rgoyO4OrxKtjEBHCGZHqS
 nRG4dnomwOcCi3LCI9tuvFUt9VkAe3JJtE/dY1LuOwJdOCLTijRMYQD6CbIvIri0qoW9
 jMeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711874769; x=1712479569;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YUfNTipefEmXHX8bGR8JVQXCUjDv6U/ZK8sNVLNneMU=;
 b=jaTpqwYbnaCIvawrzvbkA8vyQImymevDQKe55rVn4zoqaNuPWS/uLh3SU0Z/Eq7Hm6
 rMEesX0ZW0iirvz0HBp87Qh6ho0SxfYoz190KfKsCsUr/RViqO6mLda+H5vK08vTORzN
 DsWoU9QoPoxTz4hYrgu26FN+5vURZBVDKmHIPsUXbfgvyQ7wbx6bUGVOWqRrPrLKTxj9
 nE4PNe4QCECbAfIN+9OuwFvn5+h2fAfu7tcEkBXLL9CL/TjOcyQlEbl2vaoop/SPDsgD
 jqi3xjib6jBkjZ5xJxhRy6UELwLR32/43i9KBm68FjJlRCEtWEtiqsos4BqWY8eE6QwL
 GROA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+zrDQZiRiHwul0W7abzeVcZPeEEFdIlIl1Iza5ySEQ5AhnhcDcU3Pf5PCgghA0v91djqZZYHwFStN+oQXAq7xF+UCVHldwHy7DUX/Ee1l
X-Gm-Message-State: AOJu0YwCQW+b5LWdDdJVFNkbE9GyCSLxWVi3oE/haKIdOhXsJ//4nPsm
 aYiYz3m18ZudWVl+Dv3+H3kAa7IWacvWw185opEYtigcp+EHFUKMjwlLzU1o9N4=
X-Google-Smtp-Source: AGHT+IFWevhYpwJfNDhRVePhOCKsR2pLuIuY4+m5hIw7WrVLFKSGSUKbdP+zlvsvE7pLRoSnihSMqw==
X-Received: by 2002:a5d:6451:0:b0:33f:6ec1:56dd with SMTP id
 d17-20020a5d6451000000b0033f6ec156ddmr5675223wrw.45.1711874769326; 
 Sun, 31 Mar 2024 01:46:09 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16]) by smtp.gmail.com with ESMTPSA id
 k17-20020adff5d1000000b00341b7388dafsm8436003wrp.77.2024.03.31.01.46.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Mar 2024 01:46:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 31 Mar 2024 10:44:09 +0200
Subject: [PATCH v2 22/25] rpmsg: virtio: drop owner assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240331-module-owner-virtio-v2-22-98f04bfaf46a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=825;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Vyo2AzXtnL+6nl0togC7Bicpz881704XBK8alsfqblw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCSJjAziX1LvXxL0d2928/VbSKx//pADCrWW+j
 FN9OFXbeL+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgkiYwAKCRDBN2bmhouD
 1/jLD/9KtMVjwOhUEJDx/ub/l0GG3C9eq4On4ikCu4uU9IktC6UQN4qDrfdIyavpPOM1thNNvlj
 atCzlA5IOQasnc05bfUzNkSHtv5crrSwGdZEo4ZGWlRxKUovKWlKC8GPWUjHoOMaB9E6p/F+e3N
 opLqOlWxnMfxAEaImxYl9WfXgq386SS+gyHwrrcRgQLzEihLWj/CQua3yBGYVru82G0iXFbyE1N
 NnpHS2LEXz9nUeiuz8yHQM0L3H/tP2KNCMOI/39T4CdjJUfqp7OV6XwRZBRHzWMgetls48hoxkJ
 tOQpD8o6SgwW0tEorSmgALMFN+e/z9jUi7IsyY/bpqLm8yP5eSBSxDxpNBCnfN5imfW/XCYQR1w
 ANS3OEXZQLudpa/cetAhWNV865x71WlsJAit1xDRCqe5oCCDdUgcgBYiTeQp/Ddvh4qsAF71nGt
 RTT2WKt7qUGR/ddS9zBe+El6BRYcWYFDzqWsjTaOoUbSZBHTcfgGg2SQDqd5lO+eaiS+ZQLjFNp
 f94PMSyEfpoISfRbHubkrqwR9d4hfYhtjBhFfWbHU+Igy6/zMawFXf3jgIpiCjX/jj6v6qpfda7
 umdXTfdN0OqQSTG2VarkPNsHyo94HagoTB997ZLjFLcYuv5EIg03gCjYeLLIuDAXtvfdat5mLgb
 odNYlyqVAniZrZQ==
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

virtio core already sets the .owner, so driver does not need to.

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Depends on the first patch.
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 1062939c3264..e9e8c1f7829f 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -1053,7 +1053,6 @@ static struct virtio_driver virtio_ipc_driver = {
 	.feature_table	= features,
 	.feature_table_size = ARRAY_SIZE(features),
 	.driver.name	= KBUILD_MODNAME,
-	.driver.owner	= THIS_MODULE,
 	.id_table	= id_table,
 	.probe		= rpmsg_probe,
 	.remove		= rpmsg_remove,

-- 
2.34.1

