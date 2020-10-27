Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC8C29CE99
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 09:06:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A625E6E0D9;
	Wed, 28 Oct 2020 08:06:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B11226E0EF
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 12:17:47 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id k18so1202450wmj.5
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 05:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DX4Vpt/5rOOp/h8PsP6BCvcutYZPagP/0wvqhEtDkrc=;
 b=fcBVAav93bPjLTMO/GKGNWbWJSyP9xDWjrQdREKVHUObC2fvcpeMBWbKtOvwqTtDBw
 TYuM0tjJGe4hFI+bJgCEuy05Jhcj7DoPbEbpzYlue9mGnIAJyPrd5G7jnyVyC0ouqYQE
 KUcuZgHebd/KjJ7WpMudfra+Ob5jpn/DPH6XMb8lun7OwUCY62x1ZRk3XnvNkzK8JTfI
 GDSUhxWu1bxiLfQLX/wnkP4DE/r3YkbU7n/g2xdLeTwmRffMBnF1fQyXeAU/KAOUkWXm
 Qr72qjOlysXmXLLv9c8JP8XDyn+yxZSMDREYLPBPXV2IBO4ogKZ9faYnUv5Hy6pUK1mv
 KBnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DX4Vpt/5rOOp/h8PsP6BCvcutYZPagP/0wvqhEtDkrc=;
 b=rekz+XzeTz6+zVqDj3YzyPlCr8MA6/P4nl0czYVlhMeswQV9ufbsVgJBmb7866rYK8
 uIqZcPRbkWAicM9pZtDD++O3joD7nLhTugGHFbmmiIGihiv4+4FY34gIWigY4xmDWgby
 X3BL+m4zSl9jEd5TVfMBa0mRNfM4xDqlzYyJZ2XhMArAMIEMAx+TI/vtOQqVGBe1/FTv
 uPTqIwrOZs8dWVNA2EzCwcVruRlaV19bC192jzSzc7sUGHU9QyAVB1nkX7W1bVBJu7/B
 4sTivwW/ZhS9MHsQcY/WezHjG5MoadiDy3BEdUkVx3hXh5oYcRBTqrhhuohmm2ir8i4r
 v3MA==
X-Gm-Message-State: AOAM532bd5ONWmucIhTgPwpOgu3nDemUOMU77mO2qA9UCC40LIo2Fw9K
 7fNpv4j1el+LF9Q7s8JUOI8tWw==
X-Google-Smtp-Source: ABdhPJxpFHC1iDNaVhyqgdX0LXFgCHzNZUEcFDl9D5G1/wCxSZcWoj/5QOXgpccEbzpQpJAT/3s/cw==
X-Received: by 2002:a7b:cb81:: with SMTP id m1mr2573033wmi.140.1603801066439; 
 Tue, 27 Oct 2020 05:17:46 -0700 (PDT)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr.
 [90.8.158.167])
 by smtp.gmail.com with ESMTPSA id a2sm1731908wrs.55.2020.10.27.05.17.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 05:17:45 -0700 (PDT)
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
Subject: [PATCH 5/8] edac: ghes: use krealloc_array()
Date: Tue, 27 Oct 2020 13:17:22 +0100
Message-Id: <20201027121725.24660-6-brgl@bgdev.pl>
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
 drivers/edac/ghes_edac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/edac/ghes_edac.c b/drivers/edac/ghes_edac.c
index a918ca93e4f7..6d1ddecbf0da 100644
--- a/drivers/edac/ghes_edac.c
+++ b/drivers/edac/ghes_edac.c
@@ -207,8 +207,8 @@ static void enumerate_dimms(const struct dmi_header *dh, void *arg)
 	if (!hw->num_dimms || !(hw->num_dimms % 16)) {
 		struct dimm_info *new;
 
-		new = krealloc(hw->dimms, (hw->num_dimms + 16) * sizeof(struct dimm_info),
-			        GFP_KERNEL);
+		new = krealloc_array(hw->dimms, hw->num_dimms + 16,
+				     sizeof(struct dimm_info), GFP_KERNEL);
 		if (!new) {
 			WARN_ON_ONCE(1);
 			return;
-- 
2.29.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
