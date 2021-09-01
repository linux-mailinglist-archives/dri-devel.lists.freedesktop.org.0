Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C773FD92A
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 14:02:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78B356E1B3;
	Wed,  1 Sep 2021 12:02:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7709D6E1B3
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 12:02:48 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id t15so4114157wrg.7
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Sep 2021 05:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kvjkshBsZL+MRjib8570PI/tuRb4iFlF0PaMehLZjJ4=;
 b=dzSvn4RHJttKFOSm64mEroR9IRoIt9UyaGH17DQXq7LbKzUI44YaM4wVrBG4fUM76S
 V9WFpFC6vjx5iF4Wn21HwjhrbT1YgPr8EpBw4TZWvNmD+4E65GjR1IQ6pJtLYclnt80u
 Qr1ebxChCighqupPu5X32f6XSuKwrZ84IpgHwh41vcvkxRPwViQnwF5ufaIY6wnGqqg8
 5IKo6JQ4AZoyhczqpjlPRRmDGNX16SNKabaInV4ozPj+wRuLtLukddB8mUQXLjWQBGkf
 jeDuQn4hp6dmCOmxeg7w7q0VkXXQElXCDwVu2cv1tGIGafl7bsGxK33y5esn5gQBkORC
 A/rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kvjkshBsZL+MRjib8570PI/tuRb4iFlF0PaMehLZjJ4=;
 b=Hqqb/iNR+CdkDWD2lU0rZNZoI9vvAuNdldL1W4OWvFjqr/uGyS/d3OsRra3adQVXJT
 z9OHLhQs4YHgIMEYJCwqdr05nBCNZAbY+lTmXRl14bkvqOYU3HoqdyEik95l7jfeoN6F
 KkIlqvBEP5RbrCWJCQHMtI9z+m4JU6wgw2QxrcC9va5OlhrazngLgOtIVfSxFW6Ezsfo
 gdNtbHGQdZr6wUIaJ5ez5IUUUKojH+yU6VxpajOVRuN6bjuXBwdGJ6wYDnA38zB+xKFg
 yuUocdIHey94jdh1vHtKEUk59opLYRLaH/Sg2gVF6+8s2uxnJKT6q3xwLx1p9UFJiSH0
 8lFw==
X-Gm-Message-State: AOAM531j/2BfwgeRM7vitNOMFJuec16cOIde66pof11FFC86gZEsDgXe
 dJvNJDcIpGiK6QXtZpEoWBuFcK4+0qjiDW4h
X-Google-Smtp-Source: ABdhPJxLTeJ8VsgxsRlNO8XS7iVSjRXV9946sSFr+9mkf0DaEKe11SupLqOFNweo1Y+23uPd10G1Vg==
X-Received: by 2002:adf:9151:: with SMTP id j75mr37560030wrj.68.1630497767071; 
 Wed, 01 Sep 2021 05:02:47 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 l7sm5641336wmj.9.2021.09.01.05.02.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 05:02:46 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Cc: daniel@ffwll.ch, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH 1/2] dma-buf: clarify dma_fence_ops->wait documentation
Date: Wed,  1 Sep 2021 14:02:39 +0200
Message-Id: <20210901120240.7339-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210901120240.7339-1-christian.koenig@amd.com>
References: <20210901120240.7339-1-christian.koenig@amd.com>
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

This callback is pretty much deprecated and should not be used by new implementations.

Clarify that in the documentation as well.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 include/linux/dma-fence.h | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 6ffb4b2c6371..a44e42b86c2a 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -214,19 +214,15 @@ struct dma_fence_ops {
 	 * Custom wait implementation, defaults to dma_fence_default_wait() if
 	 * not set.
 	 *
-	 * The dma_fence_default_wait implementation should work for any fence, as long
-	 * as @enable_signaling works correctly. This hook allows drivers to
-	 * have an optimized version for the case where a process context is
-	 * already available, e.g. if @enable_signaling for the general case
-	 * needs to set up a worker thread.
+	 * Deprecated and should not be used by new implementations. Only used
+	 * by existing implementations which need special handling for their
+	 * hardware reset procedure.
 	 *
 	 * Must return -ERESTARTSYS if the wait is intr = true and the wait was
 	 * interrupted, and remaining jiffies if fence has signaled, or 0 if wait
 	 * timed out. Can also return other error values on custom implementations,
 	 * which should be treated as if the fence is signaled. For example a hardware
 	 * lockup could be reported like that.
-	 *
-	 * This callback is optional.
 	 */
 	signed long (*wait)(struct dma_fence *fence,
 			    bool intr, signed long timeout);
-- 
2.25.1

