Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4211D88E0B7
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 13:42:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4437510FBDB;
	Wed, 27 Mar 2024 12:42:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="efi/emPQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81C2110FBDB
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 12:42:52 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-a47385a4379so152378666b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 05:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711543371; x=1712148171; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/vBka3ABZcniwH/u8QWX2xHT7esEXtapMcD7AcTvpic=;
 b=efi/emPQBbP5vwg41cgd1i3FufwkT1jJrpuvcccG/5gOYds+Zxg5QbvQOj8OGpa4zO
 TaGRhy203S5CTDane94pq3HVJmPUKQJBcZRaXK/nXXrvy2SMz4ZRyO+Z/gw/CrsW4vAF
 YQKsX7ZrEFq9NtLmUT7YrAXG89WS/0u8C3W+lhWtvFBA+YGXVzh2CwUPqeJZ00mDBOhn
 tmrX93pr3xge0HScojJTsSdvtmRnjcW7dBoIO0RVVCF+7CcGKpRA+FaKZ+zEG46BoKtN
 yxIP+WU/kopyv97SPJNGqhXNsPsnSjROSevFj2cxzwTcXJoMMjM/iqqX6tpf35nHAsao
 KXgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711543371; x=1712148171;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/vBka3ABZcniwH/u8QWX2xHT7esEXtapMcD7AcTvpic=;
 b=LPwb+UnneHUKAC1Kfeyb5bP8P/Q5E+JEFul2i2AVl1byewNuZ0FQr8CHMmXgAyKJxI
 qp5jnbHU0eoUJblwt2DWvHa+0BFBzEuVdi9xbUWtkV0pkrR4KuzYD2TPSU6d2M1LTM64
 mOBCu4yUmzfS0cRIyapmeVdlQfVqh8yai+9c8rk4lgW/v8hY6Xbvss5WY4NRWKJTZHBb
 IocTScqrVw7tRuC50/FnqbSQisET2ssjLnQTjAMsYFqZmDZJZVmBO9Oq3J3KUFcUquvk
 J6DcjJuqleLLiZA39OlH6NPZOv8WC2hH5EQ4K7AQsWzJ/gRKzo6G71qM+aVawD1C2SkC
 KH0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPbjKpO/ozrtekrRPiBJl+odOd9xAVJQ/bQgCxw3ytQZZ1PYnomhVuNG9WGcUCdUrWGpVCafCchSylbZeMU0LcKcWpEhVdr3qHiMmQSz2z
X-Gm-Message-State: AOJu0YzRQXip6C24AVNoSc5OyLsUw3yH443EFKtghyQs5TSKJMt/Najx
 UkCxoO6RZb988lbNsnhoAfi7ejD3Dz3jC9AIFkxhwhyrT/FV2HqZzfDsHDbOt+g=
X-Google-Smtp-Source: AGHT+IG5vuCEMnJybNEU3pw6Dfhrha9UVjffnJEN9pSayVDfDg6+G0gg3OeqyhGazXN+XfbDGEL4yA==
X-Received: by 2002:a17:906:5645:b0:a47:34b5:fa6e with SMTP id
 v5-20020a170906564500b00a4734b5fa6emr3936509ejr.2.1711543370618; 
 Wed, 27 Mar 2024 05:42:50 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.205])
 by smtp.gmail.com with ESMTPSA id
 gx16-20020a170906f1d000b00a4707ec7c34sm5379175ejb.166.2024.03.27.05.42.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Mar 2024 05:42:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 13:40:57 +0100
Subject: [PATCH 04/22] bluetooth: virtio: drop owner assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-module-owner-virtio-v1-4-0feffab77d99@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=797;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=RVE008LGGmmk5WXgZGxtm6p/ays+12n/AyoNVnX9umo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBBPdBdOoV7iseHu8Ha4ifJV+o69aPjmkC0Glb
 hZvw0OYKhSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgQT3QAKCRDBN2bmhouD
 1wI+D/9dbQLSRFm34TU4Qv7YYw/ixrbQYbzdht3LbG49prmr+l9PRN+lDKM5C7rVEcSei80vRnM
 TiW6KxYh0V1FcMmWftM5R3iPFwUdsjSJJ8STF9/qxCFrtRu4JF2jLy20hTeoVbp18elVq5cPQX7
 x0ZT+2U/6ejc+Tj67MUtextCGgzfAnxyzk869i8eMn5+xHxfOheEJYs56sRxZveNqcH02H3SJzS
 lVHZpxQrf3FRGgcwHAPt3T3Xdw8Z16tpAtE2x8gC688DaS1Xf+F0yjXhNYUD3TZ2Nf2LOIirHft
 RqrMloYSPBljyoR9aLzb+/TS3YpVgQlAvKN5d6tmlJ0nE9har9+fKbx2BcRrLp/6GDENjqsOo/l
 8CB/SP4BTOX5vsL5yzZ+pY00Qmxt0ejqUXPkWtmcx1XbG9w2k8k24TXnlZCPdLXrLhnZ2jI9LT+
 zBfzzDbBRNwOCPfTHDN6HNuuxYCdwPAnpCXF+I0jmGk74U4igIav9OArAmrq3hKZBqbWqOZI0BN
 vbbrFOmyQQ3Nr/FfhrtNyG373ZzkyCTApUHwmnIEwpxTiKH0m+OVNyP38BY9vsn1/ZkBfOPZZyU
 LMQHmHackK+l1II6lBOJVnPTDqc4EvqiFx/LJsVwQvunku2hC9omSwT9D4Wuv363XinjYsbSqRE
 G6BGGHfVkJ9lWYw==
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
 drivers/bluetooth/virtio_bt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/bluetooth/virtio_bt.c b/drivers/bluetooth/virtio_bt.c
index 2ac70b560c46..463b49ca2492 100644
--- a/drivers/bluetooth/virtio_bt.c
+++ b/drivers/bluetooth/virtio_bt.c
@@ -417,7 +417,6 @@ static const unsigned int virtbt_features[] = {
 
 static struct virtio_driver virtbt_driver = {
 	.driver.name         = KBUILD_MODNAME,
-	.driver.owner        = THIS_MODULE,
 	.feature_table       = virtbt_features,
 	.feature_table_size  = ARRAY_SIZE(virtbt_features),
 	.id_table            = virtbt_table,

-- 
2.34.1

