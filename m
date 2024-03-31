Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D534A892F82
	for <lists+dri-devel@lfdr.de>; Sun, 31 Mar 2024 10:46:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D676110E9F3;
	Sun, 31 Mar 2024 08:46:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Y/DyXRLd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 499A210E9EB
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Mar 2024 08:46:15 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-341d381d056so2156762f8f.0
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Mar 2024 01:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711874773; x=1712479573; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Xqx8EsOfIsEAxTTB7WrsmLtXzdf/jwAZollbLpRLRYY=;
 b=Y/DyXRLdVIQJxx+YZ0zOUNJg93aXOzNYOCzkhSb1LlctrcSKMdggUKxUHZQJTB4MMG
 Gq77G9JryV8L6H9iyEq9NszKd3BNcLbHfdGVSlK0h/7Rd81oZ+wd5IyPW/6Ad60UIHIB
 w6B6rGJA79C03gjeZv29HFDam+q25q+rY6JBOjwqVU8CQxGOGQtqclMET6YA+RnBVxvi
 9k7tkRJNUMepUX1QogHkHr1kL1VGHTyi9G6MnfIN0hJ+f4noOXR13tMFlQ6MzAkMx08j
 zoatBscHF6YALd6Ym/rv/OQM2cE8o1lCzVvACdQsk9YawUSy8/e0A8OyfKyZqSQ9s790
 iD7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711874773; x=1712479573;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xqx8EsOfIsEAxTTB7WrsmLtXzdf/jwAZollbLpRLRYY=;
 b=AUaIcds5DAZgvEKI6rxuJ4mbaecv8/qNZwYzo6fs1JRPFuamdGNh08xUPQaJqlw6dF
 AKwzezwrDw0JOl31JDQZuwlAzm3XHSC3R7mPGtA/wIwZt78/RCfQUPXb2U6CwOGL1otK
 pg2wqoTvCr6+3bR318r+GaA/M8vlNuQUZsxlhE6wufEt0havqEYhar7vkho7BIM8mprc
 o80AlEc6F8/XscvJi//bbYdncPtxgEoyOWACm7FfFGnHef7m5GiExuP27XHRharSaR/u
 yMiQtvgYSvUgkkbo2KGYVuOBnkhRZWKYtZAAzj9PbWg0P9A0cxKAsoLZeJLQch4OZRHI
 VvLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/58enqvS2FaFWPVVRDdJvtXSBhF5Hsfl8QRcglUPBMBJFdQwWmJOlaIPCuHMLw6xQimZlETCqC51m31MK766LVECkRCw8J4u6mZeDAae0
X-Gm-Message-State: AOJu0YxBrlqbE271L3E585TXtxEfRlCKM4eewOU/sHmkGuJbdkBtTNZS
 +/KxOMiRVkYMeB9OiIVGYDiyUPTV5+Tmk7qpuXxJYFYrsLovwdJBBhsMrpIA6+0=
X-Google-Smtp-Source: AGHT+IFek3qzgbs7V761yvMbVzXmLG/9C3zAsZw/31BGdAd97C/MQ/TvoSMIOusJu9yQQnnC5pkHjw==
X-Received: by 2002:a05:6000:4014:b0:33e:5fb4:49d1 with SMTP id
 cp20-20020a056000401400b0033e5fb449d1mr6156006wrb.44.1711874773612; 
 Sun, 31 Mar 2024 01:46:13 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16]) by smtp.gmail.com with ESMTPSA id
 k17-20020adff5d1000000b00341b7388dafsm8436003wrp.77.2024.03.31.01.46.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Mar 2024 01:46:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 31 Mar 2024 10:44:10 +0200
Subject: [PATCH v2 23/25] scsi: virtio: drop owner assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240331-module-owner-virtio-v2-23-98f04bfaf46a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=738;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=uyHTJK9hGj4pUuhGRoNgYjpldlN5umhZQCXC4Cf21m4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCSJkyB5jVftWfHE6Y4WAM9qzx5c9F5f36NaXf
 HDiLHSFtbSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgkiZAAKCRDBN2bmhouD
 17E1D/970uhi6aEAor+qvSHFSwwBAIJPIudirpecSG58uZQ/z3MqIYltLYSOACKb10uijVFD58+
 xViZKnO6uh4f+Scn1y4VoB1/wB7kd4gQiTLtXkEUsX2CBxLZIxfM36EpUpmaB9x5mLST1Nnf8vx
 2q1ivSLC2iO81+g9NTGaqG5/4hm/krk7IycxyRZKMTbANGN29VIzgRLESpCC5nlr3u4klPWJC76
 VDKWnuvE+/NuIQg5FjVC7xPBBtPsQmC/adjVD0fqPRvSVcssbIBQ00wGlBtyUNwQHBtwxXJ7WfD
 0hzpaUVK8B+NrTzlAhFLCQm/cBuQ17psr/l71CNhX371mfd3i/KQLsD/LcmOg8dauxl6qiwg8EW
 qQnwJKIzj0dDl29fLhdw/iGVPcY2kvTFzSbq8Pq6r+UhpzzUm2BF7NtPH1e3YBVWgqDF7VpdqqJ
 T9CVzYKDp1RUwO9GRK7EQkyXRTS9I7HS2Jc2ZzECeh9nsgIXXMCiqzetYxe4zxDrE/lyjtgIOR3
 pzL6XA11CY5Kk3+MQeSAgPJmSlOyWlTs7Wr5TJfR/iLdaPwmazgHkK9vQLKXXZ/CFvEHoIGqNAm
 Aa/ek5+YsjAxFpiN6ZkIUqwtcnmASjZiWWmA8VQ2WNEHXNdEJmbZMPEKw5duK8bIkb7CHicrfWT
 kBJS4txpYhAnWuw==
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
 drivers/scsi/virtio_scsi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/scsi/virtio_scsi.c b/drivers/scsi/virtio_scsi.c
index 617eb892f4ad..89ca26945721 100644
--- a/drivers/scsi/virtio_scsi.c
+++ b/drivers/scsi/virtio_scsi.c
@@ -1052,7 +1052,6 @@ static struct virtio_driver virtio_scsi_driver = {
 	.feature_table = features,
 	.feature_table_size = ARRAY_SIZE(features),
 	.driver.name = KBUILD_MODNAME,
-	.driver.owner = THIS_MODULE,
 	.id_table = id_table,
 	.probe = virtscsi_probe,
 #ifdef CONFIG_PM_SLEEP

-- 
2.34.1

