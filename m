Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F494DD62B
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 09:29:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 581DF10E755;
	Fri, 18 Mar 2022 08:29:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CA3710E755
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 08:29:26 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id s11so8825202pfu.13
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 01:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qYSHS1HMX6eMTWBoPQekbY/LnrHx+hVCf+4KGrQDYmc=;
 b=IFSSe8csUXjGGDosRHCGn3fO+VYoniE9x8J42lOZEudFDsNsV98ZesN6bj9YZHlSGx
 rzUUSNDgAqKWsCISlWsWoXZJ4+na9/zRejmLQtAxJeL750XBykhjuPYp5PtgjzXaioRP
 W6K8uKY7G1XRI6cPC4FJKf4UJipGp1a8UxVkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qYSHS1HMX6eMTWBoPQekbY/LnrHx+hVCf+4KGrQDYmc=;
 b=mVFa2CoXLXRZh8blKaOoItF97AA6XzQMT4EYxskOiaGwQ7T+DLy6lwEhH2z4ltlFwh
 fABimsiG05SblwYhzmmK1xtTQU0g7lWT4i0KD7zfdCuo4EMHqw0uGN6DeL9Yj0zAI4Jz
 3ZCqzWHIofTHa+RwklhU45WIqRRTmZrrl4XA4cPeqcdGGgCvWgDyaeEqli3Wngrtugm+
 PAMFTv+TpjBWYZpVBFwxsrMETrGnJPHtEPsAm04sSsEY6PWHnHGv6cUOp+Ebsix84Cmf
 FmXgbDLc2QME/94nqk6Zi0miT266REHXuami8C/+fs03J30fc0ydPs812H3ywQgd5NK0
 CqAg==
X-Gm-Message-State: AOAM533kKAmFtka4f5Hy4g2+jhuIGKub/PvQf9GR1naEQUyGvBRVy6Lr
 Y2nf0vMiv0yQNqwPI4dBfQWEDUBxftXeIA==
X-Google-Smtp-Source: ABdhPJzDLKDOl+pmopyHHP4KLg/0fWOsTqeY58M7BYm1nfrAKzxakmXqooCP00hA6BSnGX9OcZh/qg==
X-Received: by 2002:aa7:8385:0:b0:4f6:ef47:e943 with SMTP id
 u5-20020aa78385000000b004f6ef47e943mr9052216pfm.38.1647592165505; 
 Fri, 18 Mar 2022 01:29:25 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:435a:ce78:7223:1e88])
 by smtp.gmail.com with ESMTPSA id
 q2-20020a056a00084200b004f761a7287dsm9404044pfk.131.2022.03.18.01.29.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 01:29:25 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v9 4/4] arm64: dts: mt8183: Add panel rotation
Date: Fri, 18 Mar 2022 15:48:25 +0800
Message-Id: <20220318074825.3359978-5-hsinyi@chromium.org>
X-Mailer: git-send-email 2.35.1.894.gb6a874cedc-goog
In-Reply-To: <20220318074825.3359978-1-hsinyi@chromium.org>
References: <20220318074825.3359978-1-hsinyi@chromium.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>,
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
index 0f9480f91261..c7c6be106e2e 100644
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
2.35.1.894.gb6a874cedc-goog

