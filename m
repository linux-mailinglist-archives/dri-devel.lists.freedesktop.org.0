Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7776488E0DC
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 13:46:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6790410FCFC;
	Wed, 27 Mar 2024 12:46:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nj8t9HTp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1370610FCE6
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 12:46:19 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a4749eecff7so448951866b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 05:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711543578; x=1712148378; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DTHQAQAXVP2yHTVyN3Qf81PY6hYlRsflmkOJj4KRX5A=;
 b=nj8t9HTpQOS5d8eH1YiNtrxkqLZXDESqR1Ryh29gYAN98CVto7nVEWPlDCnFrkrVrl
 Q507rveEiCoNW0ZF59+aRu4CM8HtPDX9bTtEphZIEWG3f845wQvWfH5b6Eij36nHiZSl
 PcP7EUyFM9cbhfj4X20SaQe9CtLGA/gtEXELNEv0EwdhRVc6l7nqcv8JBcpPsl2ojhKB
 3NbWuWjwHIBd4707s9hDKTU884d9bFPxkN59UovXbvdgWt2lhvczzkMH9DScMSNmvMox
 cXhPgU4V/hdEi4vm/9DyMlQJclz/FSVS5kDEahDoAn+LfplyDjIYnbxNAHggVO5z/0uK
 t66Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711543578; x=1712148378;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DTHQAQAXVP2yHTVyN3Qf81PY6hYlRsflmkOJj4KRX5A=;
 b=Y5+uJiJwOdolQcwpJBxjBkhlp3kIMHOelDr9lsCiPN9q9Z/e7Js0KUu1YYuvUw9wyV
 9ZePnPeMnLIkWSfZKRw058kjgUtWkAjLZ4u+z1lfk/llSsduMv/K0h87WTOrqNvSydOg
 cOwrRy5cWjROr50KLCyzuF34+HU0MmWTWk7cAOwnVBsQZYDt8zix71PHoVmgAeyua+vj
 MefWxHa5e2PiROYsbQdEX7DlCCb3zvfU/3bdzRye0g6OUO+4wYccISnALRxKfoB+DTHl
 oQwcuNUoH/qZvjgH3YauvJ8n123ii6O42cMiviy53X32172tcx5NHs/nYPsKEPENdXJ1
 zyDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWF0TtAl5O7r8th207Y4PrrI+rLrKr5UTYGLbOtNdLsbkK8+pBWljGOXyTPcJe/lZAPYZxLAfyaZwJ9mnRWRGTnshThfLTsXWXvx0RfEbI
X-Gm-Message-State: AOJu0YxbgJ1ZUdjfiEGwxqulQzU0VYdJs7OyHb1in0OfHDnLad8i5gy2
 yxGNnc+eJLQufFSNq0IBkmJBGv9UnAeAWHKOep5/hiyAlDOrz3OmDaCnUU8KS3c=
X-Google-Smtp-Source: AGHT+IFX9TzVkfreMFnggYGMLSIMwa6TdcWtnATIFoctKTDk56r9dBF2wj2yYQDj0kzNPmIK0zouXA==
X-Received: by 2002:a17:906:4542:b0:a4d:ff5f:98ad with SMTP id
 s2-20020a170906454200b00a4dff5f98admr1560710ejq.37.1711543578195; 
 Wed, 27 Mar 2024 05:46:18 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.205])
 by smtp.gmail.com with ESMTPSA id
 gx16-20020a170906f1d000b00a4707ec7c34sm5379175ejb.166.2024.03.27.05.46.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Mar 2024 05:46:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 13:41:08 +0100
Subject: [PATCH 15/22] net: 9p: virtio: drop owner assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-module-owner-virtio-v1-15-0feffab77d99@linaro.org>
References: <20240327-module-owner-virtio-v1-0-0feffab77d99@linaro.org>
In-Reply-To: <20240327-module-owner-virtio-v1-0-0feffab77d99@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Richard Weinberger <richard@nod.at>,
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
 Viresh Kumar <vireshk@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, David Airlie <airlied@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>, 
 Jean-Philippe Brucker <jean-philippe@linaro.org>, 
 Joerg Roedel <joro@8bytes.org>, Alexander Graf <graf@amazon.com>, 
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=719;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=JcKhWFch83brhdG0VtzetHVJQ40R24YKIvpYHZtTLn8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBBPn2yRXyBXkq6ACxK8eFxLTG7R9tVOB7uD/Y
 7v9Elz1TnyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgQT5wAKCRDBN2bmhouD
 15k2D/9hVir7j0TqughjehMP7EZCDouF1HvdZ3+c7KMqYHSlkKGrnvjzwyfCDv3RlZhh+e4FdHm
 X+s2MAMJ3/85Ly02t4joZHI5QfXytoQo4wwpxxtkpRJN5HiVm/rzZcXsccHZKIRcYWz1PH1N/38
 fm3Bxvy+ZnHsCGiSHZsM4PqLa6T9KeFlpqp++ZsNra60QDqFbPqgVbY7+kqLkwM0/AUsGpG5KH+
 fANSzGGe28ClqfxLt1Vu4U8CSlWj7o3ElcC/D1XBCweTqRPcA+2iLe7qUDmhal7tLZX6ScveM68
 DfAmPWnA9tNLgNUIX4SkzIHy5muQ2Carr3j/RrrZpNNVOt5Rb7NUnfq4S2bZNQmiGMtu/X7CDDx
 YJi/1RGHGSqYKlxD5AR9Ez4RoFG35FAuZUI8gO/AbAvW4cJ75x77zX3gQSCjiiqhn9mLgzwLmDE
 1oKNZb8RoXjYMGAXa4ZRkn76LzMcWV5/Bt2t+04gDUOR8V1oiQqStsdHKtr1HJO9N86cbbk05le
 RrseGA2RFkzWlx0/Wu+TgsVFtHEwAqu5ZP8LQMSd/i+S9ZdwaO77JXqExIP7SpKvQP8EPSlg574
 lkdW0kb9S1N7OPFwSIwHgZjvg2eSitp5mVOTWd2Cs0lm+avAC5JESLW0CvDV6P34723ld4sdEDl
 LSIrKL+jjHKKMPg==
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

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first patch.
---
 net/9p/trans_virtio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/9p/trans_virtio.c b/net/9p/trans_virtio.c
index e305071eb7b8..0b8086f58ad5 100644
--- a/net/9p/trans_virtio.c
+++ b/net/9p/trans_virtio.c
@@ -781,7 +781,6 @@ static struct virtio_driver p9_virtio_drv = {
 	.feature_table  = features,
 	.feature_table_size = ARRAY_SIZE(features),
 	.driver.name    = KBUILD_MODNAME,
-	.driver.owner	= THIS_MODULE,
 	.id_table	= id_table,
 	.probe		= p9_virtio_probe,
 	.remove		= p9_virtio_remove,

-- 
2.34.1

