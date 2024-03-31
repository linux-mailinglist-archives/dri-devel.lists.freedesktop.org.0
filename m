Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0991892F92
	for <lists+dri-devel@lfdr.de>; Sun, 31 Mar 2024 10:46:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 433B710E9FF;
	Sun, 31 Mar 2024 08:46:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vyf9J/KH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 207AC10E9F7
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Mar 2024 08:46:24 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-33ececeb19eso1933399f8f.3
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Mar 2024 01:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711874782; x=1712479582; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PUGaKwdvwMokLlZR31UQgBcIJ2q0krEU+yZMO7QbwcI=;
 b=vyf9J/KHnMmqaVaogzGIKNOb3tzBNrIvYwxV47+zcNIoAzf9B5ylFFAm+AA5DUF5qp
 +MRwpF2ySKfQwN30xNIXXL6WDM0yXM9ctjUrv5SBgFscM+T6r54p3ErfLbqx2tpRTDWF
 iNHIGNGt9Sp1ffbWo4SJJbGxtLNWWFc2ODEhVzz5WiWW6qHp3b36RrROc9GWgV16+T6V
 yr+qlSb4BquFbNl5D6CI1aG0r/nCWBYKjaoPguA6ChO8r+MhFlhUtrBwfWFsNjdQNlIR
 0Hsy+y/rWap4BQ1FTi3uA33tyDTxhOOhfrPm1kiUZzTpOuSzRz1UQ1YZ0HU0NkTMlfj9
 fWXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711874782; x=1712479582;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PUGaKwdvwMokLlZR31UQgBcIJ2q0krEU+yZMO7QbwcI=;
 b=N06fjkX8+7p3t/INN+ABuTlVUKZUPBUZBYfX5YNuv9thZ+Dx+312wh5jfKC0nr/Yv6
 f/IJtRASGdXiJ4KAuacjwowVnrgAK2qldFuK5stCUUSKI0KSVa9QSB+64WxfPm9XsrMz
 TTU1sSOd9DHBxo1mZzf7SGO8o6PP7sMj9/YNA65EENQ0aqIMjHls/LMwCqMwKW4U6MM2
 ea2glBuCh1GnC5eeP16xSBc9NIY7W0relOMS/75E+BN0g3Uzuo8JqEcodiS3kPKQw/Tx
 /pYgNBcDZVUR9HhmUTEWvypqS21M4o5zMBytTdODkO1ZaY7yRuEs0YbdgKTVUR/Tv12I
 NS/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqKwZKzJLVsYIrB4GlixsBjfeTK9fNbmmtmNkrnJyciK2L8U8HcGhmDTP4oVx7xwObjP7579C4urohYN5YSkPPkWGI0adyFg+bQGa0RZx3
X-Gm-Message-State: AOJu0Yy8SG7OJJ8eoo4UQuWdp4cMnb5a67PFlwL8GiUu8qZeAjFqr78d
 bUFGjtp6HB9CpFzKd6+B5QH0To23k7/fGD3t2X26p19MVrobvkZunX5fhY7VWMM=
X-Google-Smtp-Source: AGHT+IF7MARc7H4ZqzG7wJkQ89qaWtgYzIyVWgX/basw0DoDqcekmy5aXwgVIVD/A5uDZbyMRmIPWA==
X-Received: by 2002:adf:f88f:0:b0:341:d2f9:494c with SMTP id
 u15-20020adff88f000000b00341d2f9494cmr3575737wrp.55.1711874782419; 
 Sun, 31 Mar 2024 01:46:22 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16]) by smtp.gmail.com with ESMTPSA id
 k17-20020adff5d1000000b00341b7388dafsm8436003wrp.77.2024.03.31.01.46.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Mar 2024 01:46:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 31 Mar 2024 10:44:12 +0200
Subject: [PATCH v2 25/25] sound: virtio: drop owner assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240331-module-owner-virtio-v2-25-98f04bfaf46a@linaro.org>
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
 bh=ZZgxTq79++b7HHq30K3VBjFNBWdk1QKSfVGAvnwx7/U=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCSJm5t8lRjxPTys8b+WU0OKgg1LgcvzKJ4xNt
 n3OV06BuwyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgkiZgAKCRDBN2bmhouD
 13W/D/oDYwucjXt0Tt8Y0Uy9LmGcrAbjofc6FyMbOg5ZcMm5e3+WVCaJvH1GzuMW7eKutG1NKq4
 SG+22VBevobbwXkTrzQkvyrydccLRDbeWLWm+HJad5tojpoFvW83SYI4iPlD0b266lNVIdzpKjz
 hcUgfDLubJvg2WN81urFjglAG74SusSyGpct+7+xypg9xUvAMj+j+vblD6MiYvdlR7YTT07NpVb
 CnsXjptZ5D0mdqdAp/yyZAVgxH8IatToMVp+zeRzRlVPHc8mepyeo/z9irAjfvJMoh/GGv0t6Gr
 6lHVgN1q09NOsaKCBvZgBc1M3JNDSEvRjO4LMT7dAINa97EQdIp9+8ZpNqqX0RQXYDulXZIS5+F
 Fi4LuIifmxFvnLlK3XGafTiE+izB6Av3JwLIwcg0Q9VTwxzmWeoDKL9c1o0P/bZ5TzBsp8cO5Az
 EQrw4GwFCAMD7jfVzip/IzS25Sgb5lVDNqj2sWyi5R9/l0bzGoRd8h0nMUo0h60LV8+UQNG4Qn2
 Z5ijAWCJJVA4mNoA3tp1IfoltFnoxAy+WhGYLKaLo80DfbVnlQAHuwY8P4oIqsfEalA2ZTmhTBx
 qz3zO+FBApnCfqIytRnVYYYjPxsP+kbjFVJOBhR1fGzSU1/is2cPkZduK341zXENT6nHwkNDVK4
 VB34pc8fk3aFIrA==
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
 sound/virtio/virtio_card.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/virtio/virtio_card.c b/sound/virtio/virtio_card.c
index 2da20c625247..7805daea0102 100644
--- a/sound/virtio/virtio_card.c
+++ b/sound/virtio/virtio_card.c
@@ -438,7 +438,6 @@ static unsigned int features[] = {
 
 static struct virtio_driver virtsnd_driver = {
 	.driver.name = KBUILD_MODNAME,
-	.driver.owner = THIS_MODULE,
 	.id_table = id_table,
 	.feature_table = features,
 	.feature_table_size = ARRAY_SIZE(features),

-- 
2.34.1

