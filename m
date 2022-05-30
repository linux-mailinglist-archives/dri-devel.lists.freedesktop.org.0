Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 156F05379E6
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 13:30:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDDFF10E59A;
	Mon, 30 May 2022 11:30:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14BFC10E5A5
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 11:30:43 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 pq9-20020a17090b3d8900b001df622bf81dso10467915pjb.3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 04:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0FDANzoD+ved+kLqkfGfvHR/pdrWdYCkcffUnS1gfwU=;
 b=Fu3f0elDLJOB2qbC/WiNHHrnzhkyIj+M6hmuWqiHDK3vOkYLQvzCSrr7LVh4m3XTYw
 zHYE0cnTsfWTDpSMBzpspezMLKffVInpKtx6Q6xL1bYNG/62ysHWflZJ8iUZZwz2DmLa
 LESrtBQuLJ1bR/V4bpVZuA5UHrSfe0QY1yOHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0FDANzoD+ved+kLqkfGfvHR/pdrWdYCkcffUnS1gfwU=;
 b=8HiuXnX8/DUv1cnybQswotSnYwLktvJ4UwEqPJHDabtmlzNkTkjwW+0VvS8ZALcPfg
 clDMc/XMTQ858SBRkFz8Y+vI2U3OxL6LpKU1NvOzFcfAn/lm71+MrqiNXiozyG6FMWvh
 5aB3vj7XHY6DpzMIgOhxIaN7AN0IeeAA7J6QMTqFw4Nd8O8hBf+Kvp1ImWquMiQckJKP
 g4bv8hrFOLTgM1RyBS+KkyteiLRXT//+XZOFftJ6biB2xAvjO7uFGzWFnoUR31fqiw4m
 m0kntP3taD0mYkjeW4uGvAf3epJ/HZO0ioWogtMr7SHgnwyqKsQyzdzUaVuqeM1zdI6u
 D2mw==
X-Gm-Message-State: AOAM5315KYmW8gD+6jtbbThxqTCRuUPwMI30bsRRssRumum0InWvX4ct
 JLRem8AHMCeZX2DD1uwhreATWg==
X-Google-Smtp-Source: ABdhPJxub7eHxeB4mlpr+M6AT+c0bGpa7kjAzy63YjDOWYW87ck7sC0r1LTX1UfyD0/ZFy7H+5i/oQ==
X-Received: by 2002:a17:903:1c1:b0:163:ef7b:e11a with SMTP id
 e1-20020a17090301c100b00163ef7be11amr2002458plh.76.1653910242646; 
 Mon, 30 May 2022 04:30:42 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:ae1c:3d63:abec:1097])
 by smtp.gmail.com with ESMTPSA id
 o3-20020a654583000000b003fa5b550303sm8384222pgq.68.2022.05.30.04.30.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 04:30:42 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH 2/2] arm64: dts: mt8183: Add panel rotation
Date: Mon, 30 May 2022 19:30:33 +0800
Message-Id: <20220530113033.124072-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
In-Reply-To: <20220530113033.124072-1-hsinyi@chromium.org>
References: <20220530113033.124072-1-hsinyi@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Hans de Goede <hdegoede@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
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
index 8d5bf73a9099..f0dd5a06629d 100644
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
2.36.1.124.g0e6072fb45-goog

