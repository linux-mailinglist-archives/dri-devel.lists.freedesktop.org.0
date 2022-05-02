Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A38151747D
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 18:37:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A85910F0B8;
	Mon,  2 May 2022 16:37:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9005A10F0B8
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 16:37:40 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id c11so10414389wrn.8
 for <dri-devel@lists.freedesktop.org>; Mon, 02 May 2022 09:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DjepyRyvA6mLg/4EFB+VBQwNzCxlgFJd+rSnwBXcAo4=;
 b=b9McOF0QAQ4Vl1Xixqh+MWtgKhqJVwn5xVup/ay+JwJWOdF4F9BUxMavHOaj/8S6Nh
 SdIUTeOUydNZ784Hwl1hjbrRa1iqlF3EFIu4jhNFxYHXtpm5gsCt7Z0dmwrog09TcyS9
 4D4sPCjynN1qp0m9VCtpp65oWPw1bE/QlKzw3oBmWsZyplJoEgktlSMI4ajRWnzURzVA
 CTiCssh6TAoEfw8Iz5ncjHIrKdoor3k9KKkcKIP9Lj2NEwvU09NeDBsHTJbf9rDSsUQa
 oZ+zLrz0fzr8Bc6PaKdaxIlWzjQtg5fEaVfv4ygePTgY8+nMUziiXz1JL3rb5oMuvpa5
 qYJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DjepyRyvA6mLg/4EFB+VBQwNzCxlgFJd+rSnwBXcAo4=;
 b=RBCWBKgjxnC9V/ngzeBLpVk0jZqWcsFKjAQ+menhBIbs6kYRzsCyuuPTxG79x5V0Td
 4HarRgODgil1hfH9XpIod53qO5HLw3Hq3OzCuEjP2q4wqyZFGLgWV77C+kHqcMkMjoB3
 2mE8qvGPII7avZZf0nKo7MZDqYZJiITgGXacd0/z4iq4FRIGCeZZFcwJ++LaGa7OgYam
 sa1GG/QZBgq5RaclISjPQ0wV9lSoUTC68cXSvKqNSwcJhz5mFeqox0yKQ9y6tR0ULK4/
 WHdLXPoill7TF6bC4BoKjvEOWXQn/uYgdwZvI9Roa18/MgFD0AH8xTEVX/9+dOt+Jlv+
 GV9g==
X-Gm-Message-State: AOAM530PXRm8fdhidjvOUNSPoM+ELLlXkbcTKoO5+IDHG9EWb8WHy90a
 qiwP8g/BsiAiVGJbZu/CSso=
X-Google-Smtp-Source: ABdhPJybrPRxtci7aY1OOebXO27jsS5DQk+XuP1Q+hwI5bUFAaGVwmOUHoqt5uQuXpdTVJ383HXw2A==
X-Received: by 2002:a5d:4205:0:b0:20a:e23c:a7f4 with SMTP id
 n5-20020a5d4205000000b0020ae23ca7f4mr10196022wrq.576.1651509459141; 
 Mon, 02 May 2022 09:37:39 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
 by smtp.gmail.com with ESMTPSA id
 p14-20020adfaa0e000000b0020c5253d8f6sm7294694wrd.66.2022.05.02.09.37.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 09:37:38 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, jason@jlekstrand.net, daniels@collabora.com,
 skhawaja@google.com, maad.aldabagh@amd.com, sergemetral@google.com,
 sumit.semwal@linaro.org, gustavo@padovan.org, Felix.Kuehling@amd.com,
 alexander.deucher@amd.com, tzimmermann@suse.de,
 tvrtko.ursulin@linux.intel.com, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 08/15] dma-buf: add support for polling on user fences
Date: Mon,  2 May 2022 18:37:15 +0200
Message-Id: <20220502163722.3957-9-christian.koenig@amd.com>
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

Just also wait for user fences to signal when we wait for write fences.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-buf.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 79795857be3e..5558f4e555f8 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -225,6 +225,16 @@ static bool dma_buf_poll_add_cb(struct dma_resv *resv, bool write,
 		dma_fence_put(fence);
 	}
 
+	if (!write)
+		return false;
+
+	dma_resv_for_each_fence(&cursor, resv, DMA_RESV_USAGE_USER, fence) {
+		dma_fence_get(fence);
+		r = dma_fence_add_callback(fence, &dcb->cb, dma_buf_poll_cb);
+		if (!r)
+			return true;
+		dma_fence_put(fence);
+	}
 	return false;
 }
 
-- 
2.25.1

