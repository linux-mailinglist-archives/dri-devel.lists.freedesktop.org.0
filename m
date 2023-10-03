Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A907B6E9A
	for <lists+dri-devel@lfdr.de>; Tue,  3 Oct 2023 18:34:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE04810E305;
	Tue,  3 Oct 2023 16:34:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A73897D4
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Oct 2023 16:34:03 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-6c496719a9aso570934a34.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Oct 2023 09:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696350842; x=1696955642; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OOhsxi8PjymwwLh84f6DRmuTn2wewUc5+RB2fJ2TRcU=;
 b=KPUzOvrIdimec4MhPw+Hom6pKmZGsGP4l6KTwto73ZfJrfZgWaCMWrWiqHCVqa1SbV
 uN8mTLyDjpNpiWMOpDsGbZ0lBO02+S+GslgkBOfYHYqHd5Wk6hOqNFxLowxBLmolHWqY
 NijVNERG0QOzZ3OQ/IBuoc0RBuiRDX5WZH3Gjg8wSFTKHJzVyAitBm4I2NV5zC5HUNbj
 jY5kR217lwHzGt8XKn4AMTzZmaZu86mjptqcrjM/GKcRidvDPakFZkboVQf/F51gvdSq
 3eBYT8UJfyXcT5jhVPJh9v3iQTbyw2Ygcxq9v0Ldoy7TRg3B0+MRrCQACJUNS9CU11yT
 q9rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696350842; x=1696955642;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OOhsxi8PjymwwLh84f6DRmuTn2wewUc5+RB2fJ2TRcU=;
 b=XrxTqfqCPUfNvz9WTmzuqnhU0w7NS+Z0FCurQbVXk9rmdBM1G2OxRIziIdxhE17D1e
 JtoCCDr9uADHmfszZvsdVlusEbPaKzdtrF5sgM3HywGHGA5H7V97On2wg6iMKTTC/uPf
 +VjvbpvtHvxn3q90WKa0c++YDVrlncuCObIZcjmBGoz6+tkHQoKUffErqHY/k4KVFF1E
 +5kWfhSvPtQE3wdJprLm3cVUtvEvm5glSZNfN7oKibr3J+Sq2x++Ea+Co1XzDZm/Kfjo
 n/oyqL9NPpFuJoy/835vQLQGU9LIfAdyQMh1T7lHMf447P/26OYjF7YmLEs0Rg1zqM1A
 uxzw==
X-Gm-Message-State: AOJu0YwFhnUp6hDokiNn1NWymygNA6umCVXneRHmphI/IfcbjCwvlvwr
 cDYfDZXHKLLv9qzOGuoF8UA=
X-Google-Smtp-Source: AGHT+IGHNXqHa6jkCe9KMpnHnliPmuqTDgmCLUyx/lAKaiY0iO/4u6SqhOLzt0FQ6WLR191Bt6Txnw==
X-Received: by 2002:a9d:6c0f:0:b0:6ba:864e:c5de with SMTP id
 f15-20020a9d6c0f000000b006ba864ec5demr1787223otq.8.1696350842548; 
 Tue, 03 Oct 2023 09:34:02 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 k6-20020a056830150600b006b74bea76c0sm198567otp.47.2023.10.03.09.34.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Oct 2023 09:34:02 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: devicetree@vger.kernel.org
Subject: [PATCH V4 2/2] drm/panel: nv3051d: Add Support for Anbernic 351V
Date: Tue,  3 Oct 2023 11:33:55 -0500
Message-Id: <20231003163355.143704-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231003163355.143704-1-macroalpha82@gmail.com>
References: <20231003163355.143704-1-macroalpha82@gmail.com>
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org,
 Chris Morgan <macromorgan@hotmail.com>, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the Anbernic 351V. Just like the 353 series the
underlying vendor is unknown/unmarked (at least not visible in a
non-destructive manner). The panel had slightly different init
sequences and timings in the BSP kernel, but works fine with the
same ones used in the existing driver. The panel will not work without
the inclusion of the MIPI_DSI_CLOCK_NON_CONTINUOUS flag, and this flag
prevents the 353 series from working correctly, so a new compatible
string is added.

Tested colors and timings using modetest and all seem to work identical
to the 353 otherwise.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/gpu/drm/panel/panel-newvision-nv3051d.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3051d.c b/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
index ad98dd9322b4..79de6c886292 100644
--- a/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
+++ b/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
@@ -388,6 +388,13 @@ static int panel_nv3051d_probe(struct mipi_dsi_device *dsi)
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
 			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET;
 
+	/*
+	 * The panel in the RG351V is identical to the 353P, except it
+	 * requires MIPI_DSI_CLOCK_NON_CONTINUOUS to operate correctly.
+	 */
+	if (of_device_is_compatible(dev->of_node, "anbernic,rg351v-panel"))
+		dsi->mode_flags |= MIPI_DSI_CLOCK_NON_CONTINUOUS;
+
 	drm_panel_init(&ctx->panel, &dsi->dev, &panel_nv3051d_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
 
-- 
2.34.1

