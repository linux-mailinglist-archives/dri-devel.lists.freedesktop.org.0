Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 084E26934AF
	for <lists+dri-devel@lfdr.de>; Sun, 12 Feb 2023 00:13:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 707FE10E3B7;
	Sat, 11 Feb 2023 23:13:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBCD710E3B7
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 23:13:04 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id jg8so23959500ejc.6
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 15:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4eQWc7eI/NIpRQi7Qva/GfZvDk9Cu8nShwJ7yygm8aI=;
 b=dFNTRKfQS7S4LfhHi2LOq8JQfSpDvsIIocP8Eu4vawaExKuVexO53U690q0JP3i0r3
 dvOloP0oTEJw+14qN+pH3c5a0lMCEC2Oxy/cDTeo/kmrafMzglSmAljkaVhZIyN7nY2P
 OiOoNfiyQzeCeW6FEuGOE0i+iZb2A9inJnsymLfKjbvOJaHbeeGjgduNbUcZt/6fGLaI
 olMxQ5gO1xX/BadzroA2GlUKMmgBE1GBrRe++jdH1Gb8D+ZBiP07rzL3tgD3XclYoLlh
 6el3j+So+7uGTJDK/1Mn1VfJDJgVxsJRiS0UH9We7A2/H56O+T0dETc0Hocqv06z1GCi
 E4aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4eQWc7eI/NIpRQi7Qva/GfZvDk9Cu8nShwJ7yygm8aI=;
 b=jNUZVnyx0MBEDots7R46fTO3zxCMHevr0+RyLMPEanZVN5kVWSu00g1AKe3IItARdr
 TZgvG548lpo+/mPfxOdcPWLlHSl5Mxq4DZKkQooLaSRq6EOkoZdoNf1WWyw0/b//L6zO
 yNmL4EbRS6FSCL5TNZCXrUTqIZrUYjFavnk7LZ97bmDb63hYKAOgofCJvOSsDd5QslJ9
 ERQA/Gv5czn9tl5F6PwurH69j8kxjSGIJuf6pWM7yBDnDcHOL6bn0+l2NKIsBwTAiILK
 rjXzI6bw60exjtzarT4lbU1uqs6AN9iNmUfJy5tSc6nKG7ynolMSy42jt03WiSKn/KHW
 whSw==
X-Gm-Message-State: AO0yUKW0yhiltp0BamXqvTXyw7e6i8OoHYq8QMmP/EiQJzp9m21/52Iu
 pFzX6BAIFvX8ud7Zmjz/oMQszA==
X-Google-Smtp-Source: AK7set9TVMrXvkpNzaYEiWhyw+iqutQJRZY9qc0yOzjWuwqsQ8eDlhKLXhRXfsZnBm/jciCSLxkE5Q==
X-Received: by 2002:a17:906:2581:b0:887:6c23:193f with SMTP id
 m1-20020a170906258100b008876c23193fmr19049761ejb.44.1676157183440; 
 Sat, 11 Feb 2023 15:13:03 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 k20-20020a1709061c1400b00871390a3b74sm4517149ejg.177.2023.02.11.15.13.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Feb 2023 15:13:02 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 01/50] drm/msm/dpu: set DPU_MDP_PERIPH_0_REMOVED for
 sc8280xp
Date: Sun, 12 Feb 2023 01:12:10 +0200
Message-Id: <20230211231259.1308718-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The SC8280XP also has a black hole at the top of MDP_TOP region. Set
corresponding bit to disable access to that region.

Fixes: 4a352c2fc15a ("drm/msm/dpu: Introduce SC8280XP")
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index cf053e8f081e..84d974458e0d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -696,7 +696,7 @@ static const struct dpu_mdp_cfg sc8280xp_mdp[] = {
 	{
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0x0, .len = 0x494,
-	.features = 0,
+	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
 	.highest_bank_bit = 2,
 	.ubwc_swizzle = 6,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0},
-- 
2.39.1

