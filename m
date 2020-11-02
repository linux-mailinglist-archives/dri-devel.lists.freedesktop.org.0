Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8252A3E81
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 09:15:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB84B6EBED;
	Tue,  3 Nov 2020 08:14:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 009626E51D
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 15:20:42 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 23so1259106wmg.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 07:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=87j4CzgTjIznAlAGNVYlsLolKCjEqxgXtItxHQqBT+c=;
 b=Qx6XIDDkn/kgktIUkUO/8COUc5pZ7Xmrd4WIhOhtRKLqRH4jXfWsq4XQF+tviij2AS
 vQP1d5+o7im6WeNCxad2viztsEaWhYtaJWG1Vhj6E1J8UjnspJVoxf806Ry3jv4BdHop
 xwURD6IJS7yc8ElYCbGBoudPzERtKy2XkZUjWqe32YJYz8gF1KzLAhJg0Sgft+3IMCWa
 mV4JR08o+DnkkGEu+pVGUnHdRkfznAvaeW1sFyAveCP1kOZvsLyq+TKkJLfHFzK57TIm
 KW7GgBKwfAnVfidT0ZnlSAScho5vr6Rjk96VIp+X50g2am696JF1i4Ih5IAkrxiZq5BJ
 Pdug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=87j4CzgTjIznAlAGNVYlsLolKCjEqxgXtItxHQqBT+c=;
 b=iDhhslVEDpffJSXQh6Zt5hKR/QudZdAGVXeumzcUyVG/xS3joBJE20SksCWx0OzUTE
 35ILp6KWAB/oA5cPYTW73wg+vSi7Ucz972iK8URIIhEmtz4LcSbmwHLxii4JVssQlH8x
 6g8ncs9cjx/q/jvh696zCU8d23VEf6v1bZgV6JsAQDQ0R+Ujvjco3LJkP/1cCDkX5zjn
 3BHQUEqMx0fT5eat5PhA9r6C0X6Luui8+gvkchskba98ZGcxBrWy6qnpmOxdO+B2hRfe
 C4jGH/ZXmx8WFKSpH89A6k2tMRFTpyiFtewB2kFdm3BSS+VlCbvjz6Dl8PJTFuhEbDsi
 IB4Q==
X-Gm-Message-State: AOAM533sZUSbuSCqqPM9GRA96CoCPNlogWNxo9DwV9iBfZ9ne71dOmo0
 8IX9uknGUZGcDOVlcJibpx3E0g==
X-Google-Smtp-Source: ABdhPJyrNQzSj1QE+Qkm5CWvnTtBNZHgXZdYRD5QsBgAGl8HowPGK/ocdDyRBmSt205H50cLvofh/w==
X-Received: by 2002:a1c:9848:: with SMTP id a69mr18051505wme.158.1604330441469; 
 Mon, 02 Nov 2020 07:20:41 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr.
 [90.8.158.167])
 by smtp.gmail.com with ESMTPSA id b18sm15138014wmj.41.2020.11.02.07.20.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 07:20:40 -0800 (PST)
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
Subject: [PATCH v2 0/8] slab: provide and use krealloc_array()
Date: Mon,  2 Nov 2020 16:20:29 +0100
Message-Id: <20201102152037.963-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 03 Nov 2020 08:14:25 +0000
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

Bartosz Golaszewski (8):
  mm: slab: provide krealloc_array()
  ALSA: pcm: use krealloc_array()
  vhost: vringh: use krealloc_array()
  pinctrl: use krealloc_array()
  edac: ghes: use krealloc_array()
  drm: atomic: use krealloc_array()
  hwtracing: intel: use krealloc_array()
  dma-buf: use krealloc_array()

 Documentation/core-api/memory-allocation.rst |  4 ++++
 drivers/dma-buf/sync_file.c                  |  4 ++--
 drivers/edac/ghes_edac.c                     |  4 ++--
 drivers/gpu/drm/drm_atomic.c                 |  3 ++-
 drivers/hwtracing/intel_th/msu.c             |  2 +-
 drivers/pinctrl/pinctrl-utils.c              |  2 +-
 drivers/vhost/vringh.c                       |  3 ++-
 include/linux/slab.h                         | 18 ++++++++++++++++++
 sound/core/pcm_lib.c                         |  4 ++--
 9 files changed, 34 insertions(+), 10 deletions(-)

-- 
2.29.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
