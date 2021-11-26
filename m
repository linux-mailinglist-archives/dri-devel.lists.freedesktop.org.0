Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2AA45F1A1
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 17:19:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B0AD6F901;
	Fri, 26 Nov 2021 16:19:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 443CC6F8FE
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 16:19:44 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id m27so25435751lfj.12
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 08:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jZtmNInV251GqgFq3K9ZRWdCyBV26EPK8i39JKkeuGY=;
 b=kHcqo3Hdoj+Nqd8Ud4iK9R/J/uH0C/whKTjYqjDf/tc4gbFtOi20b+X0fwScJI3XgE
 w1uJD3Kn/ZPx+GJe5Ni17mAKfxobdslbSTtHt9ZgYI7mD54nlnN3Xn5N+OUh5jS86tqH
 1R29ze3ftawnZjR8t+tOedRBH7Bgl4wPJiRGm1oiD0WronEIfoQAoQDfPmZ5oHkhjxTJ
 BM1grZQI4H8T34r+xH4xnqdbWnR099DKjL3t/aqmVQsRFZUBTcRk7nnb1dIOjN05Eqcz
 kFQmwBFUjNiHiZkWrHOc6vH2BJTE8t+Lw8shx9I+HJWQloEOtGR+Xt3SvRqzQmbJt0G/
 z45Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jZtmNInV251GqgFq3K9ZRWdCyBV26EPK8i39JKkeuGY=;
 b=1ozK1xztSYd4G483icak9AfGCLpwtvDQbsBFh4Urtvwr1fbtphNZDUQ87G6WtyB/8G
 yiIDgURKue0bIOH+RCQmIWiu2TM2s/fsz44/sQ9Cg/v2Ku4MELiB36aRwSrf43vhEFw2
 VQdY0ENWOCkK7Pt1nLgiy5+4VW97xMDJBI8w6nevJzRnbnAvPcx+wsRNNyLWTT15MR9X
 J30qXkkBHCoxy50/pxMpOvQDSk8LnjJ3+GO26bG6KigzkpMDxhb9WqvugLGPtWVOMFnU
 HFvlyfq9tfQFvRtTVkZWqwWMm0qAr/EHAyIdM2z8fKIPVdeUoOYf6MK4PrD/X+CN2h50
 lS/A==
X-Gm-Message-State: AOAM531DPiXwILseq+8Ijxe7gIUkOW5zxa86oh2qfjFGwdTqXVT9j5B3
 R+hOl6zZynJHCoQ8V0n2lsw=
X-Google-Smtp-Source: ABdhPJyu83chU0nnqPvnIxvSELamyDC2FkUBRpE0GuXjevFykLKZzCD2MrUwMLgf0AfqXE32YyaF5A==
X-Received: by 2002:a05:6512:2212:: with SMTP id
 h18mr32046721lfu.55.1637943582592; 
 Fri, 26 Nov 2021 08:19:42 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id t7sm613381lfl.260.2021.11.26.08.19.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 08:19:42 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 04/20] dt-bindings: host1x: Document optional HDMI
 sound-dai-cells
Date: Fri, 26 Nov 2021 19:17:51 +0300
Message-Id: <20211126161807.15776-5-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211126161807.15776-1-digetx@gmail.com>
References: <20211126161807.15776-1-digetx@gmail.com>
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
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document new optional sound-dai-cells property of HDMI node. This node will
be used as endpoint of HDMI sound DAI graph.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt  | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
index e61999ce54e9..27b746f28f31 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
@@ -297,6 +297,7 @@ of the following host1x client modules:
   - nvidia,edid: supplies a binary EDID blob
   - nvidia,panel: phandle of a display panel
   - operating-points-v2: See ../bindings/opp/opp.txt for details.
+  - #sound-dai-cells: Should be 0.
 
 - tvo: TV encoder output
 
-- 
2.33.1

