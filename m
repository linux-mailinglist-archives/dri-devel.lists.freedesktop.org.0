Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE984892F85
	for <lists+dri-devel@lfdr.de>; Sun, 31 Mar 2024 10:46:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA46A10E9F1;
	Sun, 31 Mar 2024 08:46:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OaLRqb1X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8159B10E9EB
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Mar 2024 08:45:52 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-341cf77b86bso2244133f8f.2
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Mar 2024 01:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711874751; x=1712479551; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DTHQAQAXVP2yHTVyN3Qf81PY6hYlRsflmkOJj4KRX5A=;
 b=OaLRqb1XEUUo4U9nDovtELpidi+aEmuK/koV5OBFbQ95fZyob80HNkOzEaRZlNP5M/
 dRwnSL8UGGwsFAJW/yHlk1Jg6MOZ9U5kn0uokxVgOxCwEmzUHzNtMtro/Tkt47MQfoXE
 DtqsULtXxyyC7iL6eK17sBFaTRp7/yQAOpklPiJMUSNcJqbWLgTez9ZjltkUM6PvkBEz
 mu+d0ejCj4ugweUePY/agcQLTDsysBXGufwkZ7KMFRlLH55kYGjP3s/iNr7J4ZUV4+Ms
 ZF7DhzLv/IBS0OHVTZSeXz5ru/nG37vGtGaMaj+d1SU11SngnD2Ho/L7JJkuMuTg48IA
 +1aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711874751; x=1712479551;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DTHQAQAXVP2yHTVyN3Qf81PY6hYlRsflmkOJj4KRX5A=;
 b=MR2y8JfwDZGU942byy9wPG+8MEkJoNFK4jA+o1E14VgXqbdvN6YhZ27RCby/JrgxZ6
 3jrx8cTM8VPhpBcgoZV2lPkbPT2AE5jqB3w22oB4Yf3e5GTPyA4y+/Sz1PLy/1GOQNkV
 vBzWmOxcUi3e28XOu21u5TMe3ucgxp/zcfQyjZLo4sjLpNfAJGfHY2HgoKbx2gNBoTJm
 1IdJIO8nBuU6C794YtVffOpTbfuMgaaaNJUhgYWEupEdRHa8SEt7/xSWEQZ7kbi9ymaJ
 BriHfY9hrUSGWO0D9eXg9SR3k6Wp2oYPS2hxqyZhr8A5UTlJE/lZh4SsOhxrvhWgIWGW
 PSDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzgCMqPftKL4exUkYh1KRsMuqF9LD1d96tfwZHsSMadGJmd48YxAXmXn/ju5zfrVRYGGWTMi3DMgDtsCGFmFId6UStPte/rH19evEK3kS7
X-Gm-Message-State: AOJu0YzLMhJv2E4orr+DeiUqtkHxL/UeSgBl0BBz30Sx15OU40dIjCG2
 yWfpazCyq7t51ALGIThOlOLYMGy/xuDdIIyXLYkaQH0KnasATSAL7JoTx6zPGsM=
X-Google-Smtp-Source: AGHT+IGeuGXiCbCJT2fwDI0SEWizUJ9iibgMGqfwV7TaAR+tREdoNJwDLyVfYi67Bn1T1MJNDldUog==
X-Received: by 2002:adf:f804:0:b0:341:ddbc:fcf7 with SMTP id
 s4-20020adff804000000b00341ddbcfcf7mr3806166wrp.1.1711874750824; 
 Sun, 31 Mar 2024 01:45:50 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16]) by smtp.gmail.com with ESMTPSA id
 k17-20020adff5d1000000b00341b7388dafsm8436003wrp.77.2024.03.31.01.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Mar 2024 01:45:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 31 Mar 2024 10:44:05 +0200
Subject: [PATCH v2 18/25] net: 9p: virtio: drop owner assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240331-module-owner-virtio-v2-18-98f04bfaf46a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=719;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=JcKhWFch83brhdG0VtzetHVJQ40R24YKIvpYHZtTLn8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCSJgSqws1ddSI6zt8bZXVN2NyD1CLEpfewZVv
 OwoagjJv6qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgkiYAAKCRDBN2bmhouD
 102lD/wIvu7W4oAOrFSz41pWQt8EAwtItoVXQB9hvcjw/YA+2zX+aydeb02+0qHLAQbGNHBdxfc
 yT1jMBjqC7hm1u0RTSxBcbJJzGs8e2DQ5Vhp70FBMhH5Suzn68J6dOPX6N5wHdff75zMWr9dJyK
 vSMxNyOJ19ThsLo5G/naBdf5gD/wl7GWZ/BynkDrQeahyUwT7EAmobRBH3C58X0PJzx1UeyIaGn
 BD4PrDB3XmtMl2+8fDS+Yga7XtwImkKcCKQmPYaMiOyK8nsvmE0G5mjoqBDyuvj3DbXP5PyEcah
 8siN4HSdpwXj68yE2KgItH1tHOp6PLEId2/8rHBD1Cf8LRqYUpJOSxYFlVCzh0QFv0epWEaRBFY
 t+sVw1BOnmBi6uJ6zpDaomcniLZ7+QMb6J8kX0aGCnE5xhfvD3GSVTn0b4+Zt9glME77oY2Csxv
 27NZ0gLAatWrCnBDi9A/Xe83MKDzfdh5+JqvpcrgsnvNQamvwK41r74/++Ec+O8FElCfF/VXAcc
 ON4Fxjm+sLJHUICUQYzW8QNCnzdVMi6R+G1UPZyqrIbvxfEG1TvL3Sd5Z+A14qs4De367Wz2+XG
 1OHZrEYXkqdpZXUSnF3NgkWODrQkgjG6Fl/9xfwVMVzKxPLTYE5G/yHlgDd6baxF42Rlh2MjRz5
 eR/43u41s6aOCmQ==
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
 net/9p/trans_virtio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/9p/trans_virtio.c b/net/9p/trans_virtio.c
index e305071eb7b8..0b8086f58ad5 100644
--- a/net/9p/trans_virtio.c
+++ b/net/9p/trans_virtio.c
@@ -781,7 +781,6 @@ static struct virtio_driver p9_virtio_drv = {
 	.feature_table  = features,
 	.feature_table_size = ARRAY_SIZE(features),
 	.driver.name    = KBUILD_MODNAME,
-	.driver.owner	= THIS_MODULE,
 	.id_table	= id_table,
 	.probe		= p9_virtio_probe,
 	.remove		= p9_virtio_remove,

-- 
2.34.1

