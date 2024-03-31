Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AE2892F6A
	for <lists+dri-devel@lfdr.de>; Sun, 31 Mar 2024 10:45:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D412610E9BB;
	Sun, 31 Mar 2024 08:45:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dHZva+y0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F296B10E9EB
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Mar 2024 08:45:29 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-3433e518c78so700687f8f.1
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Mar 2024 01:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711874728; x=1712479528; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=OIGX0zkEWaN83RrWauYFLuhRKQU73+opfJC/SaE++k0=;
 b=dHZva+y0bhwFQV8ncr0ibHgUcqkmhkf8Pb50UJruqxoGSMkHh9/iSU4eU/+ESmseyy
 VSO7Gr9avksEmf77FWBYGsZg0AcX/tS6/NPnmKBOdGvh4sbXVqkTi+nYb88LFBNLW1fG
 I/GGr3krAxnODtTE1uJqwkIe4NCrjQrz1/7srhOg6im66flq7857yOwWoRiHQywS7J5+
 TUZLWusRr2+bUTeqvJh0rH68eNJnCfBg0frippFmJHyq6jY1b+MI+ghOO9iJiSVPh1VA
 W4mzOFd5YvB/W1t6hbLQBhebSX+eDZAekjlii3ftWPc+plb751Z/jNE8NWtc83nOYRi+
 tccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711874728; x=1712479528;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OIGX0zkEWaN83RrWauYFLuhRKQU73+opfJC/SaE++k0=;
 b=MhSakTII6vB8e9CY3f1hUjd6BTLvRMftW5ACI/t9onSAfELOLV6MmHzMzGxH0sjg4N
 xoqLVg2V2uo4S485pGFfd4ey7zbX7KBVBHxDTFLbuknNDsjkjK+gXBJ69CFCV7RxRNTD
 KN8vhI9hyKd7rgKFfE3jkld8du1jFivGkrY8UCtP1AquNSXWueOjJPYkDKvBPR5d6FVH
 /3rFsJhiV+W+bf44NyaDiE5ccDNuswm2wMNFLaL4Lfl15jCkqb/xDZO+7cIzXZ7AtkxR
 gQJ68N9VcHV65qh5QL35Npw5B8UlHdGuthoX9F35KiZ5XsiVs2l9N9ihM5ooUCcYxq0D
 INqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTw9JGw8QVB4rAxs3u/BdOZNXVIrDiH2gWh73j1ehHTBW68cxbsBFIw9AAWeaJsCnLK782YqZdsfuoWHU8BScLeu0so4fX9LS66F+ZxKhs
X-Gm-Message-State: AOJu0YzC4fHVGP6SHRHXTuHkKWVyBoFvqmv6hARv7SL8E510Pta9Sew8
 hYlHW/AfVBNc4LApgswL1I5gfImRjHVPbFPKNbGowdPMaSjf6JzBQl1IA/N7jxQ=
X-Google-Smtp-Source: AGHT+IHVX9XsfQaMqRdCAH9PhV/E9Dx75VKjmwryknc/RD6zJxtpdVsTkLnoCPRvzoDoNfMSiB56Kg==
X-Received: by 2002:a5d:4c85:0:b0:33e:c2f6:96e1 with SMTP id
 z5-20020a5d4c85000000b0033ec2f696e1mr8467307wrs.25.1711874728084; 
 Sun, 31 Mar 2024 01:45:28 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16]) by smtp.gmail.com with ESMTPSA id
 k17-20020adff5d1000000b00341b7388dafsm8436003wrp.77.2024.03.31.01.45.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Mar 2024 01:45:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 31 Mar 2024 10:44:00 +0200
Subject: [PATCH v2 13/25] drm/virtio: drop owner assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240331-module-owner-virtio-v2-13-98f04bfaf46a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=794;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=nkRw+hEyffQkd47xH6yhTGRY43bQKFbnoktzkBjZ19w=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCSJbyC+TYhZko54In9IUl1s/zqFoVAu9aF3xr
 nAmrnGu2sWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgkiWwAKCRDBN2bmhouD
 19qqD/9OBs0+SerfchEnl9YX2QIbCY6Gm33RVT7YTVHeJ63S6YT8sPEx/8MyMgucGkFEfFaL3pX
 U/iikQxupEtg9u+HzVfaXgO0nIa+ztA52hEAjecxtq50TsGiG2/garahzj2l09kslecv+Hs8zV8
 IbKVnRamv4WqCb4G5W6qDlE1F0FCKip+lGjkYyk/DAXkEUywX3k92Y9sdHklgCGjuvpYhvXVghg
 6xXdLGRkei7AHHWC0Tezq3HCNJRvhJpMvtfWRpq3MVgTXIX8UYanZFZBbDRZN8FZqRiSwycofmz
 qc/UDu8C9/ybZ5J73hC2QHXssvkXnFoLTW8s7zP8eIwMURH5CoarOplkqxqHH/56/4oYQK7wAZv
 y26vMD0sz2baBmt6HUm4Iih6Fl+ypcP/FIOXsJsI/YHpzVl4rqRnJ7uj4MGHP3hXcF8aSteY2P7
 czR6Sgal+V/l38YoSe+EAJi4/BYp3Iutvj/CTgD9rzNSMWpmjxpftEDWzUMKqswfef3aO1rtXEj
 DddfuyM5ZPj3fnIY0GnPdEJCP9N9aYoEZ6vS+GekebloI/w/2uK9CQ61OM08KAF3W1w2j4bZDgn
 6Q+3cncpRhSU48VHEwTszn81scdVP9QowC4opML8e4QGw/nNBBqxdyGhxJCfP7A0lDT7m4yh26o
 Pe0GXlJwWDIN2iQ==
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
 drivers/gpu/drm/virtio/virtgpu_drv.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index 9539aa28937f..188e126383c2 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -154,7 +154,6 @@ static struct virtio_driver virtio_gpu_driver = {
 	.feature_table = features,
 	.feature_table_size = ARRAY_SIZE(features),
 	.driver.name = KBUILD_MODNAME,
-	.driver.owner = THIS_MODULE,
 	.id_table = id_table,
 	.probe = virtio_gpu_probe,
 	.remove = virtio_gpu_remove,

-- 
2.34.1

