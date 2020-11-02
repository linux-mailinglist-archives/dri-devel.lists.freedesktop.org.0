Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 889CC2A3E70
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 09:14:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 474BA6EBA8;
	Tue,  3 Nov 2020 08:14:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 961BE6E554
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 15:20:52 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id c18so9768564wme.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 07:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6cAnhvx340aJ9UoLX1zbzAI7OYOIgRl1WRMoR3sh/3E=;
 b=1SSGYQiV02UgtOHtJSH9FJfR85Ha4HUObVTcAB4GRJTGZaZIhzSrXM0vHFpOEKMzpy
 9AVGovKSH1wVLrXkWnMIzOHSW4wOPIS5fZx3b8ig/WoV5AMjTLszIAqy59pnDVv14w/l
 IYbEa1NUeZDKQoqe1O1eFKcs7UR1ERcou6uj5vI9B+71gx66QuxqtHDKWi7rH8IfdwOh
 yw48kSM/sVpl+pp3eua+NGFFDAf41lVgMyri3bmmaOjyWJ1HxXj6Xh4yzVYGP94elkAY
 ex0gQu47xGOfITLoiNnuoXnMesEvAqtWgstdC5/DubydCuhho06kgzvLJIxv7Zdk+/Mc
 9hZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6cAnhvx340aJ9UoLX1zbzAI7OYOIgRl1WRMoR3sh/3E=;
 b=jrcQMlm1vMLv/WoVYIUOlDB3v54/pr2SamkYguCQzIGPJaet83GUJpHMAnD0sJ3cxY
 LHQywJXrFsq1W8ctJhybhkp7cHmy3t3VmoLgXrPvEoEJ3Z7UlwLnooljSauJQ6ZV7leJ
 z3SQ0z2Me0nCEBD76CFrltdxPzwko2bfq6Q5s0pnuq4tp7MmQUvjZFkRpUG47N1LE6uX
 zj5sAEOgEUuoFlpkhFKqQ1/1CBtkQFeURtdbJI/ySsyXvmR7TB8evRajJQccFf8QnyCB
 EIvqIh9v9pafGHIrGY8ZSrKf+PbkXu7EtF58hGeOfMJyR/HWDkHFy+nv5z914AFBxBXp
 b6ug==
X-Gm-Message-State: AOAM533YlY56xPDP5AU/qB+F/e/OLkkbQ5tK2b0TPIPTW8di+SvIc8P8
 fVVHIyI/mqVcjRJR4RPP0pf3mw==
X-Google-Smtp-Source: ABdhPJwOKpBOX0BSWWvVIHmaQ9Otc3dpDKHkytegGJ3V2bSQroVjGauUhivRRvqIF6S2knMM749pFQ==
X-Received: by 2002:a1c:6587:: with SMTP id z129mr11705984wmb.45.1604330451271; 
 Mon, 02 Nov 2020 07:20:51 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr.
 [90.8.158.167])
 by smtp.gmail.com with ESMTPSA id b18sm15138014wmj.41.2020.11.02.07.20.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 07:20:50 -0800 (PST)
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
Subject: [PATCH v2 5/8] edac: ghes: use krealloc_array()
Date: Mon,  2 Nov 2020 16:20:34 +0100
Message-Id: <20201102152037.963-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201102152037.963-1-brgl@bgdev.pl>
References: <20201102152037.963-1-brgl@bgdev.pl>
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
Cc: alsa-devel@alsa-project.org, Borislav Petkov <bp@suse.de>,
 kvm@vger.kernel.org, linux-mm@kvack.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linaro-mm-sig@lists.linaro.org,
 linux-gpio@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-media@vger.kernel.org, linux-edac@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Use the helper that checks for overflows internally instead of manually
calculating the size of the new array.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Acked-by: Borislav Petkov <bp@suse.de>
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
