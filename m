Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B61E088E0D4
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 13:45:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0790510FCBF;
	Wed, 27 Mar 2024 12:45:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="p2KXab73";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D27E10FCC6
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 12:45:43 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-a46ba938de0so890890566b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 05:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711543541; x=1712148341; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JpODOh8SpqDydjsGmjw6Via7WFpVB11YsZ1xvZ5Vpsw=;
 b=p2KXab73Csn0Id9LBMjVDQGiOPLFe7CuwxKhJlKl/xfmu3cnTe/cQmfWdYROooK2on
 K6F6ojPHF8B1/RPKqMeqqdutEuQmiogqwRUGmKJfj3Rr4S/aaJZV0BWP4rH2a9yDWNhV
 OtuZEVx7CgE4lxRoWveDuPPQ88f3h37sZoiazhnM2d9pl9A/56FbyrKAp3B+0D+Y/JNT
 qhr9avp0KiceUZnFnXZMUUcDObt5d6I93T/6xTTpO62LQ3Wx2e2qXU80/2Dgf3FR8mOo
 mRCJ29Hr12LgdJmTzFlflmnQUU+dNXzklOps2eV5dtsY2vErMBfSL4CTjH+JzKq3cVnk
 Jo9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711543541; x=1712148341;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JpODOh8SpqDydjsGmjw6Via7WFpVB11YsZ1xvZ5Vpsw=;
 b=j2ApeZGLjZeohsOrMkq6OjkO5hzzlx+WJM1NO/DKAVf+5jpz1eNbvoxDB+H5i42g3h
 jglZoy7hXNh0CjxsNd2zWh0F4BbMzxZrZ/BWJOZcnUdffPeFS4f6u+FE28lsh/4TYLwH
 6A01ze+HoE4c38DO/Fd7GZW+CYBpk01l6MGJTke8UozUY1OtXh4N1onUMUMp/O9RUFMg
 c9Bd6j2+GndqrEtAAeDYRhvgyn0pC8GjAXY9CUTpcvwNRVoFi3VfHNQMfbpua2cuTxZt
 0c7mdsuxYQmAu5kXjMrPdM2ELAzzZ4ZaZYsI0L6OGmc9d89dKw6xfSAYgkS7abmo/0do
 GBJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiTuse9bbD9K6PTe32Q8vPTfygsfTHockRLHgQ3ysO2BPfJIpwBb/WtbLCrR6l5nkS6psfQdJ1YKvCziy1s9TPZtFfdMg0sBhU3wrnAoiN
X-Gm-Message-State: AOJu0YzFsspqCpVokoG+crxIV1PDvZ9u2SyotrcGijjq0u/2l4qpGOdA
 drYaq5KrlknXiniS5HMTAhIIag7i+J19exZV5cQ9Eev2o8rr3MeoCzg1tzQ0cPU=
X-Google-Smtp-Source: AGHT+IEcvI6eWDqWD1PBGrew0jG/V5c4yhsfSwGlGbpPcqAQ0aJsRX7Gtm1g92tL7NJRpTYESthDyw==
X-Received: by 2002:a17:906:5910:b0:a4d:f0c3:a9e9 with SMTP id
 h16-20020a170906591000b00a4df0c3a9e9mr3515531ejq.28.1711543541620; 
 Wed, 27 Mar 2024 05:45:41 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.205])
 by smtp.gmail.com with ESMTPSA id
 gx16-20020a170906f1d000b00a4707ec7c34sm5379175ejb.166.2024.03.27.05.45.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Mar 2024 05:45:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 13:41:05 +0100
Subject: [PATCH 12/22] misc: nsm: drop owner assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-module-owner-virtio-v1-12-0feffab77d99@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=780;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=rkTpT83OyeYcLFTcFWPlfq1EO9ueUCyja/WSxZqw7hc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBBPkwT30jL7yE3CaV8BYCN+/iF2QF578w++SH
 K+O+AlOBQGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgQT5AAKCRDBN2bmhouD
 1+hfD/9LpFlPpmo0LIxovBV8yHSMe527wWwFBJ/jtDNTokOT1qr5tsLO6Gblc437dKLraA6Id5O
 jyjhJkIiVy3XO1NdcfudmUFdTqABE9vcJJKQhW2nT4ribKRBHNQme4adAnbw7QNCLUPa806/fgS
 hkQlx8/2Did8dJ5+92jQUozhcu9vo3nLWq0cSjHv/Venr0g8dJXzd8FiQQGQMeeBd1VPS1E491n
 GYPDAvFyKRPnmetuDQm7BK2utJbC9d0MLMFC5wI875XRWP0DQAEaXM7H0Yehh08/eq7Wh9WO3Di
 UZfnUJ1mB4s8b2z5PL7WG2MTG/EClvSwWR7VW8CT/hTsmT8N0qeBl31u/eygtYUrOn0XZiNYhSL
 YgP1CFY7lKJOkXB0n4rHAuFcdTNRFe4DL6uh2reZdn5D4tM7z0KursxDh3t5J7uDGR6XbLzueIo
 19ZZXkrXjB+eF9EnnUO6Q3loSOL2FDGBs0yP9CvyrDFeo4Ly3qbfLqqQxcoUysY/PtlCvOuJK/H
 54zdsxocH/qjiDsZwX9NxtaTbc5uj5fQhJAUrGSetA3lLsGQ+GXf7Nter9+bEVuW3gUjfj0hGM0
 wooTlvC1TzDHtqrYqiqdZa/UE9CD5vso4YDeEkuh03eSXDjDIwsAWssPYOOxEY20BlNvAOen5cF
 w6kXIs+XeHqgVjA==
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
 drivers/misc/nsm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/misc/nsm.c b/drivers/misc/nsm.c
index 0eaa3b4484bd..ef7b32742340 100644
--- a/drivers/misc/nsm.c
+++ b/drivers/misc/nsm.c
@@ -494,7 +494,6 @@ static struct virtio_driver virtio_nsm_driver = {
 	.feature_table_legacy      = 0,
 	.feature_table_size_legacy = 0,
 	.driver.name               = KBUILD_MODNAME,
-	.driver.owner              = THIS_MODULE,
 	.id_table                  = id_table,
 	.probe                     = nsm_device_probe,
 	.remove                    = nsm_device_remove,

-- 
2.34.1

