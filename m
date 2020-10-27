Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1394D29CECA
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 09:08:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 258336EC5B;
	Wed, 28 Oct 2020 08:07:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F23DF6EB6E
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 12:17:37 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id l15so1203251wmi.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 05:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LJP6zUa9eBmdV8bx1jdaWyKmaK9MsWkK16il5Qo0OrM=;
 b=P+3tCIHOjCZAx0wmilW2GDFvIGyFUKkJ6kMCnuzTaqTK/WVy0FTiGFvqMSEeEaTSDi
 lidtNcACGQa4FsZTJSv/WM+PJAWcMBZ84eqrsFS5cBt5SmJFi36Zt8P8jQqLDmjkvqeW
 khRH3E+peGeaQTCIY3Vt2p8gYCX0QOu5toB/kJmHKtw/28SJ6BKumTSSq2MJytdIAdgp
 oJxR5uAJUIN5EhwIO49GT3ZmC5B5ob3NU85YWSk0gy8yt2me9ot389ODzNeNzE1g7isf
 BjKSBXgUK2OMn2MduiDvTrDfwsn8XX/eMtY9lahl6HLlIYN8j7wdAJNYVoPtfuaoSs+h
 PRUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LJP6zUa9eBmdV8bx1jdaWyKmaK9MsWkK16il5Qo0OrM=;
 b=eUZfF7XRIxjyVXauZ7mrQpP3Hb796QpdmQdMHd/Pu7962i2qRWKdJjd9lVbMg8ds++
 sfY84OcWjOtEzk2aboVbKzIV+7XGbF7pN1qIC77x9NJwRXCkZXJQYKXrqUhLNdtrUZxX
 tQokFgW7An4Ny/hhoATvlfTKdSsOIuqLT9BO6zkurnE6el347aYRXuLDNM90AYdcdmeH
 hkXFQMfT5oV5d43rJSYKWswsKq4C3PSBopDevK6XqCm+vTw7mWPfgxxsktxCyARa0X7z
 qqWSwzeSwcU8h3RXxAeQAmFjsat9UNw+RDsD79k0wO+vbrLiMZ92jq6WQB1TRsvw6At4
 aHRQ==
X-Gm-Message-State: AOAM532jaIruLAxj3mv/Ir7iwNpS+8vCdjeiQEREGOmZPTq4jcY+m0su
 p95usvcQIYDN273hW2QlCm4NPQ==
X-Google-Smtp-Source: ABdhPJxUDPfM7/G4w39/lM3kfVBbiG37Et7vUzW73qIzYGjUaK5vAjNfvCioGZotPrXrgX+P7fvBjA==
X-Received: by 2002:a1c:8087:: with SMTP id b129mr2477389wmd.10.1603801056147; 
 Tue, 27 Oct 2020 05:17:36 -0700 (PDT)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr.
 [90.8.158.167])
 by smtp.gmail.com with ESMTPSA id a2sm1731908wrs.55.2020.10.27.05.17.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 05:17:35 -0700 (PDT)
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
Subject: [PATCH 0/8] slab: provide and use krealloc_array()
Date: Tue, 27 Oct 2020 13:17:17 +0100
Message-Id: <20201027121725.24660-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
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

Andy brought to my attention the fact that users allocating an array of
equally sized elements should check if the size multiplication doesn't
overflow. This is why we have helpers like kmalloc_array().

However we don't have krealloc_array() equivalent and there are many
users who do their own multiplication when calling krealloc() for arrays.

This series provides krealloc_array() and uses it in a couple places.

A separate series will follow adding devm_krealloc_array() which is
needed in the xilinx adc driver.

Bartosz Golaszewski (8):
  mm: slab: provide krealloc_array()
  ALSA: pcm: use krealloc_array()
  vhost: vringh: use krealloc_array()
  pinctrl: use krealloc_array()
  edac: ghes: use krealloc_array()
  drm: atomic: use krealloc_array()
  hwtracing: intel: use krealloc_array()
  dma-buf: use krealloc_array()

 drivers/dma-buf/sync_file.c      |  4 ++--
 drivers/edac/ghes_edac.c         |  4 ++--
 drivers/gpu/drm/drm_atomic.c     |  3 ++-
 drivers/hwtracing/intel_th/msu.c |  2 +-
 drivers/pinctrl/pinctrl-utils.c  |  2 +-
 drivers/vhost/vringh.c           |  3 ++-
 include/linux/slab.h             | 11 +++++++++++
 sound/core/pcm_lib.c             |  4 ++--
 8 files changed, 23 insertions(+), 10 deletions(-)

-- 
2.29.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
