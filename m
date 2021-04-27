Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9EB36BE9C
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 06:50:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D0F56E8F4;
	Tue, 27 Apr 2021 04:50:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 821526E8F4
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 04:49:58 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 f11-20020a17090a638bb02901524d3a3d48so6443227pjj.3
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 21:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gt4pb5bT5mW/MToENIuo4Jt8VqUlSnyGRgKvmw6yKp0=;
 b=c+K89QY/gVhAeVZ0+WRtE2V6947IE8xTms8pbQvd+uhFOHJ2x/QLZl0aO54BBy9N6x
 PKAshJvy/RwX8BXEYR/ej2DI9gs6jXQHgNoUnvesfJ/1BNnYbIKLNyWO1Sy/lViJxzBo
 TkXU0r6xkpSpA841HlW63vUTSlXIbr7Kf5iLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gt4pb5bT5mW/MToENIuo4Jt8VqUlSnyGRgKvmw6yKp0=;
 b=pN2l6rwD7g8hb0CB3I5tr3Rldt8uXGrJeIenzkRgomkN+2PJhyQpO+YbQN3bVXc9jz
 bXL9cicSkWU1UyDQ4nps8pQnbAswxntH+HP68nG/lQ3mxnXpRAXy4Ama+RCJvazWmh5j
 hB9D2Q4nCfowzVQjiIYEv3niAIXssHHcCFYpYzynRLaBzMCUPQLayFL95pztIkOSFU2U
 1ReF/TcoX3mrC5s8xpT1odUP2arCM11OBPhdAQu3ZwIylxI6Uio9TEETh4xwfC6yESCU
 kj/H+Ya3BYXyJpR/XN80a/UQljJrM9mgn7pYZNZ0VtEM7DnmAF5xcZBddHXiPBDah1La
 BllQ==
X-Gm-Message-State: AOAM533y9MumXj0zo+T921wvfhUsXGR5JslBbPZr6q1gJ9p1Q19I4jsK
 n+PR104xL2uxF/xMPUu7sIt4bI6cUsbiiQ==
X-Google-Smtp-Source: ABdhPJy1BUt6+R21LCxa4D+U5Ie0p/vfRjiqUmnUX6m/JmeuU/QU2wgLbY7MTc98UD0cppxqB/jq0A==
X-Received: by 2002:a17:90a:b78f:: with SMTP id
 m15mr15823564pjr.131.1619498998028; 
 Mon, 26 Apr 2021 21:49:58 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:3984:c4f5:8612:6b3e])
 by smtp.gmail.com with ESMTPSA id c125sm1151517pfa.74.2021.04.26.21.49.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 21:49:57 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 3/3] arm64: dts: mt8183: Add panel rotation
Date: Tue, 27 Apr 2021 12:49:48 +0800
Message-Id: <20210427044948.12596-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210427044948.12596-1-hsinyi@chromium.org>
References: <20210427044948.12596-1-hsinyi@chromium.org>
MIME-Version: 1.0
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
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

krane, kakadu, and kodama boards have a default panel rotation.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index ff56bcfa3370..793cc9501337 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -263,6 +263,7 @@ panel: panel@0 {
 		avee-supply = <&ppvarp_lcd>;
 		pp1800-supply = <&pp1800_lcd>;
 		backlight = <&backlight_lcd0>;
+		rotation = <270>;
 		port {
 			panel_in: endpoint {
 				remote-endpoint = <&dsi_out>;
-- 
2.31.1.498.g6c1eba8ee3d-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
