Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B216E5EBAC7
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 08:35:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CA6C10E8A7;
	Tue, 27 Sep 2022 06:35:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0F1B10E8BE
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 06:35:30 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id d11so8230944pll.8
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 23:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quanta-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=SRYYQ3707grqaxVxUN3p9E6nOdleDAi4s45cvWAivxY=;
 b=L+4fX/BsaccZku8y8TMKmgsuB9wZmC428zVKBfeQ1cDazTSPIP+B4KLav9sC1OGJgx
 AoYkVU08Ihc9nSCfien0w6YM7IeevVdXJJg3DeiwH/r/E5vJym8myAi9kdt4tycChYMO
 FXf8W7roVySBaps9xfOcRzX30mLVe6r+tl5xGOspQ0C453SmIFbnDN5RAlpZ+asqnUx3
 yEntW7z6zHBLfuSC5Aq6kyJsSX5pj7a/p7LgpOOL2cH2nxkFB36N26qCpz+I5pjpClnz
 Mud1RWPZmTnTW9KTIeRZlXiXVfgTt1w7uh+B5zM9oND+nuhn2R5gRg1ZMf5m3jTaMjGQ
 BOcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=SRYYQ3707grqaxVxUN3p9E6nOdleDAi4s45cvWAivxY=;
 b=ey3NXMjfAc4lpmvd0NaMxUPoceH3abLR2z4u2a28aJjhnQfj9dLsPVsAIe7iugEFUX
 KoA+x29Q8sPDqIoS/kGPzZBkJ88WBYvsOvSVp1wVtfdapDTeq8bggvs5/evi1s8Ym47o
 VJ4BPPD4+4yMFEHUZrAkqi0yFt28qNGCdML8JEmNKfB1ON37M9Lke7Fod0hDJfmIrhmG
 uwO8RbkZjDvjdrV1enGb3jByz24XkLEgl+zJ+ifWMz6+bNIQOd68LeGaNbUlAH3xnJXJ
 /gOzrtQAQ/xOnx9qMrEpXMQpzJ2RQ6kIurMgKVM/A0LIES7/4EwH6Br1wwt9yVdknoaP
 EGSQ==
X-Gm-Message-State: ACrzQf08EIZZSBNDiXL957i05WMDkNgAhwle3e/zp/EX7xipSiQ2es33
 i5PoqLnDjQLSeOnHc8ObBIqlGw==
X-Google-Smtp-Source: AMsMyM7blyFe7Mx+4ipAFYRiiAEK9NkBdRNW5a8w7wiqjFY/2liM7kAMcwnAsqMB7ulDEC5GfGb5vQ==
X-Received: by 2002:a17:90b:4acf:b0:202:65e3:da5a with SMTP id
 mh15-20020a17090b4acf00b0020265e3da5amr2824997pjb.174.1664260530240; 
 Mon, 26 Sep 2022 23:35:30 -0700 (PDT)
Received: from sean-biuld-server.itotolink.net
 (1-34-200-211.hinet-ip.hinet.net. [1.34.200.211])
 by smtp.gmail.com with ESMTPSA id
 a8-20020a63e408000000b0042f62120c1bsm634714pgi.17.2022.09.26.23.35.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 23:35:29 -0700 (PDT)
From: Sean Hong <sean.hong@quanta.corp-partner.google.com>
To: dianders@chromium.org, thierry.reding@gmail.com, sam@ravnborg.org,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/panel-edp: Add BOE NT116WHM-N4C (HW: V8.1)
Date: Tue, 27 Sep 2022 14:35:24 +0800
Message-Id: <20220927063524.493591-1-sean.hong@quanta.corp-partner.google.com>
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
Cc: Sean Hong <sean.hong@quanta.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the BOE - NT116WHM-N4C (HW: V8.1) panel.

Signed-off-by: Sean Hong <sean.hong@quanta.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 102ab9f5d40a..03a4a49e4ecb 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1890,6 +1890,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x098d, &boe_nv110wtm_n61.delay, "NV110WTM-N61"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x09dd, &delay_200_500_e50, "NT116WHM-N21"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a5d, &delay_200_500_e50, "NV116WHM-N45"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0ac5, &delay_200_500_e50, "NV116WHM-N4C"),
 
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x114c, &innolux_n116bca_ea1.delay, "N116BCA-EA1"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1152, &delay_200_500_p2e80, "N116BCN-EA1"),
-- 
2.25.1

