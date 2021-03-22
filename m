Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65417344071
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 13:06:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02D3E6E454;
	Mon, 22 Mar 2021 12:06:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF6776E453;
 Mon, 22 Mar 2021 12:06:20 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id x14so10173839qki.10;
 Mon, 22 Mar 2021 05:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cBJ4mk8tWYLUMjPIwRJW0iTCZ8TzYegwS1Rmxpud8ns=;
 b=fneby5oySa+iQmMjwqvA/8Zy9ZdeQ95LMmiY9BaZXP+rHq+ZK2whvceaK3VdZspvpZ
 p5L6NwemEzA9YnhA6Y52/Po8XM8PzIoUvlahUeqdTMvZk2olmFrbjKflx++dgyP1j2Jn
 S4NwW5eO2JTkGGttDQ9+wvg5INZDLWGWHUkWasQfuKSEy19Tu3QqAvlNcb45pG2XhYo5
 9RZVHoAfHTeDy4Fm+5+IVFDA5e6Z+R7las8y6t6IE2EXZGMz+NWFIPclRqaDZZnSjVZb
 579RDTKS0sFOpf2RUFtf60Cyq5uQUuYCUPAy1RlIXMv5bmQ60tpqA9Vr149Y4n5YQrDd
 YWCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cBJ4mk8tWYLUMjPIwRJW0iTCZ8TzYegwS1Rmxpud8ns=;
 b=EZTV20Oyt+Np7+9ERkH0sXMGToD02vvwU8AxGvtjPNYhOSw0oM0mAWQR8yqVa/AQSn
 QwgIX4Ieh/ygVpwZXn0yMIgZG03Haqjs5DJv0Gd09ynnEv22qOR1ibXVYnVlddBtfyqu
 zsRkbPtJMMfOXZsz71OMroageUMJkjRz9Y6iWADjaAteOU9qthiPPN+qIq4yUuCuyhUU
 wtw7lvJbTAc4WVWMj0nBz5egZGpguGhcq/SAJADWQnffCq9tFm/WdqWVSaEZY9FBmKx/
 +mD/jtfjg/jgveXlG8UL02JonQgSBGgBdvBBzxpELs2eizsnYaC+EOEToT+vdmzx+r5v
 JkEg==
X-Gm-Message-State: AOAM533FfWVZ60woSbire8ATt8aZVcwksQsSVQCiyPkOh5GXrbKYW5gs
 Rv4oY2pA6DUXh8HsukwM7FU=
X-Google-Smtp-Source: ABdhPJwhR3Rxo+499Fg5WOTkk0H6k+NnyfKQY5fnQs+6kyOvMH1K1ZTw9vhEl5ZylwjFkA+h6BGXDg==
X-Received: by 2002:a37:a211:: with SMTP id l17mr10673818qke.195.1616414780127; 
 Mon, 22 Mar 2021 05:06:20 -0700 (PDT)
Received: from localhost.localdomain ([143.244.44.200])
 by smtp.gmail.com with ESMTPSA id n140sm10677702qka.124.2021.03.22.05.06.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 05:06:19 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
 viresh.kumar@linaro.org, dsterba@suse.com, eric@anholt.net,
 rnayak@codeaurora.org, unixbhaskar@gmail.com, huawei@kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/dpu: Fix a typo
Date: Mon, 22 Mar 2021 17:36:01 +0530
Message-Id: <20210322120601.2086438-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.31.0
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
Cc: rdunlap@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


s/poiner/pointer/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index d6717d6672f7..a448eb039334 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -258,7 +258,7 @@ void dpu_kms_encoder_enable(struct drm_encoder *encoder);

 /**
  * dpu_kms_get_clk_rate() - get the clock rate
- * @dpu_kms:  poiner to dpu_kms structure
+ * @dpu_kms:  pointer to dpu_kms structure
  * @clock_name: clock name to get the rate
  *
  * Return: current clock rate
--
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
