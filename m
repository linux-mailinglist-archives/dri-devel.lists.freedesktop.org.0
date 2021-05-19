Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C50389801
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 22:36:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E788F6EE8C;
	Wed, 19 May 2021 20:35:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9BBD6EE8C
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 20:35:56 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id j14so13620438wrq.5
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 13:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E86M8ZFI17SPZdRhP/Hegi7pved0ocDQoAlWZoCG2K0=;
 b=QvEVTtHHUyx0bus4QZnTQbK6l5ZunpAU30ioE38p3xjfvwrl/4ofHoI7UB3WBmWvj2
 k959cr675azEQL9Aa9k/XAIpRn0njMB7PSWT4z0syjZwtWHR9di1Cl5oWREewtR3tTrF
 vFyN31nhYaiY9shGObcrUDhn0B5vQmv5ddGkc0zRuViXR4HBs9uRgURVPXIlbrg+weZV
 3HRsjYWt+tEF9O73j2Px7KkgSBzD8xkiuKbAQ5tHnOL8QXphLFiGjn3UVpoXL4iALbTN
 vPXc25NmPH75+BeA250crVSGBFhJ8DdTfLSsWCB5f0sem44Tky8zMlbvG1wlMHnLz9pz
 tbOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E86M8ZFI17SPZdRhP/Hegi7pved0ocDQoAlWZoCG2K0=;
 b=pgHuRAOad97xmLn1jNlCokPsWhPSz0dNOajqZ1STGStgPNvpUxj0KW0/rnntWqH9UF
 9y+SIqLW2bNWa3GtQ3mDC8szRw6HigFiJl1YOdS3QCz45bBYS0xIQVnMsFYpqfDuHbwR
 It3+J+5iH7UgLpx6FUY23jX3q+9fZcjVczDUu09E8zW5ctwX1HyTx2oVoZwaJZhqDGcA
 LNn+ERDoVdi3duWgVCc8MJj8X/+KaeYh7Bwq9AQmJdCw5DVv5qWnRw9fTxx8BZyJ90N5
 mtqNmu6Zu/3Ld4b7CWzcAUo6a3Ebx0KCKso/DKyYAFYb/V6nxOJoK39nAtd3pldmuB2t
 uzDw==
X-Gm-Message-State: AOAM533NY3gjneOQXuyZZFK9Sy46RvRxEKSL+x1mO98gXxgcrAhBXtOT
 GQSGlQ5lPvY+4V9sZoRASaKMdg==
X-Google-Smtp-Source: ABdhPJwW3NvOpKEXYZiI5P5aVY4plqkdy1YIWQBgyz37GWNhM4ckyeMYB/gc2E10kBgaPi7Ca7ZGmw==
X-Received: by 2002:a5d:5989:: with SMTP id n9mr778417wri.60.1621456555641;
 Wed, 19 May 2021 13:35:55 -0700 (PDT)
Received: from localhost.localdomain
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id y20sm7531918wmi.0.2021.05.19.13.35.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 13:35:55 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
To: airlied@linux.ie, daniel@ffwll.ch, linus.walleij@linaro.org,
 robh+dt@kernel.org, ulli.kroll@googlemail.com
Subject: [PATCH v2 3/3] ARM: dts: gemini: remove xxx-cells from display
Date: Wed, 19 May 2021 20:35:47 +0000
Message-Id: <20210519203547.837237-3-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519203547.837237-1-clabbe@baylibre.com>
References: <20210519203547.837237-1-clabbe@baylibre.com>
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
Cc: devicetree@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dtb_check complains about #address-cells and #size-cells, so lets
remove them.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 arch/arm/boot/dts/gemini.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/gemini.dtsi b/arch/arm/boot/dts/gemini.dtsi
index fa708f5d0c72..34961e5bc7b2 100644
--- a/arch/arm/boot/dts/gemini.dtsi
+++ b/arch/arm/boot/dts/gemini.dtsi
@@ -417,8 +417,6 @@ display-controller@6a000000 {
 			clock-names = "PCLK", "TVE";
 			pinctrl-names = "default";
 			pinctrl-0 = <&tvc_default_pins>;
-			#address-cells = <1>;
-			#size-cells = <0>;
 			status = "disabled";
 		};
 
-- 
2.26.3

