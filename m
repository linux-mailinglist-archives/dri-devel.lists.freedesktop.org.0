Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCE151747A
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 18:37:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8103410F0B7;
	Mon,  2 May 2022 16:37:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4D1C10F0A6
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 16:37:37 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 r1-20020a1c2b01000000b00394398c5d51so1819128wmr.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 May 2022 09:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PRrPoRHHMVUrb5lC6MPjlnCl9PCZ8HWYoNk/YFcFCiA=;
 b=OFQtewjT9fUvoHtYhMh7ANDq7xj4P0vsSbip4Q75b1Jkvyrxh/SM6AfiC/QKQHlypQ
 BX3BabqqMqdEzeYcj/nmpBY8Qxda0a9wsD8qsf2abkJ9mVB3r/rb+a7ICk3TaZcsRmnL
 dQKrmgE86iyIPqEuj8wwM0OXSjKut2YO2B5QqjhlFueiv4aJPmMENk3j6XyH7ujbFMEv
 OH81rUOKEhpDhUw+i9TE0Srq5nIIY6RYcRHGA9C9StT0gyacz6dqsNe0apbB5sffIyR1
 fT64bVj5tN0+FlGD0PPb34H5aCF853+ixTuYl2rpgHw5gNGfz3AIPbSZ57U2W5UpWxFP
 WBzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PRrPoRHHMVUrb5lC6MPjlnCl9PCZ8HWYoNk/YFcFCiA=;
 b=wzvLSHBbLUAlOLNAkMLWw2KsRrv/tf3JiNzLFofvvnuIIdZ0jBWF6iNk05yOvW9fkr
 1PPdiF5aSUKm09zCLNU2KrH7ZpwD2O4dnHsb+UbNYqwI8Y/ZPcIWnOmLncDm+7GCwFJ0
 197aHGwRMXfKBI4Jmos77/u+QpSNEdgDtwgSyhKK/VhYkSvtOFfqwocmaipPbWA7EVKU
 IJUY90SaWot1qn0LqXt3ZQhcBNdBOD3A3SLd7vSd10QlR2zygk4Gz0IHEI8FYN19O6FR
 reEJcNzTMgQCzBV2J32F3/xr1D7DJd+P+crstN+Jr/SidFczhbTtcV7n3LjAtH64vz45
 RIxg==
X-Gm-Message-State: AOAM531WrAk0gmIdNyg6FyjVxBrKJUBKpucwPT6vOCamixRALYNoTMNz
 4w7yoFo5QubelXlbVxpD7tM=
X-Google-Smtp-Source: ABdhPJyEr5vbAcRX0+Jtvnnc+Wf7OKzoanJfhrmTHwUjGX/+TujJY43ARrVlFK4RKL5kjt6QWDMlHQ==
X-Received: by 2002:a05:600c:4eca:b0:394:1e7d:af41 with SMTP id
 g10-20020a05600c4eca00b003941e7daf41mr15271560wmq.151.1651509456178; 
 Mon, 02 May 2022 09:37:36 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
 by smtp.gmail.com with ESMTPSA id
 p14-20020adfaa0e000000b0020c5253d8f6sm7294694wrd.66.2022.05.02.09.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 09:37:35 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, jason@jlekstrand.net, daniels@collabora.com,
 skhawaja@google.com, maad.aldabagh@amd.com, sergemetral@google.com,
 sumit.semwal@linaro.org, gustavo@padovan.org, Felix.Kuehling@amd.com,
 alexander.deucher@amd.com, tzimmermann@suse.de,
 tvrtko.ursulin@linux.intel.com, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 06/15] dma-buf: add user fence support to dma_fence_merge()
Date: Mon,  2 May 2022 18:37:13 +0200
Message-Id: <20220502163722.3957-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502163722.3957-1-christian.koenig@amd.com>
References: <20220502163722.3957-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just make sure that we forward the user fence status to the output
whenever any of the inputs are an user fence.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence-unwrap.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fence-unwrap.c
index 87ee2efced10..dd3c43aba8f1 100644
--- a/drivers/dma-buf/dma-fence-unwrap.c
+++ b/drivers/dma-buf/dma-fence-unwrap.c
@@ -66,17 +66,19 @@ struct dma_fence *__dma_fence_merge(unsigned int num_fences,
 {
 	struct dma_fence_array *result;
 	struct dma_fence *tmp, **array;
+	bool user_fence = false;
 	unsigned int i, count;
 
 	count = 0;
 	for (i = 0; i < num_fences; ++i) {
+		user_fence |= test_bit(DMA_FENCE_FLAG_USER, &fences[i]->flags);
 		dma_fence_unwrap_for_each(tmp, &iter[i], fences[i])
 			if (!dma_fence_is_signaled(tmp))
 				++count;
 	}
 
 	if (count == 0)
-		return dma_fence_get_stub(false);
+		return dma_fence_get_stub(user_fence);
 
 	if (count > INT_MAX)
 		return NULL;
@@ -129,11 +131,12 @@ struct dma_fence *__dma_fence_merge(unsigned int num_fences,
 	} while (tmp);
 
 	if (count == 0) {
-		tmp = dma_fence_get_stub(false);
+		tmp = dma_fence_get_stub(user_fence);
 		goto return_tmp;
 	}
 
-	if (count == 1) {
+	if (count == 1 &&
+	    test_bit(DMA_FENCE_FLAG_USER, &array[0]->flags) == user_fence) {
 		tmp = array[0];
 		goto return_tmp;
 	}
@@ -145,6 +148,8 @@ struct dma_fence *__dma_fence_merge(unsigned int num_fences,
 		tmp = NULL;
 		goto return_tmp;
 	}
+	if (user_fence)
+		set_bit(DMA_FENCE_FLAG_USER, &result->base.flags);
 	return &result->base;
 
 return_tmp:
-- 
2.25.1

