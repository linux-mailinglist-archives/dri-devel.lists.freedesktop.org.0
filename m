Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1A244FB7B
	for <lists+dri-devel@lfdr.de>; Sun, 14 Nov 2021 21:07:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 928F96E077;
	Sun, 14 Nov 2021 20:07:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 065B989E32
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 20:07:45 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id k37so37691083lfv.3
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 12:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AkpRlmm9VStWG/9FSC9RiFG1Zeod4XIWPGAv7duUBTE=;
 b=PjQ4peGmad+WSgds8M0XV2NpLMbZmdfcTTKXkxWa2Rihcjk6oNINHI/9VGt8B+sYeo
 Wa4MwE4a7q95OhG+l9SbYtU7nq20TiinBgeDVSkDRw7Ai40WbP/YcX5hA1EmaoEPwsYU
 pOS1L5XxWSjDga9h/naONRKDbsNQc8kcFGESlcAAg+LLALEI1Dq1P60rCqVnh44dnkNw
 9RghuTdUsG1E+KwFMaxawAuhU4pDhS5B4uI9K1pdH1KZDO9F+8FFahYmwPox8a3SD+69
 k5ogDMOGo1JJTLFxupz6ZzrmrM7NIh8hYV1liuSPk1qY83wDSXXYTBCjLYXEf2ktbLQ6
 8pzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AkpRlmm9VStWG/9FSC9RiFG1Zeod4XIWPGAv7duUBTE=;
 b=AVu/zjQSDcAFHOoRHOWCpmK30aIl34h+ic2Kke8Nb1a0KTj13T8jcH4wu//2DoN4vk
 bNUnGlhF7l9lVGN7aVF79+4T3P+vtGCpH6KXXSSGIp1Z+myZDkq6FxFWn4GNFEjhe1/Z
 ew9f+HPqC5XyNqFiH0jAiI34bjxm+n2ou5TxmeVtx/AGKPyKj6vVqlUNbARNiBKtdrXx
 sddkrXoIIFf6bLSFso9p1+fe5ByQkLnLZYxYfd9wzw6bBVIlSta9q/2VQAW70XbQAcdU
 /I9uFs/kIYAj0TaVM4KzlW40mmadym2R/uGRZ3nJ03Pva8pAEYSsxUjqtstkqRsI4WEF
 wlrA==
X-Gm-Message-State: AOAM532bHpQfmA2FSofwnMGDC1+reYawbfDvQhLq8U3wEM6eIaWHYMPp
 RTWXsMcTu5QDtzOFiDbYN+j2ziKuICk=
X-Google-Smtp-Source: ABdhPJxRrlmzgYLBs1cyCcjph5vdi0HNwlsqJKW2fr1Y0Sz5Qj5qhssjE9F0Y5GxBliN2art+/jhUw==
X-Received: by 2002:a05:6512:a91:: with SMTP id
 m17mr20960941lfu.690.1636920463400; 
 Sun, 14 Nov 2021 12:07:43 -0800 (PST)
Received: from localhost.localdomain (46-138-46-211.dynamic.spd-mgts.ru.
 [46.138.46.211])
 by smtp.gmail.com with ESMTPSA id d30sm1204644lfv.58.2021.11.14.12.07.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Nov 2021 12:07:43 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Anton Bambura <jenneron@protonmail.com>
Subject: [PATCH v1 2/2] drm/panel: sharp: lq101r1sx01: Support LQ101R1SX03
Date: Sun, 14 Nov 2021 23:07:17 +0300
Message-Id: <20211114200717.28986-3-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211114200717.28986-1-digetx@gmail.com>
References: <20211114200717.28986-1-digetx@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Anton Bambura <jenneron@protonmail.com>

LQ101R1SX03 is compatible with LQ101R1SX01, add compatible to the driver.

Signed-off-by: Anton Bambura <jenneron@protonmail.com>
---
 drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c b/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
index f8cd2a42ed13..bbd1d889e069 100644
--- a/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
+++ b/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
@@ -304,6 +304,7 @@ static const struct drm_panel_funcs sharp_panel_funcs = {
 
 static const struct of_device_id sharp_of_match[] = {
 	{ .compatible = "sharp,lq101r1sx01", },
+	{ .compatible = "sharp,lq101r1sx03", },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sharp_of_match);
-- 
2.33.1

