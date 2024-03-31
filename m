Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9908D892F32
	for <lists+dri-devel@lfdr.de>; Sun, 31 Mar 2024 10:44:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07B6110E1C6;
	Sun, 31 Mar 2024 08:44:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="irqXFlkM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1A9910E1C6
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Mar 2024 08:44:47 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-341808b6217so2094964f8f.3
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Mar 2024 01:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711874686; x=1712479486; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=shrdZmoV/+LZqwehvxghCY6dk8UPLlZrkww7U3AfLpA=;
 b=irqXFlkMKFJ5YBhb9XeMAmcJwxtCKk5RDL/6u1ZC+eHeo/GWFVMR1aDF1eTO2Caw49
 O2KX8KggDadyvHbPZbHE3lXeNFMNSE3Y+LVDbQctXE7WVCNPKZWu1cvjGU4P/uFZ3C+9
 CnGaKmjwxMklyxhmYc6f0dziQeR81duOHVnamwM5eqOiSgfE0ILktIsPWB7aLC++pEud
 VIi/D19DJOZKWOJsbSX67I4oUhrFsSctoAhyyADcIyrOFxMRH8HSr53K7q+VccgStb2O
 Tsf2IKjl6wemwfRcdCJZI/b/Mb3msbmbAsl1w+3GVjT8TrfDQfej3Tqve8GciFl5CvYB
 Zi1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711874686; x=1712479486;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=shrdZmoV/+LZqwehvxghCY6dk8UPLlZrkww7U3AfLpA=;
 b=Uu/3u4IIZsAoOpF211XYZm3zU9NmMix0G2nbNKQRQvZtHMdCurRB9gxHoqSeqnS/nZ
 yUp8WKtWSCwa4pVRKYPOM+UY4R5cCUIBgDz8KjfpL73mCTM+1IjgI3+LXwXkRaEHjJD0
 XLb9Hjo7klmvSPjaZD17zXHpvd3a1USK36h/ICSAbKnGh1vXwtqiv7TLldp8tmMfcVeK
 jY4SlJtl+jql6epVzDs6KQtFGrw581LPuZeNTITH+/DoFOvN+jPdN0VWXKBmqUR1zjC8
 RxpjiUJqeMO5Xg9TFZUQ6LL6VHxFDGKUgK+JffWuadqycP93EPLCx0ndSTMaBl4ON7of
 cmxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMRn7E2wfec30s0pYCpqLOL/86MYH2xaLfFjML00hv0Wvazi+TuptY8/P8bGSW5Qmto2IHZ2iv4PXKPnMJwi1Iqt+26/1FZAHLdn+p37CQ
X-Gm-Message-State: AOJu0YyFh8Dq2QpZz+FXxP9O8gzZfu2N66Ijg3+JRMZHpog3ujB5xPCs
 iJrEONKynZd80DZTcolIPLyDmBpY3+Skhync/LSQz0LKqEkySTxqCYZwAT7ESBM=
X-Google-Smtp-Source: AGHT+IGE3mBHpk2iYgCZr4y748sr+z9cCqPzcpXrC7rbWUuwjwgJ1DZOI40A9D2OMrxW16aiemUNVw==
X-Received: by 2002:adf:fa43:0:b0:33e:d68a:7d42 with SMTP id
 y3-20020adffa43000000b0033ed68a7d42mr3902796wrr.30.1711874686293; 
 Sun, 31 Mar 2024 01:44:46 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16]) by smtp.gmail.com with ESMTPSA id
 k17-20020adff5d1000000b00341b7388dafsm8436003wrp.77.2024.03.31.01.44.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Mar 2024 01:44:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 31 Mar 2024 10:43:51 +0200
Subject: [PATCH v2 04/25] virtio: mem: drop owner assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240331-module-owner-virtio-v2-4-98f04bfaf46a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=785;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=wAjyw+8BG9Q/VwqKx0H5MhNDfrH26X7x79bC5lwKCk8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCSJTSAIIgTimebstG/Qy7uAfSArMFyh2juPUo
 6ZPodVLBXKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgkiUwAKCRDBN2bmhouD
 1xDtD/4z5RmDFqjWll6kjvhDzAxQrcOG1NaTdWTMxysEd+H0xrvYrwZ47DKXPkAUiIdSBZbN+wM
 vueRYnxKlobdHqQt51krKCLl+ShScgF1bRuBVLLEK9c0R9rXygVdMqVnmYUOzjgGI5AP4dK8hd3
 /UxxdtXu5ezHuGb3vXKiFiVtZuTorRjWXgX5EfYg1qmNq0mZVLnzQjPl6hk2eUwnAyzaNAHlWkP
 il+dRt35QvwCmiKSxbsVvt1xUw2O58H5Ln21w9RYHg9yaqD9r9biAKNT8hz0+OhQ+csGBzb1qNQ
 Yy0/B2aVcnfNoxlvU/3B0n3IXe/94fTVmCGaMutYCGWUd7mmtXBPLQHQigb7XF/WhI+H3ZlhQ5j
 9iPp98vj6pSGuwWtvf1vAmWQ3C7hLch5jnolS3lhEb3Kr+Mzp7FvMpBPkSPapmaEoXyMhD9aFHS
 plVjGY0URnm/4qINC7B0fqXMQf5XKv1ozQF6C3ea3p8LZgknmtkiQGJOQjblgGJqwugh2zyhUBF
 9bx7ZBmQgtIz4A9IbAP5ZxYy+9ZZCD5dPZe4Hrwc1s2CGw8Ajpl8CNB+otZFRPRor3W0vF8G+hM
 dPJ70z0cLIp74sE/i0MtNiKtmuqVcPtTD2ASbduSMGLBpM0o4WfdMTlVFNjz4hdDGCV0cAgC34+
 RVnhiy/vQaspgfg==
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

Changes in v2:
1. New patch
---
 drivers/virtio/virtio_mem.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index e8355f55a8f7..e605d906639f 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -2991,7 +2991,6 @@ static struct virtio_driver virtio_mem_driver = {
 	.feature_table = virtio_mem_features,
 	.feature_table_size = ARRAY_SIZE(virtio_mem_features),
 	.driver.name = KBUILD_MODNAME,
-	.driver.owner = THIS_MODULE,
 	.id_table = virtio_mem_id_table,
 	.probe = virtio_mem_probe,
 	.remove = virtio_mem_remove,

-- 
2.34.1

