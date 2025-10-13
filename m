Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B0BBD3924
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 16:35:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E14E910E47F;
	Mon, 13 Oct 2025 14:35:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fUyKlPIP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2369210E471
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 14:35:12 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-634b774f135so6889281a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 07:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760366111; x=1760970911; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r+M6T90aofvVrx2e1vqwPoDjqCLdEjx6BHMLbVIttJc=;
 b=fUyKlPIPOtT47kiIFcXtOEY0Gfdg6FHOS7FMWzmKnyPEg8fyPiv8zIpjqDZ7O3AmVU
 de8szRrtv+RY7mP33CAVLutfEtgq412VtP2WRhLeqcxzkiz+3O+FFyBSqslFjbqyKW+2
 L+VEyaiVL9SFDMGzFHjUKp1OzaQijDC66zWwzQB27d/R9PQyOA/NcNyQKBD/eGwL2+Yq
 u73YXxbLfmtWr0M3h7ECB56Ihojfqh+2yR8lgCmNUjNmAmCzbIBgg1b99K0C5eUdJJER
 7a6no9QardqFRtCEDMhHaZ2w1dm2+htYhS7rHiNxtbL6hP4GPSF9IPZ0H1mSZUguqSfb
 m0Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760366111; x=1760970911;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r+M6T90aofvVrx2e1vqwPoDjqCLdEjx6BHMLbVIttJc=;
 b=YPlJlFPfs1SIM2UgQyWHQaA6TBApE2f8QQEwiBQfjSxFERwsre1ZRO8K271h84oKPT
 KkTVcjf0n3yc14oPU9fDuORQt7r/nkQHzQ5yqabfmnvOIUBVFOFcZsunXhdTElaVCtBa
 lUz1120D+gRRzTPwQmdCCL0oNjZdbSaXKaidJRKDTieQuWCyyyZLagefgutMc04r8FDa
 0OieX7k/aTNLHtX0TZkWD1OjuuxVpTNj+GBrRWbV47jHbptVzMNPwLJ+2s+axT2ra6Iy
 kCtcobS6kNoXlagQU7GCiV7H7QUcjw5C7DWnEEabtFKDvvcqwGJB15RIZg4NvFGIQpSC
 DRWw==
X-Gm-Message-State: AOJu0YyHy4N3hKnGbDjRpqnYahmn43yLM6Ys5+/yiGYmLN4wFCkjGRMK
 E/dSZ9brWQnoR8PNCxeRR4xvlzuEep16YYDbT7+d0dssLs9FfqF8eGMI
X-Gm-Gg: ASbGncs2BPfZQBNQJToPEoM+mnB5CZgKGj3iJ4+Xl1Nyitw+rYj+HzX7qiEm82mFXIc
 VBUiRj7pjyRJVRmT6yI+OKXyNkpuCheuRy7iTQPB5nI2pbDr0nDqSqa9hGQ/mv2McMxo1NXho3e
 hITt1GdLOmmmY1d9cAKZOo188AfeXp1AIl/SdPtLxWqANr81ltgeSOCHcbXIo7MEaLmTSsUVBgM
 hSli0mpjoft7BR8gespfl4TTQE9tGvA60HUETi9sAbi3I+o8V2L+RVCwRVTIcNUYj9zNhmqRk+8
 DSqf+uPYePvoUURrXvm+yUSyNviWt8IbnM3IcXVxnHuwkLKn/qWl4zb0yp0+ToiWHp40hHuPN3K
 eCsW+fqPqutgB5OCwoBvRtMvlquyiFMEEZDXZi/pcntw0fl1/rhoasME=
X-Google-Smtp-Source: AGHT+IGfdI6Oj1WLuruFkjDpBWShReH7o0XKE+2jBb30VmEvhIh56qe5192WVy+lq83KXszpXTzFHw==
X-Received: by 2002:aa7:d0c9:0:b0:633:8787:607b with SMTP id
 4fb4d7f45d1cf-639d5b84856mr14366662a12.12.1760366110556; 
 Mon, 13 Oct 2025 07:35:10 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:151b:dc00:15d1:ebc5:76e6:730f])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63a5c321453sm8942037a12.39.2025.10.13.07.35.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Oct 2025 07:35:10 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 08/15] dma-buf: use inline lock for the dma-fence-chain
Date: Mon, 13 Oct 2025 15:48:35 +0200
Message-ID: <20251013143502.1655-9-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251013143502.1655-1-christian.koenig@amd.com>
References: <20251013143502.1655-1-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just as proof of concept and minor cleanup.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence-chain.c | 3 +--
 include/linux/dma-fence-chain.h   | 1 -
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
index a8a90acf4f34..a707792b6025 100644
--- a/drivers/dma-buf/dma-fence-chain.c
+++ b/drivers/dma-buf/dma-fence-chain.c
@@ -245,7 +245,6 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
 	struct dma_fence_chain *prev_chain = to_dma_fence_chain(prev);
 	uint64_t context;
 
-	spin_lock_init(&chain->lock);
 	rcu_assign_pointer(chain->prev, prev);
 	chain->fence = fence;
 	chain->prev_seqno = 0;
@@ -261,7 +260,7 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
 			seqno = max(prev->seqno, seqno);
 	}
 
-	dma_fence_init64(&chain->base, &dma_fence_chain_ops, &chain->lock,
+	dma_fence_init64(&chain->base, &dma_fence_chain_ops, NULL,
 			 context, seqno);
 
 	/*
diff --git a/include/linux/dma-fence-chain.h b/include/linux/dma-fence-chain.h
index 68c3c1e41014..d39ce7a2e599 100644
--- a/include/linux/dma-fence-chain.h
+++ b/include/linux/dma-fence-chain.h
@@ -46,7 +46,6 @@ struct dma_fence_chain {
 		 */
 		struct irq_work work;
 	};
-	spinlock_t lock;
 };
 
 
-- 
2.43.0

