Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BA429CE9B
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 09:06:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C3D56E446;
	Wed, 28 Oct 2020 08:06:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E06B96EB78
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 12:17:51 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id h22so1205552wmb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 05:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J57Co4keOJLPpkOAtm30WeNaGboSbDo7KGbxSzSraLw=;
 b=yOHWFHMOzbagC0sIByz6wesCWV3cXS/nI3Cmoh9rPQnQfktOmQ2fHmfj8t5QiyPB1i
 JUphXOi/RvRU2h+y1C0PS56sy6nIPSViAjZH7ZD1nL0kVb70/VdVHhj/AlJj5MwbzGtT
 Fz4SQHpcI/4fYul/80WnINgeUHB50rR1cTYD2+ptya0cZz6H6MnTFFgMAr7/MnsWRrjc
 rDDqtu/ht+rkyImTxS5uHgJepl4JUTv6GjjiiaPzGql9lSo9xdd048jkI/Kvk/PDUJaD
 tXJ1HdRkottcOLQk8yrpkIleD3Wyxw+1fcCHjnYdEOneZJMoeya+bL6uoh2P347Mm79Q
 Or/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J57Co4keOJLPpkOAtm30WeNaGboSbDo7KGbxSzSraLw=;
 b=PHTOr80sR4mj9ZB8vBYd0UDnvLuO/5jC1KzHMeY2WSD98wgNqnT5aEr0nPdVH7mz8J
 TQezl0aIFm7a3Kw1rimBg0/cv50C8rzpES9NP/qsauxbljGocCVG7/6CFcW9bcrUj0sz
 K0dgCnohGGUfUNKwiFRBcncpyeRcdG4XX3y2G/NQsFVOccBpSy4ZW94bHABTQHGuKWNa
 qMBho5GLLr2Ln1aJrHBEv4FEw2l5RKpPx/iyi4ttQNZxJ1n5iKtnAwq7o3qWye4Yq41H
 GW4csY5jz9whCMznjrftamSgzlBa2H4JXJvPX5K1L4uvSSImg3ijpuDnCcxzan13yQtg
 xhoQ==
X-Gm-Message-State: AOAM5317QWlWXFYg80WthI3AfXVwR0T7NIs+BotDOudQ7WzeXaO89BT8
 kFZqECGCSrfYzr0cHNxst57TTw==
X-Google-Smtp-Source: ABdhPJzwzTmHdRfbZ3iyfMT0YC13fJkeiYScFTFd2MhD0PJKT6LJ0wGB9w/fQb4FZN9R2w5rbG6dAQ==
X-Received: by 2002:a7b:c92c:: with SMTP id h12mr2566357wml.134.1603801070666; 
 Tue, 27 Oct 2020 05:17:50 -0700 (PDT)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr.
 [90.8.158.167])
 by smtp.gmail.com with ESMTPSA id a2sm1731908wrs.55.2020.10.27.05.17.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 05:17:49 -0700 (PDT)
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
Subject: [PATCH 7/8] hwtracing: intel: use krealloc_array()
Date: Tue, 27 Oct 2020 13:17:24 +0100
Message-Id: <20201027121725.24660-8-brgl@bgdev.pl>
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
 drivers/hwtracing/intel_th/msu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwtracing/intel_th/msu.c b/drivers/hwtracing/intel_th/msu.c
index 3a77551fb4fc..7d95242db900 100644
--- a/drivers/hwtracing/intel_th/msu.c
+++ b/drivers/hwtracing/intel_th/msu.c
@@ -2002,7 +2002,7 @@ nr_pages_store(struct device *dev, struct device_attribute *attr,
 		}
 
 		nr_wins++;
-		rewin = krealloc(win, sizeof(*win) * nr_wins, GFP_KERNEL);
+		rewin = krealloc_array(win, nr_wins, sizeof(*win), GFP_KERNEL);
 		if (!rewin) {
 			kfree(win);
 			return -ENOMEM;
-- 
2.29.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
