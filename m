Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DECB892F66
	for <lists+dri-devel@lfdr.de>; Sun, 31 Mar 2024 10:45:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19A6810E9ED;
	Sun, 31 Mar 2024 08:45:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="x5FI9uMr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA9EE10E9B8
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Mar 2024 08:45:15 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-341b9f6fb2eso2306837f8f.2
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Mar 2024 01:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711874714; x=1712479514; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=X5+XUlpPqxzudteQHjuSJRjlJzQJhMWAmtNdNyAF5ks=;
 b=x5FI9uMrXOXZQejXhiOo5cQ8yVu+vYCa5vRj1F+RKjSzrAh7Vz4mfGiZuNgQhNorar
 QZnq2O7xIf6kzCablTud2oQvmgvVZQrYIBQNsqmXpWuvfdgC2D1jUkydUdGQYFdftcF1
 uCM08n8pI/J4Wkypw1uBSE5HkUG0YisZXizQlTz8MTEPllwKxHcAcovuaHAMp+zsaTCv
 LJjhvXytgqlUnDvehJyEa7V2aZwN1UI3V3B63mV6Wz67neGzOFFyJyd1gpkrvKEKC8k7
 xXeaPMWzkLDkUD0YXO9ugfg8F/p5PcqanR8srlScUraZvHl12bZIgppLV+Z88uKd4HGw
 r4Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711874714; x=1712479514;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X5+XUlpPqxzudteQHjuSJRjlJzQJhMWAmtNdNyAF5ks=;
 b=UFnv+vDaXvYt41aLthGyEW3eRI1RzXS15GvYOSUmJ+JJwWl5eqImZ+RwgVu1ShgNZx
 7KGqRtTAcBL0XJ4a2/U2VRFHBZUD0XuACrjXC5dSdaVxiNWNeHW/j6MNeVNd8R09V/FG
 YDzCwAhM/E5mtAhvQtERcQLBDfNSviE1qk4EPO3pmUg092vp6U/o0JwupIgDQLYk/QMl
 BWSUMaeOYDxGROn6ZJRtkiF9UrlyRTrdH0NCtLvE6AG/I6Wp+N0Ziuq12uYzKJ9/4RtE
 1Lemw9URHs0phYcxZli/lLQMruF3XPMuLnAwpudI8/TxWy4SQGjiJZ3DtiA/HXyoD3dF
 hiPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWQ12quHNQoisKQ9bSOcySVCXrtuRojyT3XAyeqWAu2t/2LFrtrc0f6Hq1k4P37cLZ43MdB+sTeTPZHRy86q462KjJrRzhBAUr9xv0Y9Co
X-Gm-Message-State: AOJu0YxXPbANcRS+Zy/UZftVtVYXVX945UVehuPDgGq1j9/7AVwn9Bs7
 xC/k3MVoWs2KsT99TNat/zZhKvnc80B2HADCbehYNB0Hm+Kn/kX11YdaSACf5BI=
X-Google-Smtp-Source: AGHT+IH2LHPE+exOtXRbhHP/aBGtBFvAdhKeIYyX3WM4qycDkcv8E0/vxduBOg23kfnXKfj2q2HsLw==
X-Received: by 2002:a05:6000:2c4:b0:33d:9c56:37f4 with SMTP id
 o4-20020a05600002c400b0033d9c5637f4mr5831664wry.46.1711874714173; 
 Sun, 31 Mar 2024 01:45:14 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16]) by smtp.gmail.com with ESMTPSA id
 k17-20020adff5d1000000b00341b7388dafsm8436003wrp.77.2024.03.31.01.45.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Mar 2024 01:45:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 31 Mar 2024 10:43:57 +0200
Subject: [PATCH v2 10/25] crypto: virtio - drop owner assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240331-module-owner-virtio-v2-10-98f04bfaf46a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=855;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=BF5+L9M6rh/9q/lpIn327dnJkaSg5SfZZk5BFIHRLEw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCSJZw0wPIonCf5RhhphpdE4KueEP/htz1gull
 t1dHhV557KJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgkiWQAKCRDBN2bmhouD
 19SfD/0Xz/UhiS/Vm88+cqg+ex0ugKfv2vgcDRPTavSfKVIy4ULcTDrotZ3FBN/uOoQRRgGvlq/
 TGVzg96DYQGRVTyQJsbX9ps0uTC6EmUVSyS1ImV7M/ExqVWM9fTH+5ZmbGEiUWt0d+8oXNZwLRg
 v3mB576m/SvPmdaYkKgRFuGx0h5zWQtVd+CurcLBjn8VzzlRBlJ1/LvSxrLqUTkBEeIreWMyEat
 T4yMgMn0Z59SVugwqFdBLslHq99SQ3C5RmNZi+X0lZnksb6lkBcukYV9U142vFO8UI0IYOlu6z9
 0WfXsDbi/jwIQk9FG7EfqRDOJ7+eekIH1wrjv59jfrZP45xwFZClYfdqmScnKKl7p4QfuygBBqT
 2QT+nyq87qM/IpRuxvuoaFJ5494gF5GXRsb6xfxr5BdApOrHpGB89sXEoTZMWJ0lie/P/KbT3wU
 xIl7R1kG4z0PPbLqfca2KyWCChqlCdkLzHg5QGxY0i+3nrFXzKO9BQeG3uIj+ziStFUoIprujsb
 V1SHo/6AnpltJMfFZsZ8yglWEzIDwAo4d+xGE4veLyu5JJjyHh9m+xf0GdWE20QbgxuOUysA5tA
 +GOs2DRCsx0ymZ1i1LYuIFta4lRKJuKbo78cUP1XHG1iFrTMqGxqdxKkQ0rCvZQ/IoubRVoFtAE
 xkY+iFu75RCgtQA==
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

