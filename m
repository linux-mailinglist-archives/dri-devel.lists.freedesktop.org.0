Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E92C73622A5
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 16:38:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09F3C6EC2E;
	Fri, 16 Apr 2021 14:38:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB08A6EC16
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 14:38:00 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id z1so32560219edb.8
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 07:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1tnd3CCiOTU6oRai7K6vIdbIrWXk2JdXqV/lmbbBung=;
 b=HI74TewrvzX00NmCH+IL7CJ5pNK8/FG90QDJLwNNOsPf9pK80IK3XLopWTolQGqBZ1
 l66Xp92uOfThrHapM4RL52WP+Tq1/QZ7NhDl+vJ7vTV/FnlP18Ut2bi7+pjHFLgIonM7
 L8TdNjsCTalQdSV76CluMM3eewdeJ1xo9ZwVD4YYFnQtbB5wxsFnJ2X1msTClEX5Ihxt
 62RZuzoQpM/TWMVjiY8gkLu4AA+Pc6HKNrDi4bde2w3MfbVJkohMJ588/36cL5+Axbjl
 R07gelnAn7ICrYX1Lxn3DyUy5kX4gGvWOVmBkhSZoAH80jX37IxAVa92M6SURCDPTXMM
 Wc3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1tnd3CCiOTU6oRai7K6vIdbIrWXk2JdXqV/lmbbBung=;
 b=dCHniCQUOisGMfHmxN6Vh6cfzJwEEGaSLvbv83PcbzTL80K2nVK3auDueWL/6kMlTb
 z+PZZTXDku8+2vOUQrZyn8Zt7+mhAGIIfGtnb6i3ZmWuhp4/2+jZjF3jStjGWgmt3mfJ
 2grkTWo/D/9WnrNJxepDRu0GJ6msbCOf0w3mTJhrcNmKSj6lfapet3eVWTtP/11B4VYx
 7O/juSka5Rgkf9kX5SCOhHTX85hQizRwZN4H866Rft6Ub2DqmHfFxdGHSzMKpuEhVfk1
 sOKdio3B2Knr0aSCaLABeAUlJ18WzanjXOfRTyv/DEaRFio/A/TPmNscPKyjwz8KQcGm
 t9Gw==
X-Gm-Message-State: AOAM530AarYcaiQ4CRWi3Re6Tx8r6H9eUrzPLKFokT8EA19wdiZtsBIZ
 2wfwmaxHyyjgT2IoMex3TT791g==
X-Google-Smtp-Source: ABdhPJzOAqEdWjMEk3fAEKmtY/yRpSZ10LT8MjLqMMrqvYXPj4js3DUS3SKLuNiq1CnKaRGz62pd3Q==
X-Received: by 2002:aa7:dc0b:: with SMTP id b11mr10548194edu.124.1618583879454; 
 Fri, 16 Apr 2021 07:37:59 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm1326523ejk.93.2021.04.16.07.37.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 07:37:59 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 28/40] drm/panel/panel-raspberrypi-touchscreen: Demote
 kernel-doc abuse
Date: Fri, 16 Apr 2021 15:37:13 +0100
Message-Id: <20210416143725.2769053-29-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210416143725.2769053-1-lee.jones@linaro.org>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c:33: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst

Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Eric Anholt <eric@anholt.net>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
index 5e9ccefb88f62..2229f1af2ca8c 100644
--- a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
+++ b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
@@ -29,7 +29,7 @@
  * DEALINGS IN THE SOFTWARE.
  */
 
-/**
+/*
  * Raspberry Pi 7" touchscreen panel driver.
  *
  * The 7" touchscreen consists of a DPI LCD panel, a Toshiba
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
