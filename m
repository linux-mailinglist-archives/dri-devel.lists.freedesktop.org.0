Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EA04363F8
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 16:19:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8C0D6EC84;
	Thu, 21 Oct 2021 14:19:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 364AD6EC84
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 14:19:48 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id r10so1112236wra.12
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 07:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V65O9M9TE0L4kcONcMS9LmZ11fwEeXDt7zYg/kW4aI8=;
 b=o+0OI1a7i0e55syScMcCNiISlXtyYIAYr9ELzwhhac5YVjFni+uAEkjMdnIeRMS3YM
 pWVe0uNNiwPPIF8uYKkQ1NSi7o8B2OSUqBelj/3y3EScuP6YxbYL6h84kXuTe71RNN3a
 ZlVhJWCMTFZYtRUdojQYBCuL0xPOlR5gv+xx0aCHdEKhLKqb+6ag+vR2S4ejD83JIe71
 UxTwp7y3xxLwMqKHmhijgYeinpN2wSQp7sje1qJo8LLKFqOmynCooAgN4jxMEooysIlH
 zkV5JGvXnyRI90LeXsMYWMM/7hnqSIR4wAtuKyQAg6vCG8sOjBQauG185b4AQxXim+U1
 Mgag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V65O9M9TE0L4kcONcMS9LmZ11fwEeXDt7zYg/kW4aI8=;
 b=7oJsDwMRM1vid6t7ekyr8GKEXjqaUwRZwi+GVxiq+VJFdjriIETA/pJPnd+KFaYgd2
 FAyBWDLnBjACAAz7Q+rBmKJKnQAxzUokIR9R6xuR36Pm1KPT+BSG366R9EJQO9fU96Cb
 GQTHclauD1Al/IFr7IVzvM2d93n1VF3rg5uVAK7IO1F+NxlIBXEFzcSTsrpJNACxo95f
 /o2b9r+LzBTdw79Rr+4I3r5F3wdrL6KhOrUERKli4Wx1unCXt1oMBxWft70WimjNgfOy
 HtMJtWrFseAihAFlUItFa7liLWq9eIx/Xwn1WPzFifuOBwe1PvBZiSFYCNay81hXX+g5
 1ADg==
X-Gm-Message-State: AOAM530sqD5/hR6nC0ic7jU6m3mzDIlUXxx2tMMV3h0Ui7MJFJotcT1R
 4HvYD3x40DEji4ti2R82QLMUqPK/jmY=
X-Google-Smtp-Source: ABdhPJzA0NfFcQtqiqTN2LrLJCDqzBLdecDyL9/PdxGjy34NMMzV+1T25g+4DM6Qaa5h0PVsIQk5IQ==
X-Received: by 2002:a05:6000:1449:: with SMTP id
 v9mr7406089wrx.433.1634825986841; 
 Thu, 21 Oct 2021 07:19:46 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 n7sm5102467wra.37.2021.10.21.07.19.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 07:19:46 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: sfr@canb.auug.org.au
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH] dma-buf: fix kerneldoc for renamed members
Date: Thu, 21 Oct 2021 16:19:45 +0200
Message-Id: <20211021141945.84023-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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

Those members where renamed, update the kerneldoc as well.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 include/linux/dma-buf.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 02c2eb874da6..9807aef33685 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -433,8 +433,8 @@ struct dma_buf {
 	/** @poll: for userspace poll support */
 	wait_queue_head_t poll;
 
-	/** @cb_excl: for userspace poll support */
-	/** @cb_shared: for userspace poll support */
+	/** @cb_in: for userspace poll support */
+	/** @cb_out: for userspace poll support */
 	struct dma_buf_poll_cb_t {
 		struct dma_fence_cb cb;
 		wait_queue_head_t *poll;
-- 
2.25.1

