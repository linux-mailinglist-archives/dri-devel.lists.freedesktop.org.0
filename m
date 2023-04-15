Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDFC6E30D0
	for <lists+dri-devel@lfdr.de>; Sat, 15 Apr 2023 12:47:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4839F10E0AA;
	Sat, 15 Apr 2023 10:47:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A9D810E0AA
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Apr 2023 10:47:05 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id jg21so51519658ejc.2
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Apr 2023 03:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681555623; x=1684147623;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ICwYyWWnryvHm9RgRWeq29kRBlsUBNW7tslN8BXiwmU=;
 b=BQaKk6QpiVmZPeB/smhkVOuNZTbb+v8ly+PlkeCAAUt25cyNgPCVm9EHDY1zU5H9ZJ
 GVarHQ5Bc6ZcGPe6Bwfk8vERzbJADby9E/E4YAXf9GrGff/klt/bFP/Lm3NC4VKujCGF
 vHOa1yCSPHf70VHMBwULihW2kIzTwHzKKADr3KbFPA53nKl5Xb6wT9FbFoZv8LTZ/mH5
 hTjRz4qA8W12+1+3cOV2vzKvjJMUW0G5cSRcoXl0bdyEgPAPNH3nS2aL9/6bZcLTxOI3
 hPzl/BZxx9dUBa0lM+AOa+Ts1Dh7s6E2VR25Q7p8TuWCo5L7ZgLE4cxSLqulgNyQgrIz
 MzVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681555623; x=1684147623;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ICwYyWWnryvHm9RgRWeq29kRBlsUBNW7tslN8BXiwmU=;
 b=JkmIOyrR3mWB+flDzAfMfqWbq5a/kGoBxNccTv5LGWGFpFJxzgsVdt3a/EDUZ0R6SM
 u9ihW7S9B2SbujO5ySYg2bRi8p4lSXLNS9mk4OrEH83PTga8MfPiEa4Y1bbEmL6CtIPU
 G7wCz5SngaKX/KWRyV35JNynLqD0qI8a456+hI9mjdjnHqik64qKImFYe/GStmE42/Cg
 UdON2HnjKcte40qcmkY/bGwVsUsEO+Swq2FgIdstUvDAEimOanmQ7VdEOLozTSpld8ZF
 o0NtiglaWL6ArOzsuk8l0LDvfZSl62UAEqGemKmTKHfPuZi9jRDbltfv7mPQ/IuZY4hY
 IITA==
X-Gm-Message-State: AAQBX9djMd6UhmrY/5UyICYZ5YtelJeSZJ0eQJatPC9WBQFKd730KUUo
 8N4BQFcjGjy4UAWpXC/dHGM=
X-Google-Smtp-Source: AKy350ZlZmmQo025rfm2e2tAa9xyZl6HKwCyENZ72HZZ0DvAjQTuASLgS7n6KD8a24YZf10jRtRI2A==
X-Received: by 2002:a17:907:2087:b0:94e:fe0f:b2be with SMTP id
 pv7-20020a170907208700b0094efe0fb2bemr1577373ejb.14.1681555622742; 
 Sat, 15 Apr 2023 03:47:02 -0700 (PDT)
Received: from localhost.localdomain (82-149-1-233.dynamic.telemach.net.
 [82.149.1.233]) by smtp.gmail.com with ESMTPSA id
 m15-20020a170906720f00b00947ab65d932sm3607034ejk.83.2023.04.15.03.47.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Apr 2023 03:47:02 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, wens@csie.org,
 samuel@sholland.org
Subject: [PATCH 0/3] drm/bridge: dw_hdmi: allow to disable CEC from DT
Date: Sat, 15 Apr 2023 12:46:10 +0200
Message-Id: <20230415104613.61224-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.40.0
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 jonas@kwiboo.se, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent.pinchart@ideasonboard.com, hverkuil-cisco@xs4all.nl,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Boards can have perfectly working DW HDMI CEC implementation but they
may prefer to use bit banged implementation instead. This is the
situation on Beelink X2.

Add DW HDMI DT property for disabling CEC. This prevents confusion on
userspace side by not exposing unused CEC interface.

Best regards,
Jernej

Jernej Skrabec (3):
  dt-bindings: display: synopsys,dw-hdmi: Add property for disabling CEC
  drm/bridge: dw_hdmi: Handle snps,disable-cec property
  ARM: dts: sun8i: h3: beelink-x2: Disable DW-HDMI CEC

 .../devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml | 5 +++++
 arch/arm/boot/dts/sun8i-h3-beelink-x2.dts                    | 1 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c                    | 4 +++-
 3 files changed, 9 insertions(+), 1 deletion(-)

-- 
2.40.0

