Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D893912D4
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 10:48:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0A5C6EC4E;
	Wed, 26 May 2021 08:48:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F5D6EC2F
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 08:47:58 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id j14so208317wrq.5
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 01:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sC3mIdqFUsQKIxXxCz1K8xBUphxh36SrzQvqXPDvpPY=;
 b=aQRUeFJ1Tv1TRs3shdu+bDGiWPbu0Zzno+WGQszWxUGJrQAFFO4Bx7nN5H7ytxpqA+
 F/dewoVbjvrsn93ZK0fud4nAn9F3KsxZV1HrGheZo4fAlX5hoo15avmNOpo9FC2EnPz/
 qOr/d8N9/wGdnA0p8Kjjr5NsBv6h1SwZmOY8phgTCG//0mK+a0UUCuEptCNU0e8EZY/2
 Ogj27ozvQkDi69ClBZ61X/HPJzp9bMXUFqaGRewYXIs3J3aoKsH6fqXykFkl3ENbdy8/
 /VP3GdF1/mDCHVlOAdbDfCELpVP8ZIumK+upV4e/EzDE4CQfjGSgtHfxTwIHfLoy/JFH
 hCKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sC3mIdqFUsQKIxXxCz1K8xBUphxh36SrzQvqXPDvpPY=;
 b=NEi8Y17XX8EuNQXfiFdZcBjaof1fULW1Pf8mG3oBmj+SOz5KIUtb90A6SfPRX1y4Zk
 xgD86SzXB0YlZ7ZPoaHT694xmwnVK1Z1OCI3wV2pgMP87Z3jtyfyxu4GjrUZxqZOjL2b
 fBqZqL1S3ie+UilBW1EdoqLRolJZxQVgXsSKHel5+KEV2H3qoYlHIR631U/Q2fL0VxKn
 yTTCt2XPvuZ4aaGoDDkvw0ZepaVia5AhZgzuj3xkIx344oYa01aS4D92bOAg536H+kDP
 bXYWQw8TwDZxRprOMwrNZya2d2avvB8FnN4zZCJ8Az6wQgcXDtqXtGPLyS0rXfOA/a/Z
 Exmg==
X-Gm-Message-State: AOAM532l/pev58SNymWLKL2nutMZMxpXJiwBzvAxfV+97pqq3cDN3CfO
 EjOlH96GQou/B5DMl/aDFjE/eA==
X-Google-Smtp-Source: ABdhPJw61xLRdH4uwzLeGWvPWeOtGI2LITlVIBm3U1j6M4H/najTyZjmdkW3FJGtjqnGJdHffJ1EXQ==
X-Received: by 2002:a5d:52ce:: with SMTP id r14mr17259894wrv.395.1622018877614; 
 Wed, 26 May 2021 01:47:57 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
 by smtp.gmail.com with ESMTPSA id l18sm18911918wrt.97.2021.05.26.01.47.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 01:47:57 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 26/34] drm/xlnx/zynqmp_dp: Fix incorrectly name function
 'zynqmp_dp_train()'
Date: Wed, 26 May 2021 09:47:18 +0100
Message-Id: <20210526084726.552052-27-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526084726.552052-1-lee.jones@linaro.org>
References: <20210526084726.552052-1-lee.jones@linaro.org>
MIME-Version: 1.0
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
Cc: Hyun Kwon <hyun.kwon@xilinx.com>, David Airlie <airlied@linux.ie>,
 Michal Simek <michal.simek@xilinx.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/xlnx/zynqmp_dp.c:806: warning: expecting prototype for zynqmp_dp_link_train(). Prototype was for zynqmp_dp_train() instead

Cc: Hyun Kwon <hyun.kwon@xilinx.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Michal Simek <michal.simek@xilinx.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/xlnx/zynqmp_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 82430ca9b9133..a1055d5055eab 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -797,7 +797,7 @@ static int zynqmp_dp_link_train_ce(struct zynqmp_dp *dp)
 }
 
 /**
- * zynqmp_dp_link_train - Train the link
+ * zynqmp_dp_train - Train the link
  * @dp: DisplayPort IP core structure
  *
  * Return: 0 if all trains are done successfully, or corresponding error code.
-- 
2.31.1

