Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E6A2F4D8A
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 15:50:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CA036EA4E;
	Wed, 13 Jan 2021 14:50:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1E8C6EA50
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 14:50:21 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id m4so2388813wrx.9
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 06:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jVSUjkIjXEkNiZ9bYl2AvQwRUk7bSgmr726se0qdSGE=;
 b=S6pjMri1LooUzVebsMKl5L/qXAXXf0BQaNWI9zUwzK+jMt6eB9Qc4oOTGepufIBfid
 w8BOqqJSqOTlO1AaMZ2c97EUxzPgYgwXzlP38xgFZHdc5f5/8pnliirr015cmXT5P/6C
 bmXz//hqWY6WZtaLsnyk9w3DTs/zx93zvqMGjgmGEz1ltpAcWFoGUuZTLcV3oaXDRWzg
 TsHN1MtRbF4DsoU67oqGthJ9CyD102ea6PWM8nSeKWwLjDVQYDQOynMxGeM3eMYyzuVy
 k+RwnCTE6vvqOECHhK+/HT1+C06vWU2p6IumxaB4VEqq3egwhncHh1sL8BXGgsKHUjzx
 Jyrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jVSUjkIjXEkNiZ9bYl2AvQwRUk7bSgmr726se0qdSGE=;
 b=lzpEaY7c1Z2k1v0xtkxKZyC5x8/rASyU1ogwqvSCT+d1a4UtdYHIbsLOamATDZiycF
 ioll2KbzaG6HSnPMAv0TfdkIWGytKbs+W8YTjFd1/iWVCL+BPAlH4XX8PjotR92a8Ye9
 MJRVtTRC9Uao121SKpv7bKVWhjkeVt7W6VaevERpQjHTrfZAAuWpVUGJIkpHvk2eMbCU
 kz8tO+NbEaIpvPU3uewjnu1ewP8TkfQ2Uj53rMm13mRfwZi1hWlMVtnuOE6qLej+qPzp
 UwH81sBMdb4xYK0ZESHv9CAHvaUeaCbsUYoEmV1wJjF24h4k0g2YSxv5wXBMGedsIrwC
 GA3A==
X-Gm-Message-State: AOAM5325svgn6z6/Kn4g4IeH+tkcWrlgEDC23mKKQVN5fvnQFSqlxhvA
 ov0YauT0Rycu37BQbO41WlPtoQ==
X-Google-Smtp-Source: ABdhPJwQS7eakiW5Ymk7Te1CVRoqQilV5MyqcK9JOS6lfWXJfPo5U8VaTE2R9c7aaPoPlmXHPb50DQ==
X-Received: by 2002:adf:ec86:: with SMTP id z6mr2994233wrn.17.1610549420622;
 Wed, 13 Jan 2021 06:50:20 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id t188sm3273433wmf.9.2021.01.13.06.50.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 06:50:19 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 05/31] video: of_videomode: Fix formatting in kernel-doc header
Date: Wed, 13 Jan 2021 14:49:43 +0000
Message-Id: <20210113145009.1272040-6-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210113145009.1272040-1-lee.jones@linaro.org>
References: <20210113145009.1272040-1-lee.jones@linaro.org>
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
Cc: linux-fbdev@vger.kernel.org, Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/video/of_videomode.c:32: warning: Function parameter or member 'np' not described in 'of_get_videomode'
 drivers/video/of_videomode.c:32: warning: Function parameter or member 'vm' not described in 'of_get_videomode'
 drivers/video/of_videomode.c:32: warning: Function parameter or member 'index' not described in 'of_get_videomode'

Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/video/of_videomode.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/video/of_videomode.c b/drivers/video/of_videomode.c
index 67aff2421c29e..97a220852977f 100644
--- a/drivers/video/of_videomode.c
+++ b/drivers/video/of_videomode.c
@@ -14,11 +14,11 @@
 
 /**
  * of_get_videomode - get the videomode #<index> from devicetree
- * @np - devicenode with the display_timings
- * @vm - set to return value
- * @index - index into list of display_timings
- *	    (Set this to OF_USE_NATIVE_MODE to use whatever mode is
- *	     specified as native mode in the DT.)
+ * @np: devicenode with the display_timings
+ * @vm: set to return value
+ * @index: index into list of display_timings
+ *	   (Set this to OF_USE_NATIVE_MODE to use whatever mode is
+ *	    specified as native mode in the DT.)
  *
  * DESCRIPTION:
  * Get a list of all display timings and put the one
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
