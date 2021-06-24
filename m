Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4983B2D05
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 12:55:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2082D6EB5F;
	Thu, 24 Jun 2021 10:55:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C5DC6EB60
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 10:55:30 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id h1so2763667plt.1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 03:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hriaztl5QKv2WOAvCmMVPEwAJVtjiW9iYPTLBEXStgo=;
 b=PDsAEsv+dfSRLQusPsoLYF8w7G6GnvRlHkrr1kzzx6as4Dh+x0U/zsW8d+GhiKFdsg
 FA2BBqPC5dprZVkpB5t5nsTliD/J2q5h8naaAS4RkKkgY5ukGDiE+mHZ/fjywOYmt7sp
 ZrJF+LxGucZtg7eBi8oNwcPwnRMsbOh9cKajE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hriaztl5QKv2WOAvCmMVPEwAJVtjiW9iYPTLBEXStgo=;
 b=VqZ2E1pyyXpH1R+9XNXXGxrSx5OwKRJogPzym+AUK9RNMjhEZ+tTJpkmPfwYDs5rL+
 zLwCnYLB98H1mDBdyqAhHiltHtzGeCJ6f1kyWmtQ47Bt0w9tggElstag03Fu9S0QTXa3
 ywiEpP4TubetijAbITfsKwZiUTeWU+lhc0HZOShHvmX9Zdo02uGvOvWoZEe9VGmQkzr5
 8hjXw4lBmPhzltqFqMV5VexOnKTjUPUFJsiLOtCLMGTvQWp90O+M+6TxYA7da9jEypkF
 sipwB+YLaP+YjFfoKfXY9vUq1+mi0SoncfcLQCPTH6uAIb9WFG1efOx2AhmiS9OqwtGH
 W63Q==
X-Gm-Message-State: AOAM530pfb5lCfkCCDqi2REDZqGLLFZ7lPExOKqu5ztnFRg8lIRUhMPp
 rD9S5uj394Uk+U8/QbsoPyp6GwwU9Sgt7Q==
X-Google-Smtp-Source: ABdhPJwIDZVYWX3JX8E878WehoIk0M5IUEfQqdozGEiAiaCvO86PR75GYv750m47mk4o7duo8cErKQ==
X-Received: by 2002:a17:90a:9a83:: with SMTP id
 e3mr15001900pjp.139.1624532130023; 
 Thu, 24 Jun 2021 03:55:30 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:368f:686c:969:1f38])
 by smtp.gmail.com with ESMTPSA id t7sm2212536pgh.52.2021.06.24.03.55.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 03:55:29 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: dri-devel@lists.freedesktop.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v6 RESEND 3/3] arm64: dts: mt8183: Add panel rotation
Date: Thu, 24 Jun 2021 18:55:17 +0800
Message-Id: <20210624105517.3886963-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
In-Reply-To: <20210624105517.3886963-1-hsinyi@chromium.org>
References: <20210624105517.3886963-1-hsinyi@chromium.org>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

krane, kakadu, and kodama boards have a default panel rotation.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index ff56bcfa33703..793cc95013379 100644
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
2.32.0.288.g62a8d224e6-goog

