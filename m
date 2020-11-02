Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BA42A3E96
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 09:15:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D1B16EBFB;
	Tue,  3 Nov 2020 08:14:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B31486E51D
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 15:20:46 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id s9so15040771wro.8
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 07:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zsoLpTPvbfDjEd3BTKWBJg3n1+l4gj6JVB0+8bMwSMU=;
 b=HmtPp910xThA01pL3B9QJDzM6myxOQbI+Gxv1vc6oac7iOA0ZXJQlHuq/+mHtde0X+
 OfcMSK5kznkjMW2e37tU9WeWtUF/ehvgMx77Hvy2j/YhuAWr2JWWTq+2rF5jNonVIGbD
 cCSqCJ03TKw0ntRupzKEmRuIb7vqNrbM7ZjMJ1dyUUTFAq7QYOcoPlQY6BSvbU5ivx1u
 2ja7v3leUJx7kGjq4+D8hYbHBwnlqSZkHzw7OQggIsENJu2wboHE39wVaYvHlfopqTaz
 gmSuc/NRG00fKNAAatDeqOG57nb8eBHuWtuyK6Mk/YJvrj1Yz6MBIwM8xHmW9fbnRR1V
 p5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zsoLpTPvbfDjEd3BTKWBJg3n1+l4gj6JVB0+8bMwSMU=;
 b=V3brMDGB9RAfMyJcQYWfQlKHntWhVonip60AZUG/RHWXYKkrLxvdMLs89AjtaqLCgG
 1ICtrl4yHucGCzD6FynE09SykzYBo8tkjaS9gzFb15LA7Enhwv/O+etsVBHstoejEXiY
 T2qIdlnFD1cnmXD3knUQve1T/JPDScRUSQOgSUUBTo5oE6YJkhR764qP41DDaEqxdvLJ
 WxsY07WqnpWYplnR2pcR6/mlhieQbrToADBF5J1eiGoJfPU08liFSGEggte3SalYBY3L
 B77f0GUqvJgtnISxOvJEARNeKQbFZE+YUfEByUrZDNtDZXkm3wXcLZQQwenERuyWxeBa
 huPw==
X-Gm-Message-State: AOAM533EOnpDunl5c843CbY4t7b5VvwS1Wx06Mm2lewtA9a1H7y1OUdN
 dglkpUTBis++Htz4/g5QObhyyg==
X-Google-Smtp-Source: ABdhPJwlFwfWfCpdDsl2PScT66d3xFr7tIJPKogPvk6kP2iU+Xbqm7qx9Peryv+18kqHISpx03BO0g==
X-Received: by 2002:adf:f3c4:: with SMTP id g4mr22117429wrp.207.1604330445459; 
 Mon, 02 Nov 2020 07:20:45 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr.
 [90.8.158.167])
 by smtp.gmail.com with ESMTPSA id b18sm15138014wmj.41.2020.11.02.07.20.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 07:20:44 -0800 (PST)
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
Subject: [PATCH v2 2/8] ALSA: pcm: use krealloc_array()
Date: Mon,  2 Nov 2020 16:20:31 +0100
Message-Id: <20201102152037.963-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201102152037.963-1-brgl@bgdev.pl>
References: <20201102152037.963-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 03 Nov 2020 08:14:24 +0000
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
Reviewed-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/pcm_lib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index d531e1bc2b81..c6f8f9e252e0 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -1129,8 +1129,8 @@ int snd_pcm_hw_rule_add(struct snd_pcm_runtime *runtime, unsigned int cond,
 	if (constrs->rules_num >= constrs->rules_all) {
 		struct snd_pcm_hw_rule *new;
 		unsigned int new_rules = constrs->rules_all + 16;
-		new = krealloc(constrs->rules, new_rules * sizeof(*c),
-			       GFP_KERNEL);
+		new = krealloc_array(constrs->rules, new_rules,
+				     sizeof(*c), GFP_KERNEL);
 		if (!new) {
 			va_end(args);
 			return -ENOMEM;
-- 
2.29.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
