Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D0736E442
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 06:29:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE56D6ED14;
	Thu, 29 Apr 2021 04:29:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47F396E0FB
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 04:28:45 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id s20so18230694plr.13
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 21:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gt4pb5bT5mW/MToENIuo4Jt8VqUlSnyGRgKvmw6yKp0=;
 b=m2YPwqx7aeh6V4lUo0oHObJCqs1T+6ImiIjbJPb/XrFOXsS88GT0/U1TDgdJ1tlgtf
 vjjBBMfm1Eh2YmwOe5/fcnlTizd+eytKYuLtVI0Gxm72V5zal5FgLmjsqqeYmBs89pTu
 fubvjuXh/iVeU7gxgntYYq/wNSGAnKMhvhb1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gt4pb5bT5mW/MToENIuo4Jt8VqUlSnyGRgKvmw6yKp0=;
 b=Ig71BdOwbSNfZeDoj7ZXtByXBYDsLhP+/bC+WkqnWn4BOIRgyblSPC/Gn85w2hG8jl
 v6dXb4aAmXbDab5MyvwKvf5bRdBACZsgBhhX1D4aaXMez0ULRQzuC/65IA2OLNbU1yBB
 vsfOo2Mvx3xT7U+TJ4NzVUbQPKCjDhlju0dWGOybh5xZnbEGFt1MOoNfNeLmN/SSQJPh
 wz+ublNNeoNZhBVGm+38iaHZHegMEG39tDhCm3rONwZNQKb1utL7nYt0ezjAADWt01Uz
 VYkmGvDcXdoGobUQbvE17SxyEDkUGh7j7tcAlxBgp0my7Ji8V0++kP+3oHojCe8qJBrI
 jAMg==
X-Gm-Message-State: AOAM5323QxitiJWSqeatbBkUro6ORTo77/RAk2GFjdOoAIBdf4NISV5S
 clIwXlFgeoTxpcr82P5nqGb5zBaigyPBww==
X-Google-Smtp-Source: ABdhPJx0CF0XSmcRjIoO/yWcAnjTe7hR6m9+xUw2Ts97CHJGvHusZESHQqWarI1X5miU9uUBrAavWQ==
X-Received: by 2002:a17:90a:dd45:: with SMTP id
 u5mr7845750pjv.15.1619670524616; 
 Wed, 28 Apr 2021 21:28:44 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:f701:2ca2:56ba:8e83])
 by smtp.gmail.com with ESMTPSA id w124sm1069390pfb.73.2021.04.28.21.28.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 21:28:44 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 3/3] arm64: dts: mt8183: Add panel rotation
Date: Thu, 29 Apr 2021 12:28:34 +0800
Message-Id: <20210429042834.1127456-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210429042834.1127456-1-hsinyi@chromium.org>
References: <20210429042834.1127456-1-hsinyi@chromium.org>
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
