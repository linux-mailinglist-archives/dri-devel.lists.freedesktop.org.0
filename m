Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 398FA5144FC
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 11:01:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1C0610FB87;
	Fri, 29 Apr 2022 09:01:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30CAD10FB87
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 09:01:42 +0000 (UTC)
Received: by mail-qv1-xf2c.google.com with SMTP id 1so4918793qvs.8
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 02:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qN8jOmqbyrS5RXGoZd3xn3V7UmWY48sLU7iq7QyAz14=;
 b=FiDOg6lxP6rQx1sCZnORopQcjFJvUQJ9ahgsWSTXHs5VvmGFrNMxMAJHVrRHylpvyp
 U1rm6EUxZEFK/A827xLVx/WghsxsivlyTvk49D7omiROu2VgJVK3HY8DC0thMl2FGslc
 VBfK0Jr3Q9YNj826nS555ffrXLSBJ7VkR73x6nkP6jwzomqHHRHTd+2jHxnak1IDtkio
 hQ16jmkxIIHvnJj122czUM0I3vS02Ynvy9pKSbU8RPLV1KVi2EBKqFNuTjCHp9J0dKjs
 0DIJxahxq20epdWhY/5G9WknNy45BvrKqQ+kOkKo8IhTgL/Z1GamYuddLHBZFdVJ4uaP
 KqRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qN8jOmqbyrS5RXGoZd3xn3V7UmWY48sLU7iq7QyAz14=;
 b=g5Ko1YpfqVVxAU4zYDo6Kmnpj1I4CMlX8kOKFmGhOBuNOmNTIQNUP9mRfKc7wc7NO3
 5iIYTto3oG/UqSGlGKX4WxuSpIytX7HK2qT8K/wfrj1XwWtgLVWa5kVVgYTv/+DoISwi
 PUCNx6wm2HnUBrgj8vX4fTjzg3w/dItO3vCals0TjZZdQW0utKJjxyXj3VCRnaui2Qz2
 ioYrkxyxBHSEXTlIARsqgW1jfeO+UmSzNeL6CvOwZShhCA5UUDE02XreRLWARbldW34j
 GXSERDTggUwSVw6sutR/yQ+Q8qJBWv01xkW75xTediTX2mI063gVm23EuUbi7CsQCfE6
 xI8A==
X-Gm-Message-State: AOAM530BBghfiED/wJbw+cjwuB37lt26mNa8s8gxDbSZKyhb7rT9a0Z2
 9a7GkXOaRUu7iS2oo2CGQMU=
X-Google-Smtp-Source: ABdhPJxyExyJJzS7R0bfMElF3R3wnu4fZpxOr6n6j5Muv937Ppjb7aYPXlgnhcPrUze8NFAi4gyLtQ==
X-Received: by 2002:a05:6214:e8c:b0:456:5066:1922 with SMTP id
 hf12-20020a0562140e8c00b0045650661922mr9158678qvb.106.1651222901385; 
 Fri, 29 Apr 2022 02:01:41 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 o14-20020a05622a138e00b002f335c3dbf2sm1275086qtk.37.2022.04.29.02.01.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 02:01:40 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: tomba@kernel.org
Subject: [PATCH] omapdss: HDMI: simplify the return expression of
 hdmi_init_pll_data()
Date: Fri, 29 Apr 2022 09:01:35 +0000
Message-Id: <20220429090135.3852817-1-chi.minghao@zte.com.cn>
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
Cc: airlied@linux.ie, Zeal Robot <zealci@zte.com.cn>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Minghao Chi <chi.minghao@zte.com.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Minghao Chi <chi.minghao@zte.com.cn>

Simplify the return expression.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 drivers/gpu/drm/omapdrm/dss/hdmi_pll.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi_pll.c b/drivers/gpu/drm/omapdrm/dss/hdmi_pll.c
index eea719243eaf..10c6b3e492d3 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi_pll.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi_pll.c
@@ -131,7 +131,6 @@ static int hdmi_init_pll_data(struct dss_device *dss,
 {
 	struct dss_pll *pll = &hpll->pll;
 	struct clk *clk;
-	int r;
 
 	clk = devm_clk_get(&pdev->dev, "sys_clk");
 	if (IS_ERR(clk)) {
@@ -151,11 +150,7 @@ static int hdmi_init_pll_data(struct dss_device *dss,
 
 	pll->ops = &hdmi_pll_ops;
 
-	r = dss_pll_register(dss, pll);
-	if (r)
-		return r;
-
-	return 0;
+	return dss_pll_register(dss, pll);
 }
 
 int hdmi_pll_init(struct dss_device *dss, struct platform_device *pdev,
-- 
2.25.1


