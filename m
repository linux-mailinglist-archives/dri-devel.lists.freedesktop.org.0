Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFD988E0D8
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 13:46:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FD9210FCA5;
	Wed, 27 Mar 2024 12:46:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pEmOWwom";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79F7D10FCF2
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 12:46:07 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-a46d0a8399aso142685666b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 05:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711543566; x=1712148366; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xcNHdYD3uD4iwF1+LVPcIdLIGHnCmbVJHNncy5BFB3I=;
 b=pEmOWwomluZVCaM5F/FtgaYCgmqZTKm+e3aitj+yIzqp99voIyVTBJqoQry55DyzY0
 vahd0Zm1VwC5ukbtAT8oCDFpXYt7WvIBTus8Upfqke4S9K5hsmgwwa+piFu40ZNoKPI7
 bB4XcNzwQm2TZxdjZtdv8fZDN0zZcU7x3XZ95HpgreAbOO6WrVRTXlMz1iNSkLrYKXaW
 S3SSOAdVtXL/ul7C/HMGdyhIBQQY5r93MOuQo77gL2PULckCaWVzHK36b1Jg0tZ1Spw0
 3H5UCUtv7C7Puaskta/1XdxCL+AUR2ERbWL+H+pbH6xnGIHDw7llNwxptA5VeWIH1nr3
 5h1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711543566; x=1712148366;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xcNHdYD3uD4iwF1+LVPcIdLIGHnCmbVJHNncy5BFB3I=;
 b=cewKB6dKEB1VTNTVkVzDC+ta+qZ+adoGYCKnOe0OI0eSTWkCVAIqTu93STYoAtIez7
 3XWDIzTsZ23eFFnX+zwmiBrxgfr7E4GOxVQR5fQ5CCTvcIhQqVyB3HaoPlXAtuAZmtYn
 9PxsDz7R/1pRNNx4w85sdoPefW9QrHX5mU6HvQfncBH9na7OcR0mN39rMyVkzNOWP/W4
 HdB1BoJ5VQ2C51A2EvbO+Do+1PS7ZpbGj5iY0iP8uKwhWM7OlbsFprmg6pPE7t++/owi
 0tFMK7n6Ogum6Et1xfU0oTLRhhbjQIAslA3PL4QaFnireZgzO50FDf1xVAKGo61++pm3
 iArQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqzrogQkcxylrrVRloUFkcoPHqrlCrAf0eKQ7w1DBZeNAxVg+stgKD9uGWOJq/8J/+Ltqjjm2VaqRz4HfJIVN/EQprl8LBB0D9CgOzJj5Z
X-Gm-Message-State: AOJu0YxlzDL1HSeGh3ZsbzL8sozs/SYrUV6NDNAQ5k/a5sZXEY0MA53/
 /KwtWmM8mUWSBPRDLZxoUTV+Xmuz3yI/Vt49VpWRzk5jTZJ/RQlFheAkskodavw=
X-Google-Smtp-Source: AGHT+IHAC+efJDEDOhYYZLnuKsMBiAknK86hs9hU/6w4UJOwXzt8k36t0rLL/AgWFx4eJtux97baRA==
X-Received: by 2002:a17:906:f59b:b0:a4a:3b69:66a0 with SMTP id
 cm27-20020a170906f59b00b00a4a3b6966a0mr4448445ejd.15.1711543563860; 
 Wed, 27 Mar 2024 05:46:03 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.205])
 by smtp.gmail.com with ESMTPSA id
 gx16-20020a170906f1d000b00a4707ec7c34sm5379175ejb.166.2024.03.27.05.45.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Mar 2024 05:46:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 13:41:07 +0100
Subject: [PATCH 14/22] net: virtio: drop owner assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-module-owner-virtio-v1-14-0feffab77d99@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=762;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=PP3MFzXOn0y5/ZwEiMfjnPaChdOWdaVsrRcHCUE4yLI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBBPmwe4wpkGjPDa9IFmmJcFy2OKytkeKyZycw
 AlSIQtS16KJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgQT5gAKCRDBN2bmhouD
 19PSD/4yYqnj7z8BE0lw7ekC4xjBS+K/SSYPbZXiZqpgBNKtouhjE+/EaLyosBVQkqSLvargvG3
 QvDJzvb+nLD+WwOT52wSDwliv/Ae6GMRPBktUiX3fy9Nh/bllS7ADKTbvP/TiLZwM7leQtI2FIs
 5IxOKcAEU8gKMzPRDjNOOPO3WnRTa7HFEdKo+w8XiIL7kDXbqw2Vrw2xNf5/PyXlwzIExznQF1g
 W+eh62On+nSjWkHoGEXv7siMDdiBirwvhQdVMblqjcqEt5iXLcJSOi1YF3fYR3Or5dKnNrFzotW
 TFCZhxdCDn6dAtcXHVgJdTmPOctZ2BbjU1yPjeSrslJTYFXeaJ3liX3KwbEavpey+KhfpASo/+J
 TZKxYxu4jdFzrf20lb6xcul2pIkjhiWbwfb1LmS49MB5yt1Fskt2SpyEJD6RboXT/rwXS4B71wP
 qHacI+KIAQM/iIDs/QZOUwZZsmZUnX4YEE7qP4x1HikiwuXVDHyPWmD+IyB7eMFi7KfG/CrJZPZ
 AaMeSmpbmQ/Fj0CY6hDkkVk1jDZoL0KmBSzdnG3Lpe75Q/Ff8KH4KrreNx4Vjgye4U3pwPbri1D
 5GO5i9hy1NoZ9fg08cBB5IjQ0jbJ2Z5q5f2VOJuPwH4FZLcJ0w9UA6H0Ctr0KCBBevGH7HtNyCD
 hiQIZRQ3pYjK6fw==
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
 drivers/net/virtio_net.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index c22d1118a133..61f680699648 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -5021,7 +5021,6 @@ static struct virtio_driver virtio_net_driver = {
 	.feature_table_legacy = features_legacy,
 	.feature_table_size_legacy = ARRAY_SIZE(features_legacy),
 	.driver.name =	KBUILD_MODNAME,
-	.driver.owner =	THIS_MODULE,
 	.id_table =	id_table,
 	.validate =	virtnet_validate,
 	.probe =	virtnet_probe,

-- 
2.34.1

