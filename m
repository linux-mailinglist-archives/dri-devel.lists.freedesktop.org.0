Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B0188E0BE
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 13:43:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C7F610E411;
	Wed, 27 Mar 2024 12:43:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="peqRTIDQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A130010FCCC
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 12:43:29 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a468226e135so801423066b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 05:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711543408; x=1712148208; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IvtYxn/jBnHDfTZoo9tjjvjwD5frxuJyBUKvJwnL+3s=;
 b=peqRTIDQUQBSyDLAO3KDRMYQhlvSIzUeGwEic4cwn0QSjNU1zKqTLCGEIT7udhuw9j
 7XKdPOMLEM9+KAUegTMC/KA2SZUgFMBOrnmGypwiirZG0bCnfKDBpO4XDDXYyDYuMzNb
 YB3AjieD+qH/seeYCU4tEYr5dpJbfkkUCb2N90hK1hvjtAi+M45MgLCDZiS0H+bozTiu
 H0PY39jQs8Z5szZwk7ra7FtBb3xsNUUD+Of7AyZwnvCUeCggT+UGAerRZ4Rp68RFJNBZ
 THw1XDg0gc5fEB/VAP7oJGWoUBm8kJ3/KsV482J2bz47WpjjVopf4JZYsP8C00siDVoF
 94Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711543408; x=1712148208;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IvtYxn/jBnHDfTZoo9tjjvjwD5frxuJyBUKvJwnL+3s=;
 b=LlyLpSXhhOuQPIr8oZYSmbdB0+4+Ge2Mc8mNTgjraqgQ8jajqWlPEV3HuDvt+yPfig
 yvOugTcLtq4CWtDZByXy1JM3Rszuf72zYsc5n62eZQ7gqjTcoRK5P4hmwWST653W0Bfg
 T+IS3t6ZJ9f4boZjKYdQsaEzq8rkunembCMFgeCj/DQCTfAXG98kcsNHznj+OMrSxqgG
 P/NQ0m6smH6D0Z04QcxcokUSsCQr0J8ZY6V5akGZP6bNBD/lbzKROF5rOlUxqsjFxUFe
 k8obWyR7WV31Q+Po1faR7dTFJ/WMep8cqvz8d2P7bfUpt2m9T5tPk/hvv/7e5Ws/iia3
 OqkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/LfIA4pjdBFsa6PcRq2W95H6jNJ4w7ZROkj21a0N6MMx2UjVLYn2orJwSl8TRYPT+rqfwjPJZhiCPhBs1mfPrynRhFB3+N7fIFTUdOZIu
X-Gm-Message-State: AOJu0YzavSrB3k/eAgfnmghIDEycku9gxBuJz1I4IRSHrTbGl/ZRMQLA
 ygL0llrJIzLCUHGpEia1gIjd+q5j5d/EGgR7ho0AKNp3x9TJfnX8kqBjJTo2hAo=
X-Google-Smtp-Source: AGHT+IFQzE941/frKvlveayAo5OwX27t9ISC9Ui//MJIb/s8SSfev7LRMOseQU2wGRtbmTboQ2qixg==
X-Received: by 2002:a17:906:af97:b0:a47:2d4f:6fad with SMTP id
 mj23-20020a170906af9700b00a472d4f6fadmr3640240ejb.39.1711543407742; 
 Wed, 27 Mar 2024 05:43:27 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.205])
 by smtp.gmail.com with ESMTPSA id
 gx16-20020a170906f1d000b00a4707ec7c34sm5379175ejb.166.2024.03.27.05.42.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Mar 2024 05:43:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 13:40:58 +0100
Subject: [PATCH 05/22] hwrng: virtio: drop owner assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-module-owner-virtio-v1-5-0feffab77d99@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=763;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=rFl/6jLaFbtBJ+88FvM913PJ4x0vjfjJ4PxyPcL+Huc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBBPeh3H1wemzDqhAibGWW67UcAFh1HQXSznqt
 bEbHHO+hSuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgQT3gAKCRDBN2bmhouD
 1ypVD/9oHD41Qj1Sqk48VDcTdVES1YvXuuDoKvE3VyWtnVGYiNb60QFQKU80jN6oLcjshjDFPK4
 E9ATN58meESWX5UMMQUPAUThgndBeYYVkY6/3jhOvGFwreHYYn4O2qTukURJ1fI7ASP2fyP/3nW
 zr2qKyF4JGyI2ZhgGugQ9cVcNM8jB7rnMrOLR759/ggj4hB10TDUDnS/PYNpCk5h+ilyPgVaiZO
 lIM7Rl/97VdAbNVvm67vKkma6hKMUwEPWrsQLNcssIjRs4uK15fsCuM6ZDHjQn3u6K/mSnvitSE
 EyW7+cwNG6sSW5FoX1RnBwUYIC3+ayD8aiBjm3Qi9QmwHNo7xf/VXT7UowyM7ax8vMNyNSXkWi+
 hZhp1/+lVuMFTQzw8S4FzsvcPx5VCKOtoQizvNZKcMN0MhhXh8GSusi2u8XPahVqki02HVqEd8i
 p73OVWfBh6OSn+I/RaMqDWLtZAUQbLU69/ujHReW2gJzgZLukbsW9E4kEq3bWO/LuLvm6yFdril
 sg92y2CGcR4zgijh+/THpA9SRF8QURenYZM4NUWlLj3Ef+o54LpKRfdBDST0ZPeeiaaVneb8UWE
 LRajuEBICJqBAAAyaa4VGBaB7T+nodd9jR3MEMAWXS0ZnBrP1efJCygFMbepcVlv5jiKT282G0W
 t4D4aOVlYAW4RKQ==
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
 drivers/char/hw_random/virtio-rng.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/char/hw_random/virtio-rng.c b/drivers/char/hw_random/virtio-rng.c
index 7a4b45393acb..dd998f4fe4f2 100644
--- a/drivers/char/hw_random/virtio-rng.c
+++ b/drivers/char/hw_random/virtio-rng.c
@@ -245,7 +245,6 @@ static const struct virtio_device_id id_table[] = {
 
 static struct virtio_driver virtio_rng_driver = {
 	.driver.name =	KBUILD_MODNAME,
-	.driver.owner =	THIS_MODULE,
 	.id_table =	id_table,
 	.probe =	virtrng_probe,
 	.remove =	virtrng_remove,

-- 
2.34.1

