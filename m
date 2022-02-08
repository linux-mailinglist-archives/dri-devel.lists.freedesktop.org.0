Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C754ADF2E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 18:19:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3983710E7FD;
	Tue,  8 Feb 2022 17:19:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89AEF10E7D4
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 17:19:14 +0000 (UTC)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1E9FB3FFDB
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 17:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644340752;
 bh=ljNZXcV6Ym7/PH8vFjEM0hkawYJJLcPyRUsIX2ztPxc=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=MnenrchCcxbLqRXNFVnXEZWrQFjXNDWsAnL6fDhWQwsDq5xhJ1xfBVYZrF+M+ILbe
 D/zcwNuiJwNb2GigcGJ+tSIzvk/Kf0sNhjchrTu6oLe9DHlaqzP8FNi8z5D1CGTyZP
 KJZj8XSM25br/gafWV8rEIx+I6+Det9UJpfpOC31IF/MQGW2h7AAu82dgv0OukQQWQ
 mCcjUUdFziRn2jdxa0yN4rVXa7rXKgcJWBFYyPKvq11PZJVtsCNsPydiOF1ju1qOVm
 kmSVMfkA6e3Wnk19AMsQs43A/iXypgFjZeI1YNkJWErMJ3tdCwbPV/E29l0fnTtJFe
 5L7HMGWXdaDGA==
Received: by mail-ej1-f72.google.com with SMTP id
 v2-20020a170906292200b006a94a27f903so6066148ejd.8
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 09:19:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ljNZXcV6Ym7/PH8vFjEM0hkawYJJLcPyRUsIX2ztPxc=;
 b=n44zPFG3QW6Y8hmfcTH96BHu0LckRxsD+QBlP3MwR76x58wr9gdznrVRdnBLQKGWPq
 wI2JQtowLFMpt/e9CTcudEirMA8SUXna9Cvnavl170PAuFg2hQIeqOwtuTZtg5BHYO08
 RczV7ralbkQo6gP93nkotE4BNMp78gJ+xCGSrBa9pgMiuFxzdcYqxK4+vOgKmJ89HG8t
 PDh9j26Fh5WcBAD2bBxIC5er0Rii+gAwWes7o5RLlkz7EBqX54QeEH0H1sRP5WnNfTv2
 PmCwCVccPsFAoe3OENbRdyZXp2HUjKUEkjMJMuKUoi3rn+IqWyBLU/P/67yZWL9bWdxv
 e2rA==
X-Gm-Message-State: AOAM531I7oYXGVSeyvoiSA/oZFJX7efDHUxiRZ8tuOGOu6vyb5AkJxUp
 wKD3moxW9Oja6aTwb86c5SEFsO26Z6bn6G76cImFT8gyrDN4jHe6Jnt9mMlJ+wPrpEwfJ1Ptg67
 31Qj2EXqCmgWbqivVLKrjtgcWR9gzd/hOYCFzEc4yKKuWHQ==
X-Received: by 2002:a50:fb94:: with SMTP id e20mr5723260edq.292.1644340751869; 
 Tue, 08 Feb 2022 09:19:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzFtmSCjrFuZnV5QFldxP4RqEiUiHOeP0ej5h/rJ0gsHHDMvXDxxIkOQXiY9qgzDn7rJ1eDKQ==
X-Received: by 2002:a50:fb94:: with SMTP id e20mr5723234edq.292.1644340751717; 
 Tue, 08 Feb 2022 09:19:11 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id r10sm5125550ejy.148.2022.02.08.09.19.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 09:19:11 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH 01/10] ARM: dts: exynos: add missing HDMI supplies on SMDK5250
Date: Tue,  8 Feb 2022 18:18:14 +0100
Message-Id: <20220208171823.226211-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220208171823.226211-1-krzysztof.kozlowski@canonical.com>
References: <20220208171823.226211-1-krzysztof.kozlowski@canonical.com>
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
Cc: Sylwester Nawrocki <snawrocki@kernel.org>, stable@vger.kernel.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add required VDD supplies to HDMI block on SMDK5250.  Without them, the
HDMI driver won't probe.  Because of lack of schematics, use same
supplies as on Arndale 5250 board (voltage matches).

Cc: <stable@vger.kernel.org> # v3.15+
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/exynos5250-smdk5250.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index 65d2474f83eb..21fbbf3d8684 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -118,6 +118,9 @@ &hdmi {
 	status = "okay";
 	ddc = <&i2c_2>;
 	hpd-gpios = <&gpx3 7 GPIO_ACTIVE_HIGH>;
+	vdd-supply = <&ldo8_reg>;
+	vdd_osc-supply = <&ldo10_reg>;
+	vdd_pll-supply = <&ldo8_reg>;
 };
 
 &i2c_0 {
-- 
2.32.0

