Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8244E1F982C
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 15:19:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 846A26E314;
	Mon, 15 Jun 2020 13:19:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78B4E6E314
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 13:19:42 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id k22so12474769qtm.6
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 06:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Y3ar0NlCgHyRvUgHFVw4GwwVEYkMu69FrpNlEgYZaig=;
 b=S/S2vKqaaiMkDzviRm/cegQn34GwLrWUJzwiHO0SG32LaLpY/rNXsqw3qrBJvWE8nz
 vJ3yXdKMkbxGFOnXF0fJTJ3ng+YqmDPBZMVP+BTsB+Zp/2fLBUFulmvBSeR2p95aVSJr
 lPiRIXtpA9L/nyr0fVE/shzaF0Tde6OSPgP2QV+vLGJR4bXoVXxPwRD4vx4aVhzvBaPi
 bQML8PfmRN+AulAeCD43dyushoKncliEd7WaZG8x2g8gtsLZ5/sGnY5G27qsr8JuQVxc
 uuj8QamlfZWw4WJO2jpbfL8RfbaR6EuvKjN3+WhhRHVkm2Nua00pgXNs3bQXjEt5AS2D
 LgCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Y3ar0NlCgHyRvUgHFVw4GwwVEYkMu69FrpNlEgYZaig=;
 b=XNH6nFMpCyfBm7e/ctucoSlYALL59ecZgNVP0p+av2e10uUTN99aP2ixd0lgfqz6Tf
 Xuoa79H8Tetpy+8Pa5Ztg907vTviv/2aKksf8oCVTcYVEZ0D07q8ix2CA58xJQZpOJE7
 JKBzc6qrquC7P8rh8H+M2EOygzMiBwt5iHhmyXi5ao1SzPH4+ozEGDat78rGd70oINVn
 2wuX7eGwB/u6KcdDo9DetjyFb7fyGsJWKlZ/mC2bueKbz1IzVjsbb+4U306W2iBcNnL8
 FrUbjRv34ml84tDxSoMfSZ93crAfgj/MS6UB+abEIdquQr4Yu+E+7YGTEmCjd56EUxeV
 WgKw==
X-Gm-Message-State: AOAM531bokRXuZwP3gE7xNUYAP67ghobC6ovNbNjwg49w9x6KXV0ZTX3
 9MJt0bqIT8dVOPX74G59hUTKIWOZ
X-Google-Smtp-Source: ABdhPJyWlvPaYg5fM0exV17DKKfaRTgNRErTfbIaQDpsECFpyLk/C8vgs/087jTcN9C+sRmBlCN7vw==
X-Received: by 2002:ac8:7c2:: with SMTP id m2mr15444087qth.282.1592227180849; 
 Mon, 15 Jun 2020 06:19:40 -0700 (PDT)
Received: from aford-OptiPlex-7050.logicpd.com ([174.46.170.158])
 by smtp.gmail.com with ESMTPSA id q24sm11520968qkj.103.2020.06.15.06.19.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2020 06:19:40 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/panel-simple: fix connector type for LogicPD Type28
 Display
Date: Mon, 15 Jun 2020 08:19:34 -0500
Message-Id: <20200615131934.12440-1-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: David Airlie <airlied@linux.ie>, Adam Ford <aford173@gmail.com>,
 aford@beaconembedded.com, stable@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The LogicPD Type28 display used by several Logic PD products has not
worked since v5.5.

The connector type for the LogicPD Type 28 display is missing and
drm_panel_bridge_add() requires connector type to be set.

Signed-off-by: Adam Ford <aford173@gmail.com>
CC: stable@vger.kernel.org #v5.5+

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index b6ecd1552132..334e9de5b2c8 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2495,6 +2495,7 @@ static const struct panel_desc logicpd_type_28 = {
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
 	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE |
 		     DRM_BUS_FLAG_SYNC_DRIVE_NEGEDGE,
+	.connector_type = DRM_MODE_CONNECTOR_DPI,
 };
 
 static const struct panel_desc mitsubishi_aa070mc01 = {
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
