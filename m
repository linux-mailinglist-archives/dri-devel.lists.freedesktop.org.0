Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA30F2AD0FE
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 09:17:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5383898BF;
	Tue, 10 Nov 2020 08:16:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CA358991E
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 11:07:02 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id c17so8203948wrc.11
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Nov 2020 03:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2uLK4LNo7fJGEwA0NXfYaAQzvkTW8/WkGHuVu61FcZ4=;
 b=SLmwWdYmA2Su0OyL+219YDZzeVXOkzpy5gortE6aVnwng+6cHrJzhAQJzNByqcPbPZ
 isbE6V3Lb9JgstbUlm/PZvCpNxelIDnwHLTINtWIzMAUAJP+6YLk/AWf+cW33RVJOvLq
 4EQlOOLu8zd+gVrxvr0w9485FxLsZ4uiV1jlwgDMS4E7kDkszYjvid4w0z806pFvA1dO
 U+nHioEgRrLmfLyR8tH/H/Ge3+qH76H09ubPywZEg/u4KcGzZ6YzgnyKXZKxxyWIo1cW
 FT3Tuwvxb43JhyG0QmKnG/8uRrjp2S/bO4jEisldpzuA8EOA5eJuEswwYg/l6KV0K70j
 EAjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2uLK4LNo7fJGEwA0NXfYaAQzvkTW8/WkGHuVu61FcZ4=;
 b=LjUyDaepr3YNqAz3NZ5slo3d8RpPY/AbdJ8rCXkT+vvBspOHQ6drm+XM51BZbfXymJ
 a2+rwqwx4JREOaxsnRRKCcKDxZzHxt0Rc2n4Tlx44sw+pT5k30ub70cCDL8CvRsHYpv+
 1geLavAsNZeEipICvXTFAJMevmfctfvVkex6cdkhLHGJUnrMsg7AQxF+qV99j9BtRKzH
 PyGpppyhAaOQZfJO5MEJ+Vtqej1Z+nvKJfrgXe2Gn/K1ebo5PKZCeJQ06jABp8hYQQoA
 S1JFilkdRJ4CJoyCD2aciiV6H9NkILGJBuLEputNMA2G3QCw0OmCTn1thzBiKjTgvhzS
 c4sQ==
X-Gm-Message-State: AOAM533yooB9iJvy8xRJS4GqQiV3AOibnXG0I9trUJTSqj1uS8GXMFTF
 PMY9vioFtD7DoTatVz0bBg25gg==
X-Google-Smtp-Source: ABdhPJwC1VmwvlzIaWje0LLMyGfNJlg7DPW07nQhl2YWyOW+KS6oIpzkSUqvI/A14QOWWdg2F+P+tA==
X-Received: by 2002:adf:9b98:: with SMTP id d24mr16961027wrc.17.1604920021208; 
 Mon, 09 Nov 2020 03:07:01 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr.
 [2.15.39.206])
 by smtp.gmail.com with ESMTPSA id d3sm12815582wre.91.2020.11.09.03.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 03:07:00 -0800 (PST)
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
Subject: [PATCH v3 1/9] mm: slab: clarify krealloc()'s behavior with __GFP_ZERO
Date: Mon,  9 Nov 2020 12:06:46 +0100
Message-Id: <20201109110654.12547-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201109110654.12547-1-brgl@bgdev.pl>
References: <20201109110654.12547-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 10 Nov 2020 08:16:56 +0000
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

__GFP_ZERO is ignored by krealloc() (unless we fall-back to kmalloc()
path, in which case it's honored). Point that out in the kerneldoc.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 mm/slab_common.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/mm/slab_common.c b/mm/slab_common.c
index f9ccd5dc13f3..d6df73f79204 100644
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -1091,9 +1091,9 @@ static __always_inline void *__do_krealloc(const void *p, size_t new_size,
  * @flags: the type of memory to allocate.
  *
  * The contents of the object pointed to are preserved up to the
- * lesser of the new and old sizes.  If @p is %NULL, krealloc()
- * behaves exactly like kmalloc().  If @new_size is 0 and @p is not a
- * %NULL pointer, the object pointed to is freed.
+ * lesser of the new and old sizes (__GFP_ZERO flag is effectively ignored).
+ * If @p is %NULL, krealloc() behaves exactly like kmalloc().  If @new_size
+ * is 0 and @p is not a %NULL pointer, the object pointed to is freed.
  *
  * Return: pointer to the allocated memory or %NULL in case of error
  */
-- 
2.29.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
