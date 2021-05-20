Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FDE38AD55
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 14:03:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1FE26F409;
	Thu, 20 May 2021 12:03:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 679296F409
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 12:02:59 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id v12so17385396wrq.6
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 05:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=78IZFmK5jsA34hqJO0M2qv8hujM84El09YurAWZwzJM=;
 b=C3JKjuJQ/+v/Ste8TDqUSd4/bIawR7HpQPO4KJjFthaE/uBvkhh4qP6g2l5yuS0pwx
 iNnrjxChg/Yt3beNIYy+LBnkLUHs8jePy9TlojGGjsFsL6sPzdc4J9ynGCM/tuFlIKNt
 cs+xIFK5prHwgSpGNLUzj9B5hW40fM6R/psgmFycgziUAAExNQbKnRQR63SfqJIEB2Pn
 eGljaSNS9P2K/kuxjjU9yGQNRx6BO9BpNKXCtjCvNJFM9LBGGQI4eHizABCNlimVW2Ix
 hL028sHfiqtvLELAFZTHn6CowpRzuK/KmcqFE4aTjj0teNVZTlGDufkdnGo2jjusUFMn
 EQHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=78IZFmK5jsA34hqJO0M2qv8hujM84El09YurAWZwzJM=;
 b=o9T0r9rDBCTUwgP0n4rk/Xa1hSdibkfIwvp4/H/0pGIaCCo8gkha+w0cnvFAe8TNLT
 8ugTnbK2yT5Dj6xym9gdDy4r+AMS5laJJQhXSNtLFdjBfmgN0dcoUNHS4yd4sZ5iA2eX
 Q3HpUK9RyxtN474FQlxDe3S3kPDdDZ4kNHCOKeSLb6IlDzUZbgPtXub325Afc9f/rwRb
 r3SIbW1r4WgM9PqkZIRkFqGUzjY01H0oSw6/5mtA2PTKpVE8XL/y4z8xotXi+yy2kL5a
 jJRQbyTAPE0pbPsFxPyOqBvoy93rLRT/V+X5riEpyez0Nxxk6u10E6vjNzYgFaKpJGDo
 y0rA==
X-Gm-Message-State: AOAM53141hFOwQhqlhD/kNH1v/prqorWKIIJ197sPWaDluNqAgiUDvMa
 1pUBKGvjsSS+uu3QekLaxrzWxA==
X-Google-Smtp-Source: ABdhPJyjfJJwF+BNH0YP0v8lGpULEjGckiTSXpzTJVGakyu6jwlqugBIAGeCfvDjLTMGMM31/ZxzOw==
X-Received: by 2002:adf:ed46:: with SMTP id u6mr3884135wro.295.1621512178168; 
 Thu, 20 May 2021 05:02:58 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm2886332wrt.32.2021.05.20.05.02.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 05:02:57 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 06/38] drm/sti/sti_hdmi_tx3g4c28phy: Provide function names
 for kernel-doc headers
Date: Thu, 20 May 2021 13:02:16 +0100
Message-Id: <20210520120248.3464013-7-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520120248.3464013-1-lee.jones@linaro.org>
References: <20210520120248.3464013-1-lee.jones@linaro.org>
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

