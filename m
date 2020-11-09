Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C982AD120
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 09:17:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DA8C8999C;
	Tue, 10 Nov 2020 08:17:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0196F89939
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 11:07:12 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id s13so7535969wmh.4
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Nov 2020 03:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/Z+wwi/tFfEYyTBQIvrIHI75+eOD/rtT/HKhEUnLNfQ=;
 b=tjfVVqU7R8IyKW2OW0hqxniG20DAxuXL1U31YiQAfRN+BbUoTlDF20ez4aqC9/5uW0
 00hwc/b1caGHmtDgwFtcQTeA95vSaxFPG5Dn4I4WT//9X1vHXDHfVZSv7b68b2Gk+Ggo
 GuV/WPBhQvweB/8nzh+JOIGU28BaLQQxoW0Qew8uhVen2qKctk4tkH6Xe9kG6J+foPfc
 erqT54DF3qf5z2lmzDigmhC40Lmu2CCaR3SODiQR0zsXHTxRNzgzEn46xeTAsbTqzkbP
 1FKBEQcVgIDxKxzGBxNluYDKXrOoCH+3ipKaqLWCZx68VW0e53YAPO8nIb1YuhtZ+35J
 7AYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/Z+wwi/tFfEYyTBQIvrIHI75+eOD/rtT/HKhEUnLNfQ=;
 b=ud/XT+QuC/cwmI99RnzCxUKSJ3tNJnYAzmav1MYpNdzidDSY4ci3gH56VvHYz8wEnB
 F0mIuDtfMQPa++G0d8vPZjdH0VVkeo+Z2eXnEUYX5nSrT7vVuToW1INMc34KPXquwOlR
 8zGbFGVt1fdl9X4iGQt8SwZ5riabymk1Q9jC+98j9/77YqkkXo3M5gG8F//rSpgqvUDU
 irz+qHI9juDELllLiQ8WCOU34AaOJHFgUxn4s1QCMFoiX+QmEEToRlJlvx5k9pR4KSp9
 0yJ7yvwvP07RPpsqy2OG4QxjkWMlrnlyc3VTs4GZSDowrg7blicc2UkNPu5ZMmMExjx8
 22qQ==
X-Gm-Message-State: AOAM531J2AosFZTRGj5RKKzsbCOa4JXQzXwLkOFPtOAVX3260CJb1Y9u
 athB1p5P4f6xsSEqzWowHwcJpQ==
X-Google-Smtp-Source: ABdhPJwkOvrpUKfB7tFd6Uj/97bXlddiGlW4tIGfcvqVJ2uUup2j5kk7Nqp7LIVYpPQ8tPEEkocJmw==
X-Received: by 2002:a1c:5f45:: with SMTP id t66mr7223842wmb.132.1604920031725; 
 Mon, 09 Nov 2020 03:07:11 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr.
 [2.15.39.206])
 by smtp.gmail.com with ESMTPSA id d3sm12815582wre.91.2020.11.09.03.07.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 03:07:11 -0800 (PST)
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
Subject: [PATCH v3 7/9] drm: atomic: use krealloc_array()
Date: Mon,  9 Nov 2020 12:06:52 +0100
Message-Id: <20201109110654.12547-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201109110654.12547-1-brgl@bgdev.pl>
References: <20201109110654.12547-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 10 Nov 2020 08:16:57 +0000
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
 Daniel Vetter <daniel.vetter@ffwll.ch>,
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
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_atomic.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 58527f151984..09ad6a2ec17b 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -960,7 +960,8 @@ drm_atomic_get_connector_state(struct drm_atomic_state *state,
 		struct __drm_connnectors_state *c;
 		int alloc = max(index + 1, config->num_connector);
 
-		c = krealloc(state->connectors, alloc * sizeof(*state->connectors), GFP_KERNEL);
+		c = krealloc_array(state->connectors, alloc,
+				   sizeof(*state->connectors), GFP_KERNEL);
 		if (!c)
 			return ERR_PTR(-ENOMEM);
 
-- 
2.29.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
