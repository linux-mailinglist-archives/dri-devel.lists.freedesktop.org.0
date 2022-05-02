Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BB1517478
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 18:37:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7F6F10F081;
	Mon,  2 May 2022 16:37:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B996010F0A6
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 16:37:34 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id d5so20239115wrb.6
 for <dri-devel@lists.freedesktop.org>; Mon, 02 May 2022 09:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BrOnJQ5GVd5xSufoaIbn+bREEyd4T5ZXHXrgSKz+378=;
 b=okpkvKiRl915tZRV+tKO2JUIHBSt+lEHdvyw8bY6TfdI5VooUsa0uko0GD2XuRtY6D
 ib2FOcZyu81uirrOQztEbyC13epUQrx7siG4pmRnHYF/yHr+iQUxw2oWRk7l7JpZPy2q
 EuePeHUY3wNFGxhM6ImJ5oulTkzYDCRCHjor0Ey1yXxucVzqfL9H9R7q2oT6ACV7MMeZ
 QUArRl0gIsFxN1ixLavUYobBb6oLoqTou2giIWUCQjleu4SgzBSL/dH8TdU1uwbG34lt
 0iroKwnZw4OoPgDqonqH6AQZ/Oy+sNlN2fP9I7HfH4hZi4oxsJXFtU4sJvElHNoANYcc
 fnbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BrOnJQ5GVd5xSufoaIbn+bREEyd4T5ZXHXrgSKz+378=;
 b=GgUh4BP8hFiFxxSmNZecFnC0nZr7IHfHCgsfDiODLJTf0fcYWMeSJhrJ8FBMb8vzZk
 eLxnzArsJmDvJnHXCcmIzTDw/1qi+v2FYJmKkd/q/k2yAiwAiu6Kk5vSfmxgwFLwV29D
 +yafQOEk1pxpsfoaSrl2OmGYzyzQWyE6W+d9tag9DGp90wFHWgMZcV4LDFuSzkZffFh0
 QpXSqse+XqtWVtZSMbUg0oaUGOWUb8r2Luco3+5gb+PQ5wZjzzI0iWq7oZBm5Q6GX9xn
 p3cfyf5PvEf71GE0CBlz4cfaF37H2dOb1Ypw6dsIRer3aVYmMEQ4EMhgicWLpJcTLzlY
 PGZg==
X-Gm-Message-State: AOAM532LIEj+YKl9+31ivmHQCoigjNZKzkkoU3nt+wgJGKcAOuIoSJen
 cOQIUfFJsRH1omH1gTHZ5wo=
X-Google-Smtp-Source: ABdhPJwsgT2uBu8jt40/OL4SbaktGz3QRHu++Q4skOI7kiUNv4O32wAoOAtOasCXMjvp7kYjRaqe4g==
X-Received: by 2002:a05:6000:1ac8:b0:20c:6ed8:403 with SMTP id
 i8-20020a0560001ac800b0020c6ed80403mr1907892wry.247.1651509453268; 
 Mon, 02 May 2022 09:37:33 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
 by smtp.gmail.com with ESMTPSA id
 p14-20020adfaa0e000000b0020c5253d8f6sm7294694wrd.66.2022.05.02.09.37.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 09:37:32 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, jason@jlekstrand.net, daniels@collabora.com,
 skhawaja@google.com, maad.aldabagh@amd.com, sergemetral@google.com,
 sumit.semwal@linaro.org, gustavo@padovan.org, Felix.Kuehling@amd.com,
 alexander.deucher@amd.com, tzimmermann@suse.de,
 tvrtko.ursulin@linux.intel.com, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 04/15] dma-buf: add user fence support to dma_fence_chain
Date: Mon,  2 May 2022 18:37:11 +0200
Message-Id: <20220502163722.3957-5-christian.koenig@amd.com>
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

If either the previous fence or the newly chained on is an user fence the
dma_fence chain node is considered an user fence as well.

This way the user fence status propagates through the chain.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence-chain.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
index 06f8ef97c6e8..421241607ac2 100644
--- a/drivers/dma-buf/dma-fence-chain.c
+++ b/drivers/dma-buf/dma-fence-chain.c
@@ -253,6 +253,10 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
 	dma_fence_init(&chain->base, &dma_fence_chain_ops,
 		       &chain->lock, context, seqno);
 
+	if ((prev && test_bit(DMA_FENCE_FLAG_USER, &prev->flags)) ||
+	    test_bit(DMA_FENCE_FLAG_USER, &fence->flags))
+		set_bit(DMA_FENCE_FLAG_USER, &chain->base.flags);
+
 	/*
 	 * Chaining dma_fence_chain container together is only allowed through
 	 * the prev fence and not through the contained fence.
-- 
2.25.1

