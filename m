Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5B288E0C5
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 13:44:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B251410FBF8;
	Wed, 27 Mar 2024 12:44:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="akJKJShH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92A6210FBF8
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 12:44:12 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-513d3746950so8341051e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 05:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711543450; x=1712148250; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=X5+XUlpPqxzudteQHjuSJRjlJzQJhMWAmtNdNyAF5ks=;
 b=akJKJShHaCK89I+S/M22Ger9s0JF4q4kljnwMXtY+xngc7U1SW+vDGNoHVOz4F24Rf
 F0f/HoOu3KI0LaN08hfg/foKPQzjwKe8kDgtYpQAtkF6ZqrFFr8yzwMD9LqSa+d6KE+v
 gaEI0Ns1RoivDDM+6OcRRopRTIGCrfZ9qOlLL90WR2gPG6simzzAkfWuE2CAhI7o38Gi
 bealwPb6AyYVZ8/B5syQ+QD67lxtXOufB9KoslQZtC19U1KdS8aJ1+/x9wImdxeS6W4z
 b7B0swVDytIThJKoPBFk+n/lx9bCO1pSJU8ar4MCEEDw5hwhYRu3qVvKB3d9cV2U7/+L
 Kf/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711543450; x=1712148250;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X5+XUlpPqxzudteQHjuSJRjlJzQJhMWAmtNdNyAF5ks=;
 b=PvVjFSIYNNkT6kECsN764bR7jpMtnopws2JyY7wOxh1BrcJMi5NlLZqDFMvfW0Modn
 taO5cknxHg5P8bB7EPF8fGKWQyna1KY5ll49cIP61SJdISdj9LIi9CUlECbF1HwN+i+2
 YDXg+Ku8tZYsEzpATD9r/aXz/7fUOKFS807xVuKUbQqlASTZc8oGOrxujxXkrLQz7SPX
 Ce2aSHOhqJwVcS3tNsNK3qxWdcNmtmkiFBED6kF/zaTR48p/4bCLVF0d/pd3LjH33AQG
 cFwGG6N6YdFmCOzHPo+HCrW4GaZComh1lzeMJOhZJ/u5Cnw89d5AGkO5fzxBr7uW212m
 l+ag==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpar9+h+VvUx507OFGpbGR09z5kVbrgNiEe/y+aC9oSYCUSBXxY/kABqekggtkyob0JbVS3dFHV47GjHTsBCUif9ZY/5tUufhEs8wzcwWR
X-Gm-Message-State: AOJu0YxNWrPV9vzOE+66erUxkBO1719lFqhphbhW75tASQfFASxO4TwS
 rHQS5fTxp3s1m07DMUGwF2eUN3FAcU5+MbaFgmkE/4jCztCjrfQzpTFFDmTUy4o=
X-Google-Smtp-Source: AGHT+IFLbWSGKPYPN0YUh6BVqWa7xSpn/h2CAadvs3AEXfazvc7vUEszh9lyFrb4qLDLLf1Fc9nK/Q==
X-Received: by 2002:a05:6512:11f2:b0:515:a733:2e0e with SMTP id
 p18-20020a05651211f200b00515a7332e0emr1619496lfs.25.1711543450532; 
 Wed, 27 Mar 2024 05:44:10 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.205])
 by smtp.gmail.com with ESMTPSA id
 gx16-20020a170906f1d000b00a4707ec7c34sm5379175ejb.166.2024.03.27.05.43.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Mar 2024 05:44:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 13:41:00 +0100
Subject: [PATCH 07/22] crypto: virtio - drop owner assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-module-owner-virtio-v1-7-0feffab77d99@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=855;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=BF5+L9M6rh/9q/lpIn327dnJkaSg5SfZZk5BFIHRLEw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBBPguclXCHa8ugbyDeozIgOpE40j4Ll+BWhad
 9ENvd8G4cyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgQT4AAKCRDBN2bmhouD
 1xpCD/0frLUUPc34SuflHSrw1c+DAdA7PTHGAMpSybU7zf9+DXYkUo3/yxiPsfF4Qy4uOc4Wtwy
 A1TIFzq4fwfmzfs66DCV7daHcphW3cgSZO8x4NFn3290GE6/9sgh9G/JhNPlSkKaTbG1xX9E0YS
 ElYgyZqqFS1bp9UskO+KWFQWYz0cVtjKGRWNo+D1vsgAr++nLtJQhI5dBMRyMWEmNgU9ERlvlw6
 sBveGJ8CL/yY/OPe8RxdjryyHxMMVbtY/DeyfMBP4b6SGocw6P6tWO1M+wHKtzXWXOKejwOESU4
 k0zxTyJjKKrDLlJAt6ktxKMQOZ6lu98gwv3MStUZ4P4Y12wfHsApT9p2YTkcgwlyQMcnSw25S8p
 rJbZtM9xfX4clwm24W3t3B9NPUz0rfUSLosmImepb+WAw41SKMkVfDrjkmlqulEK38p7i+op2BW
 sp/4aE1DSaOvzrG7XGUsDioZVpirWwFBKx8MmUHbXZcNKABnylTq1eU0EOOgnG8kwtp9cDj1NqQ
 kbS/mS3INL55pcWyR3AJyby7Oh+tsCQdsIHl0bnu7AQjguQ8vIF78wWBaERhxi4mdyUwQQlzcS+
 d4H43QeiFwyCny2ajatFWzipq+b2zCgNUSlTBK2oxKDHAOmy+HdtG6hp9oizXbgsNFW3NPdqFoT
 jt9qtjGBGFB6Cyw==
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
 drivers/crypto/virtio/virtio_crypto_core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/crypto/virtio/virtio_crypto_core.c b/drivers/crypto/virtio/virtio_crypto_core.c
index 6a67d70e7f1c..30cd040aa03b 100644
--- a/drivers/crypto/virtio/virtio_crypto_core.c
+++ b/drivers/crypto/virtio/virtio_crypto_core.c
@@ -581,7 +581,6 @@ static const struct virtio_device_id id_table[] = {
 
 static struct virtio_driver virtio_crypto_driver = {
 	.driver.name         = KBUILD_MODNAME,
-	.driver.owner        = THIS_MODULE,
 	.feature_table       = features,
 	.feature_table_size  = ARRAY_SIZE(features),
 	.id_table            = id_table,

-- 
2.34.1

