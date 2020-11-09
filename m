Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F9F2AD107
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 09:17:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18EF2898EE;
	Tue, 10 Nov 2020 08:16:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8EBF89932
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 11:07:07 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id o15so383712wru.6
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Nov 2020 03:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m2ikj+dhQ1Zeha09QctzFr3Pm7l2AwdyE1EcOPpxBQc=;
 b=lrGFiV0JEwMQZrmMw1exEx6p70DOim7QTqsGe9oOJfscxaaDbqtNd51mDY2gLrVO6e
 AJaVU6gEvJ5Rqj0pmzF+RQrIAx3UUypf5ocQh5+MxoPZ8v5DbPYgi+LUXOO0xXncPOxJ
 vazruXakD7raTY00eG7zaplUuhpuFOzAXeDC0+Go3Z91tS4RB4jYmtz+tumRzgHuHKVW
 Q3APL+KmLaN9niAGudHytA7iWz6ha072HjPWCU0qqHVWmvaciARBx8JEUQUEjIamSyMq
 CKw7PL+YgCXUcrNMDTeAPsCWzL8tuPTeq/pLQmlfpQnNOHY3qjMybpVo+6SdERNaMi03
 sDgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m2ikj+dhQ1Zeha09QctzFr3Pm7l2AwdyE1EcOPpxBQc=;
 b=JvuxHnph+J2/TH5z4dG6HUjlerBerXeQ2PSOKTLnvSE5ZDzpimIexKvzpTXGN9nTBp
 kBRp0rwAwwLBzhfhsZAE35pNSk3J6teN3zpDDm3ZqIK8AnF1MldhsCgzNRT9gAPZnqjj
 HirPGQnIybE79kLowS48B82Pgh+jlJKaMQjlp+09Hu/+sS9UGSqcD9mNXSsTd2gSSC/8
 yHXDq1SBJYQZx/VXTwbaD1uPcZgopowKS03+usab8p9GbcE9XxINnujywvclR5WzYSy+
 AcqnEdi8ITPMxmzkrzbDy4d6K1A14zdcpabs9rmlJNbdTJuy7BAskNluqDz884o13LL7
 vYZg==
X-Gm-Message-State: AOAM531ztes9sFVtVeZju6vLquo0Bm5F6vj+sAU9gZhGOqOcNM28u74u
 p8618inNXwX3c4dc1phiUEAUYg==
X-Google-Smtp-Source: ABdhPJyDQDC3mJ8XBzXRPLr9tujc8yB1EaUC1zlVXx3gghE7oqzt7WatCScZ7dhRaCoAETe4X60pOw==
X-Received: by 2002:a5d:54c5:: with SMTP id x5mr3869675wrv.297.1604920026445; 
 Mon, 09 Nov 2020 03:07:06 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr.
 [2.15.39.206])
 by smtp.gmail.com with ESMTPSA id d3sm12815582wre.91.2020.11.09.03.07.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 03:07:05 -0800 (PST)
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
Subject: [PATCH v3 4/9] vhost: vringh: use krealloc_array()
Date: Mon,  9 Nov 2020 12:06:49 +0100
Message-Id: <20201109110654.12547-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201109110654.12547-1-brgl@bgdev.pl>
References: <20201109110654.12547-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 10 Nov 2020 08:16:57 +0000
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
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/vhost/vringh.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/vhost/vringh.c b/drivers/vhost/vringh.c
index 8bd8b403f087..08a0e1c842df 100644
--- a/drivers/vhost/vringh.c
+++ b/drivers/vhost/vringh.c
@@ -198,7 +198,8 @@ static int resize_iovec(struct vringh_kiov *iov, gfp_t gfp)
 
 	flag = (iov->max_num & VRINGH_IOV_ALLOCATED);
 	if (flag)
-		new = krealloc(iov->iov, new_num * sizeof(struct iovec), gfp);
+		new = krealloc_array(iov->iov, new_num,
+				     sizeof(struct iovec), gfp);
 	else {
 		new = kmalloc_array(new_num, sizeof(struct iovec), gfp);
 		if (new) {
-- 
2.29.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
