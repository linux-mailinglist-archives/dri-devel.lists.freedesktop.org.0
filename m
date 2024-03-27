Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDBA88E0CD
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 13:45:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F27EE10FC5A;
	Wed, 27 Mar 2024 12:45:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="R2wi7QSe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1308F10FC5A
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 12:45:03 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a44f2d894b7so818548466b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 05:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711543502; x=1712148302; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=M0hmLEhtDW+HCSY30P31S1H131D4FuLuLKkbSxHVWro=;
 b=R2wi7QSekNhyfFGoO5s5jL+rmBADXSnYvK367xVEQ8K9oRQmuIyhbLWJaruBdDgch9
 ojH2Dc7oxyggClCL5GbsiXeI3pi5+7uJvhRk04UO8nZIhAf8c/DqFKeEkrHb4adk4V3U
 mS8oihrqvCzGTfc25KsmO+eku9l5o2mh0mlmJ9eqK+hLAmQtc6i0z9G6nDuPb/3gMeCf
 BfSdVfIMdjzSZsYGSqXlpmQo+EcKbyRwrIaUPg1moT3CfLLr+dY3008xAX38vJt0FIFk
 hdRsMCA64ORtDDpoRYaxhvDlvygMu29h6KvlNmOvGkp9w44kz5nYHbu/kfcSdRwAicDA
 45Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711543502; x=1712148302;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M0hmLEhtDW+HCSY30P31S1H131D4FuLuLKkbSxHVWro=;
 b=MM+Yv8PD6mDTzPZlJFUMF5ChtXzwr2rTw9A5vDI3tgYK/iqVKtzTfd0/V8S63+zCyz
 yKwe5LlDH/Tuu7diRFgWqwRnTeIqVBdhIkg6s7IUpp7xd6JeEcgdlaj0Ho/yxQxSm2Ys
 FcJ6KZp2mobKd2/epyMU0ahE2F/8x7jmJrCxxs1eCtVwJOdIdYgUYUt+3hvLhRZsWQUj
 qBDhec1h1jM0d+MBBm4butoCHgsEBIg13J5gt52WJFFC3gmaXDlJzzIqCoYA3/uUAYlR
 0s0/gofzKOm6S9tPvTb3Kq3VA3pLnFy/dYHxrUamKRIaEdLaxmFsGB5fujieCdGycz1N
 pxzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRiY462dbeEj5wKYrXIG0j8etEHXACUYNVCXKEfn/82KI0aEz1cycZ28OczsgK9ZdQ5N2NsYR70PZboMgeMnL29F6M7Ec2JTKv2daCT/X4
X-Gm-Message-State: AOJu0Yw6NVe8KAQ0Wz8lX1h7pdj3CAVaq7qlEZp2R49oWMr6tNc6pk+x
 8j8v7TttrXI1d2lquhnOJhC9esc0ESPRyHyKal5vo6Og1N4MQhcLyGih3aYLeaU=
X-Google-Smtp-Source: AGHT+IEn6vRTkmoHQ1wiFr8qmjh3PJ0Q6up00xiHporN+nJtNCU2vs+jLj3PzJepGOiy+pfR8eLRwA==
X-Received: by 2002:a17:907:9729:b0:a47:38c0:fb4e with SMTP id
 jg41-20020a170907972900b00a4738c0fb4emr4546499ejc.19.1711543501964; 
 Wed, 27 Mar 2024 05:45:01 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.205])
 by smtp.gmail.com with ESMTPSA id
 gx16-20020a170906f1d000b00a4707ec7c34sm5379175ejb.166.2024.03.27.05.44.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Mar 2024 05:45:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 13:41:02 +0100
Subject: [PATCH 09/22] gpio: virtio: drop owner assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-module-owner-virtio-v1-9-0feffab77d99@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=678;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=//Clpegv8bBxUlHlrbVbhwLuVMMJ/bk7DPF0aGjgRRI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBBPhAflQ1FGJhDAzbOegIOtyn0DiKBCT3tO0B
 s7IjiqYlSaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgQT4QAKCRDBN2bmhouD
 1wlSD/43RfNzYMYcTE6YGm6f/+zF4ZOeA7+AFzoz25hWACnn09ZJUKsqo8b4OOQmqYEITbWY9+h
 XPRwnPPXeNlc4DgWGOJbLmvCBCUuBSqKMyqIVUHeiKQYkKcodvybd1f5lbAL+Uom9vSnbje9Plv
 wIiwg36QHAiGjrP6FCrbFTARU+u3TVSo9UrmxbOR/Cs2zcsROAS787ue6dERDMHRhTICDHzchGs
 8lirSnX2eLweIUdLVeflXwAHFaVpdj5k9bUmCEJ9y8Dy0+5TaOREm3IIC+BMGqKTPwXr2xpX3Dd
 iUxBWyxquOdJ4D2K/0LVhYSSC+VtEt5ZZuC3ZoWa4HTxJM5tAElcgWaOQps1lNfT5UbRtK8uoQi
 iqAyMFhheEhnye6diL6L4H3hulkrYJw6LN27JtLkTStHd3lYU+1MW7TqZMKXQcujQNGhdzO9d+m
 3of1UO+mt5KeIH2CAx/mgbR5MLfW609xLhuHPWn3i/GzYYdKJxXMrj25rctSRtBvtmGHD8iF6o7
 CMdorn7Yl1SzBIoYcHUmygb3XOTnW7Zn+L9RB2k2epy90G6CsuIsaV5Plxhgk41/NsTCYyh6gWq
 GCkiLrJ9HW5biRhItd0RUt02PbEl7Tg1O0q20/cwbVq4IAyTVScxVYfx4ilMNlem9KQg/2l7ayl
 fFGCYquCVzZZykw==
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
 drivers/gpio/gpio-virtio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
index fcc5e8c08973..9fae8e396c58 100644
--- a/drivers/gpio/gpio-virtio.c
+++ b/drivers/gpio/gpio-virtio.c
@@ -653,7 +653,6 @@ static struct virtio_driver virtio_gpio_driver = {
 	.remove			= virtio_gpio_remove,
 	.driver			= {
 		.name		= KBUILD_MODNAME,
-		.owner		= THIS_MODULE,
 	},
 };
 module_virtio_driver(virtio_gpio_driver);

-- 
2.34.1

