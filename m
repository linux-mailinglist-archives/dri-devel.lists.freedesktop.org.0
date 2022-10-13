Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F17EA5FE3BE
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 23:07:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 151BF10E38A;
	Thu, 13 Oct 2022 21:07:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C84E10E38A;
 Thu, 13 Oct 2022 21:07:15 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id y14so6526364ejd.9;
 Thu, 13 Oct 2022 14:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IZ5njUsMjpaWj9YOz1Vm++un7O5+eC1XTxzvAZerpow=;
 b=faWAR8yx9y/ximCfiagbNCy/0PAKrBsY8wEvnxUxd7VFrwze8WrW/LXuOEsD1B1MgC
 bmzapz1zdHF1jE76T+mA54DNMXKki/cswG3sXkx6RAEOiC9LYHXvBWUkBqkVC/OutC6w
 TBoPedYKZEP4+ld5ZJzts0nQv+3AjeM1WBzF9oIZsaGYMjz2koC525mlMh4cImsSStp6
 XSWzJkXeoFofq4dZ0tkjtoHD4Jl4nliDAg9B+Vd6RKf38AjPS//hn7h+QcZjjgk0xM+g
 X3Q+S3ElOX8GsPkSJbBAoFNFKK+vjKbNMwCVHL9RQlOConV4BRjaHXXF9yIEoDbdhF1L
 19Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IZ5njUsMjpaWj9YOz1Vm++un7O5+eC1XTxzvAZerpow=;
 b=xSQePtiUUw6Z0pCNmLgAlT7Cm0XEEIgzQtQxDQbmiHaWvEGF0dJ/bRdrWMDeCKhnR+
 e6kgPkcmITc0dKy2l37HCVm77KqaK2kBPCbH35Pu9CagZ6sxN233UifGgRZVOyO4mUHI
 lbroKe86oF7w+Pb6/UfOXtZe4qAEkr2vXNXUqdk0iu03BKvNvq7ljNj/IvtNN3fwiGQ4
 K0Xm/Y2qu7PJC75HhG5lBw2o18jdAJtlt7GpmI9QqpTz4TZbTxELQ0oEd7u5P8seya5F
 AxI1or3W4biadFHJZ6T7MdOj6qrn+/07d882Wi/+3Ux7HVhMIDgDjkJ+Y9YrueTerW44
 +U7A==
X-Gm-Message-State: ACrzQf0t1h+LBae8MBVVnr2kzWY6Ln8S47uM/TVKIIj5oFZBlzQg2B9f
 KDsY99OHfMKjROLBgv6rMak=
X-Google-Smtp-Source: AMsMyM4cU3vLsTSiWCSsbEcY7UV+UJBrC5a07f1dY57EL9s1EUxZ5n3i98uvEdXbgJXpbA6zfUHWAw==
X-Received: by 2002:a17:907:980e:b0:78d:b6d5:661e with SMTP id
 ji14-20020a170907980e00b0078db6d5661emr1253849ejc.46.1665695233566; 
 Thu, 13 Oct 2022 14:07:13 -0700 (PDT)
Received: from localhost.localdomain
 (host-95-250-231-122.retail.telecomitalia.it. [95.250.231.122])
 by smtp.gmail.com with ESMTPSA id
 v25-20020a17090651d900b0078da24ea9c7sm443973ejk.17.2022.10.13.14.07.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 14:07:12 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Christian Brauner <brauner@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Kees Cook <keescook@chromium.org>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-hwmon@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: [PATCH] drm/radeon: Replace kmap() with kmap_local_page()
Date: Thu, 13 Oct 2022 23:07:14 +0200
Message-Id: <20221013210714.16320-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Ira Weiny <ira.weiny@intel.com>, "Venkataramanan,
 Anirudh" <anirudh.venkataramanan@intel.com>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The use of kmap() is being deprecated in favor of kmap_local_page().

There are two main problems with kmap(): (1) It comes with an overhead as
the mapping space is restricted and protected by a global lock for
synchronization and (2) it also requires global TLB invalidation when the
kmap’s pool wraps and it might block when the mapping space is fully
utilized until a slot becomes available.

With kmap_local_page() the mappings are per thread, CPU local, can take
page faults, and can be called from any context (including interrupts).
It is faster than kmap() in kernels with HIGHMEM enabled. Furthermore,
the tasks can be preempted and, when they are scheduled to run again, the
kernel virtual addresses are restored and still valid.

Therefore, replace kmap() with kmap_local_page() in radeon_ttm_gtt_read().

Cc: "Venkataramanan, Anirudh" <anirudh.venkataramanan@intel.com>
Suggested-by: Ira Weiny <ira.weiny@intel.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/gpu/drm/radeon/radeon_ttm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index d33fec488713..bdb4c0e0736b 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -869,11 +869,11 @@ static ssize_t radeon_ttm_gtt_read(struct file *f, char __user *buf,
 
 		page = rdev->gart.pages[p];
 		if (page) {
-			ptr = kmap(page);
+			ptr = kmap_local_page(page);
 			ptr += off;
 
 			r = copy_to_user(buf, ptr, cur_size);
-			kunmap(rdev->gart.pages[p]);
+			kunmap_local(ptr);
 		} else
 			r = clear_user(buf, cur_size);
 
-- 
2.37.3

