Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAF5398CD8
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 16:33:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F6716ECB4;
	Wed,  2 Jun 2021 14:33:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF586ECB8
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 14:33:15 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id g204so1439688wmf.5
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 07:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=78IZFmK5jsA34hqJO0M2qv8hujM84El09YurAWZwzJM=;
 b=WdrTLrzWk4itXaz1izoOEsBVPQAc38HR9oCFgSF8CasRhUQ/mV0xqaBwWh8qm+DRLp
 dz6e89ggMSBX7tN4p+HNf2RPU+dvF7+tOnexD/duWK5cfdkujKueSpzur/26pWFfBz8J
 DwHgj3wlHU1Dlv4UEZNY+JX8wOuC/aNbTpF2CDhflG7/sk+dOb4mA+9DvRigY5lB5e/I
 4osgQWBD0vsPfZwszEDhpluGVTC7Ah/FJ5sYB3baQEOMrmWPZoFjqCQYn3EBm65N1DzB
 n8234K6KzftioCYHjWpQVd12GDkF2aeZ/YrD/a2cm2GwwDniCbnkC1n7wvj1qjMWQ1Ra
 H7zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=78IZFmK5jsA34hqJO0M2qv8hujM84El09YurAWZwzJM=;
 b=nvywBqlkMNAz/swev/o1aKiYvfCYaGP88aOhefuUlRxN+HN64xg87pRP7Y4yqdjKRa
 U8L9j5A1KZkgLBkfATYv7ibXps1Wv/o3Pr/NPnhAqTPsEZ/2k821bi5AGpww81Fcrtu/
 XvJd2Mkbr2qnnieyeNRmz6prPJ+aMTD4ViRMmi1B0g3KJutV69HF820Vk3h/5u2RuVTK
 GPMiXXbPYrdW4b/Ba2rcGv3fumvLGhGBLe1BE66+46jmdPfxVEIilwLqo+bsKdOfYE9M
 se8wGbeiv6YySMPXNWsqliTr4uzhUq93Do4bYGWhWqPZfKFxqXb4iVcA2EEWdlLrmOHK
 4khQ==
X-Gm-Message-State: AOAM5336AJnqD/3+PusdmKZcGI8VUwpimlQLUdDk95vi2wI5nVN3HMfk
 Fj3i19CxZchE7XhRUA0pDNcotQ==
X-Google-Smtp-Source: ABdhPJyqpHwUHtws34ryd9DXmm/uUl27GMgYVuaG8fO9cG+srbCDO/rS5IW6FmI/z4rqAod291xNNg==
X-Received: by 2002:a05:600c:2301:: with SMTP id
 1mr5568518wmo.180.1622644394679; 
 Wed, 02 Jun 2021 07:33:14 -0700 (PDT)
Received: from dell.default ([91.110.221.214])
 by smtp.gmail.com with ESMTPSA id o11sm132315wrq.93.2021.06.02.07.33.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 07:33:14 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [RESEND 05/26] drm/sti/sti_hdmi_tx3g4c28phy: Provide function names
 for kernel-doc headers
Date: Wed,  2 Jun 2021 15:32:39 +0100
Message-Id: <20210602143300.2330146-6-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602143300.2330146-1-lee.jones@linaro.org>
References: <20210602143300.2330146-1-lee.jones@linaro.org>
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
Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vincent Abriou <vincent.abriou@st.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/sti/sti_hdmi_tx3g4c28phy.c:77: warning: expecting prototype for Start hdmi phy macro cell tx3g4c28(). Prototype was for sti_hdmi_tx3g4c28phy_start() instead
 drivers/gpu/drm/sti/sti_hdmi_tx3g4c28phy.c:187: warning: expecting prototype for Stop hdmi phy macro cell tx3g4c28(). Prototype was for sti_hdmi_tx3g4c28phy_stop() instead

Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Vincent Abriou <vincent.abriou@st.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/sti/sti_hdmi_tx3g4c28phy.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_hdmi_tx3g4c28phy.c b/drivers/gpu/drm/sti/sti_hdmi_tx3g4c28phy.c
index d5f94dca0d323..d25ecd4f4b673 100644
--- a/drivers/gpu/drm/sti/sti_hdmi_tx3g4c28phy.c
+++ b/drivers/gpu/drm/sti/sti_hdmi_tx3g4c28phy.c
@@ -67,7 +67,7 @@ static struct hdmi_phy_config hdmiphy_config[NB_HDMI_PHY_CONFIG] = {
 };
 
 /**
- * Start hdmi phy macro cell tx3g4c28
+ * sti_hdmi_tx3g4c28phy_start - Start hdmi phy macro cell tx3g4c28
  *
  * @hdmi: pointer on the hdmi internal structure
  *
@@ -179,7 +179,7 @@ static bool sti_hdmi_tx3g4c28phy_start(struct sti_hdmi *hdmi)
 }
 
 /**
- * Stop hdmi phy macro cell tx3g4c28
+ * sti_hdmi_tx3g4c28phy_stop - Stop hdmi phy macro cell tx3g4c28
  *
  * @hdmi: pointer on the hdmi internal structure
  */
-- 
2.31.1

