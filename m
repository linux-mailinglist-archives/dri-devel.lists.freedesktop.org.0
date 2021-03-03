Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9D932B849
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 14:45:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 940266E983;
	Wed,  3 Mar 2021 13:44:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27CDA6E97D
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 13:44:27 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id u16so5734876wrt.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Mar 2021 05:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iycuw02Ze2lHNSA405Xw+zB9o0y7L/MHkkRIkUAmng8=;
 b=thFldj+NR7/yJQFlx5CmFrSDIqztiJhVtzEIncot0oT9IuZefM8LS0OIhOXMeciq+1
 pt7Ymt7WJXTsvEKX/HUnsWKzPuFY48/YLBIW3LpFe+iOsB+uzaUF+EMcvtGogOomdHXM
 teioDoBTjwhsvvC5sObP3W4piv5q9tiMO4unVsGZV652CmmLfL+V0m3cSBas82wBMgaA
 w6NzkVxZ/IP+NegS6rg0+alFY9+A1Nfbdnj6glWZOyQ45oMiB/EfaNWGiSAUOoMwHENy
 08FpX3SzMS2AdhNEaofx7ToAK0fWTQNl/Y3S1B/zlB2WyGJGfUuB7Yj14FiKCN40Tbfj
 VaZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iycuw02Ze2lHNSA405Xw+zB9o0y7L/MHkkRIkUAmng8=;
 b=Q1Fue1iAbPNDr3kWxr1lki2T3zo6x/2NM3Z/O3hWIXS9Mr3SRXPOEXwRQq80HK8KpX
 TGl1UgQyViKFdo1lbJ5dT6sRs5jxEoRYatZfQ+o4p+4AuF76AntfE3r3tAyGwaSoRCkB
 FwhrOPkn7xwlBCUBdbbb2Nxk7391fdRL7YhPJPNlVw2BALdCiH110AtG/8lCvgv5NWQN
 mbw9B9c9V/C4jFmu93fIBgS+BFn/MHIwTfRCb+Gf9lyUCzFgGd84yGGRWAlpp9mtkS7E
 /4w+QMZusdqzO+NwYuqydXG2skOYObUfwlSVuvKq9mFiHj/J4NaHInXpCrq6iMN93TCD
 HYdw==
X-Gm-Message-State: AOAM531AELrkCeIHW5mMeQDawX4gmLNOXE55EbFG49JWn8XXf1G4mwko
 SczBDritR688ePn+ruHaLC7TFg==
X-Google-Smtp-Source: ABdhPJxahbBIE2LRClKS78/6HsclGgIdKNslueE6t2fTii73se5u0IQl5HPtgslGGaA+a/JlY6OszQ==
X-Received: by 2002:adf:fec5:: with SMTP id q5mr16916292wrs.43.1614779065836; 
 Wed, 03 Mar 2021 05:44:25 -0800 (PST)
Received: from dell.default ([91.110.221.155])
 by smtp.gmail.com with ESMTPSA id w18sm6109524wrr.7.2021.03.03.05.44.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 05:44:25 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 49/53] drm/vmwgfx/vmwgfx_blit: Add description for
 'vmw_bo_cpu_blit's 'diff' param
Date: Wed,  3 Mar 2021 13:43:15 +0000
Message-Id: <20210303134319.3160762-50-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210303134319.3160762-1-lee.jones@linaro.org>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
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

 drivers/gpu/drm/vmwgfx/vmwgfx_blit.c:452: warning: Function parameter or member 'diff' not described in 'vmw_bo_cpu_blit'

Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: Roland Scheidegger <sroland@vmware.com>
Cc: Zack Rusin <zackr@vmware.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Zack Rusin <zackr@vmware.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20210115181601.3432599-8-lee.jones@linaro.org
---
 drivers/gpu/drm/vmwgfx/vmwgfx_blit.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c b/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
index 9f2779ddcf083..118db24eb756c 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
@@ -431,6 +431,7 @@ static int vmw_bo_cpu_blit_line(struct vmw_bo_blit_line_data *d,
  * @src_stride: Source stride in bytes.
  * @w: Width of blit.
  * @h: Height of blit.
+ * @diff: The struct vmw_diff_cpy used to track the modified bounding box.
  * return: Zero on success. Negative error value on failure. Will print out
  * kernel warnings on caller bugs.
  *
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
