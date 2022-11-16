Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 410F362D41E
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 08:31:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECDF610E55B;
	Thu, 17 Nov 2022 07:30:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA23A10E16D
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 13:44:35 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id y16so29976224wrt.12
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 05:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Z8czfhSUs3mWHeIfFdLH5/G0a3Uk3RSmYGgvVFUZjxw=;
 b=NT+BUGGtGZAE2pjUnqSGkFkx3B1JCAolXNU5i9AiCCH7MdU4HJuegoVnVsC45K8Iow
 jzJ7a8el4ZGSDJ6zEC9Z/GE3NEKoZvkhcIXqAon3nxxO47/i0Y/ELCUOUX7GkxB94T2I
 SZcO9pXD6CAGQKO7LeaJ21mYHK6PnybDztnrrEAYG/4oEPk268L6V2HJ40V9/2cupmT/
 DDknWLgdezM7NSFros3VfLOKEKYVXpzEfx+V34ZRARZs7EBxkVCwAWORLorCfNzaYRwl
 f6b7K1Kzm+WZNZoM96e7VIMNs6xtYjc9YbRKrRU8A/Y8I7s1NmOPmfXAzC03wBPejwdH
 2euA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z8czfhSUs3mWHeIfFdLH5/G0a3Uk3RSmYGgvVFUZjxw=;
 b=LSe3memdkUyNAGwJVsDlIlBh/yp6YZAhPbfajjyqG7jnPeUvEiJ9f9MrmceJIbnvCd
 YEL8PJAr2iBJy2NyongoAxky3SQMYv5bfLa05HTO87huFwBISNTxG6zrKr5d7TxG/Qj4
 bwKBOpsBoOLo0vuhtQ1/fbbWG59Fd5xOS/7aBQcwTJJUbMS3Vc1PynQ3QQBlXeFLoxgr
 tZ6GjP1u/sFNgJJmUGIyDHEoQse4WmhDncYBsWnlNaxm1VoAau44Z1coU/KatDhUu99e
 W/9mhn4kll/bHHDuupd+PCEoSqeZ/AkJnaEjS/DGpui17YncCxxKD/Q5dQ06PU4gO6V1
 sngA==
X-Gm-Message-State: ANoB5pkF1x4CMdKXrh4auQbffokndRA5WSF0/JO3U6pCrVg168Jesb87
 6rod0HBuU5u9b1Qelx4RgA4=
X-Google-Smtp-Source: AA0mqf67ZMlz+LUVMxCXN1/IrpPbOUHhtbCF/kaOO3d28Z3gsn7J2mkZlI9xuSJe+siQptMk1PxrHA==
X-Received: by 2002:a5d:6f06:0:b0:236:5726:f1b with SMTP id
 ay6-20020a5d6f06000000b0023657260f1bmr13685093wrb.231.1668606274179; 
 Wed, 16 Nov 2022 05:44:34 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:5da:d460:bf85:51f8:ca78:20c2])
 by smtp.googlemail.com with ESMTPSA id
 g18-20020a05600c4ed200b003cf6e1df4a8sm2594584wmq.15.2022.11.16.05.44.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Nov 2022 05:44:33 -0800 (PST)
From: Guillaume BRUN <the.cheaterman@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <robert.foss@linaro.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	"dri-devel@lists.freedesktop.org"@freedesktop.org,
	"linux-kernel@vger.kernel.org"@freedesktop.org,
	"linux-amlogic@lists.infradead.org"@freedesktop.org
Subject: [PATCH] drm: bridge: dw_hdmi: fix preference of RGB modes over YUV420
Date: Wed, 16 Nov 2022 14:44:19 +0100
Message-Id: <20221116134419.16581-1-the.cheaterman@gmail.com>
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

