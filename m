Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A003469399
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 11:25:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2842F7A3E5;
	Mon,  6 Dec 2021 10:20:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D68E6E9C7
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Dec 2021 14:37:35 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id b40so13728059lfv.10
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Dec 2021 06:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TqYniy4pFRsXD92ySrc+ZxB/2v4IriL3y3/YUqS2PUE=;
 b=RNaLxgDCs6qXg/TwLlIXZzcLh4LJees5fE8xDEIukdb/OT7zBkOn507I9wRfW4w4xa
 niemSTpkq4n0nexvCghsEPDaa2xSzvEpS/WsEmx4EV03PZVyKUZtZlS7Cti2Kn+4gMYF
 J708JdarR4uxOSBnidMRRSiy2W6zsI1gXcaV3YFCIDJElDuSQASMDSwzTEERDBY6z/GJ
 Tu5cJSkY8ZKkzpgGoDlyMSgeZiQ9HNZLslB40hhiwbDCqsRMTPi2uMzO0H3DlBuUQz5i
 izOVMOtEV1I3PCwg+dtNL+UPSlH1eXaeVBZ7mKfa2tjeCrhdqFWl6mFiJFpGYAtZigR4
 SdmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TqYniy4pFRsXD92ySrc+ZxB/2v4IriL3y3/YUqS2PUE=;
 b=CcCyPKKeg0DaW+hz0/HF8ES4w+kCApGWUZem6FOUKmKTZdzcmDM1JY3IAFDfU/13px
 akoTjKzi0dPYsSqJ0kkcOLFCNYqmvOMxe/yMUB4WFUHNd/JLufV53xNcv2MUBoBOA1nn
 s9IQ1a+byO1G/HTZ09jOgoawj1Lfgy30KM63bghwLjabRENtwi+ZBV6fyZ9RR/Fg+Nb8
 ytJY3KvNADzJmwRVBL8kHDaXPphr2VSiWq2vHhBtoiPCFwo+zh54k4gnMnmqu9Y28kTB
 0N2U5dmTkdFTMoGJsC+w55XfWR7jGyydot9lkM4JNqpI0pMgbCUMomTHdVLnoN2ajc8x
 zu3g==
X-Gm-Message-State: AOAM532tGgpSO8J/fDmuCjUbOaspMZgKUjftC5djI4Ie/e83qvyKBzU7
 LJaWx7TbsKbyhw4rZvO7Yl4=
X-Google-Smtp-Source: ABdhPJxlNR6C8CFHLRo5rqVDCMsVLSUpmIzAdsrAsZFFI4Y2oRrvmEXZzQFyeVHAejMo+rAPaIrc5w==
X-Received: by 2002:ac2:518b:: with SMTP id u11mr24097394lfi.498.1638628653644; 
 Sat, 04 Dec 2021 06:37:33 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id g36sm782934lfv.16.2021.12.04.06.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 06:37:33 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>
Subject: [PATCH v4 03/22] ASoC: dt-bindings: tegra20-i2s: Document new nvidia,
 fixed-parent-rate property
Date: Sat,  4 Dec 2021 17:37:06 +0300
Message-Id: <20211204143725.31646-4-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211204143725.31646-1-digetx@gmail.com>
References: <20211204143725.31646-1-digetx@gmail.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document new nvidia,fixed-parent-rate property which instructs that this
board wants parent clock to stay at a fixed rate. It allows to prevent
conflicts between audio components that share same parent PLL. For
instance, this property allows to have HDMI audio, speaker and headphones
in the system playing audio simultaneously, which is a common pattern for
consumer devices.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../devicetree/bindings/sound/nvidia,tegra20-i2s.yaml      | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml
index ad43b237d9af..68ae124eaf80 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml
@@ -42,6 +42,13 @@ properties:
       - const: rx
       - const: tx
 
+  nvidia,fixed-parent-rate:
+    description: |
+      Specifies whether board prefers parent clock to stay at a fixed rate.
+      This allows multiple Tegra20 audio components work simultaneously by
+      limiting number of supportable audio rates.
+    type: boolean
+
 required:
   - compatible
   - reg
-- 
2.33.1

