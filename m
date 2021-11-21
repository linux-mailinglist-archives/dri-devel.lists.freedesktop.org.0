Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D69D4582DF
	for <lists+dri-devel@lfdr.de>; Sun, 21 Nov 2021 11:13:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA8156E933;
	Sun, 21 Nov 2021 10:13:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B27BD6E933;
 Sun, 21 Nov 2021 10:13:23 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 y14-20020a17090a2b4e00b001a5824f4918so14444119pjc.4; 
 Sun, 21 Nov 2021 02:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jz7G1X3noj7SdKT0BssmGxJwd6YdQwKy8J5O5kFPx/A=;
 b=hPjd7zP2W3VwO1Z4CBoUY6mieF4iT+nIUjE7tgeP2gy8/frGuaHMkBG/+mKnA2bC+j
 +jfZ7DMeKU1bArdHF1OTamHF/fVBElYmgMq/vRR/ocLZxsQ+oK0/E5Wi1h42zpRZnwC6
 yUeWyfrvpxYJ2XmhK8gR2ud97z85681CWEJJ5J9Ij0sGpu7paI3tQ6pUN4xsUQ4sXp0u
 Xo5Z3uKQtYAf8hL5gxePQozs1DiazIfX1McQc/PO0FDiWe1pK8SH5faQe99UQa1xxroc
 Maqe3KXuXrvsxCk3vo8XPs0S5bMKVmZbmFOe5FNlFwqTPG/VHoL+e34oAvngej0zo3gz
 t/FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jz7G1X3noj7SdKT0BssmGxJwd6YdQwKy8J5O5kFPx/A=;
 b=f06zW1vqlV0592SC7UF3EODx/AK1HUQZBrJH5+p+6NI8HqjpbIerzH7FXX5M6D5IPa
 FqnrA5tba5v1h4gg+EYzhJB3SATOhea8Pxf784P0w8AgWIZBPZJwVlR4RuIqIV/80fQz
 j3m5YoxVd/vCi3JLb77KEQ4Mq6HYC8+6oLv6Mf0cghwyiptmGpXspNVdBdpjQbQ699OA
 Kns6TC8VVD6cblp8Jbzop1IUwhs0+7/fLpcPxxgW6Qn180dF3XBGMCzipzDCejA0sU33
 5SAic9c1/lT4N9Mjml26y9sAfXaEx/atZ/7DvFuE/cL4lnsMjJKg+O49btdx2/MoNi4J
 z8nQ==
X-Gm-Message-State: AOAM532+5g2hwt+zKO1rKnXVM7Z9d1TRpCSWpjtpcc8M6sLO2Y/BgzKf
 apIWnyF1aneZohIaRsOQmCY=
X-Google-Smtp-Source: ABdhPJyQsqrMCoVLEZdQ+jQfLlJBDck3tb4ASoikt4GWJZqLMSci4BkU90KnfkyY3OtsEXKlj0LavQ==
X-Received: by 2002:a17:902:ab47:b0:141:95b2:7eaf with SMTP id
 ij7-20020a170902ab4700b0014195b27eafmr95815169plb.40.1637489603356; 
 Sun, 21 Nov 2021 02:13:23 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id nl16sm16226182pjb.13.2021.11.21.02.13.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Nov 2021 02:13:22 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: yong.yiran@zte.com.cn
To: jani.nikula@linux.intel.com
Subject: [PATCH linux-next] drm/i915/request: Remove unused variables
Date: Sun, 21 Nov 2021 10:13:09 +0000
Message-Id: <20211121101309.23577-1-yong.yiran@zte.com.cn>
X-Mailer: git-send-email 2.25.1
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
Cc: airlied@linux.ie, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 yong yiran <yong.yiran@zte.com.cn>, rodrigo.vivi@intel.com,
 Zeal Robot <zealci@zte.com.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: yong yiran <yong.yiran@zte.com.cn>

The clang_analyzer complains as follows:
drivers/gpu/drm/i915/i915_request.c:2119:2 warning:
Value stored to 'x' is never read

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: yong yiran <yong.yiran@zte.com.cn>
---
 drivers/gpu/drm/i915/i915_request.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index 820a1f38b271..5e4420f461e9 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -2047,7 +2047,6 @@ void i915_request_show(struct drm_printer *m,
 {
 	const char *name = rq->fence.ops->get_timeline_name((struct dma_fence *)&rq->fence);
 	char buf[80] = "";
-	int x = 0;
 
 	/*
 	 * The prefix is used to show the queue status, for which we use
@@ -2079,8 +2078,6 @@ void i915_request_show(struct drm_printer *m,
 	 *      from the lists
 	 */
 
-	x = print_sched_attr(&rq->sched.attr, buf, x, sizeof(buf));
-
 	drm_printf(m, "%s%.*s%c %llx:%lld%s%s %s @ %dms: %s\n",
 		   prefix, indent, "                ",
 		   queue_status(rq),
-- 
2.25.1

