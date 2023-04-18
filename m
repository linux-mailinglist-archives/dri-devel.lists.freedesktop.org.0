Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 288E26E8B2C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 09:15:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06C8B10EBB5;
	Thu, 20 Apr 2023 07:15:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 590A510E17C
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 15:28:54 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id u3so22244728ejj.12
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 08:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681831731; x=1684423731;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aIoNtmY4gd7WkYav+TGdJG5oP1pM633zL+Nu7+MvjMw=;
 b=TbyHnodLh52/ba5IRflxQmDo71jl2MkQ5cv8AvfiFcOQfvmXjXi9jvJ8Mdw5x5Cw18
 cjVh5x5lqgEBnf3N+bPfW/16utDUYqfDnDGkfCym0QFnV4FhwkL9jejOtCO4znkqlivp
 HQHi/tTQUT1oO6PpRRdgQ4BxNyEktWYY6HMqmJ+NCgEFAkY3rVVPr+Znw/z2WB4flOyy
 dQj7zxul/YyGMTFuVWNVq6ZUpXOJKTzLsZedpoS/CkJ02GH5mofDZZdWsic8SsmGafZa
 KWffrVNyP6PzGw/M3ibvoEIHtU1oAY/FYYtNe9aUTcj779Pszb3+PsyPQngnKv8Hi28H
 y8ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681831731; x=1684423731;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aIoNtmY4gd7WkYav+TGdJG5oP1pM633zL+Nu7+MvjMw=;
 b=AIGIer2i9ShItPVXLBidLTBsC8Kw8lcXZLyCyjj77nKyZkrdNFU5G29cHuehzmprvS
 ukTkIC6B+pdNcLUrh7/74ZnsktDbnLFnFtre3DVy5klN5pG9Y3yIQyxIt4ntYSPdXIzf
 F/4tX6b/ljJp6i6GHwtPN7UsEDqXt8S4enX7Z5QQ1loZAMb6RpaLiQDJhu7ILEnD8Uik
 2Wkyvkal2C3jjd0QRg19OnxPxetmtJJx5pi6o2QLVfhJZIsSTModI+tqQblR9IEekhqX
 dgZTQjtqg0QiCOp6MU7Mtp1laZhlulzmhGrfSUpItpIb1ihDGKA7Dy7SZLKhcJpRbvgM
 OEhg==
X-Gm-Message-State: AAQBX9cH9XWepz2AVQTYAbDrFoz+wguiuFpsS28aSXE/2/xQUBcTydU+
 yUs2qQ9j7JT+scujYshf4L/FQkcWc1nRrQ==
X-Google-Smtp-Source: AKy350Z24luAK/VX280kB+msE7vSr8CafbbMQYmKvFdTzldoJmnfMeB6q/Ck79lxv0AaN1gb6x6GFg==
X-Received: by 2002:a17:906:e4f:b0:94e:fa12:f26d with SMTP id
 q15-20020a1709060e4f00b0094efa12f26dmr10891048eji.26.1681831731349; 
 Tue, 18 Apr 2023 08:28:51 -0700 (PDT)
Received: from localhost.localdomain ([154.72.160.133])
 by smtp.gmail.com with ESMTPSA id
 fe6-20020a1709072a4600b0094f02ebedf5sm5820417ejc.64.2023.04.18.08.28.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 08:28:50 -0700 (PDT)
From: Brandon Cheo Fusi <fusibrandon13@gmail.com>
To: wens@csie.org
Subject: [PATCH] drm/panel: simple: Add panel info for Banana Pi 7"
 S070WV20-CT16 panel
Date: Tue, 18 Apr 2023 16:28:23 +0100
Message-Id: <20230418152823.22402-1-fusibrandon13@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 20 Apr 2023 07:12:56 +0000
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
Cc: mark.rutland@arm.com, airlied@linux.ie,
 Brandon Cheo Fusi <fusibrandon13@gmail.com>, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, thierry.reding@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Though there isn't a datasheet for this panel to support this claim, tests
with the Banana Pi M2M board show that the data enable signal is active high.
Setting this explicitly is required when modelling the panel as a drm_bridge
connected to a 'panel-simple' device, which is what it is.

Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 065f378bb..f3d114f3d 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1209,6 +1209,9 @@ static const struct panel_desc bananapi_s070wv20_ct16 = {
 		.width = 154,
 		.height = 86,
 	},
+	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
+	.connector_type = DRM_MODE_CONNECTOR_DPI,
 };
 
 static const struct drm_display_mode boe_hv070wsa_mode = {
-- 
2.30.2

