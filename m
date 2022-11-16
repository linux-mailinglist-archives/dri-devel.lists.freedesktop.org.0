Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1968B62D40F
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 08:29:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCF2110E551;
	Thu, 17 Nov 2022 07:29:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4202510E4B3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 14:35:47 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id cl5so30228101wrb.9
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 06:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Z8czfhSUs3mWHeIfFdLH5/G0a3Uk3RSmYGgvVFUZjxw=;
 b=WGzXTljvZSs2p0IjXnKub2fXvs+by26DaMNPHNseJK45SXzjN2mpHV2nhd5fKcEzUd
 FxuC7mCyzPTDLpcs9+NvZw/9f3yKf5aMMPfu8xZ0EooP3sadwjoKmJQIu4kflQL6CSHm
 3mmk+vdddaNM8D7JGuOalFOsbuiiNyj8JYnY6upvijkpjzOqH6D3L5M+I87kCYmwj6Qr
 PDHcRDHRBVD9EhBevRNBQXWcMgSIyBCz23/yjiEgPggheZs0hqVzZAVRSOxz++e8HEEe
 su8WM+SnpCoQWwhJnDVoUmTLsNLqMz2pBd+0Ixw/wVgwV1Dj+Mcpr39k4ZwAjv2ULZR0
 fVuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z8czfhSUs3mWHeIfFdLH5/G0a3Uk3RSmYGgvVFUZjxw=;
 b=6tYaxdDvc9LU1FYJ/l9M+wF3XYUcjo35LIEHtctgdgvqldjXOOGNYw/URgJN594VxA
 2viWfgd/fv/fSSS9RN6g5kfnT+zVFpZD57doxfSoR1LVpeK6LnULoUOUGLYPDj8ur1RM
 hZTVlSzOrEGSCFRY0xM4B9C1kWl2n8D4u0YUqsiEcRWqRquDT0aytZXPvVeF69KLhfeF
 tDnQ/n3nHCx+8wHqj0ABLJUc9/9qe6sOaU4Y9UKmxWZKtBaaWKIwbl3D3EZSKksR2qWs
 ctEf+2+KsRatrVmCmtsASwKV47QOxf+zIRIHdRWuplCeJlKbsldIjuE1Oy7bIB8YvFVY
 uUyg==
X-Gm-Message-State: ANoB5pmZFzi+elFn8XgBXwpIMGQR/8QlKlkjhnuFEyWahFeOeTN/YYMl
 up2Zt8oSWRMLLx7VyeDX6GGDG+cyr4ge42l/
X-Google-Smtp-Source: AA0mqf5598TxLDqy4tIWUpYjpY0aL3kt7HPLQgal2MvvcizUGXiBe1ztwx8Cofhygfbkrm1iEOsnCQ==
X-Received: by 2002:a5d:658b:0:b0:22e:3397:2e96 with SMTP id
 q11-20020a5d658b000000b0022e33972e96mr13714180wru.535.1668609345451; 
 Wed, 16 Nov 2022 06:35:45 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:5da:d460:bf85:51f8:ca78:20c2])
 by smtp.googlemail.com with ESMTPSA id
 x11-20020a5d54cb000000b002415dd45320sm15152354wrv.112.2022.11.16.06.35.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Nov 2022 06:35:44 -0800 (PST)
From: Guillaume BRUN <the.cheaterman@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Subject: [PATCH] drm: bridge: dw_hdmi: fix preference of RGB modes over YUV420
Date: Wed, 16 Nov 2022 15:35:23 +0100
Message-Id: <20221116143523.2126-1-the.cheaterman@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 17 Nov 2022 07:29:39 +0000
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
Cc: Guillaume BRUN <the.cheaterman@gmail.com>,
 Christian Hewitt <christianshewitt@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cheap monitors sometimes advertise YUV modes they don't really have
(HDMI specification mandates YUV support so even monitors without actual
support will often wrongfully advertise it) which results in YUV matches
and user forum complaints of a red tint to light colour display areas in
common desktop environments.

Moving the default RGB fall-back before YUV selection results in RGB
mode matching in most cases, reducing complaints.

Fixes: 6c3c719936da ("drm/bridge: synopsys: dw-hdmi: add bus format negociation")
Signed-off-by: Guillaume BRUN <the.cheaterman@gmail.com>
Tested-by: Christian Hewitt <christianshewitt@gmail.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 40d8ca37f5bc..aa51c61a78c7 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2720,6 +2720,9 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
 	 * if supported. In any case the default RGB888 format is added
 	 */
 
+	/* Default 8bit RGB fallback */
+	output_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
+
 	if (max_bpc >= 16 && info->bpc == 16) {
 		if (info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
 			output_fmts[i++] = MEDIA_BUS_FMT_YUV16_1X48;
@@ -2753,9 +2756,6 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
 	if (info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
 		output_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
 
-	/* Default 8bit RGB fallback */
-	output_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
-
 	*num_output_fmts = i;
 
 	return output_fmts;
-- 
2.37.3

