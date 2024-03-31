Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2978892F7F
	for <lists+dri-devel@lfdr.de>; Sun, 31 Mar 2024 10:46:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5B4A10E9EC;
	Sun, 31 Mar 2024 08:46:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ostIzgLI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CE3310E9EB
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Mar 2024 08:46:06 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-33ddd1624beso1982731f8f.1
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Mar 2024 01:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711874765; x=1712479565; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ynnKTjrcpie+nYJ7zJCc1O/bqKJjh6+n6bK0J+8BU9g=;
 b=ostIzgLI0LA8XShsB55+Bc0PRuf23f0v2Du5rXket5e4bKJvGqSe+wVwNR9JNhOqxx
 z7wqGdNBTOTRtR8qJJwCPOgLVyMXo+ICEnIZPdlvyqVrh41LBsGSS5pIi2Ok2hzkZ4eI
 lRvFo58TDTWsKH7r4G/Ivv7/pxj0zckC8w6dPqdpYEkU/gNHAJZqO9bBP38d1pbnViE6
 yM4dHh0Pcn6qFY8S7fguibT+su8HHLmesmVufSkbWwYhVPKQFebxrP0HbMVHDl0b5hF0
 qaRmLRiy+q6IhKXdwTj0Y9X47CfNtGU2ljJsy1FBDM+SF3LmHCSMnNwJ6xdwhpaJpZ3j
 tvYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711874765; x=1712479565;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ynnKTjrcpie+nYJ7zJCc1O/bqKJjh6+n6bK0J+8BU9g=;
 b=D1N4wTT9HxOAe4sDpL2gCGWEh7iKk+RAJ9OL0HVmT6yrp0BAKn6WzfkP9Lz5pV6Dyp
 RkD35HCZWt894cxrqsoWL9weF6Jw1tbs+vonxpx55ll1oh5xWPHEH8DIPhHG3pQxDUtR
 zGAetkIT7ZistBu8Q46lI0sPVqMS7hhBpIQhAz8oSttSBRAB92vssqiiKkMFkVWnvufR
 D6VkMJbMtnffTDwVhoILEt5q5c7wLIdJa67xb9E7xbB1c4ZjRhN4CSfRJ7S5OBd/AS4Q
 b+TP769rbIdGKRjRTTAC2YwEjoSWSq2HG4vXiHVUNajzhrb9o2BAeZfsMVaF/64tyu4r
 6hEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaYmqtTTLA0xrsMhG51ux3ve2vyMFHOpVn9o6DyTeEJDOMB/3ukzUBifIxF2WPGTfJlWlsrAUkIsC1hT0daHsRv9ecui0qi/kaWNEbZlHQ
X-Gm-Message-State: AOJu0YwxoQ7NB4syY6rSZmfhAd4kaH+CnSCRljD+w/fLGBZeJL52mYMJ
 M703f74XIZFFsAv0+La2l6HUoovoE9XjeKvh1fSDpKB+eN5iaRJC3Bqv8+K1hN4=
X-Google-Smtp-Source: AGHT+IE9HCbYqXr10WjNVCL6+bCwlLWbV/NMZIwtw1PAsCjjTRvMs1pGxGA/oXfJxTVFO3HnB1qqrw==
X-Received: by 2002:a05:6000:18a1:b0:341:e1b1:a5b5 with SMTP id
 b1-20020a05600018a100b00341e1b1a5b5mr6504132wri.13.1711874764733; 
 Sun, 31 Mar 2024 01:46:04 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16]) by smtp.gmail.com with ESMTPSA id
 k17-20020adff5d1000000b00341b7388dafsm8436003wrp.77.2024.03.31.01.46.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Mar 2024 01:46:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 31 Mar 2024 10:44:08 +0200
Subject: [PATCH v2 21/25] nvdimm: virtio_pmem: drop owner assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240331-module-owner-virtio-v2-21-98f04bfaf46a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=811;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=djiFy5u3KBh7sxz0UqH9tQzKO6FqFPG/J3nA2oWVUvM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCSJiCUA1oHxtanMlVDa3B0IS2vFZjLtjegvnB
 r2LktHu/TmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgkiYgAKCRDBN2bmhouD
 1+fCD/9rVUL5S9fAYP2Cn2joknxd9GcyxZ1ZcSysBEormmSyzUriEDIqirrsKi680bEbDylBOX9
 x2MmTBvkQvu/rIQaoQX/tKOG7I91b1Vbkk+M/NAsbbgnagkOSShnc3shFsc3rXApauvlxnO1qvb
 z8DY07D/WFV3/ayX9Pc0+PnpUDKtjympuX6u7ZHB4k6EwKFN2I+M+HiqBoPn3/ikV3qi8Pl5ABn
 dVmokdreeUGTxM3sQFHK02cmnhLTPk71xIHNooat+Oh5ZT6rcdAvm0AG4WFUisCpcckAFMO+cX6
 PQoSym3RhOSPNBuSGE69s0aBavxd4IuhZiI4o/Jw+0VdzvVble2tpHu+anv+0Glt6Ng5f1OPaYi
 CXmDxjyV03jkc2tlsgpIdfrBwo4k9U+5eOoACVeHWRlxa6eDLI8ViIyEzujQpnD8ueNX2Q8XFgl
 S2ARJ2DUcykXT3jv1xRLTcRYkjqbSrBQ4N13gZPLY2T8UnZrpAwIylFubiw1Ahd+W3KV1JUzxwL
 vUBVwDlontFEzLJVXp78UAxmuAChFTir9BJsAENfp8Sn6B+wzUxU1X5IwJrmDBoO/JvPuQAW3N1
 eQRSKA5Wuv0EaRhEEMBePFtrM57giBzRXdSf97ZWQDn40PWYCC+66dK7kdUzInryIhsEEMdcmlc
 cYX7/PO50bomQrA==
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

Acked-by: Dave Jiang <dave.jiang@intel.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Depends on the first patch.
---
 drivers/nvdimm/virtio_pmem.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/nvdimm/virtio_pmem.c b/drivers/nvdimm/virtio_pmem.c
index 4ceced5cefcf..c9b97aeabf85 100644
--- a/drivers/nvdimm/virtio_pmem.c
+++ b/drivers/nvdimm/virtio_pmem.c
@@ -151,7 +151,6 @@ static struct virtio_driver virtio_pmem_driver = {
 	.feature_table		= features,
 	.feature_table_size	= ARRAY_SIZE(features),
 	.driver.name		= KBUILD_MODNAME,
-	.driver.owner		= THIS_MODULE,
 	.id_table		= id_table,
 	.validate		= virtio_pmem_validate,
 	.probe			= virtio_pmem_probe,

-- 
2.34.1

