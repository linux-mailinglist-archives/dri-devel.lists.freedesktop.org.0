Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 266CB1CC162
	for <lists+dri-devel@lfdr.de>; Sat,  9 May 2020 14:39:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 507A46E347;
	Sat,  9 May 2020 12:39:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 218956E347
 for <dri-devel@lists.freedesktop.org>; Sat,  9 May 2020 12:39:17 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id fu13so5487693pjb.5
 for <dri-devel@lists.freedesktop.org>; Sat, 09 May 2020 05:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=/yCbEu8wYmRlZF9ujoXFy28Dup9bbLQcU0p7hOZmCyc=;
 b=MhpdoIXtW5dYBFtM5R0tE1kmldXbirdOFixtpedkfZT9ws7cUxUGweiVtFZ1OQB2sZ
 0PTElqhI9WCoDctLBp0tn2Fz881IUaH44fClqBDmlqWNBffc8pkgn84KCyvZuZz2rToe
 NMTTdEHyxU+nttny3JdCfbav52xtMT+X7ObdwnrZSLBerJpPCQ3z/sy0eofBfXccPPFr
 NizNB22hHFe5WT6H2UI9qKFr7h1LqZG/7WkeGCH8x5DEhgCZMqPOb3OEpux026ruUztS
 cJBDNR7GhlA9QEWk7CAklQ7avwtj1LVGJpXDlcfVwiVNxJDXu0VKWfgimwBg+ZC3Bg/R
 PWyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=/yCbEu8wYmRlZF9ujoXFy28Dup9bbLQcU0p7hOZmCyc=;
 b=nnzTRw9Q6Uq7ED2oTJuXuHFeKO13f2Bjk1XWPKVcdjhFQIQrBFWRFKd+5zrLKQLECE
 Lh+aPDgsxx7jmds9GjpBWJrstHlqaCfz8Q5gIc4qP6PmzKHGvt+kuL1M2j/GRYehhGPO
 UiG2LQwzSVwAFjvIysRAJ6CmBfQsi9tBQjLhXIiF823jMncQl/d4DUpYdDHlqzqw9vTF
 lIBZCUYUn4B8Hylk0G9CnUqnDd41qRYk8GDgYlZKuZmkXcvihJB8eSYR7jhaqdbqkSWw
 opmoT+dDKr4M+Qtgr4Yblt4Fe7zL+z0SxC/Nk1Tqbq1hKi/XKe04VMNCJggIlizHjNsr
 KX7Q==
X-Gm-Message-State: AGi0PuZcQj3ma14L+nWivn2AY2Z9kq5OGey/nIJOft4EDfLJiLqDMy9y
 0/DekrDOeZyGakCAu7H6sjqC9Q==
X-Google-Smtp-Source: APiQypJsAkimGuvIxqYs4ksJw8I2XT/AxqkEqRuDmBp0tzBzvnjcLkCi2t5U3jYlgAFUd5xK041frw==
X-Received: by 2002:a17:90a:d711:: with SMTP id
 y17mr11350092pju.11.1589027956790; 
 Sat, 09 May 2020 05:39:16 -0700 (PDT)
Received: from localhost.localdomain ([80.251.214.228])
 by smtp.gmail.com with ESMTPSA id o6sm4447828pfp.172.2020.05.09.05.39.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 May 2020 05:39:16 -0700 (PDT)
From: Shawn Guo <shawn.guo@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH 2/2] drm/msm/a4xx: add a405_registers for a405 device
Date: Sat,  9 May 2020 20:38:46 +0800
Message-Id: <20200509123846.27932-3-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200509123846.27932-1-shawn.guo@linaro.org>
References: <20200509123846.27932-1-shawn.guo@linaro.org>
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
Cc: Konrad Dybcio <konradybcio@gmail.com>, Brian Masney <masneyb@onstation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A405 device has a different set of registers than a4xx_registers.  It
has no VMIDMT or XPU registers, and VBIF registers are different.  Let's
add a405_registers for a405 device.

As adreno_is_a405() works only after adreno_gpu_init() gets called, the
assignments get moved down after adreno_gpu_init().

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c | 53 +++++++++++++++++++++++++--
 1 file changed, 50 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
index 70de59751188..9e244982974e 100644
--- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
@@ -445,6 +445,52 @@ static const unsigned int a4xx_registers[] = {
 	~0 /* sentinel */
 };
 
+static const unsigned int a405_registers[] = {
+	/* RBBM */
+	0x0000, 0x0002, 0x0004, 0x0021, 0x0023, 0x0024, 0x0026, 0x0026,
+	0x0028, 0x002B, 0x002E, 0x0034, 0x0037, 0x0044, 0x0047, 0x0066,
+	0x0068, 0x0095, 0x009C, 0x0170, 0x0174, 0x01AF,
+	/* CP */
+	0x0200, 0x0233, 0x0240, 0x0250, 0x04C0, 0x04DD, 0x0500, 0x050B,
+	0x0578, 0x058F,
+	/* VSC */
+	0x0C00, 0x0C03, 0x0C08, 0x0C41, 0x0C50, 0x0C51,
+	/* GRAS */
+	0x0C80, 0x0C81, 0x0C88, 0x0C8F,
+	/* RB */
+	0x0CC0, 0x0CC0, 0x0CC4, 0x0CD2,
+	/* PC */
+	0x0D00, 0x0D0C, 0x0D10, 0x0D17, 0x0D20, 0x0D23,
+	/* VFD */
+	0x0E40, 0x0E4A,
+	/* VPC */
+	0x0E60, 0x0E61, 0x0E63, 0x0E68,
+	/* UCHE */
+	0x0E80, 0x0E84, 0x0E88, 0x0E95,
+	/* GRAS CTX 0 */
+	0x2000, 0x2004, 0x2008, 0x2067, 0x2070, 0x2078, 0x207B, 0x216E,
+	/* PC CTX 0 */
+	0x21C0, 0x21C6, 0x21D0, 0x21D0, 0x21D9, 0x21D9, 0x21E5, 0x21E7,
+	/* VFD CTX 0 */
+	0x2200, 0x2204, 0x2208, 0x22A9,
+	/* GRAS CTX 1 */
+	0x2400, 0x2404, 0x2408, 0x2467, 0x2470, 0x2478, 0x247B, 0x256E,
+	/* PC CTX 1 */
+	0x25C0, 0x25C6, 0x25D0, 0x25D0, 0x25D9, 0x25D9, 0x25E5, 0x25E7,
+	/* VFD CTX 1 */
+	0x2600, 0x2604, 0x2608, 0x26A9,
+	/* VBIF version 0x20050000*/
+	0x3000, 0x3007, 0x302C, 0x302C, 0x3030, 0x3030, 0x3034, 0x3036,
+	0x3038, 0x3038, 0x303C, 0x303D, 0x3040, 0x3040, 0x3049, 0x3049,
+	0x3058, 0x3058, 0x305B, 0x3061, 0x3064, 0x3068, 0x306C, 0x306D,
+	0x3080, 0x3088, 0x308B, 0x308C, 0x3090, 0x3094, 0x3098, 0x3098,
+	0x309C, 0x309C, 0x30C0, 0x30C0, 0x30C8, 0x30C8, 0x30D0, 0x30D0,
+	0x30D8, 0x30D8, 0x30E0, 0x30E0, 0x3100, 0x3100, 0x3108, 0x3108,
+	0x3110, 0x3110, 0x3118, 0x3118, 0x3120, 0x3120, 0x3124, 0x3125,
+	0x3129, 0x3129, 0x340C, 0x340C, 0x3410, 0x3410,
+	~0 /* sentinel */
+};
+
 static struct msm_gpu_state *a4xx_gpu_state_get(struct msm_gpu *gpu)
 {
 	struct msm_gpu_state *state = kzalloc(sizeof(*state), GFP_KERNEL);
@@ -568,13 +614,14 @@ struct msm_gpu *a4xx_gpu_init(struct drm_device *dev)
 	gpu->perfcntrs = NULL;
 	gpu->num_perfcntrs = 0;
 
-	adreno_gpu->registers = a4xx_registers;
-	adreno_gpu->reg_offsets = a4xx_register_offsets;
-
 	ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1);
 	if (ret)
 		goto fail;
 
+	adreno_gpu->registers = adreno_is_a405(adreno_gpu) ? a405_registers :
+							     a4xx_registers;
+	adreno_gpu->reg_offsets = a4xx_register_offsets;
+
 	/* if needed, allocate gmem: */
 	if (adreno_is_a4xx(adreno_gpu)) {
 		ret = adreno_gpu_ocmem_init(dev->dev, adreno_gpu,
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
