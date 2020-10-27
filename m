Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3E129CEBD
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 09:07:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F4B76EB8E;
	Wed, 28 Oct 2020 08:06:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32E6F6EB79
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 12:17:54 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id l15so1204272wmi.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 05:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nNS5tvBpA/i0H7p7l8m9y8bW5QzwJCcb9cwqd3juySc=;
 b=uINaxail9sUfALoEWstn2csJR9jE7v9clDsZtLcLiOMSXg2LAVFIQqN6lHKyyZUd4l
 jRiwMGMG4DxMFJH69rSCLOtob+027D28VPhBQtpIrjKA/W5lb5Kv+7Q+cjTTcQNW8hxv
 wUoV9A8I84g3amtYBnRWsQ9zCBUoSUYIxS8yqik5kvDE0D17HbZwhUPBEWV0xwo4eSQB
 xtGlMRrIXAwBsMOZYueqppFbh9JQaNXeAayhSnZZJNrW9nmKvVAevDfxEiP//pXPGQn7
 22ZoAAwvkiz2v+dHQuQfEfVqcnXh5D2KeVL1FBqvTUVKMuvl7wX7b6wRp1orV+Uuzzwn
 SgBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nNS5tvBpA/i0H7p7l8m9y8bW5QzwJCcb9cwqd3juySc=;
 b=EOLmp9Opxw1irp2wF9aj0pSAQ7a3LcdBA20W1mP1QbdeUscpIegq15E0JVQeJPX7WX
 OKYr2kst6G5eEaHpb0bhkTkuOuQH9kFSbW13hur42SIRDafJXIkDo13PVexk4KGJdhTP
 bgLBPPkBgcEElP5iYG+9OVa5MZ03V9RV/5YFCGrZeApKt2gDMhHtRzDNFLeeB/2mE5K6
 +2hyPRntBH9I3t3Y4hfF8fl2OPK8ns8yPQ/dFFcUvIkomIHIU1lEEbGsbZxsOcs3jchN
 uyrU1Pc1L+9QICv7UzrdH7i08nMs4H803ftkUqTScDMDchhSgPfahDyQi8aVpUYeInPA
 PpwA==
X-Gm-Message-State: AOAM5308Kf8iiKWUUWwX6Qwz4FtZy5AqtUXfI7pT4T9Jj9IN18wFveKI
 gWspkYDQkZQv7WClfgDfaXcb4A==
X-Google-Smtp-Source: ABdhPJwlnp8d7/fOEkypkqwExUCmIl2RKP9vSFIY6Z3TXZuynGv+gQ6ZzaCTjRN4xR7i9/EdKZccow==
X-Received: by 2002:a1c:28d4:: with SMTP id o203mr2460319wmo.143.1603801072719; 
 Tue, 27 Oct 2020 05:17:52 -0700 (PDT)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr.
 [90.8.158.167])
 by smtp.gmail.com with ESMTPSA id a2sm1731908wrs.55.2020.10.27.05.17.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 05:17:51 -0700 (PDT)
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
Subject: [PATCH 8/8] dma-buf: use krealloc_array()
Date: Tue, 27 Oct 2020 13:17:25 +0100
Message-Id: <20201027121725.24660-9-brgl@bgdev.pl>
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
 drivers/dma-buf/sync_file.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
index 5a5a1da01a00..2925ea03eef0 100644
--- a/drivers/dma-buf/sync_file.c
+++ b/drivers/dma-buf/sync_file.c
@@ -270,8 +270,8 @@ static struct sync_file *sync_file_merge(const char *name, struct sync_file *a,
 		fences[i++] = dma_fence_get(a_fences[0]);
 
 	if (num_fences > i) {
-		nfences = krealloc(fences, i * sizeof(*fences),
-				  GFP_KERNEL);
+		nfences = krealloc_array(fences, i,
+					 sizeof(*fences), GFP_KERNEL);
 		if (!nfences)
 			goto err;
 
-- 
2.29.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
