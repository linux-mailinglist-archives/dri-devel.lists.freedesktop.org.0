Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE4C892F3E
	for <lists+dri-devel@lfdr.de>; Sun, 31 Mar 2024 10:45:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44B8F10E9AC;
	Sun, 31 Mar 2024 08:45:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="J4amYidp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3011C10E9AB
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Mar 2024 08:45:11 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-34339f01cd2so1605142f8f.2
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Mar 2024 01:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711874709; x=1712479509; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=EPamPBtPxW6+pkIV3m4EaBMhb46zDx5KgvXpbm+zagg=;
 b=J4amYidp6cROuoUmM3D7tQ+SKm+sV41yMVoQL1r2d35+YwibjiwBYl8maXSGrD4LWB
 +Qnlthi8Dny6yTfx9kdEWJyErv3S5zmyi1HOWy7/nJeBYDayUNPPUGzAKbfaVz9Ls2ZS
 WerYuFuioZXqHDiVoSplgUhDl7KS5bpKEj1M62K5Sf1w4lul0vpSqDB6PfFcJswMfhQ9
 7xAlNktMxrXqRiNVA3gWecKDJPGGdLa3V2Dyh1CQxskUU+j/E3KPw606upvNjuMMDGG/
 CwEz1HWYrTpYK9dCzxa1Z52vgVf004sv7ag0uGXxnf+KFrae2d+UkwywJM+hkJb+497F
 N/zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711874709; x=1712479509;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EPamPBtPxW6+pkIV3m4EaBMhb46zDx5KgvXpbm+zagg=;
 b=HLEKSnnrkMZwyE/elaNuLLcuar6ASuU9/Ka+QkV7gjzPRLd3Xevr09sGNFMrazogo9
 iBEtdhFZjAl2IUyUqGFoRkXUIQpy6BDYsLNrI2Gvi4hMeEvVcusGuSpwjysI8IytvZps
 3H7DMqKui32gQ719Ej27IM2L4kq10UiWIRVxSND6656aeTVIYheMmc2Z/U6rHuTYiKYy
 HWR/czE9VjzLLqZDIP2Ajwg4prC673ByUW2KHWLKLTbcFtFfK+k8GbeDHjZczd0hZgkd
 ThsQOMQbMK5vtPcu4xW1s8UK6rmeajUl3Ip3z8heI3LXftFjZGuXGzd7xPdJ6jwzY7Im
 Euhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIMYSK2pP7lMkv8OP/aPvIv2Wi15EjqYz4/JjyMGD/167Yp4UYlDV+5VIlggVKuReTKSVhj+3KiK2dnlIumWcSZADA3CBq3K6hW69v7SXt
X-Gm-Message-State: AOJu0Yy2RccI5SCvYjmSWoFxRICdQBCANsL7HdUoAoGsmIZEORwd2L1U
 DhjzgHhdqFtarBZIhOkfNulUEEeKsTi5nmecyoqZ4rpawsrhGwSpO46jrYZLUQs=
X-Google-Smtp-Source: AGHT+IG3jSNF7268J0E1HJfmQrmSXJ4Wl8mFjBEZXGvEomzawa1g4Wm2Mox5PQKcv6wxXeChlF8YxA==
X-Received: by 2002:adf:fe87:0:b0:33e:ce15:8a15 with SMTP id
 l7-20020adffe87000000b0033ece158a15mr3641010wrr.5.1711874709483; 
 Sun, 31 Mar 2024 01:45:09 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16]) by smtp.gmail.com with ESMTPSA id
 k17-20020adff5d1000000b00341b7388dafsm8436003wrp.77.2024.03.31.01.45.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Mar 2024 01:45:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 31 Mar 2024 10:43:56 +0200
Subject: [PATCH v2 09/25] virtio_console: drop owner assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240331-module-owner-virtio-v2-9-98f04bfaf46a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1103;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=CUCGqZGlbwrgPkwPeA7fzEXfYZ5lWG+kw/qtWPfvSV4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCSJY2K0WgWstI+JyoJVlI8wvHUdkoPQyLPDHn
 4y16zZ8fXiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgkiWAAKCRDBN2bmhouD
 180zD/9DCleQCk0epueksPN87k8Rp6GpcfhV+x4ryTb7+1K/feJB0wQfepIMa34bCTenS9UDOq2
 17ccCayDu3cNPaVqPJkWZB7UHFd3M2I8rG5Zqv528TsLUB5P3GbKEzcbyWqO5e4agxHE8cl7Tj7
 WxP1hYOzNaXSzfgBdmLEdZnCkyjCjsj/RIsXHYE8MS+ZSxOj7lM0opJpEh0nm1LFrwJ2qBc7/He
 vC502dc39B5RmOcBsqj3ddPhdRhpLfNdx4gAx6ZVOKGRozzVnMD+nk2Fq+qw5cTF65PYbNVfiW3
 AjKdSMYJ3DeXggQXymSeoR1ShLp7brAPxaXnmtWrxc85IQfO8gZWq1+hMhjUZF7ufo60dkFBjDz
 mCwrbXy88PJtANZ1FIpswOU8JKtrv46Htzjm7Z9zDzUDY9iXPHJFYH1Pg/cXtyi8vzEjpE2XW6L
 SnnfiTn3zE+JLip/Gk6QPHvHJc3RjcXC8N675rP1wBc1xZ/5JkNuCSCMUHTviSCx1VCcyP9vfPw
 nrbK2ErijtG+z1HgWesUOmEVRyAKQsJr3pzDuAHRRgxKPPP7fuZHNBH1ddvq7lYw/S5sxT4q+pm
 wU3Fapsvk4HWIMkJhBfYxaHhi6SKit31adV0tbCNXvebNcsyFe6pgKRsPlRXbNuSiMeYZy4VS4p
 80u8Jql9MNv6YBQ==
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

