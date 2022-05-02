Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C14517476
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 18:37:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 813EF10F0A1;
	Mon,  2 May 2022 16:37:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A3F610F081
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 16:37:33 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id m62so8545213wme.5
 for <dri-devel@lists.freedesktop.org>; Mon, 02 May 2022 09:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jUPHAg5HbOj5ZN0WpYBsRJzMWzX/NFrcan6CKY2q7Ro=;
 b=K7kMi4HoE2Uh2vRrakSayQJE7aYVhjY9a5nwoadZ3BkU27oHo0Jx+EH8p9F1l+bwgN
 ougnq1m4Szq7vMRihB5chu9Z+ZAhMYo31EpJpgiEkXEFpJhONW9SJpvbLVTAB5PwPVI3
 gbJU1+PbvJ+nchom3hU+DdengngN/5Bt+DlU/qbiM1NW0su5lLTtTrUHRHaesf3vGLSc
 UOhd7WzqMspEwHYiwLE4lMMhu+ZuVlV3H03VpVIVwDWGktR9kADp5GtEhgNmI0j9NHYG
 5rZXer7PFDQr0n34gDRy9kaG7Q1lojECDnwbVLXefC9iMs89qUCExq9fJ6BQxKyi4Or3
 ziwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jUPHAg5HbOj5ZN0WpYBsRJzMWzX/NFrcan6CKY2q7Ro=;
 b=zW677M3jX3L+G6LJXPn9S9Fw4/B4EtO7+rlfT1J12izM+fXykAvBfGjJceK1CCHd67
 KGGsnoqvOQeTPsmTs1Z/E9F7lwQFg+OpAvxuBhrE2nvLkGiGoNDYvHvkkX5GuW65opbM
 cbki+nXg4X0MknRx4T0BaECrxrlN5I00Hv1HeK6LlOOqqOnY0plY4xMi8SCkqY5p+pZZ
 NbdVyzM6/t3pwWA5tQ7hbVOdxbbIpvfY+uKhoYcHFhav1+Qd/9YPuvMZQ/5xZ1YE4izr
 R2P1TlpReATj+1m/YHQx154BIKO99wTDPJZfbG42v9YKfLsLHEB2PZBPra/tr83MlO/S
 USew==
X-Gm-Message-State: AOAM5324axP+TMypJNqZjAlny/Xy6M6zl9YkMlTK3WjBhMPe67VVNnie
 rLoIrHzgpRHf7KzjCX94QgE=
X-Google-Smtp-Source: ABdhPJzPFdaPya/zgXl5sjQHQZoAs93P8c4u5VO/8cqCZV7P/ZBXkmF61G4yVvAvs5c6L70nsPZecg==
X-Received: by 2002:a7b:c4d8:0:b0:393:fecd:2718 with SMTP id
 g24-20020a7bc4d8000000b00393fecd2718mr11612189wmk.23.1651509451818; 
 Mon, 02 May 2022 09:37:31 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
 by smtp.gmail.com with ESMTPSA id
 p14-20020adfaa0e000000b0020c5253d8f6sm7294694wrd.66.2022.05.02.09.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 09:37:31 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, jason@jlekstrand.net, daniels@collabora.com,
 skhawaja@google.com, maad.aldabagh@amd.com, sergemetral@google.com,
 sumit.semwal@linaro.org, gustavo@padovan.org, Felix.Kuehling@amd.com,
 alexander.deucher@amd.com, tzimmermann@suse.de,
 tvrtko.ursulin@linux.intel.com, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 03/15] dma-buf: add user fence support to dma_fence_array
Date: Mon,  2 May 2022 18:37:10 +0200
Message-Id: <20220502163722.3957-4-christian.koenig@amd.com>
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

When any of the fences inside the array is an user fence the whole array
is considered to be an user fence as well.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence-array.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index 5c8a7084577b..de196b07d36d 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -189,8 +189,13 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
 	 * Enforce this here by checking that we don't create a dma_fence_array
 	 * with any container inside.
 	 */
-	while (num_fences--)
-		WARN_ON(dma_fence_is_container(fences[num_fences]));
+	while (num_fences--) {
+		struct dma_fence *f = fences[num_fences];
+
+		WARN_ON(dma_fence_is_container(f));
+		if (test_bit(DMA_FENCE_FLAG_USER, &f->flags))
+			set_bit(DMA_FENCE_FLAG_USER, &array->base.flags);
+	}
 
 	return array;
 }
-- 
2.25.1

