Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0634127DB
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 23:20:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33FF66E876;
	Mon, 20 Sep 2021 21:20:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EF436E872;
 Mon, 20 Sep 2021 21:20:21 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id b15so54773552lfe.7;
 Mon, 20 Sep 2021 14:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=b1EtS8SFEilKGxAqVcNeCV6TdhHIw4BRQAXI7jUyN0E=;
 b=F7GvyO3PHMHAjafzsYHavQ0Fkq/aaIx9zKV7wt6gdd+ee4E0AxQAHKYI9u8Wlbxqpf
 qyCzCtkEMgp9CSaIux4BBfHlPI1QHwu1HigeztwFwhlr5O56Rt5VdFccVVkBk/C9TCh9
 Y8VCmCHHssd+ifeW4Xt2c3vVQtaITI/xVArhVSgJ4pUf7Ql90A5pnTsQZmiNVJc2o+qY
 TWswccDgC49VPhxTs0/n4W7cTcnHiyZhIpgwdPFe6HVqCsV/s3gb8Wkhl3rh6qUZgV5Q
 PJCrsejAqOH1D2tUwDTzMqrLZ0Cg+Y1wnYFypOccpV86u4PwH3iiEOcmG/6xf18tQO5l
 ZP2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=b1EtS8SFEilKGxAqVcNeCV6TdhHIw4BRQAXI7jUyN0E=;
 b=P3toKq57EmDHTNbv0WIBjoih3uP9Dn7DpPlUE/BBWihTzYeXQxemwTB/NYZ9i7sFak
 wl+QdXhhdFFHjetZEGUF7YSmuBDMYTgAFlMtZS72Ht0Z0SzilKty3lnCz3BnNKCVcAvT
 afjjwpe2nrHFd1CBoeURCcxBgPjzFsGY116h3ymcUf5MCM27pJbV3+epf86Z8qSY6UVd
 YrW2VZpzpolIifIZqnHkrfQHHVGc70uLv32KI57ArnFUivtxNOBB5Dfmiyk31Y3IEsOG
 rsZsE78y8X2xMRw63Z/paxMqw2+zSjnNEKePpgd43i6l7btUwSY0YM5jS4IXoNg+kyRS
 qMSA==
X-Gm-Message-State: AOAM5321IZPbuPCv/ubEn8X24K/eOqaoWc+ERJYESsK7XSMFYiXsr0Ed
 /AFTs18RReFYXrwCJzh2GzM=
X-Google-Smtp-Source: ABdhPJy1GY2SFpUgi0kmJ0T1bvcQNuO0PgWm2azxtOwrqDJmsBQxu3l9OcwXJtY4BVXyBDp4Z28d4A==
X-Received: by 2002:a05:6512:3c92:: with SMTP id
 h18mr19866364lfv.656.1632172819899; 
 Mon, 20 Sep 2021 14:20:19 -0700 (PDT)
Received: from localhost.localdomain (h-98-128-228-193.NA.cust.bahnhof.se.
 [98.128.228.193])
 by smtp.gmail.com with ESMTPSA id z5sm1887615ljz.23.2021.09.20.14.20.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 14:20:19 -0700 (PDT)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH] drm: msm: hdmi: Constify static structs
Date: Mon, 20 Sep 2021 23:20:14 +0200
Message-Id: <20210920212014.40520-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.33.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The only usage of hdmi_8996_pll_ops is to assign its address to the ops
field in the clk_init_data struct, and the only usage of pll_init is to
assign its address to the init field in the clk_hw struct, both which
are pointers to const. Make them const to allow the compiler to put them
in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
index a8f3b2cbfdc5..99c7853353fd 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
@@ -682,7 +682,7 @@ static int hdmi_8996_pll_is_enabled(struct clk_hw *hw)
 	return pll_locked;
 }
 
-static struct clk_ops hdmi_8996_pll_ops = {
+static const struct clk_ops hdmi_8996_pll_ops = {
 	.set_rate = hdmi_8996_pll_set_clk_rate,
 	.round_rate = hdmi_8996_pll_round_rate,
 	.recalc_rate = hdmi_8996_pll_recalc_rate,
@@ -695,7 +695,7 @@ static const char * const hdmi_pll_parents[] = {
 	"xo",
 };
 
-static struct clk_init_data pll_init = {
+static const struct clk_init_data pll_init = {
 	.name = "hdmipll",
 	.ops = &hdmi_8996_pll_ops,
 	.parent_names = hdmi_pll_parents,
-- 
2.33.0

