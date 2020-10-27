Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8516529CE9F
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 09:06:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D98B56E499;
	Wed, 28 Oct 2020 08:06:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 770E36EB73
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 12:17:49 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id b8so1688292wrn.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 05:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4ajG2eJaPSZ0bX/1WDeWm0EaqfEJqxAhsr1ZG8pJATY=;
 b=XHOIZDPFdLQqYweDS35MDqPOY+CIlpJefK0zBWfY0YBTimhWcawEQs8dTrakE90RO7
 AfsytdKycv6sjHXN2trxR/+eOiuM7wcXVt5IB8qtwwAQMxE4BkNW/+a/GHnw+CWx2wsB
 hGq7TZ6iovNwqijODvBmZWQde1pIjIB5HPsJl/6X5swnxCmi/14lryrQsGpQHt5jA5cY
 IH9hXgKEdIPUw1YcA/W+R9L29LSTdk7ImHzGZaTNpbL+xJ2ChLwLclaOJCS3Z4u/Bf9u
 JVbkgQtqzawUBytpFhmYgsiop5B0mx4A7abqvzrfSU90qALU5F3Ra0TXyhHJ+ZhCt7b5
 VUBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4ajG2eJaPSZ0bX/1WDeWm0EaqfEJqxAhsr1ZG8pJATY=;
 b=uBiDRZKFgG2Sjeosn4S75IfztQx7vM4S6suiOXGHKizmL37zthA+Vn5hZMF9GDC3/9
 e79MSb4BGTlD8Aoq6o2v357Zo6XgEcGCf8psk+6yilo/5leTjJ9GCoZx9wekWfxdR27B
 gibCm8mfOEnUYGj5gqPw1bH/xcwUykEDxYjCO2YgniVnTM/H7jiVLpEkAFlZ1C2Gg7Mm
 onQES53xyg5FeSG7JC6sL0EbaGFDU6BpCaFhe3qTMFCVNPZ1Uqn75HAlWE6lShzys/9F
 +RRMW5h7Ia2spMVcfwLv4dPvZkjYFkaPbMWrGD8AL1DNowfrfvKPnqhHGRD6einwY1f0
 53ng==
X-Gm-Message-State: AOAM530SUv4G5VWvDxPqXDChWJoOjeHMLbOjyRHJGgeHqcgo1cMLyiAl
 vFH/xsEgasfpZRqDLIqKjBpOVA==
X-Google-Smtp-Source: ABdhPJxi+QacVHd5+AE8Jqv2dW1ZUW5QhwXfI6u/s0dk/pyhkeRg2gSWT3PEaZdn2SLI49Q2m9AoSg==
X-Received: by 2002:a5d:4ac1:: with SMTP id y1mr2494500wrs.303.1603801068178; 
 Tue, 27 Oct 2020 05:17:48 -0700 (PDT)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr.
 [90.8.158.167])
 by smtp.gmail.com with ESMTPSA id a2sm1731908wrs.55.2020.10.27.05.17.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 05:17:47 -0700 (PDT)
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
Subject: [PATCH 6/8] drm: atomic: use krealloc_array()
Date: Tue, 27 Oct 2020 13:17:23 +0100
Message-Id: <20201027121725.24660-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201027121725.24660-1-brgl@bgdev.pl>
References: <20201027121725.24660-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 28 Oct 2020 08:06:30 +0000
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
