Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E6A2F8365
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:13:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC85A6E46B;
	Fri, 15 Jan 2021 18:13:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19EF76E466
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:13:30 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id h17so8028401wmq.1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sDWfHFckN6NRo0EoYWwvHoK4Npcgdey+k/hT6ivHjRc=;
 b=SjYJ2xl8Kpk+haoC/WNAe19ka70TzQyHnukPq1XElB5bfIleTUP+UyDJS8Gh4FQj5Z
 Kl2nKN4tGIrvVbBS1KuO9xZxIrei4eyCFBrW4gl5Y0oDQr0EY0no4iJLSEtH6jmo9qo3
 LDjQcjt2A3sPpH5f5PMAgHzA68Hz1sCGX6dL9/S/J+1zUi6h6DsewtD6AiabgNcx7w7D
 7XMzT1titKw7oaDP9ZWGVFoddv0NNblbjqZXv6KKEXg2ZOrsSu1d8j9RLIz5Hon1OCHR
 /4Er5YRgwio31zKplqQDl3c9YYzA2n9JYh1VcNUDjKs5HO2nkEDlcJ+iXzcxXz2RqvFx
 ZAJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sDWfHFckN6NRo0EoYWwvHoK4Npcgdey+k/hT6ivHjRc=;
 b=aZBLCFzyZbxpgy4EaLff3k8JbLQehY3yb4LfG+dpFxTIKvy/SQJnYTLL4PAq+oHPUK
 tBg0zyqYbP8mWfnymhMTTPV2BFHhSSJT7yTlLL5FCbuRhUkKt8uX8gGs4s94U2n6B9T9
 pieFPNN+ly6yJpNpIQRrBJ8jI/URRDK2iUVZs/W37RejiM+/e6S0dICYCTQN/EeBpXsB
 ONoW0N9aKYO0U74Z925e2aR97oPI1ccVUxJGWuotnXzqh7quP2wlJjRJLs+OfT2Xfvgu
 whw3zOiyg7EOZfmLNpjezay2/aHbYmRFHN8hCjXZCbaMKNBWPF3k96lFPVwO41DxuBqh
 kPyA==
X-Gm-Message-State: AOAM530YdA/q4BpYu/BqvheRv3I6qCGqDe+iOigVvTUc/d2wbH0x+3Dv
 x438q4Rq44FoidlG6bsPfJAcMw==
X-Google-Smtp-Source: ABdhPJzUCTGJPA/AxjzKMvGf7/YaN9xsQPUWPThrY+PvTWZnODZjT1Fb00+0QiDkBK7HxjMNPb4d+A==
X-Received: by 2002:a7b:c385:: with SMTP id s5mr9872346wmj.170.1610734408578; 
 Fri, 15 Jan 2021 10:13:28 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id j2sm16123484wrh.78.2021.01.15.10.13.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:13:27 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 09/40] drm/vmwgfx/vmwgfx_ioctl: Provide missing '@' sign
 required by kernel-doc
Date: Fri, 15 Jan 2021 18:12:42 +0000
Message-Id: <20210115181313.3431493-10-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115181313.3431493-1-lee.jones@linaro.org>
References: <20210115181313.3431493-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, Roland Scheidegger <sroland@vmware.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 In file included from drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c:30:
 drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c:448: warning: Function parameter or member 'offset' not described in 'vmw_fops_read'

Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: Roland Scheidegger <sroland@vmware.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c
index 80af8772b8c24..b36032964b2fe 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c
@@ -437,7 +437,7 @@ __poll_t vmw_fops_poll(struct file *filp, struct poll_table_struct *wait)
  * @filp: See the linux fops read documentation.
  * @buffer: See the linux fops read documentation.
  * @count: See the linux fops read documentation.
- * offset: See the linux fops read documentation.
+ * @offset: See the linux fops read documentation.
  *
  * Wrapper around the drm_read function that makes sure the device is
  * processing the fifo if drm_read decides to wait.
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
