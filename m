Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A132AD101
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 09:17:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B6E7898F3;
	Tue, 10 Nov 2020 08:16:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90CDE8991E
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 11:07:01 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id j7so967971wrp.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Nov 2020 03:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/BZufo5GeZBBjJpVBhVfUUqf7bDRhIufHOC+GeAXTjw=;
 b=h63NN6JIr7BPg/L5K4tALUY+/tMHu7b/AohNm+Sq0AHtLr7C775RNCqPF5N91xMyBI
 MOiY+0CB7+nr/djuF77eQh2JjzNwZIgYaGZcGaavyRIGIDOMtNAYYoguPo3Q8xFlwx6L
 QddH+S2xNU+tvs03WMAyY063pe678sUddwGJwNwh+sGNbGg5ToLYxAiebC7qHygj5JKC
 wX/om83DYWGS2MTV/IcOR6891AOSOJx6pnI6tFAZh8FUdpFrpM+edanMCufFGJCkBefi
 wPu7sueEx5oa9fOWdtBQSKZ4a7oTEsuZvbf1jYwrHa9aigN1cKpCLLxVES7TkXXM96mf
 VUKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/BZufo5GeZBBjJpVBhVfUUqf7bDRhIufHOC+GeAXTjw=;
 b=nLoQIVmLVSuOk8thyoqHkWtLHS7t7poglfGZd2SvamlpfwrCZjCxLhqBmhM/QpgsFe
 8FpVxHEA7DvC0+WrDs/vyGPlq4GTbyJYQiIrfLK9Culx1IgSQeF29+hUeg3UXl35C0OZ
 26lD6hR38z57NWvKusgEk3PrmuavEJ5mNP6ei5uAaBY3mBsFRM+6MLnFw4/jhbOi9iJB
 zShCJCadCC6tMn1qpUUYm/OB2IGlm2oCPjFkJQDNUor3x3yNyJLrNfLj+nv3MkIk0I8n
 s68YZXq9Z5Kn8UctxxMVS25at7gbZ6ohDyU8Rt9oGLIeM4Lafb3bbzdS6vFfk6+Z3Nyo
 0Zmg==
X-Gm-Message-State: AOAM532acAXgON3y9BcTDO0fHTcAVzRHjqM2M225RwkbjtIxEjvx3fkj
 cKfVZhiVQez2cPaQpY3kipSsag==
X-Google-Smtp-Source: ABdhPJyoLN1aG0XKVyv+yWfCk24OCLDvJjyIFGdAfhV/HDRuWRPPB2x0i9RWfrD3NWEqtPTk5g+kWQ==
X-Received: by 2002:adf:9066:: with SMTP id h93mr18252220wrh.166.1604920019608; 
 Mon, 09 Nov 2020 03:06:59 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr.
 [2.15.39.206])
 by smtp.gmail.com with ESMTPSA id d3sm12815582wre.91.2020.11.09.03.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 03:06:58 -0800 (PST)
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
Subject: [PATCH v3 0/9] slab: provide and use krealloc_array()
Date: Mon,  9 Nov 2020 12:06:45 +0100
Message-Id: <20201109110654.12547-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
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

Andy brought to my attention the fact that users allocating an array of
equally sized elements should check if the size multiplication doesn't
overflow. This is why we have helpers like kmalloc_array().

However we don't have krealloc_array() equivalent and there are many
users who do their own multiplication when calling krealloc() for arrays.

This series provides krealloc_array() and uses it in a couple places.

A separate series will follow adding devm_krealloc_array() which is
needed in the xilinx adc driver.

v1 -> v2:
- added a kernel doc for krealloc_array()
- mentioned krealloc et al in the docs
- collected review tags

v2 -> v3:
- add a patch improving krealloc()'s kerneldoc
- fix a typo
- improve .rst doc
- tweak line breaks

Bartosz Golaszewski (9):
  mm: slab: clarify krealloc()'s behavior with __GFP_ZERO
  mm: slab: provide krealloc_array()
  ALSA: pcm: use krealloc_array()
  vhost: vringh: use krealloc_array()
  pinctrl: use krealloc_array()
  edac: ghes: use krealloc_array()
  drm: atomic: use krealloc_array()
  hwtracing: intel: use krealloc_array()
  dma-buf: use krealloc_array()

 Documentation/core-api/memory-allocation.rst |  4 ++++
 drivers/dma-buf/sync_file.c                  |  3 +--
 drivers/edac/ghes_edac.c                     |  4 ++--
 drivers/gpu/drm/drm_atomic.c                 |  3 ++-
 drivers/hwtracing/intel_th/msu.c             |  2 +-
 drivers/pinctrl/pinctrl-utils.c              |  2 +-
 drivers/vhost/vringh.c                       |  3 ++-
 include/linux/slab.h                         | 18 ++++++++++++++++++
 mm/slab_common.c                             |  6 +++---
 sound/core/pcm_lib.c                         |  4 ++--
 10 files changed, 36 insertions(+), 13 deletions(-)

-- 
2.29.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
