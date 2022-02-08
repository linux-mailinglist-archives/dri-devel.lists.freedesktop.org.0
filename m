Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC92C4AD3BC
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 09:42:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8465C10E5A7;
	Tue,  8 Feb 2022 08:42:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 231A010E5A7
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 08:42:47 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id r19so1936342pfh.6
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 00:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RKltf19DtHiRc15a3iaZ/NnDb+6ppKujiVxWZQto3YU=;
 b=O2UDOpBeBJRbX3+DaQG7mIxxaEO05L1HTD48WquGaDuYWsSttm9JTTNF7a+lc8KdMj
 tJRuDchff9o48V7UXFNQVgoxZ/rNJPLVl8KQxtPWFS7zVK0sOis64KFrKb3J8stVpjkN
 Pk7y7Sj69FXDSqgG4hJ/qiPJrJRpnz6L6YEME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RKltf19DtHiRc15a3iaZ/NnDb+6ppKujiVxWZQto3YU=;
 b=C9jDdvdto7G66OJ4pYojl/U2hH+At85SWeYFBTfA+QcacC5RTDTJTNaPTVnWbn+HGU
 bG/Of5EcByKjIi4HfUS3h4A8LRaKbxKLbsE4oWExhvyTj57f51HrntDCAkKIecoC0TpA
 Elh4x7duDxjwjwMjrh9+Lv9FLUNADffpllRWYtXPAan/8Mv/WCuzaTIqOzk2n8FYS7eK
 ni6eDRuPCgcZYSFDUiNz1/5zLrmNxTxH40FFc7Ml4pABlDb+ApCQPsP8VBtHdBJ7eJ6q
 Uoo4uq4tPuR+2EBn8JztYVP9h/FQLqgtMSwZUVPd/v8V5el3lMY8q8gJ8M3JVK1B4ej8
 hh9w==
X-Gm-Message-State: AOAM531zGitMfvMtiukv/vOlWzEyIftSTCIXZoOJNG/cxOIDiomYkZti
 t57JNDgs1jCXB5PMOGUx/oGOWPgGGR3kXQ==
X-Google-Smtp-Source: ABdhPJxJuhyNGgn/8M1tkfbfnImy5ANlW87FCMT9C5ygmikEd8cwYFifi2WHJ+zYaY+iMKeTEIBo9Q==
X-Received: by 2002:a63:2ad6:: with SMTP id q205mr2651010pgq.46.1644309766435; 
 Tue, 08 Feb 2022 00:42:46 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:7d9a:166e:9d34:ff4f])
 by smtp.gmail.com with ESMTPSA id m14sm15362390pfc.170.2022.02.08.00.42.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 00:42:46 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v8 3/3] arm64: dts: mt8183: Add panel rotation
Date: Tue,  8 Feb 2022 16:42:34 +0800
Message-Id: <20220208084234.1684930-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
In-Reply-To: <20220208084234.1684930-1-hsinyi@chromium.org>
References: <20220208084234.1684930-1-hsinyi@chromium.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

krane, kakadu, and kodama boards have a default panel rotation.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index b42d81d26d7211..d29d4378170971 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -276,6 +276,7 @@ panel: panel@0 {
 		avee-supply = <&ppvarp_lcd>;
 		pp1800-supply = <&pp1800_lcd>;
 		backlight = <&backlight_lcd0>;
+		rotation = <270>;
 		port {
 			panel_in: endpoint {
 				remote-endpoint = <&dsi_out>;
-- 
2.35.0.263.gb82422642f-goog

