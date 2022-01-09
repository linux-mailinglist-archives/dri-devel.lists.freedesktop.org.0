Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB02C489349
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 09:27:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6517B12A8E0;
	Mon, 10 Jan 2022 08:27:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82B9910FF44
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Jan 2022 22:37:22 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id k18so23334464wrg.11
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Jan 2022 14:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gAsgOQMc3UKaM9UezU0vbWaZoPnffHLnW6ZeF8Qj0QI=;
 b=o+1lAT46noVYrgjZW9HZPc4qtWWikPTfj7o3lrQey5wipz6hDagam9IyTzyQlrIuDf
 C3BLmI4U+rXVZnmH8cuGyo/fZcLaPKWtzc+V5MI3Rcb/+LT6OaowZHljFj96uBXarKIL
 YKWJEHyyk2W4x6lk9ifx+CRWtoiV3oXqknRpjxKNjacAPANhA2XV+hQs9ZBWDnv8RStH
 8So2Sw8zJc0AmNx2nSJlnsDrqon/AedkMcLG6IDjfbph6Qc1ra1+8QBwTNvjhva/NgTu
 agAjj/Vxc3iOMCgURtm8kAjfGbozceWZM5OdYGC9cPaltCp+J+wCuYMy9xPsq7QB6Agd
 djoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gAsgOQMc3UKaM9UezU0vbWaZoPnffHLnW6ZeF8Qj0QI=;
 b=xMDwbVqw+JkOL6qTQnSId78j1+h/536/h2GeMuf1hjc/OjF8x7/K/tXZoKENLbNEZn
 PrWdrbg5ThB70udih4pbKNhUCcy1o5U9Aq6uWlxUjVR4w2rpQ26BOxNgJmYz/pEYHYD7
 zSPAHlGkR7A1pgI61AqWwmjdyuflmIEBaoCUR/7uk4HpEj13ZqH8FO/vdEB1nXlzw8Xk
 fRVBgO4XULB0DqEQMghWzoHy9osr/uS8BKr17B0g++R4p6jPCxmORCLEqpD+6NXUC4RK
 +1IpS7vKH5pRABtUDc20aVmn5JGP7bxf/B0ntW2b1QPGyQWQN8l7ghfMJjmGHlA25bE6
 qUyw==
X-Gm-Message-State: AOAM5303ImuYpVy92EmOe1mXI4EoKKWuS64Hgia+9GY7PbVbvqoX5sra
 xqI00geRQHUnhkuaxt8KRy8=
X-Google-Smtp-Source: ABdhPJyH5i6RVFey13kTaLeghj8KZIguTmG4qmxVgzJ9wwoBuJgCycBO7xSTg+/0yiCjBMUkLWOyrg==
X-Received: by 2002:a5d:4450:: with SMTP id x16mr61237707wrr.95.1641767841045; 
 Sun, 09 Jan 2022 14:37:21 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194])
 by smtp.gmail.com with ESMTPSA id g6sm5266102wri.67.2022.01.09.14.37.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 14:37:20 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Paul Mackerras <paulus@samba.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] fbdev: aty128fb: make some arrays static const
Date: Sun,  9 Jan 2022 22:37:19 +0000
Message-Id: <20220109223719.56043-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 10 Jan 2022 08:27:29 +0000
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Don't populate some read-only arrays on the stack but instead
make them static const. Also makes the object code a little smaller.
Re-format one of the declarations. Add spaces between commas and make
PostDivSet unsigned int to fixup checkpatch warnings.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/video/fbdev/aty/aty128fb.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/aty/aty128fb.c b/drivers/video/fbdev/aty/aty128fb.c
index e6a48689c294..882e3cdb750d 100644
--- a/drivers/video/fbdev/aty/aty128fb.c
+++ b/drivers/video/fbdev/aty/aty128fb.c
@@ -952,7 +952,7 @@ static void aty128_timings(struct aty128fb_par *par)
 	u32 x_mpll_ref_fb_div;
 	u32 xclk_cntl;
 	u32 Nx, M;
-	unsigned PostDivSet[] = { 0, 1, 2, 4, 8, 3, 6, 12 };
+	static const unsigned int PostDivSet[] = { 0, 1, 2, 4, 8, 3, 6, 12 };
 #endif
 
 	if (!par->constants.ref_clk)
@@ -1321,8 +1321,10 @@ static void aty128_set_pll(struct aty128_pll *pll,
 {
 	u32 div3;
 
-	unsigned char post_conv[] =	/* register values for post dividers */
-        { 2, 0, 1, 4, 2, 2, 6, 2, 3, 2, 2, 2, 7 };
+	/* register values for post dividers */
+	static const unsigned char post_conv[] = {
+		2, 0, 1, 4, 2, 2, 6, 2, 3, 2, 2, 2, 7
+	};
 
 	/* select PPLL_DIV_3 */
 	aty_st_le32(CLOCK_CNTL_INDEX, aty_ld_le32(CLOCK_CNTL_INDEX) | (3 << 8));
@@ -1360,7 +1362,7 @@ static int aty128_var_to_pll(u32 period_in_ps, struct aty128_pll *pll,
 			     const struct aty128fb_par *par)
 {
 	const struct aty128_constants c = par->constants;
-	unsigned char post_dividers[] = {1,2,4,8,3,6,12};
+	static const unsigned char post_dividers[] = { 1, 2, 4, 8, 3, 6, 12 };
 	u32 output_freq;
 	u32 vclk;        /* in .01 MHz */
 	int i = 0;
-- 
2.32.0

