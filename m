Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8903E48400A
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 11:43:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C290910E5D9;
	Tue,  4 Jan 2022 10:43:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A962C10E578
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 10:43:46 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id p14so26823475plf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jan 2022 02:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KV3FR+u8voPfKvUHu8OPNcwabevk3hL+FYCEeJsfP24=;
 b=knvcSLOHYu3D4eMyIPx2jGUSLJawr2WFA+16HoIa8z3rZ9bFPVASBKF+BwRvqj1HjQ
 tUHyJCj84u+hUQK2N20Au6GNxscPKBH3HLdDgdX9eurQXSMzCug/xYtpussSvCkDs5Z+
 wrEN9Yzfpl+8JAjcBu5QRTC+4EDgXU6NdZ9zFGQ990pb0yuHrpejqQiXmOyYNipqrodW
 wq8OipjxV+5HIk3gq7HsbH6MjErblxbxOU/fEMiM63XfPMVobD1FXBtzfPNws7+kc1It
 XldvdVLBts0nc15CgC8vZVjs2JlpcCx5YT9/xiG6NH2QmDqFuZHdE+50V017hUxUEYLB
 xQtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KV3FR+u8voPfKvUHu8OPNcwabevk3hL+FYCEeJsfP24=;
 b=S4eOqWK7rMtg6KCZaFTsnhwy/4WwWSfN4TF4wHNFXTKneqHf15E+r6fRkm2IJ2H543
 gG1Q/Ys2JBDRSk+zF09ImwrmP3OvCXTa6iwzFaZ5AipNXKo8N2G+q6qGcqk+Amuh7Fu/
 VfRtXjQf2hQzTe7UI5PbkxAxd7T5L1oNjykGlPKnlcsgJW67iG7zRD2paxjjpXUh6nm3
 tk5pt4Cmzy2e/ItYj9ZjeJ2drGgHkEWz2jeAfArka0/m/wGuVDS/q+vHh+4HUONhd7pu
 ytL0xtpf7qx9+r3Szy8QCsfFF6WKPrJCnAtdsUI3SDJCXmvMVLqonc468XE1CRyFDKcb
 Q6Uw==
X-Gm-Message-State: AOAM530vng9U3gyBVXnUuQFF87WoxNVpPlJqkJ3E9VickpxLaBZFPrXG
 ILvnJ4qFsKrhcwOREgO/1AABrWz9HoQ=
X-Google-Smtp-Source: ABdhPJxPx6qaFfHg0PvrZShXRveCF4ts9UF4tF2JpCyXR3ZcY7bOvjCYsdZ8vNYHp2+Hage6hrV2kQ==
X-Received: by 2002:a17:902:d682:b0:148:c928:1fa1 with SMTP id
 v2-20020a170902d68200b00148c9281fa1mr50188631ply.155.1641293026354; 
 Tue, 04 Jan 2022 02:43:46 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id om3sm40795562pjb.49.2022.01.04.02.43.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 02:43:46 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drivers/video: remove redundant res variable
Date: Tue,  4 Jan 2022 10:43:36 +0000
Message-Id: <20220104104336.601146-1-chi.minghao@zte.com.cn>
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
Cc: CGEL ZTE <cgel.zte@gmail.com>, linux-fbdev@vger.kernel.org,
 Zeal Robot <zealci@zte.com.cn>, Minghao Chi <chi.minghao@zte.com.cn>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Minghao Chi <chi.minghao@zte.com.cn>

Return value from aty_ld_8() directly instead
of taking this in another redundant variable.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
Signed-off-by: CGEL ZTE <cgel.zte@gmail.com>
---
 drivers/video/fbdev/aty/mach64_ct.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/aty/mach64_ct.c b/drivers/video/fbdev/aty/mach64_ct.c
index 011b07e44e0d..e967536af166 100644
--- a/drivers/video/fbdev/aty/mach64_ct.c
+++ b/drivers/video/fbdev/aty/mach64_ct.c
@@ -22,13 +22,11 @@ static u32 aty_pll_to_var_ct(const struct fb_info *info, const union aty_pll *pl
 
 u8 aty_ld_pll_ct(int offset, const struct atyfb_par *par)
 {
-	u8 res;
 
 	/* write addr byte */
 	aty_st_8(CLOCK_CNTL_ADDR, (offset << 2) & PLL_ADDR, par);
 	/* read the register value */
-	res = aty_ld_8(CLOCK_CNTL_DATA, par);
-	return res;
+	return aty_ld_8(CLOCK_CNTL_DATA, par);
 }
 
 static void aty_st_pll_ct(int offset, u8 val, const struct atyfb_par *par)
-- 
2.25.1

