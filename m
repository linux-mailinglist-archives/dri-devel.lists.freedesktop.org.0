Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE8288E0C2
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 13:43:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5569010FB81;
	Wed, 27 Mar 2024 12:43:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TfLXEZ5Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B47410FB81
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 12:43:52 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a45f257b81fso771826066b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 05:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711543431; x=1712148231; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=EPamPBtPxW6+pkIV3m4EaBMhb46zDx5KgvXpbm+zagg=;
 b=TfLXEZ5QExewx36OEyJJxpUYu/ZCCyPzq1DD+e7ypIoyBniMhRD+95N7Gs1PiNPMV/
 dOycf57JfvUiOHZCW3UVhE+gMEUaUvF7u3b4etWowObaXqhEws5lKrtZRmRLiaEKcgmZ
 448aJa9Og6FfLRgXEicGytaSUKUN9BVCNOnMHi2s1hMnYQk3Zf3iOfBFWQ0rfHmbBbmU
 AwlDvKlHZIQ+tGsrYWxcuY3fWtpt9nnqQL8k0+VcDTFm9nbtGXPuDeIhv3/O/28uNcux
 7XifU+Pdp3KVLyqGdkr8CIgX+JTBn7/fUjEGwhPB47s6/NA37gyOo5hzA2/RCeRpq8Jk
 jHxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711543431; x=1712148231;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EPamPBtPxW6+pkIV3m4EaBMhb46zDx5KgvXpbm+zagg=;
 b=MB6pAVkEGgqRbRE/+gc+iAFKNNmQYlU67KgPsVG9riowsOEqZIQJYnrnGdbkpT4zZa
 2FOgyzOvj8Mn3B8cTK8B4cJ0fHBZ13Wtt0xRh1oFBDyLIrQXMdAjq1DgHINB+6cVu1O0
 1T/R7kKIEirGpApPCX2v83T5QpmgQtTs2ec8VhUJUDucStDXCscklz037w4v/ziiMe3f
 YmWx2n7aHWBTHUvqwn90q4CNMFGZWCCPmizBqtNQsFpLTUDvoE/rmdRPjbhTaLoarRb0
 WukquTx9jZyevYWr3p41T4jjZhbqVL+ao5xddqSa1enGU6RacO0DQatj04qhBjB4Gkt+
 FRGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXc5oIvCkf3lUTc/Eqg/4VtkUrzV+DAZgXIAyPdOv3nNPgqxjWUzVzH7iUCfK2owaxBpl8y9PpwBwgQssSzyW12ixgZwf+D4mKPNELWo5Fv
X-Gm-Message-State: AOJu0YyfKFMsDvZXzGngGEHObRxtlyzjuOkSiHnXa1tHdDTCFogrJN5U
 i6o58u4fIrIK169nfWAZNSVxzrZIrV9qmbU2bHDPl/KIiThPDtcep636/+4YGUI=
X-Google-Smtp-Source: AGHT+IHIawhEWmM18csReaNkfj7KE+Mr23K/ZLmHctiSwGk/x/WXWLAILVQsaMoVXgQQh7ZH8TvBtg==
X-Received: by 2002:a17:906:4e83:b0:a47:31aa:142d with SMTP id
 v3-20020a1709064e8300b00a4731aa142dmr835338eju.70.1711543430493; 
 Wed, 27 Mar 2024 05:43:50 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.205])
 by smtp.gmail.com with ESMTPSA id
 gx16-20020a170906f1d000b00a4707ec7c34sm5379175ejb.166.2024.03.27.05.43.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Mar 2024 05:43:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 13:40:59 +0100
Subject: [PATCH 06/22] virtio_console: drop owner assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-module-owner-virtio-v1-6-0feffab77d99@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1103;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=CUCGqZGlbwrgPkwPeA7fzEXfYZ5lWG+kw/qtWPfvSV4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBBPfhSNGa7v+KPC1Mr5GnTmrNcEwnc0tCa4FH
 m0oKKQdogaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgQT3wAKCRDBN2bmhouD
 17JlD/9KDr1Aax5X0o90P0yI2bf6cpve6MUh89ettR4omfAVd37Dod/vJ5UZ8YDgCWHVdzBE/lN
 pkmFzT2vbc1UL6oCj+BMBllZkbpmCkDtEvx3lol59Tz/OZUoXhv/8bDFpoyPwhLuwZBSu9GaBm7
 jl1D1sPVUPu5TFBwDqMVJPE9lNuBgpiPUVLh1Mw1LJM7U5PbFDz/797HaHICwxQCgs4Le/bzO6d
 NaHj5gx2JeWEPUyXNeThuz8Ltawko6tEtFZge1cW7WSCzRcoN7Bu3A2w3C+gsxSygfVZh9UMCaI
 F4wfQuj2fV04UAi5+OceMmgcvWbaizvgRFeaq9jC6oKv8tXcdTdgyWZb2R9kxYRYXsqdvFT49uf
 4EDLAt5abOVCXpJs2XF1Zsb6GMBJvPT8N6ur8Qx989vDOSbTxlC2I2J4pqHjgEoIpyS1EArc7xy
 cTGt0MceTl4TFQWnHh4l048GQyvV2ehpWlx9SLMDxZ2x2d/b/y07ik5mDHIZgd6e4GpGE5CwPuT
 f8/PBIExnfmQgxh6AycTHxwwJ0Ngy4B2R+bS3MR08Htxndq3Nrpu1U65K0m8WDKubEy4zaMN+kr
 hoFfKJUXhyFBrtl+Fehgcb19zQ4HSvsCzidVzGuXw4xvn+gVKRFbr3ZYDaPGyWFacIDHIhCFdn1
 FeGFa/txQr7dGRw==
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
 drivers/char/virtio_console.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/char/virtio_console.c b/drivers/char/virtio_console.c
index 035f89f1a251..d9ee2dbc7eab 100644
--- a/drivers/char/virtio_console.c
+++ b/drivers/char/virtio_console.c
@@ -2173,7 +2173,6 @@ static struct virtio_driver virtio_console = {
 	.feature_table = features,
 	.feature_table_size = ARRAY_SIZE(features),
 	.driver.name =	KBUILD_MODNAME,
-	.driver.owner =	THIS_MODULE,
 	.id_table =	id_table,
 	.probe =	virtcons_probe,
 	.remove =	virtcons_remove,
@@ -2188,7 +2187,6 @@ static struct virtio_driver virtio_rproc_serial = {
 	.feature_table = rproc_serial_features,
 	.feature_table_size = ARRAY_SIZE(rproc_serial_features),
 	.driver.name =	"virtio_rproc_serial",
-	.driver.owner =	THIS_MODULE,
 	.id_table =	rproc_serial_id_table,
 	.probe =	virtcons_probe,
 	.remove =	virtcons_remove,

-- 
2.34.1

