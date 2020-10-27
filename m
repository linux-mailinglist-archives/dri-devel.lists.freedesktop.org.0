Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB6529CEAA
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 09:07:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 999706EB31;
	Wed, 28 Oct 2020 08:06:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 961396EB70
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 12:17:43 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id i1so1681442wro.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 05:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=83y0wprNKfgsPdFQwYqYyBfxNCy5k5K/4PHHSUQ4ytQ=;
 b=zjDtGi7YCC7prpyZ+g0XEgVkSu5ur1n0Z+4Onn8lSH6l5HhaPb2usVEdHqyUF70A1t
 aUTOf8Tq+CbFmCsQoZg/QZDfe6BYR/DFPrrBJwD6HiW7tjdfR/sBEWsWaZKnLZINtomX
 mE7Ig/cZHx2rYZqBTjkzv3ijY8hAIfVQDit/QeJSY5MeOkcFLBiM+J08PWHqktFzZQwX
 UlgrIFCSx9xqlv1zNEtaXs3tPI9VHBmr65ek6JPy/L/FS56cLdvQizETmDuasggJPK/w
 ztxubnZy+sT2oOAiJOCkZTqyimYvjT8WSyK/j0zpzQcNL15qg7LbhswKDAJng2PiYjm9
 YBtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=83y0wprNKfgsPdFQwYqYyBfxNCy5k5K/4PHHSUQ4ytQ=;
 b=PCc28RSk8l5v5p5Q7Tm4qOBQVmsOW3KV/MWrJqBcHZ/POfnnm0lTrdZHbCFZcjaaDS
 Ndna1jLIE23/LUoBxfS6JBnZTEDL5LO4G9+ah2y/vUUAlhj5M6oFmmjqMJPDSqzkcK64
 L4WV5AjLPYJTEV5GYiLKtmGlU2kqaR5NgOXyhaYukLThLNs+vDkJL4NxicWcG3yEXdAt
 zdzBHHvV4Efj9tj9ZKc5M5/YIN+dxpLjvWsBxjxTQR4RvL6PrUQhv11jv0ifyokKTe3G
 7abyFb4JI37WHeV/Fe3jyvGdrDUTtYRCmKiS1zSadeJxGgTspaI0q5j3xWy9BvkKo7cn
 ED7g==
X-Gm-Message-State: AOAM530lYqhmoBDJbnRIksajt6E/hf6inzC1CcwZ9T9oLfyxPGUAKJir
 A6MdwaNR10HulWpW2bMVLqVz7Q==
X-Google-Smtp-Source: ABdhPJxMHI/sTmjLh3ji2z2BWBH7Xp+55j5r8SrJ3qqB6liqhHnL/S90fy042cmGylsf7I4Q+2Y+Yg==
X-Received: by 2002:a5d:6a49:: with SMTP id t9mr2477521wrw.194.1603801062271; 
 Tue, 27 Oct 2020 05:17:42 -0700 (PDT)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr.
 [90.8.158.167])
 by smtp.gmail.com with ESMTPSA id a2sm1731908wrs.55.2020.10.27.05.17.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 05:17:41 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Tony Luck <tony.luck@intel.com>, James Morse <james.morse@arm.com>,
 Robert Richter <rric@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>,
 David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 3/8] vhost: vringh: use krealloc_array()
Date: Tue, 27 Oct 2020 13:17:20 +0100
Message-Id: <20201027121725.24660-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201027121725.24660-1-brgl@bgdev.pl>
References: <20201027121725.24660-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 28 Oct 2020 08:06:31 +0000
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
Cc: alsa-devel@alsa-project.org, kvm@vger.kernel.org, linux-mm@kvack.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-gpio@vger.kernel.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-media@vger.kernel.org,
 linux-edac@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Use the helper that checks for overflows internally instead of manually
calculating the size of the new array.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/vhost/vringh.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/vhost/vringh.c b/drivers/vhost/vringh.c
index 8bd8b403f087..08a0e1c842df 100644
--- a/drivers/vhost/vringh.c
+++ b/drivers/vhost/vringh.c
@@ -198,7 +198,8 @@ static int resize_iovec(struct vringh_kiov *iov, gfp_t gfp)
 
 	flag = (iov->max_num & VRINGH_IOV_ALLOCATED);
 	if (flag)
-		new = krealloc(iov->iov, new_num * sizeof(struct iovec), gfp);
+		new = krealloc_array(iov->iov, new_num,
+				     sizeof(struct iovec), gfp);
 	else {
 		new = kmalloc_array(new_num, sizeof(struct iovec), gfp);
 		if (new) {
-- 
2.29.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
