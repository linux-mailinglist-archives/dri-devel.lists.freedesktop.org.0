Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC20188E0AC
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 13:42:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AC7E10FBCA;
	Wed, 27 Mar 2024 12:42:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qaKycc1Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D92E910FBCA
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 12:42:09 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-a466a27d30aso821652866b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 05:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711543328; x=1712148128; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Z2N77S+83trKseWxbTwOaTLrIYXxobuVp9FyL/kFGQQ=;
 b=qaKycc1QPWTLxlDvS96mmeOnizw5jqfQE2LHnhjmH6wqqDSfDOVjVNTQrL7Ok44Gl0
 PCD4S8uMt4i8LPJV73tRBZchrBElaxxMq7Iw4+XgI2nE4HfjPjvqup9HR9OJZZSes/w/
 RexuxSx5KTwNtJZlX3v5ILXVVOlZEc9GuejrEp3CpuTLUMRTB3C6xwa1J8FdOk19gDSK
 gN6CXcSyg7fHRJq5w18ULrqfga6ZuZ633mO5ctLXL1C+AXlAiGOubfgM6++2XlflkBLY
 HVFUSZ8t96dakojsSPvUcZNAna3E1EHUrqaP7XVPirVuVzhrZ6jIoNdyAWz3NoHMZRQO
 /byg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711543328; x=1712148128;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z2N77S+83trKseWxbTwOaTLrIYXxobuVp9FyL/kFGQQ=;
 b=n8WNVOV3+r0S964MOjW4pBtZneYms5JUkzEeMeKJaKnUCRML6Vih78RUMlIpnX9ls4
 TH8tSeo0lMH14h5OZEFuHLLmG9CEbBE9QjD/3bK1dtUMBBqULvt77GN5nnO8+Xz4+/RB
 h+UWKxbYDg1VNmrt6xznN+SplMp41hla6ZYP8PLIKsecUUUl759YuW0/EkNyiYCiPnRS
 oaBguLuxpYBdRETXgvS3e+/ol1zlbzwabPaAnEZktXbzMZPNgbYMgeQQoCdi0MqdwuwA
 RjYzNIr+sVDNeQTWr+BeiX/U9rWyDoPecrHu8DwnUvnWQ4xcyKXX93tj6Gr9kXdvfCeh
 re1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4Wqqf+FOeIA/AcWAIw/c+cGLJSYy/QzZADcpeCheduenRaOOh5cUd6SAIgpfO8hoRp80s7yoNd6N2EzyybYRF3k6gPT8nkeK9Qprtnd1A
X-Gm-Message-State: AOJu0YxeKyKPLGYPmeIT3N0QvSVukGksj/XUfVU0jr2+/Mkkgd8fe4+t
 4vp6b9esJrwaj42C4OCH0mqIlLrNJZptjEvkUMUq/8A6Yu3MB3zJpKyC2PNdfss=
X-Google-Smtp-Source: AGHT+IEkE4pNot1uzWqq/Dxu/KgO4mLE7QfsgLYuIObS5ATO5treG1hWzzYXKuUBzpsw7NHEclpATw==
X-Received: by 2002:a17:906:718f:b0:a47:47fc:441e with SMTP id
 h15-20020a170906718f00b00a4747fc441emr836212ejk.47.1711543328069; 
 Wed, 27 Mar 2024 05:42:08 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.205])
 by smtp.gmail.com with ESMTPSA id
 gx16-20020a170906f1d000b00a4707ec7c34sm5379175ejb.166.2024.03.27.05.41.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Mar 2024 05:42:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 13:40:55 +0100
Subject: [PATCH 02/22] um: virt-pci: drop owner assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-module-owner-virtio-v1-2-0feffab77d99@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=718;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=i29GGpteKXJOT7Y7HQVb9d3eZ/9hZZ41eKapONuqqTs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBBPbywJQXZioM2grDNH1GhnbC9jT7FlHBu8Il
 BXxYGwRjraJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgQT2wAKCRDBN2bmhouD
 141rD/4uo4AQiIOCl21dlkWWoVLjNoCmALlYeYWtYXDJLeS9+PR/4c2YDTN11rNGZIY/nuXht+R
 08R2mFazQGyBslNrJRa5JhTm27rGZioRY5wiYiHqxItX9wtbLBAaPUS9Nophm+R4wqOUhsZnpH2
 iXQpVZU+WxzXQWPWb37iMmYzasbeW4glBRKXiiC3CiF8u0wRyTUDts0V602SqlnsxNufaQ8Fhkw
 v2BkNkkV2fb7XDmngW8OJ0kdV0Jyz61GQTc1t+4KdTLSlm4BqGSDVopNAVcuGaanCqBF/52q9Vw
 GwfqQB77dn2XOgo/ZR0RSXAr23vu/0OwanIMUXPmNtLP0HdBjsPDci1Vl6eBKtREXmXYWwbZZYz
 CWS0C80pM9J/VlR5mCSMck3fBmEeDTvE8F9MpZEre2yc2Q29DVx/bpfm6ztE/EyVr0F9Up8O/Tr
 VA6FaMUz1KovyBRE8weaVHwCZ12Ab+SEc/U7hZ50L35WTjMLlYVRdlVUmcIzP2KmiQnV3W6jpMz
 orbUL5s/p8br6ozoNcPu5ZcZz+mLi4MpfFyp/6zJ+ciMyf/3IUkaehDBf8Q36omx98PhwP8KxB6
 /565K/p5SNWNrrGqH3SAriemyZe8lv2MhxVq7qZ+7WqhhglZ3FWLG0w1uleUDxPVaxFkVFtntn7
 qgSaAlhyRZ+9xPg==
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
 arch/um/drivers/virt-pci.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/um/drivers/virt-pci.c b/arch/um/drivers/virt-pci.c
index 97a37c062997..7cb503469bbd 100644
--- a/arch/um/drivers/virt-pci.c
+++ b/arch/um/drivers/virt-pci.c
@@ -752,7 +752,6 @@ MODULE_DEVICE_TABLE(virtio, id_table);
 
 static struct virtio_driver um_pci_virtio_driver = {
 	.driver.name = "virtio-pci",
-	.driver.owner = THIS_MODULE,
 	.id_table = id_table,
 	.probe = um_pci_virtio_probe,
 	.remove = um_pci_virtio_remove,

-- 
2.34.1

