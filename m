Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F282A3E74
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 09:15:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0871E6EBFF;
	Tue,  3 Nov 2020 08:14:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95B6A6E554
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 15:20:56 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id p19so1478856wmg.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 07:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J57Co4keOJLPpkOAtm30WeNaGboSbDo7KGbxSzSraLw=;
 b=WjUcLw8gDcHIiMrch+N57kyIWhFBESoNnwJbo8ozbR4u2s7V8dYOCGUGcrdCQs0A8c
 eQ33JQCo7FlLI/BSLX3oyaROh6lCmluXX5jsXGGHEInxOXk5kMdE5EkChmFgZmNwn3eb
 RwlsVtsZQHldyPx0J11ujW5fXjWbCiWcVuULMO77gCNRB/nW03qXSgrnoTEFhuGMBnUK
 sL+IQo1YUMwYJSK40SS6mEwNb1VtEI53RpcVxfuMkInp0D3aXlaGqbYsVindMPO71Ke3
 cZCq5fRNyBPIQZcN+ygz0gPhtpG7oZ2WlcrEtOMJ/4DQH9LXLeCfvwg9MCDRBNLrjhq/
 00Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J57Co4keOJLPpkOAtm30WeNaGboSbDo7KGbxSzSraLw=;
 b=kCXeLWV4CWM0ElKwa169LU72KWtiol7HDtHOW0z/Xv4JdoQxyi4nx1pAZ0Agz6P4t2
 4E+I0EoynVKTVNYgi03h/yaEIpFewlAeXTM5Pj762Vn03lM+966DHV9xBmmX/GLnPr+f
 wZJj8IQO7u/gyNC6EDLR61Bms+3KaU1+wXkFM5SJoICvSgGDfbyH4VtMLVYGNVq5vqJN
 IZ+oD9aqD93gTmasKxeScJQ7IkPjdc2j21+T2+Q6Uhfj4mjTT1UtxEVwzdQj/0Juj4C0
 +aTWjQrg5C/HbMaHLld9GX7Jo5KXgzobmpwU1MidcZHND4O286BVMOKea13Ov4Jxp4BO
 Zwcw==
X-Gm-Message-State: AOAM530tFPrKA6wsdqzVO6+qYXVnA9CaWa9FXNL29mTWcfPyZgcB8UB7
 9CPsLxDnLTWOIWVHoMxjJtZDlQ==
X-Google-Smtp-Source: ABdhPJzrGRLOF2/QgV4EgJsGUrSZ+4C2XU14++PTKK4DegXurFNGMqip9Gki2NGq2KA3LkM7jho+gA==
X-Received: by 2002:a1c:4646:: with SMTP id t67mr18816040wma.40.1604330455334; 
 Mon, 02 Nov 2020 07:20:55 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr.
 [90.8.158.167])
 by smtp.gmail.com with ESMTPSA id b18sm15138014wmj.41.2020.11.02.07.20.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 07:20:54 -0800 (PST)
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
Subject: [PATCH v2 7/8] hwtracing: intel: use krealloc_array()
Date: Mon,  2 Nov 2020 16:20:36 +0100
Message-Id: <20201102152037.963-8-brgl@bgdev.pl>
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
